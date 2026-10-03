whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlformat csv
set long 10000
connect -name IMART
spool app105-source/verification/transaction-seven-day-targets-20261003.csv
select f.flow_step_id page_id,s.name page_name,f.id from_item_id,f.name from_item,f.item_default from_default,f.item_default_type from_default_type,f.source_type from_source_type,f.use_cache_before_default from_cache,t.id to_item_id,t.name to_item,t.item_default to_default,t.item_default_type to_default_type,t.source_type to_source_type,t.use_cache_before_default to_cache,
 (select listagg(p.plug_name,', ') within group(order by p.id) from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id=s.id and p.plug_source_type in('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT')) report_regions
from apex_260100.wwv_flow_step_items f join apex_260100.wwv_flow_step_items t on t.flow_id=f.flow_id and t.flow_step_id=f.flow_step_id and regexp_like(t.name,'^P[0-9]+_TO_?DATE$') join apex_260100.wwv_flow_steps s on s.flow_id=f.flow_id and s.id=f.flow_step_id
where f.flow_id=105 and regexp_like(f.name,'^P[0-9]+_FROM_?DATE$')
and not regexp_like(s.name,'dashboard|analytics|insights|360|command centre|control tower|prototype|testing','i')
and exists(select 1 from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id=s.id and p.plug_source_type in('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT'))
and not exists(select 1 from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id=s.id and p.plug_source_type='NATIVE_FORM')
order by f.flow_step_id;
spool off
exit
