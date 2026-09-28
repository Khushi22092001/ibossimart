whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 320 long 20000 longchunksize 20000 trimspool on feedback on verify off

prompt === REQUESTED DOWNSTREAM PAGES ===
select id page_id, name, alias
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and (regexp_like(lower(name),'purchase order|purchase bill|purchase bill pass|payment advice|loading advice|sales order|po receipt|ccinvo|bill receipt')
        or id in (69,118,140,143,146,152,155,171,175,190,191,274,710))
 order by id;

prompt === ACTIVE CALCULATION EVENTS ON REQUESTED AND ADJACENT P2P/O2C PAGES ===
with target_pages as (
  select id
    from apex_260100.wwv_flow_steps
   where flow_id=105
     and (id in (69,118,140,143,146,152,155,171,175,190,191,274,710)
          or regexp_like(lower(name),'purchase order|purchase bill|purchase bill pass|payment advice|loading advice|sales order|po receipt|ccinvo|bill receipt'))
)
select e.page_id, s.name page_name, e.name event_name, e.bind_event_type event_type,
       e.triggering_element_type trigger_type, substr(e.triggering_element,1,80) trigger_element,
       count(a.id) actions,
       sum(case when a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE') and nvl(a.wait_for_result,'N')<>'Y' then 1 else 0 end) async_no_wait,
       sum(case when a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE') and nvl(a.stop_execution_on_error,'N')<>'Y' then 1 else 0 end) no_stop,
       sum(case when dbms_lob.instr(lower(a.attributes),'settimeout')>0 then 1 else 0 end) timers,
       sum(case when dbms_lob.instr(lower(a.attributes),'commit;')>0 then 1 else 0 end) commits
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_steps s on s.flow_id=e.flow_id and s.id=e.page_id
  join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
 where e.flow_id=105
   and e.page_id in (select id from target_pages)
   and nvl(e.display_when_type,'ACTIVE') <> 'NEVER'
   and regexp_like(lower(e.name),'amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency|hsn|item|record')
 group by e.page_id,s.name,e.name,e.bind_event_type,e.triggering_element_type,e.triggering_element
 order by e.page_id,e.name;

prompt === APP-WIDE HIGH-RISK CALCULATION PAGES NOT YET LISTED ===
select e.page_id, s.name page_name,
       count(distinct e.id) calc_events,
       count(distinct case when lower(nvl(e.bind_event_type,'-')) in ('focusout','focusin','blur','keyup','keydown','keypress') then e.id end) focus_or_key_events,
       sum(case when a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE') and nvl(a.wait_for_result,'N')<>'Y' then 1 else 0 end) async_no_wait,
       sum(case when dbms_lob.instr(lower(a.attributes),'settimeout')>0 then 1 else 0 end) timers,
       sum(case when dbms_lob.instr(lower(a.attributes),'commit;')>0 then 1 else 0 end) commits
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_steps s on s.flow_id=e.flow_id and s.id=e.page_id
  join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
 where e.flow_id=105
   and nvl(e.display_when_type,'ACTIVE') <> 'NEVER'
   and regexp_like(lower(e.name),'amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency')
 group by e.page_id,s.name
having count(distinct case when lower(nvl(e.bind_event_type,'-')) in ('focusout','focusin','blur','keyup','keydown','keypress') then e.id end)>0
    or sum(case when a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE') and nvl(a.wait_for_result,'N')<>'Y' then 1 else 0 end)>0
    or sum(case when dbms_lob.instr(lower(a.attributes),'settimeout')>0 then 1 else 0 end)>0
    or sum(case when dbms_lob.instr(lower(a.attributes),'commit;')>0 then 1 else 0 end)>0
 order by focus_or_key_events desc, async_no_wait desc, e.page_id;

prompt === DETAIL / FOOTER REGIONS ON REQUESTED PAGES ===
select p.page_id,s.name page_name,p.plug_name,p.static_id,p.source_type,
       case when regexp_like(lower(p.plug_name),'footer|tax|detail') then 'Y' else 'N' end relevant
  from apex_260100.wwv_flow_page_plugs p
  join apex_260100.wwv_flow_steps s on s.flow_id=p.flow_id and s.id=p.page_id
 where p.flow_id=105
   and p.page_id in (69,118,140,143,146,152,155,171,175,190,191,274,710)
   and regexp_like(lower(p.plug_name||' '||nvl(p.static_id,'-')),'footer|tax|detail|item')
 order by p.page_id,p.display_sequence,p.plug_name;

prompt === PURCHASE QUOTATION EXCLUSION CHECK ===
select id page_id,
       case when dbms_lob.instr(javascript_code,'HSPL_P710_FD_REFRESH_COMPLETION_V7')>0 then 'REFERENCE_PRESENT' else 'REFERENCE_MISSING' end reference_state
  from apex_260100.wwv_flow_steps where flow_id=105 and id=710;

exit
