whenever sqlerror exit sql.sqlcode rollback
set define off
set pages 200
set lines 240
set trimspool on
connect -name IMART

prompt === PAGE DEFINITIONS ===
select id, name, alias, step_template, page_mode, dialog_chained,
       last_updated_on
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id in (63, 1063)
   and security_group_id = 4744311978888504
 order by id;

prompt === BUTTON REGIONS ===
select page_id, id, plug_name, plug_display_point, plug_template,
       plug_display_sequence, last_updated_on
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id in (63, 1063)
   and upper(plug_name) = 'BUTTONS'
   and security_group_id = 4744311978888504
 order by page_id;

prompt === BUTTONS ===
select flow_step_id, id, button_name, button_plug_id, button_position,
       button_condition, button_condition_type, last_updated_on
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id in (63, 1063)
   and button_name in ('CANCEL','CREATE','DELETE','SAVE')
   and security_group_id = 4744311978888504
 order by flow_step_id, button_name;

exit
