whenever sqlerror exit sql.sqlcode rollback
set pagesize 300 linesize 280 feedback on verify off

prompt === STORED CALCULATION MISMATCH COUNTS ===
select 'INDENTDETAIL' source,
       count(*) total_rows,
       sum(case when abs(nvl(amount,0) - nvl(indentquantity1,0)*nvl(rate,0)) > .01 then 1 else 0 end) mismatch_rows
from indentdetail
union all
select 'GRNDETAIL',
       count(*),
       sum(case when abs(nvl(amount,0) - nvl(receivedquantity1,0)*nvl(rate,0)) > .01 then 1 else 0 end)
from grndetail
union all
select 'PAYMENTADVICEREFERENCE-AMOUNT',
       count(*),
       sum(case when abs(nvl(amount,0)-nvl(amountentered,0)) > .01 then 1 else 0 end)
from paymentadvicereference
union all
select 'PAYMENTADVICEREFERENCE-TDSBASE',
       count(*),
       sum(case when abs(nvl(tdsdeductableamount,0)-nvl(amountentered,0)) > .01 then 1 else 0 end)
from paymentadvicereference;

prompt === NULL / DUPLICATE DETAIL ROW KEYS ===
select source,total_rows,null_keys,duplicate_key_rows
from (
  select 'INDENTDETAIL' source,(select count(*) from indentdetail) total_rows,
         (select count(*) from indentdetail where tno is null or sno is null) null_keys,
         nvl((select sum(c) from (select count(*) c from indentdetail group by tno,sno having count(*)>1)),0) duplicate_key_rows
  from dual
  union all
  select 'PURCHASEORDERDETAIL',(select count(*) from purchaseorderdetail),(select count(*) from purchaseorderdetail where tno is null or sno is null),
         nvl((select sum(c) from (select count(*) c from purchaseorderdetail group by tno,sno having count(*)>1)),0)
  from dual
  union all
  select 'LOADINGADVICEDETAIL',(select count(*) from loadingadvicedetail),(select count(*) from loadingadvicedetail where tno is null or sno is null),
         nvl((select sum(c) from (select count(*) c from loadingadvicedetail group by tno,sno having count(*)>1)),0)
  from dual
  union all
  select 'MATERIALINDETAIL',(select count(*) from materialindetail),(select count(*) from materialindetail where tno is null or sno is null),
         nvl((select sum(c) from (select count(*) c from materialindetail group by tno,sno having count(*)>1)),0)
  from dual
  union all
  select 'GRNDETAIL',(select count(*) from grndetail),(select count(*) from grndetail where tno is null or sno is null),
         nvl((select sum(c) from (select count(*) c from grndetail group by tno,sno having count(*)>1)),0)
  from dual
  union all
  select 'PURCHASEBILLDETAIL',(select count(*) from purchasebilldetail),(select count(*) from purchasebilldetail where tno is null or sno is null),
         nvl((select sum(c) from (select count(*) c from purchasebilldetail group by tno,sno having count(*)>1)),0)
  from dual
  union all
  select 'PBPASSDETAIL',(select count(*) from pbpassdetail),(select count(*) from pbpassdetail where tno is null or sno is null),
         nvl((select sum(c) from (select count(*) c from pbpassdetail group by tno,sno having count(*)>1)),0)
  from dual
  union all
  select 'PAYMENTADVICEREFERENCE',(select count(*) from paymentadvicereference),(select count(*) from paymentadvicereference where tno is null or sno is null),
         nvl((select sum(c) from (select count(*) c from paymentadvicereference group by tno,sno having count(*)>1)),0)
  from dual
)
order by source;

prompt === RELEVANT ENQUIRY / COMPARATIVE DETAIL TABLE CANDIDATES ===
select table_name
from user_tables
where regexp_like(table_name,'(ENQUIRY|COMPARATIVE|^CS).*DETAIL|DETAIL.*(ENQUIRY|COMPARATIVE)')
order by table_name;

exit
