whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
insert into imart_tx_kpi_backup
select id,page_id,plug_source from apex_260100.wwv_flow_page_plugs p where flow_id=105 and page_id in(68,145,142,151) and plug_source_type='NATIVE_IR' and not exists(select 1 from imart_tx_kpi_backup b where b.id=p.id);
insert into imart_tx_kpi_config(page_id,region_id,region_label,source_sql)
select p.page_id,p.id,p.plug_name,b.plug_source from apex_260100.wwv_flow_page_plugs p join imart_tx_kpi_backup b on b.id=p.id where p.flow_id=105 and p.page_id in(68,145,142,151) and p.plug_source_type='NATIVE_IR' and not exists(select 1 from imart_tx_kpi_config c where c.page_id=p.page_id);
-- Gate-in uses the same GRN link/status as the existing gate-in view; no invented quantity conversion.
update imart_tx_kpi_config set classifier_sql=q'~
select tno,0 approval,
 case when pending>0 and progressed=0 then 1 else 0 end pending,
 case when pending>0 and progressed>0 then 1 else 0 end partial,
 case when pending=0 and progressed>0 then 1 else 0 end done,
 0 overdue,0 missing_due,0 review
from(select a.tno,
 max(case when a.grnstatus='PENDING' then 1 else 0 end) pending,
 max(case when a.grnstatus='PREPARED' then 1 else 0 end) progressed
 from gateinregister_view a where nvl(getdocumentstatuscode('MATERIALIN',a.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED') group by a.tno)
~',scope_note='Distinct gate-in documents in current register filters and access scope. GRN Pending/Created uses the existing gate-in view linkage. Partial means a document has both linked and unlinked gate-in lines, not a sum across units. Report search/saved filters are additional.' where page_id=68;
-- GRN billing progresses by actual GRN-line links used by the existing Pending Purchase Bill report.
update imart_tx_kpi_config set classifier_sql=q'~
select tno,
 case when getdocumentstatuscode('GRN',tno) in('PREPARING','PREPARED') then 1 else 0 end approval,
 case when unbilled>0 and billed=0 then 1 else 0 end pending,
 case when unbilled>0 and billed>0 then 1 else 0 end partial,
 case when unbilled=0 and billed>0 then 1 else 0 end done,
 0 overdue,0 missing_due,
 case when getdinspectionno(tno) is null then 1 else 0 end review
from(select d.tno,
 max(case when b.grntno is null then 1 else 0 end) unbilled,
 max(case when b.grntno is not null then 1 else 0 end) billed
 from grndetail d left join (
 select distinct x.grntno,x.grnsno from purchasebillgrndetail x join purchasebill p on p.tno=x.tno
 where nvl(getdocumentstatuscode('PURCHASEBILL',p.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED')
 ) b on b.grntno=d.tno and b.grnsno=d.sno
 where nvl(getdocumentstatuscode('GRN',d.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED') group by d.tno)
~',scope_note='Distinct GRNs in current filters/access scope. Billing states use actual PurchaseBillGRNDetail links per GRN line, following the Pending Purchase Bill report. Partially Billed means some lines linked and some unlinked; it does not infer partial approval from amounts. Inspection Not Created uses the existing inspection-number function. Report search/saved filters are additional.' where page_id=145;
update imart_tx_kpi_config set classifier_sql=q'~
select p.tno,
 case when getdocumentstatuscode('PURCHASEBILL',p.tno) in('PREPARING','PREPARED') then 1 else 0 end approval,
 case when b.purchasebilltno is null then 1 else 0 end pending,
 0 partial,case when b.purchasebilltno is not null then 1 else 0 end done,
 0 overdue,0 missing_due,0 review
from purchasebill p left join(
 select distinct purchasebilltno from pbpass where nvl(getdocumentstatuscode('PBPASS',tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED')
) b on b.purchasebilltno=p.tno
where nvl(getdocumentstatuscode('PURCHASEBILL',p.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED')
~',scope_note='Distinct bills in current filters/access scope. Bill Pass Pending/Created uses the actual PurchaseBillTNO link to a non-cancelled bill pass. Quantity reductions for quality are not treated as partial bill passing. Report search/saved filters are additional.' where page_id=142;
-- Supplier credit allocations follow the existing Creditor 360 open-item formula, read-only.
update imart_tx_kpi_config set classifier_sql=q'~
with alc as(
 select a.crvouchertno tno,a.crvouchersno sno,sum(a.amount) amt
 from drcrallocation a join voucher dv on dv.tno=a.drvouchertno join voucher cv on cv.tno=a.crvouchertno
 where dv.voucherdate<trunc(sysdate)+1 and cv.voucherdate<trunc(sysdate)+1 group by a.crvouchertno,a.crvouchersno
 union all
 select a.drvouchertno,a.drvouchersno,-sum(a.amount)
 from drcrallocation a join voucher dv on dv.tno=a.drvouchertno join voucher cv on cv.tno=a.crvouchertno
 where dv.voucherdate<trunc(sysdate)+1 and cv.voucherdate<trunc(sysdate)+1 group by a.drvouchertno,a.drvouchersno
), al as(select tno,sno,sum(amt) amt from alc group by tno,sno),
due as(
 select pp.tno,coalesce(max(pp.duedate),max(pb.purchasebilldate)+coalesce(max(po.creditdays),max(pty.creditdays))) duedt
 from pbpass pp join purchasebill pb on pb.tno=pp.purchasebilltno
 left join purchasebilldetail bd on bd.tno=pb.tno left join purchaseorder po on po.tno=bd.purchaseordertno
 left join party pty on pty.partycode=pb.partycode group by pp.tno
), balance as(
 select p.tno,count(d.sno) supplier_lines,
 max(case when round(d.amount-nvl(al.amt,0),2)>.005 then 1 else 0 end) outstanding,
 max(case when nvl(al.amt,0)>.005 then 1 else 0 end) allocated
 from pbpass p join purchasebill b on b.tno=p.purchasebilltno
 left join voucher v on v.modulecode='PBPASS' and v.moduletno=p.tno and v.voucherdate<trunc(sysdate)+1
 left join voucherdetail d on d.tno=v.tno and d.accountcode=b.partycode and d.amount>0
 left join al on al.tno=d.tno and al.sno=d.sno group by p.tno
)
select p.tno,
 case when nvl(b.supplier_lines,0)=0 then 1 else 0 end approval,
 case when b.outstanding>0 and b.allocated=0 then 1 else 0 end pending,
 case when b.outstanding>0 and b.allocated>0 then 1 else 0 end partial,
 case when b.supplier_lines>0 and b.outstanding=0 then 1 else 0 end done,
 case when b.outstanding>0 and trunc(d.duedt)<trunc(sysdate) then 1 else 0 end overdue,
 case when b.outstanding>0 and d.duedt is null then 1 else 0 end missing_due,0 review
from pbpass p left join balance b on b.tno=p.tno left join due d on d.tno=p.tno
where nvl(getdocumentstatuscode('PBPASS',p.tno),'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED')
~',scope_note='Distinct bill passes in current filters/access scope. Settlement uses supplier credit voucher lines minus DrCrAllocation, excluding future-dated vouchers/allocations, as in the existing creditor open-item report. Overdue applies only to outstanding balances: explicit Bill Pass Due Date first, otherwise Purchase Bill Date + PO/party credit days. No assumed due date. Settlement includes allocations/adjustments, not only cash payment. Report search/saved filters are additional.' where page_id=151;
delete from imart_tx_kpi_cards where page_id in(68,145,142,151);
insert into imart_tx_kpi_cards values(68,0,'ALL','Total','Gate-in documents in this scope');
insert into imart_tx_kpi_cards values(68,1,'PENDING','GRN Pending','No GRN linked to gate-in lines');
insert into imart_tx_kpi_cards values(68,2,'PARTIAL','Partially Linked','Some gate-in lines await GRN');
insert into imart_tx_kpi_cards values(68,3,'DONE','GRN Created','Gate-in lines linked to GRN');
insert into imart_tx_kpi_cards values(145,0,'ALL','Total','GRN documents in this scope');
insert into imart_tx_kpi_cards values(145,1,'APPROVAL','Approval Pending','Preparing / prepared GRNs');
insert into imart_tx_kpi_cards values(145,2,'REVIEW','Inspection Not Created','No linked inspection number');
insert into imart_tx_kpi_cards values(145,3,'PENDING','Bill Not Created','GRN lines not linked to a bill');
insert into imart_tx_kpi_cards values(145,4,'PARTIAL','Partially Billed','Some GRN lines await a bill');
insert into imart_tx_kpi_cards values(145,5,'DONE','Bill Created','All GRN lines linked to bills');
insert into imart_tx_kpi_cards values(142,0,'ALL','Total','Bill documents in this scope');
insert into imart_tx_kpi_cards values(142,1,'APPROVAL','Approval Pending','Preparing / prepared bills');
insert into imart_tx_kpi_cards values(142,2,'PENDING','Bill Pass Pending','No valid bill pass linked');
insert into imart_tx_kpi_cards values(142,3,'DONE','Bill Pass Created','Valid bill pass linked');
insert into imart_tx_kpi_cards values(151,0,'ALL','Total','Bill-pass documents in this scope');
insert into imart_tx_kpi_cards values(151,1,'APPROVAL','Posting Needs Review','No posted supplier credit line');
insert into imart_tx_kpi_cards values(151,2,'PENDING','Settlement Pending','Outstanding, no allocation yet');
insert into imart_tx_kpi_cards values(151,3,'PARTIAL','Partially Settled','Allocated but balance remains');
insert into imart_tx_kpi_cards values(151,4,'DONE','Fully Settled','Posted supplier balance cleared');
insert into imart_tx_kpi_cards values(151,5,'OVERDUE','Payment Overdue','Due date passed; balance remains');
insert into imart_tx_kpi_cards values(151,6,'MISSING_DUE','Due Date Missing','Outstanding without credit deadline');
commit;
exit
