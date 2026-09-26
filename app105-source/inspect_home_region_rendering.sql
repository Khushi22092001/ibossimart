set pages 100
set lines 240
select page_id, plug_name, static_id, plug_display_point, plug_display_sequence,
       plug_source_type, plug_template, region_css_classes,
       dbms_lob.getlength(plug_source) as source_length
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and ((page_id = 1 and static_id = 'iron-mart') or (page_id = 6 and plug_name = 'Button Bar'));

select id, step_template, step_title, dbms_lob.getlength(inline_css) as css_length
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 1;
exit
