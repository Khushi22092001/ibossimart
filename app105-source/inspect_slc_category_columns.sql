set pages 200 lines 220
connect -name IMART
select table_name, column_id, column_name
from user_tab_columns
where table_name in ('SALESQUOTATIONDETAIL','SALESORDERDETAIL')
  and (column_name like '%CATEG%' or column_name like '%ITEM%' or column_name='TNO')
order by table_name,column_id;
exit
