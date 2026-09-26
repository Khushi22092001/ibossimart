whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 500 linesize 320 trimspool on
connect -name IMART

column event_name format a48
column triggering_element format a72
column event_type format a12
column display_status format a12
column actions format a110

select e.page_id,
       e.id event_id,
       e.event_sequence,
       e.name event_name,
       e.bind_event_type event_type,
       e.triggering_element,
       nvl(e.display_when_type,'ENABLED') display_status,
       listagg(a.action||case when a.wait_for_result='Y' then '[WAIT]' end, ', ')
         within group(order by a.event_result, a.action_sequence, a.id) actions
  from apex_260100.wwv_flow_page_da_events e
  left join apex_260100.wwv_flow_page_da_actions a
    on a.flow_id=e.flow_id
   and a.page_id=e.page_id
   and a.event_id=e.id
   and a.security_group_id=e.security_group_id
 where e.flow_id=105
   and e.page_id in (108,708,710)
   and e.security_group_id=4744311978888504
   and e.bind_event_type in ('focusout','change')
 group by e.page_id,e.id,e.event_sequence,e.name,e.bind_event_type,
          e.triggering_element,nvl(e.display_when_type,'ENABLED')
 order by e.page_id,e.event_sequence,e.id;

exit
