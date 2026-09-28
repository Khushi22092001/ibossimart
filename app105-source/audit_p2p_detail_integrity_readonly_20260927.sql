whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 500 linesize 300 long 12000 feedback on verify off

prompt === P2P PAGE MAP ===
select id page_id, name page_name
from apex_260100.wwv_flow_steps
where flow_id=105 and id in (108,708,712,118,155,69,146,143,152,140,710)
order by case id when 108 then 1 when 708 then 2 when 712 then 3 when 118 then 4 when 155 then 5 when 69 then 6 when 146 then 7 when 143 then 8 when 152 then 9 when 140 then 10 else 11 end;

prompt === CALCULATION EVENTS STILL RUNNING ON FOCUS/KEY ===
select page_id, name, bind_event_type, triggering_element_type, triggering_element,
       nvl(display_when_type,'ACTIVE') status
from apex_260100.wwv_flow_page_da_events
where flow_id=105
  and page_id in (108,708,712,118,155,69,146,143,152,140)
  and nvl(display_when_type,'ACTIVE') <> 'NEVER'
  and lower(nvl(bind_event_type,'-')) in ('focusout','focusin','blur','keyup','keydown','keypress')
  and regexp_like(lower(name),'amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency')
order by page_id, name;

prompt === CALCULATION ACTION WAIT / ERROR / COMMIT / TIMER AUDIT ===
select e.page_id,
       e.name event_name,
       e.bind_event_type,
       a.action_sequence,
       a.action,
       nvl(a.wait_for_result,'-') wait_for_result,
       nvl(a.stop_execution_on_error,'-') stop_on_error,
       case when regexp_like(dbms_lob.substr(a.attributes,4000,1),'(^|[[:space:]'';])commit[[:space:]]*;','i') then 'YES' else 'NO' end has_commit,
       case when dbms_lob.instr(lower(a.attributes),'settimeout')>0 then 'YES' else 'NO' end has_timer
from apex_260100.wwv_flow_page_da_events e
join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
where e.flow_id=105
  and e.page_id in (108,708,712,118,155,69,146,143,152,140)
  and nvl(e.display_when_type,'ACTIVE') <> 'NEVER'
  and regexp_like(lower(e.name),'amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency')
order by e.page_id, e.name, a.action_sequence;

prompt === DETAIL FINANCIAL / IDENTITY COLUMN CONFIGURATION ===
select c.page_id, p.plug_name region_name, c.name column_name,
       c.item_type, c.is_visible, c.is_query_only, c.is_primary_key,
       c.readonly_condition_type, c.link_target
from apex_260100.wwv_flow_region_columns c
join apex_260100.wwv_flow_page_plugs p on p.id=c.region_id
where c.flow_id=105
  and c.page_id in (108,708,712,118,155,69,146,143,152,140)
  and upper(c.name) in ('TNO','SNO','AMOUNT','FOOTERAMOUNT','TOTALAMOUNT','RATE','RATEAFTERDISCOUNT','QUANTITY1','QUANTITY2','HSN','RATEMEASURINGUNITCODE','FD')
order by c.page_id, p.plug_name, c.display_sequence;

prompt === FOOTER DETAIL REGIONS AND ROW FILTERS ===
select page_id, plug_name, static_id,
       case when dbms_lob.instr(upper(plug_source),'TNO')>0 then 'YES' else 'NO' end has_tno,
       case when dbms_lob.instr(upper(plug_source),'SNO')>0 then 'YES' else 'NO' end has_sno,
       case when dbms_lob.instr(upper(plug_source),'WHERE')>0 then 'YES' else 'NO' end has_where
from apex_260100.wwv_flow_page_plugs
where flow_id=105
  and page_id in (118,143,152)
  and regexp_like(lower(plug_name),'footer')
order by page_id, plug_name;

prompt === FD LINK TARGETS ===
select page_id, name, link_target
from apex_260100.wwv_flow_region_columns
where flow_id=105
  and page_id in (118,143,152)
  and upper(name)='FD'
order by page_id;

prompt === SAVE-TIME CALCULATION GUARD COVERAGE ===
select s.id page_id, s.name page_name,
       case when exists (
         select 1 from apex_260100.wwv_flow_step_processing p
         where p.flow_id=105 and p.flow_step_id=s.id
           and lower(p.process_name) like 'verify%calculation%before commit%'
       ) then 'YES' else 'NO' end has_calc_save_guard
from apex_260100.wwv_flow_steps s
where s.flow_id=105 and s.id in (108,708,712,118,155,69,146,143,152,140)
order by case s.id when 108 then 1 when 708 then 2 when 712 then 3 when 118 then 4 when 155 then 5 when 69 then 6 when 146 then 7 when 143 then 8 when 152 then 9 when 140 then 10 end;

prompt === PURCHASE QUOTATION READ-ONLY EXCLUSION CHECK ===
select id page_id,
       case when nvl(dbms_lob.instr(javascript_code,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1'),0)=0
                  and nvl(dbms_lob.instr(javascript_code_onload,'HSPL_CROSSFORM_DETAIL_INTEGRITY_V1'),0)=0
            then 'UNCHANGED_BY_CROSSFORM_DEPLOY' else 'CROSSFORM_MARKER_PRESENT' end quotation_status
from apex_260100.wwv_flow_steps where flow_id=105 and id=710;

exit
