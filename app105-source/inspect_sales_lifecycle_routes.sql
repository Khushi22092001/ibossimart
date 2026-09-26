set pagesize 500 linesize 320 trimspool on
connect -name IMART

column page_name format a48
column page_alias format a42
select page_id, page_name, page_alias, page_mode
from apex_application_pages
where application_id = 105
  and (
       upper(page_name) like '%SALES%'
    or upper(page_name) like '%CUSTOMER%'
    or upper(page_name) like '%VEHICLE%'
    or upper(page_name) like '%CATEGORY%'
    or upper(page_name) like '%DISPATCH%'
    or upper(page_name) like '%DESPATCH%'
    or upper(page_name) like '%WEIGH%'
    or upper(page_name) like '%MATERIAL OUT%'
    or upper(page_name) like '%INVOICE%'
    or upper(page_name) like '%OUTSTANDING%'
    or upper(page_name) like '%COLLECTION%'
    or upper(page_name) like '%ITEM%ANAL%'
    or upper(page_name) like '%PARTY%ANAL%'
  )
order by page_id;

prompt === RESERVED RANGE CHECK ===
select page_id, page_name, page_alias
from apex_application_pages
where application_id = 105
  and page_id between 720 and 740
order by page_id;

prompt === TABLE COLUMNS ===
select table_name, column_id, column_name, data_type
from user_tab_columns
where table_name in (
  'SALESENQUIRY','SALESENQUIRYDETAIL','SALESQUOTATION','SALESQUOTATIONDETAIL',
  'PORECEIPT','SALESORDER','SALESORDERDETAIL','DESPATCHADVICE','DESPATCHADVICEDETAIL',
  'MATERIALOUT','WEIGHMENT','CCINVOICE','CCINVOICEDETAIL','EINVOICE','ITEM','ITEMCATEGORY','PARTY'
)
order by table_name, column_id;

exit
