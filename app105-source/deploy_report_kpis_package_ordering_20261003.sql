whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
set pagesize 200
set linesize 240
connect -name IMART

@app105-source/report_kpis_package_20261003.sql

declare
  l_sql clob;
  l_cursor integer;
begin
  l_sql:=imart_report_kpis.count_sql(416786540566841742);
  l_cursor:=dbms_sql.open_cursor;
  dbms_sql.parse(l_cursor,l_sql,dbms_sql.native);
  dbms_sql.close_cursor(l_cursor);
  dbms_output.put_line('PAGE_707_COUNT_SQL_PARSE=OK');
exception
  when others then
    if l_cursor is not null and dbms_sql.is_open(l_cursor) then
      dbms_sql.close_cursor(l_cursor);
    end if;
    raise;
end;
/

select count(*) package_errors
  from user_errors
 where name='IMART_REPORT_KPIS'
   and type in('PACKAGE','PACKAGE BODY');

exit
