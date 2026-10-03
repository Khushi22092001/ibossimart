whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
@app105-source/master-insights-plan/register_status_package.sql
select name,line,text from user_errors where name='IMART_REGISTER_KPIS';
exit
