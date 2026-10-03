whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
set sqlblanklines on
connect -name IMART
@app105-source/transaction_kpis_package.sql
select name,line,position,text from user_errors where name='IMART_TRANSACTION_KPIS' order by sequence;
declare c integer;n number;started number;q clob;begin
select count(*) into n from user_errors where name='IMART_TRANSACTION_KPIS';if n>0 then raise_application_error(-20001,'Package invalid');end if;
for r in(select * from imart_tx_kpi_config)loop
c:=dbms_sql.open_cursor;dbms_sql.parse(c,imart_transaction_kpis.report_sql(r.page_id),dbms_sql.native);dbms_sql.close_cursor(c);
started:=dbms_utility.get_time;
execute immediate 'select count(*) from ('||r.classifier_sql||')' into n;
dbms_output.put_line('CLASSIFIER page='||r.page_id||' documents='||n||' elapsed_ms='||(dbms_utility.get_time-started)*10);
q:='select count(*) from (select tno,count(*) n from ('||r.classifier_sql||') group by tno having count(*)>1)';execute immediate q into n;
if n<>0 then raise_application_error(-20002,'Duplicate classifier document');end if;
end loop;
end;
/
commit;
exit
