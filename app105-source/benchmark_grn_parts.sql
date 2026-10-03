whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
connect -name IMART
spool app105-source/grn_kpi_parts_before.txt
declare q clob;n number;started number;begin
select classifier_sql into q from imart_tx_kpi_config where page_id=145;
started:=dbms_utility.get_time;
execute immediate 'select count(*),sum(approval+review+pending+partial+done) from ('||q||')' into n,started;
dbms_output.put_line('CLASSIFIER_DOCS='||n);
end;
/
select name,text from user_source where name in ('GETLOCATIONPRIVILEGE','GETDOCTYPEPRIVILEGE','GETCOMPANYPRIVILEGE','GETMODULECODEFORPAGENO') order by name,line;
spool off
exit
