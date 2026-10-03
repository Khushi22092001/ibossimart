whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set heading on
set pagesize 0
set linesize 32767
set trimspool on
set sqlformat csv

connect -name IMART

spool app105-source/master-insights-plan/logistics_reservation_coverage.csv
select 'RESERVED_STOCK' metric,
       count(*) total_rows,
       sum(case when nvl(reservestockquantity1,0) <> 0 then 1 else 0 end) usable_rows,
       sum(case when storageLocationCode is not null then 1 else 0 end) linked_rows,
       min(reservestockdate) min_date,
       max(reservestockdate) max_date
  from reservestockstoragedetail
union all
select 'POD_DETAIL', count(*),
       sum(case when deliverydate is not null then 1 else 0 end),
       sum(case when lrentrytno is not null or lrtno is not null then 1 else 0 end),
       min(deliverydate), max(deliverydate)
  from poddetail
union all
select 'GRN_COMPANY_VEHICLE', count(*),
       sum(case when companyvehiclecode is not null then 1 else 0 end),
       sum(case when companyvehiclecode is not null and exists (
           select 1 from companyvehicle cv
            where cv.companyvehiclecode = g.companyvehiclecode) then 1 else 0 end),
       min(grndate), max(grndate)
  from grn g
union all
select 'GRN_VEHICLE_NUMBER_MATCH', count(*),
       sum(case when vehicleno is not null then 1 else 0 end),
       sum(case when vehicleno is not null and exists (
           select 1 from companyvehicle cv
            where upper(trim(cv.companyvehicleno)) = upper(trim(g.vehicleno))) then 1 else 0 end),
       min(grndate), max(grndate)
  from grn g
union all
select 'DESPATCH_VEHICLE_NUMBER_MATCH', count(*),
       sum(case when vehicleno is not null then 1 else 0 end),
       sum(case when vehicleno is not null and exists (
           select 1 from companyvehicle cv
            where upper(trim(cv.companyvehicleno)) = upper(trim(d.vehicleno))) then 1 else 0 end),
       min(despatchadvicedate), max(despatchadvicedate)
  from despatchadvice d
union all
select 'CCINVOICE_VEHICLE_NUMBER_MATCH', count(*),
       sum(case when vehicleno is not null then 1 else 0 end),
       sum(case when vehicleno is not null and exists (
           select 1 from companyvehicle cv
            where upper(trim(cv.companyvehicleno)) = upper(trim(c.vehicleno))) then 1 else 0 end),
       min(ccinvoicedate), max(ccinvoicedate)
  from ccinvoice c;
spool off

spool app105-source/master-insights-plan/logistics_table_columns.csv
select table_name, column_id, column_name, data_type, data_length
  from user_tab_columns
 where regexp_like(table_name, '(POD|LRENTRY|TRIPSHEET|TRANSPORTALLOCATION|VEHICLE)', 'i')
 order by table_name, column_id;
spool off

exit
