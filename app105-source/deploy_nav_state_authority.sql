whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

declare
  l_js constant clob := q'~/* One authoritative visual state for the Universal Theme navigation shell.
   The legacy theme controller still exists for unrelated navigation behavior,
   but it must never be allowed to replace the dedicated sidebar preference
   during a document handoff. */
(function () {
  'use strict';

  var html = document.documentElement;
  var stateKey = 'imart.sidebar.state.v1';
  var desired = 'closed';
  var applying = false;

  try {
    var saved = window.localStorage.getItem(stateKey);
    if (saved === 'open' || saved === 'closed') desired = saved;
  } catch (ignore) {}

  function paint() {
    applying = true;
    html.classList.remove(desired === 'open' ? 'hspl-nav-target-closed' : 'hspl-nav-target-open');
    html.classList.add(desired === 'open' ? 'hspl-nav-target-open' : 'hspl-nav-target-closed');
    applying = false;
  }

  function save(next) {
    desired = next;
    try { window.localStorage.setItem(stateKey, next); } catch (ignore) {}
    try { window.sessionStorage.setItem('hspl-nav-preferred-state', next); } catch (ignore) {}
    paint();
  }

  paint();

  new MutationObserver(function () {
    if (!applying) paint();
  }).observe(html, { attributes: true, attributeFilter: ['class'] });

  document.addEventListener('click', function (event) {
    if (!event.target.closest || !event.target.closest('#t_Button_navControl')) return;
    save(desired === 'open' ? 'closed' : 'open');
  }, true);
})();~';
  l_blob blob;
  l_offset pls_integer := 1;
  l_piece varchar2(16000);
begin
  dbms_lob.createtemporary(l_blob, true);
  while l_offset <= dbms_lob.getlength(l_js) loop
    l_piece := dbms_lob.substr(l_js, 16000, l_offset);
    dbms_lob.writeappend(l_blob, utl_raw.length(utl_i18n.string_to_raw(l_piece, 'AL32UTF8')), utl_i18n.string_to_raw(l_piece, 'AL32UTF8'));
    l_offset := l_offset + length(l_piece);
  end loop;

  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.create_app_static_file(
    p_id=>wwv_flow_imp.id(7711000000002010),
    p_file_name=>'hspl-nav-state-authority.js',
    p_mime_type=>'application/javascript', p_file_charset=>'utf-8',
    p_file_content=>l_blob);
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
  l_urls := regexp_replace(l_urls, '([[:space:]]*#APP_FILES#hspl-nav-state-authority[.]js[^[:space:]]*)', '');
  update apex_260100.wwv_flows
     set javascript_file_urls = rtrim(l_urls) || chr(10) || '#APP_FILES#hspl-nav-state-authority.js?cb=20260929authority1',
         files_version=files_version+1,
         version_scn=dbms_flashback.get_system_change_number,
         last_updated_on=sysdate
   where id=105 and security_group_id=4744311978888504;
end;
/
commit;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2',
    p_default_workspace_id=>4744311978888504, p_default_application_id=>105,
    p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;

select case when instr(javascript_file_urls, 'hspl-nav-state-authority.js?cb=20260929authority1')>0 then 'DEPLOYED' else 'MISSING' end as status
  from apex_260100.wwv_flows
 where id=105 and security_group_id=4744311978888504;
exit
