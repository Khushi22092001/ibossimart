connect -name IMART
set pagesize 200 linesize 240 trimspool on feedback off verify off
prompt === QUOTATIONDETAIL CONSISTENCY ===
select count(*) total_rows,
       sum(case when nvl(qd.amount,0) <> round(nvl(qd.rate,0) * case when qd.ratemeasuringunitcode = i.measuringunitcode2 then nvl(qd.quantity2,0) else nvl(qd.quantity1,0) end,2) then 1 else 0 end) amount_mismatch,
       sum(case when nvl(qd.footeramount,0) <> nvl((select sum(f.footervalue) from quotationdetailfooter f where f.tno=qd.tno and f.sno=qd.sno),0) then 1 else 0 end) footer_mismatch,
       sum(case when nvl(qd.totalamount,0) <> nvl(qd.amount,0)+nvl(qd.footeramount,0) then 1 else 0 end) total_mismatch,
       sum(case when qd.rate is not null and qd.amount is null then 1 else 0 end) blank_amount_with_rate,
       sum(case when qd.amount is not null and qd.footeramount is null then 1 else 0 end) blank_footer_with_amount
from quotationdetail qd
left join item i on i.itemcode=qd.itemcode;

prompt === ORPHAN / DUPLICATE FOOTER ROWS ===
select
  (select count(*) from quotationdetailfooter f where not exists (select 1 from quotationdetail d where d.tno=f.tno and d.sno=f.sno)) orphan_footer_rows,
  (select count(*) from (select tno,sno,footerheadcode,count(*) c from quotationdetailfooter group by tno,sno,footerheadcode having count(*)>1)) duplicate_footer_groups
from dual;

prompt === RECENT MISMATCH SAMPLE ===
select * from (
  select qd.tno,qd.sno,qd.itemcode,qd.quantity1,qd.quantity2,qd.ratemeasuringunitcode,qd.rate,
         qd.amount,qd.footeramount,qd.totalamount,
         nvl((select sum(f.footervalue) from quotationdetailfooter f where f.tno=qd.tno and f.sno=qd.sno),0) footer_sum
  from quotationdetail qd
  where nvl(qd.footeramount,0) <> nvl((select sum(f.footervalue) from quotationdetailfooter f where f.tno=qd.tno and f.sno=qd.sno),0)
     or nvl(qd.totalamount,0) <> nvl(qd.amount,0)+nvl(qd.footeramount,0)
  order by qd.tno desc, qd.sno
) where rownum <= 20;
exit
