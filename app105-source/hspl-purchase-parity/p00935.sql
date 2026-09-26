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
--     PAGE: 935
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746037717004653
--

begin
null;
end;
/
prompt --application/pages/delete_00935
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>935);
end;
/
prompt --application/pages/page_00935
begin
wwv_flow_imp_page.create_page(
 p_id=>935
,p_name=>'Supplier 360'
,p_alias=>'SUPPLIER-360'
,p_step_title=>'Supplier 360'
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
' var config={"page":935,"filter":"p669Filters","regions":["R21525111997436167","R21525547958436167","R21526380649436196","R21526847085436196","R21527211956436196","R21528548991436197"]},$=apex.jQuery,running=false;',
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
'(function(){var buttons=[{"name":"BACKTOHUB","dom":"ds360NavBACKTOHUB","page":"934","clear":"934","items":"P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL","fields":["P935_FROMDATE","P935_TODATE","P935_COMPANY","P935_LOCATION","P935_P'
||'ANEL"]},{"name":"SUPPLIERLEDGER","dom":"ds360NavSUPPLIERLEDGER","page":"11","clear":"11","items":"P11_PARTY,P11_FROMDATE,P11_TODATE,P11_LOCATION","fields":["P935_SUPPLIER","P935_FROMDATE","P935_TODATE","P935_LOCATION"]}],items="#P935_FROMDATE,#'
||'P935_TODATE,#P935_COMPANY,#P935_LOCATION,#P935_PANEL,#P935_SUPPLIER";window.addEventListener(''click'',function(e){var node=e.target.closest(''button,a.t-Button'');if(!node)return;var match=buttons.find(function(b){return b.dom===node.id;});if(!match)ret'
||'urn;e.preventDefault();e.stopImmediatePropagation();if(node.disabled)return;node.disabled=true;apex.server.process(''DS360_NAVIGATION'',{x01:match.name,pageItems:items},{dataType:''json'',success:function(result){if(result&&result.url)apex.navigation.red'
||'irect(result.url);},error:function(){apex.message.alert(''The related page could not be opened. Please try again.'');},complete:function(){node.disabled=false;}});},true);}());',
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
unistr('SUPPLIER 360 \2014 data contract.'),
'',
'SUBJECT. One supplier, held in P935_SUPPLIER (a PartyCode). The period, company,',
unistr('location and panel arrive alongside from whichever page drilled here \2014 the'),
'supplier table or bill register on 668, or the vendor scorecard on 683. The',
'supplier selector stays switchable so an analyst can move supplier-to-supplier',
'without returning to the hub.',
'',
unistr('VALUE GRAIN. SUM(PurchaseBillDetail.Amount) \2014 the bill LINE. The Billed card here'),
'must equal this supplier''s row on the 668 supplier table for the same period and',
'scope; if it does not, one of the two is wrong.',
'',
unistr('PAID IS THE "VIA ADVICE" BASIS ON THIS PAGE \2014 READ THIS BEFORE QUOTING IT.'),
'Cards 5 and 6 read PBPass.PaidAmount, which is only written when settlement runs',
'through Payment Advice. Pages 668 and 683 read the LEDGER instead',
'(SUM(-VoucherDetail.Amount) on PAYMENT vouchers), which survives every settlement',
'route. At single-supplier grain the split between the two routes is a property of',
'that one supplier''s settlement habit, so this figure can differ materially from',
'the same supplier''s contribution to the group card on 668.',
'',
'The blueprint records this as technical debt TD-1 and prescribes porting the',
'ledger CTEs down to this page. That could NOT be done here: resolving a payment',
'voucher to a specific supplier needs VoucherDetail.AccountCode, which is not',
'corroborated anywhere in this application. Rather than guess the join, the page',
'keeps the advice basis and LABELS it on every card and column that carries it.',
'Use the Supplier Ledger button to see the settled position from the ledger side.',
'',
'PANEL SECURITY. Scalar-subquery form on every region, as on 668 and 683.',
'',
'READ-ONLY. Every region is a SELECT.'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21528548991436197)
,p_plug_name=>'Purchase Bills'
,p_static_id=>'bills'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>55
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Lines As (',
'  Select h.TNo, h.PurchaseBillDate, h.PartyBillNo, h.PartyBillDate,',
'         h.LocationCode, h.Panel,',
'         Sum(d.Amount) LineVal,',
'         Count(*) Lines,',
'         Count(Distinct d.ItemCode) Items',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PartyCode = :P935_SUPPLIER',
'     And h.PurchaseBillDate',
'         Between to_date(:P935_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P935_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P935_PANEL Is Null Or h.Panel = :P935_PANEL)',
'     And (:P935_COMPANY  Is Null Or h.CompanyCode  = :P935_COMPANY)',
'     And (:P935_LOCATION Is Null Or h.LocationCode = :P935_LOCATION)',
'   Group By h.TNo, h.PurchaseBillDate, h.PartyBillNo, h.PartyBillDate,',
'            h.LocationCode, h.Panel)',
'Select',
'  l.TNo As BILL_TNO,',
'  l.PartyBillNo As SUPPLIER_BILL_NO,',
'  l.PartyBillDate As SUPPLIER_BILL_DATE,',
'  l.PurchaseBillDate As BOOKED_ON,',
'  GetLocationName(l.LocationCode) As LOCATION,',
'  l.Lines As LINES,',
'  l.Items As ITEMS,',
'  l.LineVal As LINE_VALUE,',
'  p.PBPassNo As PASS_NO,',
'  p.PBPassDate As PASS_DATE,',
'  p.PBPassAmount As PASSED,',
'  p.PaidAmount As PAID_VIA_ADVICE,',
'  Case When p.PurchaseBillTNo Is Not Null',
'       Then nvl(p.PBPassAmount,0) - nvl(p.PaidAmount,0) End As UNSETTLED,',
'  -- The middle branch is "No advice settlement", NOT "Unpaid": PaidAmount',
'  -- covers only one settlement route, so calling it unpaid would assert',
'  -- more than the column can support.',
'  Case When p.PurchaseBillTNo Is Null                    Then ''Not passed''',
'       When nvl(p.PaidAmount,0) = 0                      Then ''No advice settlement''',
'       When nvl(p.PaidAmount,0) >= nvl(p.PBPassAmount,0) Then ''Settled''',
'       Else ''Part settled'' End As POSITION,',
'  l.Panel As PANEL',
'From Lines l',
'Left Join PCC_PBPass p On p.PurchaseBillTNo = l.TNo',
'Order By l.PurchaseBillDate Desc, l.PartyBillNo'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P935_COMPANY,P935_FROMDATE,P935_LOCATION,P935_PANEL,P935_SUPPLIER,P935_TODATE'
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
 p_id=>wwv_flow_imp.id(21528613581436197)
,p_no_data_found_message=>'This supplier raised no bills in the selected period and scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21528613581436197
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21528796704436197)
,p_db_column_name=>'BILL_TNO'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'Bill Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key to Purchase Bill 360. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529094588436197)
,p_db_column_name=>'BOOKED_ON'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Booked On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('PurchaseBillDate \2014 the date the period filter works on.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529364555436197)
,p_db_column_name=>'ITEMS'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Items'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Distinct items on the bill.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529289964436197)
,p_db_column_name=>'LINES'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Lines'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Bill line count at the value grain.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529401503436197)
,p_db_column_name=>'LINE_VALUE'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Line Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('SUM(PurchaseBillDetail.Amount) \2014 taxable, excludes footer tax. Summing this column reproduces the Billed KPI exactly. This is the reconciliation anchor for the page.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529169472436197)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Location that booked the bill.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529860981436197)
,p_db_column_name=>'PAID_VIA_ADVICE'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Paid (via advice)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('PBPass.PaidAmount. The heading states the basis because this column is only written for the Payment Advice route \2014 a blank does not prove the bill is unpaid.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21530150829436197)
,p_db_column_name=>'PANEL'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Internal Scope'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Data partition the bill belongs to. Enforced in SQL on every region.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529791008436197)
,p_db_column_name=>'PASSED'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Passed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('PBPass.PBPassAmount. One pass per bill \2014 the join cannot multiply the grain.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529650010436197)
,p_db_column_name=>'PASS_DATE'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Pass Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Date the bill was approved for payment.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529569352436197)
,p_db_column_name=>'PASS_NO'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Pass No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Bill pass document number. Blank where the bill has not been passed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21530096837436197)
,p_db_column_name=>'POSITION'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Derived settlement position. "No advice settlement" is used instead of "Unpaid" because the underlying column covers only one settlement route.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21528959753436197)
,p_db_column_name=>'SUPPLIER_BILL_DATE'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Supplier Bill Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Date on the supplier''s own invoice, which may differ from the booking date.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21528827758436197)
,p_db_column_name=>'SUPPLIER_BILL_NO'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Supplier Bill No'
,p_column_link=>'f?p=&APP_ID.:937:&APP_SESSION.::NO:937:P937_TNO:#BILL_TNO#'
,p_column_linktext=>'#SUPPLIER_BILL_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('The SUPPLIER''s own bill number (PartyBillNo), never the internal TNo. Drills to Purchase Bill 360 (page 680) \2014 previously the register (73), which page 680 now supersedes for a single document.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21529971510436197)
,p_db_column_name=>'UNSETTLED'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Unsettled (advice basis)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Passed less paid, on the advice basis only. Null on an unpassed bill rather than showing the full value as outstanding.'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(22305928467788508)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'BILL_TNO:SUPPLIER_BILL_NO:SUPPLIER_BILL_DATE:BOOKED_ON:LOCATION:LINES:ITEMS:LINE_VALUE:PASS_NO:PASS_DATE:PASSED:PAID_VIA_ADVICE:UNSETTLED:POSITION'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(21525111997436167)
,p_name=>'Supplier 360'
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
'  || ''<div class="ds-purchase-head-eyebrow">Supplier 360</div>''',
'  || ''<h1 class="ds-purchase-head-title">''',
'     || apex_escape.html(nvl(GetPartyName(:P935_SUPPLIER),',
'                             ''No supplier selected''))',
'     || ''</h1>''',
'  || ''<p class="ds-purchase-head-sub">Everything this application records ''',
'  || ''about one supplier for the chosen period &mdash; what was ordered, ''',
'  || ''received, billed, passed and settled.</p>''',
'  || ''<div class="ds-purchase-head-context">''',
'  || ''<span class="ds-purchase-head-chip">Period <b>''',
'     || apex_escape.html(:P935_FROMDATE) || '' &rarr; ''',
'     || apex_escape.html(:P935_TODATE) || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Company <b>''',
'     || apex_escape.html(nvl(GetCompanyName(:P935_COMPANY),''All companies''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Location <b>''',
'     || apex_escape.html(nvl(GetLocationName(:P935_LOCATION),''All locations''))',
'     || ''</b></span>''',
'  -- Last bill from THIS supplier, read through the authorised data scope. Says',
'  -- "never" rather than showing an empty chip.',
'  || ''<span class="ds-purchase-head-chip ds-purchase-head-chip--live">Last bill <b>''',
'     || apex_escape.html(nvl(to_char(',
'          (Select Max(h.PurchaseBillDate) From PCC_PurchaseBill h',
'            Where h.PartyCode = :P935_SUPPLIER',
'              And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                   Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))),',
'          ''DD-Mon-RRRR''),''never''))',
'     || ''</b></span>''',
'  || ''</div></div>'' As HEAD',
'From dual) union all select ''<div class="ds360-placeholder"><h2>Supplier 360</h2><p>Select a record below and click Apply to view its master details, totals and line registers.</p></div>'' HEAD,1 ds360_priority from dual where :P935_SUPPLIER is null) '
||'order by ds360_priority fetch first 1 rows only'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P935_COMPANY,P935_FROMDATE,P935_LOCATION,P935_PANEL,P935_SUPPLIER,P935_TODATE'
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
 p_id=>wwv_flow_imp.id(21525231675436167)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Whole header as one HTML string. The last-bill chip reads through the panel predicate so it cannot disclose an out-of-panel row.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21525386893436167)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p669Filters'
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
 p_id=>wwv_flow_imp.id(21526847085436196)
,p_name=>'What We Buy From Them'
,p_static_id=>'item-mix'
,p_template=>4072358936313175081
,p_display_sequence=>32
,p_region_css_classes=>'ds-dash-panel hspl-register-empty-disabled'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ds_chart_ordered As (',
'  Select * From (',
'    Select nvl(i.ItemName, d.ItemCode) ITEM,',
'           Round(Sum(d.Amount) / 100000, 2) VALUE_LAC',
'      From PCC_PurchaseBill h',
'      Join PurchaseBillDetail d On d.TNo = h.TNo',
'      Left Join Item i On i.ItemCode = d.ItemCode',
'     Where h.PartyCode = :P935_SUPPLIER',
'       And h.PurchaseBillDate',
'           Between to_date(:P935_FROMDATE,''DD-MM-RRRR'')',
'               And to_date(:P935_TODATE,''DD-MM-RRRR'')',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'            Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P935_PANEL Is Null Or h.Panel = :P935_PANEL)',
'       And (:P935_COMPANY  Is Null Or h.CompanyCode  = :P935_COMPANY)',
'       And (:P935_LOCATION Is Null Or h.LocationCode = :P935_LOCATION)',
'     Group By nvl(i.ItemName, d.ItemCode)',
'     Order By Sum(d.Amount) Desc)',
'   Where rownum <= 8',
'),',
'ds_chart_q As (',
'  Select ordered_q.*, rownum ds_ord',
'    From ds_chart_ordered ordered_q',
')',
'Select',
'  ''<div class="ds-fast-chart" data-chart-type="donut" aria-label="What We Buy From Them"><script type="application/json" class="ds-fast-chart-data">'' ||',
'  replace(',
'    json_object(',
'      ''unit'' value ''Rs Lac'',',
'      ''series'' value json_array(''Billed (Rs Lac)'' returning clob) format json,',
'      ''rows'' value json_arrayagg(',
'        json_object(''l'' value to_char(q.ITEM),',
'                    ''values'' value json_array(q.VALUE_LAC returning clob) format json,',
'                    ''u'' value null',
'                    returning clob)',
'        order by q.ds_ord returning clob) format json',
'      returning clob),',
'    ''<'', ''\\u003c''',
'  ) || ''</script></div>'' As CHART_ROW',
'From ds_chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P935_COMPANY,P935_FROMDATE,P935_LOCATION,P935_PANEL,P935_SUPPLIER,P935_TODATE'
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
 p_id=>wwv_flow_imp.id(21527079301436196)
,p_query_column_id=>1
,p_column_alias=>'CHART_ROW'
,p_column_display_sequence=>10
,p_column_heading=>' '
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(21525547958436167)
,p_name=>'Supplier KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols hspl-register-empty-disabled ds360-kpi'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P935_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P935_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'Ord As (',
'  Select Sum(od.Amount) Ordered, Count(Distinct o.TNo) Orders',
'    From PCC_PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'   Cross Join Win w',
'   Where o.PartyCode = :P935_SUPPLIER',
'     And o.PurchaseOrderDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P935_PANEL Is Null Or o.Panel = :P935_PANEL)',
'     And (:P935_COMPANY  Is Null Or o.CompanyCode  = :P935_COMPANY)',
'     And (:P935_LOCATION Is Null Or o.LocationCode = :P935_LOCATION)),',
'Rec As (',
'  Select Count(Distinct g.TNo) Grns',
'    From PCC_Grn g Cross Join Win w',
'   Where g.PartyCode = :P935_SUPPLIER',
'     And g.GrnDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P935_PANEL Is Null Or g.Panel = :P935_PANEL)',
'     And (:P935_COMPANY  Is Null Or g.CompanyCode  = :P935_COMPANY)',
'     And (:P935_LOCATION Is Null Or g.LocationCode = :P935_LOCATION)),',
'Bil As (',
'  Select Sum(d.Amount) Billed,',
'         Count(Distinct h.TNo) Bills,',
'         Count(Distinct d.ItemCode) Items',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Cross Join Win w',
'   Where h.PartyCode = :P935_SUPPLIER',
'     And h.PurchaseBillDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P935_PANEL Is Null Or h.Panel = :P935_PANEL)',
'     And (:P935_COMPANY  Is Null Or h.CompanyCode  = :P935_COMPANY)',
'     And (:P935_LOCATION Is Null Or h.LocationCode = :P935_LOCATION)),',
'Pss As (',
'  Select Sum(p.PBPassAmount) Passed,',
'         Sum(p.PaidAmount) PaidAdv,',
'         Count(*) Passes',
'    From PCC_PBPass p',
'    Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Cross Join Win w',
'   Where h.PartyCode = :P935_SUPPLIER',
'     And h.PurchaseBillDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P935_PANEL Is Null Or h.Panel = :P935_PANEL)',
'     And (:P935_COMPANY  Is Null Or h.CompanyCode  = :P935_COMPANY)',
'     And (:P935_LOCATION Is Null Or h.LocationCode = :P935_LOCATION)),',
'NoPass As (',
'  Select Count(Distinct h.TNo) Cnt, Sum(d.Amount) Val',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Cross Join Win w',
'   Where h.PartyCode = :P935_SUPPLIER',
'     And h.PurchaseBillDate Between w.F And w.T',
'     And Not Exists (Select 1 From PCC_PBPass p Where p.PurchaseBillTNo = h.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P935_PANEL Is Null Or h.Panel = :P935_PANEL)',
'     And (:P935_COMPANY  Is Null Or h.CompanyCode  = :P935_COMPANY)',
'     And (:P935_LOCATION Is Null Or h.LocationCode = :P935_LOCATION))',
'Select',
'  ''<div class="ds-kpi ds-kpi--struct" title="SUM(PurchaseOrderDetail.Amount) ''',
'  || ''on orders raised on this supplier in the period.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-shopping-cart"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Ordered</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(o.Ordered,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(o.Ordered/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(o.Ordered,0) >= 100000',
'             Then ''Rs '' || to_char(Round(o.Ordered/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(o.Ordered,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(o.Orders,0),''FM999G999'')',
'     || '' purchase orders</span>''',
'  || ''</span></div>'' As KPI1,',
'  ''<div class="ds-kpi ds-kpi--input" title="COUNT(DISTINCT Grn.TNo) for this ''',
unistr('  || ''supplier. Receipts carry QUANTITY ONLY in this ERP \2014 GrnDetail holds no '''),
unistr('  || ''usable rate or amount \2014 so no value is shown here.">'''),
'  || ''<span class="ds-kpi-ic"><span class="fa fa-truck"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Receipts</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(r.Grns,0),''FM999G999'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">GRNs booked &middot; ''',
'  || ''<span class="ds-muted">receipts carry no value here</span></span>''',
'  || ''</span></div>'' As KPI2,',
unistr('  ''<div class="ds-kpi ds-kpi--value" title="SUM(PurchaseBillDetail.Amount) \2014 '''),
'  || ''the value grain. This must equal this supplier''''s row on the Command ''',
'  || ''Centre supplier table for the same period and scope.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-inr"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Billed</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(b.Billed,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(b.Billed/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(b.Billed,0) >= 100000',
'             Then ''Rs '' || to_char(Round(b.Billed/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(b.Billed,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(b.Bills,0),''FM999G999'')',
'     || '' bills &middot; '' || to_char(nvl(b.Items,0),''FM999G999'')',
'     || '' distinct items</span>''',
'  || ''</span></div>'' As KPI3,',
'  ''<div class="ds-kpi ds-kpi--ok" title="SUM(PBPass.PBPassAmount). PBPass is ''',
'  || ''one-to-one with the bill, so the join cannot multiply the grain.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-check-square-o"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Passed</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(p.Passed,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(p.Passed/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(p.Passed,0) >= 100000',
'             Then ''Rs '' || to_char(Round(p.Passed/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(p.Passed,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(p.Passes,0),''FM999G999'')',
'     || '' bills approved for payment</span>''',
'  || ''</span></div>'' As KPI4,',
'  -- BASIS DISCLOSED ON THE CARD. This is PBPass.PaidAmount, not the ledger.',
unistr('  ''<div class="ds-kpi ds-kpi--suppl" title="SUM(PBPass.PaidAmount) \2014 the '''),
'  || ''Payment Advice basis. This column is only written when settlement runs ''',
'  || ''through Payment Advice, so it can understate badly for a supplier that ''',
'  || ''settles by direct voucher. Pages 668 and 683 read the ledger instead. ''',
'  || ''Use the Supplier Ledger button for the ledger-side position.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-credit-card"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Paid (via advice)</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(p.PaidAdv,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(p.PaidAdv/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(p.PaidAdv,0) >= 100000',
'             Then ''Rs '' || to_char(Round(p.PaidAdv/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(p.PaidAdv,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(p.Passed,0) > 0',
'             Then to_char(Round(100 * nvl(p.PaidAdv,0) / p.Passed,1),''FM99999990D0'')',
'                  || ''% of passed''',
'             Else ''nothing passed in period'' End',
'     || '' &middot; <span class="ds-muted">advice route only</span></span>''',
'  || ''</span></div>'' As KPI5,',
'  ''<div class="ds-kpi ds-kpi--risk" title="Bills from this supplier in the ''',
unistr('  || ''period with no PBPass row \2014 booked as a liability but not yet approved, '''),
'  || ''and therefore not yet in the ledger.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-hourglass-half"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Awaiting Pass</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(np.Val,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(np.Val/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(np.Val,0) >= 100000',
'             Then ''Rs '' || to_char(Round(np.Val/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(np.Val,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(np.Cnt,0),''FM999G999'')',
'     || '' bills booked, not yet passed</span>''',
'  || ''</span></div>'' As KPI6',
'From Ord o',
'Cross Join Rec r',
'Cross Join Bil b',
'Cross Join Pss p',
'Cross Join NoPass np'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P935_COMPANY,P935_FROMDATE,P935_LOCATION,P935_PANEL,P935_SUPPLIER,P935_TODATE'
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
 p_id=>wwv_flow_imp.id(21525698959436168)
,p_query_column_id=>1
,p_column_alias=>'KPI1'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Ordered. SUM(PurchaseOrderDetail.Amount) \2014 committed value, distinct from what was subsequently billed.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21525798415436196)
,p_query_column_id=>2
,p_column_alias=>'KPI2'
,p_column_display_sequence=>20
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Receipts. Count only \2014 GrnDetail carries no usable value in this ERP, and the card says so rather than showing a zero.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21525855670436196)
,p_query_column_id=>3
,p_column_alias=>'KPI3'
,p_column_display_sequence=>30
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Billed. The value grain, and the reconciliation anchor against the 668 supplier table.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21525924765436196)
,p_query_column_id=>4
,p_column_alias=>'KPI4'
,p_column_display_sequence=>40
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Passed. SUM(PBPass.PBPassAmount), one pass per bill.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21526004072436196)
,p_query_column_id=>5
,p_column_alias=>'KPI5'
,p_column_display_sequence=>50
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Paid on the Payment Advice basis, NOT the ledger. The basis is stated on the card, in its tooltip and in the page help \2014 see TD-1 in the blueprint.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(21526115652436196)
,p_query_column_id=>6
,p_column_alias=>'KPI6'
,p_column_display_sequence=>60
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Awaiting Pass. Bills with no PBPass row \2014 liability booked but not yet approved.')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21527211956436196)
,p_plug_name=>'Purchase Orders'
,p_static_id=>'orders'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>45
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  o.PurchaseOrderNo As PO_NO,',
'  o.PurchaseOrderDate As PO_DATE,',
'  GetLocationName(o.LocationCode) As LOCATION,',
'  o.DeliveryDate As DELIVERY_DUE,',
'  Count(*) As LINES,',
'  Sum(od.Amount) As ORDER_VALUE,',
'  -- Received % is shown ONLY where every line shares one unit. Summing',
'  -- quantities across incompatible units to make a ratio is meaningless.',
'  Case When Count(Distinct od.RateMeasuringUnitCode) <= 1',
'            And Sum(od.Quantity1) > 0',
'       Then Round(100 * Sum(Least(nvl(od.ReceivedQuantity1,0), od.Quantity1))',
'                      / Sum(od.Quantity1), 1)',
'  End As RECEIVED_PCT,',
'  Case',
'    When Sum(Least(nvl(od.ReceivedQuantity1,0), od.Quantity1))',
'         >= Sum(od.Quantity1) And Sum(od.Quantity1) > 0 Then ''Fully received''',
'    When Sum(nvl(od.ReceivedQuantity1,0)) > 0 Then ''Part received''',
'    Else ''Awaiting material''',
'  End As STATUS,',
'  o.PartyCode As PARTYCODE,',
'  -- Drill key to Purchase Order 360. The link travels on TNo rather than the',
'  -- order number, so it works whatever the numbering scheme looks like.',
'  o.TNo As PO_TNO',
'From PCC_PurchaseOrder o',
'Join PurchaseOrderDetail od On od.TNo = o.TNo',
'Where o.PartyCode = :P935_SUPPLIER',
'  And o.PurchaseOrderDate',
'      Between to_date(:P935_FROMDATE,''DD-MM-RRRR'')',
'          And to_date(:P935_TODATE,''DD-MM-RRRR'')',
'  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'       Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'  And (:P935_PANEL Is Null Or o.Panel = :P935_PANEL)',
'  And (:P935_COMPANY  Is Null Or o.CompanyCode  = :P935_COMPANY)',
'  And (:P935_LOCATION Is Null Or o.LocationCode = :P935_LOCATION)',
'Group By o.PurchaseOrderNo, o.PurchaseOrderDate, o.LocationCode,',
'         o.DeliveryDate, o.PartyCode, o.TNo',
'Order By o.PurchaseOrderDate Desc, o.PurchaseOrderNo'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P935_COMPANY,P935_FROMDATE,P935_LOCATION,P935_PANEL,P935_SUPPLIER,P935_TODATE'
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
 p_id=>wwv_flow_imp.id(21527384775436196)
,p_no_data_found_message=>'No purchase order was raised on this supplier in the selected period and scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21527384775436196
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21527956962436197)
,p_db_column_name=>'DELIVERY_DUE'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Delivery Due'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Promised date. Blank where none was recorded \2014 such orders are excluded from on-time measurement rather than counted as late.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21528017102436197)
,p_db_column_name=>'LINES'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Lines'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Order line count.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21527873626436197)
,p_db_column_name=>'LOCATION'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Location that raised the order.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21528180404436197)
,p_db_column_name=>'ORDER_VALUE'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Order Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('SUM(PurchaseOrderDetail.Amount) \2014 committed value, excludes footer tax carried on the header.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21527409600436196)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical key carried for the register drill. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21527797388436197)
,p_db_column_name=>'PO_DATE'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Order Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Date the order was raised \2014 the date the period filter works on.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21527619847436197)
,p_db_column_name=>'PO_NO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Order No'
,p_column_link=>'f?p=&APP_ID.:939:&APP_SESSION.::NO:939:P939_TNO:#PO_TNO#'
,p_column_linktext=>'#PO_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('The order''s own business number, drilling to Purchase Order 360 (682). The link travels on TNo, so it works whatever the numbering scheme looks like \2014 most doc types here use a randomised number rather than a running serial.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21527560955436197)
,p_db_column_name=>'PO_TNO'
,p_display_order=>6
,p_column_identifier=>'B'
,p_column_label=>'PO Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Technical drill key to Purchase Order 360. Never displayed \2014 the order is identified on screen by its own business number.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21528254658436197)
,p_db_column_name=>'RECEIVED_PCT'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Received %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Shown ONLY where every line of the order shares one unit of measure. Blank on a mixed-unit order, because summing across units to make a ratio is meaningless.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(21528313921436197)
,p_db_column_name=>'STATUS'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Plain-language position derived from the order line, guarded with LEAST so an over-receipt cannot read as more than fully received.'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(22305440882788507)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'PARTYCODE:PO_TNO:PO_NO:PO_DATE:LOCATION:DELIVERY_DUE:LINES:ORDER_VALUE:RECEIVED_PCT:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21528492906436197)
,p_plug_name=>'Bills'
,p_static_id=>'rule-bills'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Purchase Bills</h2>',
'  <p>Every bill from this supplier with its pass and settlement position.',
'     Summing Line Value here reproduces the Billed card at the top of the',
'     page. The supplier''s <em>own</em> bill number is shown &mdash; internal',
'     document keys are never displayed.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21526296261436196)
,p_plug_name=>'Flow Over Time'
,p_static_id=>'rule-flow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>25
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Flow and Material Mix</h2>',
'  <p>Monthly billed value from this supplier, and what is actually being',
'     bought from them. Both read the bill line, so they tie to the Billed',
'     card above.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21527199759436196)
,p_plug_name=>'Orders'
,p_static_id=>'rule-orders'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Purchase Orders</h2>',
'  <p>Every order raised on this supplier in the period, with its receipt',
'     progress. Progress is read from the order line itself',
'     (<code>ReceivedQuantity1</code> against <code>Quantity1</code>), never',
'     inferred from a join &mdash; one order can feed several receipts, and a',
'     join would double-count.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21525439663436167)
,p_plug_name=>'Supplier Position'
,p_static_id=>'rule-position'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>15
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Position With This Supplier</h2>',
'  <p>The chain from order to settlement. Billed here must equal this',
'     supplier''s row on the Command Centre supplier table for the same period',
'     and scope. Paid is the <em>Payment&nbsp;Advice</em> basis on this page',
'     &mdash; the group cards on 668 read the ledger, so the two can differ',
'     for a supplier that settles by direct voucher.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(21526380649436196)
,p_name=>'Monthly Billed Value'
,p_static_id=>'trend-chart'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel hspl-register-empty-disabled'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ds_chart_ordered As (',
'  Select to_char(Trunc(h.PurchaseBillDate,''MM''),''Mon-RR'') MONTH_LABEL,',
'         Round(Sum(d.Amount) / 100000, 2) VALUE_LAC,',
'         Trunc(h.PurchaseBillDate,''MM'') SORT_KEY',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PartyCode = :P935_SUPPLIER',
'     And h.PurchaseBillDate',
'         Between to_date(:P935_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P935_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P935_PANEL Is Null Or h.Panel = :P935_PANEL)',
'     And (:P935_COMPANY  Is Null Or h.CompanyCode  = :P935_COMPANY)',
'     And (:P935_LOCATION Is Null Or h.LocationCode = :P935_LOCATION)',
'   Group By Trunc(h.PurchaseBillDate,''MM'')',
'   Order By SORT_KEY',
'),',
'ds_chart_q As (',
'  Select ordered_q.*, rownum ds_ord',
'    From ds_chart_ordered ordered_q',
')',
'Select',
'  ''<div class="ds-fast-chart" data-chart-type="hbar" aria-label="Monthly Billed Value"><script type="application/json" class="ds-fast-chart-data">'' ||',
'  replace(',
'    json_object(',
'      ''unit'' value ''Rs Lac'',',
'      ''series'' value json_array(''Billed (Rs Lac)'' returning clob) format json,',
'      ''rows'' value json_arrayagg(',
'        json_object(''l'' value to_char(q.MONTH_LABEL),',
'                    ''values'' value json_array(q.VALUE_LAC returning clob) format json,',
'                    ''u'' value null',
'                    returning clob)',
'        order by q.ds_ord returning clob) format json',
'      returning clob),',
'    ''<'', ''\\u003c''',
'  ) || ''</script></div>'' As CHART_ROW',
'From ds_chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P935_COMPANY,P935_FROMDATE,P935_LOCATION,P935_PANEL,P935_SUPPLIER,P935_TODATE'
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
 p_id=>wwv_flow_imp.id(21526509589436196)
,p_query_column_id=>1
,p_column_alias=>'CHART_ROW'
,p_column_display_sequence=>10
,p_column_heading=>' '
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21531407163436198)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(21525386893436167)
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
 p_id=>wwv_flow_imp.id(21531615298436198)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(21525386893436167)
,p_button_name=>'BACKTOHUB'
,p_static_id=>'back-to-hub'
,p_button_static_id=>'ds360NavBACKTOHUB'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Purchase Command Centre'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
,p_grid_column=>6
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21531528182436198)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(21525386893436167)
,p_button_name=>'SUPPLIERLEDGER'
,p_static_id=>'supplier-ledger'
,p_button_static_id=>'ds360NavSUPPLIERLEDGER'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Supplier Ledger'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-book'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
,p_grid_column=>3
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21530896048436198)
,p_name=>'P935_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(21525386893436167)
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
 p_id=>wwv_flow_imp.id(21530421820436197)
,p_name=>'P935_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(21525386893436167)
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
,p_help_text=>'Start of the reporting period. Arrives from whichever page drilled here.'
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
 p_id=>wwv_flow_imp.id(21531081999436198)
,p_name=>'P935_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(21525386893436167)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From PCC_PurchaseBill fb',
'                Where fb.LocationCode = l.LocationCode',
'                  And (:P935_COMPANY Is Null',
'                       Or fb.CompanyCode = :P935_COMPANY)',
'                  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                       Or fb.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P935_COMPANY'
,p_ajax_items_to_submit=>'P935_COMPANY'
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
 p_id=>wwv_flow_imp.id(21531229559436198)
,p_name=>'P935_PANEL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(21525386893436167)
,p_prompt=>'Internal Scope'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov=>'STATIC:A;A,B;B'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'A + B'
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(21530223844436197)
,p_name=>'P935_SUPPLIER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(21525386893436167)
,p_prompt=>'Supplier'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct GetPartyName(h.PartyCode) d, h.PartyCode r',
'  From PCC_PurchaseBill h',
' Where ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P935_COMPANY Is Null Or h.CompanyCode = :P935_COMPANY)',
' Order By 1'))
,p_colspan=>3
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'The subject of this page. Left switchable so you can move supplier-to-supplier without returning to the Command Centre. Populated from bills, so every entry returns rows.'
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
 p_id=>wwv_flow_imp.id(21530681483436198)
,p_name=>'P935_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(21525386893436167)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(900360090000669)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DS360_NAVIGATION'
,p_static_id=>'ds360-navigation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'case apex_application.g_x01',
'when ''BACKTOHUB'' then',
'apex_json.open_object;apex_json.write(''url'',apex_page.get_url(p_page=>''934'',p_clear_cache=>''934'',p_items=>''P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL'',p_values=>:P935_FROMDATE||'',''||:P935_TODATE||'',''||:P935_COMPANY||'',''||:P935_LO'
||'CATION||'',''||:P935_PANEL));apex_json.close_object;',
'when ''SUPPLIERLEDGER'' then',
'apex_json.open_object;apex_json.write(''url'',apex_page.get_url(p_page=>''11'',p_clear_cache=>''11'',p_items=>''P11_PARTY,P11_FROMDATE,P11_TODATE,P11_LOCATION'',p_values=>:P935_SUPPLIER||'',''||:P935_FROMDATE||'',''||:P935_TODATE||'',''||:P935_LOCATION));ape'
||'x_json.close_object;',
'else raise_application_error(-20001,''Unknown navigation action'');end case;end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>900360090000669
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
