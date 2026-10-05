whenever sqlerror exit sql.sqlcode rollback
set define off
set long 20000
set longchunksize 20000
set pagesize 200
set linesize 240
connect -name IMART

prompt === Page 167 date item defaults ===
select id, name, item_default, item_default_type, use_cache_before_default, format_mask
  from apex_260100.wwv_flow_step_items
 where flow_id = 105
   and flow_step_id = 167
   and name in ('P167_FROMDATE', 'P167_TODATE')
 order by name;

prompt === Page 167 pre-render date process ===
select id, process_name, process_point, process_sql_clob
  from apex_260100.wwv_flow_step_processing
 where flow_id = 105
   and flow_step_id = 167
   and dbms_lob.instr(process_sql_clob, 'P167_FROMDATE') > 0;

prompt === Material Out KPI source date binds ===
select page_id, region_id,
       case when dbms_lob.instr(source_sql, ':P167_FROMDATE') > 0 then 'YES' else 'NO' end uses_from_date,
       case when dbms_lob.instr(source_sql, ':P167_TODATE') > 0 then 'YES' else 'NO' end uses_to_date,
       grain_label, scope_note
  from imart_rkpi_config
 where page_id = 167
   and region_id = 512288033104679057;

exit
