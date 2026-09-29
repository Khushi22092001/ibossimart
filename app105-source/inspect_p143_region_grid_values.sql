set pagesize 200
set linesize 220
connect -name IMART

select id,
       region_name,
       parent_plug_id,
       plug_display_sequence,
       plug_new_grid,
       plug_new_grid_row,
       plug_new_grid_column,
       plug_display_column,
       plug_grid_column_span
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and page_id = 143
 order by parent_plug_id nulls first, plug_display_sequence;

select constraint_name, search_condition_vc
  from all_constraints
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_PAGE_PLUGS'
   and constraint_name = 'WWV_PLUG_NEW_GRID_COLUMN';

select plug_display_column, count(*) as region_count
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and plug_display_column is not null
 group by plug_display_column
 order by plug_display_column;

exit
