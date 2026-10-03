whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART
begin apex_util.set_security_group_id(4744311978888504);end;
/
update apex_260100.wwv_flow_page_da_actions a
set attributes=json_object('js_code' value 'IMARTMasterKpis.toggle('||a.page_id||');' returning clob)
where a.flow_id=105 and a.id between 2026100200000000 and 2026100201000000
and exists(select 1 from apex_260100.wwv_flow_page_da_events e where e.flow_id=105 and e.id=a.event_id and e.name='Toggle Master KPI Cards');
update apex_260100.wwv_flow_page_plugs
set plug_source=replace(plug_source,q'^document.getElementById('mr-kpi-button-' + page)^',q'^document.querySelector('[aria-controls="mr-register-kpis-' + page + '"]')^')
where flow_id=105 and static_id like 'mr-kpi-shell-%';
commit;
exit
