whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 100
set linesize 220
connect -name IMART

prompt === Package compilation ===
select count(*) package_errors
  from user_errors
 where name = 'IMART_REPORT_KPIS';

prompt === Coverage shell renderer ===
select count(*) total_shells,
       sum(case when dbms_lob.instr(plug_source, '<section hidden id="coverage-kpis-') = 0 then 1 else 0 end) visible_shells,
       sum(case when dbms_lob.instr(plug_source, 'data-page-items=') > 0 then 1 else 0 end) filter_bound_shells,
       sum(case when dbms_lob.instr(plug_source, 'payload.f01 = filters.names') > 0 then 1 else 0 end) explicit_value_shells
  from apex_260100.wwv_flow_page_plugs
 where flow_id = 105
   and static_id like 'coverage-kpi-shell-%';

prompt === Shared callback filter handoff ===
select count(*) callbacks,
       sum(case when dbms_lob.instr(process_sql_clob, 'apex_application.g_f01') > 0 then 1 else 0 end) validated_filter_callbacks
  from apex_260100.wwv_flow_processing
 where flow_id = 105
   and process_name = 'IMART_REPORT_KPIS';

prompt === Row grain configuration ===
select count(*) ready_regions,
       sum(case when grain_label = 'Rows in this report scope' then 1 else 0 end) row_grain_regions,
       sum(case when status_expression is not null then 1 else 0 end) status_regions,
       sum(case when recent_predicate is not null then 1 else 0 end) recent_regions,
       sum(case when mine_predicate is not null then 1 else 0 end) mine_regions,
       sum(case when status_expression is null and recent_predicate is null and mine_predicate is null then 1 else 0 end) source_specific_regions
  from imart_rkpi_config
 where state = 'READY';

prompt === PO Amendment process mapping ===
select page_id,
       region_id,
       case when status_expression like '%NOT AMENDED%' then 'YES' else 'NO' end has_not_amended,
       case when status_expression like '%POAMENDMENTTNO%' then 'YES' else 'NO' end uses_amendment_tno,
       case when recent_predicate is not null then 'YES' else 'NO' end has_recent,
       case when mine_predicate is not null then 'YES' else 'NO' end has_mine
  from imart_rkpi_config
 where page_id = 147
   and region_id = 500104838763311836;

exit
