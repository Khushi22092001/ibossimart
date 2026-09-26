whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_js varchar2(32767);
begin
  select javascript_file_urls
    into l_js
    from apex_260100.wwv_flows
   where id = 105
     and security_group_id = 4744311978888504
   for update;

  /* Preserve every configured asset and restore only the missing sidebar
     controller after nav-paint. */
  l_js := regexp_replace(
    l_js,
    '([[:space:]]*#APP_FILES#hspl-sidebar-state[.]js[^[:space:]]*)',
    ''
  );

  update apex_260100.wwv_flows
     set javascript_file_urls = rtrim(l_js) || chr(10) ||
          '#APP_FILES#hspl-sidebar-state.js?cb=20260925sbstate52',
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd     => '2026.03.30',
    p_release                => '26.1.2',
    p_default_workspace_id   => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset      => 7541489808702750,
    p_default_owner          => 'IMART'
  );
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case
         when instr(javascript_file_urls,
                    '#APP_FILES#hspl-sidebar-state.js?cb=20260925sbstate52') > 0
         then 'SIDEBAR_RUNTIME_RESTORED'
         else 'SIDEBAR_RUNTIME_MISSING'
       end as deployment_status,
       javascript_file_urls
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
