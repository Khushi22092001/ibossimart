whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/core_table_columns.csv
select table_name,
       column_id,
       column_name,
       data_type,
       data_length,
       data_precision,
       data_scale,
       nullable
  from user_tab_columns
 where table_name in (
       'PARTY','PARTYTYPE','VENDOR','ITEM','ITEMTYPE','ITEMCATEGORY',
       'ITEMSPECIFICATION','ITEMSPECIFICATIONDETAIL','MEASURINGUNIT',
       'LOCATION','STORAGELOCATION','COMPANYVEHICLE','VEHICLETYPE',
       'EMPLOYEE','DEPARTMENT','DESIGNATION','COSTCENTRE','PRODUCTIONCENTRE',
       'PURCHASEORDER','PURCHASEORDERDETAIL','GRN','GRNDETAIL',
       'PURCHASEBILL','PURCHASEBILLDETAIL','PBPASS','PBPASSDETAIL',
       'MATERIALIN','MATERIALINDETAIL','INDENT','INDENTDETAIL',
       'SALESORDER','SALESORDERDETAIL','DESPATCHADVICE','DESPATCHADVICEDETAIL',
       'MATERIALOUT','MATERIALOUTDETAIL','CCINVOICE','CCINVOICEDETAIL',
       'SALESQUOTATION','SALESQUOTATIONDETAIL','SALESENQUIRY','SALESENQUIRYDETAIL',
       'VOUCHER','VOUCHERDETAIL','PENDINGBILLS',
       'FREIGHTADVICE','FREIGHTADVICEDETAIL','LOADINGADVICE','LOADINGADVICEDETAIL',
       'WEIGHMENT','ASSET','ASSETCATEGORY','ASSETTRANSFER','ASSETTRANSFERDETAIL'
   )
 order by table_name, column_id;
spool off

spool app105-source/master-insights-plan/core_constraints.csv
select c.table_name,
       c.constraint_name,
       c.constraint_type,
       cc.position,
       cc.column_name,
       c.r_constraint_name,
       rc.table_name referenced_table,
       rcc.column_name referenced_column,
       c.status
  from user_constraints c
  join user_cons_columns cc
    on cc.constraint_name = c.constraint_name
   and cc.table_name = c.table_name
  left join user_constraints rc
    on rc.constraint_name = c.r_constraint_name
  left join user_cons_columns rcc
    on rcc.constraint_name = rc.constraint_name
   and rcc.position = cc.position
 where c.table_name in (
       'PARTY','VENDOR','ITEM','ITEMTYPE','ITEMCATEGORY','MEASURINGUNIT',
       'LOCATION','STORAGELOCATION','COMPANYVEHICLE','EMPLOYEE','COSTCENTRE',
       'PURCHASEORDER','PURCHASEORDERDETAIL','GRN','GRNDETAIL',
       'PURCHASEBILL','PURCHASEBILLDETAIL','PBPASS','PBPASSDETAIL',
       'MATERIALIN','MATERIALINDETAIL','SALESORDER','SALESORDERDETAIL',
       'DESPATCHADVICE','DESPATCHADVICEDETAIL','MATERIALOUT','MATERIALOUTDETAIL',
       'CCINVOICE','CCINVOICEDETAIL','VOUCHER','VOUCHERDETAIL',
       'FREIGHTADVICE','FREIGHTADVICEDETAIL','LOADINGADVICE','LOADINGADVICEDETAIL'
   )
   and c.constraint_type in ('P','U','R')
 order by c.table_name, c.constraint_type, c.constraint_name, cc.position;
spool off

spool app105-source/master-insights-plan/party_type_usage.csv
select pt.partytypecode,
       pt.partytypename,
       count(p.tno) party_count
  from partytype pt
  left join party p
    on p.partytypecode = pt.partytypecode
 group by pt.partytypecode, pt.partytypename
 order by pt.partytypename, pt.partytypecode;
spool off

spool app105-source/master-insights-plan/core_object_candidates.csv
select object_type, object_name, status
  from user_objects
 where object_type in ('VIEW','MATERIALIZED VIEW','FUNCTION','PACKAGE','PROCEDURE')
   and regexp_like(object_name,
       '(STOCK|OUTSTAND|OVERDUE|PENDING|PURCHASE|SALE|FREIGHT|DELIVERY|RECEIV|PAYABLE|LEDGER|BALANCE)',
       'i')
 order by object_type, object_name;
spool off

exit
