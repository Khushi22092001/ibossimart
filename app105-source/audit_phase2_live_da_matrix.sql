whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 500 linesize 360 long 5000
connect -name IMART
column event_name format a48
column triggering_element format a75
column action_name format a38
column client_condition_expression format a85
select e.page_id,
       e.id event_id,
       e.name event_name,
       e.bind_event_type,
       e.triggering_element,
       nvl(e.display_when_type,'ENABLED') event_status,
       a.id action_id,
       nvl(a.name,a.action) action_name,
       a.action,
       nvl(a.client_condition_type,'NONE') client_condition_type,
       a.client_condition_expression
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_page_da_actions a on a.event_id=e.id
 where e.flow_id=105
   and e.page_id in (118,155,712)
   and e.security_group_id=4744311978888504
   and (e.bind_event_type in ('focusout','change')
        or regexp_like(e.name,'amount|quantity|qty|footer|detail|balance','i'))
 order by e.page_id,e.event_sequence,a.action_sequence;
exit
