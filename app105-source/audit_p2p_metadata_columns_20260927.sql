whenever sqlerror exit sql.sqlcode rollback
set pagesize 300 linesize 240 feedback off verify off

select table_name, column_name, data_type
from all_tab_columns
where owner='APEX_260100'
  and table_name in ('WWV_FLOW_PAGE_DA_ACTIONS','WWV_FLOW_STEP_DA_ACTIONS','WWV_FLOW_PAGE_DA_EVENTS','WWV_FLOW_REGION_COLUMNS','WWV_FLOW_PAGE_PLUGS')
order by table_name, column_id;

exit
