whenever sqlerror exit sql.sqlcode rollback
set pagesize 200
set linesize 280
set long 4000
connect -name IMART

select e.id as event_id,
       e.name as event_name,
       e.bind_event_type,
       e.bind_event_type_custom,
       a.id as action_id,
       a.name as action_name,
       a.action,
       a.action_sequence,
       a.affected_elements_type,
       a.affected_region_id,
       a.attribute_01 as javascript_code
  from apex_260100.wwv_flow_page_da_events e
  join apex_260100.wwv_flow_page_da_actions a
    on a.event_id = e.id
   and a.flow_id = e.flow_id
   and a.page_id = e.page_id
 where e.flow_id = 105
   and e.page_id = 199
   and e.security_group_id = 4744311978888504
   and (lower(nvl(e.name, ' ')) like '%detail%'
        or lower(nvl(a.attribute_01, ' ')) like '%detail_region%')
 order by e.id, a.action_sequence, a.id;

exit
