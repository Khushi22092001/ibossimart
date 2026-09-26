whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Page 500 only: remove the APEX region caption from the custom workspace. */
declare
  l_css clob;
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 500
     and security_group_id = 4744311978888504
   for update;

  if dbms_lob.instr(l_css, '.p500-portlet-region .t-Region-header') = 0 then
    l_css := l_css || chr(10) ||
      'html.page-500 .p500-portlet-region .t-Region-header{display:none!important}' || chr(10) ||
      'html.page-500 .p500-portlet-region .t-Region-body{padding:0!important}';
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 500
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Page 500 CSS was not updated');
  end if;
end;
/
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
