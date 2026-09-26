whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css clob := q'~

/* Detail grid final scrollbar policy: native horizontal track only. */
#tabcontainer .a-IG .a-GV,
#tabcontainer .a-IG .a-GV-bdy {
  height: auto !important;
  min-height: 0 !important;
  max-height: none !important;
}
#tabcontainer .a-IG .a-GV-bdy {
  overflow-y: hidden !important;
  padding-bottom: 0 !important;
}
#tabcontainer .a-IG .a-GV-w-scroll {
  display: block !important;
  position: static !important;
  height: 14px !important;
  overflow-x: auto !important;
  overflow-y: hidden !important;
  scrollbar-width: auto;
}
#tabcontainer .a-IG .a-GV-bdy::-webkit-scrollbar:vertical,
#tabcontainer .a-IG .a-GV-w-scroll::-webkit-scrollbar:vertical { width: 0 !important; }
~';
  l_js clob := q'~

/* Remove only the previous detail-grid inline sizing overrides. */
(function () {
  function restoreNativeDetailGridSizing() {
    document.querySelectorAll('#tabcontainer .a-IG').forEach(function (ig) {
      var grid = ig.querySelector('.a-GV');
      var body = ig.querySelector('.a-GV-bdy');
      var scroll = ig.querySelector('.a-GV-w-scroll');
      if (grid) { grid.style.removeProperty('height'); grid.style.removeProperty('max-height'); }
      if (body) { body.style.removeProperty('height'); body.style.removeProperty('max-height'); body.style.removeProperty('overflow-y'); }
      if (scroll) { scroll.style.removeProperty('overflow-x'); scroll.style.removeProperty('overflow-y'); }
    });
  }
  [250, 750, 1600].forEach(function (delay) { window.setTimeout(restoreNativeDetailGridSizing, delay); });
  document.addEventListener('click', function (event) {
    if (event.target.closest && event.target.closest('#tabcontainer .t-Tabs-link')) window.setTimeout(restoreNativeDetailGridSizing, 260);
  }, true);
  if (window.apex && apex.jQuery) apex.jQuery(document).on('apexafterrefresh.detailGridScrollbarCleanup', function () { window.setTimeout(restoreNativeDetailGridSizing, 260); });
}());
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, empty_clob()) || l_css,
         javascript_code_onload = nvl(javascript_code_onload, empty_clob()) || l_js,
         last_updated_on = sysdate
   where flow_id = 105 and id = 0 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20001, 'Global Page was not found'); end if;
end;
/
commit;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
