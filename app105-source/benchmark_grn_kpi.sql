whenever sqlerror exit sql.sqlcode rollback
set define off
set sqlblanklines on
set serveroutput on size unlimited
connect -name IMART
spool app105-source/grn_kpi_benchmark_after.txt
begin apex_session.attach(p_app_id=>105,p_page_id=>145,p_session_id=>549415161481);end;
/
declare started number;begin
dbms_output.put_line('RANGE='||v('P145_FROMDATE')||'..'||v('P145_TODATE'));
started:=dbms_utility.get_time;
apex_json.initialize_clob_output;
imart_transaction_kpis.payload(145);
dbms_output.put_line('PAYLOAD_ELAPSED_MS='||(dbms_utility.get_time-started)*10);
dbms_output.put_line(apex_json.get_clob_output);apex_json.free_output;
end;
/
spool off
exit
