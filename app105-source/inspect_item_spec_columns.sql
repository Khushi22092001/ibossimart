set pages 500 lines 300 feedback off heading on
connect -name IMART
select table_name, column_id, column_name, data_type
  from user_tab_columns
 where table_name in ('ITEMSPECIFICATION','ITEM','CCINVOICEDETAIL','SALESORDERDETAIL')
 order by table_name, column_id;
exit
