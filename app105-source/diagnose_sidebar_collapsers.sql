set define off
set linesize 240
set pagesize 200
set long 2000
set heading on
connect -name IMART

select a.page_id,
       a.id action_id,
       a.event_id,
       a.action,
       nvl(a.server_condition_type, 'NULL') server_condition_type,
       substr(json_value(a.attributes, '$.js_code'), 1, 300) js_code
  from apex_260100.wwv_flow_page_da_actions a
 where a.flow_id = 105
   and (a.page_id = 174
        or lower(a.attributes) like '%js-navcollapsed%')
 order by a.page_id, a.id;

select e.page_id,
       e.id event_id,
       e.name,
       e.bind_event_type
  from apex_260100.wwv_flow_page_da_events e
 where e.flow_id = 105
   and e.page_id = 174
 order by e.id;
exit
