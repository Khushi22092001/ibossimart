whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

/*
  Home only: add the existing Order-to-Cash outward process as a second
  workflow launcher.  This leaves all transaction pages, their layouts,
  LOVs, processes and navigation untouched.
*/
declare
  l_js clob := q'~

/* Home: Order-to-Cash outward workflow launcher. */
(function () {
  var modules = [
    ['SALESENQUIRY', 'Sales Enquiry', '⌕'],
    ['SALESQUOTATION', 'Sales Quotation', '◫'],
    ['PORECEIPT', 'PO Receipt', '▣'],
    ['SALESORDER', 'Sales Order', '⌁'],
    ['LOADINGADVICE', 'Loading Advice', '⇣'],
    ['DESPATCHADVICE', 'Dispatch Advice', '▱'],
    ['CCINVOICE', 'CC Invoice', '▤'],
    ['FREIGHTADVICE', 'Freight Advice', '₹'],
    ['BILLRECEIPT', 'Bill Receipt', '✓']
  ];

  function showNoRights() {
    if (window.apex && apex.message && apex.message.alert) {
      apex.message.alert('You don’t have rights for this module.');
    } else {
      window.alert('You don’t have rights for this module.');
    }
  }

  function openModule(moduleCode) {
    apex.server.process('OPEN_INBOUND_WORKFLOW_MODULE', { x01: moduleCode }, {
      dataType: 'json',
      success: function (result) {
        if (!result || !result.allowed || !result.pageId) {
          showNoRights();
          return;
        }
        apex.navigation.redirect('f?p=' + $v('pFlowId') + ':' + result.pageId + ':' + $v('pInstance') + '::::');
      },
      error: showNoRights
    });
  }

  function renderOutwardWorkflow() {
    var lower = document.querySelector('.imart-home-lower');
    if (!lower || lower.querySelector('.imart-home-outward')) return;

    var section = document.createElement('section');
    section.className = 'imart-home-focus imart-home-outward';
    section.setAttribute('aria-label', 'Order to Cash outward workflow');
    section.innerHTML =
      '<div class="imart-home-kicker">Order to Cash</div>' +
      '<h2>Keep the outward cycle moving</h2>' +
      '<p>Move from a sales enquiry through billing using the same role-based access checks as the Order to Cash module.</p>' +
      '<div class="imart-home-focus-links imart-home-workflow-grid imart-home-outward-grid"></div>';

    var day = lower.querySelector('.imart-home-day');
    if (day) lower.insertBefore(section, day);
    else lower.appendChild(section);

    var links = section.querySelector('.imart-home-outward-grid');
    links.innerHTML = modules.map(function (module, index) {
      return '<button type="button" class="imart-home-workflow-card imart-home-workflow-card--' + (index % 5) + '" data-module="' + module[0] + '">' +
        '<span class="imart-home-workflow-icon">' + module[2] + '</span><span>' + module[1] + '</span><b aria-hidden="true">→</b></button>';
    }).join('');
    links.addEventListener('click', function (event) {
      var card = event.target.closest('.imart-home-workflow-card');
      if (card) openModule(card.getAttribute('data-module'));
    });
  }

  if (document.readyState === 'loading') {
    document.addEventListener('DOMContentLoaded', renderOutwardWorkflow, { once: true });
  } else {
    window.setTimeout(renderOutwardWorkflow, 0);
  }
}());
~';
begin
  update apex_260100.wwv_flow_steps
     set javascript_code_onload = case
           when instr(nvl(javascript_code_onload, empty_clob()), 'Home: Order-to-Cash outward workflow launcher') = 0
             then nvl(javascript_code_onload, empty_clob()) || l_js
           else javascript_code_onload
         end,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 1
     and security_group_id = 4744311978888504;

  if sql%rowcount <> 1 then
    raise_application_error(-20001, 'Home page was not updated');
  end if;
end;
/
commit;

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release => '26.1.2',
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
