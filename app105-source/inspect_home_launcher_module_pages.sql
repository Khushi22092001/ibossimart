set pagesize 200
set linesize 220

select column_name
  from user_tab_columns
 where table_name = 'MODULE'
   and upper(column_name) like '%PAGENO%'
 order by column_id;

select modulecode,
       pageno,
       entrypageno
  from module
 where modulecode in ('INDENT','ENQUIRY','QUOTATION','COMPARATIVESTATEMENT','RATECONTRACT',
                      'PURCHASEORDER','POAMENDMENT','LOADINGADVICE','MATERIALIN','GRN',
                      'FREIGHTADVICE','PURCHASEBILL','PBPASS','PAYMENTADVICE','VOUCHER')
 order by modulecode;
