set pagesize 200
set linesize 240
set feedback on
connect -name IMART

select id,
       plug_name,
       plug_display_sequence,
       parent_plug_id,
       plug_new_grid,
       plug_new_grid_row,
       plug_grid_row_css_classes,
       plug_new_grid_column,
       plug_grid_column_span,
       plug_grid_column_css_classes,
       plug_display_point
 from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 143
   and plug_name in ('General', 'Party Details', 'Bill Details', 'Currency', 'Transaction And Nature', 'Purchase Bill Pass Reference', 'Purchase Order', 'Remark')
 order by plug_display_sequence, id;

exit
