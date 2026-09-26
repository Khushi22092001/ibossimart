whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

select table_name, column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and column_name = 'DETAIL_LINK'
   and table_name like 'WWV_FLOW%'
 order by table_name;

exit
