whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

update apex_260100.wwv_flows
   set javascript_file_urls = '#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260923startupfix2' || chr(10) ||
                              '#APP_FILES#hspl-dummy-button-guard.js?cb=20260915d' || chr(10) ||
                              '#APP_FILES#hspl-nav-paint.js?cb=20260923nativefast1',
       css_file_urls = '#APP_FILES#hspl-theme.css?version=#APP_VERSION#&cb=20260923itemmasterfix4' || chr(10) ||
                       '#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260909e' || chr(10) ||
                       '#APP_FILES#globalSeach_styles.css' || chr(10) ||
                       '#APP_FILES#hspl-nav-hierarchy-v22.css?cb=20260911bd' || chr(10) ||
                       '#APP_FILES#hspl-nav-final.css?cb=20260911bf' || chr(10) ||
                       '#APP_FILES#hspl-legacy-back-hero-guard.css?cb=20260914i',
       files_version = files_version + 1,
       version_scn = dbms_flashback.get_system_change_number,
       last_updated_on = sysdate
 where id = 105
   and security_group_id = 4744311978888504;

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
