prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>934000000000000000
,p_default_owner=>'IMART'
);
end;
/
 
prompt APPLICATION 105 - IRONMART PURCHASE COMMAND CENTRE
--
-- Application Export:
--   Application:     105
--   Name:            DASHBOARD(UI DEVELOPMENT)
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 936
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746037717004653
--

begin
null;
end;
/
prompt --application/pages/delete_00936
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>936);
end;
/
prompt --application/pages/page_00936
begin
wwv_flow_imp_page.create_page(
 p_id=>936
,p_name=>'Item 360'
,p_alias=>'ITEM-360'
,p_step_title=>'Item 360'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#dashboard-fast-runtime.js?version=#APP_VERSION#&cb=20260829v',
'#APP_IMAGES#dashboard-fast-charts.js?version=#APP_VERSION#&cb=20260830a'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'(function(){',
' ''use strict'';',
' var config={"page":936,"filter":"p679Filters","regions":["R21531847000436198","R21532252711436199","R21533034474436226","R21533469596436226","R21534721550436227","R21536230379436228"]},$=apex.jQuery,running=false;',
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
'(function(){var buttons=[{"name":"BACKTOANALYTICS","dom":"ds360NavBACKTOANALYTICS","page":"940","clear":"940","items":"P940_FROMDATE,P940_TODATE,P940_COMPANY,P940_LOCATION,P940_PANEL","fields":["P936_FROMDATE","P936_TODATE","P936_COMPANY","P936_LOCAT'
||'ION","P936_PANEL"]}],items="#P936_FROMDATE,#P936_TODATE,#P936_COMPANY,#P936_LOCATION,#P936_PANEL";window.addEventListener(''click'',function(e){var node=e.target.closest(''button,a.t-Button'');if(!node)return;var match=buttons.find(function(b){return b.d'
||'om===node.id;});if(!match)return;e.preventDefault();e.stopImmediatePropagation();if(node.disabled)return;node.disabled=true;apex.server.process(''DS360_NAVIGATION'',{x01:match.name,pageItems:items},{dataType:''json'',success:function(result){if(result&&r'
||'esult.url)apex.navigation.redirect(result.url);},error:function(){apex.message.alert(''The related page could not be opened. Please try again.'');},complete:function(){node.disabled=false;}});},true);}());',
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
unistr('ITEM 360 \2014 data contract.'),
'',
'GRAIN: ITEM *AND* UNIT OF MEASURE. The subject is the pair',
unistr('(P936_ITEMCODE, P936_UOM) \2014 the same grain as the Item Procurement report on'),
'page 683 that drills here, so the figures tie to the clicked row exactly. One',
'item booked in two units is two separate subjects, because rates across units',
'are not comparable and quantities across units cannot be summed.',
'',
'THE ~NONE~ SENTINEL. Bill lines with no unit recorded arrive as the literal',
'string ''~NONE~'', never as NULL. A NULL would be read by this page as "all units"',
unistr('and would total the wrong population \2014 the row would silently show more than the'),
'row that was clicked. Decoded on arrival with',
'    nvl(d.RateMeasuringUnitCode,''~NONE~'') = :P936_UOM',
'The same applies to P936_SPEC on the optional specification narrowing.',
'',
unistr('REALISED RATE \2014 THE THREE-LEVEL LADDER. Every rate on this page is money booked'),
'divided by quantity booked. It is NEVER an average of the stored Rate column,',
'which mixes rate bases.',
unistr('    L \2014 filtered bill LINES (Quantity1 > 0 and Amount > 0)'),
unistr('    B \2014 one realised rate per BILL: SUM(Amt)/SUM(Qty)'),
unistr('    A \2014 the aggregate: AvgRate = SUM(Amt)/SUM(Qty) across bills;'),
'        Min/Max/Last are per-BILL rates',
'AvgRate is a value-weighted mean, so a one-kilogram bill is not weighted like a',
'forty-tonne one. LastRate uses KEEP (DENSE_RANK LAST ORDER BY BillDate, BillTno)',
'so "the most recent rate" is deterministic when several bills share a date.',
'',
unistr('THIS LADDER IS COPIED, NOT SHARED. Pages 679 and 681 each carry an inlined copy \2014'),
'APEXlang has no shared-SQL construct. The copies MUST be kept in sync by',
'discipline: a figure clicked on 683 must reconcile on 679, and a specification',
'row clicked on 679 must reconcile on 681. In any rebuild, factor this into a',
'database view or function so the copies cannot drift apart.',
'',
'PREMIUM IS ARITHMETIC ONLY. The vendor comparison ranks suppliers by what was',
'actually paid. It is NOT quality-adjusted, because this ERP holds no quality or',
'service rating to adjust with. Keep that caveat in any rebuild.',
'',
'PANEL SECURITY. Scalar-subquery form on every region, as elsewhere in the suite.',
'',
'READ-ONLY. Every region is a SELECT.'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(21531847000436198)
,p_name=>'Item 360'
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
'  || ''<div class="ds-purchase-head-eyebrow">Item 360</div>''',
'  || ''<h1 class="ds-purchase-head-title">''',
'     || apex_escape.html(nvl((Select i.ItemName From Item i',
'                               Where i.ItemCode = :P936_ITEMCODE),',
'                             nvl(:P936_ITEMCODE,''No item selected'')))',
'     || ''</h1>''',
'  || ''<p class="ds-purchase-head-sub">What this item cost, from whom, and ''',
'  || ''against which specification. Every rate here is money booked divided ''',
'  || ''by quantity booked, within this one unit of measure.</p>''',
'  || ''<div class="ds-purchase-head-context">''',
'  -- The unit is part of the SUBJECT, not a filter, so it is stated first.',
'  || ''<span class="ds-purchase-head-chip">Unit <b>''',
'     || apex_escape.html(',
'          Case When :P936_UOM = ''~NONE~'' Then ''No unit recorded''',
'               Else nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'                          Where m.MeasuringUnitCode = :P936_UOM),',
'                        nvl(:P936_UOM,''All units'')) End)',
'     || ''</b></span>''',
'  || Case When :P936_SPEC Is Not Null',
'          Then ''<span class="ds-purchase-head-chip">Specification <b>''',
'               || apex_escape.html(',
'                    Case When :P936_SPEC = ''~NONE~'' Then ''No specification recorded''',
'                         Else nvl((Select s.ItemSpecificationName',
'                                     From ItemSpecification s',
'                                    Where s.ItemSpecificationCode = :P936_SPEC),',
'                                  :P936_SPEC) End)',
'               || ''</b></span>''',
'          Else '''' End',
'  || ''<span class="ds-purchase-head-chip">Period <b>''',
'     || apex_escape.html(:P936_FROMDATE) || '' &rarr; ''',
'     || apex_escape.html(:P936_TODATE) || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Company <b>''',
'     || apex_escape.html(nvl(GetCompanyName(:P936_COMPANY),''All companies''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Location <b>''',
'     || apex_escape.html(nvl(GetLocationName(:P936_LOCATION),''All locations''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip ds-purchase-head-chip--live">Last buy <b>''',
'     || apex_escape.html(nvl(to_char(',
'          (Select Max(h.PurchaseBillDate)',
'             From PCC_PurchaseBill h',
'             Join PurchaseBillDetail d On d.TNo = h.TNo',
'            Where d.ItemCode = :P936_ITEMCODE',
'              And (:P936_UOM Is Null',
'                   Or nvl(d.RateMeasuringUnitCode,''~NONE~'') = :P936_UOM)',
'              And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                   Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))),',
'          ''DD-Mon-RRRR''),''never bought''))',
'     || ''</b></span>''',
'  || ''</div></div>'' As HEAD',
'From dual) union all select ''<div class="ds360-placeholder"><h2>Item 360</h2><p>Select a record below and click Apply to view its master details, totals and line registers.</p></div>'' HEAD,1 ds360_priority from dual where :P936_ITEMCODE is null) orde'
||'r by ds360_priority fetch first 1 rows only'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P936_COMPANY,P936_FROMDATE,P936_ITEMCODE,P936_LOCATION,P936_PANEL,P936_SPEC,P936_SUPPLIER,P936_TODATE,P936_UOM'
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
 p_id=>wwv_flow_imp.id(21531958484436198)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Whole header as one HTML string. The unit chip decodes the ~NONE~ sentinel to a readable phrase rather than printing the sentinel.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21532015170436198)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p679Filters'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(21532252711436199)
,p_name=>'Item KPIs'
,p_static_id=>'item-kpi'
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
unistr('  -- Level 1: filtered bill LINES. The guards matter \2014 a line with zero'),
'  -- quantity or zero value would divide to nonsense or drag the mean.',
'  Select h.TNo BillTno, h.PurchaseBillDate BillDate, h.PartyCode,',
'         d.Amount Amt, d.Quantity1 Qty',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where d.ItemCode = :P936_ITEMCODE',
'     And (:P936_UOM  Is Null',
'          Or nvl(d.RateMeasuringUnitCode,''~NONE~'') = :P936_UOM)',
'     And (:P936_SPEC Is Null',
'          Or nvl(d.ItemSpecificationCode,''~NONE~'') = :P936_SPEC)',
'     And h.PurchaseBillDate',
'         Between to_date(:P936_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P936_TODATE,''DD-MM-RRRR'')',
'     And nvl(d.Quantity1,0) > 0',
'     And nvl(d.Amount,0)    > 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P936_PANEL Is Null Or h.Panel = :P936_PANEL)',
'     And (:P936_COMPANY  Is Null Or h.CompanyCode  = :P936_COMPANY)',
'     And (:P936_LOCATION Is Null Or h.LocationCode = :P936_LOCATION)',
'     And (:P936_SUPPLIER Is Null Or h.PartyCode    = :P936_SUPPLIER)),',
'B As (',
'  -- Level 2: one realised rate per BILL.',
'  Select BillTno, BillDate,',
'         Sum(Amt) Amt, Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) BillRate',
'    From L',
'   Group By BillTno, BillDate),',
'A As (',
'  -- Level 3: the aggregate. AvgRate is value-weighted; Min/Max/Last are',
'  -- per-BILL rates.',
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
'  || ''for this item in this unit. Must equal the Spend column on the Item ''',
'  || ''Procurement report that drilled here.">''',
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
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(v.Vendors,0),''FM999G999'')',
'     || '' suppliers used</span>''',
'  || ''</span></div>'' As KPI1,',
'  ''<div class="ds-kpi ds-kpi--bill" title="Number of bills carrying this item ''',
unistr('  || ''in this unit \2014 how often it is actually bought.">'''),
'  || ''<span class="ds-kpi-ic"><span class="fa fa-repeat"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Purchase Frequency</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(a.Bills,0),''FM999G999'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">bills carrying this item</span>''',
'  || ''</span></div>'' As KPI2,',
'  ''<div class="ds-kpi ds-kpi--input" title="SUM(Quantity1) IN THIS UNIT ONLY. ''',
unistr('  || ''This figure is meaningful only within the unit named in the header \2014 it '''),
'  || ''is never added to a quantity in another unit.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-cubes"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Quantity Purchased</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || to_char(nvl(a.Qty,0),''FM999G999G990D000'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">in ''',
'     || apex_escape.html(',
'          Case When :P936_UOM = ''~NONE~'' Then ''lines with no unit recorded''',
'               Else nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'                          Where m.MeasuringUnitCode = :P936_UOM),',
'                        ''the selected unit'') End)',
'     || ''</span>''',
'  || ''</span></div>'' As KPI3,',
unistr('  ''<div class="ds-kpi ds-kpi--move" title="SUM(Amount)/SUM(Quantity1) \2014 total '''),
'  || ''money divided by total quantity. A VALUE-WEIGHTED mean, deliberately ''',
'  || ''not an average of per-bill rates.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-balance-scale"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Avg Realised Rate</span>''',
'  || ''<span class="ds-kpi-n">Rs ''',
'     || to_char(Round(a.AvgRate,2),''FM99G99G990D00'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">money booked / quantity booked</span>''',
'  || ''</span></div>'' As KPI4,',
'  ''<div class="ds-kpi ds-kpi--struct" title="The realised rate on the most ''',
'  || ''recent bill, resolved with KEEP DENSE_RANK LAST on bill date then bill ''',
'  || ''key so it is deterministic when several bills share a date.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-tag"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Last Purchase Rate</span>''',
'  || ''<span class="ds-kpi-n">Rs ''',
'     || to_char(Round(a.LastRate,2),''FM99G99G990D00'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || nvl(to_char(a.LastBuy,''DD-Mon-RRRR''),''no purchase in period'')',
'     || ''</span>''',
'  || ''</span></div>'' As KPI5,',
'  -- A WIDE SPREAD IS ADVERSE, so this card takes the risk accent.',
'  ''<div class="ds-kpi ds-kpi--risk" title="100 * (dearest - cheapest) / ''',
'  || ''cheapest, on per-BILL realised rates. A wide spread on a high-spend ''',
unistr('  || ''item is worth investigating \2014 it may be timing, grade or supplier.">'''),
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
,p_ajax_items_to_submit=>'P936_COMPANY,P936_FROMDATE,P936_ITEMCODE,P936_LOCATION,P936_PANEL,P936_SPEC,P936_SUPPLIER,P936_TODATE,P936_UOM'
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
 p_id=>wwv_flow_imp.id(21532377577436199)
,p_query_column_id=>1
,p_column_alias=>'KPI1'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Purchase Value. Reconciliation anchor against the Spend column on the 683 Item Procurement row that drilled here.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21532459818436199)
,p_query_column_id=>2
,p_column_alias=>'KPI2'
,p_column_display_sequence=>20
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Purchase frequency \2014 bill count, not line count, so a multi-line bill counts once.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21532574495436199)
,p_query_column_id=>3
,p_column_alias=>'KPI3'
,p_column_display_sequence=>30
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Quantity WITHIN the selected unit only. The sub-line names the unit so the number is never read as a cross-unit total.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21532620463436199)
,p_query_column_id=>4
,p_column_alias=>'KPI4'
,p_column_display_sequence=>40
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Avg realised rate \2014 value-weighted mean. Must match the Avg Realised Rate on the 683 row that drilled here.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21532784223436226)
,p_query_column_id=>5
,p_column_alias=>'KPI5'
,p_column_display_sequence=>50
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Most recent per-bill rate, made deterministic by the KEEP DENSE_RANK LAST tie-break on bill key.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21532893357436226)
,p_query_column_id=>6
,p_column_alias=>'KPI6'
,p_column_display_sequence=>60
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Price spread. Takes the risk accent because a wide spread is adverse \2014 colour follows cost, not arithmetic.')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21533034474436226)
,p_plug_name=>'Item Master'
,p_static_id=>'item-master'
,p_region_name=>'R21533034474436226'
,p_region_css_classes=>'ds-dash-panel ds-register ds360-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>5
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 10 Seq, ''Item name'' As ATTRIBUTE,',
'       apex_escape.html(i.ItemName) As VALUE',
'  From Item i Where i.ItemCode = :P936_ITEMCODE',
'Union All',
'Select 20, ''Item code'', apex_escape.html(i.ItemCode)',
'  From Item i Where i.ItemCode = :P936_ITEMCODE',
'Union All',
'Select 30, ''Parent group'',',
'       nvl((Select apex_escape.html(p.ItemName) From Item p',
'             Where p.ItemCode = i.ParentCode),',
'           ''<span class="ds-muted">top of the hierarchy</span>'')',
'  From Item i Where i.ItemCode = :P936_ITEMCODE',
'Union All',
'Select 35, ''Item category'',',
'       nvl((Select apex_escape.html(c.ItemCategoryName) From ItemCategory c',
'             Where c.ItemCategoryCode = i.ItemCategoryCode),',
'           ''<span class="ds-muted">not categorised</span>'')',
'  From Item i Where i.ItemCode = :P936_ITEMCODE',
'Union All',
'Select 40, ''Stock unit'',',
'       nvl((Select apex_escape.html(m.MeasuringUnitName) From MeasuringUnit m',
'             Where m.MeasuringUnitCode = i.MeasuringUnitCode1),',
'           ''<span class="ds-muted">not recorded</span>'')',
'  From Item i Where i.ItemCode = :P936_ITEMCODE',
'Union All',
'Select 50, ''Alternate unit'',',
'       nvl((Select apex_escape.html(m.MeasuringUnitName) From MeasuringUnit m',
'             Where m.MeasuringUnitCode = i.MeasuringUnitCode2),',
'           ''<span class="ds-muted">not recorded</span>'')',
'  From Item i Where i.ItemCode = :P936_ITEMCODE',
'Union All',
'Select 60, ''Specifications on file'',',
'       to_char((Select Count(*) From ItemSpecification s',
'                 Where s.ItemSpecificationCode In',
'                       (Select Distinct d.ItemSpecificationCode',
'                          From PurchaseBillDetail d',
'                         Where d.ItemCode = :P936_ITEMCODE)))',
'  From dual',
'Union All',
'Select 70, ''HSN codes seen'',',
'       nvl((Select listagg(x.HsnCode, '', '') Within Group (Order By x.HsnCode)',
'              From (Select Distinct s.HsnCode',
'                      From ItemSpecification s',
'                      Join PurchaseBillDetail d',
'                        On d.ItemSpecificationCode = s.ItemSpecificationCode',
'                     Where d.ItemCode = :P936_ITEMCODE',
'                       And s.HsnCode Is Not Null) x),',
'           ''<span class="ds-muted">not recorded</span>'')',
'  From dual',
'Order By 1'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P936_COMPANY,P936_FROMDATE,P936_ITEMCODE,P936_LOCATION,P936_PANEL,P936_SPEC,P936_SUPPLIER,P936_TODATE,P936_UOM'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(936067908310001)
,p_no_data_found_message=>'No matching records. Select a record and Apply; also check the report filters.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>936067908310001
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310003)
,p_db_column_name=>'ATTRIBUTE'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Attribute'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310002)
,p_db_column_name=>'SEQ'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'SEQ'
,p_column_type=>'NUMBER'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310004)
,p_db_column_name=>'VALUE'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Value'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(936067908310005)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'PRIMARY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'SEQ:ATTRIBUTE:VALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21533469596436226)
,p_plug_name=>'Specification Mix'
,p_static_id=>'item-specs'
,p_region_name=>'R21533469596436226'
,p_region_css_classes=>'ds-dash-panel ds-register ds360-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>36
,p_plug_grid_column_span=>7
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With L As (',
'  Select h.TNo BillTno, h.PurchaseBillDate BillDate, h.PartyCode,',
'         nvl(d.ItemSpecificationCode,''~NONE~'') Spec,',
'         d.Amount Amt, d.Quantity1 Qty',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where d.ItemCode = :P936_ITEMCODE',
'     And (:P936_UOM Is Null',
'          Or nvl(d.RateMeasuringUnitCode,''~NONE~'') = :P936_UOM)',
'     And h.PurchaseBillDate',
'         Between to_date(:P936_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P936_TODATE,''DD-MM-RRRR'')',
'     And nvl(d.Quantity1,0) > 0',
'     And nvl(d.Amount,0)    > 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P936_PANEL Is Null Or h.Panel = :P936_PANEL)',
'     And (:P936_COMPANY  Is Null Or h.CompanyCode  = :P936_COMPANY)',
'     And (:P936_LOCATION Is Null Or h.LocationCode = :P936_LOCATION)),',
'B As (',
'  Select Spec, BillTno, BillDate,',
'         Sum(Amt) Amt, Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) BillRate',
'    From L',
'   Group By Spec, BillTno, BillDate),',
'A As (',
'  Select Spec,',
'         Count(*) Bills,',
'         Sum(Amt) Spend,',
'         Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) AvgRate,',
'         Min(BillRate) MinRate,',
'         Max(BillRate) MaxRate,',
'         Max(BillDate) LastBuy',
'    From B',
'   Group By Spec),',
'V As (Select Spec, Count(Distinct PartyCode) Vendors From L Group By Spec)',
'Select',
'  a.Spec As SPECCODE,',
'  Case When a.Spec = ''~NONE~''',
'       Then ''<span class="ds-muted">No specification recorded</span>''',
'       Else apex_escape.html(',
'              nvl((Select s.ItemSpecificationName From ItemSpecification s',
'                    Where s.ItemSpecificationCode = a.Spec), a.Spec))',
'  End As SPECIFICATION,',
'  v.Vendors As VENDORS,',
'  a.Bills As BILLS,',
'  a.Qty As QUANTITY,',
'  a.Spend As SPEND,',
'  Round(a.AvgRate,2) As AVG_RATE,',
'  Round(a.MinRate,2) As MIN_RATE,',
'  Round(a.MaxRate,2) As MAX_RATE,',
'  a.LastBuy As LAST_BUY,',
'  ''<span class="ds-sharecell"><span class="ds-bar ds-bar--gold"><i style="width:''',
'  || to_char(Round(100 * a.Spend / Nullif(Sum(a.Spend) Over (),0),1),''FM99999990D0'')',
'  || ''%"></i></span><b>''',
'  || to_char(Round(100 * a.Spend / Nullif(Sum(a.Spend) Over (),0),1),''FM99999990D0'')',
'  || ''%</b></span>'' As SHARE_OF_ITEM',
'From A a',
'Join V v On v.Spec = a.Spec',
'Order By a.Spend Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P936_COMPANY,P936_FROMDATE,P936_ITEMCODE,P936_LOCATION,P936_PANEL,P936_SPEC,P936_SUPPLIER,P936_TODATE,P936_UOM'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(936067908310006)
,p_no_data_found_message=>'No matching records. Select a record and Apply; also check the report filters.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>936067908310006
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310013)
,p_db_column_name=>'AVG_RATE'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Avg Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310010)
,p_db_column_name=>'BILLS'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Bills'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310016)
,p_db_column_name=>'LAST_BUY'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Last Buy'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310015)
,p_db_column_name=>'MAX_RATE'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Highest'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310014)
,p_db_column_name=>'MIN_RATE'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Lowest'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310011)
,p_db_column_name=>'QUANTITY'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310017)
,p_db_column_name=>'SHARE_OF_ITEM'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Share of Item Spend'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310007)
,p_db_column_name=>'SPECCODE'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'SPECCODE'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310008)
,p_db_column_name=>'SPECIFICATION'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Specification'
,p_column_link=>'f?p=&APP_ID.:938:&APP_SESSION.::NO:938:P938_ITEMCODE,P938_SPEC,P938_UOM,P938_FROMDATE,P938_TODATE,P938_COMPANY,P938_LOCATION,P938_PANEL:&P936_ITEMCODE.,#SPECCODE#,&P936_UOM.,&P936_FROMDATE.,&P936_TODATE.,&P936_COMPANY.,&P936_LOCATION.,&P936_PANEL.'
,p_column_linktext=>'#SPECIFICATION#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310012)
,p_db_column_name=>'SPEND'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Spend'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936067908310009)
,p_db_column_name=>'VENDORS'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Vendors'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(936067908310018)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'PRIMARY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'SPECCODE:SPECIFICATION:VENDORS:BILLS:QUANTITY:SPEND:AVG_RATE:MIN_RATE:MAX_RATE:LAST_BUY:SHARE_OF_ITEM'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(21536230379436228)
,p_name=>'Realised Rate by Month'
,p_static_id=>'price-trend'
,p_template=>4072358936313175081
,p_display_sequence=>55
,p_region_css_classes=>'ds-dash-panel hspl-register-empty-disabled'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ds_chart_ordered As (',
'  Select to_char(Trunc(h.PurchaseBillDate,''MM''),''Mon-RR'') MONTH_LABEL,',
'         Round(Sum(d.Amount) / Nullif(Sum(d.Quantity1),0), 2) RATE,',
'         Trunc(h.PurchaseBillDate,''MM'') SORT_KEY',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where d.ItemCode = :P936_ITEMCODE',
'     And (:P936_UOM  Is Null',
'          Or nvl(d.RateMeasuringUnitCode,''~NONE~'') = :P936_UOM)',
'     And (:P936_SPEC Is Null',
'          Or nvl(d.ItemSpecificationCode,''~NONE~'') = :P936_SPEC)',
'     And h.PurchaseBillDate',
'         Between to_date(:P936_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P936_TODATE,''DD-MM-RRRR'')',
'     And nvl(d.Quantity1,0) > 0',
'     And nvl(d.Amount,0)    > 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P936_PANEL Is Null Or h.Panel = :P936_PANEL)',
'     And (:P936_COMPANY  Is Null Or h.CompanyCode  = :P936_COMPANY)',
'     And (:P936_LOCATION Is Null Or h.LocationCode = :P936_LOCATION)',
'     And (:P936_SUPPLIER Is Null Or h.PartyCode    = :P936_SUPPLIER)',
'   Group By Trunc(h.PurchaseBillDate,''MM'')',
'   Order By SORT_KEY',
'),',
'ds_chart_q As (',
'  Select ordered_q.*, rownum ds_ord',
'    From ds_chart_ordered ordered_q',
')',
'Select',
'  ''<div class="ds-fast-chart" data-chart-type="line" aria-label="Realised Rate by Month"><script type="application/json" class="ds-fast-chart-data">'' ||',
'  replace(',
'    json_object(',
'      ''unit'' value '''',',
'      ''series'' value json_array(''Realised Rate'' returning clob) format json,',
'      ''rows'' value json_arrayagg(',
'        json_object(''l'' value to_char(q.MONTH_LABEL),',
'                    ''values'' value json_array(q.RATE returning clob) format json,',
'                    ''u'' value null',
'                    returning clob)',
'        order by q.ds_ord returning clob) format json',
'      returning clob),',
'    ''<'', ''\\u003c''',
'  ) || ''</script></div>'' As CHART_ROW',
'From ds_chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P936_COMPANY,P936_FROMDATE,P936_ITEMCODE,P936_LOCATION,P936_PANEL,P936_SPEC,P936_SUPPLIER,P936_TODATE,P936_UOM'
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
 p_id=>wwv_flow_imp.id(21536482130436228)
,p_query_column_id=>1
,p_column_alias=>'CHART_ROW'
,p_column_display_sequence=>10
,p_column_heading=>' '
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21532904280436226)
,p_plug_name=>'Item Master and Specifications'
,p_static_id=>'rule-master'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Master Record &amp; Specification Mix</h2>',
'  <p>What the item master records, and how spend splits across the',
'     specifications actually bought. Fields this ERP does not populate are',
'     omitted rather than shown blank &mdash; a blank reads as missing data,',
'     an absence reads as "not recorded here". Each specification drills to',
'     Specification 360.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21532152282436198)
,p_plug_name=>'Item Position'
,p_static_id=>'rule-pulse'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>15
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>What This Item Cost</h2>',
'  <p>Headline position for this item in this unit of measure. Average',
'     realised rate is total money divided by total quantity &mdash; a',
'     value-weighted mean, <em>not</em> an average of per-bill rates, which',
'     would weight a one-kilogram bill like a forty-tonne one.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21536194537436228)
,p_plug_name=>'Rate Over Time'
,p_static_id=>'rule-trend'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Realised Rate by Month</h2>',
'  <p>The rate actually achieved each month, on the same money-over-quantity',
'     basis as the cards above. A rising line is adverse.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21534607218436227)
,p_plug_name=>'Vendor Comparison'
,p_static_id=>'rule-vendor'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Who Supplies It, and at What Rate</h2>',
'  <p>Every supplier of this item ranked cheapest first, with the premium each',
'     carries over the best source. This is an <em>arithmetic</em> comparison',
'     of what was actually paid &mdash; it is <strong>not</strong>',
'     quality-adjusted, because this ERP holds no quality or service rating to',
'     adjust with. The table deliberately ignores the Supplier filter so every',
'     vendor stays visible.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21534721550436227)
,p_plug_name=>'Vendor Comparison'
,p_static_id=>'vendor-compare'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>45
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With L As (',
'  Select h.TNo BillTno, h.PurchaseBillDate BillDate, h.PartyCode,',
'         d.Amount Amt, d.Quantity1 Qty',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where d.ItemCode = :P936_ITEMCODE',
'     And (:P936_UOM  Is Null',
'          Or nvl(d.RateMeasuringUnitCode,''~NONE~'') = :P936_UOM)',
'     And (:P936_SPEC Is Null',
'          Or nvl(d.ItemSpecificationCode,''~NONE~'') = :P936_SPEC)',
'     And h.PurchaseBillDate',
'         Between to_date(:P936_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P936_TODATE,''DD-MM-RRRR'')',
'     And nvl(d.Quantity1,0) > 0',
'     And nvl(d.Amount,0)    > 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P936_PANEL Is Null Or h.Panel = :P936_PANEL)',
'     And (:P936_COMPANY  Is Null Or h.CompanyCode  = :P936_COMPANY)',
'     And (:P936_LOCATION Is Null Or h.LocationCode = :P936_LOCATION)),',
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
'  -- Premium over the CHEAPEST source for this item. Arithmetic only.',
'  Round(100 * (a.AvgRate - Min(a.AvgRate) Over ())',
'            / Nullif(Min(a.AvgRate) Over (),0), 1) As PREMIUM_PCT,',
'  a.FirstBuy As FIRST_BUY,',
'  a.LastBuy  As LAST_BUY',
'From A a',
'Order By a.AvgRate'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P936_COMPANY,P936_FROMDATE,P936_ITEMCODE,P936_LOCATION,P936_PANEL,P936_SPEC,P936_SUPPLIER,P936_TODATE,P936_UOM'
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
 p_id=>wwv_flow_imp.id(21534839070436227)
,p_no_data_found_message=>'No supplier billed this item in the selected period, unit and scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21534839070436227
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21535498638436228)
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
 p_id=>wwv_flow_imp.id(21535143886436227)
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
,p_column_comment=>'How many bills this supplier raised for the item.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21535998952436228)
,p_db_column_name=>'FIRST_BUY'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'First Buy'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Earliest bill from this supplier for the item in the period.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21536010601436228)
,p_db_column_name=>'LAST_BUY'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Last Buy'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Most recent bill. A distant date next to a low premium may mean the good rate is stale.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21535758121436228)
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
,p_column_comment=>'Most recent per-bill rate from this supplier, deterministically resolved.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21535659144436228)
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
 p_id=>wwv_flow_imp.id(21535534958436228)
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
 p_id=>wwv_flow_imp.id(21534912872436227)
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
 p_id=>wwv_flow_imp.id(21535806532436228)
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
,p_column_comment=>unistr('How much dearer than the cheapest source. ARITHMETIC ONLY \2014 not quality-adjusted, because this ERP holds no quality or service rating. Zero marks the best source.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21535276958436227)
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
,p_column_comment=>'Quantity in the page''s fixed unit, so this column is comparable down the rows.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21535373042436227)
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
,p_column_comment=>'Money booked with this supplier for the item. Summing this column reproduces the Purchase Value KPI.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21535056452436227)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Supplier'
,p_column_link=>'f?p=&APP_ID.:935:&APP_SESSION.::NO:935:P935_SUPPLIER,P935_FROMDATE,P935_TODATE,P935_COMPANY,P935_LOCATION,P935_PANEL:#PARTYCODE#,&P936_FROMDATE.,&P936_TODATE.,&P936_COMPANY.,&P936_LOCATION.,&P936_PANEL.'
,p_column_linktext=>'#SUPPLIER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Drills to Supplier 360 for the WHOLE supplier \2014 the item and specification are deliberately not carried, because that page is a supplier dossier, not an item view.')
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(99009000000679001)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'AVG_RATE:BILLS:FIRST_BUY:LAST_BUY:LAST_RATE:MAX_RATE:MIN_RATE:PARTYCODE:PREMIUM_PCT:QUANTITY:SPEND:SUPPLIER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21538509853436229)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(21532015170436198)
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
 p_id=>wwv_flow_imp.id(21538685131436229)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(21532015170436198)
,p_button_name=>'BACKTOANALYTICS'
,p_static_id=>'back-to-analytics'
,p_button_static_id=>'ds360NavBACKTOANALYTICS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Purchase Analytics'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
,p_grid_column=>3
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21537909302436228)
,p_name=>'P936_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
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
,p_help_text=>'Narrows every region to one company.'
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
 p_id=>wwv_flow_imp.id(21537561515436228)
,p_name=>'P936_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
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
,p_help_text=>'Start of the reporting period. Arrives from the page that drilled here.'
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
 p_id=>wwv_flow_imp.id(21536789148436228)
,p_name=>'P936_ITEMCODE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
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
,p_lov_display_extra=>'YES'
,p_help_text=>'Half the subject of this page. Populated from bill lines, so every entry returns rows.'
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
 p_id=>wwv_flow_imp.id(21538109098436229)
,p_name=>'P936_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From PCC_PurchaseBill fb',
'                Where fb.LocationCode = l.LocationCode',
'                  And (:P936_COMPANY Is Null',
'                       Or fb.CompanyCode = :P936_COMPANY)',
'                  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                       Or fb.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P936_COMPANY'
,p_ajax_items_to_submit=>'P936_COMPANY'
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
 p_id=>wwv_flow_imp.id(21538328684436229)
,p_name=>'P936_PANEL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
,p_prompt=>'Internal Scope'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov=>'STATIC:A;A,B;B'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'A + B'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'SAGAR.GetUserPanelAB_apex() Is Null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Hidden when your login is already bound to a panel. The select list is the control; the SQL predicate on every region is the enforcement.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21537188215436228)
,p_name=>'P936_SPEC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
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
' Where d.ItemCode = :P936_ITEMCODE',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All specifications'
,p_lov_cascade_parent_items=>'P936_ITEMCODE'
,p_ajax_items_to_submit=>'P936_ITEMCODE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Optional narrowing. The Specification Mix report below always shows every specification regardless of this setting, so the mix stays readable.'
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
 p_id=>wwv_flow_imp.id(21537341189436228)
,p_name=>'P936_SUPPLIER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
,p_prompt=>'Supplier'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct GetPartyName(h.PartyCode) d, h.PartyCode r',
'  From PCC_PurchaseBill h',
'  Join PurchaseBillDetail d On d.TNo = h.TNo',
' Where d.ItemCode = :P936_ITEMCODE',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All suppliers'
,p_lov_cascade_parent_items=>'P936_ITEMCODE'
,p_ajax_items_to_submit=>'P936_ITEMCODE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Narrows the KPI cards and the rate trend. The Vendor Comparison deliberately IGNORES this filter \2014 a comparison filtered to one vendor has nothing to compare.')
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
 p_id=>wwv_flow_imp.id(21537718761436228)
,p_name=>'P936_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
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
 p_id=>wwv_flow_imp.id(21536961450436228)
,p_name=>'P936_UOM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(21532015170436198)
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
' Where d.ItemCode = :P936_ITEMCODE',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All units (rates not comparable)'
,p_lov_cascade_parent_items=>'P936_ITEMCODE'
,p_ajax_items_to_submit=>'P936_ITEMCODE'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>unistr('The other half of the subject. Leaving this blank mixes units, and the rates then are NOT comparable \2014 the null display value says so.')
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
 p_id=>wwv_flow_imp.id(900360090000679)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DS360_NAVIGATION'
,p_static_id=>'ds360-navigation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'case apex_application.g_x01',
'when ''BACKTOANALYTICS'' then',
'apex_json.open_object;apex_json.write(''url'',apex_page.get_url(p_page=>''940'',p_clear_cache=>''940'',p_items=>''P940_FROMDATE,P940_TODATE,P940_COMPANY,P940_LOCATION,P940_PANEL'',p_values=>:P936_FROMDATE||'',''||:P936_TODATE||'',''||:P936_COMPANY||'',''||:P936_LO'
||'CATION||'',''||:P936_PANEL));apex_json.close_object;',
'else raise_application_error(-20001,''Unknown navigation action'');end case;end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900360090000679
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
