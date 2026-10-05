set pagesize 200
set linesize 200
connect -name IMART

select owner, table_name, column_name, data_type
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name in ('WWV_FLOW_FILE_OBJECTS$','WWV_FLOW_FILE_OBJECTS','WWV_FLOW_FILES')
 order by table_name, column_id;

exit
