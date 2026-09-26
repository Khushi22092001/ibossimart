whenever sqlerror exit failure rollback
set define off
connect -name IMART

begin
  apex_util.set_security_group_id(4744311978888504);

  update apex_260100.wwv_flow_page_plugs
     set region_css_classes = trim(region_css_classes || ' hspl-drawer'),
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 711
     and id = 462028106178989296
     and instr(' ' || region_css_classes || ' ', ' hspl-drawer ') = 0;

  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
  commit;
end;
/
exit
