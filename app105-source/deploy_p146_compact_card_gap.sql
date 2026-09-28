whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_marker constant varchar2(100) := 'HSPL_P146_COMPACT_CARD_GAP_V2';
  l_css    clob := q'~

/* HSPL_P146_COMPACT_CARD_GAP_V2 */
@media (min-width: 768px) {
  html.page-146 #General .hspl-p146-card-track { gap: 0 !important; }
  html.page-146 #General .hspl-p146-card-track > .hspl-section-slot > .t-Region { margin-bottom: 6px !important; }
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = to_clob(inline_css) || l_css
   where flow_id = 105
     and id = 146
     and dbms_lob.instr(inline_css, l_marker) = 0;

  if sql%rowcount > 1 then
    raise_application_error(-20001, 'More than one GRN page was updated');
  end if;

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

set pagesize 100
set linesize 220
select dbms_lob.instr(inline_css, 'HSPL_P146_COMPACT_CARD_GAP_V2') as gap_marker,
       dbms_lob.getlength(inline_css) as inline_css_bytes
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 146;

exit
