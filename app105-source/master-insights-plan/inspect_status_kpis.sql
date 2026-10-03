set sqlformat csv
set pagesize 1000
set long 10000
connect -name IMART
spool app105-source/master-insights-plan/status_metadata.txt
select r.page_id,c.master_name,w.db_column_name,w.column_label,w.display_text_as,w.column_html_expression from imart_mr_register r join imart_mr_catalog c on c.module_code=r.module_code join apex_260100.wwv_flow_worksheet_columns w on w.flow_id=105 and w.page_id=r.page_id where upper(w.db_column_name) like '%STATUS%' or (w.flow_id=105 and w.page_id=r.page_id and w.db_column_name in ('ACTIVE','ISACTIVE','IS_ACTIVE')) order by r.page_id,w.display_order;
select page_id,query_sql from imart_mr_register where page_id in (48,58,349,24);
spool off
exit
