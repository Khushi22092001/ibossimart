set pages 200
set lines 260
set long 50000
connect -name IMART

select id, plug_name, static_id, plug_display_point, plug_display_sequence,
       plug_source_type, region_css_classes, region_template_options,
       component_template_options, dbms_lob.getlength(plug_source) as source_length
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 500
 order by plug_display_sequence, id;

select id, button_name, button_static_id, button_action, button_position,
       button_template_options
  from apex_260100.wwv_flow_step_buttons
 where flow_id = 105
   and flow_step_id = 500
 order by button_sequence;

select id, da_name, event_name, event_result, when_type, executing_when_value
  from apex_260100.wwv_flow_page_da_events
 where flow_id = 105
   and page_id = 500
 order by execution_sequence;

select id, step_title, dbms_lob.getlength(inline_css) as css_length
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 500;
exit
