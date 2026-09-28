set pagesize 100
set linesize 240
connect -name IMART
column region_name format a24
column static_id format a24
column parent_region_id format 99999999999999999999
column grid_column format 999
column grid_column_span format 999
column start_new_row format a14

select region_name,
       static_id,
       parent_region_id,
       grid_column,
       grid_column_span
  from apex_application_page_regions
 where application_id = 105
   and page_id = 118
   and region_name in ('Detail', 'Summary')
 order by region_name;
