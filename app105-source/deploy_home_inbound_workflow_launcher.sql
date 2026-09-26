whenever sqlerror exit sql.sqlcode rollback
set define off
connect -name IMART

begin
  wwv_flow_imp.component_begin(
    p_version_yyyy_mm_dd => '2026.03.30',
    p_release => '26.1.2',
    p_default_workspace_id => 4744311978888504,
    p_default_application_id => 105,
    p_default_id_offset => 7541489808702750,
    p_default_owner => 'IMART'
  );
  wwv_flow_imp_shared.create_flow_process(
    p_id => wwv_flow_imp.id(900000000000144),
    p_process_sequence => 11,
    p_process_point => 'ON_DEMAND',
    p_process_name => 'OPEN_INBOUND_WORKFLOW_MODULE',
    p_static_id => 'open-inbound-workflow-module',
    p_process_sql_clob => q'~
declare
  l_module_code module.modulecode%type := upper(trim(apex_application.g_x01));
  l_page_id     number;
begin
  select nvl(m.entrypageno, m.pageno)
    into l_page_id
    from module m
   where m.modulecode = l_module_code
     and upper(nvl(m.isactive, 'NO')) = 'YES'
     and exists (
       select 1
         from moduleprivilege mp
         join bossuser bu on bu.bossusercode = mp.bossusercode
        where mp.modulecode = m.modulecode
          and upper(bu.bossusername) = upper(v('APP_USER'))
          and mp.companycode = v('GLOBAL_COMPANYCODE')
          and upper(nvl(mp.viewprivilege, 'NO')) = 'YES'
     );

  apex_json.open_object;
  apex_json.write('allowed', true);
  apex_json.write('pageId', l_page_id);
  apex_json.close_object;
exception
  when no_data_found then
    apex_json.open_object;
    apex_json.write('allowed', false);
    apex_json.close_object;
end;
~',
    p_process_clob_language => 'PLSQL',
    p_security_scheme => 'MUST_NOT_BE_PUBLIC_USER'
  );
  wwv_flow_imp.component_end;
end;
/

declare
  l_js clob := q'~

/* Home: full inbound workflow launcher with server-side rights checks. */
(function () {
  var modules = [
    ['INDENT', 'Indent', '▤'],
    ['ENQUIRY', 'Purchase Enquiry', '⌕'],
    ['QUOTATION', 'Purchase Quotation', '◫'],
    ['COMPARATIVESTATEMENT', 'Comparative Statement', '≋'],
    ['RATECONTRACT', 'Rate Contract', '₹'],
    ['PURCHASEORDER', 'Purchase Order', '⌁'],
    ['POAMENDMENT', 'PO Amendment', '✎'],
    ['LOADINGADVICE', 'Loading Advice', '⇣'],
    ['MATERIALIN', 'Material In', '✓'],
    ['GRN', 'GRN', '▣'],
    ['FREIGHTADVICE', 'Freight Advice', '▱'],
    ['PURCHASEBILL', 'Purchase Bill', '◧'],
    ['PBPASS', 'Purchase Bill Pass', '✓'],
    ['PAYMENTADVICE', 'Payment Advice', '₹'],
    ['VOUCHER', 'Voucher Posting', '▰']
  ];
  function message(text) {
    if (window.apex && apex.message && apex.message.alert) apex.message.alert(text);
    else window.alert(text);
  }
  function openModule(moduleCode) {
    apex.server.process('OPEN_INBOUND_WORKFLOW_MODULE', {x01: moduleCode}, {
      dataType: 'json',
      success: function (result) {
        if (!result || !result.allowed || !result.pageId) {
          message('You don’t have rights for this module.');
          return;
        }
        apex.navigation.redirect('f?p=' + $v('pFlowId') + ':' + result.pageId + ':' + $v('pInstance') + '::::');
      },
      error: function () { message('You don’t have rights for this module.'); }
    });
  }
  function renderLauncher() {
    var focus = document.querySelector('.imart-home-focus');
    var links = focus && focus.querySelector('.imart-home-focus-links');
    if (!focus || !links || links.dataset.workflowReady) return;
    links.dataset.workflowReady = 'true';
    focus.querySelector('.imart-home-kicker').textContent = 'Workflow launcher';
    focus.querySelector('h2').textContent = 'Keep the inbound cycle moving';
    focus.querySelector('p').textContent = 'Start the right purchasing or inbound workflow. Access is checked for your user before the page opens.';
    links.classList.add('imart-home-workflow-grid');
    links.innerHTML = modules.map(function (module, index) {
      return '<button type="button" class="imart-home-workflow-card imart-home-workflow-card--' + (index % 5) + '" data-module="' + module[0] + '">' +
        '<span class="imart-home-workflow-icon">' + module[2] + '</span><span>' + module[1] + '</span><b aria-hidden="true">→</b></button>';
    }).join('');
    links.addEventListener('click', function (event) {
      var card = event.target.closest('.imart-home-workflow-card');
      if (card) openModule(card.getAttribute('data-module'));
    });
  }
  if (document.readyState === 'loading') document.addEventListener('DOMContentLoaded', renderLauncher, {once: true});
  else renderLauncher();
}());
~';
  l_css clob := q'~

/* Full-width, rights-aware workflow launcher on Home. */
.imart-home-lower:has(.imart-home-workflow-grid) { grid-template-columns: 1fr !important; }
.imart-home-focus:has(.imart-home-workflow-grid) { grid-column: 1 / -1 !important; }
.imart-home-workflow-grid { grid-template-columns: repeat(5, minmax(0, 1fr)) !important; gap: 10px !important; }
.imart-home-workflow-card { min-width: 0; min-height: 56px; display: flex; align-items: center; gap: 10px; padding: 10px 12px; color: #fff; font: inherit; font-size: 13px; font-weight: 700; text-align: left; cursor: pointer; border: 1px solid rgba(255,255,255,.18); border-radius: 11px; background: rgba(255,255,255,.08); transition: transform .16s ease, background .16s ease, border-color .16s ease; }
.imart-home-workflow-card:hover, .imart-home-workflow-card:focus-visible { transform: translateY(-2px); background: rgba(255,255,255,.16); border-color: rgba(255,255,255,.36); outline: 0; }
.imart-home-workflow-card span:nth-child(2) { min-width: 0; flex: 1; line-height: 1.25; }
.imart-home-workflow-card b { font-size: 18px; font-weight: 700; }
.imart-home-workflow-icon { width: 29px; height: 29px; flex: 0 0 29px; display: grid; place-items: center; color: #18316f; border-radius: 8px; background: #d9e6ff; font-size: 15px; }
.imart-home-workflow-card--1 .imart-home-workflow-icon { background: #c9f1ed; color: #087b78; }
.imart-home-workflow-card--2 .imart-home-workflow-icon { background: #fff0c8; color: #a85c00; }
.imart-home-workflow-card--3 .imart-home-workflow-icon { background: #eadfff; color: #6744c2; }
.imart-home-workflow-card--4 .imart-home-workflow-icon { background: #ffdbe6; color: #b7355b; }
@media (max-width: 1100px) { .imart-home-workflow-grid { grid-template-columns: repeat(3, minmax(0, 1fr)) !important; } }
@media (max-width: 680px) { .imart-home-workflow-grid { grid-template-columns: 1fr !important; } }
~';
begin
  update apex_260100.wwv_flow_steps
     set javascript_code_onload = case
           when instr(nvl(javascript_code_onload, empty_clob()), 'Home: full inbound workflow launcher') = 0
             then nvl(javascript_code_onload, empty_clob()) || l_js
           else javascript_code_onload
         end,
         inline_css = case
           when instr(nvl(inline_css, empty_clob()), 'rights-aware workflow launcher on Home') = 0
             then nvl(inline_css, empty_clob()) || l_css
           else inline_css
         end,
         last_updated_on = sysdate
   where flow_id = 105
     and id = 1
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20003, 'Expected one Page 1 record; found ' || sql%rowcount);
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
