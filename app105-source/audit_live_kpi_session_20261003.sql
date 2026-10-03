whenever sqlerror exit sql.sqlcode rollback
set define off
set pagesize 200
set linesize 240
set serveroutput on size unlimited
connect -name IMART

begin
  apex_session.attach(
    p_app_id => 105,
    p_page_id => 709,
    p_session_id => 25499780530358
  );
end;
/

select v('APP_PAGE_ID') app_page_id,
       v('APP_USER') app_user,
       v('P709_FROMDATE') p709_fromdate,
       v('P709_TODATE') p709_todate,
       v('P709_COMPANY') p709_company,
       v('P709_LOCATION') p709_location,
       v('P709_TODOLIST') p709_todolist,
       v('P709_NEXTPROCESS') p709_nextprocess
  from dual;

select imart_report_kpis.count_sql(439473576294649698) count_sql
  from dual;

declare
  l_count number;
begin
  execute immediate
    'select count(*) from (' || imart_report_kpis.report_sql(439473576294649698) || ')'
    into l_count;
  dbms_output.put_line('REPORT_SQL_COUNT=' || l_count);
end;
/

begin
  apex_session.detach;
end;
/

exit
