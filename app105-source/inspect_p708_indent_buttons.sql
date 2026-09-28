set define off
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

set pagesize 100
set linesize 220
column button_name format a35
column button_image_alt format a40
column static_id format a35
select button_name,
       button_image_alt,
       static_id,
       grid_new_row,
       grid_column
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 708
   and button_name in ('GetUnorderedIndent', 'ShowAllUnorderedIndents');
exit
