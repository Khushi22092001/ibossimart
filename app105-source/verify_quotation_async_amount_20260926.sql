whenever sqlerror exit sql.sqlcode rollback
connect -name IMART
set pagesize 100 linesize 220

select id, name, bind_event_type
  from apex_260100.wwv_flow_page_da_events
 where flow_id = 105
   and page_id = 710
   and id in (41132957840923805, 41168016454923814)
 order by id;

select id,
       json_value(attributes, '$.suppress_change_event') suppress_change_event
  from apex_260100.wwv_flow_page_da_actions
 where flow_id = 105
   and page_id = 710
   and id in (41133498461923805, 41168478745923814)
 order by id;

select count(*) race_refresh_actions
  from apex_260100.wwv_flow_page_da_actions
 where flow_id = 105
   and page_id = 710
   and id in (41133945231923805, 41169483388923814);

select case
         when dbms_lob.instr(javascript_code,
                'if (before === undefined) { return false; }') > 0
         then 'UNCHANGED_NAVIGATION_GUARD_OK'
         else 'UNCHANGED_NAVIGATION_GUARD_MISSING'
       end guard_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 710
   and security_group_id = 4744311978888504;

exit
