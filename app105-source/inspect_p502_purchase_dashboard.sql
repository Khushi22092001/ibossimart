set pages 300
set lines 260
connect -name IMART

select id, plug_name, static_id, parent_plug_id, plug_display_point,
       plug_display_sequence, plug_new_grid, plug_new_grid_row,
       plug_grid_column_span, plug_display_column, plug_source_type,
       region_css_classes
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 502
 order by plug_display_sequence, id;

select dbms_lob.getlength(inline_css) as css_length
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 502
   and security_group_id = 4744311978888504;
exit
