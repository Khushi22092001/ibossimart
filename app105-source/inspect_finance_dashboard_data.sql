whenever sqlerror exit failure rollback
set define off
set pagesize 300
set linesize 240
connect -name IMART

prompt === voucher module distribution ===
select nvl(modulecode,'(null)') modulecode, count(*) voucher_count,
       min(voucherdate) first_date, max(voucherdate) last_date
  from voucher
 group by modulecode
 order by voucher_count desc;

prompt === finance support row counts ===
select 'DRCRALLOCATION' object_name, count(*) row_count from drcrallocation union all
select 'INVOICE', count(*) from invoice union all
select 'SERVICEBILL', count(*) from servicebill union all
select 'ACCOUNTOPENING', count(*) from accountopening union all
select 'PURCHASEBILL', count(*) from purchasebill union all
select 'JOBBILL', count(*) from jobbill union all
select 'PAYMENTADVICE', count(*) from paymentadvice;

prompt === descendant ledger counts ===
select root_code, count(*) node_count,
       sum(case when exists (select 1 from party c where c.parentcode=x.partycode) then 0 else 1 end) leaf_count
  from (
        select 'SUNDRYDEBTORS' root_code, p.partycode
          from party p
         start with p.partycode='SUNDRYDEBTORS'
       connect by nocycle prior p.partycode=p.parentcode
        union all
        select 'SUNDRYCREDITORS', p.partycode
          from party p
         start with p.partycode='SUNDRYCREDITORS'
       connect by nocycle prior p.partycode=p.parentcode
       ) x
 group by root_code;

prompt === linked source modules under AR/AP ===
with ar as (
  select partycode from party start with partycode='SUNDRYDEBTORS' connect by nocycle prior partycode=parentcode
), ap as (
  select partycode from party start with partycode='SUNDRYCREDITORS' connect by nocycle prior partycode=parentcode
)
select scope_name, modulecode, count(*) lines, round(sum(amount),2) signed_amount
from (
 select 'AR' scope_name, nvl(v.modulecode,'(null)') modulecode, d.amount
 from voucherdetail d join voucher v on v.tno=d.tno where d.accountcode in (select partycode from ar)
 union all
 select 'AP', nvl(v.modulecode,'(null)'), d.amount
 from voucherdetail d join voucher v on v.tno=d.tno where d.accountcode in (select partycode from ap)
)
group by scope_name,modulecode
order by scope_name, lines desc;

exit
