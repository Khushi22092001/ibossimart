whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

/* Page 152 / Purchase Bill Pass: Detail grid is wider than the viewport. */
declare
  l_css_marker constant varchar2(80) := 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V1';
  l_js_marker  constant varchar2(80) := 'P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V1';
  l_css clob;
  l_js clob;
  l_append_css clob := q'~

/* P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V1 */
html.page-152 #Detail_ig .a-GV-bdy {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
  scrollbar-gutter: stable !important;
}

html.page-152 #Detail_ig .a-GV-w-scroll {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
}
~';
  l_append_js clob := q'~

/* P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V1 */
(function () {
  function bindDetailGrid() {
    var grid = document.getElementById('Detail_ig');
    if (!grid) { return; }
    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.pbPassHorizontalSync === 'Y') { return; }
    body.dataset.pbPassHorizontalSync = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () { header.scrollLeft = body.scrollLeft; }, { passive: true });
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', bindDetailGrid, { once: true });
  } else {
    window.setTimeout(bindDetailGrid, 0);
  }
  $(document).on('apexafterrefresh.pbPassHorizontalSync', '#Detail_ig', bindDetailGrid);
}());
~';
begin
  select inline_css, javascript_code
    into l_css, l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 152
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
     and id = 152
     and security_group_id = 4744311978888504;
  commit;
end;
/

select case
         when dbms_lob.instr(inline_css, 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V1') > 0
          and dbms_lob.instr(javascript_code, 'P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V1') > 0
         then 'P152_DETAIL_HORIZONTAL_ONLY_DEPLOYED'
         else 'P152_DETAIL_HORIZONTAL_ONLY_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 152
   and security_group_id = 4744311978888504;

exit
