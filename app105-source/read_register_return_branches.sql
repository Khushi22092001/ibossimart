whenever sqlerror exit sql.sqlcode rollback
set pagesize 200
set linesize 240
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STEP_BRANCHES'
 order by column_id;

exit
