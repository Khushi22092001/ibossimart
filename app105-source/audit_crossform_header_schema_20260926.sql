set pagesize 500 linesize 220 trimspool on feedback off verify off
select table_name, column_id, column_name, data_type
from user_tab_columns
where table_name in ('PURCHASEORDER','PURCHASEBILL','PBPASS','PAYMENTADVICE')
  and (column_name like '%AMOUNT%' or column_name in ('TNO','TAXINROUND'))
order by table_name, column_id;
exit
