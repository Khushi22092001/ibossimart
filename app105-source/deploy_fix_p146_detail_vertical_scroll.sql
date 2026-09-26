whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Page 146 GRN Detail must use the document's vertical page scroll.  The
   interactive grid keeps its horizontal overflow for its many columns, but
   no longer renders a second inner vertical scrollbar. */
declare
  l_css clob := q'~

/* GRN Detail: remove only the unnecessary inner vertical scroll. */
html.page-146 #SR_GrnDetail .a-IG-contentContainer,
html.page-146 #SR_GrnDetail .a-GV,
html.page-146 #SR_GrnDetail .a-GV-bdy {
    height: auto !important;
    max-height: none !important;
}
html.page-146 #SR_GrnDetail .a-GV-bdy {
    overflow-y: visible !important;
}
html.page-146 #SR_GrnDetail .a-GV-w-scroll {
    overflow-x: auto !important;
    overflow-y: hidden !important;
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = case
           when instr(nvl(inline_css, empty_clob()), 'GRN Detail: remove only the unnecessary inner vertical scroll.') = 0
             then nvl(inline_css, empty_clob()) || l_css
           else inline_css
         end,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 146
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected exactly one GRN page to update; found ' || sql%rowcount);
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
