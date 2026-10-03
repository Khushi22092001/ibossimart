connect -name IMART
set sqlformat csv
set pagesize 50000
spool app105-source/verification/creator-column-metadata-20261003.csv
select table_name,column_name from all_tab_columns where owner='APEX_260100' and table_name in ('WWV_FLOW_WORKSHEET_COLUMNS','WWV_FLOW_WORKSHEET_RPTS','WWV_FLOW_REGION_COLUMNS','WWV_FLOW_IG_REPORT_COLUMNS','WWV_FLOW_REGION_REPORT_COLUMN') order by table_name,column_id;
spool off
exit
