whenever sqlerror exit failure rollback
set define off
connect -name IMART
set lines 220 pages 500
select column_name
  from all_tab_columns
 where owner='APEX_260100'
   and table_name='WWV_FLOW_STEP_ITEMS'
   and (column_name like '%GRID%' or column_name like '%SPAN%' or column_name like '%COL%' or column_name in ('NAME','FLOW_ID','FLOW_STEP_ID','CSIZE'))
 order by column_id;
exit
