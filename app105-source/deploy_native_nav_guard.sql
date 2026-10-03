whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_js constant clob := q'~/* Preserve the server-authored destination of sidebar links. This runs before
   the legacy theme handoff listener, which otherwise rewrites a normal route
   through a stale client-side navigation state. */
(function () {
  'use strict';
  window.addEventListener('click', function (event) {
    if (!event.target || !event.target.closest) return;
    var link = event.target.closest('#t_TreeNav a.a-TreeView-label[href]');
    if (!link || event.defaultPrevented || link.target === '_blank') return;
    var href = link.getAttribute('href');
    if (!href || href === '#' || /^javascript:/i.test(href)) return;
    event.preventDefault();
    event.stopImmediatePropagation();
    window.location.assign(link.href);
  }, true);
})();~';
  l_blob blob;
  l_dst integer := 1;
  l_src integer := 1;
  l_ctx integer := dbms_lob.default_lang_ctx;
  l_warning integer;
begin
  apex_util.set_security_group_id(4744311978888504);
  dbms_lob.createtemporary(l_blob,true);
  dbms_lob.converttoblob(l_blob,l_js,dbms_lob.lobmaxsize,l_dst,l_src,nls_charset_id('AL32UTF8'),l_ctx,l_warning);
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.create_app_static_file(
    p_id=>wwv_flow_imp.id(7711000000002020),p_file_name=>'hspl-native-nav-guard.js',
    p_mime_type=>'application/javascript',p_file_charset=>'utf-8',p_file_content=>l_blob);
  wwv_flow_imp.component_end;
  dbms_lob.freetemporary(l_blob);
end;
/
declare
  l_urls clob;
begin
  select javascript_file_urls into l_urls
    from apex_260100.wwv_flows
   where id=105 and security_group_id=4744311978888504 for update;
  l_urls:=regexp_replace(l_urls,'([[:space:]]*#APP_FILES#hspl-native-nav-guard[.]js[^[:space:]]*)','');
  l_urls:=regexp_replace(l_urls,'#APP_FILES#hspl-theme[.]js','#APP_FILES#hspl-native-nav-guard.js?cb=20260929nativeguard'||chr(10)||'#APP_FILES#hspl-theme.js',1,1);
  update apex_260100.wwv_flows
     set javascript_file_urls=l_urls,
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
select case when instr(javascript_file_urls,'hspl-native-nav-guard.js?cb=20260929nativeguard')>0 then 'NATIVE_LINK_GUARD_DEPLOYED' else 'MISSING' end status
from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
exit
