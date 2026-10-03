whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
set sqlformat csv
connect -name IMART
spool app105-source/verification/report-kpi-publication-20261003.txt
select state,count(*) regions from imart_rkpi_config group by state;
select count(*) shells from apex_260100.wwv_flow_page_plugs where flow_id=105 and static_id like 'coverage-kpi-shell-%';
select count(*) guard_mismatches from imart_rkpi_config c join apex_260100.wwv_flow_page_plugs r on r.id=c.region_id and r.flow_id=105 join apex_260100.wwv_flow_page_plugs k on k.flow_id=105 and k.page_id=c.page_id and k.static_id='coverage-kpi-shell-'||c.region_id where decode(r.plug_required_role,k.plug_required_role,1,0)=0 or decode(r.plug_display_condition_type,k.plug_display_condition_type,1,0)=0 or decode(r.plug_display_when_condition,k.plug_display_when_condition,1,0)=0 or decode(r.plug_display_when_cond2,k.plug_display_when_cond2,1,0)=0;
select name,type,line,text from user_errors where name='IMART_REPORT_KPIS';
select page_id,region_label,issue from imart_rkpi_config where state='REVIEW' order by page_id;
declare r number;result clob;begin
 select region_id into r from imart_rkpi_config where page_id=103 and state='READY';
 apex_session.attach(p_app_id=>105,p_page_id=>103,p_session_id=>25499780530358);
 apex_json.initialize_clob_output;imart_report_kpis.payload(r);result:=apex_json.get_clob_output;dbms_output.put_line('EMPLOYEE_PAYLOAD='||dbms_lob.substr(result,3000,1));apex_json.free_output;apex_session.detach;
 apex_session.attach(p_app_id=>105,p_page_id=>139,p_session_id=>25499780530358);
 begin imart_report_kpis.payload(r);raise_application_error(-20999,'Wrong-page context was accepted');exception when others then if sqlcode<>-20001 then raise;end if;dbms_output.put_line('WRONG_PAGE_CONTEXT=REJECTED');end;
 apex_session.detach;
end;
/
spool off
exit
