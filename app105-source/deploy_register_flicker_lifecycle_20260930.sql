whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on
connect -name IMART

declare
  l_release varchar2(30);
begin
  select version_no into l_release
    from apex_release
   where rownum = 1;
  if l_release <> '26.1.2' then
    raise_application_error(-20001, 'Unexpected APEX release: ' || l_release);
  end if;
end;
/

@@deploy_register_flicker_hspl_theme_asset_20260930.sql
@@deploy_register_flicker_first_paint_asset_20260930.sql

begin
  update apex_260100.wwv_flows
     set javascript_file_urls = regexp_replace(
           regexp_replace(javascript_file_urls,
             'hspl-theme[.]js[?][^[:space:]]+',
             'hspl-theme.js?version=#APP_VERSION#&cb=20260930registerlifecycle4'),
           'hspl-register-first-paint[.]js[?]cb=[^[:space:]]+',
           'hspl-register-first-paint.js?cb=20260930registerlifecycle1'),
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Application 105 configuration was not updated');
  end if;

  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,
    p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case
         when instr(javascript_file_urls, 'hspl-theme.js?version=#APP_VERSION#&cb=20260930registerlifecycle4') > 0
          and instr(javascript_file_urls, 'hspl-register-first-paint.js?cb=20260930registerlifecycle1') > 0
         then 'REGISTER_FLICKER_LIFECYCLE_DEPLOYED'
         else 'REGISTER_FLICKER_LIFECYCLE_CACHE_BUST_MISSING'
       end as deployment_status
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;
exit
