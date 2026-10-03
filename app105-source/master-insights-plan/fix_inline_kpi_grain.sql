whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
alter table imart_mr_register add identity_column varchar2(128);
update imart_mr_register r set identity_column=(
select case when exists(select 1 from apex_260100.wwv_flow_worksheet_columns w where w.flow_id=105 and w.page_id=r.page_id and w.db_column_name=c.key_column) then c.key_column
when r.key_available>0 then c.code_column end
from imart_mr_catalog c where c.module_code=r.module_code);
commit;
@app105-source/master-insights-plan/register_kpis_package.sql
select name,line,text from user_errors where name='IMART_REGISTER_KPIS';
exit
