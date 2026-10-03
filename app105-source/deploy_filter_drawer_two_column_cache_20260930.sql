whenever sqlerror exit sql.sqlcode rollback
set define off verify off feedback on
connect -name IMART

begin
  update apex_260100.wwv_flows
     set css_file_urls = regexp_replace(
           css_file_urls,
           'hspl-filter-drawer-layout-restore[.]css[?]cb=[^[:space:]]+',
           'hspl-filter-drawer-layout-restore.css?cb=20260930twocolfix10'),
         files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504
     and instr(css_file_urls, 'hspl-filter-drawer-layout-restore.css?cb=') > 0;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Application 105 filter CSS URL was not updated');
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
         when instr(css_file_urls, 'hspl-filter-drawer-layout-restore.css?cb=20260930twocolfix10') > 0
         then 'FILTER_DRAWER_TWO_COLUMNS_DEPLOYED'
         else 'FILTER_DRAWER_CACHE_KEY_MISSING'
       end as deployment_status
  from apex_260100.wwv_flows
 where id = 105 and security_group_id = 4744311978888504;
exit
