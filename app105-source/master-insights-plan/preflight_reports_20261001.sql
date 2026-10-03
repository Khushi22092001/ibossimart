whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlformat csv
set pagesize 50000
set linesize 32767
connect -name IMART
spool app105-source/master-insights-plan/reports_preflight_20261001.txt
select application_id, application_name, alias from apex_applications where application_id in (105,107);
select page_id,page_name, page_alias from apex_application_pages where application_id=105 and (page_id>=930 or upper(page_name) like '%MASTER%REPORT%');
select id,plug_name,plug_source_type,plug_template,plug_source from apex_260100.wwv_flow_page_plugs where flow_id=105 and page_id in (49,59,910,935,936) and plug_source_type in ('NATIVE_SQL_REPORT','NATIVE_IR','NATIVE_FORM');
select table_name,column_name from all_tab_columns where owner='APEX_260100' and table_name in ('WWV_FLOW_STEPS','WWV_FLOW_PAGE_PLUGS') and (column_name like '%SECUR%' or column_name like '%ROLE%' or column_name like '%TEMPLATE%');
select column_name from all_tab_columns where owner='APEX_260100' and table_name='WWV_FLOW_LIST_ITEMS' order by column_id;
select id,list_id,list_item_link_text,list_item_link_target,list_item_current_type,list_item_disp_cond_type,list_item_disp_condition,list_item_icon from apex_260100.wwv_flow_list_items where flow_id=105 and (lower(list_item_link_text) like '%business%' or lower(list_item_link_text) like '%dashboard%' or lower(list_item_link_text) like '%supplier%360%');
select table_name,column_name,data_type from user_tab_columns where table_name in ('BOSSUSER','MODULEPRIVILEGE','MODULE','PARTY','ITEM','LOCATION') order by table_name,column_id;
spool off
exit
