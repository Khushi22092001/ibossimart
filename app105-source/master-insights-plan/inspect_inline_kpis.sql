set sqlformat csv
set pagesize 2000
connect -name IMART
select id,flow_step_id,button_name,static_id from apex_260100.wwv_flow_step_buttons where flow_id=105 and button_name='MASTER_KPI_CARDS' and flow_step_id=48;
select * from apex_application_page_da where application_id=105 and page_id=48 and dynamic_action_name='Toggle Master KPI Cards';
select * from apex_application_page_da_acts where application_id=105 and page_id=48 and dynamic_action_name='Toggle Master KPI Cards';
begin apex_session.attach(p_app_id=>105,p_page_id=>48,p_session_id=>3275667854335); imart_register_kpis.payload(48); end;
/
exit
