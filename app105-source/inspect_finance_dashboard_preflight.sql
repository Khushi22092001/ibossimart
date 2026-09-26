whenever sqlerror exit failure rollback
set define off
set pagesize 500
set linesize 240
set long 200000
set longchunksize 200000
connect -name IMART

prompt === dashboard and dependent pages currently in App 105 ===
select page_id, page_name, page_alias
  from apex_application_pages
 where application_id = 105
   and (upper(page_name) like '%RECEIV%'
     or upper(page_name) like '%PAYABLE%'
     or upper(page_name) like '%PROFIT%LOSS%'
     or upper(page_name) like '%TRIAL%BALANCE%'
     or upper(page_name) like '%OUTSTANDING%'
     or upper(page_name) like '%COLLECTION%'
     or upper(page_name) like '%ADVANCE%'
     or upper(page_name) like '%SETTLEMENT%'
     or upper(page_name) like '%CREDITOR%'
     or upper(page_name) like '%DEBTOR%')
 order by page_id;

prompt === relevant application tables and views ===
select object_type, object_name
  from user_objects
 where object_type in ('TABLE','VIEW')
   and object_name in (
     'DRCRALLOCATION','INVOICE','SERVICEBILL','ACCOUNTOPENING',
     'CREDITLIMITAPPROVAL','OPENGRIRCOST','PAYMENTADVICE',
     'PURCHASEBILL','PURCHASEORDER','JOBBILL','JOBORDER',
     'VOUCHER','VOUCHERDETAIL','PARTY','OPENING','FINANCIALYEAR',
     'COMPANY','LOCATION')
 order by object_name;

prompt === relevant columns ===
select table_name, column_id, column_name, data_type
  from user_tab_columns
 where table_name in (
     'DRCRALLOCATION','INVOICE','SERVICEBILL','ACCOUNTOPENING',
     'CREDITLIMITAPPROVAL','OPENGRIRCOST','PAYMENTADVICE',
     'PURCHASEBILL','PURCHASEORDER','JOBBILL','JOBORDER')
 order by table_name, column_id;

prompt === account roots and hierarchy availability ===
select partycode, partyname, parentcode, natureofaccountcode,
       partytypecode, partystatus, creditamount, creditdays
  from party
 where upper(partycode) in ('SUNDRYDEBTORS','SUNDRYCREDITORS','INCOME','EXPENDITURES','EXPENSES','ASSETS','LIABILITIES')
    or upper(replace(partyname,' ','')) in ('SUNDRYDEBTORS','SUNDRYCREDITORS')
 order by partycode;

prompt === module codes in ledger ===
select modulecode, count(*) line_count,
       min(voucherdate) first_date, max(voucherdate) last_date
  from voucherdetail
 group by modulecode
 order by line_count desc fetch first 40 rows only;

exit
