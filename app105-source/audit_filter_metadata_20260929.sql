whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 1000
set linesize 250
connect -name IMART
select column_name from all_tab_columns where owner='APEX_260100' and table_name='WWV_FLOW_PAGE_PLUGS' and (column_name like '%CSS%' or column_name like '%SOURCE_TYPE%');
select id,page_id,plug_name,plug_source_type from apex_260100.wwv_flow_page_plugs where flow_id=105 and security_group_id=4744311978888504 and lower(trim(plug_name)) in ('filter','filters') order by page_id;
exit
