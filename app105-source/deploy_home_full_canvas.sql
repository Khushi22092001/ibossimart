whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Home only: remove the duplicate region and shell insets so the dashboard
   uses the complete content canvas. The app shell, sidebar and all links
   remain unchanged. */
declare
  l_css clob := q'~

/* Home full-canvas layout. */
body:not(.t-PageBody--login) .imart-home-region .t-Region-body {
  padding:0!important;
}
body:not(.t-PageBody--login) .imart-home-shell {
  max-width:none!important;
  margin:0!important;
  padding:0 0 24px!important;
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = case
           when instr(nvl(inline_css, empty_clob()), 'Home full-canvas layout') = 0
             then nvl(inline_css, empty_clob()) || l_css
           else inline_css
         end,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 1
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Home page CSS was not updated');
  end if;
end;
/
commit;

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
exit
