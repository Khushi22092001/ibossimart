connect -name IMART

set pagesize 200
set linesize 220
column region_name format a32
column static_id format a32

select region_id,
       parent_region_id,
       display_sequence,
       region_name,
       static_id
  from apex_application_page_regions
 where application_id = 105
   and page_id = 146
 order by display_sequence, region_id;

select procedure_name
  from all_procedures
 where object_name = 'WWV_FLOW_IMP_PAGE'
   and procedure_name like '%PAGE%PLUG%'
 order by procedure_name;

select column_name
  from all_tab_columns
 where table_name = 'WWV_FLOW_PAGE_PLUGS'
   and (column_name in ('ID','FLOW_ID','PARENT_PLUG_ID')
        or column_name like '%PAGE%'
        or column_name like '%STEP%')
 order by column_name;

exit
