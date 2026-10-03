set define off
set sqlformat csv
set long 100000
connect -name IMART
spool app105-source/verification/editable-kpi-safety-20261003.csv
select column_name from all_tab_columns where owner='APEX_260100' and table_name in('WWV_FLOW_STEP_PROCESSING','APEX_APPL_PAGE_IGS') and (column_name like '%REGION%' or column_name like '%PROCESS%' or column_name like '%TABLE%' or column_name like '%SOURCE%' or column_name like '%EDIT%') order by table_name,column_id;
select flow_step_id page_id,region_id,process_name,process_type,process_sql_clob from apex_260100.wwv_flow_step_processing where flow_id=105 and flow_step_id in(10,40,45,249,251,252,267,281,413,416,673) order by flow_step_id,process_sequence;
spool off
exit
