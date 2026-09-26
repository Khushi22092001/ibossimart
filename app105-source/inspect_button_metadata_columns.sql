whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STEP_BUTTONS'
 order by column_id;

exit
