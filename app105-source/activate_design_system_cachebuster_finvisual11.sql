whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

update apex_260100.wwv_flows
   set css_file_urls = replace(
         css_file_urls,
         '#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260924finvisual10',
         '#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260924finvisual11'),
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
