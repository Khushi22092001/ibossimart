set define off
connect -name IMART

/*
   Detail-only correction: Summary remains a child of the Detail region, but
   takes its own full-width grid row after the interactive grid.  No page
   import and no static-file replacement is performed, so all existing page
   118 layout recovery behaviour is preserved.
*/
update apex_260100.wwv_flow_page_plugs
   set plug_new_grid_row            = 'Y',
       plug_new_grid_column         = 'Y',
       plug_display_column          = 1,
       plug_grid_column_span        = 12,
       plug_grid_column_css_classes = 'col-12'
 where flow_id = 105
   and page_id = 118
   and plug_name = 'Summary'
   and parent_plug_id = (
       select id
         from apex_260100.wwv_flow_page_plugs
        where flow_id = 105
          and page_id = 118
          and plug_name = 'Detail'
   );

prompt SUMMARY_REGIONS_UPDATED=&SQL%ROWCOUNT
commit;

set pagesize 100
set linesize 240
column region_name format a24
column static_id format a24
column parent_region_id format 99999999999999999999
column grid_column format 999
column grid_column_span format 999
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
