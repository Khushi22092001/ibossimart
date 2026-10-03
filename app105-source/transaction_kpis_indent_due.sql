whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
connect -name IMART
update imart_tx_kpi_config set classifier_sql=q'~
select d.tno,
 max(case when nvl(d.documentstatuscode,'NONACTIVE') not in('CANCELED','CANCELLED','CLOSED','SHORTCLOSED') and nvl(d.indentquantity1,0)>nvl(d.quantity1,0)+.0005 then 1 else 0 end) approval,
 case when max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)-nvl(d.orderedquantity1,0)>.0005 then 1 else 0 end)>0
 and max(case when d.documentstatuscode='ACTIVE' and nvl(d.orderedquantity1,0)>.0005 then 1 else 0 end)=0 then 1 else 0 end pending,
 case when max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)-nvl(d.orderedquantity1,0)>.0005 then 1 else 0 end)>0
 and max(case when d.documentstatuscode='ACTIVE' and nvl(d.orderedquantity1,0)>.0005 then 1 else 0 end)>0 then 1 else 0 end partial,
 case when max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)>0 then 1 else 0 end)>0
 and max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)-nvl(d.orderedquantity1,0)>.0005 then 1 else 0 end)=0
 and max(case when d.documentstatuscode='ACTIVE' and nvl(d.orderedquantity1,0)>.0005 then 1 else 0 end)>0 then 1 else 0 end done,
 max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)-nvl(d.orderedquantity1,0)>.0005
 and d.requirementtimeindays>=0 and trunc(a.approved_at)+d.requirementtimeindays<trunc(sysdate) then 1 else 0 end) overdue,
 max(case when d.documentstatuscode='ACTIVE' and nvl(d.quantity1,0)-nvl(d.orderedquantity1,0)>.0005
 and (a.approved_at is null or d.requirementtimeindays is null or d.requirementtimeindays<0) then 1 else 0 end) missing_due,
 0 review
from indentdetail d left join(
 select moduletno,max(statustime) approved_at from documentstatusdetail
 where modulecode='INDENT' and documentstatuscode='ACTIVE' group by moduletno
) a on a.moduletno=d.tno group by d.tno
~',scope_note='Distinct documents within current filters/access scope. Native sanctioned/ordered quantities determine pending and partial ordering. Overdue uses the recorded ACTIVE sanction/approval timestamp + requirement days per pending line, as confirmed by the user; no Indent Date or creation-date fallback. Missing approval timestamp/days are separate. Report search/saved filters are additional.' where page_id=107;
delete from imart_tx_kpi_cards where page_id=107 and code in('OVERDUE','MISSING_DUE');
insert into imart_tx_kpi_cards values(107,5,'OVERDUE','Ordering Overdue','Approval date + requirement days passed');
insert into imart_tx_kpi_cards values(107,6,'MISSING_DUE','Deadline Missing','Pending line lacks approval date / days');
commit;
exit
