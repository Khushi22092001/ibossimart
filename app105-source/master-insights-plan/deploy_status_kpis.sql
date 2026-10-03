whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
create table imart_mr_status_backup as select p.id,p.plug_source,p.static_id from apex_260100.wwv_flow_page_plugs p where p.flow_id=105 and (p.id in (select region_id from imart_mr_register) or p.static_id like 'mr-kpi-shell-%');
alter table imart_mr_register add (status_expression varchar2(4000),region_static_id varchar2(255));
update imart_mr_register r set region_static_id=(select nvl(p.static_id,'R'||p.id) from apex_260100.wwv_flow_page_plugs p where p.id=r.region_id),
 status_expression=case
 when page_id=58 then 'mr_source.STATUS'
 when exists(select 1 from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=r.page_id and w.db_column_name='TNO') then
 '(select ds.documentstatuscode from documentstatusdetail ds where ds.modulecode='''||replace(r.module_code,'''','''''')||''' and ds.moduletno=mr_source.TNO fetch first 1 row only)'
 end;
commit;
@app105-source/master-insights-plan/register_status_package.sql
declare n number;begin select count(*) into n from user_errors where name='IMART_REGISTER_KPIS';if n>0 then raise_application_error(-20001,'Status KPI package invalid');end if;end;
/
select name,line,text from user_errors where name='IMART_REGISTER_KPIS';
exit
