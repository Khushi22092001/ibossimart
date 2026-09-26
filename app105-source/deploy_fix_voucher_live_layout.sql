whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_css clob := q'~
/* Page 156 — keep the three authored Voucher regions in one vertical, full-width flow. */
html.page-156 .t-Body-main .t-Region:has(#P156_LOCATIONCODE),
html.page-156 .t-Body-main .t-Region:has(#VOUCHERDETAIL),
html.page-156 .t-Body-main .t-Region:has(#VTNO) {
  width: 100% !important;
  max-width: none !important;
  min-width: 0 !important;
  clear: both !important;
}
html.page-156 .t-Body-main .row:has(#P156_LOCATIONCODE),
html.page-156 .t-Body-main .row:has(#VOUCHERDETAIL),
html.page-156 .t-Body-main .row:has(#VTNO) {
  width: 100% !important;
}
~';
  l_js clob := q'~
/* Voucher is a native APEX form, not a compact-card page. Keep its authored
   form + detail + automatic-voucher sequence stable while late theme passes run. */
(function () {
  var root = document.documentElement;
  function isVoucher() { return /(?:^|\s)page-156(?:\s|$)/.test(root.className || ''); }
  function restoreNativeVoucherLayout() {
    if (!isVoucher()) return;
    root.classList.remove('hspl-compact-form');
  }
  restoreNativeVoucherLayout();
  try { new MutationObserver(restoreNativeVoucherLayout).observe(root, { attributes: true, attributeFilter: ['class'] }); } catch (ignore) {}
  document.addEventListener('apexreadyend', restoreNativeVoucherLayout, { once: true });
}());
~';
begin
  update apex_260100.wwv_flow_page_plugs
     set plug_new_grid_row = 'Y',
         plug_new_grid_column = 'N',
         plug_display_column = 1,
         plug_grid_column_span = 12,
         last_updated_on = sysdate
   where flow_id = 105
     and page_id = 156
     and security_group_id = 4744311978888504
     and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically');
  if sql%rowcount <> 3 then raise_application_error(-20001, 'Voucher regions were not found'); end if;

  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, empty_clob()) || l_css,
         javascript_code_onload = nvl(javascript_code_onload, empty_clob()) || l_js,
         last_updated_on = sysdate
   where flow_id = 105 and id = 156 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20002, 'Voucher page was not found'); end if;
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
exit
