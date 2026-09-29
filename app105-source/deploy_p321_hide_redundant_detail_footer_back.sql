whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

connect -name IMART

/* Page 321 / Purchase Bill Detail Footer: hide only the redundant bottom
   Back control. The modal header navigation and all grid behavior stay intact. */
declare
  l_marker constant varchar2(80) := 'P321_HIDE_REDUNDANT_DETAIL_FOOTER_BACK_V2';
  l_css clob;
  l_append_css clob := q'~

/* P321_HIDE_REDUNDANT_DETAIL_FOOTER_BACK_V2
 * The dialog title bar already provides its navigation control. */
html.page-321 #back {
  display: none !important;
}
~';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 321
     and security_group_id = 4744311978888504
   for update;

  if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || l_append_css;
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 321
     and security_group_id = 4744311978888504;

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

select case
         when dbms_lob.instr(inline_css, 'P321_HIDE_REDUNDANT_DETAIL_FOOTER_BACK_V2') > 0
         then 'P321_REDUNDANT_BACK_HIDDEN'
         else 'P321_REDUNDANT_BACK_HIDE_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 321
   and security_group_id = 4744311978888504;

exit
