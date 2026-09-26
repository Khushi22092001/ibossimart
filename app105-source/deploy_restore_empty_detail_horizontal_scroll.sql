whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css clob := q'~

/* Empty Detail IGs still need a visible, usable horizontal scroll track. */
#tabcontainer .a-Tabs-panel .a-IG .a-GV-bdy { position: relative !important; padding-bottom: 14px !important; }
#tabcontainer .a-Tabs-panel .a-IG .a-GV-bdy > .a-GV-w-scroll[style*="display: none"] {
  display: block !important;
  position: absolute !important;
  inset: auto 0 0 0 !important;
  height: 14px !important;
  overflow-x: scroll !important;
  overflow-y: hidden !important;
}
#tabcontainer .a-Tabs-panel .a-IG .hspl-grid-scroll-spacer { width: 2600px; height: 1px; }
~';
  l_js clob := q'~

/* Empty Detail IG horizontal-scroll bridge. */
(function () {
  function restoreEmptyTracks() {
    document.querySelectorAll('#tabcontainer .a-Tabs-panel .a-IG').forEach(function (ig) {
      var body = ig.querySelector('.a-GV-bdy');
      var track = body && body.querySelector(':scope > .a-GV-w-scroll');
      var header = ig.querySelector('.a-GV-w-hdr');
      if (!body || !track || !header || getComputedStyle(track).display !== 'none') return;
      track.style.setProperty('display', 'block', 'important');
      track.style.setProperty('position', 'absolute', 'important');
      track.style.setProperty('left', '0', 'important');
      track.style.setProperty('right', '0', 'important');
      track.style.setProperty('bottom', '0', 'important');
      track.style.setProperty('height', '14px', 'important');
      track.style.setProperty('overflow-x', 'scroll', 'important');
      track.style.setProperty('overflow-y', 'hidden', 'important');
      var spacer = track.querySelector('.hspl-grid-scroll-spacer');
      if (!spacer) {
        spacer = document.createElement('div');
        spacer.className = 'hspl-grid-scroll-spacer';
        track.appendChild(spacer);
        track.addEventListener('scroll', function () { header.scrollLeft = track.scrollLeft; }, { passive: true });
      }
      spacer.style.width = Math.max(2600, header.scrollWidth || 0) + 'px';
    });
  }
  [160, 600, 1300].forEach(function (delay) { window.setTimeout(restoreEmptyTracks, delay); });
  document.addEventListener('click', function (event) {
    if (event.target.closest && event.target.closest('#tabcontainer .t-Tabs-link')) window.setTimeout(restoreEmptyTracks, 180);
  }, true);
  if (window.apex && apex.jQuery) apex.jQuery(document).on('apexafterrefresh.emptyDetailTrack', restoreEmptyTracks);
}());
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = case when instr(nvl(inline_css, empty_clob()), 'Empty Detail IGs still need a visible, usable horizontal scroll track.') = 0
                             then nvl(inline_css, empty_clob()) || l_css else inline_css end,
         javascript_code_onload = case when instr(nvl(javascript_code_onload, empty_clob()), 'Empty Detail IG horizontal-scroll bridge.') = 0
                                         then nvl(javascript_code_onload, empty_clob()) || l_js else javascript_code_onload end,
         last_updated_on = sysdate
   where flow_id = 105 and id = 0 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20001, 'Global Page was not found'); end if;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30', p_release => '26.1.2',
    p_default_workspace_id => 4744311978888504, p_default_application_id => 105,
    p_default_id_offset => 7541489808702750, p_default_owner => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
