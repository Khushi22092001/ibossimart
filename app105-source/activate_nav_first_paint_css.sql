whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_css clob;
begin
  select css_file_urls
    into l_css
    from apex_260100.wwv_flows
   where id = 105
     and security_group_id = 4744311978888504
   for update;

  l_css := replace(
    l_css,
    '#APP_FILES#hspl-nav-hierarchy-v22.css?cb=20260911bd',
    '#APP_FILES#hspl-nav-hierarchy-v22.css?cb=20260928navfirstpaint1'
  );

  update apex_260100.wwv_flows
     set css_file_urls = l_css,
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
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release => '26.1.2',
    p_default_workspace_id => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset => 7541489808702750,
    p_default_owner => 'IMART'
  );
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case
         when instr(css_file_urls,
           '#APP_FILES#hspl-nav-hierarchy-v22.css?cb=20260928navfirstpaint1') > 0
         then 'NAV_FIRST_PAINT_CSS_ACTIVE'
         else 'NAV_FIRST_PAINT_CSS_MISSING'
       end as deployment_status
  from apex_260100.wwv_flows
 where id = 105
   and security_group_id = 4744311978888504;

exit
