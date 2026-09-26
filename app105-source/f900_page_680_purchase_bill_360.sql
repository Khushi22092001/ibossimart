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
,p_default_workspace_id=>1516344673109637
,p_default_application_id=>900
,p_default_id_offset=>0
,p_default_owner=>'HSPLDASHBOARD'
);
end;
/
 
prompt APPLICATION 900 - DASHBOARD(UI DEVELOPMENT)
--
-- Application Export:
--   Application:     900
--   Name:            DASHBOARD(UI DEVELOPMENT)
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 680
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746037717004653
--

begin
null;
end;
/
prompt --application/pages/delete_00680
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>680);
end;
/
prompt --application/pages/page_00680
begin
wwv_flow_imp_page.create_page(
 p_id=>680
,p_name=>'Purchase Bill 360'
,p_alias=>'PURCHASE-BILL-360'
,p_step_title=>'Purchase Bill 360'
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
' var config={"page":680,"filter":"p680Filters","regions":["R21538808280436229","R21539017294436229","R21539826356436256","R21540964868436257"]},$=apex.jQuery,running=false;',
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
unistr('PURCHASE BILL 360 \2014 data contract.'),
'',
'SUBJECT. One supplier invoice, held in P680_TNO. Reached from the Purchase Bill',
'Register on page 668 and from the Bills report on Supplier 360. This page has no',
'filter bar: it describes exactly one document, so there is nothing to filter.',
'',
'THE TWO AMOUNTS ARE DIFFERENT ON PURPOSE, and both are shown.',
unistr('  Line value  = SUM(PurchaseBillDetail.Amount) \2014 the TAXABLE purchase value, and'),
'                the figure every other page in this suite sums.',
'  Bill amount = the header total, which additionally carries footer tax.',
'Confusing the two is the single easiest way to break reconciliation against the',
'register, so this page prints them side by side with the difference named rather',
'than showing one and letting the reader assume it is the other.',
'',
'SETTLEMENT IS THE ADVICE BASIS. PBPass.PaidAmount is only written when settlement',
unistr('runs through Payment Advice. A blank does NOT prove the bill is unpaid \2014 it may'),
'have been settled by direct voucher. The card and the columns say so, and the',
'ledger voucher number is shown where the pass has posted.',
'',
'RECEIPTS BEHIND THE BILL come through PurchaseBillGRNDetail, which ties the bill',
'to the GRNs it was raised against. A bill with no linked receipt is not',
unistr('necessarily wrong \2014 a service or freight bill has nothing to receive \2014 so the'),
'region says that rather than presenting emptiness as a fault.',
'',
'PANEL SECURITY. The panel predicate sits on the HEADER query itself, so a bill',
'outside the login''s panel renders "Bill not found" rather than leaking that it',
'exists.',
'',
'READ-ONLY. Every region is a SELECT.'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21539826356436256)
,p_plug_name=>'Bill Lines'
,p_static_id=>'bill-lines'
,p_region_name=>'R21539826356436256'
,p_region_css_classes=>'ds-dash-panel ds-register ds360-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>25
,p_plug_grid_column_span=>12
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  d.SNo As LINE_NO,',
'  nvl((Select i.ItemName From Item i Where i.ItemCode = d.ItemCode),',
'      d.ItemCode) As ITEM,',
'  nvl((Select s.ItemSpecificationName From ItemSpecification s',
'        Where s.ItemSpecificationCode = d.ItemSpecificationCode),',
'      ''<span class="ds-muted">no specification</span>'') As SPECIFICATION,',
'  d.Quantity1 As QUANTITY,',
'  nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'        Where m.MeasuringUnitCode = d.RateMeasuringUnitCode),',
'      ''<span class="ds-muted">no unit</span>'') As UOM,',
'  d.Rate As RATE,',
'  d.Amount As AMOUNT,',
'  d.TotalAmount As TOTAL_WITH_TAX,',
'  -- The rate actually realised on this line, which can differ from the',
'  -- stored Rate when the quantity or amount was adjusted after entry.',
'  Case When nvl(d.Quantity1,0) > 0',
'       Then Round(d.Amount / d.Quantity1, 2) End As REALISED_RATE',
'From PurchaseBillDetail d',
'Join PurchaseBill h On h.TNo = d.TNo',
'Where h.TNo = :P680_TNO',
'  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'       Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'Order By d.SNo'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P680_COMPANY,P680_FROMDATE,P680_LOCATION,P680_SUPPLIER,P680_TNO,P680_TODATE'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(936068008310001)
,p_no_data_found_message=>'No matching records. Select a record and Apply; also check the report filters.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>936068008310001
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310009)
,p_db_column_name=>'AMOUNT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Amount (taxable)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310003)
,p_db_column_name=>'ITEM'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310002)
,p_db_column_name=>'LINE_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Line'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310005)
,p_db_column_name=>'QUANTITY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310007)
,p_db_column_name=>'RATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310008)
,p_db_column_name=>'REALISED_RATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Realised Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310004)
,p_db_column_name=>'SPECIFICATION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Specification'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310010)
,p_db_column_name=>'TOTAL_WITH_TAX'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Total (with tax)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310006)
,p_db_column_name=>'UOM'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(936068008310011)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'PRIMARY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'LINE_NO:ITEM:SPECIFICATION:QUANTITY:UOM:RATE:REALISED_RATE:AMOUNT:TOTAL_WITH_TAX'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(21538808280436229)
,p_name=>'Purchase Bill 360'
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
'  || ''<div class="ds-purchase-head-eyebrow">Purchase Bill 360</div>''',
'  || ''<h1 class="ds-purchase-head-title">Bill ''',
'     || apex_escape.html(nvl(h.PartyBillNo, h.PurchaseBillNo)) || ''</h1>''',
'  || ''<p class="ds-purchase-head-sub">One supplier invoice &mdash; what was ''',
'  || ''billed, what was approved, what has settled, and the receipts it was ''',
'  || ''raised against.</p>''',
'  || ''<div class="ds-purchase-head-context">''',
'  || ''<span class="ds-purchase-head-chip">Supplier <b>''',
'     || apex_escape.html(nvl(GetPartyName(h.PartyCode),''not recorded''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Supplier bill date <b>''',
'     || apex_escape.html(nvl(to_char(h.PartyBillDate,''DD-Mon-RRRR''),',
'                             ''not recorded''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Booked on <b>''',
'     || apex_escape.html(to_char(h.PurchaseBillDate,''DD-Mon-RRRR''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Our bill no <b>''',
'     || apex_escape.html(h.PurchaseBillNo) || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Company <b>''',
'     || apex_escape.html(nvl(GetCompanyName(h.CompanyCode),''not recorded''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Location <b>''',
'     || apex_escape.html(nvl(GetLocationName(h.LocationCode),''not recorded''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Doc type <b>''',
'     || apex_escape.html(',
'          nvl((Select dt.DocTypeName From DocType dt',
'                Where dt.DocTypeCode = h.DocTypeCode), h.DocTypeCode))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">GSTIN <b>''',
'     || apex_escape.html(nvl(GetPartyAttributeValue(h.PartyCode,''GSTINNO''),',
'                             ''Not on file''))',
'     || ''</b></span>''',
'  -- Whether the bill traces to an order at all. A bill with no order is not',
unistr('  -- wrong \2014 direct and service purchases exist \2014 but it cannot be reconciled'),
'  -- against committed spend, so the reader is told.',
'  || ''<span class="ds-purchase-head-chip">Against order <b>''',
'     || Case When h.PurchaseOrderTNo Is Null Then ''No order linked''',
'             Else apex_escape.html(',
'                    nvl((Select o.PurchaseOrderNo From PurchaseOrder o',
'                          Where o.TNo = h.PurchaseOrderTNo),''linked'')) End',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip ds-purchase-head-chip--live">Position <b>''',
'     || Case When p.PurchaseBillTNo Is Null Then ''Not passed''',
'             When nvl(p.PaidAmount,0) = 0 Then ''Passed, no advice settlement''',
'             When nvl(p.PaidAmount,0) >= nvl(p.PBPassAmount,0) Then ''Settled''',
'             Else ''Part settled'' End',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Panel <b>''',
'     || apex_escape.html(nvl(h.Panel,''not set'')) || ''</b></span>''',
'  || ''</div></div>'' As HEAD',
'From PurchaseBill h',
'Left Join PBPass p On p.PurchaseBillTNo = h.TNo',
'Where h.TNo = :P680_TNO',
'  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'       Or h.Panel = (Select GetUserPanelAB_apex() From dual))) union all select ''<div class="ds360-placeholder"><h2>Purchase Bill 360</h2><p>Select a record below and click Apply to view its master details, totals and line registers.</p></div>'' HEAD,'
||'1 ds360_priority from dual where :P680_TNO is null) order by ds360_priority fetch first 1 rows only'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P680_COMPANY,P680_FROMDATE,P680_LOCATION,P680_SUPPLIER,P680_TNO,P680_TODATE'
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
 p_id=>wwv_flow_imp.id(21538949693436229)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Whole identity header as one HTML string. Titled by the SUPPLIER''s bill number where present \2014 that is what the supplier will quote \2014 with our own number carried as a separate chip.')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(96800000000000001)
,p_plug_name=>'Standalone Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p680Filters'
,p_region_css_classes=>'ds-dash-filters ds-360-filters ds360-filters'
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
 p_id=>wwv_flow_imp.id(21539017294436229)
,p_name=>'Bill Position'
,p_static_id=>'kpi-strip'
,p_template=>4501440665235496320
,p_display_sequence=>10
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols hspl-register-empty-disabled ds360-kpi'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Ln As (',
'  Select Sum(d.Amount) LineVal,',
'         Sum(d.TotalAmount) TotalVal,',
'         Count(*) Lines,',
'         Count(Distinct d.ItemCode) Items',
'    From PurchaseBillDetail d',
'    Join PurchaseBill h On h.TNo = d.TNo',
'   Where h.TNo = :P680_TNO',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual))),',
'Ps As (',
'  Select p.PBPassAmount Passed, p.PaidAmount PaidAdv,',
'         p.PBPassNo, p.PBPassDate, p.PurchaseBillTNo,',
'         (Select Max(v.VoucherNo) From Voucher v',
'           Where v.ModuleCode = ''PBPASS'' And v.ModuleTNo = p.TNo) VoucherNo',
'    From PBPass p',
'    Join PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Where h.TNo = :P680_TNO',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual))),',
'Rc As (',
'  Select Count(Distinct bg.GRNTno) Grns',
'    From PurchaseBillGRNDetail bg',
'   Where bg.TNo = :P680_TNO)',
'Select',
unistr('  ''<div class="ds-kpi ds-kpi--value" title="SUM(PurchaseBillDetail.Amount) \2014 '''),
'  || ''the TAXABLE line value. This is the figure every other page in the ''',
'  || ''suite sums, and the one that reconciles to the Purchase Bill Register.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-inr"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Line Value (taxable)</span>''',
'  || ''<span class="ds-kpi-n">Rs ''',
'     || to_char(nvl(l.LineVal,0),''FM99G99G99G990D00'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(l.Lines,0),''FM999G990'')',
'     || '' lines &middot; '' || to_char(nvl(l.Items,0),''FM999G990'')',
'     || '' distinct items</span>''',
'  || ''</span></div>'' As KPI1,',
'  -- Shown BESIDE the line value, with the gap named, so the two can never be',
'  -- mistaken for one another.',
'  ''<div class="ds-kpi ds-kpi--bill" title="The line total including footer ''',
'  || ''tax. Larger than the taxable line value; the difference is the tax and ''',
'  || ''other footer heads. Do NOT sum this column across bills expecting it to ''',
unistr('  || ''match the register \2014 the register totals the taxable value.">'''),
'  || ''<span class="ds-kpi-ic"><span class="fa fa-file-text-o"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Bill Amount (with tax)</span>''',
'  || ''<span class="ds-kpi-n">Rs ''',
'     || to_char(nvl(l.TotalVal,0),''FM99G99G99G990D00'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">Rs ''',
'     || to_char(nvl(l.TotalVal,0) - nvl(l.LineVal,0),''FM99G99G99G990D00'')',
'     || '' of tax and footer heads</span>''',
'  || ''</span></div>'' As KPI2,',
unistr('  ''<div class="ds-kpi ds-kpi--ok" title="PBPass.PBPassAmount \2014 the amount '''),
'  || ''approved for payment. One pass per bill.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-check-square-o"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Passed</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When p.PurchaseBillTNo Is Null',
'             Then ''<span class="ds-muted">not passed</span>''',
'             Else ''Rs '' || to_char(nvl(p.Passed,0),''FM99G99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When p.PBPassNo Is Null',
'             Then ''no pass raised against this bill''',
'             Else ''Pass '' || apex_escape.html(p.PBPassNo) || '' on ''',
'                  || to_char(p.PBPassDate,''DD-Mon-RRRR'') End',
'     || ''</span>''',
'  || ''</span></div>'' As KPI3,',
unistr('  ''<div class="ds-kpi ds-kpi--suppl" title="PBPass.PaidAmount \2014 the Payment '''),
'  || ''Advice basis ONLY. A blank does not prove the bill is unpaid: it may ''',
'  || ''have been settled by direct voucher, which this column never records.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-credit-card"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Settled (via advice)</span>''',
'  || ''<span class="ds-kpi-n">Rs ''',
'     || to_char(nvl(p.PaidAdv,0),''FM99G99G99G990D00'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(p.PaidAdv,0) = 0',
'             Then ''<span class="ds-muted">may still be paid by direct ''',
'                  || ''voucher</span>''',
'             Else ''advice route only'' End',
'     || ''</span>''',
'  || ''</span></div>'' As KPI4,',
'  ''<div class="ds-kpi ds-kpi--risk" title="Passed less settled, on the advice ''',
unistr('  || ''basis. Null rather than zero where the bill has not been passed \2014 an '''),
'  || ''unpassed bill is not a settled one.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-hourglass-half"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Unsettled</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When p.PurchaseBillTNo Is Null',
'             Then ''<span class="ds-muted">not passed</span>''',
'             Else ''Rs '' || to_char(nvl(p.Passed,0) - nvl(p.PaidAdv,0),',
'                                   ''FM99G99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When p.VoucherNo Is Not Null',
'             Then ''Ledger voucher '' || apex_escape.html(p.VoucherNo)',
'             Else ''<span class="ds-muted">no ledger voucher posted</span>'' End',
'     || ''</span>''',
'  || ''</span></div>'' As KPI5,',
'  ''<div class="ds-kpi ds-kpi--input" title="Distinct GRNs tied to this bill ''',
'  || ''through PurchaseBillGRNDetail. A bill with no linked receipt is not ''',
unistr('  || ''necessarily wrong \2014 a service or freight bill has nothing to receive.">'''),
'  || ''<span class="ds-kpi-ic"><span class="fa fa-truck"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Receipts Behind It</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(r.Grns,0),''FM999G990'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(r.Grns,0) = 0',
unistr('             Then ''<span class="ds-muted">none linked \2014 normal for a service '''),
'                  || ''bill</span>''',
'             Else ''GRNs this bill was raised against'' End',
'     || ''</span>''',
'  || ''</span></div>'' As KPI6',
'From Ln l',
'Cross Join Rc r',
'Left Join Ps p On 1 = 1'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P680_COMPANY,P680_FROMDATE,P680_LOCATION,P680_SUPPLIER,P680_TNO,P680_TODATE'
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
 p_id=>wwv_flow_imp.id(21539166343436230)
,p_query_column_id=>1
,p_column_alias=>'KPI1'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Taxable line value \2014 the suite''s value grain and the reconciliation anchor.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21539284721436230)
,p_query_column_id=>2
,p_column_alias=>'KPI2'
,p_column_display_sequence=>20
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Header total including footer tax, shown beside the taxable value with the gap named so the two cannot be confused.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21539346404436230)
,p_query_column_id=>3
,p_column_alias=>'KPI3'
,p_column_display_sequence=>30
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Passed amount with its pass number and date. Renders "not passed" rather than zero where no pass exists.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21539438415436230)
,p_query_column_id=>4
,p_column_alias=>'KPI4'
,p_column_display_sequence=>40
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Settlement on the Payment Advice basis only. The sub-line states explicitly that a blank does not prove non-payment.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21539541165436230)
,p_query_column_id=>5
,p_column_alias=>'KPI5'
,p_column_display_sequence=>50
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Unsettled on the advice basis, carrying the ledger voucher number where the pass has posted.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21539640343436230)
,p_query_column_id=>6
,p_column_alias=>'KPI6'
,p_column_display_sequence=>60
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Receipt count via PurchaseBillGRNDetail. Explains an empty result rather than presenting it as a fault.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21540964868436257)
,p_plug_name=>'Receipts Against This Bill'
,p_static_id=>'linked-grn'
,p_region_name=>'R21540964868436257'
,p_region_css_classes=>'ds-dash-panel ds-register ds360-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>12
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  g.GrnNo As GRN_NO,',
'  g.GrnDate As GRN_DATE,',
'  GetLocationName(g.LocationCode) As LOCATION,',
'  nvl((Select o.PurchaseOrderNo From PurchaseOrder o',
'        Where o.TNo = g.PurchaseOrderTNo),',
'      ''<span class="ds-muted">no order linked</span>'') As AGAINST_ORDER,',
'  (Select Sum(nvl(gd.ReceivedQuantity1,0)) From GrnDetail gd',
'    Where gd.TNo = g.TNo) As RECEIVED_QTY,',
'  (Select Sum(nvl(gd.RejectedQuantity1,0)) From GrnDetail gd',
'    Where gd.TNo = g.TNo) As REJECTED_QTY,',
'  Case When (Select Sum(nvl(gd.RejectedQuantity1,0)) From GrnDetail gd',
'              Where gd.TNo = g.TNo) > 0',
'       Then ''<span class="ds-pill ds-pill--bad">Rejection recorded</span>''',
'       Else ''<span class="ds-pill ds-pill--good">Accepted</span>''',
'  End As STATUS',
'From PurchaseBillGRNDetail bg',
'Join Grn g On g.TNo = bg.GRNTno',
'Join PurchaseBill h On h.TNo = bg.TNo',
'Where bg.TNo = :P680_TNO',
'  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'       Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'Order By g.GrnDate, g.GrnNo'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P680_COMPANY,P680_FROMDATE,P680_LOCATION,P680_SUPPLIER,P680_TNO,P680_TODATE'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(936068008310012)
,p_no_data_found_message=>'No matching records. Select a record and Apply; also check the report filters.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>936068008310012
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310016)
,p_db_column_name=>'AGAINST_ORDER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Against Order'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310014)
,p_db_column_name=>'GRN_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Receipt Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310013)
,p_db_column_name=>'GRN_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'GRN No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310015)
,p_db_column_name=>'LOCATION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310017)
,p_db_column_name=>'RECEIVED_QTY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Received Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310018)
,p_db_column_name=>'REJECTED_QTY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Rejected Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936068008310019)
,p_db_column_name=>'STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(936068008310020)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'PRIMARY'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'GRN_NO:GRN_DATE:LOCATION:AGAINST_ORDER:RECEIVED_QTY:REJECTED_QTY:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21539751380436230)
,p_plug_name=>'Bill Lines'
,p_static_id=>'rule-lines'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>What Was Billed</h2>',
'  <p>The item lines on this invoice. <em>Amount</em> is the taxable line',
'     value that sums to the headline card; <em>Total</em> adds the footer tax',
'     for that line.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21540869905436256)
,p_plug_name=>'Receipts Behind This Bill'
,p_static_id=>'rule-linked'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Receipts Behind This Bill</h2>',
'  <p>The goods receipts this invoice was raised against, via',
'     <code>PurchaseBillGRNDetail</code>. An empty list is not automatically a',
'     fault &mdash; a service, freight or direct-purchase bill has nothing to',
'     receive.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(96800000000000100)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(96800000000000001)
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
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(96800000000000103)
,p_name=>'P680_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(96800000000000001)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r From Company c',
' Where Exists (Select 1 From PurchaseBill x Where x.CompanyCode=c.CompanyCode',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null Or x.Panel=(Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(96800000000000101)
,p_name=>'P680_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(96800000000000001)
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
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(96800000000000104)
,p_name=>'P680_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(96800000000000001)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r From Location l',
' Where Exists (Select 1 From PurchaseBill x Where x.LocationCode=l.LocationCode',
'   And (:P680_COMPANY Is Null Or x.CompanyCode=:P680_COMPANY)',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null Or x.Panel=(Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P680_COMPANY'
,p_ajax_items_to_submit=>'P680_COMPANY'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(96800000000000105)
,p_name=>'P680_SUPPLIER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(96800000000000001)
,p_prompt=>'Supplier'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct GetPartyName(x.PartyCode) d, x.PartyCode r',
'  From PurchaseBill x',
' Where ((Select GetUserPanelAB_apex() From dual) Is Null Or x.Panel=(Select GetUserPanelAB_apex() From dual))',
'   And (:P680_COMPANY Is Null Or x.CompanyCode=:P680_COMPANY)',
'   And (:P680_LOCATION Is Null Or x.LocationCode=:P680_LOCATION)',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All suppliers'
,p_lov_cascade_parent_items=>'P680_COMPANY,P680_LOCATION'
,p_ajax_items_to_submit=>'P680_COMPANY,P680_LOCATION'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(21541715753436257)
,p_name=>'P680_TNO'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(96800000000000001)
,p_prompt=>'Purchase Bill'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select nvl(h.PurchaseBillNo,''Incomplete bill (TNO ''||h.TNo||'')'') || '' - '' || to_char(h.PurchaseBillDate,''DD-MM-RRRR'') || '' - '' || nvl(GetPartyName(h.PartyCode),''supplier not recorded'') d, h.TNo r',
'  From PurchaseBill h',
' Where ((Select GetUserPanelAB_apex() From dual) Is Null Or h.Panel=(Select GetUserPanelAB_apex() From dual))',
'   And (:P680_COMPANY Is Null Or h.CompanyCode=:P680_COMPANY)',
'   And (:P680_LOCATION Is Null Or h.LocationCode=:P680_LOCATION)',
'   And (:P680_SUPPLIER Is Null Or h.PartyCode=:P680_SUPPLIER)',
'   And (:P680_FROMDATE Is Null Or h.PurchaseBillDate>=to_date(:P680_FROMDATE,''DD-MM-RRRR''))',
'   And (:P680_TODATE Is Null Or h.PurchaseBillDate<to_date(:P680_TODATE,''DD-MM-RRRR'')+1)',
' Order By h.PurchaseBillDate Desc, 1'))
,p_lov_cascade_parent_items=>'P680_COMPANY,P680_LOCATION,P680_FROMDATE,P680_TODATE,P680_SUPPLIER'
,p_ajax_items_to_submit=>'P680_COMPANY,P680_LOCATION,P680_FROMDATE,P680_TODATE,P680_SUPPLIER'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Select the purchase bill directly; this 360 page also accepts a TNO from upstream drill links.'
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
 p_id=>wwv_flow_imp.id(96800000000000102)
,p_name=>'P680_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(96800000000000001)
,p_item_default=>'to_char(trunc(sysdate),''DD-MM-RRRR'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
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
