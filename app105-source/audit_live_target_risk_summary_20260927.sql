whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 320 long 20000 longchunksize 20000 trimspool on feedback on verify off

prompt === FORM RISK SUMMARY ===
with targets as (
  select id page_id, name page_name
    from apex_260100.wwv_flow_steps
   where flow_id=105
     and id in (118,140,143,146,148,152,171,175,190,191,274,702,705,706,710,712)
), process_risk as (
  select p.flow_step_id page_id,
         count(*) process_count,
         sum(case when dbms_lob.instr(lower(nvl(p.process_sql_clob,to_clob(' '))),'commit;')>0 then 1 else 0 end) process_commits,
         sum(case when regexp_like(lower(p.process_name),'verify.*calculation.*before commit') then 1 else 0 end) named_calc_guards,
         sum(case when regexp_like(lower(p.process_name),'verify.*calculation.*before commit')
                   and nvl(trim(p.process_when),'-')='1=0' then 1 else 0 end) disabled_calc_guards
    from apex_260100.wwv_flow_step_processing p
   where p.flow_id=105
     and p.flow_step_id in (select page_id from targets)
   group by p.flow_step_id
), da_risk as (
  select e.page_id,
         count(distinct case when lower(nvl(e.bind_event_type,'-')) in ('focusout','focusin','blur','keyup','keydown','keypress')
                               and regexp_like(lower(e.name),'amount|rate|quantity|qty|balance|total|footer|unit|tax|discount|currency')
                             then e.id end) focus_calc_events,
         sum(case when a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE')
                   and nvl(a.wait_for_result,'N') <> 'Y' then 1 else 0 end) async_no_wait,
         sum(case when dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'settimeout')>0 then 1 else 0 end) timers,
         sum(case when dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'commit;')>0 then 1 else 0 end) da_commits
    from apex_260100.wwv_flow_page_da_events e
    join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
   where e.flow_id=105
     and e.page_id in (select page_id from targets)
     and nvl(e.display_when_type,'ACTIVE') <> 'NEVER'
   group by e.page_id
)
select t.page_id,t.page_name,
       nvl(p.process_count,0) process_count,nvl(p.process_commits,0) process_commits,
       nvl(p.named_calc_guards,0) named_calc_guards,nvl(p.disabled_calc_guards,0) disabled_calc_guards,
       nvl(d.focus_calc_events,0) focus_calc_events,nvl(d.async_no_wait,0) async_no_wait,
       nvl(d.timers,0) timers,nvl(d.da_commits,0) da_commits
  from targets t
  left join process_risk p on p.page_id=t.page_id
  left join da_risk d on d.page_id=t.page_id
 order by t.page_id;

prompt === ACTIVE HIGH-RISK CALCULATION EVENTS ===
select e.page_id,s.name page_name,e.name event_name,e.bind_event_type,
       a.action,a.action_sequence,nvl(a.wait_for_result,'N') wait_for_result,
       nvl(a.stop_execution_on_error,'N') stop_on_error,
       case when dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'commit;')>0 then 'Y' else 'N' end explicit_commit,
       case when dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'settimeout')>0 then 'Y' else 'N' end timer
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_steps s on s.flow_id=e.flow_id and s.id=e.page_id
  join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
 where e.flow_id=105
   and e.page_id in (140,146,148,171,175,190,191,274,702,705,706,712)
   and nvl(e.display_when_type,'ACTIVE') <> 'NEVER'
   and (lower(nvl(e.bind_event_type,'-')) in ('focusout','focusin','blur','keyup','keydown','keypress')
        or dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'commit;')>0
        or dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'settimeout')>0
        or (a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE') and nvl(a.wait_for_result,'N') <> 'Y'))
 order by e.page_id,e.name,a.action_sequence;

exit
