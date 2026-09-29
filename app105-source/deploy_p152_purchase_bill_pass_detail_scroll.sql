whenever sqlerror exit sql.sqlcode rollback
set define off
set serveroutput on

connect -name IMART

/* Page 152 / Purchase Bill Pass: Detail grid is wider than the viewport. */
declare
  l_css_marker constant varchar2(80) := 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V1';
  l_js_marker  constant varchar2(80) := 'P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V1';
  l_css_v2_marker constant varchar2(80) := 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V2';
  l_css_v3_marker constant varchar2(80) := 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V3';
  l_css_v4_marker constant varchar2(80) := 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V4';
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
  l_append_css_v2 clob := q'~

/* P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V2
 * Keep the native Interactive Grid horizontal scroller visible.  The min-width
 * matches the full set of Detail columns so the right-side fields remain reachable. */
html.page-152 #Detail_ig .a-GV-bdy {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
  scrollbar-gutter: stable !important;
}

html.page-152 #Detail_ig .a-GV-w-hdr .a-GV-table,
html.page-152 #Detail_ig .a-GV-bdy .a-GV-table {
  min-width: 2050px !important;
  width: max(100%, 2050px) !important;
}

html.page-152 #Detail_ig .a-GV-bdy::-webkit-scrollbar {
  height: 12px;
}

html.page-152 #Detail_ig .a-GV-bdy::-webkit-scrollbar-track {
  background: #eef2f7;
  border-radius: 8px;
}

html.page-152 #Detail_ig .a-GV-bdy::-webkit-scrollbar-thumb {
  background: #9aa9bd;
  border: 3px solid #eef2f7;
  border-radius: 8px;
}
~';
  l_prior_js_v2 clob := q'~

/* P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V2 */
(function () {
  function bindDetailGrid() {
    var grid = document.getElementById('Detail_ig');
    if (!grid) { return; }
    var body = grid.querySelector('.a-GV-bdy');
    var header = grid.querySelector('.a-GV-w-hdr');
    if (!body || !header || body.dataset.pbPassHorizontalSyncV2 === 'Y') { return; }
    body.dataset.pbPassHorizontalSyncV2 = 'Y';
    header.scrollLeft = body.scrollLeft;
    body.addEventListener('scroll', function () {
      header.scrollLeft = body.scrollLeft;
    }, { passive: true });
  }
  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', bindDetailGrid, { once: true });
  } else {
    window.setTimeout(bindDetailGrid, 0);
  }
  $(document).on('apexafterrefresh.pbPassHorizontalSyncV2', '#Detail_ig', bindDetailGrid);
}());
~';
  l_append_css_v3 clob := q'~

/* P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V3
 * APEX renders Detail with a nested width-constrained scroller. Make the
 * outer grid body the sole horizontal scroll owner so its scrollbar is shown. */
html.page-152 #Detail_ig .a-GV-bdy {
  overflow-x: scroll !important;
  overflow-y: hidden !important;
  scrollbar-gutter: stable !important;
}

html.page-152 #Detail_ig .a-GV-w-scroll {
  flex: 0 0 2050px !important;
  min-width: 2050px !important;
  width: 2050px !important;
  overflow: visible !important;
}

html.page-152 #Detail_ig .a-GV-bdy::-webkit-scrollbar {
  height: 14px;
}
~';
  l_append_css_v4 clob := q'~

/* P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V4
 * Keep the native horizontal control visually obvious, even where the browser
 * otherwise renders thin overlay scrollbars. */
html.page-152 #Detail_ig .a-GV-bdy {
  scrollbar-width: auto !important;
  scrollbar-color: #5b5bde #e7ecf5 !important;
}

html.page-152 #Detail_ig .a-GV-bdy::-webkit-scrollbar {
  display: block !important;
  height: 18px !important;
  background: #e7ecf5 !important;
}

html.page-152 #Detail_ig .a-GV-bdy::-webkit-scrollbar-track {
  background: #e7ecf5 !important;
  border: 1px solid #c7d2e3 !important;
  border-radius: 9px !important;
}

html.page-152 #Detail_ig .a-GV-bdy::-webkit-scrollbar-thumb {
  background: #5b5bde !important;
  border: 3px solid #e7ecf5 !important;
  border-radius: 9px !important;
}
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
  if l_css is null or dbms_lob.instr(l_css, l_css_v2_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || l_append_css_v2;
  end if;
  if l_css is null or dbms_lob.instr(l_css, l_css_v3_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || l_append_css_v3;
  end if;
  if l_css is null or dbms_lob.instr(l_css, l_css_v4_marker) = 0 then
    l_css := nvl(l_css, to_clob('')) || l_append_css_v4;
  end if;
  if l_js is not null and dbms_lob.instr(l_js, 'P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V2') > 0 then
    l_js := replace(l_js, l_prior_js_v2, to_clob(''));
  end if;

  update apex_260100.wwv_flow_steps
     set inline_css = l_css,
         javascript_code = l_js,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 152
     and security_group_id = 4744311978888504;

  update apex_260100.wwv_flows
     set files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate
   where id = 105
     and security_group_id = 4744311978888504;
  commit;
end;
/

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release            => '26.1.2',
    p_default_workspace_id => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset => 7541489808702750,
    p_default_owner => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/

commit;

select case
         when dbms_lob.instr(inline_css, 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V1') > 0
          and dbms_lob.instr(javascript_code, 'P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V1') > 0
          and dbms_lob.instr(inline_css, 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V2') > 0
          and dbms_lob.instr(inline_css, 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V3') > 0
          and dbms_lob.instr(inline_css, 'P152_PURCHASE_BILL_PASS_DETAIL_HORIZONTAL_V4') > 0
          and dbms_lob.instr(javascript_code, 'P152_PURCHASE_BILL_PASS_DETAIL_SYNC_V2') = 0
         then 'P152_DETAIL_HORIZONTAL_ONLY_DEPLOYED'
         else 'P152_DETAIL_HORIZONTAL_ONLY_MISSING'
       end as deployment_status
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 152
   and security_group_id = 4744311978888504;

exit
