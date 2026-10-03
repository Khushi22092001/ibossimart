set sqlformat csv
set pagesize 2000
set long 20000
connect -name IMART
spool app105-source/master-insights-plan/document_status_metadata.txt
select text from user_source where name='GETDOCUMENTSTATUSCODE' order by line;
select r.page_id,c.module_code,c.key_column,r.identity_column,(select count(*) from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=r.page_id and w.db_column_name='TNO') has_tno from imart_mr_register r join imart_mr_catalog c on c.module_code=r.module_code order by r.page_id;
select column_name,data_type from user_tab_columns where table_name='DOCUMENTSTATUS' order by column_id;
spool off
exit
