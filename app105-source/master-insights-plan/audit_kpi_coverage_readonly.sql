whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/kpi_data_coverage.csv
select 'AP_PENDING_BILLS' metric,
       count(*) total_rows,
       sum(case when balanceamount <> 0 then 1 else 0 end) usable_rows,
       sum(case when duedate is null then 1 else 0 end) missing_context_rows,
       min(invoicedate) min_recorded_date,
       max(invoicedate) max_recorded_date
  from pendingbills
union all
select 'AR_RECEIVABLE', count(*),
       sum(case when totalbalance <> 0 then 1 else 0 end),
       sum(case when p.creditdays is null then 1 else 0 end),
       min(r.voucherdate), max(r.voucherdate)
  from bi_receivable r
  left join party p on p.partycode = r.accountcode
union all
select 'PO_SUPPLIER_LINK', count(*),
       sum(case when partycode is not null then 1 else 0 end),
       sum(case when deliverydate is null then 1 else 0 end),
       min(purchaseorderdate), max(purchaseorderdate)
  from purchaseorder
union all
select 'PO_GRN_LINK', count(*),
       sum(case when purchaseordertno is not null then 1 else 0 end),
       sum(case when purchaseordertno is null then 1 else 0 end),
       min(grndate), max(grndate)
  from grn
union all
select 'SO_CUSTOMER_LINK', count(*),
       sum(case when partycode is not null then 1 else 0 end),
       sum(case when deliverydate is null then 1 else 0 end),
       min(salesorderdate), max(salesorderdate)
  from salesorder
union all
select 'SO_DISPATCH_LINK', count(*),
       sum(case when salesordertno is not null or referencetno is not null then 1 else 0 end),
       sum(case when salesordertno is null and referencetno is null then 1 else 0 end),
       min(despatchadvicedate), max(despatchadvicedate)
  from despatchadvice
union all
select 'STOCK_RATE_COVERAGE', count(*),
       sum(case when rate is not null then 1 else 0 end),
       sum(case when rate is null then 1 else 0 end),
       min(stockdate), max(stockdate)
  from stock
union all
select 'STOCK_STORAGE_COVERAGE', count(*),
       sum(case when exists (select 1 from stockstoragedetail sd where sd.tno = s.tno) then 1 else 0 end),
       sum(case when not exists (select 1 from stockstoragedetail sd where sd.tno = s.tno) then 1 else 0 end),
       min(stockdate), max(stockdate)
  from stock s
union all
select 'TRANSPORTER_GRN', count(*),
       sum(case when transportercode is not null then 1 else 0 end),
       sum(case when transportercode is null then 1 else 0 end),
       min(grndate), max(grndate)
  from grn
union all
select 'TRANSPORTER_DESPATCH', count(*),
       sum(case when transportercode is not null then 1 else 0 end),
       sum(case when transportercode is null then 1 else 0 end),
       min(despatchadvicedate), max(despatchadvicedate)
  from despatchadvice
union all
select 'VEHICLE_WEIGHMENT', count(*),
       sum(case when companyvehiclecode is not null or vehicleno is not null then 1 else 0 end),
       sum(case when companyvehiclecode is null and vehicleno is null then 1 else 0 end),
       min(weighmentdate), max(weighmentdate)
  from weighment;
spool off

spool app105-source/master-insights-plan/reservation_logistics_objects.csv
select table_name,
       column_name,
       data_type,
       data_length
  from user_tab_columns
 where regexp_like(table_name || ' ' || column_name,
       '(RESERV|POD|GPS|TRIP|DETAIN|DELIVERY|VEHICLE|STORAGE)', 'i')
   and (table_name like '%RESERV%'
        or table_name like '%POD%'
        or table_name like '%GPS%'
        or table_name like '%TRIP%'
        or table_name in ('ITEM','LOCATION','STORAGELOCATION','COMPANYVEHICLE',
                          'PURCHASEORDER','GRN','WEIGHMENT','SALESORDER',
                          'DESPATCHADVICE','CCINVOICE','FREIGHTADVICE'))
 order by table_name, column_id;
spool off

spool app105-source/master-insights-plan/core_index_columns.csv
select ic.table_name,
       ic.index_name,
       i.uniqueness,
       ic.column_position,
       ic.column_name
  from user_ind_columns ic
  join user_indexes i
    on i.index_name = ic.index_name
 where ic.table_name in (
       'PARTY','ITEM','ITEMTYPE','ITEMCATEGORY','LOCATION','STORAGELOCATION',
       'COMPANYVEHICLE','EMPLOYEE','PURCHASEORDER','PURCHASEORDERDETAIL',
       'GRN','GRNDETAIL','PURCHASEBILL','PURCHASEBILLDETAIL','PBPASS',
       'PBPASSDETAIL','SALESORDER','SALESORDERDETAIL','DESPATCHADVICE',
       'DESPATCHADVICEDETAIL','CCINVOICE','CCINVOICEDETAIL','STOCK',
       'USEDSTOCK','STOCKSTORAGEDETAIL','VOUCHER','VOUCHERDETAIL',
       'DRCRALLOCATION','FREIGHTADVICE','FREIGHTADVICEDETAIL','WEIGHMENT'
   )
 order by ic.table_name, ic.index_name, ic.column_position;
spool off

exit
