whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css constant clob := q'~/* Transaction-form item grids only.  The native aggregate still performs the
 * calculation; this file changes only the already-rendered live total dock. */
html body:not(.t-PageBody--login) .hspl-live-total-dock {
  height: 56px !important;
  margin-bottom: 8px !important;
  border: 1px solid #b8cef0 !important;
  border-top: 1px solid #9dbce9 !important;
  border-radius: 8px !important;
  background: linear-gradient(100deg, #e9f3ff 0%, #dbeaff 48%, #e8f3ff 100%) !important;
  box-shadow: 0 8px 18px rgba(34, 89, 167, .12), inset 0 1px 0 rgba(255,255,255,.88) !important;
}

html body:not(.t-PageBody--login) .hspl-live-total-dock-scroll,
html body:not(.t-PageBody--login) .hspl-live-total-table,
html body:not(.t-PageBody--login) tr.hspl-live-total-row > .a-GV-cell {
  height: 56px !important;
}

html body:not(.t-PageBody--login) tr.hspl-live-total-row > .a-GV-cell {
  padding: 8px 10px !important;
  border-inline-end: 1px solid rgba(75, 121, 188, .22) !important;
  color: #173e76 !important;
  font-size: 14px !important;
  font-weight: 700 !important;
  background: transparent !important;
}

html body:not(.t-PageBody--login) tr.hspl-live-total-row > .a-GV-cell.hspl-live-total-title {
  padding-inline: 18px !important;
  color: #124a93 !important;
  background: linear-gradient(90deg, #cde3ff 0%, #e5f1ff 100%) !important;
}

html body:not(.t-PageBody--login) .hspl-live-total-label {
  display: inline-flex !important;
  align-items: center !important;
  gap: 10px !important;
  white-space: nowrap !important;
}

html body:not(.t-PageBody--login) .hspl-live-total-label .fa {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  width: 34px !important;
  height: 38px !important;
  margin: -8px 2px -8px -10px !important;
  border-radius: 6px !important;
  background: linear-gradient(180deg, #2e7bdc 0%, #1f5eae 100%) !important;
  color: #fff !important;
  font-size: 21px !important;
}

html body:not(.t-PageBody--login) .hspl-live-total-label strong {
  color: #16457f !important;
  font-size: 15px !important;
  font-weight: 700 !important;
}

/* “Live” was useful implementation text but does not belong in the concise
 * form footer.  No total values, columns, or calculation logic are changed. */
html body:not(.t-PageBody--login) .hspl-live-total-label small {
  display: none !important;
}

/* Purchase Bill owns a page-specific total dock rather than the shared one.
 * Keep its calculations and aligned columns intact, but give it the same
 * visible total-bar treatment as the other transaction detail grids.
 * This must be in the existing total-band layer: that stylesheet uses
 * important declarations, for which its layer otherwise wins the cascade. */
@layer hspl-total-band {
html.page-143 #Detail .p143-live-total-dock {
  height: 56px !important;
  margin-bottom: 8px !important;
  border: 1px solid #b8cef0 !important;
  border-radius: 8px !important;
  background: linear-gradient(100deg, #e9f3ff 0%, #dbeaff 48%, #e8f3ff 100%) !important;
  box-shadow: 0 8px 18px rgba(34, 89, 167, .12), inset 0 1px 0 rgba(255,255,255,.88) !important;
}

html.page-143 #Detail .p143-live-total-dock::before { display: none !important; }

html.page-143 #Detail :is(.p143-live-total-dock-scroll, .p143-live-total-table, .p143-grid-total-row > .p143-live-total-cell) {
  height: 56px !important;
}

html.page-143 #Detail .p143-grid-total-row > .p143-live-total-cell {
  padding: 8px 10px !important;
  border-inline-end: 1px solid rgba(75, 121, 188, .22) !important;
  background: transparent !important;
  color: #173e76 !important;
  font-size: 14px !important;
  font-weight: 700 !important;
}

html.page-143 #Detail .p143-grid-total-row > .p143-live-total-title {
  padding-inline: 18px !important;
  color: #16457f !important;
  background: linear-gradient(90deg, #cde3ff 0%, #e5f1ff 100%) !important;
}

html.page-143 #Detail .p143-live-total-title .fa {
  display: inline-flex !important;
  align-items: center !important;
  justify-content: center !important;
  width: 34px !important;
  height: 38px !important;
  margin: -8px 10px -8px -10px !important;
  border-radius: 6px !important;
  background: linear-gradient(180deg, #2e7bdc 0%, #1f5eae 100%) !important;
  color: #fff !important;
  font-size: 21px !important;
}

html.page-143 #Detail .p143-live-total-title .fa::before {
  content: "∑" !important;
  width: auto !important;
  height: auto !important;
  background: none !important;
  font-family: inherit !important;
  font-size: 24px !important;
  font-weight: 700 !important;
}

html.page-143 #Detail .p143-live-total-title strong {
  color: #16457f !important;
  font-size: 15px !important;
  font-weight: 700 !important;
}

html.page-143 #Detail .p143-live-total-title small {
  display: none !important;
}
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
    p_id=>wwv_flow_imp.id(7711000000002023),p_file_name=>'hspl-transaction-total-bar.css',
    p_mime_type=>'text/css',p_file_charset=>'utf-8',p_file_content=>l_blob);
  wwv_flow_imp.component_end;
  dbms_lob.freetemporary(l_blob);
end;
/
declare
  l_urls clob;
begin
  select css_file_urls into l_urls from apex_260100.wwv_flows
   where id=105 and security_group_id=4744311978888504 for update;
  l_urls:=regexp_replace(l_urls,'([[:space:]]*#APP_FILES#hspl-transaction-total-bar[.]css[^[:space:]]*)','');
  update apex_260100.wwv_flows
     set css_file_urls=rtrim(l_urls)||chr(10)||'#APP_FILES#hspl-transaction-total-bar.css?cb=20260930totalbar1',
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
select case when instr(css_file_urls,'hspl-transaction-total-bar.css?cb=20260930totalbar1')>0 then 'TRANSACTION_TOTAL_BAR_DEPLOYED' else 'MISSING' end status
from apex_260100.wwv_flows where id=105 and security_group_id=4744311978888504;
exit
