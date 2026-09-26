whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* P118 / E-Mail tab only.  Target the live APEX heading DOM ID directly: the
   Dropzone plugin does not consistently retain its configured static ID. */
declare
  l_css    clob;
  l_marker constant varchar2(80) := '/* P118_UPLOAD_FILE_HEADING_DOM_FIX_V2 */';
  l_fix    constant clob := q'~
/* P118_UPLOAD_FILE_HEADING_DOM_FIX_V2 */
html.page-118 #R53134147830550917_heading,
html.page-118 #R53134147830550917_heading *,
html.page-118 #R53134147830550917_heading::before,
html.page-118 #R53134147830550917_heading::after{
  background:#fff!important;
  color:#172b4d!important;
  text-shadow:none!important;
  box-shadow:none!important;
  outline:0!important;
}
html.page-118 #R53134147830550917_heading{
  border-radius:0!important;
  padding:0!important;
}
~';
begin
  select inline_css into l_css
    from apex_260100.wwv_flow_steps
   where flow_id=105 and id=118 and security_group_id=4744311978888504
     for update;
  if dbms_lob.instr(nvl(l_css,to_clob('')),l_marker)=0 then
    update apex_260100.wwv_flow_steps
       set inline_css=nvl(l_css,to_clob(''))||to_clob(chr(10))||l_fix
     where flow_id=105 and id=118 and security_group_id=4744311978888504;
  end if;
end;
/
commit;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
