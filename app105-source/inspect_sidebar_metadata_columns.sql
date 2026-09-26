whenever sqlerror exit sql.sqlcode rollback
set define off
set pages 1000
set lines 300
connect -name IMART
select table_name, column_id, column_name, data_type
  from all_tab_columns
 where owner='APEX_260100'
   and table_name in ('WWV_FLOW_PAGE_DA_EVENTS','WWV_FLOW_PAGE_DA_ACTIONS','WWV_FLOW_STEP_PROCESSING')
 order by table_name, column_id;
exit
