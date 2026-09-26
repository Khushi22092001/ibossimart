whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

/* Roll back only the native-sidebar cleanup; restore the prior live shell. */
declare
  l_nav varchar2(32767);
  l_js  varchar2(32767);
begin
  select nav_list_template_options, javascript_file_urls
    into l_nav, l_js
    from apex_260100.wwv_flows
   where id = 105
     and security_group_id = 4744311978888504
     for update;

  l_nav := replace(l_nav, 'js-navCollapsed--icons', 'js-navCollapsed--hidden');
  if instr(l_nav, 'js-navCollapsed--hidden') = 0 then
    l_nav := rtrim(l_nav, ':') || ':js-navCollapsed--hidden';
  end if;

  if instr(l_js, 'hspl-nav-paint.js') = 0 then
    l_js := rtrim(l_js) || chr(10) || '#APP_FILES#hspl-nav-paint.js?cb=20260911bg';
  end if;
  if instr(l_js, 'hspl-dummy-button-guard.js') = 0 then
    l_js := rtrim(l_js) || chr(10) || '#APP_FILES#hspl-dummy-button-guard.js?cb=20260915d';
  end if;

  update apex_260100.wwv_flows
     set nav_list_template_options = l_nav,
         javascript_file_urls = l_js,
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case when instr(nav_list_template_options, 'js-navCollapsed--hidden') > 0
                   and instr(javascript_file_urls, 'hspl-nav-paint.js') > 0
                   and instr(javascript_file_urls, 'hspl-dummy-button-guard.js') > 0
              then 'NATIVE_SIDEBAR_CLEANUP_ROLLED_BACK'
              else 'NATIVE_SIDEBAR_CLEANUP_ROLLBACK_MISSING' end as rollback_status
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
