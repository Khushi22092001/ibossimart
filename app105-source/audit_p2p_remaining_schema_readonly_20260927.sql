whenever sqlerror exit sql.sqlcode rollback
set pagesize 800 linesize 260 feedback off verify off

select table_name,column_id,column_name,data_type
from user_tab_columns
where table_name in (
  'INDENT','INDENTDETAIL',
  'LOADINGADVICE','LOADINGADVICEDETAIL',
  'MATERIALIN','MATERIALINDETAIL',
  'GRN','GRNDETAIL',
  'PAYMENTADVICE','PAYMENTADVICEREFERENCE'
)
and (
  column_name in ('TNO','SNO','ITEMCODE','ITEMSPECIFICATIONCODE','QUANTITY1','QUANTITY2','RATE','RATEMEASURINGUNITCODE','AMOUNT','FOOTERAMOUNT','TOTALAMOUNT')
  or column_name like '%AMOUNT%'
  or column_name like '%QUANTITY%'
  or column_name like '%RATE%'
  or column_name like '%TOTAL%'
)
order by table_name,column_id;

exit
