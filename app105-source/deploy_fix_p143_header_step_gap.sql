whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css clob := q'~/* Keep the Purchase Bill hero distinct from its step navigation. */
html.page-143 .t-Body-title.hspl-hero-card { margin-bottom: 10px !important; }
html.page-143 #tabcontainer { margin-top: 0 !important; }~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 143
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Purchase Bill page CSS was not updated');
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
