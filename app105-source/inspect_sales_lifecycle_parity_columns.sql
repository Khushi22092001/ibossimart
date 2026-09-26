whenever sqlerror exit failure rollback
set define off
connect -name IMART
set pages 1000 lines 240 trimspool on
column table_name format a28
column column_name format a34
column data_type format a16

select table_name, column_id, column_name, data_type
  from user_tab_columns
 where table_name in (
   'PARTY','VOUCHER','VOUCHERDETAIL','DRCRALLOCATION',
   'MATERIALOUT','WEIGHMENT','DESPATCHADVICE',
   'CCINVOICE','CCINVOICEDETAIL','ITEM','ITEMCATEGORY',
   'SALESQUOTATION','SALESQUOTATIONDETAIL','SALESORDER','SALESORDERDETAIL'
 )
 order by table_name, column_id;

prompt === Credit coverage ===
select count(*) parties,
       count(case when nvl(creditamount,0) > 0 then 1 end) with_credit_amount,
       max(creditamount) max_credit_amount
  from party;

exit
