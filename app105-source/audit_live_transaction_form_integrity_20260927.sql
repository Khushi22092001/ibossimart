whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 1000 linesize 320 long 20000 longchunksize 20000 trimspool on feedback on verify off

prompt === TRANSACTION FORM PROCESS / SAVE-GUARD INVENTORY ===
select s.id page_id,
       s.name page_name,
       p.process_sequence,
       p.process_point,
       p.process_name,
       p.process_type,
       case when dbms_lob.instr(lower(nvl(p.process_sql_clob,to_clob(' '))),'commit;') > 0 then 'Y' else 'N' end explicit_commit,
       case when regexp_like(lower(p.process_name),'verify|validate|reconcile|integrity|repair') then 'Y' else 'N' end integrity_named,
       substr(replace(replace(nvl(p.process_when,'-'),chr(10),' '),chr(13),' '),1,100) process_condition
  from apex_260100.wwv_flow_step_processing p
  join apex_260100.wwv_flow_steps s on s.flow_id=p.flow_id and s.id=p.flow_step_id
 where p.flow_id=105
   and p.flow_step_id in (118,140,143,146,148,152,171,175,190,191,274,702,705,706,710,712)
 order by s.id, p.process_point, p.process_sequence, p.id;

prompt === HIGH-RISK ACTIVE DA ACTIONS ON REQUESTED FORMS ===
select e.page_id,
       s.name page_name,
       e.name event_name,
       e.bind_event_type event_type,
       e.triggering_element_type trigger_type,
       substr(e.triggering_element,1,70) trigger_element,
       a.action action_type,
       nvl(a.wait_for_result,'N') wait_for_result,
       nvl(a.stop_execution_on_error,'N') stop_on_error,
       case when dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'commit;') > 0 then 'Y' else 'N' end explicit_commit,
       case when dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'settimeout') > 0 then 'Y' else 'N' end timer
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_steps s on s.flow_id=e.flow_id and s.id=e.page_id
  join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
 where e.flow_id=105
   and e.page_id in (118,140,143,146,148,152,171,175,190,191,274,702,705,706,710,712)
   and nvl(e.display_when_type,'ACTIVE') <> 'NEVER'
   and (lower(nvl(e.bind_event_type,'-')) in ('focusout','focusin','blur','keyup','keydown','keypress')
        or dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'commit;') > 0
        or dbms_lob.instr(lower(nvl(a.attributes,to_clob(' '))),'settimeout') > 0
        or (a.action in ('NATIVE_EXECUTE_PLSQL_CODE','NATIVE_SET_VALUE') and nvl(a.wait_for_result,'N') <> 'Y'))
 order by e.page_id,e.name,a.action_sequence;

prompt === PURCHASE QUOTATION REFERENCE CHECK ===
select p.process_name,
       p.process_point,
       p.process_sequence,
       case when dbms_lob.instr(lower(nvl(p.process_sql_clob,to_clob(' '))),'commit;') > 0 then 'EXPLICIT_COMMIT' else '-' end commit_signal,
       case when dbms_lob.instr(lower(nvl(p.process_sql_clob,to_clob(' '))),'delete from quotationdetailfooter') > 0 then 'FOOTER_MUTATION' else '-' end footer_signal
  from apex_260100.wwv_flow_page_proc p
 where p.flow_id=105 and p.flow_step_id=710
 order by p.process_point,p.process_sequence,p.id;

select case when dbms_lob.instr(javascript_code,'HSPL_P710_FD_REFRESH_COMPLETION_V7') > 0 then 'PRESENT' else 'MISSING' end fd_refresh_reference_marker,
       case when dbms_lob.instr(javascript_code,'HSPL_P710_PRE_SUBMIT_CALC_GUARD_V1') > 0 then 'PRESENT' else 'MISSING' end pre_submit_guard_marker
  from apex_260100.wwv_flow_steps
 where flow_id=105 and id=710;

exit
