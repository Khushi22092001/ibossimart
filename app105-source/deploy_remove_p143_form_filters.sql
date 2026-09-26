whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_js clob := q'~

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
begin
  update apex_260100.wwv_flow_steps
     set javascript_code_onload = case
           when instr(nvl(javascript_code_onload, empty_clob()), 'Purchase Bill is a form: it must never show a register filter action.') = 0
             then nvl(javascript_code_onload, empty_clob()) || l_js
           else javascript_code_onload
         end,
         last_updated_on = sysdate
   where flow_id = 105 and id = 143 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20001, 'Purchase Bill page was not found'); end if;
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
