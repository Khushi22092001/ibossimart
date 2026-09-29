set define off verify off feedback on serveroutput on
whenever sqlerror exit sql.sqlcode rollback
connect -name IMART

/* Import the just-exported live Page 321 only. The application and workspace
   overrides keep this page-specific export in the production app (105). */
begin
  apex_application_install.set_workspace_id(4744311978888504);
  apex_application_install.set_application_id(105);
  apex_application_install.set_schema('IMART');
  apex_application_install.set_offset(7541489808702750);
end;
/

@f105_page_321.sql

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART'
  );
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/

commit;

select case
         when dbms_lob.instr(inline_css, 'P321_HIDE_REDUNDANT_DETAIL_FOOTER_BACK_V1') > 0
         then 'P321_PAGE_ONLY_IMPORT_VERIFIED'
         else 'P321_PAGE_ONLY_IMPORT_MARKER_MISSING'
       end as import_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 321
   and security_group_id = 4744311978888504;

exit
