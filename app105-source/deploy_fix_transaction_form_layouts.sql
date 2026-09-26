whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_p143_css clob := q'~

/* P143 final layout correction: keep the header and steps apart; do not move fields in the DOM. */
#tabcontainer { margin-top: 12px !important; }
.t-Body-title .hspl-filter-trigger { display: none !important; }
~';
  l_p143_js clob := q'~
/* Purchase Bill is a form: it must never show a register filter action. */
(function () {
  function removeFormFilters() {
    document.querySelectorAll('.t-Body-title button, .t-Body-title a, .t-HeroRegion button, .t-HeroRegion a').forEach(function (control) {
      if ((control.textContent || '').replace(/\s+/g, ' ').trim().toLowerCase() === 'filters') control.remove();
    });
  }
  [0, 150, 700, 1500].forEach(function (delay) { window.setTimeout(removeFormFilters, delay); });
}());
~';
  l_p199_css clob := q'~

/* Freight Advice uses the same 12px hero-to-step gap as GRN. */
#tabcontainer { margin-top: 12px !important; }
.t-Body-title .hspl-filter-trigger { display: none !important; }
~';
  l_p199_js clob := q'~
/* Freight Advice is a form, so remove any register filter action after rendering. */
(function () {
  function removeFormFilters() {
    document.querySelectorAll('.t-Body-title button, .t-Body-title a, .t-HeroRegion button, .t-HeroRegion a').forEach(function (control) {
      if ((control.textContent || '').replace(/\s+/g, ' ').trim().toLowerCase() === 'filters') control.remove();
    });
  }
  [0, 150, 700, 1500].forEach(function (delay) { window.setTimeout(removeFormFilters, delay); });
}());
~';
begin
  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, empty_clob()) || l_p143_css,
         javascript_code_onload = l_p143_js,
         last_updated_on = sysdate
   where flow_id = 105 and id = 143 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20001, 'Purchase Bill page was not found'); end if;

  update apex_260100.wwv_flow_steps
     set inline_css = nvl(inline_css, empty_clob()) || l_p199_css,
         javascript_code_onload = nvl(javascript_code_onload, empty_clob()) || l_p199_js,
         last_updated_on = sysdate
   where flow_id = 105 and id = 199 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20002, 'Freight Advice page was not found'); end if;

  update apex_260100.wwv_flow_page_plugs
     set plug_new_grid_row = 'Y', plug_new_grid_column = 'Y', plug_display_column = null,
         plug_grid_column_span = 12, last_updated_on = sysdate
   where flow_id = 105 and page_id = 156 and security_group_id = 4744311978888504
     and plug_name in ('Voucher', 'Voucher Detail', 'Voucher Created Automatically');
  if sql%rowcount <> 3 then raise_application_error(-20003, 'Voucher regions were not found'); end if;
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
