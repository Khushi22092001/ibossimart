whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/* Recovery from the prior Page 146 height override, plus a safe app-wide
   Detail-grid policy. Native IG column width, Add Row and column actions are
   deliberately not changed. */
declare
  l_detail_css clob := q'~

/* Transaction Detail grids: only horizontal overflow stays inside the grid. */
#tabcontainer .a-Tabs-panel .a-IG .a-GV,
#tabcontainer .a-Tabs-panel .a-IG .a-GV-bdy {
  height: auto !important;
  max-height: none !important;
}
#tabcontainer .a-Tabs-panel .a-IG .a-GV-bdy { overflow-y: hidden !important; }
#tabcontainer .a-Tabs-panel .a-IG .a-GV-w-scroll {
  overflow-x: auto !important;
  overflow-y: hidden !important;
}
/* Filters are a register/report control, not a transaction-form control. */
html.hspl-compact-form .hspl-filter-trigger,
body.hspl-compact-form .hspl-filter-trigger { display: none !important; }
~';
  l_detail_js clob := q'~

/* Detail-grid scrollbar policy: preserve native IG operations and sizing. */
(function () {
  function fitDetailGrids() {
    document.querySelectorAll('#tabcontainer .a-Tabs-panel .a-IG').forEach(function (ig) {
      var grid = ig.querySelector('.a-GV');
      var body = ig.querySelector('.a-GV-bdy');
      var scroll = ig.querySelector('.a-GV-w-scroll');
      if (grid) { grid.style.setProperty('height', 'auto', 'important'); grid.style.setProperty('max-height', 'none', 'important'); }
      if (body) { body.style.setProperty('height', 'auto', 'important'); body.style.setProperty('max-height', 'none', 'important'); body.style.setProperty('overflow-y', 'hidden', 'important'); }
      if (scroll) { scroll.style.setProperty('overflow-x', 'auto', 'important'); scroll.style.setProperty('overflow-y', 'hidden', 'important'); }
    });
  }
  [0, 120, 500, 1200].forEach(function (delay) { window.setTimeout(fitDetailGrids, delay); });
  document.addEventListener('click', function (event) {
    if (event.target.closest && event.target.closest('#tabcontainer .t-Tabs-link')) window.setTimeout(fitDetailGrids, 120);
  }, true);
  if (window.apex && apex.jQuery) apex.jQuery(document).on('apexafterrefresh.transactionDetailFit', fitDetailGrids);
}());
~';
  l_p143_css clob := q'~

/* Purchase Bill: keep the finished hero and its step navigation separate. */
#tabcontainer { margin-top: 8px !important; }
.t-Body-title.hspl-hero-card { margin-bottom: 0 !important; }
~';
  l_p146_inline clob;
  l_p0_inline clob;
  l_p0_onload clob;
  l_p143_js clob;
  l_p143_onload clob;

  function drop_between(p_source clob, p_start varchar2, p_end varchar2) return clob is
    l_start pls_integer;
    l_end pls_integer;
    l_len pls_integer;
    l_result clob;
  begin
    if p_source is null then return p_source; end if;
    l_start := dbms_lob.instr(p_source, p_start);
    if l_start = 0 then return p_source; end if;
    l_end := dbms_lob.instr(p_source, p_end, l_start);
    if l_end = 0 then return p_source; end if;
    l_end := l_end + length(p_end);
    l_len := dbms_lob.getlength(p_source);
    dbms_lob.createtemporary(l_result, true);
    if l_start > 1 then dbms_lob.copy(l_result, p_source, l_start - 1, 1, 1); end if;
    if l_end <= l_len then dbms_lob.copy(l_result, p_source, l_len - l_end + 1, l_start, l_end); end if;
    return l_result;
  end;
begin
  /* Remove only the broken Page 146 override from this run. */
  select inline_css into l_p146_inline
    from apex_260100.wwv_flow_steps
   where flow_id = 105 and id = 146 and security_group_id = 4744311978888504
   for update;
  l_p146_inline := drop_between(
    l_p146_inline,
    '/* GRN Detail: remove only the unnecessary inner vertical scroll. */',
    'overflow-y: hidden !important;' || chr(10) || '}'
  );
  update apex_260100.wwv_flow_steps
     set inline_css = l_p146_inline,
         last_updated_on = sysdate
   where flow_id = 105 and id = 146 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20001, 'GRN page was not found'); end if;

  /* Page 0 supplies this policy to every transaction form. */
  select inline_css, javascript_code_onload into l_p0_inline, l_p0_onload
    from apex_260100.wwv_flow_steps
   where flow_id = 105 and id = 0 and security_group_id = 4744311978888504
   for update;
  if instr(nvl(l_p0_inline, empty_clob()), 'Transaction Detail grids: only horizontal overflow stays inside the grid.') = 0 then
    l_p0_inline := nvl(l_p0_inline, empty_clob()) || l_detail_css;
  end if;
  if instr(nvl(l_p0_onload, empty_clob()), 'Detail-grid scrollbar policy: preserve native IG operations and sizing.') = 0 then
    l_p0_onload := nvl(l_p0_onload, empty_clob()) || l_detail_js;
  end if;
  update apex_260100.wwv_flow_steps
     set inline_css = l_p0_inline,
         javascript_code_onload = l_p0_onload,
         last_updated_on = sysdate
   where flow_id = 105 and id = 0 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20002, 'Global Page was not found'); end if;

  /* Undo the DOM-moving script that squeezed the Purchase Bill fields left. */
  select javascript_code, javascript_code_onload into l_p143_js, l_p143_onload
    from apex_260100.wwv_flow_steps
   where flow_id = 105 and id = 143 and security_group_id = 4744311978888504
   for update;
  l_p143_js := drop_between(l_p143_js, '/* Page 143 balanced Bill Details layout */', '}());');
  l_p143_onload := drop_between(l_p143_onload, '/* Page 143 balanced Bill Details layout */', '}());');
  update apex_260100.wwv_flow_steps
     set javascript_code = l_p143_js,
         javascript_code_onload = l_p143_onload,
         inline_css = l_p143_css,
         last_updated_on = sysdate
   where flow_id = 105 and id = 143 and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20003, 'Purchase Bill page was not found'); end if;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd      => '2026.03.30',
    p_release                 => '26.1.2',
    p_default_workspace_id    => 4744311978888504,
    p_default_application_id  => 105,
    p_default_id_offset       => 7541489808702750,
    p_default_owner           => 'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
