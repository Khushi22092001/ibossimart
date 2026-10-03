whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
set sqlformat csv
set pagesize 1000
connect -name IMART
spool app105-source/master-insights-plan/inline_kpi_verification_20261001.txt
declare failures number:=0; t number; payload clob; passed number:=0;
begin
 for r in (select distinct page_id from imart_mr_register order by page_id) loop
  begin
   apex_session.attach(p_app_id=>105,p_page_id=>r.page_id,p_session_id=>3275667854335);
   apex_json.initialize_clob_output;
   t:=dbms_utility.get_time;
   imart_register_kpis.payload(r.page_id);
   payload:=apex_json.get_clob_output;
   if json_exists(payload,'$.cards[0].value') then
    dbms_output.put_line('PASS page='||r.page_id||'; MS='||(dbms_utility.get_time-t)*10); passed:=passed+1;
   else raise_application_error(-20001,'Invalid KPI payload');end if;
   apex_json.free_output;apex_session.detach;
  exception when others then
   failures:=failures+1;dbms_output.put_line('FAIL page='||r.page_id||': '||sqlerrm);
   apex_json.free_output;apex_session.detach;
  end;
 end loop;
 dbms_output.put_line('PASSED='||passed||'; FAILED='||failures);
end;
/
select p.page_id,p.page_name,p.page_alias from apex_application_pages p
where application_id=105 and p.page_id in (select page_id from imart_mr_register) order by p.page_id;
spool off
exit
