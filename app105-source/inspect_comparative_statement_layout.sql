set pages 300
set lines 260
connect -name IMART

select page_id, id, plug_name, static_id, parent_plug_id, plug_display_sequence,
       plug_new_grid, plug_new_grid_row, plug_grid_column_span, plug_display_column,
       plug_display_point, plug_source_type, region_css_classes, region_template_options
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id in (711, 712)
 order by page_id, plug_display_sequence, id;

exit
