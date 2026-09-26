set pagesize 200
set linesize 240
connect -name IMART

select table_name
  from user_tables
 where upper(table_name) like '%LOG%'
    or upper(table_name) like '%HISTORY%'
    or upper(table_name) like '%AUDIT%'
 order by table_name;

select owner, table_name, column_name
  from all_tab_columns
 where upper(table_name) = 'APEX_WORKSPACE_ACTIVITY_LOG'
   and owner like 'APEX%'
 order by owner, column_id;

exit
