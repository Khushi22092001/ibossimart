whenever sqlerror exit sql.sqlcode rollback
set pagesize 100 linesize 260 feedback on verify off

prompt === INDENT AMOUNT FORMULA VARIANTS ===
select count(*) total_rows,
       sum(case when abs(nvl(amount,0)-nvl(indentquantity1,0)*nvl(rate,0))>.01 then 1 else 0 end) bad_indent_qty,
       sum(case when abs(nvl(amount,0)-nvl(quantity1,0)*nvl(rate,0))>.01 then 1 else 0 end) bad_sanction_qty,
       sum(case when abs(nvl(amount,0)-nvl(indentquantity1,0)*nvl(rate,0))>.01
                 and abs(nvl(amount,0)-nvl(quantity1,0)*nvl(rate,0))<=.01 then 1 else 0 end) matches_sanction_only,
       sum(case when abs(nvl(amount,0)-nvl(indentquantity1,0)*nvl(rate,0))>.01
                 and abs(nvl(amount,0)-nvl(quantity1,0)*nvl(rate,0))>.01 then 1 else 0 end) matches_neither
from indentdetail;

prompt === GRN AMOUNT FORMULA VARIANTS ===
select count(*) total_rows,
       sum(case when abs(nvl(amount,0)-nvl(receivedquantity1,0)*nvl(rate,0))>.01 then 1 else 0 end) bad_received_qty,
       sum(case when abs(nvl(amount,0)-nvl(acceptedquantity1,0)*nvl(rate,0))>.01 then 1 else 0 end) bad_accepted_qty,
       sum(case when abs(nvl(amount,0)-nvl(receivedquantity1,0)*nvl(rate,0))>.01
                 and abs(nvl(amount,0)-nvl(acceptedquantity1,0)*nvl(rate,0))<=.01 then 1 else 0 end) matches_accepted_only,
       sum(case when abs(nvl(amount,0)-nvl(receivedquantity1,0)*nvl(rate,0))>.01
                 and abs(nvl(amount,0)-nvl(acceptedquantity1,0)*nvl(rate,0))>.01 then 1 else 0 end) matches_neither
from grndetail;

prompt === SAMPLE TRUE MISMATCHES (READ ONLY) ===
select * from (
  select 'INDENT' source,tno,sno,indentquantity1 qty_a,quantity1 qty_b,rate,amount,
         nvl(indentquantity1,0)*nvl(rate,0) expected_a,
         nvl(quantity1,0)*nvl(rate,0) expected_b
  from indentdetail
  where abs(nvl(amount,0)-nvl(indentquantity1,0)*nvl(rate,0))>.01
    and abs(nvl(amount,0)-nvl(quantity1,0)*nvl(rate,0))>.01
  order by tno desc,sno
) where rownum<=10;

select * from (
  select 'GRN' source,tno,sno,receivedquantity1 qty_a,acceptedquantity1 qty_b,rate,amount,
         nvl(receivedquantity1,0)*nvl(rate,0) expected_a,
         nvl(acceptedquantity1,0)*nvl(rate,0) expected_b
  from grndetail
  where abs(nvl(amount,0)-nvl(receivedquantity1,0)*nvl(rate,0))>.01
    and abs(nvl(amount,0)-nvl(acceptedquantity1,0)*nvl(rate,0))>.01
  order by tno desc,sno
) where rownum<=10;

exit
