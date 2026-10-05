whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 1000
set linesize 360
set long 50000
set longchunksize 50000
connect -name IMART

prompt === O2C KPI CONFIG EXPRESSIONS ===
select page_id,region_id,region_label,grain_label,key_expression,status_expression,process_expression
  from imart_rkpi_config
 where page_id in(154,160,170,174,190,273,701,704)
 order by page_id;

prompt === O2C REPORT SOURCE SQL ===
select page_id,region_id,dbms_lob.substr(source_sql,3900,1) source_sql
  from imart_rkpi_config
 where page_id in(154,160,170,174,190,273,701,704)
 order by page_id;

prompt === O2C LINK / STATUS COLUMNS ===
select table_name,column_id,column_name,data_type
  from user_tab_columns
 where table_name in(
   'SALESENQUIRY','SALESENQUIRYDETAIL',
   'SALESQUOTATION','SALESQUOTATIONDETAIL',
   'PORECEIPT','PORECEIPTDETAIL',
   'SALESORDER','SALESORDERDETAIL',
   'LOADINGADVICE','LOADINGADVICEDETAIL',
   'DESPATCHADVICE','DESPATCHADVICEDETAIL',
   'CCINVOICE','CCINVOICEDETAIL',
   'BILLRECEIPT','BILLRECEIPTDETAIL')
   and (
     column_name='TNO'
     or column_name like '%STATUS%'
     or column_name like '%TNO%'
     or column_name like '%NO'
     or column_name like '%DATE'
     or column_name like '%QUANTITY%'
   )
 order by table_name,column_id;

prompt === O2C DOCUMENT STATUS DISTRIBUTION ===
select module_name,status_code,count(*) documents
  from(
    select 'SALESENQUIRY' module_name,nvl(getdocumentstatuscode('SALESENQUIRY',tno),'NONACTIVE') status_code from salesenquiry
    union all select 'SALESQUOTATION',nvl(getdocumentstatuscode('SALESQUOTATION',tno),'NONACTIVE') from salesquotation
    union all select 'PORECEIPT',nvl(getdocumentstatuscode('PORECEIPT',tno),'NONACTIVE') from poreceipt
    union all select 'SALESORDER',nvl(getdocumentstatuscode('SALESORDER',tno),'NONACTIVE') from salesorder
    union all select 'LOADINGADVICE',nvl(getdocumentstatuscode('LOADINGADVICE',tno),'NONACTIVE') from loadingadvice
    union all select 'DESPATCHADVICE',nvl(getdocumentstatuscode('DESPATCHADVICE',tno),'NONACTIVE') from despatchadvice
    union all select 'CCINVOICE',nvl(getdocumentstatuscode('CCINVOICE',tno),'NONACTIVE') from ccinvoice
    union all select 'BILLRECEIPT',nvl(getdocumentstatuscode('BILLRECEIPT',tno),'NONACTIVE') from billreceipt
  )
 group by module_name,status_code
 order by module_name,status_code;

exit
