whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 240 feedback off verify off

select table_name,column_name,data_type
from user_tab_columns
where table_name in ('INDENT','GRN') and data_type='DATE'
order by table_name,column_id;

prompt === CURRENT FY MISMATCH COUNTS (FROM 01-APR-2026) ===
select 'INDENT' source,
       count(*) total_rows,
       sum(case when abs(nvl(d.amount,0)-nvl(d.indentquantity1,0)*nvl(d.rate,0))>.01 then 1 else 0 end) mismatch_rows
from indentdetail d join indent h on h.tno=d.tno
where h.indentdate>=date '2026-04-01'
union all
select 'GRN',
       count(*),
       sum(case when abs(nvl(d.amount,0)-nvl(d.receivedquantity1,0)*nvl(d.rate,0))>.01 then 1 else 0 end)
from grndetail d join grn h on h.tno=d.tno
where h.grndate>=date '2026-04-01';

prompt === CURRENT FY MISMATCH DATE RANGE ===
select 'INDENT' source,min(h.indentdate) first_date,max(h.indentdate) last_date,count(*) rows_count
from indentdetail d join indent h on h.tno=d.tno
where h.indentdate>=date '2026-04-01'
  and abs(nvl(d.amount,0)-nvl(d.indentquantity1,0)*nvl(d.rate,0))>.01
union all
select 'GRN',min(h.grndate),max(h.grndate),count(*)
from grndetail d join grn h on h.tno=d.tno
where h.grndate>=date '2026-04-01'
  and abs(nvl(d.amount,0)-nvl(d.receivedquantity1,0)*nvl(d.rate,0))>.01;

exit
