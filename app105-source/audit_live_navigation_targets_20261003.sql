whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlformat csv
set feedback off
set pagesize 1000
connect -name IMART
spool app105-source/verification/live-navigation-targets-20261003.csv
select s.id page_id,s.name,s.alias,p.id region_id,p.plug_name,p.plug_source_type,p.query_type,p.static_id,
(select count(*) from apex_260100.wwv_flow_page_plugs k where k.flow_id=105 and k.page_id=s.id and (k.static_id like 'tx-kpi-shell-%' or k.static_id like 'mr-kpi-shell-%' or k.static_id like 'coverage-kpi-shell-%')) kpi_regions
from apex_260100.wwv_flow_steps s join apex_260100.wwv_flow_page_plugs p on p.flow_id=s.flow_id and p.page_id=s.id
where s.flow_id=105 and p.plug_source_type in('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT') and regexp_like(s.name,'register|list|report','i')
and not regexp_like(s.name,'dashboard|analytics|insights|360|command centre|control tower|prototype|testing','i')
order by s.id;
spool off
exit
