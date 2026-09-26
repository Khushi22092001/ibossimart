whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* These legacy ready actions unconditionally collapse Universal Theme's
   sidebar after it has rendered. Preserve the actions and their code for
   rollback; only suppress the exact collapse-first JavaScript on ready. */
declare
  l_count number;
begin
  update apex_260100.wwv_flow_page_da_actions a
     set server_condition_type = 'NEVER'
   where a.flow_id = 105
     and nvl(a.server_condition_type, 'X') <> 'NEVER'
     and exists (
       select 1
         from apex_260100.wwv_flow_page_da_events e
        where e.id = a.event_id
          and e.flow_id = 105
          and e.bind_event_type = 'ready'
     )
     and instr(trim(json_value(a.attributes, '$.js_code')),
       '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");') = 1;
  l_count := sql%rowcount;
  if l_count > 300 then
    raise_application_error(-20001, 'Unexpected sidebar-action count: ' || l_count);
  end if;
  dbms_output.put_line('Disabled obsolete sidebar collapse actions: ' || l_count);
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release => '26.1.2',
    p_default_workspace_id => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset => 7541489808702750,
    p_default_owner => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
