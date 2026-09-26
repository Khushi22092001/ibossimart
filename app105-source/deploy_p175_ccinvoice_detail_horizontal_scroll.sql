whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

/*
  Page 175 / CCInvoice: Item Detail is wider than its viewport.
  Keep only its horizontal entry scrollbar and align the grouped header
  while the user scrolls. This is deliberately scoped to #Detail_ig.
*/
declare
  l_css_marker constant varchar2(80) := 'P175_CCINVOICE_DETAIL_HORIZONTAL_SCROLL_V1';
  l_js_marker  constant varchar2(80) := 'P175_CCINVOICE_DETAIL_HORIZONTAL_SYNC_V1';
  l_append_css clob := q'~

/* P175_CCINVOICE_DETAIL_HORIZONTAL_SCROLL_V1 */
html.page-175 #Detail_ig .a-GV-bdy {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
  scrollbar-gutter: stable !important;
}

html.page-175 #Detail_ig .a-GV-w-scroll {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
}
~';
  l_append_js clob := q'~

/* P175_CCINVOICE_DETAIL_HORIZONTAL_SYNC_V1 */
(function () {
  function bindDetailGrid() {
    var grid = document.getElementById('Detail_ig');
    if (!grid) { return; }
    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.ccInvoiceHorizontalSync === 'Y') { return; }
    body.dataset.ccInvoiceHorizontalSync = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () { header.scrollLeft = body.scrollLeft; }, { passive: true });
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', bindDetailGrid, { once: true });
  } else {
    window.setTimeout(bindDetailGrid, 0);
  }
  $(document).on('apexafterrefresh.p175HorizontalSync', '#Detail_ig', bindDetailGrid);
}());
~';
  l_css clob;
  l_js  clob;
begin
  select inline_css, javascript_code
    into l_css, l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 175
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
     and id = 175
     and security_group_id = 4744311978888504;

  commit;
end;
/

select case
         when dbms_lob.instr(inline_css, 'P175_CCINVOICE_DETAIL_HORIZONTAL_SCROLL_V1') > 0
          and dbms_lob.instr(javascript_code, 'P175_CCINVOICE_DETAIL_HORIZONTAL_SYNC_V1') > 0
         then 'P175_CCINVOICE_DETAIL_HORIZONTAL_SCROLL_DEPLOYED'
         else 'P175_CCINVOICE_DETAIL_HORIZONTAL_SCROLL_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 175
   and security_group_id = 4744311978888504;

exit
