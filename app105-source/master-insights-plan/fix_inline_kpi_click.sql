whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
begin apex_util.set_security_group_id(4744311978888504); end;
/
update apex_260100.wwv_flow_step_buttons
set button_cattributes='onclick="IMARTMasterKpis.toggle('||flow_step_id||');" aria-expanded="false" aria-controls="mr-register-kpis-'||flow_step_id||'"'
where flow_id=105 and button_name='MASTER_KPI_CARDS' and id between 2026100200000000 and 2026100201000000;
delete from apex_260100.wwv_flow_page_da_actions a
where a.flow_id=105 and a.id between 2026100200000000 and 2026100201000000
and exists(select 1 from apex_260100.wwv_flow_page_da_events e where e.flow_id=105 and e.id=a.event_id and e.name='Toggle Master KPI Cards');
delete from apex_260100.wwv_flow_page_da_events where flow_id=105 and name='Toggle Master KPI Cards' and id between 2026100200000000 and 2026100201000000;
commit;
exit
