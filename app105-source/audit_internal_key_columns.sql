whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on pagesize 500 linesize 280 long 5000
connect -name IMART

prompt === Candidate APEX views ===
select view_name
  from all_views
 where owner = 'APEX_260100'
   and (view_name like '%PAGE%IG%COLUMN%' or view_name like '%REGION%COLUMN%')
 order by view_name;

prompt === Region column table metadata ===
select column_name
  from all_tab_columns
 where owner='APEX_260100'
   and table_name='WWV_FLOW_REGION_COLUMNS'
 order by column_id;

prompt === Public IG column view metadata ===
select table_name, column_name
  from all_tab_columns
 where owner='APEX_260100'
   and table_name in ('APEX_APPL_PAGE_IG_COLUMNS','APEX_APPL_PAGE_IG_RPT_COLUMNS')
 order by table_name, column_id;

exit
