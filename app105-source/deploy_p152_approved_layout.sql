whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_marker constant varchar2(80) := 'HSPL_P152_APPROVED_LAYOUT_V2';
  l_css constant clob := q'~

/* HSPL_P152_APPROVED_LAYOUT_V2
 * UI-only region sizing. Keep the native APEX row hierarchy intact so field
 * widths, processes, validations, and Dynamic Actions remain unchanged. */
@media (min-width: 1200px) {
  html.page-152 #General .row > .col:has(> #select-purchase-bill-no-and-pass-on) {
    flex:0 0 50%!important;
    max-width:50%!important;
  }
  html.page-152 #General .row > .col:has(> #currency),
  html.page-152 #General .row > .col:has(> #nature-and-transaction) {
    flex:0 0 25%!important;
    max-width:25%!important;
  }
  html.page-152 #General .row > .col:has(> #other-details),
  html.page-152 #General .row > .col:has(> #tds-detail),
  html.page-152 #General .row > .col:has(> #account-posting-detail) {
    flex:0 0 33.333333%!important;
    max-width:33.333333%!important;
  }
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = to_clob(inline_css) || l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 152
     and dbms_lob.instr(inline_css, l_marker) = 0;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Purchase Bill Pass layout marker was already present or page 152 was not found.');
  end if;

  update apex_260100.wwv_flows
     set files_version = files_version + 1,
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
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART'
  );
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select dbms_lob.instr(inline_css, 'HSPL_P152_APPROVED_LAYOUT_V2') as layout_marker
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 152;

exit
