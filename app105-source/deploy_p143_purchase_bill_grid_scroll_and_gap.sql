whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on
connect -name IMART

/* Page 143: Detail grids keep only the usable horizontal scrollbar. */
declare
  l_css    clob;
  l_marker constant varchar2(80) := 'P143_DETAIL_HORIZONTAL_SCROLL_AND_TAB_GAP_V1';
begin
  select inline_css
    into l_css
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 143
     and security_group_id = 4744311978888504
   for update;

  if l_css is null or dbms_lob.instr(l_css, l_marker) = 0 then
    update apex_260100.wwv_flow_steps
       set inline_css = nvl(inline_css, to_clob('')) || to_clob(q'~

/* P143_DETAIL_HORIZONTAL_SCROLL_AND_TAB_GAP_V1 */
/* Separate the page title card from the workflow tabs. */
html.page-143 #tabcontainer {
  margin-top: 16px !important;
}

/* Interactive Grid: no inner vertical scrollbar; retain a visible, usable
   native horizontal bar for wide entry rows. */
html.page-143 .a-IG .a-GV-bdy,
html.page-143 .a-IG .a-GV-scrollBody,
html.page-143 .a-IG .a-GV-w-scroll {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
}
~')
     where flow_id = 105
       and id = 143
       and security_group_id = 4744311978888504;
    dbms_output.put_line('Purchase Bill horizontal scrollbar and tab gap CSS added.');
  else
    dbms_output.put_line('Purchase Bill horizontal scrollbar and tab gap CSS already present.');
  end if;
end;
/

/* Keep column headings aligned while the native horizontal bar is used. */
declare
  l_js     clob;
  l_marker constant varchar2(80) := 'P143_DETAIL_HORIZONTAL_HEADER_SYNC_V1';
begin
  select javascript_code
    into l_js
    from apex_260100.wwv_flow_steps
   where flow_id = 105
     and id = 143
     and security_group_id = 4744311978888504
   for update;

  if l_js is null or dbms_lob.instr(l_js, l_marker) = 0 then
    update apex_260100.wwv_flow_steps
       set javascript_code = nvl(l_js, to_clob('')) || to_clob(q'~

/* P143_DETAIL_HORIZONTAL_HEADER_SYNC_V1 */
(function () {
  var gridIds = ['Detail_ig', 'DetailFooter_ig', 'GRN_ig', 'GRNSelection1_ig', 'TAC_ig'];

  function bindGrid(gridId) {
    var grid = document.getElementById(gridId);
    if (!grid) { return; }

    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.p143HorizontalSync === 'Y') { return; }

    body.dataset.p143HorizontalSync = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () {
      header.scrollLeft = body.scrollLeft;
    }, { passive: true });
  }

  function bindAll() {
    gridIds.forEach(bindGrid);
  }

  function scheduleBinding() {
    window.setTimeout(bindAll, 0);
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', scheduleBinding, { once: true });
  } else {
    scheduleBinding();
  }

  document.addEventListener('click', scheduleBinding);
  new MutationObserver(scheduleBinding).observe(document.documentElement, {
    childList: true,
    subtree: true
  });
}());
~')
     where flow_id = 105
       and id = 143
       and security_group_id = 4744311978888504;
    dbms_output.put_line('Purchase Bill horizontal header synchronization added.');
  else
    dbms_output.put_line('Purchase Bill horizontal header synchronization already present.');
  end if;
end;
/
commit;

select case
         when dbms_lob.instr(inline_css, 'P143_DETAIL_HORIZONTAL_SCROLL_AND_TAB_GAP_V1') > 0
          and dbms_lob.instr(javascript_code, 'P143_DETAIL_HORIZONTAL_HEADER_SYNC_V1') > 0
         then 'P143_SCROLL_AND_GAP_DEPLOYED'
         else 'P143_DEPLOYMENT_CHECK_FAILED'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 143
   and security_group_id = 4744311978888504;

exit
