set pagesize 500 linesize 240 trimspool on feedback off verify off

prompt === DETAIL TABLE COLUMNS ===
select table_name, column_id, column_name, data_type
from user_tab_columns
where table_name in (
  'PURCHASEORDERDETAIL','PURCHASEORDERDETAILFOOTER',
  'PURCHASEBILLDETAIL','PURCHASEBILLDETAILFOOTER',
  'PBPASSDETAIL','PBPASSDETAILFOOTER',
  'PAYMENTADVICEREFERENCE','INDENTDETAIL','LOADINGADVICEDETAIL',
  'MATERIALINDETAIL','GRNDETAIL'
)
and column_name in (
  'TNO','SNO','ITEMCODE','ITEMSPECIFICATIONCODE','QUANTITY1','QUANTITY2',
  'RATE','RATEMEASURINGUNITCODE','WITHOUTDISCOUNTRATE','DISCOUNTPERCENTAGE',
  'DISCOUNTRATE','RATEAFTERDISCOUNT','AMOUNT','FOOTERAMOUNT','TOTALAMOUNT',
  'FOOTERVALUE','AMOUNTENTERED','TDSDEDUCTABLEAMOUNT','TOTALAMOUNTENTERED'
)
order by table_name, column_id;

prompt === RECONCILIATION / CALC PACKAGES ===
select object_name, object_type, status
from user_objects
where object_name like '%PURCHASE%CALC%'
   or object_name like '%PBPASS%CALC%'
   or object_name like '%PAYMENT%CALC%'
order by object_name, object_type;

prompt === PURCHASE BILL CALC SOURCE ===
select line, text
from user_source
where name = 'IMART_PURCHASEBILL_CALC'
order by type, line;

prompt === DETAIL / FOOTER ROW COUNTS ===
select 'PURCHASEORDERDETAIL' table_name, count(*) rows_count from purchaseorderdetail
union all select 'PURCHASEORDERDETAILFOOTER', count(*) from purchaseorderdetailfooter
union all select 'PURCHASEBILLDETAIL', count(*) from purchasebilldetail
union all select 'PURCHASEBILLDETAILFOOTER', count(*) from purchasebilldetailfooter
union all select 'PBPASSDETAIL', count(*) from pbpassdetail
union all select 'PBPASSDETAILFOOTER', count(*) from pbpassdetailfooter;

exit
