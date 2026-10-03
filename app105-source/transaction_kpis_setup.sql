whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
begin execute immediate 'create table imart_tx_kpi_config(page_id number primary key,region_id number,region_label varchar2(255),source_sql clob,classifier_sql clob,scope_note varchar2(4000))';exception when others then if sqlcode<>-955 then raise;end if;end;
/
begin execute immediate 'create table imart_tx_kpi_cards(page_id number,seq number,code varchar2(30),label varchar2(100),note varchar2(255),primary key(page_id,code))';exception when others then if sqlcode<>-955 then raise;end if;end;
/
begin execute immediate 'create table imart_tx_kpi_backup as select id,page_id,plug_source from apex_260100.wwv_flow_page_plugs where flow_id=105 and page_id in(107,117) and plug_source_type=''NATIVE_IR''';exception when others then if sqlcode<>-955 then raise;end if;end;
/
insert into imart_tx_kpi_config(page_id,region_id,region_label,source_sql)
select p.page_id,p.id,p.plug_name,p.plug_source from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id in(107,117) and p.plug_source_type='NATIVE_IR' and not exists(select 1 from imart_tx_kpi_config c where c.page_id=p.page_id);
update imart_tx_kpi_config set classifier_sql=q'~
select tno,
 case when sanction_pending>0 then 1 else 0 end approval,
 case when pending>0 and progressed=0 then 1 else 0 end pending,
 case when pending>0 and progressed>0 then 1 else 0 end partial,
 case when eligible>0 and pending=0 and progressed>0 then 1 else 0 end done,
 0 overdue,0 missing_due,0 review
from (
 select d.tno,
 max(case when nvl(d.documentstatuscode,'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED') and nvl(d.indentquantity1,0)>nvl(d.quantity1,0)+.0005 then 1 else 0 end) sanction_pending,
 max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)>0 and nvl(d.quantity1,0)-nvl(d.orderedquantity1,0)>.0005 then 1 else 0 end) pending,
 max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)>0 and nvl(d.orderedquantity1,0)>.0005 then 1 else 0 end) progressed,
 max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)>0 then 1 else 0 end) eligible
 from indentdetail d group by d.tno
)
~',scope_note='Distinct documents in current register filters and access scope. Ordering uses existing sanctioned and ordered quantities maintained by PO/amendment triggers. Mixed pending/ordered lines count as partial. Sanction Pending means requested quantity remains unsanctioned. Indent overdue is withheld until its deadline anchor is confirmed. Report search/saved filters are additional.' where page_id=107;
update imart_tx_kpi_config set classifier_sql=q'~
select tno,
 case when status in('PREPARING','PREPARED','DEPTAPPROVED','STOREAPPROVED') then 1 else 0 end approval,
 case when status='ACTIVE' and pending>0 and progressed=0 then 1 else 0 end pending,
 case when status='ACTIVE' and pending>0 and progressed>0 then 1 else 0 end partial,
 case when status='ACTIVE' and pending=0 and unknown_qty=0 and eligible>0 and progressed>0 then 1 else 0 end done,
 case when status='ACTIVE' and pending>0 and trunc(deliverydate)<trunc(sysdate) then 1 else 0 end overdue,
 case when status='ACTIVE' and pending>0 and deliverydate is null then 1 else 0 end missing_due,
 case when status='ACTIVE' and unknown_qty>0 then 1 else 0 end review
from (
 select p.tno,p.deliverydate,getdocumentstatuscode('PURCHASEORDER',p.tno) status,
 max(case when l.pending_qty>.0005 then 1 else 0 end) pending,
 max(case when l.pending_qty is null then 1 else 0 end) unknown_qty,
 max(case when l.original_qty>0 then 1 else 0 end) eligible,
 max(case when exists(select 1 from grndetail g where g.purchaseordertno=p.tno and nvl(g.receivedquantity1,0)>0)
 or exists(select 1 from materialindetail m where m.purchaseordertno=p.tno and nvl(m.quantity1,0)>0 and not exists(select 1 from documentstatusdetail s where s.moduletno=m.tno and s.documentstatuscode in('CANCELED','CLOSED'))) then 1 else 0 end) progressed
 from purchaseorder p join (
 select d.tno,d.itemcode,d.itemspecificationcode,max(d.quantity1) original_qty,
 case when getdocumentstatuscode('PURCHASEORDER',d.tno)='ACTIVE' then getpendingpoquantity1(d.itemcode,d.itemspecificationcode,d.tno) end pending_qty
 from purchaseorderdetail d group by d.tno,d.itemcode,d.itemspecificationcode
 ) l on l.tno=p.tno group by p.tno,p.deliverydate
)
~',scope_note='Distinct documents within current register filters and access scope. Fulfilment uses the existing amendment/BOM-aware pending-PO function, including accepted GRN and gate-in quantities awaiting GRN. Overdue uses pending fulfilment and PO Delivery Date before today. Missing/unknown quantities are not marked complete. Report search/saved filters are additional.' where page_id=117;
delete from imart_tx_kpi_cards where page_id in(107,117);
insert into imart_tx_kpi_cards values(107,0,'ALL','Total','Documents in this scope');
insert into imart_tx_kpi_cards values(107,1,'APPROVAL','Sanction Pending','Requested quantity not fully sanctioned');
insert into imart_tx_kpi_cards values(107,2,'PENDING','PO Not Created','Sanctioned quantity, no allocated order qty');
insert into imart_tx_kpi_cards values(107,3,'PARTIAL','Partially Ordered','Some sanctioned quantity still to order');
insert into imart_tx_kpi_cards values(107,4,'DONE','Fully Ordered','Eligible sanctioned quantity covered');
insert into imart_tx_kpi_cards values(117,0,'ALL','Total','Documents in this scope');
insert into imart_tx_kpi_cards values(117,1,'APPROVAL','Approval Pending','Preparing / prepared / intermediate approval');
insert into imart_tx_kpi_cards values(117,2,'PENDING','Supply Not Started','Active PO with pending quantity');
insert into imart_tx_kpi_cards values(117,3,'PARTIAL','Partially Fulfilled','Receipt/gate-in started; quantity remains');
insert into imart_tx_kpi_cards values(117,4,'DONE','Supply Complete','No remaining native pending quantity');
insert into imart_tx_kpi_cards values(117,5,'OVERDUE','Delivery Overdue','Delivery date passed; supply pending');
insert into imart_tx_kpi_cards values(117,6,'MISSING_DUE','Due Date Missing','Pending supply without delivery date');
insert into imart_tx_kpi_cards values(117,7,'REVIEW','Quantity Needs Review','Native pending quantity unavailable');
commit;
exit
