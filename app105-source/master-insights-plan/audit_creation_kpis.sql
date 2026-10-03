set define off
set sqlformat csv
set pagesize 1000
set long 100000
connect -name IMART
spool app105-source/master-insights-plan/creation_kpi_audit.txt
select r.page_id,r.module_code,c.table_name,c.changed_column,r.identity_column,r.query_sql from imart_mr_register r join imart_mr_catalog c on c.module_code=r.module_code order by r.page_id;
select table_name,column_name,data_type from user_tab_columns where table_name in (select upper(table_name) from imart_mr_catalog) and (upper(column_name) like '%CREAT%' or upper(column_name) like '%USER%' or upper(column_name) like '%DATE%' or upper(column_name) like '%TIME%') order by table_name,column_id;
select text from user_source where name='IMART_REGISTER_KPIS' order by type,line;
spool off
exit
