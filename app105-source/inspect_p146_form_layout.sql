set pagesize 200
set linesize 320
connect -name IMART

column region_name format a24
column item_name format a32
column display_as format a26
column begins_on_new_row format a16
column grid_column format 999
column grid_column_span format 999
column grid_column_css_classes format a20

prompt === GRN section regions ===
select region_name,
       grid_column,
       grid_column_span
  from apex_application_page_regions
 where application_id = 105
   and page_id = 146
   and region_name in ('General', 'Select No', 'Reference', 'Transportation Info', 'Under Signed')
 order by display_sequence, region_id;

prompt === Visible form items in GRN sections ===
select r.region_name,
       i.item_name,
       i.display_as,
       i.grid_column,
       i.grid_column_span,
       i.begins_on_new_row,
       i.grid_column_css_classes
  from apex_application_page_items i
  join apex_application_page_regions r
    on r.application_id = i.application_id
   and r.page_id = i.page_id
   and r.region_id = i.region_id
 where i.application_id = 105
   and i.page_id = 146
   and r.region_name in ('General', 'Select No', 'Reference', 'Transportation Info', 'Under Signed')
   and i.display_as not like '%HIDDEN%'
 order by r.display_sequence, i.display_sequence, i.item_name;
