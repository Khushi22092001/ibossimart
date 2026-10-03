whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set long 1000000
set linesize 250
set pagesize 1000
connect -name IMART
spool app105-source/grn_kpi_performance_before.txt
select page_id,source_sql,classifier_sql from imart_tx_kpi_config where page_id=145;
select name,text from user_source where name in ('GETDOCUMENTSTATUSCODE','GETDINSPECTIONNO') order by name,line;
select table_name,num_rows,last_analyzed from user_tables where table_name in ('GRN','GRNDETAIL','PURCHASEBILL','PURCHASEBILLGRNDETAIL','DOCUMENTSTATUSDETAIL');
select table_name,index_name,column_name,column_position from user_ind_columns where table_name in ('GRNDETAIL','PURCHASEBILLGRNDETAIL','DOCUMENTSTATUSDETAIL') order by table_name,index_name,column_position;
select name,text from user_source where name='IMART_TRANSACTION_KPIS' and type='PACKAGE BODY' order by line;
spool off
exit
