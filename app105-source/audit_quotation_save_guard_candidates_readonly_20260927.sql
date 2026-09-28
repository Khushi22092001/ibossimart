whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 320 trimspool on feedback on verify off

prompt === QUOTATION DETAIL VALUES USED BY THE SAVE VERIFIER ===
select d.tno,d.sno,d.serialno,d.itemcode,d.itemspecificationcode,
       d.quantity1,d.quantity2,
       round(d.quantity1*nvl(s.multiplyingfactor,1),3) expected_quantity2,
       i.measuringunitcode1 primary_uom,i.measuringunitcode2 secondary_uom,
       nvl(trim(d.ratemeasuringunitcode),i.measuringunitcode1) rate_uom,
       case when i.measuringunitcode2 is not null
                  and nvl(trim(d.ratemeasuringunitcode),i.measuringunitcode1)=i.measuringunitcode2
            then 'CHECK_Q2' else 'Q2_NOT_APPLICABLE' end quantity2_guard_scope,
       d.rate,d.amount,d.footeramount,d.totalamount,
       d.withoutdiscountrate,d.discountpercentage,d.discountrate,d.rateafterdiscount,d.hsncode,
       nvl(sum(f.footervalue),0) footer_rows_total,
       case when abs(nvl(d.footeramount,0)-nvl(sum(f.footervalue),0))>.01 then 'Y' else 'N' end footer_mismatch,
       case when abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(sum(f.footervalue),0)))>.01 then 'Y' else 'N' end total_mismatch
  from quotationdetail d
  join item i on i.itemcode=d.itemcode
  left join itemspecification s on s.itemspecificationcode=d.itemspecificationcode
  left join quotationdetailfooter f on f.tno=d.tno and f.sno=d.sno
 where d.tno in (57011677,56983631)
 group by d.tno,d.sno,d.serialno,d.itemcode,d.itemspecificationcode,d.quantity1,d.quantity2,
          i.measuringunitcode1,i.measuringunitcode2,s.multiplyingfactor,d.ratemeasuringunitcode,d.rate,d.amount,d.footeramount,d.totalamount,
          d.withoutdiscountrate,d.discountpercentage,d.discountrate,d.rateafterdiscount,d.hsncode
 order by d.tno,d.serialno,d.sno;

prompt === LIVE SAMPLE: OLD FALSE-BLOCK RULE VERSUS THE NARROWED RULE ===
select sum(case when abs(nvl(d.quantity2,0)-round(nvl(d.quantity1,0)*nvl(s.multiplyingfactor,1),3))>.001
                    then 1 else 0 end) old_rule_blocks,
       sum(case when i.measuringunitcode2 is not null
                     and nvl(trim(d.ratemeasuringunitcode),i.measuringunitcode1)=i.measuringunitcode2
                     and abs(nvl(d.quantity2,0)-round(nvl(d.quantity1,0)*nvl(s.multiplyingfactor,1),3))>.001
                    then 1 else 0 end) narrowed_rule_blocks,
       sum(case when (i.measuringunitcode2 is null
                      or nvl(trim(d.ratemeasuringunitcode),i.measuringunitcode1)<>i.measuringunitcode2)
                     and abs(nvl(d.quantity2,0)-round(nvl(d.quantity1,0)*nvl(s.multiplyingfactor,1),3))>.001
                    then 1 else 0 end) legitimate_primary_uom_rows
  from quotationdetail d
  join item i on i.itemcode=d.itemcode
  join itemspecification s on s.itemspecificationcode=d.itemspecificationcode
 where d.tno in (57011677,56983631);

exit
