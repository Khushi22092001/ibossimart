whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

select owner, table_name, column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name in ('WWV_FLOW_STEP_ITEMS', 'APEX_APPLICATION_PAGE_ITEMS')
   and (column_name like '%WIDTH%' or column_name like '%SIZE%')
 order by table_name, column_name;

exit
