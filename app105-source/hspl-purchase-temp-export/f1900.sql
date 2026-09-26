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
,p_default_application_id=>1900
,p_default_id_offset=>0
,p_default_owner=>'IMART'
);
end;
/
 
prompt APPLICATION 1900 - HSPL Purchase Source Temporary
--
-- Application Export:
--   Application:     1900
--   Name:            HSPL Purchase Source Temporary
--   Exported By:     IMART
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PAGE: 682
--     PAGE: 683
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/pages/delete_00682
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>682);
end;
/
prompt --application/pages/page_00682
begin
wwv_flow_imp_page.create_page(
 p_id=>682
,p_name=>'Purchase Order 360'
,p_alias=>'PURCHASE-ORDER-360'
,p_step_title=>'Purchase Order 360'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('PURCHASE ORDER 360 \2014 data contract.'),
'',
'A TERMINAL LEAF, DELIBERATELY. Sole key P682_TNO. There is no filter bar, no',
'button and no outbound drill: this is the end of the chain, reached from the',
'Orders report on Supplier 360. Everything on the page describes ONE order, so',
'there is nothing to filter and nowhere further to go. Use the browser''s back',
'control to return.',
'',
'PROGRESS IS READ FROM THE ORDER LINE, NEVER INFERRED FROM A JOIN.',
'Received quantity comes from PurchaseOrderDetail.ReceivedQuantity1, which this',
'ERP maintains per line. One order can feed several receipts, so counting through',
'a join to GRN would double-count the same quantity. The linked-receipts region',
'below lists the GRNs for context, but it is NOT what drives the progress figures.',
'',
'RECEIPT COMPLETION IS UNIT-FREE. It is reported as the proportion of order LINES',
'fully received, not as a quantity ratio. A quantity ratio would add incompatible',
'units across the lines of a mixed-unit order and produce a meaningless number.',
'',
'LEAST() GUARDS OVER-RECEIPT. Where more was received than ordered,',
'LEAST(ReceivedQuantity1, Quantity1) caps the line so completion cannot exceed',
'100% and pending value cannot go negative.',
'',
'PENDING VALUE IS PRO-RATED ARITHMETIC. This ERP stores no pending-value column,',
'so it is computed within each line as',
'    Amount * (Quantity1 - LEAST(ReceivedQuantity1, Quantity1)) / Quantity1',
'That is an estimate derived from the line, not a figure the ERP holds. The card',
'tooltip says so.',
'',
'HSPL DIVERGENCES FROM THE BLUEPRINT (docs/Purchase-Dashboard-FRD.md).',
'',
'1. NO BILLED % CARD. The blueprint reads PurchaseOrderDetail.PurchaseBillQuantity1.',
'   That column is not corroborated anywhere in this application, so billing is',
'   reported as a COUNT of bills and their value instead of a percentage of',
'   ordered quantity.',
'',
'2. HEADER CARRIES ~13 FACTS, NOT ~16. Department, buyer and credit days are',
'   omitted: DepartmentCode, EmployeeCode and CreditDays are not corroborated on',
'   PurchaseOrder in this application. GSTIN and PAN are included because',
'   GetPartyAttributeValue is confirmed in 11 pages.',
'',
'3. INDENT AND QUOTATION ARE SHOWN AS LINKED / NOT LINKED rather than by document',
'   number: PurchaseOrder.IndentTno and .QuotationTno are confirmed, but the',
'   corresponding IndentNo and QuotationNo columns were not verified.',
'',
'PANEL SECURITY. The panel predicate sits on the HEADER query itself, so an',
'out-of-panel order renders "Order not found" rather than leaking its existence.',
'',
'READ-ONLY. Every region is a SELECT.'))
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15482886101552971)
,p_name=>'Purchase Order 360'
,p_static_id=>'command-header'
,p_template=>4501440665235496320
,p_display_sequence=>5
,p_region_css_classes=>'ds-purchase-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  ''<div class="ds-purchase-head">''',
'  || ''<div class="ds-purchase-head-eyebrow">Purchase Order 360</div>''',
'  || ''<h1 class="ds-purchase-head-title">Order ''',
'     || apex_escape.html(o.PurchaseOrderNo) || ''</h1>''',
'  || ''<p class="ds-purchase-head-sub">The complete record of one order &mdash; ''',
'  || ''what was ordered, how much has arrived, and what has been billed ''',
'  || ''against it.</p>''',
'  || ''<div class="ds-purchase-head-context">''',
'  || ''<span class="ds-purchase-head-chip">Order date <b>''',
'     || apex_escape.html(to_char(o.PurchaseOrderDate,''DD-Mon-RRRR''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Supplier <b>''',
'     || apex_escape.html(nvl(GetPartyName(o.PartyCode),''not recorded''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">GSTIN <b>''',
'     || apex_escape.html(nvl(GetPartyAttributeValue(o.PartyCode,''GSTINNO''),',
'                             ''Not on file''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">PAN <b>''',
'     || apex_escape.html(nvl(GetPartyAttributeValue(o.PartyCode,''PANNO''),',
'                             ''Not on file''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Company <b>''',
'     || apex_escape.html(nvl(GetCompanyName(o.CompanyCode),''not recorded''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Location <b>''',
'     || apex_escape.html(nvl(GetLocationName(o.LocationCode),''not recorded''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Doc type <b>''',
'     || apex_escape.html(',
'          nvl((Select dt.DocTypeName From DocType dt',
'                Where dt.DocTypeCode = o.DocTypeCode), o.DocTypeCode))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Delivery due <b>''',
'     || apex_escape.html(nvl(to_char(o.DeliveryDate,''DD-Mon-RRRR''),',
'                             ''none recorded''))',
'     || ''</b></span>''',
'  -- Shown as linked / not linked: the Tno columns are confirmed, the',
'  -- corresponding document-number columns are not.',
'  || ''<span class="ds-purchase-head-chip">Indent <b>''',
'     || Case When o.IndentTno Is Not Null Then ''Linked''',
'             Else ''Not linked'' End || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Quotation <b>''',
'     || Case When o.QuotationTno Is Not Null Then ''Linked''',
'             Else ''Not linked'' End || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Sourcing route <b>''',
'     || Case When o.QuotationTno Is Not Null Then ''Tender''',
'             When o.IndentTno    Is Not Null Then ''Direct indent''',
'             Else ''Ad hoc'' End || ''</b></span>''',
'  -- Existence of a PurchaseOrderClose row means the order was short-closed.',
'  || ''<span class="ds-purchase-head-chip">Status <b>''',
'     || Case When Exists (Select 1 From PurchaseOrderClose poc',
'                           Where poc.PurchaseOrderTNo = o.TNo)',
'             Then ''Short-closed'' Else ''Open'' End || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Panel <b>''',
'     || apex_escape.html(nvl(o.Panel,''not set'')) || ''</b></span>''',
'  || ''</div></div>'' As HEAD',
'From PurchaseOrder o',
'Where o.TNo = :P682_TNO',
'  -- Enforcement lives HERE. An out-of-panel order returns no row and the',
'  -- region renders its "not found" message.',
'  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'       Or o.Panel = (Select GetUserPanelAB_apex() From dual))'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P682_TNO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Order not found, or it lies outside the data panel your login may see.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15482996945552972)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Whole identity header as one HTML string. The panel predicate sits on this query so an out-of-panel order cannot be disclosed even as a title.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15483097164552972)
,p_name=>'Order Position'
,p_static_id=>'kpi-strip'
,p_template=>4501440665235496320
,p_display_sequence=>10
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Lines As (',
'  Select od.Quantity1 Qty,',
'         nvl(od.ReceivedQuantity1,0) Recd,',
'         od.Amount Amt',
'    From PurchaseOrderDetail od',
'    Join PurchaseOrder o On o.TNo = od.TNo',
'   Where o.TNo = :P682_TNO',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select GetUserPanelAB_apex() From dual))),',
'Agg As (',
'  Select Count(*) Lines,',
'         Sum(Amt) OrderValue,',
'         -- Unit-free: proportion of LINES fully received. A quantity ratio',
'         -- would add incompatible units across a mixed-unit order.',
'         Sum(Case When Qty > 0 And Recd >= Qty Then 1 Else 0 End) LinesFull,',
'         -- LEAST guards over-receipt so pending cannot go negative.',
'         Sum(Case When nvl(Qty,0) > 0',
'                  Then Amt * (Qty - Least(Recd, Qty)) / Qty',
'                  Else 0 End) PendingValue',
'    From Lines),',
'Rec As (',
'  -- Context only. This does NOT drive the progress figures above.',
'  Select Count(Distinct g.TNo) Grns, Max(g.GrnDate) LastGrn',
'    From Grn g',
'   Where g.PurchaseOrderTNo = :P682_TNO',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or g.Panel = (Select GetUserPanelAB_apex() From dual))),',
'Bil As (',
'  Select Count(Distinct h.TNo) Bills, Sum(d.Amount) Billed',
'    From PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PurchaseOrderTNo = :P682_TNO',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual))),',
'Pss As (',
'  Select Sum(p.PBPassAmount) Passed, Sum(p.PaidAmount) PaidAdv',
'    From PBPass p',
'    Join PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Where h.PurchaseOrderTNo = :P682_TNO',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual)))',
'Select',
'  ''<div class="ds-kpi ds-kpi--value" title="SUM(PurchaseOrderDetail.Amount). ''',
'  || ''Committed value, excluding footer tax carried on the order header.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-inr"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Order Value</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(a.OrderValue,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(a.OrderValue/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(a.OrderValue,0) >= 100000',
'             Then ''Rs '' || to_char(Round(a.OrderValue/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(a.OrderValue,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(a.Lines,0),''FM999G999'')',
'     || '' order lines</span>''',
'  || ''</span></div>'' As KPI1,',
'  ''<div class="ds-kpi ds-kpi--ok" title="Proportion of order LINES fully ''',
'  || ''received, read from PurchaseOrderDetail.ReceivedQuantity1. Deliberately ''',
unistr('  || ''unit-free \2014 a quantity ratio would add incompatible units across the '''),
'  || ''lines of a mixed-unit order.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-truck"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Lines Fully Received</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(a.Lines,0) > 0',
'             Then to_char(Round(100 * a.LinesFull / a.Lines,1),''FM99999990D0'') || ''%''',
'             Else ''n/a'' End || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(a.LinesFull,0),''FM999G999'')',
'     || '' of '' || to_char(nvl(a.Lines,0),''FM999G999'')',
'     || '' lines complete</span>''',
'  || ''</span></div>'' As KPI2,',
'  ''<div class="ds-kpi ds-kpi--risk" title="Amount * (Quantity1 - LEAST(''',
'  || ''ReceivedQuantity1, Quantity1)) / Quantity1, summed over the lines. ''',
unistr('  || ''PRO-RATED ARITHMETIC \2014 this ERP stores no pending-value column, so this '''),
'  || ''is derived from the line, not a figure the ERP holds.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-hourglass-half"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Pending Value</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(a.PendingValue,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(a.PendingValue/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(a.PendingValue,0) >= 100000',
'             Then ''Rs '' || to_char(Round(a.PendingValue/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(a.PendingValue,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">pro-rated within the line, not stored</span>''',
'  || ''</span></div>'' As KPI3,',
'  ''<div class="ds-kpi ds-kpi--input" title="COUNT(DISTINCT Grn.TNo) where ''',
unistr('  || ''Grn.PurchaseOrderTNo is this order. Context only \2014 the progress figures '''),
'  || ''come from the order line, because one order can feed several receipts ''',
'  || ''and a join would double-count.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-sign-in"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Receipts</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(r.Grns,0),''FM999G999'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || nvl(''last on '' || to_char(r.LastGrn,''DD-Mon-RRRR''),',
'            ''nothing received yet'') || ''</span>''',
'  || ''</span></div>'' As KPI4,',
'  -- The blueprint''s Billed % is absent: PurchaseBillQuantity1 is not',
'  -- corroborated in this application, so billing is reported as count and',
'  -- value rather than as a percentage of ordered quantity.',
'  ''<div class="ds-kpi ds-kpi--bill" title="Bills carrying PurchaseOrderTNo = ''',
'  || ''this order, valued at SUM(PurchaseBillDetail.Amount). Reported as count ''',
'  || ''and value rather than as a percentage of ordered quantity, because ''',
'  || ''PurchaseOrderDetail.PurchaseBillQuantity1 is not present in this ''',
'  || ''application.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-file-text-o"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Billed Against Order</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(b.Billed,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(b.Billed/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(b.Billed,0) >= 100000',
'             Then ''Rs '' || to_char(Round(b.Billed/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(b.Billed,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(b.Bills,0),''FM999G999'')',
'     || '' bills booked against this order</span>''',
'  || ''</span></div>'' As KPI5,',
'  ''<div class="ds-kpi ds-kpi--suppl" title="SUM(PBPass.PBPassAmount) on the ''',
'  || ''bills against this order. Paid is the Payment Advice basis only, as ''',
'  || ''everywhere this column is used.">''',
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
'  || ''<span class="ds-kpi-sub">Rs ''',
'     || to_char(nvl(p.PaidAdv,0),''FM99G99G99G990D00'')',
'     || '' settled <span class="ds-muted">(advice basis)</span></span>''',
'  || ''</span></div>'' As KPI6',
'From Agg a Cross Join Rec r Cross Join Bil b Cross Join Pss p'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P682_TNO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No position available for this order.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15483132985552972)
,p_query_column_id=>1
,p_column_alias=>'KPI1'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Order value from the order lines. Excludes footer tax carried on the header.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15483234700553006)
,p_query_column_id=>2
,p_column_alias=>'KPI2'
,p_column_display_sequence=>20
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Receipt completion as a proportion of LINES \2014 unit-free by construction, so it stays valid on a mixed-unit order.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15483333791553006)
,p_query_column_id=>3
,p_column_alias=>'KPI3'
,p_column_display_sequence=>30
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Pending value, pro-rated within the line and guarded by LEAST so over-receipt cannot make it negative. The sub-line states it is derived, not stored.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15483470261553006)
,p_query_column_id=>4
,p_column_alias=>'KPI4'
,p_column_display_sequence=>40
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Receipt count for context only. Progress deliberately does not come from this join \2014 one order can feed several receipts.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15483525457553007)
,p_query_column_id=>5
,p_column_alias=>'KPI5'
,p_column_display_sequence=>50
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Billing as count and value. The blueprint''s Billed % is absent because PurchaseBillQuantity1 is not present in this application.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15483617493553007)
,p_query_column_id=>6
,p_column_alias=>'KPI6'
,p_column_display_sequence=>60
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Passed value on the bills against this order, with settled shown on the advice basis and labelled as such.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15483755928553007)
,p_name=>'Bills Against This Order'
,p_static_id=>'linked-bills'
,p_template=>4072358936313175081
,p_display_sequence=>36
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  h.PartyBillNo As SUPPLIER_BILL_NO,',
'  h.PartyBillDate As SUPPLIER_BILL_DATE,',
'  h.PurchaseBillDate As BOOKED_ON,',
'  Count(d.SNo) As LINES,',
'  Sum(d.Amount) As LINE_VALUE,',
'  p.PBPassAmount As PASSED,',
'  p.PaidAmount As PAID_VIA_ADVICE,',
'  ''<span class="ds-pill ds-pill--''',
'  || Case',
'       When p.PurchaseBillTNo Is Null Then ''warn''',
'       When nvl(p.PaidAmount,0) = 0 Then ''info''',
'       When nvl(p.PaidAmount,0) >= nvl(p.PBPassAmount,0) Then ''good''',
'       Else ''accent''',
'     End',
'  || ''">''',
'  || Case',
'       When p.PurchaseBillTNo Is Null Then ''Not passed''',
'       When nvl(p.PaidAmount,0) = 0 Then ''No advice settlement''',
'       When nvl(p.PaidAmount,0) >= nvl(p.PBPassAmount,0) Then ''Settled''',
'       Else ''Part settled''',
'     End',
'  || ''</span>'' As POSITION',
'From PurchaseBill h',
'Join PurchaseBillDetail d On d.TNo = h.TNo',
'Left Join PBPass p On p.PurchaseBillTNo = h.TNo',
'Where h.PurchaseOrderTNo = :P682_TNO',
'  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'       Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'Group By h.PartyBillNo, h.PartyBillDate, h.PurchaseBillDate,',
'         p.PurchaseBillTNo, p.PBPassAmount, p.PaidAmount',
'Order By h.PurchaseBillDate, h.PartyBillNo'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P682_TNO'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No bill has been booked against this order yet.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15483863909553007)
,p_query_column_id=>3
,p_column_alias=>'BOOKED_ON'
,p_column_display_sequence=>30
,p_column_heading=>'Booked On'
,p_column_format=>'DD-MON-YYYY'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('PurchaseBillDate \2014 the date the period filters elsewhere in the suite work on.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15483940578553007)
,p_query_column_id=>4
,p_column_alias=>'LINES'
,p_column_display_sequence=>40
,p_column_heading=>'Lines'
,p_column_format=>'FM999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Bill line count at the value grain.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484007813553007)
,p_query_column_id=>5
,p_column_alias=>'LINE_VALUE'
,p_column_display_sequence=>50
,p_column_heading=>'Line Value'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('SUM(PurchaseBillDetail.Amount) \2014 the value grain. Summing this column reproduces the Billed Against Order card.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484176573553007)
,p_query_column_id=>7
,p_column_alias=>'PAID_VIA_ADVICE'
,p_column_display_sequence=>70
,p_column_heading=>'Paid (via advice)'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('PBPass.PaidAmount. The heading names the basis because this column is only written for the Payment Advice route \2014 a blank does not prove the bill is unpaid.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484243717553007)
,p_query_column_id=>6
,p_column_alias=>'PASSED'
,p_column_display_sequence=>60
,p_column_heading=>'Passed'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'PBPass.PBPassAmount. Blank where the bill has not been passed.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484364282553007)
,p_query_column_id=>8
,p_column_alias=>'POSITION'
,p_column_display_sequence=>80
,p_column_heading=>'Position'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Settlement pill. "No advice settlement" rather than "Unpaid", because the underlying column covers only one settlement route.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484466432553007)
,p_query_column_id=>2
,p_column_alias=>'SUPPLIER_BILL_DATE'
,p_column_display_sequence=>20
,p_column_heading=>'Bill Date'
,p_column_format=>'DD-MON-YYYY'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Date on the supplier''s invoice, which may differ from the booking date.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484509251553007)
,p_query_column_id=>1
,p_column_alias=>'SUPPLIER_BILL_NO'
,p_column_display_sequence=>10
,p_column_heading=>'Supplier Bill No'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'The supplier''s OWN bill number. Internal document keys are never displayed anywhere in this suite.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15484619180553007)
,p_name=>'Receipts Against This Order'
,p_static_id=>'linked-grn'
,p_template=>4072358936313175081
,p_display_sequence=>35
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  g.GrnNo As GRN_NO,',
'  g.GrnDate As GRN_DATE,',
'  GetLocationName(g.LocationCode) As LOCATION,',
'  Count(gd.SNo) As LINES,',
'  Sum(nvl(gd.ReceivedQuantity1,0)) As RECEIVED_QTY,',
'  Sum(nvl(gd.RejectedQuantity1,0)) As REJECTED_QTY,',
'  Case When Sum(nvl(gd.RejectedQuantity1,0)) > 0',
'       Then ''<span class="ds-pill ds-pill--bad">Rejection recorded</span>''',
'       Else ''<span class="ds-pill ds-pill--good">Accepted</span>''',
'  End As STATUS',
'From Grn g',
'Join GrnDetail gd On gd.TNo = g.TNo',
'Where g.PurchaseOrderTNo = :P682_TNO',
'  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'       Or g.Panel = (Select GetUserPanelAB_apex() From dual))',
'Group By g.GrnNo, g.GrnDate, g.LocationCode',
'Order By g.GrnDate, g.GrnNo'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P682_TNO'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Nothing has been received against this order yet.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484790514553007)
,p_query_column_id=>2
,p_column_alias=>'GRN_DATE'
,p_column_display_sequence=>20
,p_column_heading=>'Date'
,p_column_format=>'DD-MON-YYYY'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Receipt date. The earliest of these is what the on-time delivery measure on page 683 compares against the promised date.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484890857553007)
,p_query_column_id=>1
,p_column_alias=>'GRN_NO'
,p_column_display_sequence=>10
,p_column_heading=>'GRN No'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'The receipt''s own business number. These are long strings, which is why this region takes the full width.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15484951607553008)
,p_query_column_id=>4
,p_column_alias=>'LINES'
,p_column_display_sequence=>40
,p_column_heading=>'Lines'
,p_column_format=>'FM999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Receipt line count.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485017599553008)
,p_query_column_id=>3
,p_column_alias=>'LOCATION'
,p_column_display_sequence=>30
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Where the goods were received.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485117528553008)
,p_query_column_id=>5
,p_column_alias=>'RECEIVED_QTY'
,p_column_display_sequence=>50
,p_column_heading=>'Received Qty'
,p_column_format=>'FM999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('From GrnDetail.ReceivedQuantity1 \2014 GrnDetail has no plain quantity column. May cross units within one receipt, so do not read the total as a single figure.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485251172553008)
,p_query_column_id=>6
,p_column_alias=>'REJECTED_QTY'
,p_column_display_sequence=>60
,p_column_heading=>'Rejected Qty'
,p_column_format=>'FM999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Quality rejection at receipt. Any non-zero value is worth investigating regardless of size.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485368286553008)
,p_query_column_id=>7
,p_column_alias=>'STATUS'
,p_column_display_sequence=>70
,p_column_heading=>'Status'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Flags any receipt carrying a rejected quantity. GRNs carry no value in this ERP, so there is deliberately no value column here.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15485422842553008)
,p_name=>'Order Lines'
,p_static_id=>'order-lines'
,p_template=>4072358936313175081
,p_display_sequence=>25
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  od.SNo As LINE_NO,',
'  nvl((Select i.ItemName From Item i Where i.ItemCode = od.ItemCode),',
'      od.ItemCode) As ITEM,',
'  nvl((Select s.ItemSpecificationName From ItemSpecification s',
'        Where s.ItemSpecificationCode = od.ItemSpecificationCode),',
'      ''<span class="ds-muted">no specification</span>'') As SPECIFICATION,',
'  od.Quantity1 As ORDERED,',
'  nvl(od.ReceivedQuantity1,0) As RECEIVED,',
'  -- GREATEST(...,0) so an over-receipt reads as nothing outstanding, never',
'  -- as a negative pending quantity.',
'  Greatest(od.Quantity1 - nvl(od.ReceivedQuantity1,0), 0) As PENDING,',
'  od.Rate As RATE,',
'  od.DiscountRate As DISCOUNT_RATE,',
'  od.Amount As AMOUNT,',
'  ''<span class="ds-pill ds-pill--''',
'  || Case',
'       When nvl(od.Quantity1,0) = 0 Then ''muted''',
'       When nvl(od.ReceivedQuantity1,0) >= od.Quantity1 Then ''good''',
'       When nvl(od.ReceivedQuantity1,0) > 0 Then ''warn''',
'       Else ''bad''',
'     End',
'  || ''">''',
'  || Case',
'       When nvl(od.Quantity1,0) = 0 Then ''No quantity''',
'       When nvl(od.ReceivedQuantity1,0) >= od.Quantity1 Then ''Complete''',
'       When nvl(od.ReceivedQuantity1,0) > 0 Then ''Part received''',
'       Else ''Awaited''',
'     End',
'  || ''</span>'' As STATUS',
'From PurchaseOrderDetail od',
'Join PurchaseOrder o On o.TNo = od.TNo',
'Where o.TNo = :P682_TNO',
'  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'       Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'Order By od.SNo'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P682_TNO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'This order has no lines, or it lies outside the data panel your login may see.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485575838553008)
,p_query_column_id=>9
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>90
,p_column_heading=>'Amount'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Line value. Summing this column reproduces the Order Value card.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485657941553008)
,p_query_column_id=>8
,p_column_alias=>'DISCOUNT_RATE'
,p_column_display_sequence=>80
,p_column_heading=>'Discount'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Discount rate on the line, where one was applied.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485790396553008)
,p_query_column_id=>2
,p_column_alias=>'ITEM'
,p_column_display_sequence=>20
,p_column_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Item name, falling back to the code where the master row is missing.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485813769553008)
,p_query_column_id=>1
,p_column_alias=>'LINE_NO'
,p_column_display_sequence=>10
,p_column_heading=>'Line'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'The line''s own serial on the order. Also the sort key, so it stays projected.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15485920450553008)
,p_query_column_id=>4
,p_column_alias=>'ORDERED'
,p_column_display_sequence=>40
,p_column_heading=>'Ordered'
,p_column_format=>'FM999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Ordered quantity in the line''s own unit. Do not total this column \2014 lines of one order may use different units.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15486059358553008)
,p_query_column_id=>6
,p_column_alias=>'PENDING'
,p_column_display_sequence=>60
,p_column_heading=>'Pending'
,p_column_format=>'FM999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Floored at zero with GREATEST so an over-receipt shows as nothing outstanding rather than a negative.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15486189283553008)
,p_query_column_id=>7
,p_column_alias=>'RATE'
,p_column_display_sequence=>70
,p_column_heading=>'Rate'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('The rate as stored on the order line. This is the agreed rate, not the realised rate reported on Item 360 \2014 those come from bills.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15486251397553008)
,p_query_column_id=>5
,p_column_alias=>'RECEIVED'
,p_column_display_sequence=>50
,p_column_heading=>'Received'
,p_column_format=>'FM999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Read from PurchaseOrderDetail.ReceivedQuantity1 \2014 the ERP''s own running figure, never recomputed from a join to GRN.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15486317622553008)
,p_query_column_id=>3
,p_column_alias=>'SPECIFICATION'
,p_column_display_sequence=>30
,p_column_heading=>'Specification'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Renders "no specification" in the muted style where none was recorded, rather than an empty cell that reads as missing data.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15486441892553008)
,p_query_column_id=>10
,p_column_alias=>'STATUS'
,p_column_display_sequence=>100
,p_column_heading=>'Status'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Per-line pill derived from received against ordered. A line with no quantity is called out rather than being silently treated as awaited.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15486540581553008)
,p_plug_name=>'Order Lines'
,p_static_id=>'rule-lines'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Order Lines</h2>',
'  <p>What was ordered and how much of each line has arrived. Pending quantity',
'     is capped at the ordered quantity, so an over-receipt shows as complete',
'     rather than as a negative outstanding.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15486693211553009)
,p_plug_name=>'Linked Documents'
,p_static_id=>'rule-linked'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Documents Against This Order</h2>',
'  <p>The receipts and bills booked against this order. These are shown for',
'     traceability &mdash; they are <em>not</em> what drives the progress',
'     figures above, which come from the order line itself.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15486725542553009)
,p_name=>'P682_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15482886101552971)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('The order''s internal key, arriving from the Orders report on Supplier 360. It is never displayed \2014 the order is identified on screen by its own business number.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
end;
/
prompt --application/pages/delete_00683
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>683);
end;
/
prompt --application/pages/page_00683
begin
wwv_flow_imp_page.create_page(
 p_id=>683
,p_name=>'Purchase Analytics'
,p_alias=>'PURCHASE-ANALYTICS'
,p_step_title=>'Purchase Analytics'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('PURCHASE ANALYTICS \2014 data contract.'),
'',
'WHY THIS PAGE IS SEPARATE FROM 668. The Command Centre would otherwise carry',
'forty-odd query regions, all firing on first render. Splitting the heavier',
'analytics onto their own page keeps the operational picture fast, and this page',
'loads only when it is asked for. It inherits the full filter context from the',
'gateway on 668 and adds two selectors of its own.',
'',
unistr('VALUE GRAIN. SUM(PurchaseBillDetail.Amount) \2014 the bill LINE. See page 668.'),
'',
'REALISED RATE. Every rate on this page is money booked divided by quantity',
'booked, within one item AND one unit of measure. It is never an average of the',
'stored Rate column: averaging a stored rate mixes rate bases and produces',
unistr('nonsense when the basis changes. The ladder is three levels \2014 filtered lines,'),
unistr('then one rate per BILL, then the aggregate \2014 so that a one-kilogram bill is not'),
'weighted the same as a forty-tonne one.',
'',
'PANEL SECURITY. Scalar-subquery form on every region, exactly as page 668. Do',
'not rewrite it as a bare per-row call.',
'',
'HSPL DIVERGENCES FROM THE BLUEPRINT (docs/Purchase-Dashboard-FRD.md).',
'',
'1. ON-TIME DELIVERY IS MEASURED AT ORDER GRAIN, NOT ORDER-LINE GRAIN.',
'   The blueprint matches a receipt to an order LINE through',
unistr('   GrnDetail.PurchaseOrderTno. That column does not exist in this application \2014'),
'   GrnDetail carries only TNo, SNo, ItemCode, ItemSpecificationCode,',
'   ReceivedQuantity1 and RejectedQuantity1. Here the order reference lives on the',
'   GRN HEADER (Grn.PurchaseOrderTNo), so the earliest receipt is resolved per',
'   ORDER. The figure is therefore coarser than the blueprint''s, and the two are',
'   not directly comparable.',
'',
'2. NO CREDIT-TERMS ANALYTICS. The blueprint reports credit days and an overdue',
'   exception from PurchaseOrder.CreditDays. That column could not be verified on',
unistr('   PurchaseOrder in this application \2014 the only CreditDays references found sit'),
'   on a constructed temp set in the trade-payable report. Credit days, due dates,',
'   overdue ageing and the missing-credit-terms exception are all omitted rather',
'   than guessed.',
'',
'3. NO DEPARTMENT DIMENSION. PurchaseOrder.DepartmentCode was not corroborated,',
'   so Department is absent from the spend-dimension selector.',
'',
'4. NO OWED OR ADVANCE MEASURES. PartyCurrentClosing and PBPass.PaidInAdvance are',
'   referenced nowhere in this application.',
'',
'5. PAID READS THE ''PAYMENT'' DOC TYPE ONLY. CASHPAYMENT and BANKPAYMENT were not',
'   found here. If they exist, this understates.',
'',
'6. ITEM DRILL GOES TO THE BILL REGISTER (73), NOT ITEM 360 (679). Page 679 does',
'   not exist in this application; pointing at a real register avoids a broken',
'   link.',
'',
'READ-ONLY. Every region is a SELECT. No INSERT, UPDATE, DELETE or MERGE.'))
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15487009681553009)
,p_name=>'Purchase Analytics'
,p_static_id=>'command-header'
,p_template=>4501440665235496320
,p_display_sequence=>5
,p_region_css_classes=>'ds-purchase-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  ''<div class="ds-purchase-head">''',
'  || ''<a class="ds-head-cta" href="''',
'     || apex_page.get_url(',
'          p_page        => 668,',
'          p_clear_cache => ''668'',',
'          p_items       => ''P668_FROMDATE,P668_TODATE,P668_COMPANY,P668_LOCATION,P668_PANEL,P668_SUPPLIER,P668_ITEM,P668_ITEMGROUP'',',
'          p_values      =>    :P683_FROMDATE ||'',''|| :P683_TODATE',
'                       ||'',''|| :P683_COMPANY  ||'',''|| :P683_LOCATION',
'                       ||'',''|| :P683_PANEL    ||'',''|| :P683_SUPPLIER',
'                       ||'',''|| :P683_ITEM     ||'',''|| :P683_ITEMGROUP)',
'     || ''">&lsaquo; Command Centre</a>''',
'  || ''<div class="ds-purchase-head-eyebrow">Procurement Intelligence</div>''',
'  || ''<p class="ds-purchase-head-sub">Spend by time grain and business ''',
'  || ''dimension, vendor performance, realised price movement, and the ''',
'  || ''executive exception register.</p>''',
'  || ''<div class="ds-purchase-head-context">''',
'  || ''<span class="ds-purchase-head-chip">Period <b>''',
'     || apex_escape.html(:P683_FROMDATE) || '' &rarr; ''',
'     || apex_escape.html(:P683_TODATE) || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Company <b>''',
'     || apex_escape.html(nvl(GetCompanyName(:P683_COMPANY),''All companies''))',
'     || ''</b></span>''',
'  || ''<span class="ds-purchase-head-chip">Location <b>''',
'     || apex_escape.html(nvl(GetLocationName(:P683_LOCATION),''All locations''))',
'     || ''</b></span>''',
'  || Case',
'       When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'       Then ''<span class="ds-purchase-head-chip">Panel <b>''',
'            || apex_escape.html((Select GetUserPanelAB_apex() From dual))',
'            || '' (enforced)</b></span>''',
'       Else ''<span class="ds-purchase-head-chip">Panel <b>''',
'            || apex_escape.html(nvl(:P683_PANEL,''A + B'')) || ''</b></span>''',
'     End',
'  || Case When :P683_SUPPLIER Is Not Null',
'          Then ''<span class="ds-purchase-head-chip">Supplier <b>''',
'               || apex_escape.html(GetPartyName(:P683_SUPPLIER)) || ''</b></span>''',
'          Else '''' End',
'  || Case When :P683_ITEM Is Not Null',
'          Then ''<span class="ds-purchase-head-chip">Item <b>''',
'               || apex_escape.html(:P683_ITEM) || ''</b></span>''',
'          Else '''' End',
'  || ''<span class="ds-purchase-head-chip ds-purchase-head-chip--live">Bills as of <b>''',
'     || apex_escape.html(nvl(to_char(',
'          (Select Max(h.PurchaseBillDate) From PurchaseBill h',
'            Where ((Select GetUserPanelAB_apex() From dual) Is Null',
'                   Or h.Panel = (Select GetUserPanelAB_apex() From dual))),',
'          ''DD-Mon-RRRR''),''no bills visible''))',
'     || ''</b></span>''',
'  || ''</div></div>'' As HEAD',
'From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_LOCATION,P683_PANEL,P683_SUPPLIER,P683_ITEMGROUP,P683_ITEM'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Header unavailable.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15487105586553009)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Whole command header as one HTML string. The CTA returns to 668 carrying the filter context.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15487212526553009)
,p_plug_name=>'Records Behind the Exception'
,p_static_id=>'exec-exception-detail'
,p_region_name=>'p683XecDetail'
,p_region_css_classes=>'ds-register ds-exc-detailwrap'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>171
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P683_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P683_TODATE,''DD-MM-RRRR'')   T',
'         From dual)',
unistr('-- RULE 10 \2014 suppliers late on a quarter or more of their orders.'),
'Select GetPartyName(PartyCode) As SUBJECT,',
'       ''Supplier'' As SUBJECT_TYPE,',
'       to_char(Orders) As MEASURE_1,',
'       to_char(Round(100*(Orders-OnTime)/Orders,1)) || ''% late'' As MEASURE_2,',
'       To_Number(Null) As VALUE_LAC,',
'       To_Date(Null) As RECORD_DATE',
'  From (',
'    Select PartyCode, Count(*) Orders,',
'           Sum(Case When DeliveryDate >= FirstGrn Then 1 Else 0 End) OnTime',
'      From (',
'        Select o.PartyCode, o.DeliveryDate,',
'               (Select Min(g.GrnDate) From Grn g',
'                 Where g.PurchaseOrderTNo = o.TNo) FirstGrn',
'          From PurchaseOrder o Cross Join Win w',
'         Where :P683_XEC_FOCUS = ''10''',
'           And o.PurchaseOrderDate Between w.F And w.T',
'           And o.DeliveryDate Is Not Null',
'           And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'           And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'           And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY))',
'     Where FirstGrn Is Not Null',
'     Group By PartyCode',
'    Having Count(*) >= 10',
'       And Sum(Case When DeliveryDate >= FirstGrn Then 1 Else 0 End)',
'           <= Count(*) * 0.75)',
'Union All',
unistr('-- RULE 20 \2014 purchase price up more than 10% since the first month.'),
'Select nvl((Select i.ItemName From Item i Where i.ItemCode = x.ItemCode),',
'           x.ItemCode),',
'       ''Item / '' || nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'                          Where m.MeasuringUnitCode = x.Uom),''no unit''),',
'       to_char(Round(x.FirstRate,2)),',
'       to_char(Round(x.LastRate,2)),',
'       Round(x.Spend/100000,2),',
'       Null',
'  From (',
'    Select ItemCode, Uom, Sum(Amt) Spend,',
'           Min(Amt/Qty) KEEP (DENSE_RANK FIRST Order By Mth) FirstRate,',
'           Max(Amt/Qty) KEEP (DENSE_RANK LAST  Order By Mth) LastRate',
'      From (',
'        Select d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~'') Uom,',
'               Trunc(h.PurchaseBillDate,''MM'') Mth,',
'               Sum(d.Amount) Amt, Sum(d.Quantity1) Qty',
'          From PurchaseBill h',
'          Join PurchaseBillDetail d On d.TNo = h.TNo',
'         Cross Join Win w',
'         Where :P683_XEC_FOCUS = ''20''',
'           And h.PurchaseBillDate Between w.F And w.T',
'           And nvl(d.Quantity1,0) > 0 And nvl(d.Amount,0) > 0',
'           And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'           And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'           And (:P683_COMPANY Is Null Or h.CompanyCode = :P683_COMPANY)',
'         Group By d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~''),',
'                  Trunc(h.PurchaseBillDate,''MM''))',
'     Group By ItemCode, Uom',
'    Having Count(*) >= 2 And Sum(Amt) >= 5000000) x',
' Where x.LastRate > x.FirstRate * 1.10',
'Union All',
unistr('-- RULE 30 \2014 open purchase orders not fully received.'),
'Select o.PurchaseOrderNo, ''Purchase Order'',',
'       GetPartyName(o.PartyCode),',
'       GetLocationName(o.LocationCode),',
'       Round(Sum(od.Amount * (od.Quantity1',
'         - Least(nvl(od.ReceivedQuantity1,0), od.Quantity1))',
'         / od.Quantity1) / 100000, 2),',
'       o.PurchaseOrderDate',
'  From PurchaseOrder o',
'  Join PurchaseOrderDetail od On od.TNo = o.TNo',
' Cross Join Win w',
' Where :P683_XEC_FOCUS = ''30''',
'   And o.PurchaseOrderDate Between w.F And w.T',
'   And nvl(od.Quantity1,0) > 0',
'   And nvl(od.ReceivedQuantity1,0) < od.Quantity1',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'   And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY)',
' Group By o.PurchaseOrderNo, o.PartyCode, o.LocationCode, o.PurchaseOrderDate',
'Union All',
unistr('-- RULE 40 \2014 same item at widely different rates across suppliers.'),
'Select nvl((Select i.ItemName From Item i Where i.ItemCode = y.ItemCode),',
'           y.ItemCode),',
'       ''Item / '' || nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'                          Where m.MeasuringUnitCode = y.Uom),''no unit''),',
'       to_char(y.Suppliers) || '' suppliers'',',
'       to_char(Round(100*(y.MaxRate-y.MinRate)/y.MinRate,1)) || ''% spread'',',
'       Null, Null',
'  From (',
'    Select ItemCode, Uom, Count(*) Suppliers,',
'           Min(Rate) MinRate, Max(Rate) MaxRate',
'      From (',
'        Select d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~'') Uom,',
'               h.PartyCode, Sum(d.Amount)/Sum(d.Quantity1) Rate',
'          From PurchaseBill h',
'          Join PurchaseBillDetail d On d.TNo = h.TNo',
'         Cross Join Win w',
'         Where :P683_XEC_FOCUS = ''40''',
'           And h.PurchaseBillDate Between w.F And w.T',
'           And nvl(d.Quantity1,0) > 0 And nvl(d.Amount,0) > 0',
'           And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'           And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'           And (:P683_COMPANY Is Null Or h.CompanyCode = :P683_COMPANY)',
'         Group By d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~''),',
'                  h.PartyCode',
'        Having Sum(d.Amount) >= 100000)',
'     Group By ItemCode, Uom',
'    Having Count(*) >= 2 And Min(Rate) > 0',
'       And (Max(Rate) - Min(Rate)) / Min(Rate) > 0.50) y',
'Union All',
unistr('-- RULE 50 \2014 orders dated outside a plausible year.'),
'Select o.PurchaseOrderNo, ''Purchase Order'',',
'       GetPartyName(o.PartyCode), GetLocationName(o.LocationCode),',
'       Null, o.PurchaseOrderDate',
'  From PurchaseOrder o',
' Where :P683_XEC_FOCUS = ''50''',
'   And (to_number(to_char(o.PurchaseOrderDate,''RRRR'')) < 2020',
'        Or to_number(to_char(o.PurchaseOrderDate,''RRRR''))',
'           > to_number(to_char(sysdate,''RRRR'')) + 1)',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'   And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY)',
'Union All',
unistr('-- RULE 60 \2014 orders with no delivery date recorded.'),
'Select o.PurchaseOrderNo, ''Purchase Order'',',
'       GetPartyName(o.PartyCode), GetLocationName(o.LocationCode),',
'       Null, o.PurchaseOrderDate',
'  From PurchaseOrder o Cross Join Win w',
' Where :P683_XEC_FOCUS = ''60''',
'   And o.PurchaseOrderDate Between w.F And w.T',
'   And o.DeliveryDate Is Null',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'   And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P683_XEC_FOCUS,P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_PANEL'
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
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(15487370332553010)
,p_max_row_count=>'100000'
,p_no_data_found_message=>'Pick a count in the Executive Exception Register above to list the records behind it.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21559292994436345
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15487494855553010)
,p_db_column_name=>'MEASURE_1'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Measure 1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Rule-specific \2014 orders for rule 10, first-month rate for rule 20, supplier count for rule 40.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15487503057553010)
,p_db_column_name=>'MEASURE_2'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Measure 2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Rule-specific \2014 late percentage, last-month rate, or rate spread.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15487616794553010)
,p_db_column_name=>'RECORD_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Document date where the rule is document-based; blank for supplier and item level rules.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15487786130553010)
,p_db_column_name=>'SUBJECT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Supplier, item or order number depending on which rule is in focus.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15487870249553010)
,p_db_column_name=>'SUBJECT_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'What kind of record this row is, so a mixed result set stays readable.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15487920162553010)
,p_db_column_name=>'VALUE_LAC'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Value (Rs Lac)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('NULL \2014 not zero \2014 on rules the ERP cannot quantify.')
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(15488060077553010)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SUBJECT:SUBJECT_TYPE:MEASURE_1:MEASURE_2:VALUE_LAC:RECORD_DATE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15488142325553010)
,p_name=>'Executive Exception Register'
,p_static_id=>'exec-exceptions'
,p_template=>4072358936313175081
,p_display_sequence=>170
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P683_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P683_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'LateSup As (',
'  Select PartyCode, Orders, OnTime,',
'         (Orders - OnTime) / Orders LatePct',
'    From (',
'      Select PartyCode, Count(*) Orders,',
'             Sum(Case When DeliveryDate >= FirstGrn Then 1 Else 0 End) OnTime',
'        From (',
'          Select o.PartyCode, o.DeliveryDate,',
'                 (Select Min(g.GrnDate) From Grn g',
'                   Where g.PurchaseOrderTNo = o.TNo) FirstGrn',
'            From PurchaseOrder o Cross Join Win w',
'           Where o.PurchaseOrderDate Between w.F And w.T',
'             And o.DeliveryDate Is Not Null',
'             And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                  Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'             And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'             And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY))',
'       Where FirstGrn Is Not Null',
'       Group By PartyCode',
'      Having Count(*) >= 10)),',
'-- The worst offender is resolved in its OWN CTE and joined LEFT ... ON 1=1,',
'-- because a scalar subquery beside COUNT(*) in an aggregate select list',
'-- raises ORA-00937. The LEFT join keeps the rule reporting its count in a',
'-- period where no supplier is late at all.',
'WorstLate As (',
'  Select Max(GetPartyName(PartyCode) || '' at ''',
'             || to_char(Round(100*LatePct,0),''FM990'') || ''% late'')',
'         KEEP (DENSE_RANK FIRST Order By LatePct Desc) Worst',
'    From LateSup Where LatePct >= 0.25),',
'Rules As (',
'  Select 10 Seq, ''HIGH'' Sev,',
'         ''Suppliers delivering late on a quarter or more of their orders'' Rule,',
'         (Select Count(*) From LateSup Where LatePct >= 0.25) Items,',
'         To_Number(Null) Val,',
'         ''Measured only on suppliers with at least ten scheduled orders. ''',
'         || ''Worst: '' || nvl(wl.Worst,''none this period'') || ''.'' Impact',
'    From dual Left Join WorstLate wl On 1 = 1',
'  Union All',
'  Select 20, ''HIGH'',',
'         ''Purchase price up more than 10% since the first month'',',
'         Count(*), Sum(Spend),',
'         ''Realised rate, on items carrying at least Rs 50 lakh across at ''',
'         || ''least two months. A rise is adverse.''',
'    From (',
'      Select ItemCode, Uom, Sum(Amt) Spend,',
'             Min(Amt/Qty) KEEP (DENSE_RANK FIRST Order By Mth) FirstRate,',
'             Max(Amt/Qty) KEEP (DENSE_RANK LAST  Order By Mth) LastRate',
'        From (',
'          Select d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~'') Uom,',
'                 Trunc(h.PurchaseBillDate,''MM'') Mth,',
'                 Sum(d.Amount) Amt, Sum(d.Quantity1) Qty',
'            From PurchaseBill h',
'            Join PurchaseBillDetail d On d.TNo = h.TNo',
'           Cross Join Win w',
'           Where h.PurchaseBillDate Between w.F And w.T',
'             And nvl(d.Quantity1,0) > 0 And nvl(d.Amount,0) > 0',
'             And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                  Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'             And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'             And (:P683_COMPANY Is Null Or h.CompanyCode = :P683_COMPANY)',
'           Group By d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~''),',
'                    Trunc(h.PurchaseBillDate,''MM''))',
'       Group By ItemCode, Uom',
'      Having Count(*) >= 2 And Sum(Amt) >= 5000000)',
'   Where LastRate > FirstRate * 1.10',
'  Union All',
'  Select 30, ''MEDIUM'',',
'         ''Open purchase orders not fully received'',',
'         Count(Distinct o.TNo), Sum(od.Amount * (od.Quantity1',
'           - Least(nvl(od.ReceivedQuantity1,0), od.Quantity1)) / od.Quantity1),',
'         ''Committed spend still awaiting material. Pending value is ''',
unistr('         || ''pro-rated within the line \2014 the ERP stores no pending-value '''),
'         || ''column.''',
'    From PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'   Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And nvl(od.Quantity1,0) > 0',
'     And nvl(od.ReceivedQuantity1,0) < od.Quantity1',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'     And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY)',
'  Union All',
'  -- THREE levels are required here. Collapsing to two nests MIN(SUM(...))',
'  -- under the wrong grouping and returns one row per item instead of the',
'  -- single summary row the register expects.',
'  Select 40, ''MEDIUM'',',
'         ''Same item bought at widely different rates across suppliers'',',
'         Count(*), To_Number(Null),',
'         ''At least two suppliers, each above Rs 1 lakh, with more than 50% ''',
'         || ''spread between cheapest and dearest realised rate.''',
'    From (',
'      Select ItemCode, Uom',
'        From (',
'          Select d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~'') Uom,',
'                 h.PartyCode,',
'                 Sum(d.Amount) Amt,',
'                 Sum(d.Amount)/Sum(d.Quantity1) Rate',
'            From PurchaseBill h',
'            Join PurchaseBillDetail d On d.TNo = h.TNo',
'           Cross Join Win w',
'           Where h.PurchaseBillDate Between w.F And w.T',
'             And nvl(d.Quantity1,0) > 0 And nvl(d.Amount,0) > 0',
'             And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                  Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'             And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'             And (:P683_COMPANY Is Null Or h.CompanyCode = :P683_COMPANY)',
'           Group By d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~''),',
'                    h.PartyCode',
'          Having Sum(d.Amount) >= 100000)',
'       Group By ItemCode, Uom',
'      Having Count(*) >= 2 And Min(Rate) > 0',
'         And (Max(Rate) - Min(Rate)) / Min(Rate) > 0.50)',
'  Union All',
'  Select 50, ''MEDIUM'',',
'         ''Purchase orders dated outside a plausible year'',',
'         Count(*), To_Number(Null),',
'         ''Almost certainly keying errors. They distort any date-anchored ''',
'         || ''window, which is why the Order Book on the Command Centre ''',
'         || ''measures backwards from the chosen To Date rather than from the ''',
'         || ''newest row.''',
'    From PurchaseOrder o',
'   Where (to_number(to_char(o.PurchaseOrderDate,''RRRR'')) < 2020',
'          Or to_number(to_char(o.PurchaseOrderDate,''RRRR''))',
'             > to_number(to_char(sysdate,''RRRR'')) + 1)',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'     And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY)',
'  Union All',
'  Select 60, ''LOW'',',
'         ''Orders with no delivery date recorded'',',
'         Count(*), To_Number(Null),',
'         ''Delivery performance cannot be measured on these orders. They are ''',
'         || ''excluded from the on-time figure rather than counted as late, ''',
'         || ''so the gap is reported here instead of silently flattering it.''',
'    From PurchaseOrder o Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And o.DeliveryDate Is Null',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'     And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY))',
'Select',
'  r.Seq,',
'  ''<span class="ds-sev ds-sev--'' || lower(r.Sev) || ''">''',
'  || apex_escape.html(initcap(r.Sev)) || ''</span>'' As SEVERITY,',
'  apex_escape.html(r.Rule) As RULE_TEXT,',
'  ''<a class="ds-xec-drill" href="#" data-k="'' || r.Seq || ''">''',
'  || to_char(r.Items,''FM999G999G990'') || ''</a>'' As ITEMS,',
'  Case When r.Val Is Null',
'       Then ''<span class="ds-muted">not quantifiable</span>''',
'       Else ''<b>''',
'            || Case When r.Val >= 10000000',
'                    Then ''Rs '' || to_char(Round(r.Val/10000000,2),''FM99G990D00'') || '' Cr''',
'                    When r.Val >= 100000',
'                    Then ''Rs '' || to_char(Round(r.Val/100000,2),''FM99G990D00'') || '' L''',
'                    Else ''Rs '' || to_char(r.Val,''FM99G99G990D00'') End',
'            || ''</b>'' End As VALUE_AT_STAKE,',
'  ''<span class="ds-muted">'' || apex_escape.html(r.Impact) || ''</span>'' As IMPACT',
'From Rules r',
'Where r.Items > 0',
'Order By r.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_PANEL'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No executive exceptions fired for this period and scope.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15488217057553010)
,p_query_column_id=>6
,p_column_alias=>'IMPACT'
,p_column_display_sequence=>50
,p_column_heading=>'Why It Matters'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Business consequence, naming the worst case where one can be resolved.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15488364237553011)
,p_query_column_id=>4
,p_column_alias=>'ITEMS'
,p_column_display_sequence=>30
,p_column_heading=>'Records'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Clickable count. Sets P683_XEC_FOCUS \2014 its OWN item, so it does not disturb the register on page 668.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15488413800553011)
,p_query_column_id=>3
,p_column_alias=>'RULE_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'Rule'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('What was tested. Safe to reword \2014 the drill keys on the rule id, not this text.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15488555055553011)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_column_comment=>'Rule id. Also travels in the drill anchor''s data-k attribute.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15488612223553011)
,p_query_column_id=>2
,p_column_alias=>'SEVERITY'
,p_column_display_sequence=>10
,p_column_heading=>'Severity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Fixed grading. Practices normal for this business are not graded high merely for looking unusual.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15488728072553011)
,p_query_column_id=>5
,p_column_alias=>'VALUE_AT_STAKE'
,p_column_display_sequence=>40
,p_column_heading=>'Value at Stake'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Renders "not quantifiable" where the ERP holds no value. Never zero.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15488862065553011)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p683Filters'
,p_region_css_classes=>'ds-dash-filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15488903900553011)
,p_plug_name=>'Advanced Filters'
,p_static_id=>'filter-drawer'
,p_region_name=>'p683Drawer'
,p_region_css_classes=>'ds-filterdrawer js-dialog-class-t-Drawer--pullOutEnd'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>1660973136434625155
,p_plug_display_sequence=>12
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15489051747553011)
,p_plug_name=>'Item Procurement Analysis'
,p_static_id=>'item-procurement'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>155
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P683_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P683_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P683_ITEMGROUP Is Null),',
'L As (',
'  Select h.TNo BillTno, h.PurchaseBillDate BillDate, h.PartyCode,',
'         d.ItemCode,',
'         nvl(d.RateMeasuringUnitCode,''~NONE~'') Uom,',
'         d.Amount Amt, d.Quantity1 Qty',
'    From PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PurchaseBillDate',
'         Between to_date(:P683_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P683_TODATE,''DD-MM-RRRR'')',
'     And nvl(d.Quantity1,0) > 0',
'     And nvl(d.Amount,0)    > 0',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'     And (:P683_COMPANY  Is Null Or h.CompanyCode  = :P683_COMPANY)',
'     And (:P683_LOCATION Is Null Or h.LocationCode = :P683_LOCATION)',
'     And (:P683_ITEM     Is Null Or d.ItemCode     = :P683_ITEM)',
'     And d.ItemCode In (Select ItemCode From ItemTree)),',
'B As (',
'  Select ItemCode, Uom, BillTno, BillDate,',
'         Sum(Amt) Amt, Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) BillRate',
'    From L',
'   Group By ItemCode, Uom, BillTno, BillDate),',
'A As (',
'  Select ItemCode, Uom,',
'         Count(*) Bills,',
'         Sum(Amt) Spend,',
'         Sum(Qty) Qty,',
'         Sum(Amt) / Sum(Qty) AvgRate,',
'         Min(BillRate) MinRate,',
'         Max(BillRate) MaxRate,',
'         -- Deterministic "most recent rate" even when several bills share',
'         -- a date: the tie is broken on BillTno.',
'         Max(BillRate) KEEP (DENSE_RANK LAST',
'                             Order By BillDate, BillTno) LastRate,',
'         Max(BillDate) LastBuy',
'    From B',
'   Group By ItemCode, Uom),',
'Vend As (',
'  Select ItemCode, Uom, Count(Distinct PartyCode) Vendors',
'    From L Group By ItemCode, Uom)',
'Select',
'  a.ItemCode As ITEMCODE,',
'  -- Carried as the SECOND half of the drill key to Item 360. Already',
'  -- sentinel-wrapped by CTE L, so a line with no unit travels as ''~NONE~''',
'  -- and lands on its own group there rather than being read as "all units".',
'  a.Uom As UOMCODE,',
'  nvl((Select i.ItemName From Item i Where i.ItemCode = a.ItemCode),',
'      a.ItemCode) As ITEM,',
'  nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'        Where m.MeasuringUnitCode = a.Uom),',
'      ''No unit recorded'') As UOM,',
'  a.Bills As BILLS,',
'  vn.Vendors As VENDORS,',
'  a.Qty As QUANTITY,',
'  a.Spend As SPEND,',
'  Round(a.AvgRate,2) As AVG_RATE,',
'  Round(a.MinRate,2) As MIN_RATE,',
'  Round(a.MaxRate,2) As MAX_RATE,',
'  Round(a.LastRate,2) As LAST_RATE,',
'  Case When a.MinRate > 0',
'       Then Round(100 * (a.MaxRate - a.MinRate) / a.MinRate, 1) End',
'    As SPREAD_PCT,',
'  a.LastBuy As LAST_BUY',
'From A a',
'Join Vend vn On vn.ItemCode = a.ItemCode And vn.Uom = a.Uom',
'Order By a.Spend Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_LOCATION,P683_PANEL,P683_ITEMGROUP,P683_ITEM'
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
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(15489180981553011)
,p_no_data_found_message=>'No item was billed with both a quantity and a value in this period and scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21556827939436316
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15489260032553011)
,p_db_column_name=>'AVG_RATE'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Avg Realised Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Total money divided by total quantity \2014 a VALUE-WEIGHTED mean, not an average of per-bill rates. Averaging rates would weight a 1 kg bill like a 40 MT one.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15489321327553012)
,p_db_column_name=>'BILLS'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Bills'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Purchase frequency \2014 how many bills carried this item in this unit.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15489424719553049)
,p_db_column_name=>'ITEM'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Item'
,p_column_link=>'f?p=&APP_ID.:679:&SESSION.::NO:679:P679_ITEMCODE,P679_UOM,P679_FROMDATE,P679_TODATE,P679_COMPANY,P679_LOCATION,P679_PANEL:#ITEMCODE#,#UOMCODE#,&P683_FROMDATE.,&P683_TODATE.,&P683_COMPANY.,&P683_LOCATION.,&P683_PANEL.'
,p_column_linktext=>'#ITEM#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Drills to Item 360 (page 679) on BOTH halves of the grain \2014 item and unit \2014 so the target opens on exactly the row clicked and its figures reconcile to this one. The supplier filter is deliberately not carried, because the vendor comparison there mus')
||'t show every vendor.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15489557210553049)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'Item Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15489687757553049)
,p_db_column_name=>'LAST_BUY'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'Last Buy'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Date of the most recent bill carrying this item and unit.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15489727519553049)
,p_db_column_name=>'LAST_RATE'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Last Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Most recent per-bill rate, resolved deterministically with KEEP DENSE_RANK LAST on bill date then bill key.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15489893860553049)
,p_db_column_name=>'MAX_RATE'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Highest'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Dearest per-BILL realised rate.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15489905990553049)
,p_db_column_name=>'MIN_RATE'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Lowest'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Cheapest per-BILL realised rate.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15490097448553049)
,p_db_column_name=>'QUANTITY'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Meaningful only within the row''s own unit. Never sum this column across rows.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15490197450553049)
,p_db_column_name=>'SPEND'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Spend'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'SUM(PurchaseBillDetail.Amount) for this item and unit.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15490227009553049)
,p_db_column_name=>'SPREAD_PCT'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'Spread %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM9990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Highest against lowest realised rate. A wide spread on a high-spend item is worth investigating.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15490360467553049)
,p_db_column_name=>'UOM'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Rate unit. Part of the grain \2014 rates across units are not comparable, so each unit is its own row.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15490455210553049)
,p_db_column_name=>'UOMCODE'
,p_display_order=>6
,p_column_identifier=>'B'
,p_column_label=>'Unit Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Second half of the drill key to Item 360, sentinel-wrapped. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15490554167553049)
,p_db_column_name=>'VENDORS'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Vendors'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Distinct suppliers of this item and unit. A single vendor on a high-spend item is a concentration risk.'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(15490668761553050)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ITEMCODE:UOMCODE:ITEM:UOM:BILLS:VENDORS:QUANTITY:SPEND:AVG_RATE:MIN_RATE:MAX_RATE:LAST_RATE:SPREAD_PCT:LAST_BUY'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15490747913553050)
,p_plug_name=>'Executive Exceptions'
,p_static_id=>'rule-execexc'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>165
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Executive Exceptions</h2>',
'  <p>Governance-level findings that do <em>not</em> repeat the operational',
'     register on the Command Centre. Practices that are normal for this',
'     business are graded accordingly rather than flagged critical for looking',
'     unusual. Click a count to list the records behind it.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15490865459553050)
,p_plug_name=>'Item Procurement'
,p_static_id=>'rule-itemproc'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>150
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Item Procurement</h2>',
'  <p>What each item cost, at <em>realised</em> rate &mdash; money booked',
'     divided by quantity booked, computed per bill and then aggregated, so a',
'     one-kilogram bill is not weighted like a forty-tonne one. The grain is',
'     item <em>and</em> unit of measure: one item booked in two units is two',
'     rows, because the rates are not comparable.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15490972130553050)
,p_plug_name=>'Spend Analysis'
,p_static_id=>'rule-spend'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>110
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Spend Analysis</h2>',
'  <p>Where the money went, at the time grain and along the business dimension',
'     you choose. The spend controls below re-run only this band &mdash; the',
'     vendor and exception bands keep their current results, so changing the',
'     lens is cheap.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15491017739553050)
,p_plug_name=>'Vendor Performance'
,p_static_id=>'rule-vendor'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>130
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Vendor Performance</h2>',
'  <p>Delivery reliability and quality, beyond purchase value alone. On-time is',
'     measured at <em>order</em> grain here, not order-line grain &mdash; this',
'     application links a receipt to an order on the GRN header, so the',
'     line-level match the blueprint uses is not reproducible. Orders with no',
'     delivery date, or with no receipt yet, are excluded rather than counted',
'     as late.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15491178686553050)
,p_plug_name=>'Spend Controls'
,p_static_id=>'spend-controls'
,p_region_name=>'p683SpendControls'
,p_region_css_classes=>'ds-dash-filters'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>112
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15491225464553051)
,p_plug_name=>'Spend by Dimension'
,p_static_id=>'spend-dimension'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>120
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>3
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P683_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P683_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P683_ITEMGROUP Is Null)',
'Select * From (',
'  Select',
'    Case nvl(:P683_DIM,''SUPPLIER'')',
'      When ''SUPPLIER'' Then nvl(GetPartyName(K),''Not recorded'')',
'      When ''COMPANY''  Then nvl(GetCompanyName(K),''Not recorded'')',
'      When ''LOCATION'' Then nvl(GetLocationName(K),''Not recorded'')',
'      When ''ITEM''     Then nvl((Select i.ItemName From Item i',
'                                 Where i.ItemCode = K),''Not recorded'')',
'      When ''UOM''      Then nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'                                 Where m.MeasuringUnitCode = K),',
'                               ''No unit recorded'')',
'      Else K',
'    End As DIM_LABEL,',
'    VALUE_LAC',
'  From (',
'    Select',
'      Case nvl(:P683_DIM,''SUPPLIER'')',
'        When ''SUPPLIER'' Then h.PartyCode',
'        When ''COMPANY''  Then h.CompanyCode',
'        When ''LOCATION'' Then h.LocationCode',
'        When ''ITEM''     Then d.ItemCode',
'        When ''UOM''      Then d.RateMeasuringUnitCode',
'        Else h.PartyCode',
'      End K,',
'      Round(Sum(d.Amount) / 100000, 2) VALUE_LAC',
'      From PurchaseBill h',
'      Join PurchaseBillDetail d On d.TNo = h.TNo',
'     Where h.PurchaseBillDate',
'           Between to_date(:P683_FROMDATE,''DD-MM-RRRR'')',
'               And to_date(:P683_TODATE,''DD-MM-RRRR'')',
'       And ((Select GetUserPanelAB_apex() From dual) Is Null',
'            Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'       And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'       And (:P683_COMPANY  Is Null Or h.CompanyCode  = :P683_COMPANY)',
'       And (:P683_LOCATION Is Null Or h.LocationCode = :P683_LOCATION)',
'       And d.ItemCode In (Select ItemCode From ItemTree)',
'     Group By',
'      Case nvl(:P683_DIM,''SUPPLIER'')',
'        When ''SUPPLIER'' Then h.PartyCode',
'        When ''COMPANY''  Then h.CompanyCode',
'        When ''LOCATION'' Then h.LocationCode',
'        When ''ITEM''     Then d.ItemCode',
'        When ''UOM''      Then d.RateMeasuringUnitCode',
'        Else h.PartyCode',
'      End',
'     Order By Sum(d.Amount) Desc))',
' Where rownum <= 14'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_LOCATION,P683_PANEL,P683_ITEMGROUP,P683_DIM'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(15491388416553051)
,p_region_id=>wwv_flow_imp.id(15491225464553051)
,p_chart_type=>'bar'
,p_height=>'380'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No spend to break down for this period and scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(15491403856553051)
,p_chart_id=>wwv_flow_imp.id(15491388416553051)
,p_static_id=>'by-dimension'
,p_seq=>10
,p_name=>'Spend (Rs Lac)'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'VALUE_LAC'
,p_items_label_column_name=>'DIM_LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(15491537277553051)
,p_chart_id=>wwv_flow_imp.id(15491388416553051)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(15491659727553051)
,p_chart_id=>wwv_flow_imp.id(15491388416553051)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Rs Lac'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15491707459553051)
,p_name=>'Supplier Concentration'
,p_static_id=>'spend-pareto'
,p_template=>4072358936313175081
,p_display_sequence=>122
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select * From (',
'  Select',
'    Rank() Over (Order By V Desc, PartyCode) As RNK,',
'    apex_escape.html(GetPartyName(PartyCode)) As SUPPLIER,',
'    V As PURCHASE_VALUE,',
'    Round(100 * V / Sum(V) Over (), 2) As SHARE_PCT,',
'    Round(100 * Sum(V) Over (Order By V Desc, PartyCode',
'                             Rows Between Unbounded Preceding',
'                                      And Current Row)',
'              / Sum(V) Over (), 2) As CUM_PCT,',
'    Case',
'      When 100 * Sum(V) Over (Order By V Desc, PartyCode',
'                              Rows Between Unbounded Preceding',
'                                       And Current Row)',
'               / Sum(V) Over () <= 50 Then ''red''',
'      When 100 * Sum(V) Over (Order By V Desc, PartyCode',
'                              Rows Between Unbounded Preceding',
'                                       And Current Row)',
'               / Sum(V) Over () <= 80 Then ''amber''',
'      Else ''teal''',
'    End As CUM_BAND',
'  From (',
'    Select h.PartyCode, Sum(d.Amount) V',
'      From PurchaseBill h',
'      Join PurchaseBillDetail d On d.TNo = h.TNo',
'     Where h.PurchaseBillDate',
'           Between to_date(:P683_FROMDATE,''DD-MM-RRRR'')',
'               And to_date(:P683_TODATE,''DD-MM-RRRR'')',
'       And ((Select GetUserPanelAB_apex() From dual) Is Null',
'            Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'       And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'       And (:P683_COMPANY  Is Null Or h.CompanyCode  = :P683_COMPANY)',
'       And (:P683_LOCATION Is Null Or h.LocationCode = :P683_LOCATION)',
'     Group By h.PartyCode))',
' Where RNK <= 12',
' Order By RNK'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_LOCATION,P683_PANEL'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No supplier billing in this period and scope.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15491848839553051)
,p_query_column_id=>6
,p_column_alias=>'CUM_BAND'
,p_column_display_sequence=>60
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Bar colour token consumed by the CUM_PCT html expression. Hidden classic-report columns omit the heading block by contract.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15491996663553051)
,p_query_column_id=>5
,p_column_alias=>'CUM_PCT'
,p_column_display_sequence=>50
,p_column_heading=>'Cumulative Share'
,p_column_format=>'FM990D0'
,p_column_html_expression=>'<span class="ds-sharecell"><span class="ds-bar ds-bar--#CUM_BAND#"><i style="width:#CUM_PCT#%"></i></span><b>#CUM_PCT#%</b></span>'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Running share. Banded red at or under 50% and amber at or under 80% because heavy concentration is a RISK \2014 colour follows cost, not arithmetic.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15492040045553051)
,p_query_column_id=>3
,p_column_alias=>'PURCHASE_VALUE'
,p_column_display_sequence=>30
,p_column_heading=>'Purchase Value'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'SUM(PurchaseBillDetail.Amount) for the supplier.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15492172587553051)
,p_query_column_id=>1
,p_column_alias=>'RNK'
,p_column_display_sequence=>10
,p_column_heading=>'Rank'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Rank by descending value, tie-broken on PartyCode so the ordering is deterministic.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15492295212553051)
,p_query_column_id=>4
,p_column_alias=>'SHARE_PCT'
,p_column_display_sequence=>40
,p_column_heading=>'Share %'
,p_column_format=>'FM990D0'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'This supplier''s share of total value in scope.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15492379006553051)
,p_query_column_id=>2
,p_column_alias=>'SUPPLIER'
,p_column_display_sequence=>20
,p_column_heading=>'Supplier'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Supplier name, pre-escaped in SQL.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15492426254553051)
,p_plug_name=>'Spend Over Time'
,p_static_id=>'spend-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>115
,p_plug_grid_column_span=>3
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P683_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P683_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P683_ITEMGROUP Is Null)',
'Select',
'  Case nvl(:P683_GRAIN,''MM'')',
'    When ''DD''   Then to_char(B,''DD-Mon'')',
'    When ''IW''   Then ''w/c '' || to_char(B,''DD-Mon'')',
'    When ''Q''    Then ''Q'' || to_char(B,''Q'') || '' '' || to_char(B,''RR'')',
'    When ''YYYY'' Then to_char(B,''RRRR'')',
'    Else to_char(B,''Mon-RR'')',
'  End As BUCKET_LABEL,',
'  VALUE_LAC,',
'  B As SORT_KEY',
'From (',
'  Select Trunc(h.PurchaseBillDate, nvl(:P683_GRAIN,''MM'')) B,',
'         Round(Sum(d.Amount) / 100000, 2) VALUE_LAC',
'    From PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PurchaseBillDate',
'         Between to_date(:P683_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P683_TODATE,''DD-MM-RRRR'')',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'     And (:P683_COMPANY  Is Null Or h.CompanyCode  = :P683_COMPANY)',
'     And (:P683_LOCATION Is Null Or h.LocationCode = :P683_LOCATION)',
'     And (:P683_SUPPLIER Is Null Or h.PartyCode    = :P683_SUPPLIER)',
'     And (:P683_ITEM     Is Null Or d.ItemCode     = :P683_ITEM)',
'     And d.ItemCode In (Select ItemCode From ItemTree)',
'   Group By Trunc(h.PurchaseBillDate, nvl(:P683_GRAIN,''MM'')))',
'Order By SORT_KEY'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_LOCATION,P683_PANEL,P683_SUPPLIER,P683_ITEMGROUP,P683_ITEM,P683_GRAIN'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(15492526331553052)
,p_region_id=>wwv_flow_imp.id(15492426254553051)
,p_chart_type=>'bar'
,p_height=>'270'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No bills were booked in this period and scope, so there is nothing to plot.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(15492613514553052)
,p_chart_id=>wwv_flow_imp.id(15492526331553052)
,p_static_id=>'spend'
,p_seq=>10
,p_name=>'Spend (Rs Lac)'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'VALUE_LAC'
,p_items_label_column_name=>'BUCKET_LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(15492748634553052)
,p_chart_id=>wwv_flow_imp.id(15492526331553052)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(15492848000553052)
,p_chart_id=>wwv_flow_imp.id(15492526331553052)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Rs Lac'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15492936662553052)
,p_name=>'Vendor KPIs'
,p_static_id=>'vendor-kpi'
,p_template=>4501440665235496320
,p_display_sequence=>132
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P683_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P683_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'-- DELIVERY. Grain is the ORDER: this application carries the order',
'-- reference on the GRN HEADER (Grn.PurchaseOrderTNo). GrnDetail has no',
'-- PurchaseOrderTno, so the blueprint''s order-LINE match is not possible.',
'Ord As (',
'  Select o.TNo, o.PartyCode, o.DeliveryDate,',
'         (Select Min(g.GrnDate) From Grn g',
'           Where g.PurchaseOrderTNo = o.TNo) FirstGrn',
'    From PurchaseOrder o Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'     And (:P683_COMPANY  Is Null Or o.CompanyCode  = :P683_COMPANY)',
'     And (:P683_LOCATION Is Null Or o.LocationCode = :P683_LOCATION)',
'     And (:P683_SUPPLIER Is Null Or o.PartyCode    = :P683_SUPPLIER)),',
'Deliv As (',
'  -- Orders with no delivery date or no receipt are EXCLUDED, not assumed',
'  -- on time. Counting them as on time would flatter the figure.',
'  Select Count(*) Legs,',
'         Sum(Case When DeliveryDate >= FirstGrn Then 1 Else 0 End) OnTime,',
'         Avg(FirstGrn - DeliveryDate) AvgLateDays',
'    From Ord',
'   Where DeliveryDate Is Not Null And FirstGrn Is Not Null),',
'Pay As (',
'  Select Sum(-vd.Amount) Paid',
'    From Voucher v',
'    Join VoucherDetail vd On vd.TNo = v.TNo',
'   Cross Join Win w',
'   Where v.DocTypeCode = ''PAYMENT''',
'     And vd.Amount < 0',
'     And v.VoucherDate Between w.F And w.T',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or v.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or v.Panel = :P683_PANEL)',
'     And (:P683_COMPANY Is Null Or v.CompanyCode = :P683_COMPANY)),',
'Rej As (',
'  Select Count(Distinct g.TNo) RejGrns',
'    From Grn g',
'    Join GrnDetail gd On gd.TNo = g.TNo',
'   Cross Join Win w',
'   Where g.GrnDate Between w.F And w.T',
'     And nvl(gd.RejectedQuantity1,0) > 0',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or g.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or g.Panel = :P683_PANEL)',
'     And (:P683_COMPANY Is Null Or g.CompanyCode = :P683_COMPANY))',
'Select',
'  ''<div class="ds-kpi ds-kpi--ok" title="Orders whose DeliveryDate is on or ''',
'  || ''after the earliest GRN against that order. Grain is the ORDER, not the ''',
unistr('  || ''order line \2014 GrnDetail carries no order reference in this application.">'''),
'  || ''<span class="ds-kpi-ic"><span class="fa fa-clock-o"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">On-Time Delivery</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(dv.Legs,0) = 0 Then ''n/a''',
'             Else to_char(Round(100 * dv.OnTime / dv.Legs,1),''FM99999990D0'') || ''%''',
'        End || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(dv.Legs,0) = 0',
'             Then ''<span class="ds-muted">no order carries both a delivery ''',
'                  || ''date and a receipt</span>''',
'             Else ''measured on '' || to_char(dv.Legs,''FM999G999'')',
'                  || '' scheduled orders'' End',
'  || ''</span></span></div>'' As KPI1,',
'  ''<div class="ds-kpi ds-kpi--risk" title="The complement of on-time over the ''',
'  || ''same measurable population.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-exclamation-triangle"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Late Deliveries</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(dv.Legs,0) = 0 Then ''n/a''',
'             Else to_char(Round(100 * (dv.Legs - dv.OnTime) / dv.Legs,1),''FM99999990D0'')',
'                  || ''%'' End || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(dv.Legs,0) = 0 Then ''not measurable''',
'             Else to_char(dv.Legs - dv.OnTime,''FM999G999'') || '' orders late''',
'        End || ''</span>''',
'  || ''</span></div>'' As KPI2,',
'  ''<div class="ds-kpi ds-kpi--move" title="Average days between the promised ''',
'  || ''delivery date and the earliest receipt. A value at or below zero means ''',
unistr('  || ''goods arrived on or before the promise \2014 or the order was raised '''),
'  || ''retrospectively, which is normal for bulk commodity buying.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-calendar"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Avg Days vs Promise</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When dv.AvgLateDays Is Null Then ''n/a''',
'             Else to_char(Round(dv.AvgLateDays,1),''FM99999990D0'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">negative means early or same-day</span>''',
'  || ''</span></div>'' As KPI3,',
'  ''<div class="ds-kpi ds-kpi--suppl" title="SUM(-VoucherDetail.Amount) on ''',
unistr('  || ''PAYMENT vouchers, negative supplier leg. Period figure \2014 no route in '''),
'  || ''this ERP ties a payment voucher to an individual bill.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-credit-card"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Paid to Suppliers</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(py.Paid,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(py.Paid/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(py.Paid,0) >= 100000',
'             Then ''Rs '' || to_char(Round(py.Paid/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(py.Paid,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">PAYMENT vouchers only in this application</span>''',
'  || ''</span></div>'' As KPI4,',
'  ''<div class="ds-kpi ds-kpi--exc" title="Receipts carrying a rejected ''',
unistr('  || ''quantity. Reported as a COUNT of affected receipts, not a percentage \2014 '''),
'  || ''a rejection rate reads as zero for nearly every vendor and hides the ''',
'  || ''ones that matter.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-times-circle-o"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Receipts with Rejection</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(rj.RejGrns,0),''FM999G999'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">count of affected GRNs, never a rate</span>''',
'  || ''</span></div>'' As KPI5',
'From Deliv dv Cross Join Pay py Cross Join Rej rj'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_LOCATION,P683_PANEL,P683_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No vendor activity in this period and scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15493083035553052)
,p_query_column_id=>1
,p_column_alias=>'KPI1'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('On-time delivery. ORDER grain in this application, not order-line grain \2014 see the page help text.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15493148804553052)
,p_query_column_id=>2
,p_column_alias=>'KPI2'
,p_column_display_sequence=>20
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Late deliveries, complement of on-time over the same measurable population.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15493230273553052)
,p_query_column_id=>3
,p_column_alias=>'KPI3'
,p_column_display_sequence=>30
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Average days between promise and earliest receipt. The card explains a zero-or-below value rather than leaving it puzzling.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15493398386553052)
,p_query_column_id=>4
,p_column_alias=>'KPI4'
,p_column_display_sequence=>40
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Ledger-based paid figure. PAYMENT doc type only in this application.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15493442706553052)
,p_query_column_id=>5
,p_column_alias=>'KPI5'
,p_column_display_sequence=>50
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Rejection reported as a count of affected receipts, never a per-vendor percentage.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15493520455553052)
,p_plug_name=>'Worst Late Deliverers'
,p_static_id=>'vendor-late'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>140
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select * From (',
'  Select GetPartyName(PartyCode) SUPPLIER,',
'         Round(100 * (Orders - OnTime) / Orders, 1) LATE_PCT',
'    From (',
'      Select PartyCode,',
'             Count(*) Orders,',
'             Sum(Case When DeliveryDate >= FirstGrn Then 1 Else 0 End) OnTime',
'        From (',
'          Select o.PartyCode, o.DeliveryDate,',
'                 (Select Min(g.GrnDate) From Grn g',
'                   Where g.PurchaseOrderTNo = o.TNo) FirstGrn',
'            From PurchaseOrder o',
'           Where o.PurchaseOrderDate',
'                 Between to_date(:P683_FROMDATE,''DD-MM-RRRR'')',
'                     And to_date(:P683_TODATE,''DD-MM-RRRR'')',
'             And o.DeliveryDate Is Not Null',
'             And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                  Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'             And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'             And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY))',
'       Where FirstGrn Is Not Null',
'       Group By PartyCode',
'      Having Count(*) >= 10',
'         And Sum(Case When DeliveryDate >= FirstGrn Then 1 Else 0 End)',
'             < Count(*))',
'   Order By (Orders - OnTime) / Orders Desc)',
' Where rownum <= 10'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(15493665214553052)
,p_region_id=>wwv_flow_imp.id(15493520455553052)
,p_chart_type=>'bar'
,p_height=>'380'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No supplier with at least ten scheduled orders delivered late in this period.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(15493743892553052)
,p_chart_id=>wwv_flow_imp.id(15493665214553052)
,p_static_id=>'late'
,p_seq=>10
,p_name=>'Late %'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'LATE_PCT'
,p_items_label_column_name=>'SUPPLIER'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(15493877787553053)
,p_chart_id=>wwv_flow_imp.id(15493665214553052)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(15493964656553053)
,p_chart_id=>wwv_flow_imp.id(15493665214553052)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Late %'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(15494060297553053)
,p_name=>'Purchase Price Movement'
,p_static_id=>'vendor-price'
,p_template=>4072358936313175081
,p_display_sequence=>142
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_new_grid_row=>false
,p_grid_column_span=>8
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P683_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P683_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P683_ITEMGROUP Is Null),',
unistr('-- Realised rate per item, unit and month. Money divided by quantity \2014'),
'-- never an average of the stored Rate column, which mixes rate bases.',
'M As (',
'  Select d.ItemCode,',
'         nvl(d.RateMeasuringUnitCode,''~NONE~'') Uom,',
'         Trunc(h.PurchaseBillDate,''MM'') Mth,',
'         Sum(d.Amount) Amt,',
'         Sum(d.Quantity1) Qty',
'    From PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PurchaseBillDate',
'         Between to_date(:P683_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P683_TODATE,''DD-MM-RRRR'')',
'     And nvl(d.Quantity1,0) > 0',
'     And nvl(d.Amount,0)    > 0',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'     And (:P683_COMPANY  Is Null Or h.CompanyCode  = :P683_COMPANY)',
'     And (:P683_LOCATION Is Null Or h.LocationCode = :P683_LOCATION)',
'     And d.ItemCode In (Select ItemCode From ItemTree)',
'   Group By d.ItemCode, nvl(d.RateMeasuringUnitCode,''~NONE~''),',
'            Trunc(h.PurchaseBillDate,''MM'')),',
'A As (',
'  Select ItemCode, Uom,',
'         Count(*) Months,',
'         Sum(Amt) Spend,',
'         Min(Amt/Qty) KEEP (DENSE_RANK FIRST Order By Mth) FirstRate,',
'         Max(Amt/Qty) KEEP (DENSE_RANK LAST  Order By Mth) LastRate',
'    From M',
'   Group By ItemCode, Uom',
'  Having Count(*) >= 2 And Sum(Amt) >= 5000000)',
'Select * From (',
'  Select',
'    apex_escape.html(nvl((Select i.ItemName From Item i',
'                           Where i.ItemCode = a.ItemCode), a.ItemCode))',
'      || '' <span class="ds-muted">''',
'      || apex_escape.html(nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'                                Where m.MeasuringUnitCode = a.Uom),',
'                              ''no unit'')) || ''</span>'' As ITEM,',
'    Round(a.FirstRate,2) As FIRST_RATE,',
'    Round(a.LastRate,2)  As LAST_RATE,',
'    Round(a.Spend/100000,2) As SPEND_LAC,',
'    -- A RISE is adverse, so it takes the DOWN (red) chip. The business',
'    -- meaning on screen wins over the arithmetic direction of the number.',
'    Case',
'      When a.LastRate > a.FirstRate',
'      Then ''<span class="ds-delta ds-delta--down">&uarr; ''',
'           || to_char(Round(100*(a.LastRate-a.FirstRate)/a.FirstRate,1),''FM99999990D0'')',
'           || ''%</span>''',
'      When a.LastRate < a.FirstRate',
'      Then ''<span class="ds-delta ds-delta--up">&darr; ''',
'           || to_char(Round(100*(a.FirstRate-a.LastRate)/a.FirstRate,1),''FM99999990D0'')',
'           || ''%</span>''',
'      Else ''<span class="ds-delta ds-delta--flat">no change</span>''',
'    End As MOVEMENT,',
'    Abs(a.LastRate - a.FirstRate) / a.FirstRate As SORTKEY',
'  From A a',
' Order By SORTKEY Desc)',
' Where rownum <= 12'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_LOCATION,P683_PANEL,P683_ITEMGROUP'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No item carries material spend across at least two months in this period, so no price movement can be measured.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15494187292553053)
,p_query_column_id=>2
,p_column_alias=>'FIRST_RATE'
,p_column_display_sequence=>20
,p_column_heading=>'First Month'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Realised rate in the earliest month with activity. The mask is as wide as a value mask \2014 a narrow mask renders high-value single-unit items as hashes.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15494272645553053)
,p_query_column_id=>1
,p_column_alias=>'ITEM'
,p_column_display_sequence=>10
,p_column_heading=>'Item and Unit'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Item with its rate unit. One item booked in two units is two rows \2014 rates across units are not comparable.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15494370505553053)
,p_query_column_id=>3
,p_column_alias=>'LAST_RATE'
,p_column_display_sequence=>30
,p_column_heading=>'Last Month'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Realised rate in the most recent month with activity.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15494465490553053)
,p_query_column_id=>5
,p_column_alias=>'MOVEMENT'
,p_column_display_sequence=>50
,p_column_heading=>'Movement'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'A price RISE takes the red chip because it is adverse. Colour follows cost, not the arithmetic sign.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15494507720553053)
,p_query_column_id=>6
,p_column_alias=>'SORTKEY'
,p_column_display_sequence=>60
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_column_comment=>'Absolute proportional movement. Must stay projected so APEX cannot eliminate the ORDER BY.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(15494680227553053)
,p_query_column_id=>4
,p_column_alias=>'SPEND_LAC'
,p_column_display_sequence=>40
,p_column_heading=>'Spend (Rs Lac)'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Total spend on the item and unit pair. The 50-lakh floor keeps trivial items off this report.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15494775338553053)
,p_plug_name=>'Vendor Scorecard'
,p_static_id=>'vendor-scorecard'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>135
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P683_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P683_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'ItemTree As (',
'       Select ItemCode From Item',
'        Where :P683_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P683_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P683_ITEMGROUP Is Null),',
'Val As (',
'  Select h.PartyCode,',
'         Sum(d.Amount) Val,',
'         Count(Distinct h.TNo) Bills,',
'         Count(Distinct d.ItemCode) Items,',
'         Max(h.PurchaseBillDate) LastBill',
'    From PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Cross Join Win w',
'   Where h.PurchaseBillDate Between w.F And w.T',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'     And (:P683_COMPANY  Is Null Or h.CompanyCode  = :P683_COMPANY)',
'     And (:P683_LOCATION Is Null Or h.LocationCode = :P683_LOCATION)',
'     And (:P683_SUPPLIER Is Null Or h.PartyCode    = :P683_SUPPLIER)',
'     And d.ItemCode In (Select ItemCode From ItemTree)',
'   Group By h.PartyCode),',
'Deliv As (',
'  Select PartyCode,',
'         Count(*) Orders,',
'         Sum(Case When DeliveryDate >= FirstGrn Then 1 Else 0 End) OnTime',
'    From (',
'      Select o.PartyCode, o.DeliveryDate,',
'             (Select Min(g.GrnDate) From Grn g',
'               Where g.PurchaseOrderTNo = o.TNo) FirstGrn',
'        From PurchaseOrder o Cross Join Win w',
'       Where o.PurchaseOrderDate Between w.F And w.T',
'         And o.DeliveryDate Is Not Null',
'         And ((Select GetUserPanelAB_apex() From dual) Is Null',
'              Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'         And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'         And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY))',
'   Where FirstGrn Is Not Null',
'   Group By PartyCode),',
'Ful As (',
'  -- Unit-free BY CONSTRUCTION: the PROPORTION OF ORDER LINES fully',
'  -- received. A quantity-based ratio would add incompatible units.',
'  Select o.PartyCode,',
'         Count(*) OrderLines,',
'         Sum(Case When nvl(od.ReceivedQuantity1,0) >= od.Quantity1',
'                  Then 1 Else 0 End) LinesFull',
'    From PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'   Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And nvl(od.Quantity1,0) > 0',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or o.Panel = :P683_PANEL)',
'     And (:P683_COMPANY Is Null Or o.CompanyCode = :P683_COMPANY)',
'   Group By o.PartyCode),',
'Rej As (',
'  Select g.PartyCode, Count(Distinct g.TNo) RejGrns',
'    From Grn g',
'    Join GrnDetail gd On gd.TNo = g.TNo',
'   Cross Join Win w',
'   Where g.GrnDate Between w.F And w.T',
'     And nvl(gd.RejectedQuantity1,0) > 0',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or g.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or g.Panel = :P683_PANEL)',
'     And (:P683_COMPANY Is Null Or g.CompanyCode = :P683_COMPANY)',
'   Group By g.PartyCode),',
'Pss As (',
'  Select h.PartyCode, Sum(p.PBPassAmount) Passed, Sum(p.PaidAmount) PaidAdv',
'    From PBPass p',
'    Join PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Cross Join Win w',
'   Where h.PurchaseBillDate Between w.F And w.T',
'     And ((Select GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'     And (:P683_PANEL Is Null Or h.Panel = :P683_PANEL)',
'     And (:P683_COMPANY Is Null Or h.CompanyCode = :P683_COMPANY)',
'   Group By h.PartyCode)',
'Select',
'  v.PartyCode As PARTYCODE,',
'  GetPartyName(v.PartyCode) As SUPPLIER,',
'  v.Val As PURCHASE_VALUE,',
'  v.Bills As BILLS,',
'  v.Items As ITEMS,',
'  dl.Orders As SCHEDULED_ORDERS,',
'  Case When dl.Orders > 0',
'       Then Round(100 * dl.OnTime / dl.Orders, 1) End As ONTIME_PCT,',
'  Case When dl.Orders > 0',
'       Then Round(100 * (dl.Orders - dl.OnTime) / dl.Orders, 1) End As LATE_PCT,',
'  Case When fl.OrderLines > 0',
'       Then Round(100 * fl.LinesFull / fl.OrderLines, 1) End As FULFIL_PCT,',
'  nvl(rj.RejGrns,0) As REJECTED_RECEIPTS,',
'  ps.Passed As PASSED,',
'  ps.PaidAdv As PAID_VIA_ADVICE,',
'  -- The rating needs a floor: one slip on a single order must not brand a',
'  -- supplier unreliable.',
'  Case',
'    When dl.Orders Is Null Then ''No scheduled order''',
'    When dl.Orders >= 10 And dl.OnTime < dl.Orders * 0.75 Then ''Watch''',
'    When dl.Orders >= 10 And dl.OnTime = dl.Orders Then ''Reliable''',
'    Else ''Normal''',
'  End As DELIVERY_RATING,',
'  v.LastBill As LAST_BILL',
'From Val v',
'Left Join Deliv dl On dl.PartyCode = v.PartyCode',
'Left Join Ful   fl On fl.PartyCode = v.PartyCode',
'Left Join Rej   rj On rj.PartyCode = v.PartyCode',
'Left Join Pss   ps On ps.PartyCode = v.PartyCode',
'Order By v.Val Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P683_FROMDATE,P683_TODATE,P683_COMPANY,P683_LOCATION,P683_PANEL,P683_SUPPLIER,P683_ITEMGROUP'
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
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(15494842275553053)
,p_no_data_found_message=>'No supplier had billing in this period and scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21553907435436314
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15494929820553053)
,p_db_column_name=>'BILLS'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Bills'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'COUNT(DISTINCT PurchaseBill.TNo).'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495078347553054)
,p_db_column_name=>'DELIVERY_RATING'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Delivery Rating'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Requires a floor of 10 scheduled orders before Watch or Reliable can be awarded, so a single slip on a one-off order cannot brand a supplier.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495142292553054)
,p_db_column_name=>'FULFIL_PCT'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Fulfilled %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Proportion of ORDER LINES fully received. Deliberately unit-free \2014 a quantity ratio would add incompatible units.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495203078553054)
,p_db_column_name=>'ITEMS'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Items'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Distinct items billed by this supplier.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495307132553054)
,p_db_column_name=>'LAST_BILL'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Last Bill'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Most recent bill date inside the period.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495497824553054)
,p_db_column_name=>'LATE_PCT'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Late %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Complement of on-time over the same population.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495502281553054)
,p_db_column_name=>'ONTIME_PCT'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'On-Time %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Order grain. Null rather than zero where nothing was measurable \2014 a zero would read as "always late".')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495680795553054)
,p_db_column_name=>'PAID_VIA_ADVICE'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Paid (via advice)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('PBPass.PaidAmount. Labelled with its basis because this column covers only one settlement route \2014 the ledger figure is on the KPI strip above.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495798864553054)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key for the supplier link. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495828614553089)
,p_db_column_name=>'PASSED'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Passed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'SUM(PBPass.PBPassAmount) for bills dated in the period.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15495971372553089)
,p_db_column_name=>'PURCHASE_VALUE'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Purchase Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('SUM(PurchaseBillDetail.Amount). This is the driving measure \2014 a supplier appears here because it billed.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15496083294553089)
,p_db_column_name=>'REJECTED_RECEIPTS'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Rejected Receipts'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Count of affected GRNs, never a rejection rate.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15496142622553089)
,p_db_column_name=>'SCHEDULED_ORDERS'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Scheduled Orders'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Orders carrying BOTH a delivery date and a receipt \2014 the only population on which on-time is measurable. Blank means delivery was never measurable for this supplier.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15496291447553089)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Supplier'
,p_column_link=>'f?p=&APP_ID.:669:&SESSION.::NO:669:P669_SUPPLIER,P669_FROMDATE,P669_TODATE,P669_COMPANY,P669_LOCATION,P669_PANEL:#PARTYCODE#,&P683_FROMDATE.,&P683_TODATE.,&P683_COMPANY.,&P683_LOCATION.,&P683_PANEL.'
,p_column_linktext=>'#SUPPLIER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Drills to Supplier 360 (page 669) carrying the filter context.'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(15496367612553090)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYCODE:SUPPLIER:PURCHASE_VALUE:BILLS:ITEMS:SCHEDULED_ORDERS:ONTIME_PCT:LATE_PCT:FULFIL_PCT:REJECTED_RECEIPTS:PASSED:PAID_VIA_ADVICE:DELIVERY_RATING:LAST_BILL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15498607384553091)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(15488862065553011)
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
 p_id=>wwv_flow_imp.id(15498790198553091)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(15488862065553011)
,p_button_name=>'BACKTOHUB'
,p_static_id=>'back-to-hub'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Purchase Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:668:&SESSION.::&DEBUG.:668:P668_FROMDATE,P668_TODATE,P668_COMPANY,P668_LOCATION,P668_PANEL,P668_SUPPLIER,P668_ITEMGROUP,P668_ITEM:&P683_FROMDATE.,&P683_TODATE.,&P683_COMPANY.,&P683_LOCATION.,&P683_PANEL.,&P683_SUPPLIER.,&P683_ITEMGROUP.,&P683_ITEM.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
,p_grid_column=>6
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15498841400553091)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(15488862065553011)
,p_button_name=>'OPENFILTERS'
,p_static_id=>'open-filters'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'More Filters'
,p_button_redirect_url=>'javascript:apex.theme.openRegion(''p683Drawer'');'
,p_icon_css_classes=>'fa-sliders'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>3
,p_grid_column=>3
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(15498920442553091)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(15491178686553050)
,p_button_name=>'UPDATEVIEW'
,p_static_id=>'update-view'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update View'
,p_icon_css_classes=>'fa-bar-chart'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15496401393553090)
,p_name=>'P683_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(15488862065553011)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From PurchaseBill h',
'                Where h.CompanyCode = c.CompanyCode',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                       Or h.Panel = (Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>5
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Populated from bills rather than the company master, so every entry returns rows.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15496609836553090)
,p_name=>'P683_DIM'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15491178686553050)
,p_item_default=>'SUPPLIER'
,p_prompt=>'Spend Dimension'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Supplier;SUPPLIER,Company;COMPANY,Location;LOCATION,Item;ITEM,Unit of Measure;UOM'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'Department is absent from this list because PurchaseOrder.DepartmentCode could not be verified in this application.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15496876852553090)
,p_name=>'P683_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15488862065553011)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(FinancialYearBegin,''DD-MM-RRRR'')',
'  From FinancialYear',
' Where trunc(sysdate) Between FinancialYearBegin And FinancialYearEnd',
'   And rownum = 1'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_colspan=>2
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Start of the reporting period. Arrives from the Command Centre gateway; otherwise defaults to the start of the current financial year.'
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
 p_id=>wwv_flow_imp.id(15497067451553090)
,p_name=>'P683_GRAIN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15491178686553050)
,p_item_default=>'MM'
,p_prompt=>'Time Grain'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Daily;DD,Weekly;IW,Monthly;MM,Quarterly;Q,Yearly;YYYY'
,p_colspan=>3
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_help_text=>'The stored value is an Oracle format model, passed straight through as the truncation unit, so one query serves all five grains.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15497237585553090)
,p_name=>'P683_ITEM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(15488903900553011)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct i.ItemName || '' ('' || i.ItemCode || '')'' d, i.ItemCode r',
'  From PurchaseBillDetail d',
'  Join Item i On i.ItemCode = d.ItemCode',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All items'
,p_colspan=>12
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Narrows to a single item. Populated from bill lines, so every entry returns rows.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15497478843553090)
,p_name=>'P683_ITEMGROUP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15488903900553011)
,p_prompt=>'Item Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select i.ItemName || '' ('' || i.ItemCode || '')'' d, i.ItemCode r',
'  From Item i',
' Where Exists (Select 1 From Item c Where c.ParentCode = i.ItemCode)',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All item groups'
,p_colspan=>12
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Selects the whole hierarchy beneath the chosen group, not only its immediate children.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15497627597553090)
,p_name=>'P683_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(15488862065553011)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From PurchaseBill fb',
'                Where fb.LocationCode = l.LocationCode',
'                  And (:P683_COMPANY Is Null',
'                       Or fb.CompanyCode = :P683_COMPANY)',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                       Or fb.Panel = (Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P683_COMPANY'
,p_ajax_items_to_submit=>'P683_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Cascades from Company.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15497860348553091)
,p_name=>'P683_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(15488862065553011)
,p_prompt=>'Panel'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:A;A,B;B'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'A + B'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>9
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'GetUserPanelAB_apex() Is Null'
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
 p_id=>wwv_flow_imp.id(15498065947553091)
,p_name=>'P683_SUPPLIER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15488903900553011)
,p_prompt=>'Supplier'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct GetPartyName(h.PartyCode) d, h.PartyCode r',
'  From PurchaseBill h',
' Where ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P683_COMPANY Is Null Or h.CompanyCode = :P683_COMPANY)',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All suppliers'
,p_colspan=>12
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('The concentration curve and the dimension chart deliberately ignore this filter \2014 a Pareto narrowed to one supplier is meaningless.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15498225015553091)
,p_name=>'P683_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15488862065553011)
,p_item_default=>'to_char(trunc(sysdate),''DD-MM-RRRR'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>3
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
 p_id=>wwv_flow_imp.id(15498469139553091)
,p_name=>'P683_XEC_FOCUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(15488903900553011)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER. Holds the executive exception rule id being drilled. Starts empty so the detail region costs nothing until a rule is clicked.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15499010842553091)
,p_name=>'Executive Exception Drill'
,p_static_id=>'xec-drill'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'.ds-xec-drill'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15499104579553091)
,p_event_id=>wwv_flow_imp.id(15499010842553091)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh-detail'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(15487212526553009)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15499226373553091)
,p_event_id=>wwv_flow_imp.id(15499010842553091)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'scroll-to-detail'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'document.getElementById("p683XecDetail")',
    '        .scrollIntoView({ behavior: "smooth", block: "start" });')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15499378320553091)
,p_event_id=>wwv_flow_imp.id(15499010842553091)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'set-focus'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// The rule id travels in data-k, never the rule wording, so a rule can',
    '// be reworded without silently breaking its drill-down.',
    'this.browserEvent.preventDefault();',
    'apex.item("P683_XEC_FOCUS").setValue(this.triggeringElement.dataset.k);')))).to_clob
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
