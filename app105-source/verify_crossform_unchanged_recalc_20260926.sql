whenever sqlerror exit sql.sqlcode rollback
set pagesize 300 linesize 260 feedback on verify off serveroutput on

prompt === TARGETED EVENTS MUST ALL BE CHANGE ===
with targets(page_id,name) as (
  select 69,'Set Net Weight' from dual union all
  select 108,'Set HSN' from dual union all
  select 108,'Set Primary Stock Qty' from dual union all
  select 108,'Set Quantity1' from dual union all
  select 108,'Set Quantity2' from dual union all
  select 108,'Set Quantity2_1' from dual union all
  select 108,'Set Quantity2_1_1' from dual union all
  select 108,'Set Quantity2_1_2' from dual union all
  select 108,'Set Sanctioned' from dual union all
  select 108,'Set Sanctioned2' from dual union all
  select 108,'Set Unit1' from dual union all
  select 108,'Set Unit2' from dual union all
  select 108,'check Indent and sanction qty' from dual union all
  select 108,'set decimal for ind_qty1' from dual union all
  select 108,'set decimal for ind_qty2' from dual union all
  select 108,'set decimal for qty1' from dual union all
  select 108,'set decimal for qty2' from dual union all
  select 118,'Calculate Detail Footer Amount' from dual union all
  select 118,'Calculate Detail Footer Total Amount value' from dual union all
  select 118,'Calculate Detail Footer Total Amount value on loose focus' from dual union all
  select 118,'Set Quantity2' from dual union all
  select 118,'Set Value- Final value of Detail footer on Loose Focus' from dual union all
  select 118,'check balance' from dual union all
  select 118,'set amount' from dual union all
  select 118,'set balance qty' from dual union all
  select 118,'set decimal on qty2' from dual union all
  select 118,'set hsn code' from dual union all
  select 140,'set amount and amount entered' from dual union all
  select 143,'Calculate Detail Footer Total Amount value on get focus' from dual union all
  select 143,'Calculate Detail Footer Total Amount value on loose focus' from dual union all
  select 143,'Calculate Sum of Amount Value on Loose focus' from dual union all
  select 143,'Set Value- Final value of Detail footer on Loose Focus' from dual union all
  select 143,'set decimal qty1' from dual union all
  select 143,'set footer' from dual union all
  select 146,'Set Detail Storage RejectedQty1' from dual union all
  select 146,'Set itemcode and specs' from dual union all
  select 146,'Set rate on basis of stock tno page item' from dual union all
  select 146,'set balance qty' from dual union all
  select 152,'Calculate Detail Footer Amount' from dual union all
  select 152,'Calculate Detail Footer Total Amount value on get focus' from dual union all
  select 152,'Calculate Detail Footer Total Amount value on loose focus' from dual union all
  select 152,'Calculate Sum of Amount Value on Loose focus' from dual union all
  select 152,'Set Bill Amount' from dual union all
  select 152,'Set Value- Final value of Detail footer on Loose Focus' from dual union all
  select 152,'set footer' from dual union all
  select 155,'Check Pending Qty' from dual union all
  select 155,'Set Quantity2' from dual union all
  select 155,'set decimal qty1' from dual union all
  select 155,'set decimal qty1_1' from dual
)
select t.page_id,
       count(*) target_count,
       sum(case when e.bind_event_type='change' then 1 else 0 end) change_count,
       sum(case when e.id is null then 1 else 0 end) missing_count,
       sum(case when e.id is not null and e.bind_event_type<>'change' then 1 else 0 end) wrong_trigger_count
from targets t
left join apex_260100.wwv_flow_page_da_events e
  on e.flow_id=105 and e.page_id=t.page_id and trim(e.name)=t.name
group by t.page_id
order by t.page_id;

prompt === PURCHASE QUOTATION MUST REMAIN EXCLUDED ===
select id page_id,
       case when nvl(dbms_lob.instr(javascript_code,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1'),0)=0
                  and nvl(dbms_lob.instr(javascript_code_onload,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1'),0)=0
            then 'UNCHANGED_BY_CROSSFORM_DEPLOY' else 'ERROR_MARKER_FOUND' end quotation_status
from apex_260100.wwv_flow_steps
where flow_id=105 and id=710;

exit
