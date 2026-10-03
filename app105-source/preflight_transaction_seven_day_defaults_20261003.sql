whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlformat csv
connect -name IMART
spool app105-source/verification/transaction-seven-day-approved-scope-20261003.csv
select f.flow_step_id page_id,s.name page_name,f.id from_item_id,f.name from_item,t.id to_item_id,t.name to_item,f.item_default old_from,t.item_default old_to,f.use_cache_before_default from_cache,t.use_cache_before_default to_cache
from apex_260100.wwv_flow_step_items f join apex_260100.wwv_flow_step_items t on t.flow_id=f.flow_id and t.flow_step_id=f.flow_step_id and regexp_like(t.name,'^P[0-9]+_TO_?DATE$') join apex_260100.wwv_flow_steps s on s.flow_id=f.flow_id and s.id=f.flow_step_id
where f.flow_id=105 and regexp_like(f.name,'^P[0-9]+_FROM_?DATE$') and s.id<800
and (regexp_like(s.name,'(register|list)','i') or s.id in(180,182,186,190,241,280,283,309,314,333,343,345,671))
and not regexp_like(s.name,'dashboard|analytics|insights|360|command centre|control tower|prototype|testing|fixed asset register|depreciation register','i')
and f.source_type='ALWAYS_NULL' and t.source_type='ALWAYS_NULL'
and not exists(select 1 from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id=s.id and (p.plug_source_type='NATIVE_FORM' or p.static_id like 'mr-kpi-shell-%'))
and exists(select 1 from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and p.page_id=s.id and p.plug_source_type in('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT') and instr(upper(p.plug_source),':'||f.name)>0 and instr(upper(p.plug_source),':'||t.name)>0)
order by s.id;
spool off
exit
