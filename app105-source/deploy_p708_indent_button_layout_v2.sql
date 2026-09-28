whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_marker constant varchar2(100) := 'HSPL_P708_INDENT_BUTTON_LAYOUT_V2';
  l_css    clob := q'~

/* HSPL_P708_INDENT_BUTTON_LAYOUT_V2 */
@media (min-width: 768px) {
  html.page-708 .col:has(#getunorderedindent) { grid-column: 3 / span 4 !important; flex: none !important; width: auto !important; max-width: none !important; }
  html.page-708 .col:has(#show-all-unordered-indents) { grid-column: 7 / span 6 !important; flex: none !important; width: auto !important; max-width: none !important; }
  html.page-708 #show-all-unordered-indents { background: #e7edfb !important; border: 1px solid #b9c8ee !important; box-shadow: 0 1px 2px rgba(30,64,175,.10) !important; color: #23458c !important; }
}
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = to_clob(inline_css) || l_css
   where flow_id = 105
     and id = 708
     and dbms_lob.instr(inline_css, l_marker) = 0;
  if sql%rowcount > 1 then raise_application_error(-20001, 'More than one Purchase Enquiry page was updated'); end if;
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

set pagesize 100
set linesize 220
select dbms_lob.instr(inline_css, 'HSPL_P708_INDENT_BUTTON_LAYOUT_V2') as button_layout_v2_marker
  from apex_260100.wwv_flow_steps
 where flow_id = 105 and id = 708;
exit
