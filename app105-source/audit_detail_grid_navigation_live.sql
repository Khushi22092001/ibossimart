whenever sqlerror exit sql.sqlcode rollback
set define off
set heading on feedback on pagesize 200 linesize 220
connect -name IMART

prompt === Application 105 editable/detail grid footprint ===
select count(distinct page_id) interactive_grid_pages
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and security_group_id = 4744311978888504
   and plug_source_type = 'NATIVE_IG';

prompt === Legacy automatic tab-move dynamic actions ===
select count(*) move_tab_actions,
       count(distinct page_id) affected_pages
  from apex_260100.wwv_flow_page_da_events
 where flow_id = 105
   and security_group_id = 4744311978888504
   and regexp_like(name, 'move.*tab', 'i');

column page_id format 9999
column dynamic_action format a48
column triggering_element format a42
select page_id,
       name dynamic_action,
       triggering_element
  from apex_260100.wwv_flow_page_da_events
 where flow_id = 105
   and security_group_id = 4744311978888504
   and regexp_like(name, 'move.*tab', 'i')
 order by page_id, name;

exit
