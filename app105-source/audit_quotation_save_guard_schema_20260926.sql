whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 500 linesize 240 trimspool on
column table_name format a30
column column_name format a35
column data_type format a20
select table_name, column_id, column_name, data_type, data_precision, data_scale, nullable
  from user_tab_columns
 where table_name in ('QUOTATION','QUOTATIONDETAIL','QUOTATIONDETAILFOOTER','ITEM','ITEMSPECIFICATION','TAXRULE','TAXRULEHSN','TAXRULEDETAIL','TAXRULEDETAILFOOTER','VENDOR')
 order by table_name, column_id;

prompt === PAGE 710 CURRENT DOCUMENT TOTALS AND MISMATCH COUNTS ===
select count(*) detail_rows,
       sum(case when abs(nvl(totalamount,0)-(nvl(amount,0)+nvl(footeramount,0))) > .01 then 1 else 0 end) total_mismatch,
       sum(case when nvl(quantity1,0)>0 and nvl(rate,0)>0 and nvl(amount,0)=0 then 1 else 0 end) zero_amount
  from quotationdetail;

prompt === FORMULA MISMATCH BREAKDOWN ===
with d as (
  select qd.*, q.partycode, q.transactiontypecode,
         i.measuringunitcode1 unit1, i.measuringunitcode2 unit2,
         nvl(s.multiplyingfactor,1) factor, trim(s.hsncode) master_hsn,
         round(qd.quantity1, getuomdecimal(GetMeasuringUnitCodeFromItem(qd.itemcode))) expected_q1,
         round(round(qd.quantity1, getuomdecimal(GetMeasuringUnitCodeFromItem(qd.itemcode))) * nvl(s.multiplyingfactor,1),3) expected_q2,
         (nvl(qd.discountpercentage,0)/100)*nvl(qd.withoutdiscountrate,0) expected_discount,
         nvl(qd.withoutdiscountrate,0)-((nvl(qd.discountpercentage,0)/100)*nvl(qd.withoutdiscountrate,0)) expected_rad
    from quotationdetail qd
    join quotation q on q.tno=qd.tno
    left join item i on i.itemcode=qd.itemcode
    left join itemspecification s on s.itemspecificationcode=qd.itemspecificationcode
), x as (
  select d.*,
         case when unit2 is not null and nvl(trim(ratemeasuringunitcode),unit1)=unit2
              then nvl(rate,0)*expected_q2 else nvl(rate,0)*expected_q1 end expected_amount,
         (select nvl(sum(f.footervalue),0) from quotationdetailfooter f where f.tno=d.tno and f.sno=d.sno) child_footer
    from d
)
select sum(case when abs(nvl(quantity1,0)-expected_q1)>.001 then 1 else 0 end) q1_bad,
       sum(case when abs(nvl(quantity2,0)-expected_q2)>.001 then 1 else 0 end) q2_bad,
       sum(case when abs(nvl(discountrate,0)-expected_discount)>.01 then 1 else 0 end) discount_bad,
       sum(case when abs(nvl(rateafterdiscount,0)-expected_rad)>.01 then 1 else 0 end) rad_bad,
       sum(case when abs(nvl(amount,0)-expected_amount)>.01 then 1 else 0 end) amount_bad,
       sum(case when abs(nvl(footeramount,0)-child_footer)>.01 then 1 else 0 end) footer_bad,
       sum(case when abs(nvl(totalamount,0)-(nvl(amount,0)+child_footer))>.01 then 1 else 0 end) total_bad
  from x;

prompt === HEADER TOTAL MISMATCH ===
select count(*) header_bad
  from quotation q
 where exists (select 1 from quotationdetail d where d.tno=q.tno)
   and (abs(nvl(q.sumofamount,0)-(select nvl(sum(d.amount),0) from quotationdetail d where d.tno=q.tno))>.01
     or abs(nvl(q.sumoffooteramount,0)-(select nvl(sum(d.footeramount),0) from quotationdetail d where d.tno=q.tno))>.01
     or abs(nvl(q.quotationamount,0)-(select nvl(sum(d.totalamount),0) from quotationdetail d where d.tno=q.tno))>.01);

prompt === TAX RULE COUNT AND VALUE MISMATCH ===
with d as (
  select qd.tno, qd.sno, qd.amount, q.partycode, q.transactiontypecode,
         trim(nvl(qd.hsncode,s.hsncode)) hsncode
    from quotationdetail qd
    join quotation q on q.tno=qd.tno
    left join itemspecification s on s.itemspecificationcode=qd.itemspecificationcode
), x as (
  select d.*,
         (select count(*)
            from taxruledetail a
            join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno
            join taxrule tr on tr.tno=a.tno
            join taxrulehsn h on h.tno=tr.tno
            join vendor v on v.taxregistrationtypecode=tr.taxregistrationtypecode
           where v.vendorcode=d.partycode and tr.transactiontypecode=d.transactiontypecode and h.hsncode=d.hsncode) expected_count,
         (select nvl(sum((d.amount*b.taxrate)/100),0)
            from taxruledetail a
            join taxruledetailfooter b on b.tno=a.tno and b.sno=a.sno
            join taxrule tr on tr.tno=a.tno
            join taxrulehsn h on h.tno=tr.tno
            join vendor v on v.taxregistrationtypecode=tr.taxregistrationtypecode
           where v.vendorcode=d.partycode and tr.transactiontypecode=d.transactiontypecode and h.hsncode=d.hsncode) expected_value,
         (select count(*) from quotationdetailfooter f where f.tno=d.tno and f.sno=d.sno) actual_count,
         (select nvl(sum(f.footervalue),0) from quotationdetailfooter f where f.tno=d.tno and f.sno=d.sno) actual_value
    from d
)
select sum(case when expected_count<>actual_count then 1 else 0 end) count_bad,
       sum(case when abs(expected_value-actual_value)>.01 then 1 else 0 end) value_bad
  from x;
exit
