whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css constant clob := q'~/* Status-pill decoration is progressive enhancement.  APEX owns the initial
 * report paint, so the actual rows must remain visible while the decorator
 * waits for its lifecycle event.  Hiding the full report here caused an empty
 * register followed by a late, visibly staged paint on slower requests. */

@media (min-width: 768px) {
  html.hspl-nav-target-open:not(.hspl-shell-ready) body.apex-side-nav:not(.t-PageBody--login) #t_Body_nav {
    width: 320px !important;
    min-width: 320px !important;
  }
}

@media (min-width: 768px) {
  html.hspl-nav-target-closed:not(.hspl-sidebar-state-ready) body.apex-side-nav #t_Body_nav {
    width: 48px !important;
    min-width: 48px !important;
    max-width: 48px !important;
    transition: none !important;
  }
  html.hspl-nav-target-open:not(.hspl-sidebar-state-ready) body.apex-side-nav #t_Body_nav {
    width: 320px !important;
    min-width: 320px !important;
    max-width: 320px !important;
    transition: none !important;
  }
  html.hspl-nav-target-closed:not(.hspl-sidebar-state-ready) body.apex-side-nav #t_TreeNav {
    visibility: hidden !important;
  }
}

html body:not(.t-PageBody--login) :is(
  .a-IRR-table th,
  .a-IRR-table td,
  .a-IRR-table .a-IRR-headerLink,
  .t-fht-thead th,
  .t-fht-tbody td,
  .a-GV-header,
  .a-GV-cell,
  .t-Report-report th,
  .t-Report-report td,
  .a-Report th,
  .a-Report td
) {
  animation: none !important;
  transition: none !important;
}
~';
  l_blob blob;
  l_dst integer := 1;
  l_src integer := 1;
  l_ctx integer := dbms_lob.default_lang_ctx;
  l_warning integer;
begin
  apex_util.set_security_group_id(4744311978888504);
  dbms_lob.createtemporary(l_blob, true);
  dbms_lob.converttoblob(l_blob,l_css,dbms_lob.lobmaxsize,l_dst,l_src,nls_charset_id('AL32UTF8'),l_ctx,l_warning);
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504,p_default_application_id=>105,
    p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.create_app_static_file(
    p_id=>wwv_flow_imp.id(7712990000000106),p_file_name=>'hspl-register-first-paint.css',
    p_mime_type=>'text/css',p_file_charset=>'utf-8',p_file_content=>l_blob);
  wwv_flow_imp.component_end;
  dbms_lob.freetemporary(l_blob);
end;
/

begin
  update apex_260100.wwv_flows
     set css_file_urls=regexp_replace(css_file_urls,'hspl-register-first-paint[.]css[?]cb=[^[:space:]]+','hspl-register-first-paint.css?cb=20260929v5visible'),
         files_version=files_version+1,
         version_scn=dbms_flashback.get_system_change_number,
         last_updated_on=sysdate
   where id=105 and security_group_id=4744311978888504;
  if sql%rowcount<>1 then raise_application_error(-20001,'Application CSS configuration was not found.'); end if;
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
select case when instr(css_file_urls,'hspl-register-first-paint.css?cb=20260929v5visible')>0 then 'VISIBLE_FIRST_PAINT_DEPLOYED' else 'MISSING' end status
from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
exit
