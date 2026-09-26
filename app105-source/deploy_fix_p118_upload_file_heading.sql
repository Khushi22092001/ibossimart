whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Purchase Order only: Dropzone's plugin-region title was retaining a dark
   legacy title paint. Keep the upload area untouched; restore only the header
   contrast in the P118 E-Mail tab. */
declare
  l_css    clob;
  l_marker constant varchar2(80) := '/* P118_UPLOAD_FILE_HEADING_CONTRAST_V1 */';
  l_fix    constant clob := q'~
/* P118_UPLOAD_FILE_HEADING_CONTRAST_V1 */
html.page-118 body.hspl-po-reference:not(.t-PageBody--login)
  #upload-file > .t-Region-header,
html.page-118 body.hspl-po-reference:not(.t-PageBody--login)
  #upload-file > .t-Region-header .t-Region-headerItems,
html.page-118 body.hspl-po-reference:not(.t-PageBody--login)
  #upload-file > .t-Region-header .t-Region-headerItems--title,
html.page-118 body.hspl-po-reference:not(.t-PageBody--login)
  #upload-file > .t-Region-header :is(.t-Region-title,.t-Region-titleButton){
  background:#fff!important;
  color:#172b4d!important;
  text-shadow:none!important;
  box-shadow:none!important;
}
html.page-118 body.hspl-po-reference:not(.t-PageBody--login)
  #upload-file > .t-Region-header :is(.t-Region-title,.t-Region-titleButton){
  padding:0!important;
  border-radius:0!important;
  font-weight:600!important;
}
~';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504
     for update;

  if dbms_lob.instr(nvl(l_css, to_clob('')), l_marker) = 0 then
    update apex_260100.wwv_flow_steps
       set inline_css = nvl(l_css, to_clob('')) || to_clob(chr(10)) || l_fix
     where flow_id = 105
       and id = 118
       and security_group_id = 4744311978888504;
  end if;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd     => '2026.03.30',
    p_release                => '26.1.2',
    p_default_workspace_id   => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset      => 7541489808702750,
    p_default_owner          => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
