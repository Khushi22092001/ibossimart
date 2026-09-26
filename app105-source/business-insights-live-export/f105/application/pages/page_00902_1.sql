prompt --application/pages/page_00902
begin
--   Manifest
--     PAGE: 00902
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>902
,p_name=>'Trial Balance Intelligence'
,p_alias=>'TRIAL-BALANCE-INTELLIGENCE'
,p_step_title=>'Trial Balance Intelligence'
,p_reload_on_submit=>'A'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'function tbCompactAccountSelections(){',
'  var c=document.getElementById(''P902_ACCOUNTGROUP_CONTAINER'');',
'  if(!c){return;}',
'  c.querySelectorAll(''.tb-account-more:not(.a-ComboSelect-counter)'').forEach(function(n){n.remove();});',
'  var chips=[],seen=new Set();',
'  c.querySelectorAll(''.a-Chip--applied,.oj-select-selected-choice,.select2-selection__choice,.a-Combobox-chip,.apex-item-selectMany-chip,[class*="selected-choice"]'').forEach(function(n){',
'    if(!seen.has(n)){seen.add(n);chips.push(n);}',
'  });',
'  chips.forEach(function(n,i){n.style.setProperty(''display'',i<2?''inline-flex'':''none'',''important'');});',
'  var counter=c.querySelector(''.a-ComboSelect-counter'');',
'  if(counter){',
'    var extra=Math.max(chips.length-2,0),label=''+''+extra+'' more'';',
'    counter.classList.toggle(''tb-account-more'',extra>0);',
'    counter.classList.toggle(''u-hidden'',extra===0);',
'    if(extra>0&&counter.textContent!==label){counter.textContent=label;}',
'    counter.setAttribute(''aria-label'',extra>0?extra+'' more selected accounts'':chips.length+'' accounts selected'');',
'  }',
'}',
'setTimeout(function(){',
'  var r=document.getElementById(''tb-filters'');',
'  if(!r){return;}',
'  r.classList.remove(''hspl-drawer'');',
'  r.removeAttribute(''role'');',
'  r.removeAttribute(''aria-label'');',
'  r.style.removeProperty(''transform'');',
'  r.style.removeProperty(''visibility'');',
'  document.documentElement.classList.remove(''hspl-drawer-open'');',
'  document.querySelectorAll(''.hspl-filter-trigger,.hspl-drawer-overlay,.hspl-drawer-close'').forEach(function(n){n.remove();});',
'  var actions=r.querySelector(''.t-Region-buttons-right''),apply=document.getElementById(''B2026092309021200'');',
'  if(actions&&apply){actions.insertBefore(apply,actions.firstChild);}',
'  r.querySelectorAll(''.hspl-reset-btn'').forEach(function(n){n.remove();});',
'  r.querySelectorAll(''.hspl-filter-footer'').forEach(function(n){if(!n.children.length){n.remove();}});',
'  tbCompactAccountSelections();',
'  var ac=document.getElementById(''P902_ACCOUNTGROUP_CONTAINER'');',
'  if(ac){new MutationObserver(function(){window.requestAnimationFrame(tbCompactAccountSelections);}).observe(ac,{childList:true,subtree:true,attributes:true,attributeFilter:[''class'',''aria-checked'']});}',
'},120);',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'html.page-902 .t-Body-contentInner{padding-top:8px!important}',
'html.page-902 #tb-filters{margin-bottom:10px!important}',
'html.page-902 #tb-filters.hspl-drawer{position:relative!important;inset:auto!important;right:auto!important;top:auto!important;width:auto!important;max-width:none!important;height:auto!important;max-height:none!important;transform:none!important;visi'
||'bility:visible!important;opacity:1!important;z-index:auto!important;box-shadow:none!important}',
'html.page-902 .hspl-filter-trigger,html.page-902 .hspl-drawer-overlay,html.page-902 #tb-filters .hspl-drawer-close{display:none!important}',
'html.page-902 #tb-filters>.t-Region-header{display:none!important}',
'html.page-902 #tb-filters>.t-Region-bodyWrap,html.page-902 #tb-filters>.t-Region-bodyWrap>.t-Region-body{overflow:visible!important}',
'html.page-902 #tb-filters>.t-Region-bodyWrap>.t-Region-body{padding:16px 18px 12px!important}',
'html.page-902 #tb-filters .t-Form-fieldContainer{margin-bottom:8px!important}',
'html.page-902 #tb-filters .t-Form-fieldContainer,html.page-902 #tb-filters .t-Form-inputContainer,html.page-902 #tb-filters .t-Form-itemWrapper{min-width:0!important}',
'html.page-902 #tb-filters .apex-item-wrapper--single-checkbox>.t-Form-labelContainer{display:none!important;width:0!important}',
'html.page-902 #tb-filters .apex-item-wrapper--single-checkbox>.t-Form-inputContainer{float:none!important;width:100%!important;max-width:100%!important;padding:0!important}',
'html.page-902 #tb-filters .t-Button{min-height:42px!important}',
'html.page-902 #tb-filters .container{display:grid!important;grid-template-columns:repeat(12,minmax(0,1fr))!important;gap:10px 12px!important}',
'html.page-902 #tb-filters .container>.row,html.page-902 #tb-filters .container>.row>.col,html.page-902 #tb-filters .hspl-daterow{display:contents!important}',
'html.page-902 #P902_FROMDATE_CONTAINER{grid-column:1/span 2!important;grid-row:1!important}',
'html.page-902 #P902_TODATE_CONTAINER{grid-column:3/span 2!important;grid-row:1!important}',
'html.page-902 #P902_COMPANY_CONTAINER{grid-column:5/span 2!important;grid-row:1!important}',
'html.page-902 #P902_LOCATION_CONTAINER{grid-column:7/span 2!important;grid-row:1!important}',
'html.page-902 #P902_LEVEL_CONTAINER{grid-column:9/span 1!important;grid-row:1!important}',
'html.page-902 #P902_ACCOUNTGROUP_CONTAINER{grid-column:10/span 2!important;grid-row:1!important}',
'html.page-902 #P902_ACCOUNTGROUP_CONTAINER .oj-text-field-container,html.page-902 #P902_ACCOUNTGROUP_CONTAINER .oj-select-choice,html.page-902 #P902_ACCOUNTGROUP_CONTAINER .select2-selection{min-height:42px!important;max-height:42px!important;overflo'
||'w:hidden!important}',
'html.page-902 #P902_ACCOUNTGROUP_CONTAINER .a-Chip--applied,html.page-902 #P902_ACCOUNTGROUP_CONTAINER .oj-select-selected-choice,html.page-902 #P902_ACCOUNTGROUP_CONTAINER .select2-selection__choice{display:inline-flex!important;max-width:82px!impor'
||'tant;height:26px!important;margin:4px 3px 3px 0!important;padding:0!important;border:1px solid #cbd5ff!important;border-radius:7px!important;background:#eef2ff!important;color:#24345f!important;font-size:12px!important;line-height:24px!important;text'
||'-decoration:none!important;white-space:nowrap!important;overflow:hidden!important}',
'html.page-902 #P902_ACCOUNTGROUP_CONTAINER .a-Chip--applied .a-Chip-text{min-width:0!important;overflow:hidden!important;text-overflow:ellipsis!important}',
'html.page-902 #P902_ACCOUNTGROUP_CONTAINER .a-Chip--applied .a-Chip-value{display:block!important;overflow:hidden!important;text-overflow:ellipsis!important;white-space:nowrap!important}',
'html.page-902 #P902_ACCOUNTGROUP_CONTAINER .a-Chip--applied .a-Chip-remove{flex:0 0 22px!important;color:#52608d!important}',
'html.page-902 #P902_ACCOUNTGROUP_CONTAINER .a-ComboSelect-counter.tb-account-more{display:inline-flex!important;position:static!important;min-width:auto!important;width:auto!important}',
'html.page-902 .tb-account-more{display:inline-flex!important;align-items:center!important;height:26px!important;margin:4px 2px!important;padding:0 8px!important;border-radius:999px!important;background:#e6eaff!important;color:#3446a8!important;font-s'
||'ize:12px!important;font-weight:800!important;white-space:nowrap!important}',
'html.page-902 [id^="CS_902_P902_ACCOUNTGROUP"] [role="option"],html.page-902 [id*="P902_ACCOUNTGROUP"][role="listbox"] [role="option"]{padding:7px 10px!important;color:#26324a!important;font-size:13px!important;line-height:18px!important;text-decorat'
||'ion:none!important;white-space:normal!important}',
'html.page-902 [id^="CS_902_P902_ACCOUNTGROUP"] [role="option"][aria-checked="true"],html.page-902 [id*="P902_ACCOUNTGROUP"][role="listbox"] [role="option"][aria-checked="true"]{background:#eef2ff!important;color:#1f3475!important;font-weight:700!impo'
||'rtant;text-decoration:none!important;box-shadow:inset 3px 0 #5b61df!important}',
'html.page-902 [id^="CS_902_P902_ACCOUNTGROUP"] [role="option"]:hover,html.page-902 [id*="P902_ACCOUNTGROUP"][role="listbox"] [role="option"]:hover{background:#f5f7ff!important;color:#172033!important;text-decoration:none!important}',
'html.page-902 #P902_LEDGERONLY_CONTAINER{grid-column:12/span 1!important;grid-row:1!important}',
'html.page-902 #P902_PNLBUCKET_CONTAINER{grid-column:10/span 2!important;grid-row:2!important;padding:8px 10px!important;border:1px solid #ded8ff!important;border-radius:10px!important;background:#f5f2ff!important}',
'html.page-902 #P902_ZERO_CONTAINER{grid-column:1/span 3!important;grid-row:2!important;display:none!important}',
'html.page-902 #P902_NOMOVE_CONTAINER{grid-column:4/span 4!important;grid-row:2!important;display:none!important}',
'html.page-902 #tb-filters.tb-advanced-open #P902_ZERO_CONTAINER,html.page-902 #tb-filters.tb-advanced-open #P902_NOMOVE_CONTAINER{display:block!important}',
'html.page-902 #trial-balance{overflow:visible!important;position:relative!important}',
'html.page-902 #trial-balance .t-Region-body{padding:0!important;overflow:visible!important}',
'html.page-902 #trial-balance .a-IRR-tableContainer{overflow-x:auto!important}',
'html.page-902 #trial-balance table.a-IRR-table{min-width:1420px!important}',
'html.page-902 #trial-balance th,html.page-902 #trial-balance td{white-space:nowrap!important}',
'html.page-902 #trial-balance th:first-child,html.page-902 #trial-balance td:first-child{text-align:left!important}',
'html.page-902 #trial-balance tbody tr:hover td{background:#eef4ff!important;color:#172033!important}',
'html.page-902 #trial-balance tbody tr:hover a{color:#234ed8!important}',
'html.page-902 #trial-balance .ds-fintree-code{display:none!important}',
'html.page-902 #trial-balance [class*="ds-fintree-l"]{position:relative!important;display:inline-block!important;min-height:24px!important;line-height:24px!important;vertical-align:middle!important;transition:color .15s ease!important}',
'html.page-902 #trial-balance .ds-fintree-l1{padding:4px 10px 4px 12px!important;border-left:4px solid #d97706!important;border-radius:4px!important;background:#fff7e8!important;font-weight:800!important;letter-spacing:.025em!important;text-transform:'
||'uppercase!important}',
'html.page-902 #trial-balance .ds-fintree-l1,html.page-902 #trial-balance .ds-fintree-l1 a{color:#7c3f08!important;font-weight:800!important}',
'html.page-902 #trial-balance tbody tr:has(.ds-fintree-l1)>td{background:#fffaf2!important;border-top:1px solid #f4d7a5!important;border-bottom:1px solid #f4d7a5!important}',
'html.page-902 #trial-balance .ds-fintree-l2{padding-left:24px!important;font-weight:800!important;text-transform:uppercase!important;letter-spacing:.018em!important}',
'html.page-902 #trial-balance .ds-fintree-l2,html.page-902 #trial-balance .ds-fintree-l2 a{color:#1e3f91!important;font-weight:800!important}',
'html.page-902 #trial-balance tbody tr:has(.ds-fintree-l2)>td:first-child{background:#f5f8ff!important}',
'html.page-902 #trial-balance .ds-fintree-grp:not(.ds-fintree-l1):before{content:""!important;display:inline-block!important;width:12px!important;height:11px!important;margin-right:8px!important;border-left:1.5px solid #a9b8d2!important;border-bottom:'
||'1.5px solid #a9b8d2!important;transform:translateY(-4px)!important}',
'html.page-902 #trial-balance .ds-fintree-l3,html.page-902 #trial-balance .ds-fintree-l4,html.page-902 #trial-balance .ds-fintree-l5,html.page-902 #trial-balance .ds-fintree-l6,html.page-902 #trial-balance .ds-fintree-l7,html.page-902 #trial-balance .'
||'ds-fintree-l8{font-weight:700!important}',
'html.page-902 #trial-balance .ds-fintree-grp,html.page-902 #trial-balance .ds-fintree-grp a{color:#3155b7!important;font-weight:700!important;text-decoration:none!important;border-bottom:1px dashed #b9c5e5!important}',
'html.page-902 #trial-balance .ds-fintree-grp.ds-fintree-l1 a{color:#7c3f08!important;font-weight:800!important;border-bottom:0!important}',
'html.page-902 #trial-balance .ds-fintree-grp.ds-fintree-l2 a{color:#1e3f91!important;font-weight:800!important}',
'html.page-902 #trial-balance .ds-fintree-leaf:before{content:""!important;display:inline-block!important;width:6px!important;height:6px!important;margin:0 10px 1px 2px!important;border-radius:50%!important;background:#9aa9c2!important;box-shadow:0 0 '
||'0 3px #eef2f8!important}',
'html.page-902 #trial-balance .ds-fintree-leaf,html.page-902 #trial-balance .ds-fintree-leaf a{color:#1769c2!important;font-weight:500!important;border-bottom:0!important;text-decoration:none!important}',
'html.page-902 #trial-balance .ds-fintree-flat{padding-left:2px!important}',
'html.page-902 #trial-balance .ds-fintree-flat:before{content:""!important;display:inline-block!important;width:6px!important;height:6px!important;margin:0 10px 1px 2px!important;border-radius:50%!important;background:#9aa9c2!important}',
'html.page-902 #trial-balance .ds-nolink,html.page-902 #trial-balance .ds-nolink a{pointer-events:none!important;cursor:default!important;text-decoration:none!important}',
'html.page-902 .a-IRR-sortWidget .ds-fintree-code{display:none!important}',
'html.page-902 .a-IRR-sortWidget [class*="ds-fintree"]{display:inline!important;min-height:0!important;line-height:inherit!important;padding:0!important;margin:0!important;border:0!important;background:transparent!important;box-shadow:none!important;t'
||'ext-transform:none!important;letter-spacing:normal!important}',
'html.page-902 .a-IRR-sortWidget [class*="ds-fintree"]:before{display:none!important;content:none!important}',
'html.page-902 .a-IRR-sortWidget [class*="ds-fintree"] a{color:#27344d!important;font-weight:500!important;text-decoration:none!important;border:0!important;pointer-events:none!important;cursor:pointer!important}',
'html.page-902 .a-IRR-sortWidget .ds-fintree-total{color:#27344d!important;font-weight:500!important}',
'html.page-902 #trial-balance .a-IRR-table td:first-child{position:sticky;left:0;z-index:2;background:#fff!important;min-width:330px!important}',
'html.page-902 #trial-balance .a-IRR-table th:first-child{position:sticky;left:0;z-index:3;background:#eef1ff!important;min-width:330px!important}',
'html.page-902 #trial-balance .a-IRR-table tbody tr:nth-child(even) td:first-child{background:#fafbff!important}',
'html.page-902 .ds-fintree-total{font-weight:800;color:#17213a;white-space:nowrap}',
'html.page-902 #trial-balance_data_panel tbody tr:last-child td{font-weight:700;background:#f5f7fb!important;border-top:2px solid #cbd4e4}',
'html.page-902 .tb-advanced-item{display:none!important}',
'html.page-902 .t-Form-fieldContainer:has(.tb-advanced-item){display:none!important}',
'html.page-902 #tb-filters.tb-advanced-open .tb-advanced-item{display:block!important}',
'html.page-902 #tb-filters.tb-advanced-open .t-Form-fieldContainer:has(.tb-advanced-item){display:block!important}',
'html.page-902 .tb-advanced-item .t-Form-label{white-space:normal!important}',
'html.page-902 #B2026092309021230{display:none}',
'html.page-902 #tb-filters.tb-advanced-open #B2026092309021230{display:inline-flex}',
'html.page-902 .ds-fin-headcta{display:inline-flex;align-items:center;gap:8px;float:right;margin-top:2px;padding:9px 13px;border:1px solid rgba(255,255,255,.28);border-radius:9px;color:#fff!important;text-decoration:none;font-weight:700}',
'html.page-902 .ds-fin-headcta:hover{background:rgba(255,255,255,.13);color:#fff!important}',
'html.page-902 #balance-control{margin-bottom:14px}',
'html.page-902 #balance-control[hidden]{display:none!important}',
'html.page-902 .ds-finnote{margin-bottom:14px!important}',
'html.page-902 #tb-heading .ds-fin-section{display:flex!important;align-items:center!important;gap:16px!important}',
'html.page-902 #tb-heading .ds-fin-section>p{flex:1 1 auto!important;margin-right:auto!important}',
'@media(max-width:1100px){html.page-902 #tb-filters .container{grid-template-columns:repeat(6,minmax(0,1fr))!important}html.page-902 #P902_FROMDATE_CONTAINER{grid-column:1/span 2!important;grid-row:1!important}html.page-902 #P902_TODATE_CONTAINER{grid'
||'-column:3/span 2!important;grid-row:1!important}html.page-902 #P902_COMPANY_CONTAINER{grid-column:5/span 2!important;grid-row:1!important}html.page-902 #P902_LOCATION_CONTAINER{grid-column:1/span 2!important;grid-row:2!important}html.page-902 #P902_L'
||'EVEL_CONTAINER{grid-column:3/span 1!important;grid-row:2!important}html.page-902 #P902_ACCOUNTGROUP_CONTAINER{grid-column:4/span 2!important;grid-row:2!important}html.page-902 #P902_LEDGERONLY_CONTAINER{grid-column:6/span 1!important;grid-row:2!impor'
||'tant}html.page-902 #P902_PNLBUCKET_CONTAINER{grid-column:4/span 2!important;grid-row:3!important}html.page-902 #P902_ZERO_CONTAINER{grid-column:1/span 3!important;grid-row:3!important}html.page-902 #P902_NOMOVE_CONTAINER{grid-column:4/span 3!importan'
||'t;grid-row:3!important}}',
'@media(max-width:760px){html.page-902 #tb-filters>.t-Region-bodyWrap>.t-Region-body{padding:12px!important}html.page-902 #tb-filters .container{grid-template-columns:repeat(2,minmax(0,1fr))!important}html.page-902 #P902_FROMDATE_CONTAINER,html.page-9'
||'02 #P902_TODATE_CONTAINER,html.page-902 #P902_COMPANY_CONTAINER,html.page-902 #P902_LOCATION_CONTAINER,html.page-902 #P902_LEVEL_CONTAINER,html.page-902 #P902_ACCOUNTGROUP_CONTAINER,html.page-902 #P902_LEDGERONLY_CONTAINER,html.page-902 #P902_PNLBUCK'
||'ET_CONTAINER,html.page-902 #P902_ZERO_CONTAINER,html.page-902 #P902_NOMOVE_CONTAINER{grid-column:auto!important;grid-row:auto!important}html.page-902 #P902_ACCOUNTGROUP_CONTAINER,html.page-902 #P902_PNLBUCKET_CONTAINER,html.page-902 #P902_ZERO_CONTAI'
||'NER,html.page-902 #P902_NOMOVE_CONTAINER{grid-column:1/-1!important}}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026092309021500)
,p_plug_name=>'Balance Basis'
,p_static_id=>'balance-basis'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_source=>'<div class="ds-finnote"><span class="fa fa-info-circle"></span><strong>How these numbers are made.</strong> Opening = the Opening table at the financial-year begin (the ERP year-end close, which resets every Income and Expenditure account and carries'
||' their net into PROFITANDLOSSACCOUNT) plus VoucherDetail movement from that date to the day before From Date. Movement = VoucherDetail between From Date and To Date. Closing = Opening + Movement. A debit is a negative Amount and a credit a positive o'
||'ne. Carry-forward vouchers numbered OPENING are excluded from movement because they are the opening. Differences are compared at full precision, never on the rounded figure shown.</div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2026092309021400)
,p_name=>'Balance Control'
,p_static_id=>'balance-control'
,p_region_name=>'balance-control'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_css_classes=>'ds-finbalwrap'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch'
,p_region_attributes=>'hidden'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'with fy as (',
'  select nvl((select f.financialyearbegin from financialyear f',
'               where to_date(:P902_FROMDATE,''DD-MM-RRRR'') between f.financialyearbegin and f.financialyearend),',
'             to_date(:P902_FROMDATE,''DD-MM-RRRR'')) fb from dual',
'), carry as (',
'  select v.tno from voucher v where v.voucherno=''OPENING''',
'), op as (',
'  select o.accountcode,sum(nvl(o.openingamount,0)) amt',
'    from opening o,fy',
'   where o.openingdate=fy.fb',
'     and (:P902_COMPANY is null or o.companycode=:P902_COMPANY)',
'     and (:P902_LOCATION is null or o.locationcode=:P902_LOCATION)',
'   group by o.accountcode',
'), mv as (',
'  select d.accountcode,',
'         sum(case when d.voucherdate<to_date(:P902_FROMDATE,''DD-MM-RRRR'') then nvl(d.amount,0) else 0 end) pre,',
'         sum(case when d.voucherdate>=to_date(:P902_FROMDATE,''DD-MM-RRRR'') and nvl(d.amount,0)<0 then -d.amount else 0 end) dr,',
'         sum(case when d.voucherdate>=to_date(:P902_FROMDATE,''DD-MM-RRRR'') and nvl(d.amount,0)>0 then d.amount else 0 end) cr',
'    from voucherdetail d,fy',
'   where d.voucherdate>=fy.fb and d.voucherdate<to_date(:P902_TODATE,''DD-MM-RRRR'')+1',
'     and d.tno not in (select tno from carry)',
'     and (:P902_COMPANY is null or d.companycode=:P902_COMPANY)',
'     and (:P902_LOCATION is null or d.locationcode=:P902_LOCATION)',
'   group by d.accountcode',
'), bal as (',
'  select greatest(-(nvl(o.amt,0)+nvl(m.pre,0)),0) od,',
'         greatest( (nvl(o.amt,0)+nvl(m.pre,0)),0) oc,',
'         nvl(m.dr,0) pd,nvl(m.cr,0) pc,',
'         greatest(-(nvl(o.amt,0)+nvl(m.pre,0)-nvl(m.dr,0)+nvl(m.cr,0)),0) cd,',
'         greatest( (nvl(o.amt,0)+nvl(m.pre,0)-nvl(m.dr,0)+nvl(m.cr,0)),0) cc',
'    from op o full outer join mv m on m.accountcode=o.accountcode',
'), t as (',
'  select sum(od) od,sum(oc) oc,sum(pd) pd,sum(pc) pc,sum(cd) cd,sum(cc) cc from bal',
')',
'select ''<div class="ds-finbal ds-finbal--''',
' ||case when abs(nvl(od,0)-nvl(oc,0))<.005 then ''ok'' when abs(nvl(od,0)-nvl(oc,0))<1 then ''warn'' else ''bad'' end||''">''',
' ||''<div class="ds-finbal-t"><span class="fa fa-flag-o"></span>Opening as at ''||apex_escape.html(:P902_FROMDATE)||''</div>''',
' ||''<div class="ds-finbal-pair"><dl class="ds-finbal-side ds-finbal-side--dr"><dt>Opening Debit</dt><dd>&#8377;''',
' ||case when nvl(od,0)>=10000000 then to_char(od/10000000,''FM9G99G990D00'')||''<i>Cr</i>'' when nvl(od,0)>=100000 then to_char(od/100000,''FM99G990D00'')||''<i>L</i>'' else to_char(nvl(od,0),''FM99G99G990D00'') end',
' ||''</dd></dl><dl class="ds-finbal-side ds-finbal-side--cr"><dt>Opening Credit</dt><dd>&#8377;''',
' ||case when nvl(oc,0)>=10000000 then to_char(oc/10000000,''FM9G99G990D00'')||''<i>Cr</i>'' when nvl(oc,0)>=100000 then to_char(oc/100000,''FM99G990D00'')||''<i>L</i>'' else to_char(nvl(oc,0),''FM99G99G990D00'') end',
' ||''</dd></dl></div><div class="ds-finbal-foot"><span class="ds-finbal-diff">Difference <b>&#8377;''||to_char(abs(nvl(od,0)-nvl(oc,0)),''FM9G99G99G99G99G990D00'')||''</b></span>''',
' ||case when abs(nvl(od,0)-nvl(oc,0))<.005 then ''<span class="ds-finbal-flag"><span class="fa fa-check"></span>In balance</span>'' else ''<span class="ds-finbal-flag"><span class="fa fa-exclamation-triangle"></span>Out of balance</span>'' end||''</div></'
||'div>'' bal_opening,',
' ''<div class="ds-finbal ds-finbal--''',
' ||case when abs(nvl(pd,0)-nvl(pc,0))<.005 then ''ok'' when abs(nvl(pd,0)-nvl(pc,0))<1 then ''warn'' else ''bad'' end||''">''',
' ||''<div class="ds-finbal-t"><span class="fa fa-exchange"></span>Movement ''||apex_escape.html(:P902_FROMDATE)||'' &ndash; ''||apex_escape.html(:P902_TODATE)||''</div>''',
' ||''<div class="ds-finbal-pair"><dl class="ds-finbal-side ds-finbal-side--dr"><dt>Period Debit</dt><dd>&#8377;''',
' ||case when nvl(pd,0)>=10000000 then to_char(pd/10000000,''FM9G99G990D00'')||''<i>Cr</i>'' when nvl(pd,0)>=100000 then to_char(pd/100000,''FM99G990D00'')||''<i>L</i>'' else to_char(nvl(pd,0),''FM99G99G990D00'') end',
' ||''</dd></dl><dl class="ds-finbal-side ds-finbal-side--cr"><dt>Period Credit</dt><dd>&#8377;''',
' ||case when nvl(pc,0)>=10000000 then to_char(pc/10000000,''FM9G99G990D00'')||''<i>Cr</i>'' when nvl(pc,0)>=100000 then to_char(pc/100000,''FM99G990D00'')||''<i>L</i>'' else to_char(nvl(pc,0),''FM99G99G990D00'') end',
' ||''</dd></dl></div><div class="ds-finbal-foot"><span class="ds-finbal-diff">Difference <b>&#8377;''||to_char(abs(nvl(pd,0)-nvl(pc,0)),''FM9G99G99G99G99G990D00'')||''</b></span>''',
' ||case when abs(nvl(pd,0)-nvl(pc,0))<.005 then ''<span class="ds-finbal-flag"><span class="fa fa-check"></span>In balance</span>'' else ''<span class="ds-finbal-flag"><span class="fa fa-exclamation-triangle"></span>Out of balance</span>'' end||''</div></'
||'div>'' bal_movement,',
' ''<div class="ds-finbal ds-finbal--''',
' ||case when abs(nvl(cd,0)-nvl(cc,0))<.005 then ''ok'' when abs(nvl(cd,0)-nvl(cc,0))<1 then ''warn'' else ''bad'' end||''">''',
' ||''<div class="ds-finbal-t"><span class="fa fa-balance-scale"></span>Closing as at ''||apex_escape.html(:P902_TODATE)||''</div>''',
' ||''<div class="ds-finbal-pair"><dl class="ds-finbal-side ds-finbal-side--dr"><dt>Closing Debit</dt><dd>&#8377;''',
' ||case when nvl(cd,0)>=10000000 then to_char(cd/10000000,''FM9G99G990D00'')||''<i>Cr</i>'' when nvl(cd,0)>=100000 then to_char(cd/100000,''FM99G990D00'')||''<i>L</i>'' else to_char(nvl(cd,0),''FM99G99G990D00'') end',
' ||''</dd></dl><dl class="ds-finbal-side ds-finbal-side--cr"><dt>Closing Credit</dt><dd>&#8377;''',
' ||case when nvl(cc,0)>=10000000 then to_char(cc/10000000,''FM9G99G990D00'')||''<i>Cr</i>'' when nvl(cc,0)>=100000 then to_char(cc/100000,''FM99G990D00'')||''<i>L</i>'' else to_char(nvl(cc,0),''FM99G99G990D00'') end',
' ||''</dd></dl></div><div class="ds-finbal-foot"><span class="ds-finbal-diff">Difference <b>&#8377;''||to_char(abs(nvl(cd,0)-nvl(cc,0)),''FM9G99G99G99G99G990D00'')||''</b></span>''',
' ||case when abs(nvl(cd,0)-nvl(cc,0))<.005 then ''<span class="ds-finbal-flag"><span class="fa fa-check"></span>In balance</span>'' else ''<span class="ds-finbal-flag"><span class="fa fa-exclamation-triangle"></span>Out of balance</span>'' end||''</div></'
||'div>'' bal_closing',
' from t',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2026092309021430)
,p_query_column_id=>3
,p_column_alias=>'BAL_CLOSING'
,p_column_display_sequence=>30
,p_column_heading=>'Closing'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2026092309021420)
,p_query_column_id=>2
,p_column_alias=>'BAL_MOVEMENT'
,p_column_display_sequence=>20
,p_column_heading=>'Movement'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2026092309021410)
,p_query_column_id=>1
,p_column_alias=>'BAL_OPENING'
,p_column_display_sequence=>10
,p_column_heading=>'Opening'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026092309021300)
,p_plug_name=>'Balance Control Heading'
,p_static_id=>'balance-control-heading'
,p_region_name=>'balance-control-heading'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_source=>'<div class="ds-fin-section"><h2>Balance Control</h2><p>Do the books balance? Opening, movement and closing are each proved separately, at full precision</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(2026092309021000)
,p_name=>'Trial Balance Intelligence Header'
,p_static_id=>'command-header'
,p_template=>4072358936313175081
,p_display_sequence=>10
,p_region_css_classes=>'ds-fin-headregion'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'select ''<div class="ds-fin-head">''',
'    || ''<div class="ds-fin-eyebrow">Finance &middot; General Ledger</div>''',
'    || ''<h1 class="ds-fin-title">Trial Balance Intelligence</h1>''',
'    || ''<a class="ds-fin-headcta" href="''||apex_page.get_url(p_page=>903,p_clear_cache=>''903'',p_items=>''P903_FROMDATE,P903_TODATE,P903_COMPANY,P903_LOCATION,P903_ACCOUNTGROUP'',p_values=>:P902_FROMDATE||'',''||:P902_TODATE||'',''||:P902_COMPANY||'',''||:P90'
||'2_LOCATION||'',''||:P902_ACCOUNTGROUP)||''">Trial Balance Analytics <span aria-hidden="true">&rarr;</span></a>''',
'    || ''<div class="ds-fin-sub">Opening balances, period movement, closing position, financial exceptions and complete voucher traceability</div>''',
'    || ''<div class="ds-fin-context">''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar"></span>Period <b>''',
'       || apex_escape.html(:P902_FROMDATE) || '' &rarr; '' || apex_escape.html(:P902_TODATE) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar-check-o"></span>Financial Year <b>''',
'       || nvl((select f.financialyearcode from financialyear f',
'                where to_date(:P902_FROMDATE,''DD-MM-RRRR'') between f.financialyearbegin and f.financialyearend),',
'              ''outside any defined year'') || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((select c.companyname from company c where c.companycode=:P902_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((select l.locationname from location l where l.locationcode=:P902_LOCATION),''All locations'')) || ''</b></span>''',
'    || case when :P902_PNLBUCKET is not null then ''<span class="ds-fin-chip"><span class="fa fa-filter"></span>P&amp;L Line <b>''',
'       || apex_escape.html(case :P902_PNLBUCKET when ''DIRECT'' then ''Direct Cost'' when ''OPEX'' then ''Operating Expense'' when ''DEPN'' then ''Depreciation'' when ''FIN'' then ''Finance Cost'' when ''TAX'' then ''Tax'' else initcap(:P902_PNLBUCKET) end) || ''</b></sp'
||'an>'' end',
'    || ''<span class="ds-fin-chip"><span class="fa fa-money"></span>Currency <b>INR (base, single-currency ledger)</b></span>''',
'    || ''<span class="ds-fin-chip ds-fin-chip--live"><span class="fa fa-clock-o"></span>Last posting <b>''',
'       || nvl((select to_char(max(d.voucherdate),''DD-MM-RRRR'') from voucherdetail d',
'                where (:P902_COMPANY is null or d.companycode=:P902_COMPANY)',
'                  and (:P902_LOCATION is null or d.locationcode=:P902_LOCATION)), ''no postings'') || ''</b></span>''',
'    || ''</div></div>'' head',
'from dual',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>1
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'ROW_RANGES_IN_SELECT_LIST'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(2026092309021010)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_column_heading=>'Header'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026092309021600)
,p_plug_name=>'Trial Balance Heading'
,p_static_id=>'tb-heading'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_source=>'<div class="ds-fin-section"><h2>Trial Balance</h2><p>Nature &rarr; group &rarr; subgroup &rarr; ledger account. Set Levels and Account in the filter bar; click a group to open it, or a ledger account to open its statement</p></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026092309021700)
,p_plug_name=>'Trial Balance'
,p_static_id=>'trial-balance'
,p_region_name=>'trial-balance'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'with',
'nodes (account_code, account_name, parent_code, kind, sort_segment) as (',
'  select ''~BALANCESHEET'', ''Balance Sheet'', null, ''Statement'', ''01'' from dual union all',
'  select ''~ASSETS'', ''Assets'', ''~BALANCESHEET'', ''Group'', ''01'' from dual union all',
'  select ''~LIABILITIES'', ''Liabilities'', ''~BALANCESHEET'', ''Group'', ''02'' from dual union all',
'  select ''~PROFITANDLOSS'', ''Profit & Loss'', null, ''Statement'', ''02'' from dual union all',
'  select ''~NOSTATEMENT'', ''Other Accounts'', null, ''Statement'', ''03'' from dual union all',
'  select p.partycode,',
'         nvl(p.partyname,p.partycode),',
'         case when p.parentcode is not null then p.parentcode',
'              when upper(p.natureofaccountcode)=''ASSETS'' then ''~ASSETS''',
'              when upper(p.natureofaccountcode)=''LIABILITIES'' then ''~LIABILITIES''',
'              when upper(p.natureofaccountcode) in (''INCOME'',''EXPENSES'') then ''~PROFITANDLOSS''',
'              when upper(p.partycode)=''PROFITANDLOSS'' then ''~PROFITANDLOSS''',
'              else ''~NOSTATEMENT'' end,',
'         case when exists (select 1 from party c where c.parentcode=p.partycode) then ''Group'' else ''Ledger'' end,',
'         upper(nvl(p.partyname,p.partycode))||''|''||p.partycode',
'    from party p',
'   where p.partytypecode in (''ACCOUNTGROUP'',''ACCOUNT'')',
'),',
'tree as (',
'  select n.account_code,n.account_name,n.parent_code,n.kind,level lvl,',
'         sys_connect_by_path(replace(n.account_code,''/'',''%2F''),''/'')||''/'' node_path,',
'         sys_connect_by_path(replace(n.sort_segment,''/'',''-''),''/'') sort_path',
'    from nodes n',
'   start with n.parent_code is null',
' connect by nocycle prior n.account_code=n.parent_code',
'),',
'pnl_scope as (',
'  select w.account_code',
'    from (',
'      select p.partycode account_code,',
'             connect_by_root p.natureofaccountcode root_nature,',
'             regexp_substr(sys_connect_by_path(p.partycode,''/''),''[^/]+'',1,2) level_2,',
'             regexp_substr(sys_connect_by_path(p.partycode,''/''),''[^/]+'',1,3) bucket_code',
'        from party p',
'       start with p.parentcode is null',
'     connect by nocycle prior p.partycode=p.parentcode',
'    ) w',
'   where :P902_PNLBUCKET is null',
'      or case',
'           when w.level_2=''INCOME'' or w.root_nature=''INCOME'' then ''REVENUE''',
'           when w.bucket_code=''DIRECTCOST'' then ''DIRECT''',
'           when w.bucket_code=''DEPRECIATION'' then ''DEPN''',
'           when w.bucket_code=''4892'' then ''FIN''',
'           when w.bucket_code=''7481'' then ''TAX''',
'           when w.level_2=''EXPENDITURES'' or w.root_nature=''EXPENSES'' then ''OPEX''',
'         end = :P902_PNLBUCKET',
'),',
'fy as (',
'  select nvl((select min(f.financialyearbegin)',
'                from financialyear f',
'               where to_date(:P902_FROMDATE,''DD-MM-RRRR'') between f.financialyearbegin and f.financialyearend),',
'             to_date(:P902_FROMDATE,''DD-MM-RRRR'')) financialyearbegin',
'    from dual',
'),',
'carry as (',
'  select v.tno',
'    from voucher v',
'   where upper(v.voucherno)=''OPENING''',
'),',
'op as (',
'  select o.accountcode,sum(nvl(o.openingamount,0)) opening_amount',
'    from opening o cross join fy',
'   where o.openingdate=fy.financialyearbegin',
'     and (:P902_COMPANY is null or o.companycode=:P902_COMPANY)',
'     and (:P902_LOCATION is null or o.locationcode=:P902_LOCATION)',
'   group by o.accountcode',
'),',
'mv as (',
'  select d.accountcode,',
'         sum(case when d.voucherdate < to_date(:P902_FROMDATE,''DD-MM-RRRR'') then nvl(d.amount,0) else 0 end) pre_amount,',
'          sum(case when d.voucherdate between to_date(:P902_FROMDATE,''DD-MM-RRRR'') and to_date(:P902_TODATE,''DD-MM-RRRR'') and nvl(d.amount,0)<0 then -d.amount else 0 end) period_debit,',
'          sum(case when d.voucherdate between to_date(:P902_FROMDATE,''DD-MM-RRRR'') and to_date(:P902_TODATE,''DD-MM-RRRR'') and nvl(d.amount,0)>0 then d.amount else 0 end) period_credit,',
'         max(case when d.voucherdate between to_date(:P902_FROMDATE,''DD-MM-RRRR'') and to_date(:P902_TODATE,''DD-MM-RRRR'') then d.voucherdate end) last_posting',
'    from voucherdetail d cross join fy',
'   where d.voucherdate>=fy.financialyearbegin',
'     and d.voucherdate<to_date(:P902_TODATE,''DD-MM-RRRR'')+1',
'     and d.tno not in (select tno from carry)',
'     and (:P902_COMPANY is null or d.companycode=:P902_COMPANY)',
'     and (:P902_LOCATION is null or d.locationcode=:P902_LOCATION)',
'   group by d.accountcode',
'),',
'ledger_balances as (',
'  select t.account_code,t.node_path,',
'         nvl(o.opening_amount,0)+nvl(m.pre_amount,0) opening_net,',
'         nvl(m.period_debit,0) period_debit,',
'         nvl(m.period_credit,0) period_credit,',
'         m.last_posting',
'    from tree t',
'    left join op o on o.accountcode=t.account_code',
'    left join mv m on m.accountcode=t.account_code',
'   where t.kind=''Ledger''',
'     and (:P902_PNLBUCKET is null or t.account_code in (select account_code from pnl_scope))',
'),',
'agg as (',
'  select t.account_code,t.account_name,t.kind,t.lvl,t.node_path,t.sort_path,',
'         sum(nvl(l.opening_net,0)) opening_net,',
'         sum(nvl(l.period_debit,0)) period_debit,',
'         sum(nvl(l.period_credit,0)) period_credit,',
'         max(l.last_posting) last_posting',
'    from tree t',
'    left join ledger_balances l on l.node_path like t.node_path||''%''',
'   group by t.account_code,t.account_name,t.kind,t.lvl,t.node_path,t.sort_path',
'),',
'scope_rows as (',
'  select a.*,',
'          a.opening_net-a.period_debit+a.period_credit closing_net,',
'         case when :P902_ACCOUNTGROUP is null then a.lvl',
'              else a.lvl-nvl((select max(x.lvl)',
'                                from tree x',
'                               where x.account_code in (select column_value from table(apex_string.split(:P902_ACCOUNTGROUP,'':'')))',
'                                 and a.node_path like x.node_path||''%''),a.lvl)+1 end display_lvl',
'    from agg a',
'   where (:P902_ACCOUNTGROUP is null or exists (',
'            select 1',
'              from tree x',
'             where x.account_code in (select column_value from table(apex_string.split(:P902_ACCOUNTGROUP,'':'')))',
'               and a.node_path like x.node_path||''%''))',
'),',
'kept as (',
'  select s.*',
'    from scope_rows s',
'   where (:P902_LEDGERONLY=''Y'' and s.kind=''Ledger''',
'          or nvl(:P902_LEDGERONLY,''N'')<>''Y'' and s.display_lvl<=nvl(to_number(:P902_LEVEL),4))',
'     and (:P902_ZERO=''Y'' or abs(s.closing_net)>=.005)',
'     and (:P902_NOMOVE=''Y'' or abs(s.period_debit)+abs(s.period_credit)>=.005)',
'),',
'leaf_kept as (',
'  select l.*,',
'         l.opening_net-l.period_debit+l.period_credit closing_net',
'    from ledger_balances l',
'   where (:P902_ACCOUNTGROUP is null or exists (',
'            select 1',
'              from tree x',
'             where x.account_code in (select column_value from table(apex_string.split(:P902_ACCOUNTGROUP,'':'')))',
'               and l.node_path like x.node_path||''%''))',
'     and (:P902_ZERO=''Y'' or abs(l.opening_net-l.period_debit+l.period_credit)>=.005)',
'     and (:P902_NOMOVE=''Y'' or abs(l.period_debit)+abs(l.period_credit)>=.005)',
'),',
'totals as (',
'  select sum(greatest(-opening_net,0)) opening_debit,',
'         sum(greatest(opening_net,0)) opening_credit,',
'         sum(period_debit) period_debit,',
'         sum(period_credit) period_credit,',
'         sum(greatest(-closing_net,0)) closing_debit,',
'         sum(greatest(closing_net,0)) closing_credit',
'    from leaf_kept',
'),',
'report_rows as (',
'select 0 row_group,',
'       case when :P902_LEDGERONLY=''Y'' then upper(k.account_name) else k.sort_path end sort_order,',
'       k.account_name account,',
'       k.kind,',
'       greatest(-k.opening_net,0) opening_debit,',
'       greatest(k.opening_net,0) opening_credit,',
'       k.period_debit,',
'       k.period_credit,',
'       greatest(-k.closing_net,0) closing_debit,',
'       greatest(k.closing_net,0) closing_credit,',
'       case when abs(k.opening_net)>=.005 then round((k.period_debit-k.period_credit)/abs(k.opening_net)*100,2) end movement_pct,',
'       to_char(k.last_posting,''DD-MM-RRRR'') last_posting,',
'       ''<span class="ds-finchip ''||case when abs(k.period_debit)+abs(k.period_credit)<.005 then ''ds-finchip--flat'' when abs(k.closing_net)<.005 then ''ds-finchip--flat'' when k.closing_net<0 then ''ds-finchip--dr'' else ''ds-finchip--cr'' end||''">''',
'       ||case when abs(k.period_debit)+abs(k.period_credit)<.005 then ''Dormant'' when abs(k.closing_net)<.005 then ''Flat'' when k.closing_net<0 then ''Debit'' else ''Credit'' end||''</span>'' position,',
'       case',
'         when k.account_code like ''~%'' then ''ds-fintree-l''||least(k.display_lvl,8)||'' ds-fintree-grp ds-nolink''',
'         when k.kind=''Ledger'' then case when :P902_LEDGERONLY=''Y'' then ''ds-fintree-flat'' else ''ds-fintree-l''||least(k.display_lvl,8) end||'' ds-fintree-leaf''',
'         else ''ds-fintree-l''||least(k.display_lvl,8)||'' ds-fintree-grp''',
'       end account_class,',
'       case',
'         when k.account_code like ''~%'' then ''javascript:void(0)''',
'         when k.kind=''Ledger'' then',
'           apex_page.get_url(p_page=>11,p_clear_cache=>''11'',p_items=>''P11_FROMDATE,P11_TODATE,P11_LOCATION,P11_PARTY'',p_values=>:P902_FROMDATE||'',''||:P902_TODATE||'',''||:P902_LOCATION||'',''||k.account_code)',
'         else',
'           apex_page.get_url(p_page=>902,p_clear_cache=>''902'',p_items=>''P902_FROMDATE,P902_TODATE,P902_COMPANY,P902_LOCATION,P902_LEVEL,P902_ACCOUNTGROUP,P902_LEDGERONLY,P902_ZERO,P902_NOMOVE,P902_PNLBUCKET'',',
'             p_values=>:P902_FROMDATE||'',''||:P902_TODATE||'',''||:P902_COMPANY||'',''||:P902_LOCATION||'',''||to_char(k.display_lvl+3)||'',''||k.account_code||'',''||:P902_LEDGERONLY||'',''||:P902_ZERO||'',''||:P902_NOMOVE||'',''||:P902_PNLBUCKET)',
'       end account_url,',
'       k.display_lvl account_level',
'  from kept k',
'union all',
'select 1 row_group,',
'       ''~TOTAL'' sort_order,',
unistr('       ''Total \2014 all posting accounts in scope'' account,'),
'       cast(null as varchar2(20)) kind,',
'       nvl(t.opening_debit,0),nvl(t.opening_credit,0),nvl(t.period_debit,0),nvl(t.period_credit,0),',
'       nvl(t.closing_debit,0),nvl(t.closing_credit,0),',
'       cast(null as number) movement_pct,',
'       cast(null as varchar2(20)) last_posting,',
'       ''<span class="ds-finchip ''||case when abs(nvl(t.opening_debit,0)-nvl(t.opening_credit,0))<.005 then ''ds-finchip--ok'' else ''ds-finchip--dr'' end||''">Opening ''||case when abs(nvl(t.opening_debit,0)-nvl(t.opening_credit,0))<.005 then ''OK'' else ''&n'
||'e;'' end||''</span> ''',
'       ||''<span class="ds-finchip ''||case when abs(nvl(t.period_debit,0)-nvl(t.period_credit,0))<.005 then ''ds-finchip--ok'' else ''ds-finchip--dr'' end||''">Period ''||case when abs(nvl(t.period_debit,0)-nvl(t.period_credit,0))<.005 then ''OK'' else ''&ne;'''
||' end||''</span> ''',
'       ||''<span class="ds-finchip ''||case when abs(nvl(t.closing_debit,0)-nvl(t.closing_credit,0))<.005 then ''ds-finchip--ok'' else ''ds-finchip--dr'' end||''">Closing ''||case when abs(nvl(t.closing_debit,0)-nvl(t.closing_credit,0))<.005 then ''OK'' else '''
||'&ne;'' end||''</span>'' position,',
'       ''ds-fintree-total ds-nolink'' account_class,',
'       ''javascript:void(0)'' account_url,',
'       cast(null as number) account_level',
'  from totals t',
')',
'select account,kind,opening_debit,opening_credit,period_debit,period_credit,',
'       closing_debit,closing_credit,movement_pct,last_posting,position,',
'       account_class,account_url,account_level',
'  from report_rows',
' order by row_group,sort_order',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P902_FROMDATE,P902_TODATE,P902_COMPANY,P902_LOCATION,P902_LEVEL,P902_ACCOUNTGROUP,P902_ZERO,P902_NOMOVE,P902_LEDGERONLY,P902_PNLBUCKET'
,p_prn_page_header=>'Trial Balance'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2026092309021690)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows. Apply a filter to reduce the records.'
,p_no_data_found_message=>'No trial balance rows found for the selected scope.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>2026092309021690
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021710)
,p_db_column_name=>'ACCOUNT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Account'
,p_column_link=>'#ACCOUNT_URL#'
,p_column_linktext=>'#ACCOUNT#'
,p_column_link_attr=>'class="#ACCOUNT_CLASS#"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'Y'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021840)
,p_db_column_name=>'ACCOUNT_CLASS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Account Class'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021860)
,p_db_column_name=>'ACCOUNT_LEVEL'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Account Level'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021850)
,p_db_column_name=>'ACCOUNT_URL'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Account URL'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021780)
,p_db_column_name=>'CLOSING_CREDIT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Closing Cr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021770)
,p_db_column_name=>'CLOSING_DEBIT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Closing Dr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021720)
,p_db_column_name=>'KIND'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Kind'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021800)
,p_db_column_name=>'LAST_POSTING'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Last Posting'
,p_column_type=>'STRING'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021790)
,p_db_column_name=>'MOVEMENT_PCT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Movement %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021740)
,p_db_column_name=>'OPENING_CREDIT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Opening Cr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021730)
,p_db_column_name=>'OPENING_DEBIT'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Opening Dr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021760)
,p_db_column_name=>'PERIOD_CREDIT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Period Cr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021750)
,p_db_column_name=>'PERIOD_DEBIT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Period Dr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2026092309021810)
,p_db_column_name=>'POSITION'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2026092309021820)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'TB902'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'ACCOUNT:KIND:OPENING_DEBIT:OPENING_CREDIT:PERIOD_DEBIT:PERIOD_CREDIT:CLOSING_DEBIT:CLOSING_CREDIT:MOVEMENT_PCT:LAST_POSTING:POSITION:ACCOUNT_CLASS:ACCOUNT_URL:ACCOUNT_LEVEL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026092309021900)
,p_plug_name=>'Trial Balance Basis'
,p_static_id=>'trial-balance-basis'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_source=>'<div class="ds-finnote"><span class="fa fa-info-circle"></span><strong>Reading this table.</strong> Indentation is the account hierarchy; a parent row is the sum of every posting account beneath it, so the level 1 rows add up to the Balance Control b'
||'and above. Kind separates a group from a posting account&mdash;this ERP never posts to a group. Movement % is period movement over the absolute opening balance and is deliberately blank, not zero, where there is no opening to compare against. The las'
||'t row is the total across posting accounts in scope, not the sum of the rows above it&mdash;a parent already contains its children. Zero-balance and no-movement inclusion are in Advanced Filters; Levels and Account are in the filter bar. Use the repo'
||'rt Actions menu or the dedicated Download button to export.</div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026092309021100)
,p_plug_name=>'Trial Balance Scope'
,p_static_id=>'trial-balance-scope'
,p_region_name=>'tb-filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2026092309021200)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_button_position=>'NEXT'
,p_icon_css_classes=>'fa-filter'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2026092309021830)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2026092309021700)
,p_button_name=>'DOWNLOAD20'
,p_static_id=>'download'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'javascript:(async function(){var b=document.getElementById(''B2026092309021830''),f=document.getElementById(''wwvFlowForm'');if(!f||!window.fetch){apex.message.alert(''The export could not be started.'');return;}var old=b&&b.disabled;if(b){b.disabled=true;b.classList.add(''is-processing'');}try{var d=new FormData(f);d.set(''p_request'',''DOWNLOAD20'');var r=await fetch(f.action,{method:''POST'',body:d,credentials:''same-origin''});if(!r.ok){throw new Error(''HTTP ''+r.status);}var ct=(r.headers.get(''content-type'')||'''').toLowerCase();if(ct.indexOf(''text/html'')>=0){var msg=await r.text();throw new Error(msg.indexOf(''Error'')>=0?''The export process returned an error.'':''The export response was not an Excel file.'');}var x=await r.blob(),a=document.createElement(''a''),cd=r.headers.get(''content-disposition'')||'''',m=/filename\*?=(?:UTF-8''''|"?)([^";]+)/i.exec(cd);a.href=URL.createObjectURL(x);a.download=m?decodeURIComponent(m[1].replace(/"/g,'''')):''trial-balance-''+new Date().toISOString().slice(0,10)+''.xlsx'';document.body.appendChild(a);a.click();setTimeout(function(){URL.revokeObjectURL(a.href);a.remove();},1500);}catch(e){apex.message.alert(''Excel download failed: ''+e.message);}finally{if(b){b.disabled=!!old;b.classList.remove(''is-processing'');}}})();'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2026092309021220)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_button_name=>'OPENFILTERS'
,p_static_id=>'openfilters'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Advanced Filters'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'javascript:(function(){var r=document.getElementById(''tb-filters'');if(r){r.classList.toggle(''tb-advanced-open'');}})();'
,p_icon_css_classes=>'fa-sliders'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2026092309021230)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_button_name=>'RESETFILTERS'
,p_static_id=>'resetfilters'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset All Filters'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'f?p=&APP_ID.:902:&SESSION.::&DEBUG.:902::'
,p_icon_css_classes=>'fa-times'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2026092309021210)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_button_name=>'SHOWBC'
,p_static_id=>'showbc'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Show Balance Control'
,p_button_position=>'NEXT'
,p_button_redirect_url=>'javascript:(function(){var r=document.getElementById(''balance-control''),b=document.getElementById(''B2026092309021210'');if(!r){return;}var show=r.hasAttribute(''hidden'');if(show){r.removeAttribute(''hidden'');if(!r.dataset.tbLoaded){r.dataset.tbLoaded=''1'';try{apex.region(''balance-control'').refresh();}catch(e){}}}else{r.setAttribute(''hidden'','''');}if(b){var l=b.querySelector(''.t-Button-label'');if(l){l.textContent=show?''Hide Balance Control'':''Show Balance Control'';}b.setAttribute(''aria-expanded'',show?''true'':''false'');}})();'
,p_icon_css_classes=>'fa-balance-scale'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021160)
,p_name=>'P902_ACCOUNTGROUP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_prompt=>'Account'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.partyname || case when count(*) over (partition by p.partyname)>1 then ''  [''||p.partycode||'']'' end d,',
'       p.partycode r',
'  from party p',
' order by p.partyname,p.partycode'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Whole chart of accounts'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021130)
,p_name=>'P902_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select companyname d, companycode r from company order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021110)
,p_name=>'P902_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_item_default=>'select to_char(financialyearbegin,''DD-MM-RRRR'') from financialyear where trunc(sysdate) between financialyearbegin and financialyearend'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021170)
,p_name=>'P902_LEDGERONLY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_item_default=>'N'
,p_prompt=>'Ledger Only'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021150)
,p_name=>'P902_LEVEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_item_default=>'3'
,p_prompt=>'Levels'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>8
,p_colspan=>3
,p_grid_column=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '12',
  'min_value', '1',
  'number_alignment', 'left',
  'virtual_keyboard', 'numeric')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021140)
,p_name=>'P902_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'select locationname d, locationcode r from location order by 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>10
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021190)
,p_name=>'P902_NOMOVE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_item_default=>'Y'
,p_prompt=>'Include no movement'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_css_classes=>'tb-advanced-item'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021175)
,p_name=>'P902_PNLBUCKET'
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_prompt=>'P&L Line'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>10
,p_grid_label_column_span=>0
,p_display_when=>'P902_PNLBUCKET'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs:t-Form-fieldContainer--boldDisplay'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021120)
,p_name=>'P902_TODATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_item_default=>'select to_char(trunc(sysdate),''DD-MM-RRRR'') from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2026092309021180)
,p_name=>'P902_ZERO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2026092309021100)
,p_item_default=>'N'
,p_prompt=>'Include zero balance'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>1
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_css_classes=>'tb-advanced-item'
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2026092309022100)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Download 20-Level Trial Balance'
,p_static_id=>'download-20-level'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'declare',
'  l_context       apex_exec.t_context;',
'  l_context_open  boolean := false;',
'  l_old_level     varchar2(30) := :P902_LEVEL;',
'  l_old_ledger    varchar2(1) := :P902_LEDGERONLY;',
'  l_account       varchar2(32767);',
'  l_kind          varchar2(100);',
'  l_position      varchar2(500);',
'  l_level         pls_integer;',
'  l_row_class     varchar2(30);',
'  l_company       varchar2(4000);',
'  l_location      varchar2(4000);',
'  l_indent        varchar2(4000);',
'  type t_level_map is table of pls_integer index by varchar2(4000);',
'  l_levels        t_level_map;',
'',
'  procedure put_num(p_value number) is',
'  begin',
'    if p_value is null or abs(p_value) < .005 then',
'      htp.prn(''<td class="num"></td>'');',
'    else',
'      htp.prn(''<td class="num">''||to_char(p_value,''FM9999999999999990D00'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')||''</td>'');',
'    end if;',
'  end;',
'begin',
'  select nvl((select max(c.companyname) from company c where c.companycode=:P902_COMPANY),''All companies'')',
'    into l_company from dual;',
'  select nvl((select max(l.locationname) from location l where l.locationcode=:P902_LOCATION),''All locations'')',
'    into l_location from dual;',
'',
'  for r in (',
'    with nodes (account_code, account_name, parent_code, kind) as (',
'      select ''~BALANCESHEET'', ''Balance Sheet'', null, ''Statement'' from dual union all',
'      select ''~ASSETS'', ''Assets'', ''~BALANCESHEET'', ''Group'' from dual union all',
'      select ''~LIABILITIES'', ''Liabilities'', ''~BALANCESHEET'', ''Group'' from dual union all',
'      select ''~PROFITANDLOSS'', ''Profit & Loss'', null, ''Statement'' from dual union all',
'      select ''~NOSTATEMENT'', ''Other Accounts'', null, ''Statement'' from dual union all',
'      select p.partycode,',
'             nvl(p.partyname,p.partycode),',
'             case when p.parentcode is not null then p.parentcode',
'                  when upper(p.natureofaccountcode)=''ASSETS'' then ''~ASSETS''',
'                  when upper(p.natureofaccountcode)=''LIABILITIES'' then ''~LIABILITIES''',
'                  when upper(p.natureofaccountcode) in (''INCOME'',''EXPENSES'') then ''~PROFITANDLOSS''',
'                  when upper(p.partycode)=''PROFITANDLOSS'' then ''~PROFITANDLOSS''',
'                  else ''~NOSTATEMENT'' end,',
'             case when exists (select 1 from party c where c.parentcode=p.partycode) then ''Group'' else ''Ledger'' end',
'        from party p',
'       where p.partytypecode in (''ACCOUNTGROUP'',''ACCOUNT'')',
'    ),',
'    tree as (',
'      select n.account_code,n.account_name,n.kind,level lvl,',
'             sys_connect_by_path(replace(n.account_code,''/'',''%2F''),''/'')||''/'' node_path',
'        from nodes n',
'       start with n.parent_code is null',
'     connect by nocycle prior n.account_code=n.parent_code',
'    )',
'    select upper(t.account_name)||chr(31)||t.kind level_key,',
'           case when :P902_ACCOUNTGROUP is null then t.lvl',
'                else greatest(t.lvl-nvl((select max(x.lvl)',
'                                          from tree x',
'                                         where x.account_code in (select column_value from table(apex_string.split(:P902_ACCOUNTGROUP,'':'')))',
'                                           and t.node_path like x.node_path||''%''),t.lvl)+1,1)',
'            end account_level',
'      from tree t',
'  ) loop',
'    if not l_levels.exists(r.level_key) then',
'      l_levels(r.level_key) := r.account_level;',
'    end if;',
'  end loop;',
'',
'  apex_util.set_session_state(''P902_LEVEL'',''20'');',
'  apex_util.set_session_state(''P902_LEDGERONLY'',''N'');',
'  l_context := apex_region.open_query_context(',
'    p_page_id   => 902,',
'    p_region_id => wwv_flow_imp.id(2026092309021700));',
'  l_context_open := true;',
'',
'  owa_util.mime_header(''application/vnd.ms-excel'',false);',
'  htp.p(''Content-Disposition: attachment; filename="trial-balance-''||to_char(sysdate,''YYYYMMDD-HH24MI'')||''.xls"'');',
'  htp.p(''Cache-Control: no-store'');',
'  owa_util.http_header_close;',
'  htp.p(''<html xmlns:o="urn:schemas-microsoft-com:office:office" xmlns:x="urn:schemas-microsoft-com:office:excel" xmlns="http://www.w3.org/TR/REC-html40"><head><meta charset="utf-8">'');',
'  htp.p(''<!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet><x:Name>Trial Balance</x:Name><x:WorksheetOptions><x:FreezePanes/><x:FrozenNoSplit/><x:SplitHorizontal>4</x:SplitHorizontal><x:TopRowBottomPane>4</x:TopRowBottomPa'
||'ne><x:ActivePane>2</x:ActivePane></x:WorksheetOptions></x:ExcelWorksheet></x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->'');',
'  htp.p(''<style>body,table{font-family:Calibri,Arial,sans-serif;font-size:10pt;color:#141A2E;background:#FFFFFF}table{border-collapse:collapse}td,th{border:1px solid #DFE2ED;padding:5px 7px;vertical-align:middle}th{background:#3730A3;color:#FFFFFF;fo'
||'nt-weight:700;text-align:center}.title{background:#252B45;color:#FFFFFF;font-size:18pt;font-weight:700;text-align:left;border:0;padding:10px}.scope{background:#F6F7FC;color:#4B5471;font-weight:600;text-align:left;border:0;padding:7px}.blank{height:8p'
||'x;border:0;background:#FFFFFF}.num{text-align:right;white-space:nowrap;mso-number-format:"\#\,\#\#\,\#\#0\.00"}.date{text-align:center;white-space:nowrap;mso-number-format:"dd\-mm\-yyyy"}.l1 td{background:#3730A3;color:#FFFFFF;font-weight:700}.l2 td{'
||'background:#E0E7FF;color:#141A2E;font-weight:700}.l3 td{background:#EEF0F6;color:#141A2E;font-weight:600}.ledger td{background:#FFFFFF;color:#141A2E}.total td{background:#FEF3C7;color:#78350F;font-weight:700;border-top:2px solid #A16207}.note{backgro'
||'und:#F6F7FC;color:#6B7391;font-style:italic;border:0;padding:8px}</style></head><body>'');',
'  htp.p(''<table><colgroup><col style="width:340px"><col style="width:55px"><col style="width:80px"><col span="6" style="width:110px"><col style="width:95px"><col style="width:100px"></colgroup>'');',
'  htp.p(''<tr><td class="title" colspan="11">Trial Balance</td></tr>'');',
'  htp.p(''<tr><td class="scope" colspan="11">Period: ''||apex_escape.html(:P902_FROMDATE)||'' to ''||apex_escape.html(:P902_TODATE)||'' &nbsp; | &nbsp; Company: ''||apex_escape.html(l_company)||'' &nbsp; | &nbsp; Location: ''||apex_escape.html(l_location)||'''
||' &nbsp; | &nbsp; Full hierarchy through level 20 &nbsp; | &nbsp; Currency: INR (base)</td></tr>'');',
'  htp.p(''<tr><td class="blank" colspan="11"></td></tr>'');',
'  htp.p(''<tr><th>Account</th><th>Level</th><th>Kind</th><th>Opening Dr</th><th>Opening Cr</th><th>Period Dr</th><th>Period Cr</th><th>Closing Dr</th><th>Closing Cr</th><th>Last Posting</th><th>Position</th></tr>'');',
'',
'  while apex_exec.next_row(l_context) loop',
'    l_account := apex_exec.get_varchar2(l_context,1);',
'    l_kind := apex_exec.get_varchar2(l_context,2);',
'    if l_kind is null then',
'      l_level := null;',
'    elsif l_levels.exists(upper(l_account)||chr(31)||l_kind) then',
'      l_level := l_levels(upper(l_account)||chr(31)||l_kind);',
'    else',
'      l_level := 1;',
'    end if;',
'    l_position := regexp_replace(apex_exec.get_varchar2(l_context,11),''<[^>]+>'','''');',
'    l_position := replace(replace(l_position,''&ne;'',unistr(''\2260'')),''&#8800;'',unistr(''\2260''));',
'    if instr(lower(l_account),''total'')=1 then',
'      l_row_class := ''total'';',
'      l_level := null;',
'    elsif l_kind=''Ledger'' then',
'      l_row_class := ''ledger'';',
'    elsif l_level=1 then',
'      l_row_class := ''l1'';',
'    elsif l_level=2 then',
'      l_row_class := ''l2'';',
'    else',
'      l_row_class := ''l3'';',
'    end if;',
'',
'    l_indent := null;',
'    if nvl(l_level,1) > 1 then',
'      for i in 1 .. l_level - 1 loop',
'        l_indent := l_indent || ''&nbsp;&nbsp;&nbsp;&nbsp;'';',
'      end loop;',
'    end if;',
'    htp.prn(''<tr class="''||l_row_class||''"><td>''||l_indent||l_account||''</td><td class="num">''||case when l_level is not null then to_char(l_level) end||''</td><td>''||apex_escape.html(l_kind)||''</td>'');',
'    put_num(apex_exec.get_number(l_context,3));',
'    put_num(apex_exec.get_number(l_context,4));',
'    put_num(apex_exec.get_number(l_context,5));',
'    put_num(apex_exec.get_number(l_context,6));',
'    put_num(apex_exec.get_number(l_context,7));',
'    put_num(apex_exec.get_number(l_context,8));',
'    htp.prn(''<td class="date">''||apex_escape.html(apex_exec.get_varchar2(l_context,10))||''</td><td>''||apex_escape.html(l_position)||''</td></tr>'');',
'  end loop;',
'',
'  htp.p(''<tr><td class="note" colspan="11">Group rows include their descendant posting accounts and must not be summed as independent totals. The amber total is calculated from posting accounts in the selected scope.</td></tr></table></body></html>'')'
||';',
'  apex_exec.close(l_context);',
'  l_context_open := false;',
'  apex_util.set_session_state(''P902_LEVEL'',l_old_level);',
'  apex_util.set_session_state(''P902_LEDGERONLY'',l_old_ledger);',
'  apex_application.stop_apex_engine;',
'exception',
'  when apex_application.e_stop_apex_engine then',
'    raise;',
'  when others then',
'    if l_context_open then apex_exec.close(l_context); end if;',
'    apex_util.set_session_state(''P902_LEVEL'',l_old_level);',
'    apex_util.set_session_state(''P902_LEDGERONLY'',l_old_ledger);',
'    raise;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(2026092309021830)
,p_internal_uid=>2026092309022100
);
wwv_flow_imp.component_end;
end;
/
