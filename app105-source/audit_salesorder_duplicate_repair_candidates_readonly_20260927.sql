whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 360 trimspool on feedback on verify off

prompt === DUPLICATE SALES-ORDER DETAIL IDENTITY REPAIR CLASSIFICATION ===
with duplicate_keys as (
  select tno,sno,count(*) detail_rows
    from salesorderdetail
   group by tno,sno
  having count(*) > 1
), footer_template as (
  select f.tno,f.sno,
         count(*) footer_rows,
         count(distinct f.footerheadcode) footer_heads,
         sum(nvl(f.footervalue,0)) shared_footer,
         sum(nvl(f.footerpercent,0)) footer_percent
    from salesorderdetailfooter f
    join duplicate_keys k on k.tno=f.tno and k.sno=f.sno
   group by f.tno,f.sno
), detail_expectation as (
  select d.rowid detail_rowid,d.tno,d.sno,d.itemcode,d.itemspecificationcode,
         d.taxrulecode,d.amount,d.footeramount,d.totalamount,
         nvl(sum(round(nvl(d.amount,0)*nvl(f.footerpercent,0)/100,2)),0) expected_footer
    from salesorderdetail d
    join duplicate_keys k on k.tno=d.tno and k.sno=d.sno
    left join salesorderdetailfooter f on f.tno=d.tno and f.sno=d.sno
   group by d.rowid,d.tno,d.sno,d.itemcode,d.itemspecificationcode,d.taxrulecode,d.amount,d.footeramount,d.totalamount
), group_assessment as (
  select d.tno,d.sno,
         count(*) detail_rows,
         count(distinct nvl(d.taxrulecode,'~')) taxrule_variants,
         sum(case when abs(nvl(d.footeramount,0)-nvl(d.expected_footer,0)) <= .01 then 1 else 0 end) expected_footer_matches,
         sum(case when abs(nvl(d.totalamount,0)-(nvl(d.amount,0)+nvl(d.footeramount,0))) <= .01 then 1 else 0 end) stored_total_matches,
         min(d.amount) min_amount,max(d.amount) max_amount,
         min(d.footeramount) min_stored_footer,max(d.footeramount) max_stored_footer
    from detail_expectation d
   group by d.tno,d.sno
)
select case
         when nvl(t.footer_rows,0)=0 then 'REVIEW_NO_FOOTER_TEMPLATE'
         when g.taxrule_variants<>1 then 'REVIEW_TAX_RULE_VARIANTS'
         when g.expected_footer_matches<>g.detail_rows then 'REVIEW_STORED_FOOTER_MISMATCH'
         when g.stored_total_matches<>g.detail_rows then 'REVIEW_STORED_TOTAL_MISMATCH'
         else 'RECONSTRUCTABLE_FROM_STORED_PATTERN'
       end classification,
       g.tno,so.salesorderno,so.salesorderdate,g.sno,
       g.detail_rows,g.taxrule_variants,nvl(t.footer_rows,0) footer_rows,nvl(t.footer_percent,0) footer_percent,
       nvl(t.shared_footer,0) shared_footer,g.expected_footer_matches,g.stored_total_matches,
       g.min_amount,g.max_amount,g.min_stored_footer,g.max_stored_footer
  from group_assessment g
  left join footer_template t on t.tno=g.tno and t.sno=g.sno
  left join salesorder so on so.tno=g.tno
 order by classification,g.tno desc,g.sno;

prompt === CLASSIFICATION COUNTS ===
with duplicate_keys as (
  select tno,sno,count(*) detail_rows from salesorderdetail group by tno,sno having count(*) > 1
), detail_expectation as (
  select d.rowid detail_rowid,d.tno,d.sno,d.taxrulecode,d.amount,d.footeramount,d.totalamount,
         nvl(sum(round(nvl(d.amount,0)*nvl(f.footerpercent,0)/100,2)),0) expected_footer,
         count(f.sn) footer_rows
    from salesorderdetail d join duplicate_keys k on k.tno=d.tno and k.sno=d.sno
    left join salesorderdetailfooter f on f.tno=d.tno and f.sno=d.sno
   group by d.rowid,d.tno,d.sno,d.taxrulecode,d.amount,d.footeramount,d.totalamount
), group_assessment as (
  select tno,sno,count(*) detail_rows,count(distinct nvl(taxrulecode,'~')) taxrule_variants,
         min(footer_rows) footer_rows,
         sum(case when abs(nvl(footeramount,0)-nvl(expected_footer,0)) <= .01 then 1 else 0 end) expected_footer_matches,
         sum(case when abs(nvl(totalamount,0)-(nvl(amount,0)+nvl(footeramount,0))) <= .01 then 1 else 0 end) stored_total_matches
    from detail_expectation group by tno,sno
)
select case
         when footer_rows=0 then 'REVIEW_NO_FOOTER_TEMPLATE'
         when taxrule_variants<>1 then 'REVIEW_TAX_RULE_VARIANTS'
         when expected_footer_matches<>detail_rows then 'REVIEW_STORED_FOOTER_MISMATCH'
         when stored_total_matches<>detail_rows then 'REVIEW_STORED_TOTAL_MISMATCH'
         else 'RECONSTRUCTABLE_FROM_STORED_PATTERN'
       end classification,
       count(*) duplicate_identities,
       sum(detail_rows) affected_detail_rows
  from group_assessment
 group by case
         when footer_rows=0 then 'REVIEW_NO_FOOTER_TEMPLATE'
         when taxrule_variants<>1 then 'REVIEW_TAX_RULE_VARIANTS'
         when expected_footer_matches<>detail_rows then 'REVIEW_STORED_FOOTER_MISMATCH'
         when stored_total_matches<>detail_rows then 'REVIEW_STORED_TOTAL_MISMATCH'
         else 'RECONSTRUCTABLE_FROM_STORED_PATTERN'
       end
 order by classification;

prompt === RECONSTRUCTION PREVIEW: LATEST ELIGIBLE IDENTITY ===
with duplicate_keys as (
  select tno,sno,count(*) detail_rows from salesorderdetail group by tno,sno having count(*) > 1
), detail_expectation as (
  select d.rowid detail_rowid,d.tno,d.sno,d.taxrulecode,d.amount,d.footeramount,d.totalamount,
         nvl(sum(round(nvl(d.amount,0)*nvl(f.footerpercent,0)/100,2)),0) expected_footer,
         count(f.sn) footer_rows
    from salesorderdetail d join duplicate_keys k on k.tno=d.tno and k.sno=d.sno
    left join salesorderdetailfooter f on f.tno=d.tno and f.sno=d.sno
   group by d.rowid,d.tno,d.sno,d.taxrulecode,d.amount,d.footeramount,d.totalamount
), eligible_key as (
  select tno,sno
    from detail_expectation
   group by tno,sno
  having min(footer_rows)>0
     and count(distinct nvl(taxrulecode,'~'))=1
     and sum(case when abs(nvl(footeramount,0)-nvl(expected_footer,0)) <= .01 then 1 else 0 end)=count(*)
     and sum(case when abs(nvl(totalamount,0)-(nvl(amount,0)+nvl(footeramount,0))) <= .01 then 1 else 0 end)=count(*)
   order by tno desc fetch first 1 row only
)
select d.tno,d.sno,d.itemcode,d.itemspecificationcode,d.amount,d.footeramount stored_footer,
       f.footerheadcode,f.footerpercent,round(nvl(d.amount,0)*nvl(f.footerpercent,0)/100,2) proposed_footervalue
  from salesorderdetail d
  join eligible_key k on k.tno=d.tno and k.sno=d.sno
  join salesorderdetailfooter f on f.tno=d.tno and f.sno=d.sno
 order by d.rowid,f.serialno,f.sn;

exit
