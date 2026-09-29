whenever sqlerror exit sql.sqlcode rollback
set serveroutput on
connect -name IMART

select column_name
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name = 'WWV_FLOW_STEPS'
   and column_name like '%CSS%'
 order by column_name;

exit
