whenever sqlerror exit sql.sqlcode rollback
set pagesize 200 linesize 260 long 10000 serveroutput on size unlimited
connect -name IMART

prompt === REQUIRED PAGE COMPONENTS ===
select 'AJAX_PROCESS' component, count(*) found
  from apex_260100.wwv_flow_step_processing
 where flow_id = 105 and flow_step_id = 710 and process_name = 'P710_CALCULATE_DETAIL'
union all
select 'SAVE_GUARD', count(*)
  from apex_260100.wwv_flow_step_validations
 where flow_id = 105 and flow_step_id = 710 and validation_name = 'Detail calculation must be complete'
union all
select 'CALC_STATUS_ITEM', count(*)
  from apex_260100.wwv_flow_step_items
 where flow_id = 105 and flow_step_id = 710 and name = 'P710_CALCSTATUS'
union all
select 'UNITCODE1_COLUMN', count(*)
  from apex_260100.wwv_flow_region_columns
 where flow_id = 105 and page_id = 710 and name = 'UNITCODE1'
union all
select 'UNITCODE2_COLUMN', count(*)
  from apex_260100.wwv_flow_region_columns
 where flow_id = 105 and page_id = 710 and name = 'UNITCODE2';

prompt === SAVE-TIME AUTHORITATIVE GUARD ===
select process_name, process_sequence, process_when, process_when_type
  from apex_260100.wwv_flow_step_processing
 where flow_id=105 and flow_step_id=710
   and process_name='Verify quotation calculations before commit';

declare
  l_source clob;
  l_cursor integer;
begin
  select process_sql_clob into l_source
    from apex_260100.wwv_flow_step_processing
   where flow_id=105 and flow_step_id=710
     and process_name='Verify quotation calculations before commit';
  l_cursor:=dbms_sql.open_cursor;
  dbms_sql.parse(l_cursor,l_source,dbms_sql.native);
  dbms_sql.close_cursor(l_cursor);
  dbms_output.put_line('SAVE_GUARD_PLSQL_PARSE=OK');
exception when others then
  if dbms_sql.is_open(l_cursor) then dbms_sql.close_cursor(l_cursor); end if;
  raise;
end;
/

prompt === CALCULATION EVENTS (ONLY ACTUAL CHANGES MAY REMAIN ACTIVE) ===
select name, bind_event_type, nvl(display_when_type,'ACTIVE') status
  from apex_260100.wwv_flow_page_da_events
 where flow_id = 105
   and page_id = 710
   and name in ('set amount','set hsn','set uom',
                'Calculate Detail Footer Amount',
                'Calculate Detail Footer Total Amount value on get focus',
                'Calculate Detail Footer Total Amount value on loose focus',
                'Set Value- Final value of Detail footer on Loose Focus')
 order by name;

prompt === RATE AFTER DISCOUNT COLUMN ===
select name, item_type, item_attributes
  from apex_260100.wwv_flow_region_columns
 where flow_id = 105 and page_id = 710 and name = 'RATEAFTERDISCOUNT';

prompt === CURRENT DATA INTEGRITY BASELINE ===
select count(*) detail_rows,
       sum(case when abs(nvl(totalamount,0) - (nvl(amount,0)+nvl(footeramount,0))) > .01 then 1 else 0 end) total_mismatch,
       sum(case when rate is not null and amount is null then 1 else 0 end) blank_amount_with_rate
  from quotationdetail;

select count(*) orphan_footer_rows
  from quotationdetailfooter f
 where not exists (
       select 1 from quotationdetail d
        where d.tno = f.tno and d.sno = f.sno);

select count(*) orphan_detail_rows
  from quotationdetail d
 where not exists (select 1 from quotation q where q.tno=d.tno);

select count(*) footer_mismatch_rows
  from quotationdetail d
 where abs(nvl(d.footeramount,0) - nvl((
       select sum(f.footervalue)
         from quotationdetailfooter f
        where f.tno = d.tno and f.sno = d.sno),0)) > .01;

select sum(case when qd.quantity2 is null or abs(qd.quantity2-round(round(nvl(qd.quantity1,0),getuomdecimal(GetMeasuringUnitCodeFromItem(qd.itemcode)))*nvl((select max(s.multiplyingfactor) from itemspecification s where s.itemspecificationcode=qd.itemspecificationcode),1),3))>.001 then 1 else 0 end) quantity2_mismatch,
       sum(case when qd.discountrate is null or abs(qd.discountrate-((nvl(qd.discountpercentage,0)/100)*nvl(qd.withoutdiscountrate,0)))>.01 then 1 else 0 end) discount_mismatch,
       sum(case when qd.rateafterdiscount is null or abs(qd.rateafterdiscount-(nvl(qd.withoutdiscountrate,0)-((nvl(qd.discountpercentage,0)/100)*nvl(qd.withoutdiscountrate,0))))>.01 then 1 else 0 end) rate_after_discount_mismatch
  from quotationdetail qd
  join quotation q on q.tno=qd.tno;

prompt === TAX QUERY EXECUTION CHECK (READ ONLY) ===
select count(*) matched_tax_lines
  from quotationdetail qd
  join quotation q on q.tno = qd.tno
  join taxruledetail a on 1 = 1
  join taxruledetailfooter b on b.tno = a.tno and b.sno = a.sno
  join footerhead c on c.footerheadcode = b.footerheadcode
  join taxrule d on d.tno = a.tno
  join taxrulehsn e on e.tno = d.tno and e.hsncode = qd.hsncode
  join vendor f on f.taxregistrationtypecode = d.taxregistrationtypecode
               and f.vendorcode = q.partycode
 where d.transactiontypecode = q.transactiontypecode;

exit
