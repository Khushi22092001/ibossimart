whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Restore the required navigation tree painter while keeping cache state
   explicit for the sidebar script. */
declare
  l_js varchar2(32767);
begin
  select javascript_file_urls
    into l_js
    from apex_260100.wwv_flows
   where id = 105
     and security_group_id = 4744311978888504
   for update;

  l_js := regexp_replace(l_js,
    '(#APP_FILES#hspl-theme[.]js[?]version=#APP_VERSION#[&]cb=)[^[:space:]]+',
    '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260918jetfix');
  if instr(l_js, '#APP_FILES#hspl-nav-paint.js') = 0 then
    l_js := rtrim(l_js) || chr(10) || '#APP_FILES#hspl-nav-paint.js?cb=20260918navrestore';
  end if;

  update apex_260100.wwv_flows
     set javascript_file_urls = l_js,
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Native navigation configuration was not updated');
  end if;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
