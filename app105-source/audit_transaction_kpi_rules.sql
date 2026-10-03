set define off
set long 200000
set linesize 200
set pagesize 1000
connect -name IMART
spool app105-source/transaction_kpi_rules.txt
select view_name,text from user_views where view_name in ('V_LATEST_PURCHASE_ORDERS','V_LATEST_ACTIVE_SALESORDERS');
select table_name,column_name,data_type from user_tab_columns where table_name in ('PURCHASEORDERDETAILINDENT','INDENTDETAIL','INDENT','V_LATEST_PURCHASE_ORDERS','PBPASSDETAIL','PURCHASEBILLDETAILGRN') order by table_name,column_id;
select name,text from user_source where name in ('APEX_GETPENDINGPOQUANTITY1','GETDOCUMENTSTATUSCODE') order by name,line;
select page_id,region_name,source_type,region_id from apex_application_page_regions where application_id=105 and page_id in (107,117,145,142,151,68) order by page_id,display_sequence;
spool off
exit
