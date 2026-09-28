set pagesize 200 linesize 220 trimspool on feedback off verify off

prompt === PURCHASE ORDER DETAIL MISMATCH COUNTS ===
select count(*) total_lines,
       sum(case when abs(nvl(d.discountrate,0) - nvl(d.withoutdiscountrate,0)*nvl(d.discountpercentage,0)/100) > .01 then 1 else 0 end) discount_bad,
       sum(case when abs(nvl(d.rateafterdiscount,0) - (nvl(d.withoutdiscountrate,0)-nvl(d.withoutdiscountrate,0)*nvl(d.discountpercentage,0)/100)) > .01 then 1 else 0 end) after_discount_bad,
       sum(case when abs(nvl(d.rate,0) - (nvl(d.withoutdiscountrate,0)-nvl(d.withoutdiscountrate,0)*nvl(d.discountpercentage,0)/100)) > .01 then 1 else 0 end) rate_bad,
       sum(case when abs(nvl(d.amount,0) - nvl(d.rate,0)*case when i.measuringunitcode2 is not null and upper(trim(d.ratemeasuringunitcode))=upper(trim(i.measuringunitcode2)) then nvl(d.quantity2,0) else nvl(d.quantity1,0) end) > .01 then 1 else 0 end) amount_bad,
       sum(case when abs(nvl(d.footeramount,0) - nvl((select sum(f.footervalue) from purchaseorderdetailfooter f where f.tno=d.tno and f.sno=d.sno),0)) > .01 then 1 else 0 end) footer_bad,
       sum(case when abs(nvl(d.totalamount,0) - (nvl(d.amount,0)+nvl(d.footeramount,0))) > .01 then 1 else 0 end) total_bad
from purchaseorderdetail d join item i on i.itemcode=d.itemcode;

prompt === PURCHASE BILL DETAIL MISMATCH COUNTS ===
select count(*) total_lines,
       sum(case when abs(nvl(d.amount,0) - nvl(d.rate,0)*case when i.measuringunitcode2 is not null and upper(trim(d.ratemeasuringunitcode))=upper(trim(i.measuringunitcode2)) then nvl(d.quantity2,0) else nvl(d.quantity1,0) end) > .01 then 1 else 0 end) amount_bad,
       sum(case when abs(nvl(d.footeramount,0) - nvl((select sum(f.footervalue) from purchasebilldetailfooter f where f.tno=d.tno and f.sno=d.sno),0)) > .01 then 1 else 0 end) footer_bad,
       sum(case when abs(nvl(d.totalamount,0) - (nvl(d.amount,0)+nvl(d.footeramount,0))) > .01 then 1 else 0 end) total_bad
from purchasebilldetail d join item i on i.itemcode=d.itemcode;

prompt === PURCHASE BILL PASS DETAIL MISMATCH COUNTS ===
select count(*) total_lines,
       sum(case when abs(nvl(d.amount,0) - nvl(d.quantity1,0)*nvl(d.rate,0)) > .01 then 1 else 0 end) amount_bad,
       sum(case when abs(nvl(d.footeramount,0) - nvl((select sum(f.footervalue) from pbpassdetailfooter f where f.tno=d.tno and f.sno=d.sno),0)) > .01 then 1 else 0 end) footer_bad,
       sum(case when abs(nvl(d.totalamount,0) - (nvl(d.amount,0)+nvl(d.footeramount,0))) > .01 then 1 else 0 end) total_bad
from pbpassdetail d;

exit
