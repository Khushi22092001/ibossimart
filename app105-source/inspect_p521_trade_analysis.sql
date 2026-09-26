set pages 200
set lines 260
set long 30000
connect -name IMART

select id, plug_name, static_id, parent_plug_id, plug_display_point,
       plug_display_sequence, plug_new_grid, plug_new_grid_row,
       plug_grid_column_span, plug_display_column,
       plug_source_type, region_css_classes, dbms_lob.getlength(plug_source) as source_length
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 521
 order by plug_display_sequence, id;

select id, item_name, item_label, item_plug_id, item_new_grid,
       item_new_grid_row, item_grid_column_span, item_display_column
  from apex_260100.wwv_flow_step_items
 where flow_id = 105
   and flow_step_id = 521
 order by item_sequence;

select dbms_lob.getlength(inline_css) as css_length,
       dbms_lob.substr(inline_css, 1000, greatest(1, dbms_lob.getlength(inline_css) - 999)) as css_tail
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 521
   and security_group_id = 4744311978888504;
exit
