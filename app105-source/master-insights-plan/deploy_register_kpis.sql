whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on
connect -name IMART
create table imart_mr_register as
select c.module_code,p.page_id,p.id region_id,p.plug_source query_sql,
 (select count(*) from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=p.page_id and w.db_column_name=c.code_column) key_available,
 (select count(*) from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=p.page_id and w.db_column_name=c.name_column) name_available,
 (select count(*) from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=p.page_id and w.db_column_name=c.changed_column) changed_available,
 cast(case when exists(select 1 from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=p.page_id and w.db_column_name=c.key_column) then c.key_column
 when exists(select 1 from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=p.page_id and w.db_column_name=c.code_column) then c.code_column end as varchar2(128)) identity_column
from imart_mr_catalog c join apex_260100.wwv_flow_page_plugs p on p.flow_id=105 and p.page_id=c.register_page
where p.plug_source_type='NATIVE_IR' and p.query_type='SQL'
and p.id=(select min(x.id) keep(dense_rank first order by x.plug_display_sequence,x.id) from apex_260100.wwv_flow_page_plugs x where x.flow_id=105 and x.page_id=p.page_id and x.plug_source_type='NATIVE_IR' and x.query_type='SQL');
@app105-source/master-insights-plan/register_kpis_package.sql
select name,line,text from user_errors where name='IMART_REGISTER_KPIS';
declare n number;
begin select count(*) into n from user_errors where name='IMART_REGISTER_KPIS'; if n>0 then raise_application_error(-20001,'KPI package invalid'); end if; end;
/
begin apex_application_install.set_application_id(105);apex_application_install.set_offset(0); end;
/
@app105-source/master-insights-plan/register_kpis_components.sql
update apex_260100.wwv_flow_page_plugs set plug_item_display_point='ABOVE' where flow_id=105 and page_id between 943 and 950 and static_id='mr-selection';
commit;
prompt INLINE_MASTER_KPIS_DEPLOYED
exit
