whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Page 502 only: restore the intended 4/8 dashboard grid beside its filter panel. */
declare
  l_css clob;
  l_fix clob := q'~
/* p502-purchase-dashboard-alignment-v3 */
html.page-502 .hspl-card-canvas > .row > .col:has(#R60204997871689918),
html.page-502 .hspl-card-canvas > .row > .col:has(#R470053964037327124){
  grid-column:1 / -1!important;
  width:100%!important;
  max-width:none!important;
}
html.page-502 .hspl-card-canvas > .row > .col:has(#R476707628844719499),
html.page-502 .hspl-card-canvas > .row > .col:has(#R479572390112973462),
html.page-502 .hspl-card-canvas > .row > .col:has(#R476700317533702782){grid-column:span 4!important}
html.page-502 .hspl-card-canvas > .row > .col:has(#R477165269028055979),
html.page-502 .hspl-card-canvas > .row > .col:has(#R477153650756035907),
html.page-502 .hspl-card-canvas > .row > .col:has(#R479629663215735079){grid-column:span 8!important}
/* Keep the three Purchase overview charts on one row. */
html.page-502 #R470053964037327124 .container.hspl-card-canvas{
  grid-template-columns:repeat(12,minmax(0,1fr))!important;
}
html.page-502 #R470053964037327124 .row > .col:has(#R470056276841327147),
html.page-502 #R470053964037327124 .row > .col:has(#R470054226647327126),
html.page-502 #R470053964037327124 .row > .col:has(#R470054335863327127){
  grid-column:span 4!important;
  width:auto!important;
  max-width:none!important;
}

html.page-502 #R60204997871689918,
html.page-502 #R60204997871689918 .t-Region-body{background:transparent!important;border:0!important;box-shadow:none!important;padding:0!important}
html.page-502 #R60204997871689918_cards{
  display:grid!important;
  grid-template-columns:repeat(4,minmax(0,1fr))!important;
  gap:16px!important;
  align-items:stretch!important;
  width:100%!important;
  margin:0!important;
  padding:0!important;
}
html.page-502 #R60204997871689918_cards > .i-Cards-item{
  display:block!important;
  width:auto!important;
  min-width:0!important;
  margin:0!important;
}
html.page-502 #R60204997871689918_cards .i-Card-wrap{
  box-sizing:border-box!important;
  width:100%!important;
  min-height:154px!important;
  height:100%!important;
}
@media(max-width:1180px){html.page-502 #R60204997871689918_cards{grid-template-columns:repeat(3,minmax(0,1fr))!important}}
@media(max-width:760px){html.page-502 #R60204997871689918_cards{grid-template-columns:repeat(2,minmax(0,1fr))!important}}
~';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 502
     and security_group_id = 4744311978888504
   for update;

  if l_css is null
     or dbms_lob.instr(l_css, 'p502-purchase-dashboard-alignment-v3') = 0 then
    l_css := nvl(l_css, to_clob(' ')) || chr(10) || l_fix;
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 502
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Purchase dashboard CSS was not updated');
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
