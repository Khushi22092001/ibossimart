prompt --application/pages/page_00938
begin
--   Manifest
--     PAGE: 00938
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
 p_id=>938
,p_name=>'Specification 360'
,p_alias=>'SPECIFICATION-360'
,p_step_title=>'Specification 360'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
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
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#dashboard-fast-runtime.js?version=#APP_VERSION#&cb=20260829v',
'#APP_IMAGES#dashboard-fast-charts.js?version=#APP_VERSION#&cb=20260830a'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'(function(){',
' ''use strict'';',
' var config={"page":938,"filter":"p681Filters","regions":["R21542049403436257","R21542449086436258","R21543207048436259"]},$=apex.jQuery,running=false;',
' var filters=document.getElementById(config.filter),status=document.createElement(''div'');',
' if(!filters)return;',
' // Keep the APEX item nodes (and their handlers) but remove empty grid rows.',
' var grid=document.createElement(''div''),toolbar=document.createElement(''div'');grid.className=''ds360-fields'';toolbar.className=''ds360-actions'';',
' Array.prototype.forEach.call(filters.querySelectorAll(''.t-Form-fieldContainer''),function(node){grid.appendChild(node);});',
' Array.prototype.forEach.call(filters.querySelectorAll(''button.t-Button,a.t-Button''),function(node){if(!node.closest(''.t-Form-fieldContainer''))toolbar.appendChild(node);});',
' Array.prototype.forEach.call(filters.querySelectorAll(''.container,.row''),function(node){if(!node.querySelector(''input,select,button,a,textarea''))node.style.display=''none'';});',
' var title=document.createElement(''div'');title.className=''ds360-filter-title'';title.textContent=''Filters'';filters.appendChild(title);filters.appendChild(grid);filters.appendChild(toolbar);',
' status.className=''ds360-status'';status.setAttribute(''role'',''status'');status.setAttribute(''aria-live'',''polite'');',
' status.textContent=''Select a record and Apply to update all sections.'';toolbar.appendChild(status);',
' function refreshOne(id){return new Promise(function(resolve,reject){var node=document.getElementById(id);if(!node){resolve();return;}var done=false;',
'  function end(error){if(done)return;done=true;clearTimeout(timer);$(node).off(''.ds360Refresh'');error?reject(error):resolve();}',
'  var timer=setTimeout(function(){end(new Error(''A report did not finish. Please retry.''));},45000);',
'  $(node).one(''apexafterrefresh.ds360Refresh'',function(){end();}).one(''apexrefresherror.ds360Refresh'',function(){end(new Error(''A report could not refresh.''));});',
'  try{apex.region(id).refresh();}catch(e){end(e);}',
' });}',
' async function apply(button){if(running)return;apex.message.clearErrors();if(apex.page&&apex.page.validate&&!apex.page.validate())return;',
unistr('  running=true;button.disabled=true;button.setAttribute(''aria-busy'',''true'');status.textContent=''Updating the master card and registers\2026'';'),
'  try{for(var i=0;i<config.regions.length;i+=2){await Promise.all(config.regions.slice(i,i+2).map(refreshOne));}status.textContent=''Updated. All sections now use the selected record and applied filters.'';}',
'  catch(e){status.textContent=''Some sections could not update. Please Apply again before relying on the displayed records.'';apex.message.showErrors([{type:''error'',location:''page'',message:status.textContent,unsafe:false}]);}',
'  finally{button.disabled=false;button.removeAttribute(''aria-busy'');running=false;}',
' }',
' // Capture at window before the shared dashboard handler: that handler skips',
' // initially empty reports because their table markup does not yet exist.',
' window.addEventListener(''click'',function(event){var button=event.target.closest(''button,a.t-Button'');if(!button||!filters.contains(button))return;',
'  var action=String(button.getAttribute(''data-otel-label'')||button.textContent||'''').trim();',
'  if(!/^\s*(APPLY|APPLY FILTERS|REFRESH|UPDATE VIEW)\b/i.test(action))return;',
'  event.preventDefault();event.stopImmediatePropagation();apply(button);',
' },true);',
'}());',
'',
'/* Resolve related navigation after Apply, using the current visible filters. */',
'(function(){var buttons=[{"name":"BACKTOITEM","dom":"ds360NavBACKTOITEM","page":"936","clear":"936","items":"P936_ITEMCODE,P936_UOM,P936_FROMDATE,P936_TODATE,P936_COMPANY,P936_LOCATION,P936_PANEL","fields":["P938_ITEMCODE","P938_UOM","P938_FROMDATE",'
||'"P938_TODATE","P938_COMPANY","P938_LOCATION","P938_PANEL"]}],items="#P938_ITEMCODE,#P938_UOM,#P938_FROMDATE,#P938_TODATE,#P938_COMPANY,#P938_LOCATION,#P938_PANEL";window.addEventListener(''click'',function(e){var node=e.target.closest(''button,a.t-Butto'
||'n'');if(!node)return;var match=buttons.find(function(b){return b.dom===node.id;});if(!match)return;e.preventDefault();e.stopImmediatePropagation();if(node.disabled)return;node.disabled=true;apex.server.process(''DS360_NAVIGATION'',{x01:match.name,pageIt'
||'ems:items},{dataType:''json'',success:function(result){if(result&&result.url)apex.navigation.redirect(result.url);},error:function(){apex.message.alert(''The related page could not be opened. Please try again.'');},complete:function(){node.disabled=false'
||';}});},true);}());',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'.ds360-status{padding:10px 16px;color:#69788f;font-size:12px;line-height:1.5;clear:both}',
'.ds360-filters .t-Form-fieldContainer{padding:6px 10px 12px!important}.ds360-filters .t-Form-labelContainer{padding-bottom:7px!important;text-align:left!important}.ds360-filters .t-Form-inputContainer{min-width:0}.ds360-filters .t-Form-itemWrapper{wi'
||'dth:100%;min-width:0}.ds360-filters input:not([type=hidden]),.ds360-filters select{min-height:45px!important}.ds360-filters .a-DatePicker{width:100%}.ds360-filters .t-Form-label{font-size:12px;font-weight:650}.ds360-placeholder{padding:26px 28px;marg'
||'in-bottom:18px;background:linear-gradient(110deg,#eeebff,#f1f7ff);border:1px solid #dcdcf2;border-radius:16px;color:#5b6685}.ds360-placeholder h2{font-size:23px;color:#393565;margin:0 0 10px}.ds360-placeholder p{margin:0;font-size:13px}',
'.ds360-register .a-IRR-table tbody td{background:#fff!important;border-bottom:1px solid #e3e8f2!important}.ds360-register .a-IRR-table tbody tr:hover td{background:#f8faff!important}.ds360-register .a-IRR-header{background:#e8eafa!important}.ds360-re'
||'gister .a-IRR-toolbar{background:#f4f3ff!important}',
'.ds360-filters{padding:12px 16px!important;min-height:0!important}.ds360-fields{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:10px 16px}.ds360-fields .t-Form-fieldContainer{display:block!important;margin:0!important;padding:0!importa'
||'nt;min-height:0!important;width:100%!important}.ds360-fields .t-Form-labelContainer{margin:0!important;padding:0 0 4px!important;min-height:0!important;line-height:18px!important}.ds360-fields .t-Form-label{font-size:12px!important;line-height:18px!i'
||'mportant}.ds360-fields .t-Form-inputContainer{padding:0!important;margin:0!important;width:100%!important;min-height:0!important}.ds360-fields .t-Form-itemWrapper{margin:0!important;min-height:0!important;width:100%!important}.ds360-fields input:not('
||'[type=hidden]),.ds360-fields select,.ds360-fields .apex-item-popup-lov{height:39px!important;min-height:39px!important;padding-top:7px!important;padding-bottom:7px!important;font-size:13px!important}.ds360-fields .a-Button{height:39px!important;min-h'
||'eight:39px!important}.ds360-fields .apex-item-group--popup-lov,.ds360-fields .apex-item-group{min-height:39px!important}.ds360-actions{display:flex;align-items:center;flex-wrap:wrap;gap:7px;margin-top:11px}.ds360-actions .t-Button{margin:0!important;'
||'min-height:35px!important;height:35px!important;padding:6px 13px!important;font-size:12px!important}.ds360-actions .ds360-status{padding:0 5px;margin-left:5px;font-size:11px;flex:1;min-width:170px}.ds360-filters:before{margin-bottom:9px!important}.ds'
||'360-fields .t-Form-itemText--post,.ds360-fields .t-Form-itemText--pre{padding:0!important}',
'@media(max-width:850px){.ds360-fields{grid-template-columns:repeat(2,minmax(0,1fr))}}@media(max-width:480px){.ds360-fields{grid-template-columns:1fr}.ds360-actions .ds360-status{flex-basis:100%;margin:2px 0 0}}',
'.ds360-filters:before,.ds360-filters:after{display:none!important}.ds360-filter-title{font-size:11px;font-weight:700;letter-spacing:.09em;text-transform:uppercase;color:#737499;margin:0 0 8px}.ds360-fields .apex-item-group{width:100%!important;max-wi'
||'dth:none!important}.ds360-fields .apex-item-popup-lov{width:100%!important;max-width:none!important;min-width:0!important}.ds360-kpi .nodatafound,.ds360-kpi .t-Report-noData,.ds360-kpi .a-Report-noData{display:none!important}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('SPECIFICATION 360 \2014 data contract.'),
'',
'THE SMALLEST PAGE IN THE SUITE, DELIBERATELY. It answers exactly one question:',
'who supplies this exact specification of this item, and at what rate. No chart,',
unistr('no master record, no trend \2014 those live on Item 360 (page 679), which is where'),
'this page is reached from. Six regions is the whole design, not an unfinished',
'one.',
'',
'GRAIN: ITEM *AND* SPECIFICATION. The subject is the pair',
'(P938_ITEMCODE, P938_SPEC). Both arrive fixed from the Specification Mix report',
unistr('on page 679 and are NOT switchable here \2014 you change specification by going back'),
'and clicking a different row, which keeps the reconciliation honest.',
'P938_UOM is an optional narrowing carried through from the parent page.',
'',
'THE ~NONE~ SENTINEL. A line booked with no specification recorded is its own',
'group, arriving as the literal ''~NONE~'', never as NULL:',
'    nvl(d.ItemSpecificationCode,''~NONE~'') = :P938_SPEC',
'A NULL would be read as "all specifications" and would total the wrong',
unistr('population \2014 this page would show more than the row that was clicked. The same'),
'applies to P938_UOM.',
'',
'RECONCILIATION CONTRACT. The base query is the SAME three-level realised-rate',
'ladder as page 679, so Purchase Value and Avg Realised Rate here must equal the',
'Spend and Avg Rate on the specification row that was clicked. If they differ, the',
'two copies of the ladder have drifted apart.',
'',
'THIS LADDER IS COPIED, NOT SHARED. APEXlang has no shared-SQL construct, so 679',
'and 681 each carry an inlined copy. They MUST be kept in sync by discipline. In',
'any rebuild, factor this into a database view or function so they cannot drift.',
'',
'PREMIUM IS ARITHMETIC ONLY. Suppliers are ranked cheapest first and the premium',
unistr('is measured against the best source. It is NOT quality-adjusted \2014 this ERP holds'),
'no quality or service rating to adjust with.',
'',
'PANEL SECURITY. Scalar-subquery form on every region, as elsewhere in the suite.',
'',
'READ-ONLY. Every region is a SELECT.'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955542049403436257)
,p_name=>'Specification 360'
,p_static_id=>'command-header'
,p_template=>4501440665235496320
,p_display_sequence=>5
,p_region_css_classes=>'ds-purchase-headregion hspl-register-empty-disabled'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select HEAD from (select HEAD,0 ds360_priority from (Select',
'  ''<div class="ds-purchase-head">''',
'  || ''<div class="ds-purchase-head-eyebrow">Specification 360</div>''',
'  || ''<h1 class="ds-purchase-head-title">''',
'     || apex_escape.html(',
'          Case When :P938_SPEC = ''~NONE~'' Then ''No specification recorded''',
'               Else nvl((Select s.ItemSpecificationName',
'                           From ItemSpecification s',
'                          Where s.ItemSpecificationCode = :P938_SPEC),',
'                        nvl(:P938_SPEC,''No specification selected'')) End)',
'     || ''</h1>''',
'  || ''<p class="ds-purchase-head-sub">Every supplier of this exact ''',
'  || ''specification, on one realised-rate basis, so cheapest and dearest ''',
'  || ''source are directly comparable.</p>''',
'  || ''<div class="ds-purchase-head-context">''',
'  -- The parent item is context, not the subject, so it follows the spec.',
'  || ''<span class="ds-purchase-head-chip">Item <b>''',
'     || apex_escape.html(nvl((Select i.ItemName From Item i',
'                               Where i.ItemCode = :P938_ITEMCODE),',
'                             nvl(:P938_ITEMCODE,''not set'')))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Unit <b>''',
'     || apex_escape.html(',
'          Case When :P938_UOM = ''~NONE~'' Then ''No unit recorded''',
'               Else nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'                          Where m.MeasuringUnitCode = :P938_UOM),',
'                        nvl(:P938_UOM,''All units'')) End)',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Period <b>''',
'     || apex_escape.html(:P938_FROMDATE) || '' &rarr; ''',
'     || apex_escape.html(:P938_TODATE) || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Company <b>''',
'     || apex_escape.html(nvl(GetCompanyName(:P938_COMPANY),''All companies''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Location <b>''',
'     || apex_escape.html(nvl(GetLocationName(:P938_LOCATION),''All locations''))',
'     || ''</b></span>''',
'  || ''</div></div>'' As HEAD',
'From dual) union all select ''<div class="ds360-placeholder"><h2>Specification 360</h2><p>Select a record below and click Apply to view its master details, totals and line registers.</p></div>'' HEAD,1 ds360_priority from dual where :P938_ITEMCODE is n'
||'ull) order by ds360_priority fetch first 1 rows only'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P938_COMPANY,P938_FROMDATE,P938_ITEMCODE,P938_LOCATION,P938_PANEL,P938_SPEC,P938_TODATE,P938_UOM'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No values for the selected record.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955542147873436258)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Whole header as one HTML string. Both sentinels are decoded to readable phrases rather than printed raw.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955542221010436258)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p681Filters'
,p_region_css_classes=>'ds-dash-filters ds360-filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>6
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955542310013436258)
,p_plug_name=>'Specification Position'
,p_static_id=>'rule-pulse'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>15
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>What This Specification Cost</h2>',
'  <p>These figures must reconcile to the specification row you clicked on Item',
'     360 &mdash; same base query, same three-level realised-rate ladder. If',
'     they do not match, the two inlined copies of that ladder have drifted',
'     apart and need re-syncing.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955543104487436259)
,p_plug_name=>'Suppliers of This Specification'
,p_static_id=>'rule-vendor'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Suppliers of This Specification</h2>',
'  <p>Cheapest source first, with the premium each other source carries over',
'     it. Because the specification is fixed, these rates are directly',
'     comparable &mdash; the usual "different grade" objection does not apply.',
'     The comparison is arithmetic only and is <strong>not</strong>',
'     quality-adjusted.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955542449086436258)
,p_name=>'Specification KPIs'
,p_static_id=>'spec-kpi'
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols hspl-register-empty-disabled ds360-kpi'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With L As (',
'  -- Level 1: filtered bill LINES for this item AND specification.',
'  Select h.TNo BillTno, h.PurchaseBillDate BillDate, h.PartyCode,',
'         d.Amount Amt, d.Quantity1 Qty',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where d.ItemCode = :P938_ITEMCODE',
'     -- Sentinel-aware and MANDATORY: this is half the subject.',
'     And nvl(d.ItemSpecificationCode,''~NONE~'') = :P938_SPEC',
'     And (:P938_UOM Is Null',
'          Or nvl(d.RateMeasuringUnitCode,''~NONE~'') = :P938_UOM)',
'     And h.PurchaseBillDate',
'         Between to_date(:P938_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P938_TODATE,''DD-MM-RRRR'')',
'     And nvl(d.Quantity1,0) > 0',
'     And nvl(d.Amount,0)    > 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P938_PANEL Is Null Or h.Panel = :P938_PANEL)',
'     And (:P938_COMPANY  Is Null Or h.CompanyCode  = :P938_COMPANY)',
'     And (:P938_LOCATION Is Null Or h.LocationCode = :P938_LOCATION)),',
'B As (',
'  -- Level 2: one realised rate per BILL.',
'  Select BillTno, BillDate,',
'         Sum(Amt) Amt, Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) BillRate',
'    From L',
'   Group By BillTno, BillDate),',
'A As (',
'  -- Level 3: the aggregate. AvgRate value-weighted; Min/Max/Last per-BILL.',
'  Select Count(*) Bills,',
'         Sum(Amt) Spend,',
'         Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) AvgRate,',
'         Min(BillRate) MinRate,',
'         Max(BillRate) MaxRate,',
'         Max(BillRate) KEEP (DENSE_RANK LAST',
'                             Order By BillDate, BillTno) LastRate,',
'         Max(BillDate) LastBuy',
'    From B),',
'V As (Select Count(Distinct PartyCode) Vendors From L)',
'Select',
'  ''<div class="ds-kpi ds-kpi--value" title="SUM(PurchaseBillDetail.Amount) ''',
'  || ''for this item and specification. Must equal the Spend on the ''',
'  || ''specification row clicked on Item 360.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-inr"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Purchase Value</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(a.Spend,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(a.Spend/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(a.Spend,0) >= 100000',
'             Then ''Rs '' || to_char(Round(a.Spend/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(a.Spend,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">across '' || to_char(nvl(a.Bills,0),''FM999G999'')',
'     || '' bills</span>''',
'  || ''</span></div>'' As KPI1,',
'  ''<div class="ds-kpi ds-kpi--input" title="SUM(Quantity1) in the unit named ''',
unistr('  || ''in the header. Meaningful only within that unit \2014 never added to a '''),
'  || ''quantity in another.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-cubes"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Quantity</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || to_char(nvl(a.Qty,0),''FM999G999G990D000'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || apex_escape.html(',
'          Case When :P938_UOM = ''~NONE~'' Then ''lines with no unit recorded''',
'               When :P938_UOM Is Null Then ''<mixed units>''',
'               Else ''in '' || nvl((Select m.MeasuringUnitName',
'                                    From MeasuringUnit m',
'                                   Where m.MeasuringUnitCode = :P938_UOM),',
'                                 ''the selected unit'') End)',
'     || ''</span>''',
'  || ''</span></div>'' As KPI2,',
'  -- At specification grain the question is "how many sources", so this card',
'  -- carries Suppliers where the Item 360 strip carries frequency.',
'  ''<div class="ds-kpi ds-kpi--users" title="Distinct suppliers of this exact ''',
'  || ''specification. One supplier on a material specification is a single ''',
'  || ''point of failure as well as a price risk.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-users"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Suppliers</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(v.Vendors,0),''FM999G999'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(v.Vendors,0) = 1',
'             Then ''single source for this specification''',
'             Else ''sources used in the period'' End',
'     || ''</span>''',
'  || ''</span></div>'' As KPI3,',
unistr('  ''<div class="ds-kpi ds-kpi--move" title="SUM(Amount)/SUM(Quantity1) \2014 a '''),
'  || ''value-weighted mean, not an average of per-bill rates.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-balance-scale"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Avg Realised Rate</span>''',
'  || ''<span class="ds-kpi-n">Rs ''',
'     || to_char(Round(a.AvgRate,2),''FM99G99G990D00'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">money booked / quantity booked</span>''',
'  || ''</span></div>'' As KPI4,',
'  ''<div class="ds-kpi ds-kpi--struct" title="Realised rate on the most recent ''',
'  || ''bill, resolved with KEEP DENSE_RANK LAST on bill date then bill key.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-tag"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Latest Rate</span>''',
'  || ''<span class="ds-kpi-n">Rs ''',
'     || to_char(Round(a.LastRate,2),''FM99G99G990D00'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || nvl(to_char(a.LastBuy,''DD-Mon-RRRR''),''no purchase in period'')',
'     || ''</span>''',
'  || ''</span></div>'' As KPI5,',
'  ''<div class="ds-kpi ds-kpi--risk" title="100 * (dearest - cheapest) / ''',
'  || ''cheapest on per-bill realised rates. Within ONE specification a wide ''',
unistr('  || ''spread cannot be explained away by grade \2014 it is timing or supplier.">'''),
'  || ''<span class="ds-kpi-ic"><span class="fa fa-arrows-h"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Price Spread</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(a.MinRate,0) > 0',
'             Then to_char(Round(100*(a.MaxRate-a.MinRate)/a.MinRate,1),''FM99999990D0'')',
'                  || ''%''',
'             Else ''<span class="ds-muted">not measurable</span>'' End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">Rs ''',
'     || to_char(Round(a.MinRate,2),''FM99G99G990D00'') || '' &rarr; Rs ''',
'     || to_char(Round(a.MaxRate,2),''FM99G99G990D00'') || ''</span>''',
'  || ''</span></div>'' As KPI6',
'From A a Cross Join V v'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P938_COMPANY,P938_FROMDATE,P938_ITEMCODE,P938_LOCATION,P938_PANEL,P938_SPEC,P938_TODATE,P938_UOM'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No values for the selected record.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955542553678436258)
,p_query_column_id=>1
,p_column_alias=>'KPI1'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Purchase Value. Reconciliation anchor against the Spend column on the 679 specification row that drilled here.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955542604114436258)
,p_query_column_id=>2
,p_column_alias=>'KPI2'
,p_column_display_sequence=>20
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Quantity within the carried unit. The sub-line warns when no unit was carried, because the figure then mixes bases.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955542765683436258)
,p_query_column_id=>3
,p_column_alias=>'KPI3'
,p_column_display_sequence=>30
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Suppliers \2014 this card differs from the Item 360 strip on purpose. At specification grain, how many sources exist is the governing question, and the sub-line calls out a single source explicitly.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955542826108436258)
,p_query_column_id=>4
,p_column_alias=>'KPI4'
,p_column_display_sequence=>40
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Avg realised rate. Must match the Avg Rate on the 679 specification row that drilled here.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955542997984436258)
,p_query_column_id=>5
,p_column_alias=>'KPI5'
,p_column_display_sequence=>50
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Most recent per-bill rate, deterministically resolved.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955543059423436258)
,p_query_column_id=>6
,p_column_alias=>'KPI6'
,p_column_display_sequence=>60
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Price spread. Within a single specification this cannot be explained by grade difference, which makes it a stronger signal than the same measure on Item 360.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955543207048436259)
,p_plug_name=>'Suppliers of This Specification'
,p_static_id=>'spec-vendors'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With L As (',
'  Select h.TNo BillTno, h.PurchaseBillDate BillDate, h.PartyCode,',
'         d.Amount Amt, d.Quantity1 Qty',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where d.ItemCode = :P938_ITEMCODE',
'     And nvl(d.ItemSpecificationCode,''~NONE~'') = :P938_SPEC',
'     And (:P938_UOM Is Null',
'          Or nvl(d.RateMeasuringUnitCode,''~NONE~'') = :P938_UOM)',
'     And h.PurchaseBillDate',
'         Between to_date(:P938_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P938_TODATE,''DD-MM-RRRR'')',
'     And nvl(d.Quantity1,0) > 0',
'     And nvl(d.Amount,0)    > 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P938_PANEL Is Null Or h.Panel = :P938_PANEL)',
'     And (:P938_COMPANY  Is Null Or h.CompanyCode  = :P938_COMPANY)',
'     And (:P938_LOCATION Is Null Or h.LocationCode = :P938_LOCATION)),',
'B As (',
'  Select PartyCode, BillTno, BillDate,',
'         Sum(Amt) Amt, Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) BillRate',
'    From L',
'   Group By PartyCode, BillTno, BillDate),',
'A As (',
'  Select PartyCode,',
'         Count(*) Bills,',
'         Sum(Amt) Spend,',
'         Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) AvgRate,',
'         Min(BillRate) MinRate,',
'         Max(BillRate) MaxRate,',
'         Max(BillRate) KEEP (DENSE_RANK LAST',
'                             Order By BillDate, BillTno) LastRate,',
'         Min(BillDate) FirstBuy,',
'         Max(BillDate) LastBuy',
'    From B',
'   Group By PartyCode)',
'Select',
'  a.PartyCode As PARTYCODE,',
'  GetPartyName(a.PartyCode) As SUPPLIER,',
'  a.Bills As BILLS,',
'  a.Qty As QUANTITY,',
'  a.Spend As SPEND,',
'  Round(a.AvgRate,2)  As AVG_RATE,',
'  Round(a.MinRate,2)  As MIN_RATE,',
'  Round(a.MaxRate,2)  As MAX_RATE,',
'  Round(a.LastRate,2) As LAST_RATE,',
'  Round(100 * (a.AvgRate - Min(a.AvgRate) Over ())',
'            / Nullif(Min(a.AvgRate) Over (),0), 1) As PREMIUM_PCT,',
'  Round(100 * a.Spend / Nullif(Sum(a.Spend) Over (),0), 1) As SHARE_PCT,',
'  a.FirstBuy As FIRST_BUY,',
'  a.LastBuy  As LAST_BUY',
'From A a',
'Order By a.AvgRate'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P938_COMPANY,P938_FROMDATE,P938_ITEMCODE,P938_LOCATION,P938_PANEL,P938_SPEC,P938_TODATE,P938_UOM'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(955543388241436259)
,p_no_data_found_message=>'No supplier billed this specification in the selected period and scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21543388241436259
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955543952001436259)
,p_db_column_name=>'AVG_RATE'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Avg Realised Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('The ranking measure \2014 value-weighted, so a large bill counts for more than a token one.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955543607082436259)
,p_db_column_name=>'BILLS'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Bills'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'How many bills this supplier raised for the specification. A single bill makes the rate a weak signal.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955544563191436259)
,p_db_column_name=>'FIRST_BUY'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'First Buy'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Earliest bill from this supplier for the specification.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955544646196436259)
,p_db_column_name=>'LAST_BUY'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Last Buy'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Most recent bill. A stale date beside a low premium means the good rate may no longer be available.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955544206963436259)
,p_db_column_name=>'LAST_RATE'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Last Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Most recent per-bill rate, deterministically resolved.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955544139086436259)
,p_db_column_name=>'MAX_RATE'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Highest'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Dearest per-bill rate from this supplier.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955544037706436259)
,p_db_column_name=>'MIN_RATE'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Lowest'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Cheapest per-bill rate from this supplier.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955543417776436259)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955544322879436259)
,p_db_column_name=>'PREMIUM_PCT'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Premium vs Best %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('How much dearer than the cheapest source of this exact specification. Zero marks the best source. Arithmetic only \2014 not quality-adjusted.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955543766311436259)
,p_db_column_name=>'QUANTITY'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Quantity in the carried unit. Comparable down the column only because the unit is fixed for the page.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955544474952436259)
,p_db_column_name=>'SHARE_PCT'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Share of Spend %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'How much of this specification''s spend goes to each source. A high share on a high-premium supplier is the finding worth acting on.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955543898976436259)
,p_db_column_name=>'SPEND'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Spend'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Money booked with this supplier. Summing this column reproduces the Purchase Value KPI.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955543526331436259)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Supplier'
,p_column_link=>'f?p=&APP_ID.:935:&APP_SESSION.::NO:935:P935_SUPPLIER,P935_FROMDATE,P935_TODATE,P935_COMPANY,P935_LOCATION,P935_PANEL:#PARTYCODE#,&P938_FROMDATE.,&P938_TODATE.,&P938_COMPANY.,&P938_LOCATION.,&P938_PANEL.'
,p_column_linktext=>'#SUPPLIER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Drills to Supplier 360 for the whole supplier. The item and specification are deliberately not carried \2014 that page is a supplier dossier.')
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1033009000000681001)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'AVG_RATE:BILLS:FIRST_BUY:LAST_BUY:LAST_RATE:MAX_RATE:MIN_RATE:PARTYCODE:PREMIUM_PCT:QUANTITY:SHARE_PCT:SPEND:SUPPLIER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(955546311798436260)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(955546421734436260)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_button_name=>'BACKTOITEM'
,p_static_id=>'back-to-item'
,p_button_static_id=>'ds360NavBACKTOITEM'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Item 360'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
,p_grid_column=>3
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955545777901436260)
,p_name=>'P938_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From PCC_PurchaseBill h',
'                Where h.CompanyCode = c.CompanyCode',
'                  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                       Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Narrows both regions to one company.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955545327494436260)
,p_name=>'P938_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(FinancialYearBegin,''DD-MM-RRRR'')',
'  From FinancialYear',
' Where trunc(sysdate) Between FinancialYearBegin And FinancialYearEnd',
'   And rownum = 1'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Start of the reporting period. Arrives from Item 360.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955544764996436259)
,p_name=>'P938_ITEMCODE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct i.ItemName || '' ('' || i.ItemCode || '')'' d, i.ItemCode r',
'  From PurchaseBillDetail d',
'  Join Item i On i.ItemCode = d.ItemCode',
' Order By 1'))
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Required item subject. Searchable here so Specification 360 works as a standalone dashboard as well as from Item 360.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955545967654436260)
,p_name=>'P938_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From PCC_PurchaseBill fb',
'                Where fb.LocationCode = l.LocationCode',
'                  And (:P938_COMPANY Is Null',
'                       Or fb.CompanyCode = :P938_COMPANY)',
'                  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                       Or fb.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P938_COMPANY'
,p_ajax_items_to_submit=>'P938_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Cascades from Company.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955546149087436260)
,p_name=>'P938_PANEL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov=>'STATIC:A;A,B;B'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'A + B'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'SAGAR.GetUserPanelAB_apex() Is Null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_lov_display_extra=>'YES'
,p_help_text=>'Hidden when your login is already bound to a panel. The select list is the control; the SQL predicate on every region is the enforcement.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE',
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955544907296436260)
,p_name=>'P938_SPEC'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_prompt=>'Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'       Case When d.ItemSpecificationCode Is Null Then ''No specification recorded''',
'            Else nvl((Select s.ItemSpecificationName From ItemSpecification s',
'                       Where s.ItemSpecificationCode = d.ItemSpecificationCode),',
'                     d.ItemSpecificationCode) End d,',
'       nvl(d.ItemSpecificationCode,''~NONE~'') r',
'  From PurchaseBillDetail d',
' Where d.ItemCode = :P938_ITEMCODE',
' Order By 1'))
,p_lov_cascade_parent_items=>'P938_ITEMCODE'
,p_ajax_items_to_submit=>'P938_ITEMCODE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Required specification subject; no-specification rows use the explicit ~NONE~ sentinel.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955545581167436260)
,p_name=>'P938_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_item_default=>'to_char(trunc(sysdate),''DD-MM-RRRR'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'End of the reporting period.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955545138868436260)
,p_name=>'P938_UOM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(955542221010436258)
,p_prompt=>'Unit'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'       Case When d.RateMeasuringUnitCode Is Null Then ''No unit recorded''',
'            Else nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'                       Where m.MeasuringUnitCode = d.RateMeasuringUnitCode),',
'                     d.RateMeasuringUnitCode) End d,',
'       nvl(d.RateMeasuringUnitCode,''~NONE~'') r',
'  From PurchaseBillDetail d',
' Where d.ItemCode = :P938_ITEMCODE',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All units (rates not comparable)'
,p_lov_cascade_parent_items=>'P938_ITEMCODE'
,p_ajax_items_to_submit=>'P938_ITEMCODE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Optional unit narrowing. Empty means all units and rate comparisons are intentionally labelled as mixed.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(934900360090000681)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DS360_NAVIGATION'
,p_static_id=>'ds360-navigation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'case apex_application.g_x01',
'when ''BACKTOITEM'' then',
'apex_json.open_object;apex_json.write(''url'',apex_page.get_url(p_page=>''936'',p_clear_cache=>''936'',p_items=>''P936_ITEMCODE,P936_UOM,P936_FROMDATE,P936_TODATE,P936_COMPANY,P936_LOCATION,P936_PANEL'',p_values=>:P938_ITEMCODE||'',''||:P938_UOM||'',''||:P938_FR'
||'OMDATE||'',''||:P938_TODATE||'',''||:P938_COMPANY||'',''||:P938_LOCATION||'',''||:P938_PANEL));apex_json.close_object;',
'else raise_application_error(-20001,''Unknown navigation action'');end case;end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900360090000681
);
wwv_flow_imp.component_end;
end;
/
