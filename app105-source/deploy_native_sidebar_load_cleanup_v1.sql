whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

/*
  Keep the existing visual design, but use Universal Theme's native
  icon-collapsed sidebar and remove two global DOM-scanning scripts.
*/
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

  l_nav := replace(l_nav, 'js-navCollapsed--hidden', 'js-navCollapsed--icons');
  if instr(l_nav, 'js-navCollapsed--icons') = 0 then
    l_nav := rtrim(l_nav, ':') || ':js-navCollapsed--icons';
  end if;

  /* These global scripts observe/repaint the full document during every
     APEX hydration pass. They are unnecessary when native UT owns the rail. */
  l_js := regexp_replace(l_js, '(^|[[:space:]])#APP_FILES#hspl-nav-paint[.]js[?][^[:space:]]*', '\1');
  l_js := regexp_replace(l_js, '(^|[[:space:]])#APP_FILES#hspl-dummy-button-guard[.]js[?][^[:space:]]*', '\1');
  l_js := regexp_replace(l_js, '([[:space:]]{2,})', chr(10));

  update apex_260100.wwv_flows
     set nav_list_template_options = l_nav,
         javascript_file_urls = trim(l_js),
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

select nav_list_template_options,
       case when instr(javascript_file_urls, 'hspl-nav-paint.js') = 0
              and instr(javascript_file_urls, 'hspl-dummy-button-guard.js') = 0
              and instr(nav_list_template_options, 'js-navCollapsed--icons') > 0
            then 'NATIVE_SIDEBAR_LOAD_CLEANUP_DEPLOYED'
            else 'NATIVE_SIDEBAR_LOAD_CLEANUP_MISSING' end as deployment_status
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
