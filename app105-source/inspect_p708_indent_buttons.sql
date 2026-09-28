set pagesize 100
set linesize 220
connect -name IMART

select button_name,
       button_image_alt as label,
       button_sequence,
       grid_new_row,
       grid_column
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 708
   and security_group_id = 4744311978888504
   and button_name in ('GetUnorderedIndent', 'ShowAllUnorderedIndents')
 order by button_sequence;

exit
