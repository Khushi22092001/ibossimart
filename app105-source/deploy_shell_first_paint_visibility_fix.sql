whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css constant clob := q'~/* Native APEX content is the authoritative first paint. The shared runtime may
 * enhance it later, but must not hide the whole page or navigation tree while
 * it waits for DOMContentLoaded. */
html:not(.hspl-shell-ready) body:not(.t-PageBody--login) :is(
  .t-Body-title,
  .t-Body-content,
  .t-NavigationBar-menu
) {
  visibility: visible !important;
}

html:not(.hspl-nav-ready) body:not(.t-PageBody--login) #t_TreeNav,
html.hspl-nav-resolving body:not(.t-PageBody--login) #t_TreeNav {
  visibility: visible !important;
  pointer-events: auto !important;
}
~';
  l_blob blob;
  l_dst integer := 1;
  l_src integer := 1;
  l_ctx integer := dbms_lob.default_lang_ctx;
  l_warning integer;
begin
  apex_util.set_security_group_id(4744311978888504);
  dbms_lob.createtemporary(l_blob,true);
  dbms_lob.converttoblob(l_blob,l_css,dbms_lob.lobmaxsize,l_dst,l_src,nls_charset_id('AL32UTF8'),l_ctx,l_warning);
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.create_app_static_file(
    p_id=>wwv_flow_imp.id(7711000000002021),p_file_name=>'hspl-shell-first-paint-fix.css',
    p_mime_type=>'text/css',p_file_charset=>'utf-8',p_file_content=>l_blob);
  wwv_flow_imp.component_end;
  dbms_lob.freetemporary(l_blob);
end;
/
declare
  l_urls clob;
begin
  select css_file_urls into l_urls
    from apex_260100.wwv_flows
   where id=105 and security_group_id=4744311978888504 for update;
  l_urls:=regexp_replace(l_urls,'([[:space:]]*#APP_FILES#hspl-shell-first-paint-fix[.]css[^[:space:]]*)','');
  update apex_260100.wwv_flows
     set css_file_urls=rtrim(l_urls)||chr(10)||'#APP_FILES#hspl-shell-first-paint-fix.css?cb=20260929visible1',
         files_version=files_version+1,
         version_scn=dbms_flashback.get_system_change_number,
         last_updated_on=sysdate
   where id=105 and security_group_id=4744311978888504;
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
select case when instr(css_file_urls,'hspl-shell-first-paint-fix.css?cb=20260929visible1')>0 then 'SHELL_VISIBLE_FIRST_PAINT_DEPLOYED' else 'MISSING' end status
from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
exit
