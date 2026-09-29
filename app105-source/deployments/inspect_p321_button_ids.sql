set define off
connect -name IMART

select flow_id, flow_step_id as page_id, id as button_id, button_name, static_id
  from apex_260100.wwv_flow_step_buttons
 where flow_id in (100, 105)
   and flow_step_id = 321
   and upper(button_name) = 'BACK'
 order by flow_id;

exit
