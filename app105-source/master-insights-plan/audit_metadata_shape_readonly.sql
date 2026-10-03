whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/apex_metadata_columns.csv
select table_name,
       column_id,
       column_name,
       data_type,
       data_length
  from all_tab_columns
 where owner = 'APEX_260100'
   and table_name in (
       'WWV_FLOW_STEPS',
       'WWV_FLOW_PAGE_PLUGS',
       'WWV_FLOW_STEP_ITEMS',
       'WWV_FLOW_STEP_PROCESSING',
       'WWV_FLOW_STEP_BUTTONS',
       'WWV_FLOW_PAGE_BRANCHES',
       'WWV_FLOW_LISTS',
       'WWV_FLOW_LIST_ITEMS'
   )
 order by table_name, column_id;
spool off

spool app105-source/master-insights-plan/application_identity.csv
select user as connected_schema,
       sys_context('USERENV', 'CURRENT_SCHEMA') as current_schema,
       105 as application_id
  from dual;
spool off

spool app105-source/master-insights-plan/module_columns.csv
select column_id,
       column_name,
       data_type,
       data_length
  from user_tab_columns
 where table_name = 'MODULE'
 order by column_id;
spool off

exit
