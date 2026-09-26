whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

/*
  Application-wide Interactive Grid standard.
  A horizontal scrollbar appears only when a grid is wider than its viewport;
  an inner vertical scrollbar is suppressed.  This avoids per-page fixes.
*/
declare
  l_css_marker constant varchar2(80) := 'APPWIDE_DETAIL_GRID_HORIZONTAL_SCROLL_V1';
  l_js_marker  constant varchar2(80) := 'APPWIDE_DETAIL_GRID_HORIZONTAL_SYNC_V1';
  l_append_css clob := q'~

/* APPWIDE_DETAIL_GRID_HORIZONTAL_SCROLL_V1 */
/* Horizontal track appears only for wide Interactive Grids. */
.a-IG .a-GV-bdy {
  overflow-x: auto !important;
  overflow-y: hidden !important;
  scrollbar-gutter: stable !important;
}

.a-IG .a-GV-w-scroll {
  overflow-x: auto !important;
  overflow-y: hidden !important;
}
~';
  l_append_js clob := q'~

/* APPWIDE_DETAIL_GRID_HORIZONTAL_SYNC_V1 */
(function () {
  function bindGrid(grid) {
    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.appWideHorizontalSync === 'Y') { return; }
    body.dataset.appWideHorizontalSync = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () { header.scrollLeft = body.scrollLeft; }, { passive: true });
  }
  function bindAll(root) {
    (root || document).querySelectorAll('.a-IG').forEach(bindGrid);
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', function () { bindAll(document); }, { once: true });
  } else {
    window.setTimeout(function () { bindAll(document); }, 0);
  }
  $(document).on('apexafterrefresh.appWideHorizontalSync', '.a-IG', function () { bindGrid(this); });
}());
~';
  l_css clob;
  l_js clob;
  l_updated number := 0;
begin
  for r in (
    select distinct s.id as page_id
      from apex_260100.wwv_flow_steps s
      join apex_260100.wwv_flow_page_plugs p
        on p.flow_id = s.flow_id
       and p.page_id = s.id
     where s.flow_id = 105
       and s.security_group_id = 4744311978888504
       and p.plug_source_type = 'NATIVE_IG'
  ) loop
    select inline_css, javascript_code
      into l_css, l_js
      from apex_260100.wwv_flow_steps
     where flow_id = 105
       and id = r.page_id
       and security_group_id = 4744311978888504
       for update;

    if l_css is null or dbms_lob.instr(l_css, l_css_marker) = 0 then
      l_css := nvl(l_css, to_clob('')) || l_append_css;
    end if;
    if l_js is null or dbms_lob.instr(l_js, l_js_marker) = 0 then
      l_js := nvl(l_js, to_clob('')) || l_append_js;
    end if;

    update apex_260100.wwv_flow_steps
       set inline_css = l_css,
           javascript_code = l_js,
           last_updated_on = sysdate
     where flow_id = 105
       and id = r.page_id
       and security_group_id = 4744311978888504;
    l_updated := l_updated + 1;
  end loop;
  commit;
  dbms_output.put_line('UPDATED_IG_PAGES=' || l_updated);
end;
/

select count(*) as detail_grid_pages_standardized
  from apex_260100.wwv_flow_steps s
 where s.flow_id = 105
   and s.security_group_id = 4744311978888504
   and dbms_lob.instr(nvl(s.inline_css, to_clob('')), 'APPWIDE_DETAIL_GRID_HORIZONTAL_SCROLL_V1') > 0
   and dbms_lob.instr(nvl(s.javascript_code, to_clob('')), 'APPWIDE_DETAIL_GRID_HORIZONTAL_SYNC_V1') > 0;

exit
