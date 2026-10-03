whenever sqlerror exit sql.sqlcode rollback
set define off
set feedback off
set pagesize 1000
set linesize 250
connect -name IMART
set sqlformat csv
spool app105-source/verification/all-register-kpi-coverage-20261003.csv
select s.id page_id,s.name page_name,s.alias page_alias,p.id region_id,p.plug_name region_name,p.plug_source_type region_type,p.static_id,
case when exists(select 1 from apex_260100.wwv_flow_page_plugs k where k.flow_id=105 and k.page_id=s.id and (k.static_id like 'tx-kpi-shell-%' or k.static_id like 'mr-kpi-%' or k.plug_source like '%mr-register-kpis%')) then 'PRESENT' else 'MISSING' end kpi_coverage
from apex_260100.wwv_flow_steps s join apex_260100.wwv_flow_page_plugs p on p.flow_id=s.flow_id and p.page_id=s.id
where s.flow_id=105 and p.plug_source_type in ('NATIVE_IR','NATIVE_IG','NATIVE_SQL_REPORT')
and regexp_like(s.name,'register|list|master|report','i')
and not regexp_like(s.name,'dashboard|analytics|insights|360|command centre|control tower|prototype|testing','i')
order by s.id,p.plug_display_sequence;
spool off
set sqlformat default
select page_id,region_label from imart_tx_kpi_config order by page_id;
select count(*) master_registers from imart_mr_register;
select modulecode,pageno,entrypageno from module where pageno is not null order by pageno;
exit
