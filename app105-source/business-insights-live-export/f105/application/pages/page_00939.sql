prompt --application/pages/page_00939
begin
--   Manifest
--     PAGE: 00939
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
 p_id=>939
,p_name=>'Purchase Order 360'
,p_alias=>'PURCHASE-ORDER-360'
,p_step_title=>'Purchase Order 360'
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
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('PURCHASE ORDER 360 \2014 data contract.'),
'',
'A TERMINAL LEAF, DELIBERATELY. Sole key P939_TNO. There is no filter bar, no',
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
'IRONMART DIVERGENCES FROM THE BLUEPRINT (docs/Purchase-Dashboard-FRD.md).',
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
 p_id=>wwv_flow_imp.id(949482886101552971)
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
'  || ''</div></div>'' As HEAD',
'From PCC_PurchaseOrder o',
'Where o.TNo = :P939_TNO',
'  -- Enforcement lives HERE. An out-of-panel order returns no row and the',
'  -- region renders its "not found" message.',
'  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'       Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P939_TNO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Order not found or unavailable in your authorised data scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(949482996945552972)
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
 p_id=>wwv_flow_imp.id(949483097164552972)
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
'    Join PCC_PurchaseOrder o On o.TNo = od.TNo',
'   Where o.TNo = :P939_TNO',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))),',
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
'    From PCC_Grn g',
'   Where g.PurchaseOrderTNo = :P939_TNO',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))),',
'Bil As (',
'  Select Count(Distinct h.TNo) Bills, Sum(d.Amount) Billed',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PurchaseOrderTNo = :P939_TNO',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))),',
'Pss As (',
'  Select Sum(p.PBPassAmount) Passed, Sum(p.PaidAmount) PaidAdv',
'    From PCC_PBPass p',
'    Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Where h.PurchaseOrderTNo = :P939_TNO',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual)))',
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
,p_ajax_items_to_submit=>'P939_TNO'
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
 p_id=>wwv_flow_imp.id(949483132985552972)
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
 p_id=>wwv_flow_imp.id(949483234700553006)
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
 p_id=>wwv_flow_imp.id(949483333791553006)
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
 p_id=>wwv_flow_imp.id(949483470261553006)
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
 p_id=>wwv_flow_imp.id(949483525457553007)
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
 p_id=>wwv_flow_imp.id(949483617493553007)
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
 p_id=>wwv_flow_imp.id(949483755928553007)
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
'From PCC_PurchaseBill h',
'Join PurchaseBillDetail d On d.TNo = h.TNo',
'Left Join PCC_PBPass p On p.PurchaseBillTNo = h.TNo',
'Where h.PurchaseOrderTNo = :P939_TNO',
'  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'       Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'Group By h.PartyBillNo, h.PartyBillDate, h.PurchaseBillDate,',
'         p.PurchaseBillTNo, p.PBPassAmount, p.PaidAmount',
'Order By h.PurchaseBillDate, h.PartyBillNo'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P939_TNO'
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
 p_id=>wwv_flow_imp.id(949483863909553007)
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
 p_id=>wwv_flow_imp.id(949483940578553007)
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
 p_id=>wwv_flow_imp.id(949484007813553007)
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
 p_id=>wwv_flow_imp.id(949484176573553007)
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
 p_id=>wwv_flow_imp.id(949484243717553007)
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
 p_id=>wwv_flow_imp.id(949484364282553007)
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
 p_id=>wwv_flow_imp.id(949484466432553007)
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
 p_id=>wwv_flow_imp.id(949484509251553007)
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
 p_id=>wwv_flow_imp.id(949484619180553007)
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
'From PCC_Grn g',
'Join GrnDetail gd On gd.TNo = g.TNo',
'Where g.PurchaseOrderTNo = :P939_TNO',
'  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'       Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'Group By g.GrnNo, g.GrnDate, g.LocationCode',
'Order By g.GrnDate, g.GrnNo'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P939_TNO'
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
 p_id=>wwv_flow_imp.id(949484790514553007)
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
 p_id=>wwv_flow_imp.id(949484890857553007)
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
 p_id=>wwv_flow_imp.id(949484951607553008)
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
 p_id=>wwv_flow_imp.id(949485017599553008)
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
 p_id=>wwv_flow_imp.id(949485117528553008)
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
 p_id=>wwv_flow_imp.id(949485251172553008)
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
 p_id=>wwv_flow_imp.id(949485368286553008)
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
 p_id=>wwv_flow_imp.id(949485422842553008)
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
'Join PCC_PurchaseOrder o On o.TNo = od.TNo',
'Where o.TNo = :P939_TNO',
'  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'       Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'Order By od.SNo'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P939_TNO'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'This order has no lines or is unavailable in your authorised data scope.'
,p_query_num_rows_type=>'ROW_RANGES_WITH_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(949485575838553008)
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
 p_id=>wwv_flow_imp.id(949485657941553008)
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
 p_id=>wwv_flow_imp.id(949485790396553008)
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
 p_id=>wwv_flow_imp.id(949485813769553008)
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
 p_id=>wwv_flow_imp.id(949485920450553008)
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
 p_id=>wwv_flow_imp.id(949486059358553008)
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
 p_id=>wwv_flow_imp.id(949486189283553008)
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
 p_id=>wwv_flow_imp.id(949486251397553008)
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
 p_id=>wwv_flow_imp.id(949486317622553008)
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
 p_id=>wwv_flow_imp.id(949486441892553008)
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
 p_id=>wwv_flow_imp.id(949486540581553008)
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
 p_id=>wwv_flow_imp.id(949486693211553009)
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
 p_id=>wwv_flow_imp.id(949486725542553009)
,p_name=>'P939_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(949482886101552971)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>unistr('The order''s internal key, arriving from the Orders report on Supplier 360. It is never displayed \2014 the order is identified on screen by its own business number.')
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
