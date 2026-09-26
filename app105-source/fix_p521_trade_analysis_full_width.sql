whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Page 521 only: its Trade Analysis parent region was constrained to 6/12. */
declare
  l_css clob;
  l_fix varchar2(2000) := q'~
/* p521-trade-analysis-full-width-v1 */
html.page-521 .hspl-card-canvas > .row > .col:has(#R481604911699978540){
  grid-column:1 / -1!important;
  width:100%!important;
  max-width:none!important;
}
~';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 521
     and security_group_id = 4744311978888504
   for update;

  if l_css is null
     or dbms_lob.instr(l_css, 'p521-trade-analysis-full-width-v1') = 0 then
    l_css := nvl(l_css, to_clob('')) || chr(10) || l_fix;
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 521
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Trade Analysis page CSS was not updated');
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
