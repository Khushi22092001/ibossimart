set linesize 240
set pagesize 100
connect -name IMART

select id,
       region_name,
       static_id,
       parent_plug_id
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 152
 order by id;

prompt === Child region grid metadata ===
select id,
       static_id,
       plug_display_sequence,
       plug_new_grid,
       plug_new_grid_row,
       plug_new_grid_column,
       plug_display_column,
       plug_grid_column_span,
       plug_grid_row_css_classes,
       plug_grid_column_css_classes
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 152
   and parent_plug_id = 601994468342228812
 order by plug_display_sequence;

select dbms_lob.substr(inline_css, 4000, 1) as inline_css
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 152;

exit
