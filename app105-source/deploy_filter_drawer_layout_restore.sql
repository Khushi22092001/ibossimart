whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css constant clob := q'~/*
 * Restore one predictable two-column filter grid inside register drawers.
 *
 * The shared drawer skin previously turned the outer form wrapper into a grid
 * but left complete APEX rows as grid cells.  That made unrelated rows sit
 * beside one another and fields escape the drawer.  Each authored APEX row is
 * now flows all visible fields through one two-column grid, so a field from a
 * source row cannot leave a blank half-row before the following source row.
 */
html body:not(.t-PageBody--login) .hspl-drawer .t-Region-body > .container {
  display: grid !important;
  grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
  gap: 16px 18px !important;
  align-items: start !important;
  width: 100% !important;
}

html body:not(.t-PageBody--login) .hspl-drawer .t-Region-body > .container > .row {
  display: contents !important;
}

html body:not(.t-PageBody--login) .hspl-drawer .t-Region-body > .container > .row > .col {
  display: block !important;
  grid-column: auto !important;
  width: auto !important;
  max-width: none !important;
  min-width: 0 !important;
}

/* The date enhancer groups From/To in one wrapper. Flatten it as well, so
 * both dates remain individual equal-width grid cells. */
html body:not(.t-PageBody--login) .hspl-drawer .t-Region-body .hspl-daterow {
  display: contents !important;
}

html body:not(.t-PageBody--login) .hspl-drawer .t-Region-body .hspl-daterow > .t-Form-fieldContainer {
  grid-column: auto !important;
  width: auto !important;
  max-width: none !important;
  min-width: 0 !important;
}

html body:not(.t-PageBody--login) .hspl-drawer .t-Region-body > .container > .row > .col:empty {
  display: none !important;
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
    p_id=>wwv_flow_imp.id(7711000000002022),p_file_name=>'hspl-filter-drawer-layout-restore.css',
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
  l_urls:=regexp_replace(l_urls,'([[:space:]]*#APP_FILES#hspl-filter-drawer-layout-restore[.]css[^[:space:]]*)','');
  update apex_260100.wwv_flows
     set css_file_urls=rtrim(l_urls)||chr(10)||'#APP_FILES#hspl-filter-drawer-layout-restore.css?cb=20260929gridrestore1',
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
select case when instr(css_file_urls,'hspl-filter-drawer-layout-restore.css?cb=20260929gridrestore1')>0 then 'FILTER_DRAWER_GRID_RESTORED' else 'MISSING' end status
from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
exit
