whenever sqlerror exit failure rollback
set define off
connect -name IMART

declare
  l_js  varchar2(32767);
  l_css varchar2(32767);
begin
  select javascript_file_urls, css_file_urls
    into l_js, l_css
    from apex_260100.wwv_flows
   where id = 105
     and security_group_id = 4744311978888504
   for update;

  l_js := regexp_replace(l_js,
    '(#APP_FILES#hspl-theme[.]js[?]version=#APP_VERSION#[&]cb=)[^[:space:]]+',
'#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260921cityrow9');
  l_css := regexp_replace(l_css,
    '(#APP_FILES#hspl-theme[.]css[?]version=#APP_VERSION#[&]cb=)[^[:space:]]+',
'#APP_FILES#hspl-theme.css?version=#APP_VERSION#&cb=20260921navhandoff2');

  update apex_260100.wwv_flows
     set javascript_file_urls = l_js,
         css_file_urls = l_css,
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Comparative Statement assets were not activated');
  end if;
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
exit
