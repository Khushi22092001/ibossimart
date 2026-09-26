whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

declare
  l_js  clob := q'~

/* Page 143 balanced Bill Details layout */
(function () {
  function p143Slot(regionId) {
    var region = document.getElementById(regionId);
    return region && region.closest('.col');
  }
  function balanceP143Sections() {
    if (window.innerWidth < 1101) return;
    var cards = [
      p143Slot('R602764497505017069'),
      p143Slot('R602764580134017070'),
      p143Slot('R602764701262017071'),
      p143Slot('R602764829912017072'),
      p143Slot('remark'),
      p143Slot('R447056177071861603')
    ];
    if (cards.some(function (card) { return !card; })) return;
    var priorStack = cards[0].closest('.hspl-form-column-stack');
    if (!priorStack || !priorStack.parentNode) return;
    var host = document.getElementById('p143-balanced-sections');
    if (!host) {
      host = document.createElement('div');
      host.id = 'p143-balanced-sections';
      priorStack.parentNode.insertBefore(host, priorStack);
    }
    cards.forEach(function (card) { host.appendChild(card); });
    Array.prototype.forEach.call(host.parentNode.querySelectorAll(':scope > .hspl-form-column-stack'), function (stack) {
      if (!stack.children.length) stack.remove();
    });
  }
  [2700, 3400].forEach(function (delay) { setTimeout(balanceP143Sections, delay); });
  document.addEventListener('apexafterrefresh', balanceP143Sections, true);
}());
~';
  l_css clob := q'~

/* Page 143: preserve authored Bill Details pairs without a blank left band. */
html.page-143 #p143-balanced-sections {
  display: grid !important;
  grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
  gap: 12px !important;
  width: 100% !important;
}
html.page-143 #p143-balanced-sections > .col {
  width: auto !important;
  max-width: none !important;
  min-width: 0 !important;
  margin: 0 !important;
  padding: 0 !important;
}
~';
begin
  update apex_260100.wwv_flow_steps
     set javascript_code = case
           when instr(nvl(javascript_code, empty_clob()), 'Page 143 balanced Bill Details layout') = 0
             then nvl(javascript_code, empty_clob()) || l_js
           else javascript_code
         end,
         javascript_code_onload = case
           when instr(nvl(javascript_code_onload, empty_clob()), 'Page 143 balanced Bill Details layout') = 0
             then nvl(javascript_code_onload, empty_clob()) || l_js
           else javascript_code_onload
         end,
         inline_css = case
           when instr(nvl(inline_css, empty_clob()), 'preserve authored Bill Details pairs') = 0
             then nvl(inline_css, empty_clob()) || l_css
           else inline_css
         end,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 143
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Expected one Page 143 record; found ' || sql%rowcount);
  end if;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release            => '26.1.2',
    p_default_workspace_id => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset => 7541489808702750,
    p_default_owner => 'IMART'
  );
  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
end;
/
commit;
exit
