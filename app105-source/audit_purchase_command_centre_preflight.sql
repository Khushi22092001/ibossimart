set pagesize 50000
set linesize 320
set long 2000000
set longchunksize 2000000
set trimspool on
set feedback off
set verify off
connect -name IMART

prompt === TARGET PAGE AVAILABILITY ===
select page_id, page_name, page_alias
from apex_application_pages
where application_id = 105
  and page_id between 934 and 940
order by page_id;

prompt === CORE OBJECTS ===
select object_name, object_type, status
from user_objects
where upper(object_name) in (
  'PURCHASEORDER','PURCHASEORDERDETAIL','PURCHASEORDERCLOSE',
  'MATERIALIN','GRN','GRNDETAIL','PURCHASEBILL','PURCHASEBILLDETAIL',
  'PURCHASEBILLGRNDETAIL','PBPASS','VOUCHER','VOUCHERDETAIL',
  'ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','FREIGHTADVICE',
  'PARTY','ITEM','ITEMTREE','TRANSPORTER','PARTYCURRENTCLOSING'
)
order by object_name, object_type;

prompt === CORE COLUMNS ===
select table_name, column_id, column_name, data_type
from user_tab_columns
where table_name in (
  'PURCHASEORDER','PURCHASEORDERDETAIL','PURCHASEORDERCLOSE',
  'MATERIALIN','GRN','GRNDETAIL','PURCHASEBILL','PURCHASEBILLDETAIL',
  'PURCHASEBILLGRNDETAIL','PBPASS','VOUCHER','VOUCHERDETAIL',
  'ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','FREIGHTADVICE',
  'PARTY','ITEM','ITEMTREE','TRANSPORTER','PARTYCURRENTCLOSING'
)
order by table_name, column_id;

prompt === EXISTING REGISTER PAGES ===
select page_id, page_name, page_alias
from apex_application_pages
where application_id = 105
  and page_id in (15,27,36,37,72,73,75,172,178,497)
order by page_id;

exit
