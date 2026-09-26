whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_js clob := q'~

/* Align Bill Details with Purchase Bill Pass Reference; preserve field DOM. */
(function () {
  function slot(region) {
    var node = region && region.parentElement;
    while (node && node !== document.body) {
      if (node.classList && node.classList.contains('col') && node.parentElement && node.parentElement.classList.contains('row')) return node;
      node = node.parentElement;
    }
    return null;
  }
  function alignBillDetails() {
    if (window.innerWidth < 900) return;
    var bill = slot(document.getElementById('bill-details'));
    var reference = slot(document.getElementById('purchase-bill-pass-reference'));
    if (!bill || !reference || bill.parentElement === reference.parentElement) return;
    var oldRow = bill.parentElement;
    reference.parentElement.insertBefore(bill, reference);
    bill.parentElement.classList.add('hspl-p143-paired-row');
    bill.classList.add('hspl-p143-paired-card');
    reference.classList.add('hspl-p143-paired-card');
    if (oldRow && !oldRow.querySelector(':scope > .col')) oldRow.remove();
  }
  [250, 850, 1600].forEach(function (delay) { window.setTimeout(alignBillDetails, delay); });
}());
~';
  l_css clob := q'~

/* Bill Details and Pass Reference occupy one balanced top row. */
.hspl-p143-paired-row > .hspl-p143-paired-card { flex: 0 0 50% !important; max-width: 50% !important; }
~';
begin
  update apex_260100.wwv_flow_steps
     set javascript_code_onload = case when instr(nvl(javascript_code_onload, empty_clob()), 'Align Bill Details with Purchase Bill Pass Reference; preserve field DOM.') = 0
                                         then nvl(javascript_code_onload, empty_clob()) || l_js else javascript_code_onload end,
         inline_css = case when instr(nvl(inline_css, empty_clob()), 'Bill Details and Pass Reference occupy one balanced top row.') = 0
                             then nvl(inline_css, empty_clob()) || l_css else inline_css end,
         last_updated_on = sysdate
   where flow_id=105 and id=143 and security_group_id=4744311978888504;
  if sql%rowcount <> 1 then raise_application_error(-20001, 'Purchase Bill page was not found'); end if;
end;
/
commit;
begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd=>'2026.03.30', p_release=>'26.1.2', p_default_workspace_id=>4744311978888504,
    p_default_application_id=>105, p_default_id_offset=>7541489808702750, p_default_owner=>'IMART');
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
