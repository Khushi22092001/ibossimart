set pagesize 200 linesize 260 trimspool on
connect -name IMART
select table_name, listagg(column_name, ', ') within group(order by column_id) columns
from user_tab_columns
where table_name in ('DESPATCHADVICE','MATERIALOUT','EINVOICE','ITEM','ITEMCATEGORY','PARTY','PORECEIPT')
group by table_name
order by table_name;
exit
