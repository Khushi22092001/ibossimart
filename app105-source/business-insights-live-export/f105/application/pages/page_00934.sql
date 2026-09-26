prompt --application/pages/page_00934
begin
--   Manifest
--     PAGE: 00934
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
 p_id=>934
,p_name=>'Purchase Command Centre'
,p_alias=>'PURCHASE-COMMAND-CENTRE'
,p_step_title=>'Purchase Command Centre'
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
unistr('PURCHASE COMMAND CENTRE \2014 data contract.'),
'',
'VALUE GRAIN. Every value figure on this page is SUM(PurchaseBillDetail.Amount)',
unistr('\2014 the bill LINE, not the bill header. PurchaseBill carries footer tax'),
'(FooterAmount / TotalAmount); the line Amount is the taxable purchase value and',
'is what reconciles to the Purchase Bill Register (page 73). Never mix the two.',
'',
'PANEL SECURITY. Every region repeats the panel predicate in the scalar-subquery',
'form:',
'    ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or x.Panel = (Select ...))',
'This DIVERGES DELIBERATELY from the older IRONMART registers (e.g. page 27), which',
'call SAGAR.GetUserPanelAB_apex() bare in the predicate. That function is not',
'DETERMINISTIC and runs two SQL statements plus a session lookup per call; as a',
'bare per-row predicate it was measured at 17.702 s against 0.068 s for the',
'scalar-subquery form over 98,000 rows. Do not "tidy" this back to the bare call.',
'',
'Two predicates are used, not one. The first is ENFORCEMENT (what this login may',
'see); the second (:P934_PANEL) is USER CHOICE. A panel-bound login cannot widen',
'its own scope, because the enforcement predicate does not depend on the item.',
'',
'UNIT OF MEASURE. Bill lines are booked in several incompatible units. Quantity is',
unistr('reported per unit or not at all \2014 it is never summed across units.'),
'',
'NOT QUANTIFIABLE. Where the ERP holds no value, regions emit NULL and render',
'"not quantifiable", never a zero. A zero reads as "nothing at stake"; the truth is',
'"this cannot be measured here".',
'',
'READ-ONLY. Every region on this page is a SELECT. This page performs no INSERT,',
'UPDATE, DELETE or MERGE of any kind.',
'',
'SCHEMA VERIFICATION STATUS (14-08-2026). The columns used here were corroborated',
unistr('against this repository''s own SQL \2014 PurchaseBillDetail.Amount/Quantity1/Rate/'),
'RateMeasuringUnitCode/ItemSpecificationCode from page 73, PBPass.PurchaseBillTNo/',
'PBPassAmount/PaidAmount from pages 73 and 426, GetUserPanelAB_apex from 79 pages.',
'The following were NOT corroborated anywhere in this repository and are therefore',
'NOT used on this page: PartyCurrentClosing (owed-to-suppliers ledger snapshot),',
'PurchaseOrderDetail.PurchaseBillQuantity1, PBPass.PaidInAdvance,',
'InwardOrder.BrokerAccountCode, PurchaseOrder.ComparativeStatementTno, and the',
'CASHPAYMENT / BANKPAYMENT voucher doc-type codes. See',
'docs/Purchase-Dashboard-FRD.md and the build note in docs/ before adding them.'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955521516553436163)
,p_name=>'Purchase Analytics'
,p_static_id=>'analytics-gateway'
,p_template=>4501440665235496320
,p_display_sequence=>108
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  ''<a class="ds-gateway" href="''',
'  || apex_page.get_url(',
'       p_page        => 940,',
'       p_clear_cache => ''940'',',
'       p_items       => ''P940_FROMDATE,P940_TODATE,P940_COMPANY,P940_LOCATION,P940_PANEL,P940_SUPPLIER,P940_ITEM,P940_ITEMGROUP'',',
'       p_values      =>    :P934_FROMDATE ||'',''|| :P934_TODATE',
'                    ||'',''|| :P934_COMPANY  ||'',''|| :P934_LOCATION',
'                    ||'',''|| :P934_PANEL    ||'',''|| :P934_SUPPLIER',
'                    ||'',''|| :P934_ITEM     ||'',''|| :P934_ITEMGROUP)',
'  || ''">''',
'  || ''<span class="ds-gateway-ic"><span class="fa fa-line-chart"></span></span>''',
'  || ''<span class="ds-gateway-body">''',
'  || ''<span class="ds-gateway-t">Purchase Analytics</span>''',
'  || ''<span class="ds-gateway-d">Spend by grain and dimension, vendor ''',
'  || ''scorecard, realised price movement and the executive exception ''',
'  || ''register. Opens already scoped to the filters above.</span>''',
'  || ''</span>''',
'  || ''<span class="ds-gateway-go"><span class="fa fa-chevron-right"></span></span>''',
'  || ''</a>'' As GATEWAY',
'From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER,P934_ITEMGROUP,P934_ITEM'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Analytics gateway unavailable.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955521615115436163)
,p_query_column_id=>1
,p_column_alias=>'GATEWAY'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Call-to-action into page 683, carrying eight filter items in the URL so the target opens already scoped.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955519764429436162)
,p_plug_name=>'Purchase Bills'
,p_static_id=>'bill-register'
,p_region_name=>'p668BillReg'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>105
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P934_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P934_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P934_ITEMGROUP Is Null),',
'Lines As (',
'  Select h.TNo, h.PurchaseBillNo, h.PurchaseBillDate,',
'         h.PartyBillNo, h.PartyBillDate,',
'         h.PartyCode, h.LocationCode, h.Panel,',
'         Sum(d.Amount) LineVal,',
'         Count(*) Lines,',
'         Count(Distinct d.ItemCode) Items',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PurchaseBillDate',
'         Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'     And (:P934_ITEM     Is Null Or d.ItemCode     = :P934_ITEM)',
'     And d.ItemCode In (Select ItemCode From ItemTree)',
'   Group By h.TNo, h.PurchaseBillNo, h.PurchaseBillDate,',
'            h.PartyBillNo, h.PartyBillDate,',
'            h.PartyCode, h.LocationCode, h.Panel)',
'Select',
'  l.PartyCode As PARTYCODE,',
'  l.TNo As BILL_TNO,',
'  -- The company''s OWN bill number, distinct from the supplier''s below.',
'  l.PurchaseBillNo As BILL_NO,',
'  GetPartyName(l.PartyCode) As SUPPLIER,',
'  l.PartyBillNo As SUPPLIER_BILL_NO,',
'  l.PartyBillDate As SUPPLIER_BILL_DATE,',
'  l.PurchaseBillDate As BOOKED_ON,',
'  GetLocationName(l.LocationCode) As LOCATION,',
'  l.Lines As LINES,',
'  l.Items As ITEMS,',
'  l.LineVal As LINE_VALUE,',
'  p.PBPassAmount As PASSED,',
'  p.PaidAmount As PAID,',
'  -- The middle branch is named "No advice settlement" rather than "Unpaid":',
'  -- PaidAmount is only written for one settlement route, so an unpaid label',
'  -- would assert more than the column can support.',
'  Case When p.PurchaseBillTNo Is Null                   Then ''Not passed''',
'       When nvl(p.PaidAmount,0) = 0                     Then ''No advice settlement''',
'       When nvl(p.PaidAmount,0) >= nvl(p.PBPassAmount,0) Then ''Paid''',
'       Else ''Part paid'' End As POSITION,',
'  -- The ledger voucher raised when the bill was passed. Wrapped in Max()',
'  -- so the scalar subquery cannot multiply the row even if more than one',
'  -- voucher were ever posted against the same pass. Blank where the bill has',
'  -- not been passed, or where the pass has not yet posted to the ledger.',
'  (Select Max(v.VoucherNo) From PCC_Voucher v',
'    Where v.ModuleCode = ''PBPASS''',
'      And v.ModuleTNo  = p.TNo) As VOUCHER_NO,',
'  l.Panel As PANEL',
'From Lines l',
'Left Join PCC_PBPass p On p.PurchaseBillTNo = l.TNo',
'Order By l.PurchaseBillDate Desc, l.PartyBillNo'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER,P934_ITEMGROUP,P934_ITEM'
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
 p_id=>wwv_flow_imp.id(955519879045436163)
,p_no_data_found_message=>'No purchase bills were booked in this period and scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21519879045436163
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520268333436163)
,p_db_column_name=>'BILL_NO'
,p_display_order=>15
,p_column_identifier=>'D'
,p_column_label=>'Bill No'
,p_column_link=>'f?p=&APP_ID.:937:&APP_SESSION.::NO:937:P937_TNO:#BILL_TNO#'
,p_column_linktext=>'#BILL_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('The company''s own purchase-bill number. Distinct from the supplier''s bill number beside it \2014 both are business numbers, and neither is the internal TNo.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520137627436163)
,p_db_column_name=>'BILL_TNO'
,p_display_order=>6
,p_column_identifier=>'C'
,p_column_label=>'Bill Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key to Purchase Bill 360. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520570688436163)
,p_db_column_name=>'BOOKED_ON'
,p_display_order=>40
,p_column_identifier=>'G'
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
 p_id=>wwv_flow_imp.id(955520813073436163)
,p_db_column_name=>'ITEMS'
,p_display_order=>70
,p_column_identifier=>'J'
,p_column_label=>'Items'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Distinct items on the bill.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520780195436163)
,p_db_column_name=>'LINES'
,p_display_order=>60
,p_column_identifier=>'I'
,p_column_label=>'Lines'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Bill line count at the value grain.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520982299436163)
,p_db_column_name=>'LINE_VALUE'
,p_display_order=>80
,p_column_identifier=>'K'
,p_column_label=>'Line Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('SUM(PurchaseBillDetail.Amount) \2014 taxable, excludes footer tax. Summing this column reproduces the Total Purchase Value KPI exactly. This is the reconciliation anchor.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520640797436163)
,p_db_column_name=>'LOCATION'
,p_display_order=>50
,p_column_identifier=>'H'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Location that booked the bill.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955521184860436163)
,p_db_column_name=>'PAID'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Paid (via advice)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('PBPass.PaidAmount. Labelled "via advice" because this column is only written for one settlement route \2014 the ledger figure is on the KPI strip.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955521406678436163)
,p_db_column_name=>'PANEL'
,p_display_order=>120
,p_column_identifier=>'P'
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
 p_id=>wwv_flow_imp.id(955519971419436163)
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
 p_id=>wwv_flow_imp.id(955521098056436163)
,p_db_column_name=>'PASSED'
,p_display_order=>90
,p_column_identifier=>'L'
,p_column_label=>'Passed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'PBPass.PBPassAmount. Null where the bill has not been passed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955521269773436163)
,p_db_column_name=>'POSITION'
,p_display_order=>110
,p_column_identifier=>'N'
,p_column_label=>'Position'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Derived settlement position. "No advice settlement" is used instead of "Unpaid" because the underlying column covers only one settlement route.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520099358436163)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Supplier'
,p_column_link=>'f?p=&APP_ID.:935:&APP_SESSION.::NO:935:P935_SUPPLIER,P935_FROMDATE,P935_TODATE,P935_COMPANY,P935_LOCATION,P935_PANEL:#PARTYCODE#,&P934_FROMDATE.,&P934_TODATE.,&P934_COMPANY.,&P934_LOCATION.,&P934_PANEL.'
,p_column_linktext=>'#SUPPLIER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Supplier name, drilling to Supplier 360 with the filter context.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520410861436163)
,p_db_column_name=>'SUPPLIER_BILL_DATE'
,p_display_order=>30
,p_column_identifier=>'F'
,p_column_label=>'Supplier Bill Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Date on the supplier''s invoice, which may differ from the booking date.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955520353944436163)
,p_db_column_name=>'SUPPLIER_BILL_NO'
,p_display_order=>20
,p_column_identifier=>'E'
,p_column_label=>'Supplier Bill No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('The supplier''s OWN bill number (PartyBillNo) \2014 never the internal TNo.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955521309008436163)
,p_db_column_name=>'VOUCHER_NO'
,p_display_order=>115
,p_column_identifier=>'O'
,p_column_label=>'Voucher No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Ledger voucher raised on bill pass. Blank means the bill has not been passed, or the pass has not posted \2014 it does NOT mean the bill is unpaid.')
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(956299170910724611)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PARTYCODE:BILL_TNO:SUPPLIER:BILL_NO:SUPPLIER_BILL_NO:SUPPLIER_BILL_DATE:BOOKED_ON:LOCATION:LINES:ITEMS:LINE_VALUE:PASSED:PAID:POSITION:VOUCHER_NO'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955517475517436135)
,p_name=>'Broker and Agent Coverage'
,p_static_id=>'broker-coverage'
,p_template=>4072358936313175081
,p_display_sequence=>87
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'Ord As (',
'  Select Count(*) Orders,',
'         Count(o.AgentCode) WithAgent,',
'         Count(Distinct o.AgentCode) DistinctAgents,',
'         Count(Case When nvl(o.CommissionRate,0) <> 0 Then 1 End) WithRate',
'    From PCC_PurchaseOrder o Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or o.CompanyCode = :P934_COMPANY))',
'Select 10 Seq,',
'       ''Gate entries through a broker'' As MEASURE,',
'       ''<span class="ds-muted">not recorded</span>'' As COVERAGE,',
'       ''<span class="ds-muted">&mdash;</span>'' As SHARE_BAR,',
'       ''MaterialIn carries no broker column in this ERP'' As MEASURED_FROM',
'  From dual',
'Union All',
'Select 20, ''Purchase orders carrying a commission rate'',',
'       to_char(WithRate,''FM999G999G990'') || '' of ''',
'       || to_char(Orders,''FM999G999G990''),',
'       ''<span class="ds-sharecell"><span class="ds-bar ds-bar--amber"><i style="width:''',
'       || to_char(Round(100*WithRate/Nullif(Orders,0),1),''FM99999990D0'')',
'       || ''%"></i></span><b>''',
'       || to_char(Round(100*WithRate/Nullif(Orders,0),1),''FM99999990D0'')',
'       || ''%</b></span>'',',
unistr('       ''PurchaseOrder.CommissionRate \2014 a rate only, no amount is stored'''),
'  From Ord',
'Union All',
'Select 30, ''Purchase orders naming an agent'',',
'       to_char(WithAgent,''FM999G999G990'') || '' of ''',
'       || to_char(Orders,''FM999G999G990''),',
'       ''<span class="ds-sharecell"><span class="ds-bar ds-bar--blue"><i style="width:''',
'       || to_char(Round(100*WithAgent/Nullif(Orders,0),1),''FM99999990D0'')',
'       || ''%"></i></span><b>''',
'       || to_char(Round(100*WithAgent/Nullif(Orders,0),1),''FM99999990D0'')',
'       || ''%</b></span>'',',
unistr('       ''PurchaseOrder.AgentCode \2014 '''),
'       || Case When DistinctAgents <= 1',
'               Then ''only '' || to_char(DistinctAgents)',
'                    || '' distinct code in use, so this is a placeholder, ''',
'                    || ''not real attribution''',
'               Else to_char(DistinctAgents) || '' distinct codes in use'' End',
'  From Ord',
' Order By 1'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No purchase orders were raised in this period and scope.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955517780405436135)
,p_query_column_id=>3
,p_column_alias=>'COVERAGE'
,p_column_display_sequence=>20
,p_column_heading=>'Coverage'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'"n of N" rather than a bare percentage, so the reader sees the population the share is drawn from.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955517694954436135)
,p_query_column_id=>2
,p_column_alias=>'MEASURE'
,p_column_display_sequence=>10
,p_column_heading=>'Measure'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'What is being counted. Deliberately phrased as coverage, never as brokerage value.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955517958339436135)
,p_query_column_id=>5
,p_column_alias=>'MEASURED_FROM'
,p_column_display_sequence=>40
,p_column_heading=>'Measured From'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Names the exact source column, and flags the agent column as a placeholder whenever only one distinct code is in use \2014 a high coverage figure from a single repeated code is not attribution.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955517566552436135)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_column_comment=>'Row order. Must stay projected so APEX cannot eliminate the ORDER BY.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955517800487436135)
,p_query_column_id=>4
,p_column_alias=>'SHARE_BAR'
,p_column_display_sequence=>30
,p_column_heading=>'Share'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Renders an em-dash for the broker row, because that column does not exist here at all \2014 an empty bar would read as zero coverage rather than no data.')
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(966092524076763796)
,p_name=>'Purchase Value by Item Category'
,p_static_id=>'category-spend'
,p_template=>4072358936313175081
,p_display_sequence=>54
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>6
,p_display_column=>1
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With chart_q As (',
'/* Item Category is an IRONMART master dimension. Billed purchase value by category',
'   for the selected period/scope. */',
'Select CATEGORY, CATCODE, VALUE_LAC',
'  From (Select Case When i.ItemCategoryCode Is Null Then ''Uncategorised''',
'                    Else nvl(GetItemCategoryName(i.ItemCategoryCode), i.ItemCategoryCode) End CATEGORY,',
'               nvl(i.ItemCategoryCode,'''') CATCODE,',
'               Round(Sum(d.Amount)/100000,2) VALUE_LAC',
'          From PCC_PurchaseBill h',
'          Join PurchaseBillDetail d On d.TNo = h.TNo',
'          Left Join Item i On i.ItemCode = d.ItemCode',
'         Where h.PurchaseBillDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'           And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'           And (:P934_PANEL    Is Null Or h.Panel        = :P934_PANEL)',
'           And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'           And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'           And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'         Group By i.ItemCategoryCode',
'        Having Sum(d.Amount) > 0)',
' Order By VALUE_LAC Desc',
')',
'Select',
'  ''<div class="ds-svgdonut" data-chart-type="donut" data-total-label="Rs lakh" data-filter-item="P934_ITEMGROUP" data-refresh-target="p668BillReg" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.CATEGORY), ''v'' value q.VALUE_LAC, ''k'' value q.CATCODE returning clob)',
'                  order by q.VALUE_LAC Desc returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082805)
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
 p_id=>wwv_flow_imp.id(955503712290436075)
,p_name=>'Purchase Command Centre'
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
'                  ''<div class="ds-hero">''',
'                  || ''<div class="ds-hero-row">''',
'                  || ''<span class="ds-hero-icon"><span class="fa fa-shopping-cart"></span></span>''',
'                  || ''<span class="ds-hero-text">''',
'                  || ''<span class="ds-hero-eyebrow">Procurement Intelligence</span>''',
'                  || ''<span class="ds-hero-title">Purchase Command Centre</span>''',
'                  || ''<span class="ds-hero-sub">Gain complete visibility across the ''',
'                  || ''purchase-to-pay chain. Track, analyse and act on procurement metrics ''',
'                  || ''in real time.</span>''',
'                  || ''<a class="ds-hero-cta" href="'' || apex_page.get_url(',
'                       p_page        => 940,',
'                       p_clear_cache => ''940'',',
'                       p_items       => ''P940_FROMDATE,P940_TODATE,P940_COMPANY,P940_LOCATION,P940_PANEL,P940_SUPPLIER,P940_ITEM,P940_ITEMGROUP'',',
'                       p_values      =>    :P934_FROMDATE ||'',''|| :P934_TODATE',
'                                    ||'',''|| :P934_COMPANY  ||'',''|| :P934_LOCATION',
'                                    ||'',''|| :P934_PANEL    ||'',''|| :P934_SUPPLIER',
'                                    ||'',''|| :P934_ITEM     ||'',''|| :P934_ITEMGROUP)',
'                     || ''">Purchase Analytics <span class="fa fa-arrow-right"></span></a>''',
'                  || ''</span></div>''',
'                  || ''<div class="ds-hero-art"></div>''',
'                  || ''<div class="ds-hero-chips">''',
'                  || ''<span class="ds-chip"><span class="fa fa-calendar ds-chip-ic"></span>''',
'                     || ''<span class="ds-chip-k">Period</span><b>''',
'                     || apex_escape.html(:P934_FROMDATE) || '' &ndash; ''',
'                     || apex_escape.html(:P934_TODATE) || ''</b>''',
'                     || ''<i class="ds-chip-sub">''',
'                     || to_char(to_date(:P934_TODATE,''DD-MM-RRRR'')',
'                             - to_date(:P934_FROMDATE,''DD-MM-RRRR'') + 1) || '' days</i></span>''',
'                  || ''<span class="ds-chip"><span class="fa fa-building-o ds-chip-ic"></span>''',
'                     || ''<span class="ds-chip-k">Company</span><b>''',
'                     || apex_escape.html(nvl(GetCompanyName(:P934_COMPANY),''All companies''))',
'                     || ''</b></span>''',
'                  || ''<span class="ds-chip"><span class="fa fa-map-marker ds-chip-ic"></span>''',
'                     || ''<span class="ds-chip-k">Location</span><b>''',
'                     || apex_escape.html(nvl(GetLocationName(:P934_LOCATION),''All locations''))',
'                     || ''</b></span>''',
'                  || Case When :P934_SUPPLIER Is Not Null',
'                          Then ''<span class="ds-chip"><span class="fa fa-user-o ds-chip-ic"></span>''',
'                               || ''<span class="ds-chip-k">Supplier</span><b>''',
'                               || apex_escape.html(GetPartyName(:P934_SUPPLIER)) || ''</b></span>''',
'                          Else '''' End',
'                  || Case When :P934_ITEMGROUP Is Not Null',
'                          Then ''<span class="ds-chip"><span class="fa fa-sitemap ds-chip-ic"></span>''',
'                               || ''<span class="ds-chip-k">Item group</span><b>''',
'                               || apex_escape.html(:P934_ITEMGROUP) || ''</b></span>''',
'                          Else '''' End',
'                  || Case When :P934_ITEM Is Not Null',
'                          Then ''<span class="ds-chip"><span class="fa fa-cube ds-chip-ic"></span>''',
'                               || ''<span class="ds-chip-k">Item</span><b>''',
'                               || apex_escape.html(:P934_ITEM) || ''</b></span>''',
'                          Else '''' End',
'                  || ''<span class="ds-chip ds-chip--live"><span class="fa fa-calendar-check-o ds-chip-ic"></span>''',
'                     || ''<span class="ds-chip-k">Bills as of</span><b>''',
'                     || apex_escape.html(nvl(to_char(',
'                          (Select Max(h.PurchaseBillDate) From PCC_PurchaseBill h',
'                            Where ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                                   Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))),',
'                          ''DD-Mon-RRRR''),''no bills visible''))',
'                     || ''</b></span>''',
'                  || ''</div></div>'' As HEAD',
'                From dual',
'                '))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER,P934_ITEMGROUP,P934_ITEM'
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
 p_id=>wwv_flow_imp.id(955503889466436075)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Whole command header rendered as one HTML string. Data is escaped with apex_escape.html(); entities are concatenated outside that call.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955518897554436136)
,p_plug_name=>'Documents Behind the Exception'
,p_static_id=>'exception-detail'
,p_region_name=>'p668ExcDetail'
,p_region_css_classes=>'ds-register ds-exc-detailwrap'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>96
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual)',
unistr('-- RULE 10 \2014 bill booked but never passed.'),
'Select h.PurchaseBillNo As DOCUMENT_NO,',
'       h.PurchaseBillDate As DOCUMENT_DATE,',
'       GetPartyName(h.PartyCode) As PARTY,',
'       GetLocationName(h.LocationCode) As LOCATION,',
'       ''Purchase Bill'' As DOCUMENT_TYPE,',
'       Round(Sum(d.Amount) / 100000, 2) As VALUE_LAC',
'  From PCC_PurchaseBill h',
'  Join PurchaseBillDetail d On d.TNo = h.TNo',
' Cross Join Win w',
' Where :P934_EXC_FOCUS = ''10''',
'   And h.PurchaseBillDate Between w.F And w.T',
'   And Not Exists (Select 1 From PCC_PBPass p Where p.PurchaseBillTNo = h.TNo)',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'   And (:P934_SUPPLIER Is Null Or h.PartyCode  = :P934_SUPPLIER)',
' Group By h.PurchaseBillNo, h.PurchaseBillDate, h.PartyCode, h.LocationCode',
'Union All',
unistr('-- RULE 20 \2014 paid more than passed.'),
'Select p.PBPassNo, p.PBPassDate, GetPartyName(h.PartyCode),',
'       GetLocationName(h.LocationCode), ''Bill Pass'',',
'       Round((p.PaidAmount - p.PBPassAmount) / 100000, 2)',
'  From PCC_PBPass p',
'  Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
' Cross Join Win w',
' Where :P934_EXC_FOCUS = ''20''',
'   And h.PurchaseBillDate Between w.F And w.T',
'   And nvl(p.PaidAmount,0) > nvl(p.PBPassAmount,0)',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'Union All',
unistr('-- RULE 30 \2014 passed, no settlement recorded on the bill.'),
'-- NOTE: the register does NOT filter this rule by supplier, so neither does',
'-- this branch. The drill must never be shorter than the count.',
'Select p.PBPassNo, p.PBPassDate, GetPartyName(h.PartyCode),',
'       GetLocationName(h.LocationCode), ''Bill Pass'',',
'       Round(p.PBPassAmount / 100000, 2)',
'  From PCC_PBPass p',
'  Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
' Cross Join Win w',
' Where :P934_EXC_FOCUS = ''30''',
'   And h.PurchaseBillDate Between w.F And w.T',
'   And nvl(p.PaidAmount,0) = 0',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'Union All',
unistr('-- RULE 40 \2014 goods received, no bill. VALUE_LAC is NULL, not zero.'),
'Select g.GrnNo, g.GrnDate, GetPartyName(g.PartyCode),',
'       GetLocationName(g.LocationCode), ''GRN'', Null',
'  From PCC_Grn g Cross Join Win w',
' Where :P934_EXC_FOCUS = ''40''',
'   And g.GrnDate Between w.F And w.T',
'   And Not Exists (Select 1 From PurchaseBillGRNDetail pg',
'                    Where pg.GRNTno = g.TNo)',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or g.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or g.CompanyCode = :P934_COMPANY)',
'Union All',
unistr('-- RULE 50 \2014 receipts with a rejected quantity.'),
'Select g.GrnNo, g.GrnDate, GetPartyName(g.PartyCode),',
'       GetLocationName(g.LocationCode), ''GRN'', Null',
'  From PCC_Grn g Cross Join Win w',
' Where :P934_EXC_FOCUS = ''50''',
'   And g.GrnDate Between w.F And w.T',
'   And Exists (Select 1 From GrnDetail gd',
'                Where gd.TNo = g.TNo And nvl(gd.RejectedQuantity1,0) > 0)',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or g.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or g.CompanyCode = :P934_COMPANY)',
'Union All',
unistr('-- RULE 60 \2014 material in, receipt never prepared. Predicates repeated'),
'-- from the register verbatim, including the date window, so this drill can',
'-- never be shorter than the count that opened it.',
'Select mi.MaterialInNo, mi.MaterialInDate,',
'       nvl(mi.VehicleNo,''no vehicle recorded''),',
'       GetLocationName(mi.LocationCode),',
'       ''Material In (no GRN prepared)'', Null',
'  From PCC_MaterialIn mi Cross Join Win w',
' Where :P934_EXC_FOCUS = ''60''',
'   And mi.MaterialInDate Between w.F And w.T',
'   And nvl(mi.IsGrnPrepared,''NO'') <> ''YES''',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or mi.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or mi.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or mi.CompanyCode = :P934_COMPANY)',
'Union All',
unistr('-- RULE 70 \2014 enquiry with no quotation.'),
'Select e.EnquiryNo, e.EnquiryDate, nvl(e.Subject,''no subject recorded''),',
'       GetLocationName(e.LocationCode), ''Enquiry'', Null',
'  From PCC_Enquiry e Cross Join Win w',
' Where :P934_EXC_FOCUS = ''70''',
'   And e.EnquiryDate Between w.F And w.T',
'   And Not Exists (Select 1 From PCC_Quotation q Where q.EnquiryTno = e.TNo)',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or e.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or e.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or e.CompanyCode = :P934_COMPANY)',
'Union All',
unistr('-- RULE 80 \2014 order raised with no credit terms.'),
'Select o.PurchaseOrderNo, o.PurchaseOrderDate,',
'       GetPartyName(o.PartyCode), GetLocationName(o.LocationCode),',
'       ''Purchase Order'', Round(Sum(od.Amount)/100000, 2)',
'  From PCC_PurchaseOrder o',
'  Join PurchaseOrderDetail od On od.TNo = o.TNo',
' Cross Join Win w',
' Where :P934_EXC_FOCUS = ''80''',
'   And o.PurchaseOrderDate Between w.F And w.T',
'   And nvl(o.CreditDays,0) = 0',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or o.CompanyCode = :P934_COMPANY)',
'   And (:P934_SUPPLIER Is Null Or o.PartyCode  = :P934_SUPPLIER)',
' Group By o.PurchaseOrderNo, o.PurchaseOrderDate, o.PartyCode, o.LocationCode',
'Union All',
unistr('-- RULE 90 \2014 open order not fully received.'),
'Select o.PurchaseOrderNo, o.PurchaseOrderDate,',
'       GetPartyName(o.PartyCode), GetLocationName(o.LocationCode),',
'       ''Purchase Order'',',
'       Round(Sum(od.Amount * (od.Quantity1',
'         - Least(nvl(od.ReceivedQuantity1,0), od.Quantity1))',
'         / od.Quantity1) / 100000, 2)',
'  From PCC_PurchaseOrder o',
'  Join PurchaseOrderDetail od On od.TNo = o.TNo',
' Cross Join Win w',
' Where :P934_EXC_FOCUS = ''90''',
'   And o.PurchaseOrderDate Between w.F And w.T',
'   And nvl(od.Quantity1,0) > 0',
'   And nvl(od.ReceivedQuantity1,0) < od.Quantity1',
'   And Not Exists (Select 1 From PurchaseOrderClose poc',
'                    Where poc.PurchaseOrderTNo = o.TNo)',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or o.CompanyCode = :P934_COMPANY)',
'   And (:P934_SUPPLIER Is Null Or o.PartyCode  = :P934_SUPPLIER)',
' Group By o.PurchaseOrderNo, o.PurchaseOrderDate, o.PartyCode, o.LocationCode'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_EXC_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL,P934_SUPPLIER'
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
 p_id=>wwv_flow_imp.id(955518960243436136)
,p_max_row_count=>'100000'
,p_no_data_found_message=>'Pick a count in the Exception Register above to list the documents behind it.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21518960243436136
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955519125175436136)
,p_db_column_name=>'DOCUMENT_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Document date, as recorded on the source document.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955519013658436136)
,p_db_column_name=>'DOCUMENT_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Document No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'The document''s own business number. Internal TNo values are never shown.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955519412996436162)
,p_db_column_name=>'DOCUMENT_TYPE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Document Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Which document the branch returned, so mixed result sets stay readable.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955519374575436162)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Location that owns the document.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955519270717436162)
,p_db_column_name=>'PARTY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Party / Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Supplier for bill and GRN rules; vehicle or subject for the gate and enquiry rules.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955519534805436162)
,p_db_column_name=>'VALUE_LAC'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Value (Rs Lac)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('NULL \2014 not zero \2014 on rules the ERP cannot quantify. Summing this column reproduces the register''s Value at Stake for the quantifiable rules.')
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(956298603107724610)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DOCUMENT_NO:DOCUMENT_DATE:PARTY:LOCATION:DOCUMENT_TYPE:VALUE_LAC'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955518152852436135)
,p_name=>'Exception Register'
,p_static_id=>'exceptions'
,p_template=>4072358936313175081
,p_display_sequence=>95
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'Rules As (',
unistr('  -- 10. HIGH \2014 bill booked but never passed.'),
'  Select 10 Seq, ''HIGH'' Sev,',
'         ''Bill booked but never passed'' Rule,',
'         Count(Distinct h.TNo) Items,',
'         Sum(d.Amount) Val,',
'         ''The liability is on the books but has not been approved, so it is ''',
'         || ''not yet in the ledger.'' Impact',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Cross Join Win w',
'   Where h.PurchaseBillDate Between w.F And w.T',
'     And Not Exists (Select 1 From PCC_PBPass p Where p.PurchaseBillTNo = h.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'     And (:P934_SUPPLIER Is Null Or h.PartyCode  = :P934_SUPPLIER)',
'  Union All',
unistr('  -- 20. HIGH \2014 paid more than the passed amount.'),
'  Select 20, ''HIGH'',',
'         ''Paid more than the passed amount'',',
'         Count(*), Sum(p.PaidAmount - p.PBPassAmount),',
'         ''Settlement exceeds the approved figure on these bills.''',
'    From PCC_PBPass p',
'    Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Cross Join Win w',
'   Where h.PurchaseBillDate Between w.F And w.T',
'     And nvl(p.PaidAmount,0) > nvl(p.PBPassAmount,0)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'  Union All',
unistr('  -- 30. MEDIUM \2014 passed with no settlement recorded ON THE BILL.'),
'  -- The impact text is a SENTENCE, not a number: PaidAmount is only written',
'  -- for one settlement route, so a rupee figure here would assert more than',
'  -- the data supports. Company-level truth is on the KPI strip.',
'  Select 30, ''MEDIUM'',',
'         ''Passed with no settlement recorded on the bill'',',
'         Count(*), Sum(p.PBPassAmount),',
'         ''No advice settlement against these bills. They may still have been ''',
unistr('         || ''paid by direct voucher \2014 check the supplier ledger.'''),
'    From PCC_PBPass p',
'    Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Cross Join Win w',
'   Where h.PurchaseBillDate Between w.F And w.T',
'     And nvl(p.PaidAmount,0) = 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'  Union All',
unistr('  -- 40. MEDIUM \2014 goods received but no purchase bill. NOT QUANTIFIABLE:'),
'  -- GrnDetail carries no value in this ERP, so there is no exposure figure.',
'  -- Now QUANTIFIED: the receipt is priced from its order line, the same',
'  -- way the GRN Receipts card is. Receipts with no traceable order still',
'  -- contribute to the count but not to the value, so this is a floor.',
'  Select 40, ''MEDIUM'',',
'         ''Goods received but no purchase bill'',',
'         Count(Distinct g.TNo),',
'         Sum(gd.Amount),',
'         ''Stock taken in with no supplier invoice against it. Stored GRN line amounts; each receipt line is counted once.''',
'    From PCC_Grn g',
'    Join GrnDetail gd On gd.TNo = g.TNo',
'   Cross Join Win w',
'   Where g.GrnDate Between w.F And w.T',
'     And Not Exists (Select 1 From PurchaseBillGRNDetail pg',
'                      Where pg.GRNTno = g.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or g.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or g.CompanyCode = :P934_COMPANY)',
'  Union All',
unistr('  -- 50. MEDIUM \2014 receipts carrying a rejected quantity.'),
'  Select 50, ''MEDIUM'',',
'         ''Receipts with a rejected quantity'',',
'         Count(Distinct g.TNo), Null,',
'         ''Quality was rejected at receipt. Quantities cross incompatible ''',
'         || ''units, so no single exposure figure is possible.''',
'    From PCC_Grn g',
'    Join GrnDetail gd On gd.TNo = g.TNo',
'   Cross Join Win w',
'   Where g.GrnDate Between w.F And w.T',
'     And nvl(gd.RejectedQuantity1,0) > 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or g.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or g.CompanyCode = :P934_COMPANY)',
'  Union All',
unistr('  -- 60. LOW \2014 material in, receipt never prepared.'),
'  -- This REPLACES a "vehicle still inside the premises" rule. That rule',
'  -- needed GateInTime/GateOutTime, which are too sparsely populated to',
unistr('  -- support a control finding \2014 see the Material In to Receipt panel, which'),
'  -- prints the measured coverage. The gate-to-receipt handover IS reliably',
'  -- recorded, via MaterialIn.GRNTNo, so that is what is policed instead.',
'  Select 60, ''LOW'',',
'         ''Material In awaiting a receipt'',',
'         Count(*), To_Number(Null),',
'         ''Gate entry recorded but no GRN prepared against it. Stock may be ''',
'         || ''on site without being taken into books.''',
'    From PCC_MaterialIn mi Cross Join Win w',
'   Where mi.MaterialInDate Between w.F And w.T',
'     And nvl(mi.IsGrnPrepared,''NO'') <> ''YES''',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or mi.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or mi.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or mi.CompanyCode = :P934_COMPANY)',
'  Union All',
unistr('  -- 70. LOW \2014 enquiry floated, no quotation received.'),
'  Select 70, ''LOW'',',
'         ''Enquiry floated, no quotation received'',',
'         Count(*), Null,',
'         ''The tender went unanswered. There is no value to attach to an ''',
'         || ''enquiry that produced nothing.''',
'    From PCC_Enquiry e Cross Join Win w',
'   Where e.EnquiryDate Between w.F And w.T',
'     And Not Exists (Select 1 From PCC_Quotation q Where q.EnquiryTno = e.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or e.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or e.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or e.CompanyCode = :P934_COMPANY)',
'  Union All',
unistr('  -- 80. HIGH \2014 order raised with no credit terms.'),
'  -- This is the rule that makes bill ageing impossible, so it is graded HIGH',
'  -- even though nothing is technically wrong with the order itself: without',
'  -- credit days there is no due date, and without a due date "overdue"',
'  -- cannot be computed for any bill against that order.',
'  Select 80, ''HIGH'',',
'         ''Order raised with no credit terms'',',
'         Count(Distinct o.TNo), Sum(od.Amount),',
'         ''Bill ageing cannot be derived without credit days, so none of the ''',
'         || ''spend behind these orders can ever be reported as overdue.''',
'    From PCC_PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'   Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And nvl(o.CreditDays,0) = 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or o.CompanyCode = :P934_COMPANY)',
'     And (:P934_SUPPLIER Is Null Or o.PartyCode  = :P934_SUPPLIER)',
'  Union All',
unistr('  -- 90. MEDIUM \2014 open order not fully received. Pending value is pro-rated'),
'  -- within the line; the ERP stores no pending-value column.',
'  Select 90, ''MEDIUM'',',
'         ''Open order not fully received'',',
'         Count(Distinct o.TNo),',
'         Sum(od.Amount * (od.Quantity1',
'           - Least(nvl(od.ReceivedQuantity1,0), od.Quantity1)) / od.Quantity1),',
'         ''Committed spend with material still outstanding. Pending value is ''',
unistr('         || ''pro-rated within the line \2014 the ERP stores no pending-value column.'''),
'    From PCC_PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'   Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And nvl(od.Quantity1,0) > 0',
'     And nvl(od.ReceivedQuantity1,0) < od.Quantity1',
'     And Not Exists (Select 1 From PurchaseOrderClose poc',
'                      Where poc.PurchaseOrderTNo = o.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or o.CompanyCode = :P934_COMPANY)',
'     And (:P934_SUPPLIER Is Null Or o.PartyCode  = :P934_SUPPLIER))',
'Select',
'  r.Seq,',
'  ''<span class="ds-sev ds-sev--'' || lower(r.Sev) || ''">''',
'  || apex_escape.html(initcap(r.Sev)) || ''</span>'' As SEVERITY,',
'  apex_escape.html(r.Rule) As RULE_TEXT,',
'  -- The drill anchor. Rule id travels in data-k, never the wording.',
'  ''<a class="ds-exc-drill" href="javascript:void(0);" data-k="'' || r.Seq || ''">''',
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
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL,P934_SUPPLIER,P934_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>unistr('No exceptions fired for this period and scope \2014 nothing needs attention here.')
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955518777080436136)
,p_query_column_id=>6
,p_column_alias=>'IMPACT'
,p_column_display_sequence=>50
,p_column_heading=>'Why It Matters'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Business consequence. Rule 30''s text is a sentence rather than a number because PaidAmount only covers one settlement route.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955518510356436136)
,p_query_column_id=>4
,p_column_alias=>'ITEMS'
,p_column_display_sequence=>30
,p_column_heading=>'Documents'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Clickable count. Sets P934_EXC_FOCUS and refreshes the detail region below.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955518400392436136)
,p_query_column_id=>3
,p_column_alias=>'RULE_TEXT'
,p_column_display_sequence=>20
,p_column_heading=>'Rule'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('What was tested. Reworded freely \2014 the drill keys on the rule id, not this text.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955518295793436136)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_column_comment=>'Rule id. Also travels in the drill anchor''s data-k attribute.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955518308872436136)
,p_query_column_id=>2
,p_column_alias=>'SEVERITY'
,p_column_display_sequence=>10
,p_column_heading=>'Severity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Fixed grading \2014 high red, medium amber, low grey. The dot plus label survives greyscale print.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955518607495436136)
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
,p_column_comment=>unistr('Renders "not quantifiable" where the ERP holds no value. Never zero \2014 a zero would read as "nothing at stake".')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(956812435630443136)
,p_plug_name=>'Documents Behind the Execution Stage'
,p_static_id=>'exec-detail'
,p_region_name=>'p668ExecDetail'
,p_region_css_classes=>'ds-register ds-exc-detailwrap'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual)',
'-- Each branch repeats its stage''s predicates from the Execution Pipeline',
'-- VERBATIM, including the panel function and the location filter.',
'Select o.PurchaseOrderNo                              As DOCUMENT_NO,',
'       o.PurchaseOrderDate                            As DOCUMENT_DATE,',
'       ''Purchase Order''                               As STAGE,',
'       GetLocationName(o.LocationCode)                As LOCATION,',
'       GetPartyName(o.PartyCode)                      As PARTY,',
'       ''Delivery '' || to_char(o.DeliveryDate,''DD-Mon-RRRR'') As DETAIL,',
'       o.PurchaseOrderAmount As VALUE_RS,',
'       apex_page.get_url(p_page=>939,p_clear_cache=>''939'',p_items=>''P939_TNO'',p_values=>to_char(o.TNo,''FM9999999999999999990'')) As TARGET_URL',
'  From PCC_PurchaseOrder o Cross Join Win w',
' Where :P934_EXEC_FOCUS = ''10''',
'   And Exists (Select 1 From PurchaseOrderDetail valid_line Where valid_line.TNo = o.TNo)',
'   And o.PurchaseOrderDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or o.CompanyCode = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or o.PartyCode = :P934_SUPPLIER)',
'Union All',
'Select x.MaterialInNo                                 As DOCUMENT_NO,',
'       x.MaterialInDate                               As DOCUMENT_DATE,',
'       ''Material In / Gate Entry''                     As STAGE,',
'       GetLocationName(x.LocationCode)                As LOCATION,',
'       GetPartyName(x.PartyCode)                      As PARTY,',
'       ''Vehicle '' || x.VehicleNo                      As DETAIL,',
'       x.RefDocAmount As VALUE_RS,',
'       apex_page.get_url(p_page=>69,p_clear_cache=>''69'',p_items=>''P69_TNO,P69_CALLEDFROMPAGE'',p_values=>to_char(x.TNo,''FM9999999999999999990'')||'',934'') As TARGET_URL',
'  From PCC_MaterialIn x Cross Join Win w',
' Where :P934_EXEC_FOCUS = ''20''',
'   And x.MaterialInDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or x.PartyCode = :P934_SUPPLIER)',
'Union All',
'Select x.GrnNo                                        As DOCUMENT_NO,',
'       x.GrnDate                                      As DOCUMENT_DATE,',
'       ''GRN (Goods Received)''                         As STAGE,',
'       GetLocationName(x.LocationCode)                As LOCATION,',
'       GetPartyName(x.PartyCode)                      As PARTY,',
'       ''Against order '' || to_char(x.PurchaseOrderTNo) As DETAIL,',
'       (Select Sum(d.Amount) From GrnDetail d Where d.TNo=x.TNo) As VALUE_RS,',
'       apex_page.get_url(p_page=>146,p_clear_cache=>''146'',p_items=>''P146_TNO,P146_CALLEDFROMPAGE'',p_values=>to_char(x.TNo,''FM9999999999999999990'')||'',934'') As TARGET_URL',
'  From PCC_Grn x Cross Join Win w',
' Where :P934_EXEC_FOCUS = ''30''',
'   And Exists (Select 1 From GrnDetail valid_line Where valid_line.TNo = x.TNo)',
'   And x.GrnDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or x.PartyCode = :P934_SUPPLIER)',
'Union All',
'Select h.PurchaseBillNo                               As DOCUMENT_NO,',
'       h.PurchaseBillDate                             As DOCUMENT_DATE,',
'       ''Purchase Bill''                                As STAGE,',
'       GetLocationName(h.LocationCode)                As LOCATION,',
'       GetPartyName(h.PartyCode)                      As PARTY,',
'       ''Supplier bill '' || h.PartyBillNo              As DETAIL,',
'       h.PurchaseBillAmount As VALUE_RS,',
'       apex_page.get_url(p_page=>937,p_clear_cache=>''937'',p_items=>''P937_TNO'',p_values=>to_char(h.TNo,''FM9999999999999999990'')) As TARGET_URL',
'  From PCC_PurchaseBill h Cross Join Win w',
' Where :P934_EXEC_FOCUS = ''40''',
'   And h.PurchaseBillDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or h.PartyCode = :P934_SUPPLIER)',
'Union All',
'Select p.PBPassNo                                     As DOCUMENT_NO,',
'       p.PBPassDate                                   As DOCUMENT_DATE,',
'       ''Bill Pass''                                    As STAGE,',
'       GetLocationName(h.LocationCode)                As LOCATION,',
'       GetPartyName(h.PartyCode)                      As PARTY,',
'       ''Against bill '' || h.PurchaseBillNo            As DETAIL,',
'       h.PurchaseBillAmount As VALUE_RS,',
'       apex_page.get_url(p_page=>152,p_clear_cache=>''152'',p_items=>''P152_TNO,P152_CALLEDFROMPAGE'',p_values=>to_char(p.TNo,''FM9999999999999999990'')||'',934'') As TARGET_URL',
'  From PCC_PBPass p Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo Cross Join Win w',
' Where :P934_EXEC_FOCUS = ''50''',
'   And h.PurchaseBillDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or h.PartyCode = :P934_SUPPLIER)',
'Union All',
'Select v.VoucherNo                                    As DOCUMENT_NO,',
'       v.VoucherDate                                  As DOCUMENT_DATE,',
'       ''Paid''                                         As STAGE,',
'       GetLocationName(v.LocationCode)                As LOCATION,',
'       Cast(Null As Varchar2(240))                    As PARTY,',
'       ''Payment voucher''                              As DETAIL,',
'       (Select Sum(Abs(vd.Amount)) From VoucherDetail vd Where vd.TNo = v.TNo And vd.Amount < 0) As VALUE_RS,',
'       apex_page.get_url(p_page=>156,p_clear_cache=>''156'',p_items=>''P156_TNO,P156_CALLEDFROMPAGE'',p_values=>to_char(v.TNo,''FM9999999999999999990'')||'',934'') As TARGET_URL',
'  From PCC_Voucher v Cross Join Win w',
' Where :P934_EXEC_FOCUS = ''60''',
'   And v.VoucherDate Between w.F And w.T',
'   And v.DocTypeCode = ''PAYMENT''',
'   And Exists (Select 1 From VoucherDetail vd',
'                Where vd.TNo = v.TNo And vd.Amount < 0)',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or v.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or v.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or v.CompanyCode = :P934_COMPANY)',
'Order By 2 Desc, 1'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_EXEC_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
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
 p_id=>wwv_flow_imp.id(956812510260443136)
,p_max_row_count=>'100000'
,p_no_data_found_message=>'Click a stage in the Execution Pipeline above to list its documents here.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>22812510260443136
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956813141462443137)
,p_db_column_name=>'DETAIL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956812732501443137)
,p_db_column_name=>'DOCUMENT_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956812698448443137)
,p_db_column_name=>'DOCUMENT_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Document No'
,p_column_link=>'#TARGET_URL#'
,p_column_linktext=>'#DOCUMENT_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open transaction detail"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956812990891443137)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956813050146443137)
,p_db_column_name=>'PARTY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956812893304443137)
,p_db_column_name=>'STAGE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Stage'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000012)
,p_db_column_name=>'TARGET_URL'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction URL'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(956821017787444708)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DOCUMENT_NO:DOCUMENT_DATE:STAGE:LOCATION:PARTY:DETAIL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955503931274436075)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p668Filters'
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
 p_id=>wwv_flow_imp.id(955504080362436075)
,p_plug_name=>'Advanced Filters'
,p_static_id=>'filter-drawer'
,p_region_name=>'p668Drawer'
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
 p_id=>wwv_flow_imp.id(934900668083101000)
,p_plug_name=>'Transporter Freight Register'
,p_static_id=>'freight-register'
,p_region_name=>'p668FreightRegister'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>88
,p_plug_grid_column_span=>12
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(f.TNo,''FM9999999999999999990'') As ADVICE_KEY,',
'       nvl(f.FreightAdviceNo,''[Missing number: ''||to_char(f.TNo)||'']'') As ADVICE_NO,',
'       f.FreightAdviceDate As ADVICE_DATE,',
'       nvl((Select t.TransporterName From Transporter t Where t.TransporterCode=f.TransporterCode),''No transporter recorded'') As TRANSPORTER,',
'       GetLocationName(f.LocationCode) As LOCATION,',
'       f.PartyBillNo As TRANSPORTER_BILL_NO,',
'       f.PartyBillDate As BILL_DATE,',
'       f.NoOfLR As LR_COUNT,',
'       f.FreightAdviceAmount As FREIGHT_AMOUNT,',
'       f.SumOfTDSAmount As TDS_AMOUNT,',
'       f.SumOfDeductionAmount As DEDUCTIONS,',
'       f.SumOfAdvanceAmount As ADVANCES,',
'       f.SumOfNetPayableAmount As NET_PAYABLE,',
'       f.DueDate As DUE_DATE,',
'       f.Remark As REMARK',
'  From PCC_FreightAdvice f',
' Where f.FreightAdviceDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or f.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or f.Panel=:P934_PANEL)',
'   And (:P934_COMPANY Is Null Or f.CompanyCode=:P934_COMPANY)',
'   And (:P934_TRANSPORTER Is Null Or f.TransporterCode=:P934_TRANSPORTER Or (:P934_TRANSPORTER=''__UNASSIGNED__'' And f.TransporterCode Is Null))',
' Order By f.FreightAdviceDate Desc,f.TNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL,P934_TRANSPORTER'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(934900668083101001)
,p_no_data_found_message=>'No freight advices for the current dates, company, panel and transporter.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>900668083101001
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101021)
,p_db_column_name=>'ADVANCES'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Advances (Rs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101012)
,p_db_column_name=>'ADVICE_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Advice Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-Mon-RRRR'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101010)
,p_db_column_name=>'ADVICE_KEY'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Advice Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101011)
,p_db_column_name=>'ADVICE_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Freight Advice'
,p_column_link=>'f?p=&APP_ID.:199:&APP_SESSION.::NO:199:P199_TNO,P199_CALLEDFROMPAGE:#ADVICE_KEY#,934'
,p_column_linktext=>'#ADVICE_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Freight Advice form"'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101016)
,p_db_column_name=>'BILL_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Bill Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-Mon-RRRR'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101020)
,p_db_column_name=>'DEDUCTIONS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Deductions (Rs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101023)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_format_mask=>'DD-Mon-RRRR'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101018)
,p_db_column_name=>'FREIGHT_AMOUNT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Freight Amount (Rs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101014)
,p_db_column_name=>'LOCATION'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101017)
,p_db_column_name=>'LR_COUNT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'LRs'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101022)
,p_db_column_name=>'NET_PAYABLE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Net Payable (Rs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101024)
,p_db_column_name=>'REMARK'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Remarks'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101019)
,p_db_column_name=>'TDS_AMOUNT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'TDS (Rs)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101013)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Transporter'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934900668083101015)
,p_db_column_name=>'TRANSPORTER_BILL_NO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Transporter Bill No'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(934900668083101100)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'freight-primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'ADVICE_NO:ADVICE_DATE:TRANSPORTER:LOCATION:TRANSPORTER_BILL_NO:BILL_DATE:LR_COUNT:FREIGHT_AMOUNT:TDS_AMOUNT:DEDUCTIONS:ADVANCES:NET_PAYABLE:DUE_DATE:REMARK'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955515856705436134)
,p_name=>'Top 12 Items by Purchase Value - click a bar to view results'
,p_static_id=>'item-bar'
,p_template=>4072358936313175081
,p_display_sequence=>75
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P934_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P934_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P934_ITEMGROUP Is Null)',
', chart_q As (',
'Select * From (',
'  Select i.ItemName ITEM,',
'         d.ItemCode FILTER_KEY,',
'         Round(Sum(d.Amount) / 100000, 2) VALUE_LAC',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'    Join Item i On i.ItemCode = d.ItemCode',
'   Where h.PurchaseBillDate',
'         Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'     And d.ItemCode In (Select ItemCode From ItemTree)',
'   Group By i.ItemName, d.ItemCode',
'   Order By Sum(d.Amount) Desc)',
' Where rownum <= 12',
')',
'Select',
'  ''<div class="ds-p668-viz" data-chart-type="hbar" data-total-label="Rs lakh" data-filter-item="P934_ITEM" data-refresh-target="uom-mix" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.ITEM), ''v'' value q.VALUE_LAC, ''k'' value q.FILTER_KEY, ''d'' value q.ITEM, ''u'' value null returning clob)',
'                  order by q.VALUE_LAC Desc returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER,P934_ITEMGROUP'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082808)
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
 p_id=>wwv_flow_imp.id(955504277934436075)
,p_name=>'Procurement Pulse KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4501440665235496320
,p_display_sequence=>20
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P934_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P934_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P934_ITEMGROUP Is Null),',
'-- PRIOR PERIOD: same length, immediately preceding.',
'-- [FROM - (TO - FROM + 1), FROM)',
'Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'Prv As (',
'       Select F - (T - F + 1) PF, F - 1 PT From Win),',
unistr('-- BILL LINES \2014 the value grain.'),
'Bill As (',
'       Select h.TNo, h.PartyCode, h.PurchaseBillDate,',
'              d.ItemCode, d.Amount',
'         From PCC_PurchaseBill h',
'         Join PurchaseBillDetail d On d.TNo = h.TNo',
'        Where h.PurchaseBillDate Between (Select F From Win) And (Select T From Win)',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'               Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'          And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'          And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'          And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'          And (:P934_ITEM     Is Null Or d.ItemCode     = :P934_ITEM)',
'          And d.ItemCode In (Select ItemCode From ItemTree)),',
'PrvBill As (',
'       Select d.Amount, h.TNo',
'         From PCC_PurchaseBill h',
'         Join PurchaseBillDetail d On d.TNo = h.TNo',
'        Where h.PurchaseBillDate Between (Select PF From Prv) And (Select PT From Prv)',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'               Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'          And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'          And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'          And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'          And (:P934_ITEM     Is Null Or d.ItemCode     = :P934_ITEM)',
'          And d.ItemCode In (Select ItemCode From ItemTree)),',
'Agg As (',
'       Select Sum(Amount) Val, Count(*) Lines,',
'              Count(Distinct TNo) Bills,',
'              Count(Distinct ItemCode) Items,',
'              Count(Distinct PartyCode) Parties',
'         From Bill),',
'PrvAgg As (',
'       Select Sum(Amount) Val, Count(Distinct TNo) Bills From PrvBill),',
'-- RECEIPTS. GrnDetail holds no rate or amount of its own, so a receipt is',
'-- PRICED FROM ITS ORDER LINE: the GRN header carries PurchaseOrderTNo, and',
'-- the matching PurchaseOrderDetail line for the same item supplies the rate.',
'-- Receipts that cannot be traced to an order line stay UNPRICED, which is',
'-- why the card reports the coverage ("N% of lines priced") beside the value',
'-- instead of quietly presenting a partial figure as a total.',
'Rec As (',
'       Select Count(Distinct g.TNo) Grns,',
'              Sum(gd.ReceivedQuantity1) RecQty,',
'              Sum(gd.RejectedQuantity1) RejQty,',
'              Count(*) Lines,',
'              Count(Case When gd.Amount Is Not Null Then 1 End) PricedLines,',
'              Sum(gd.Amount) RecValue',
'         From PCC_Grn g',
'         Join GrnDetail gd On gd.TNo = g.TNo',
'        Where g.GrnDate Between (Select F From Win) And (Select T From Win)',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'               Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P934_PANEL Is Null Or g.Panel = :P934_PANEL)',
'          And (:P934_COMPANY  Is Null Or g.CompanyCode  = :P934_COMPANY)',
'          And (:P934_LOCATION Is Null Or g.LocationCode = :P934_LOCATION)',
'          And (:P934_SUPPLIER Is Null Or g.PartyCode = :P934_SUPPLIER)),',
'-- BILL PASS. PBPass is 1:1 with PurchaseBill (unique on PurchaseBillTNo), so',
'-- joining it cannot multiply the grain.',
'Pass As (',
'       Select Sum(p.PBPassAmount) Passed, Count(*) Passes',
'         From PCC_PBPass p',
'         Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'        Where h.PurchaseBillDate Between (Select F From Win) And (Select T From Win)',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'               Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'          And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'          And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'          And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)),',
'-- OWED TO SUPPLIERS. The supplier ledger closing balance is the only figure',
'-- that survives every settlement route, so it is what this card reports.',
'-- THREE PROPERTIES MAKE IT UNLIKE EVERY OTHER CARD, and all three are',
'-- printed on the card rather than left for the reader to discover:',
unistr('--   1. it is a SNAPSHOT AS AT TODAY, not a period figure \2014 the date filter'),
'--      does not narrow it;',
'--   2. it therefore INCLUDES BALANCES CARRIED FROM EARLIER YEARS;',
unistr('--   3. PartyCurrentClosing carries neither LocationCode NOR Panel \2014'),
'--      MEASURED: its only columns are CompanyCode, PartyCode, Closing and',
unistr('--      ClosingAmount \2014 so neither the location filter nor the panel filter'),
'--      can narrow it. Company is the only scope that applies.',
'-- Only negative closings are counted: a negative balance is money owed TO',
'-- the supplier. Positive balances are advances and are excluded rather than',
'-- netted off, which would understate the exposure.',
'Owed As (',
'       Select Sum(-c.Closing) Owed, Count(*) Parties',
'         From SAGAR.PartyCurrentClosing c',
'        Where c.Closing < 0',
'          -- NO panel predicate: the table has no Panel column. This is the',
'          -- one measure on the page that panel scoping cannot reach, and the',
'          -- card says so.',
'          And (:P934_COMPANY Is Null Or c.CompanyCode = :P934_COMPANY)',
'          And (:P934_SUPPLIER Is Null Or c.PartyCode  = :P934_SUPPLIER)),',
unistr('-- PAID. VoucherDetail.Amount is signed double-entry \2014 the supplier leg is'),
unistr('-- negative, the bank leg positive \2014 so summing it unfiltered returns zero.'),
'-- The negative-leg filter is what makes it a payment.',
'-- NOTE: only the ''PAYMENT'' doc type is corroborated in this repository.',
'-- MKSPL additionally used CASHPAYMENT and BANKPAYMENT; if those codes exist',
'-- in IRONMART they must be added here or this card understates.',
'Pay As (',
'       Select Sum(-vd.Amount) Paid, Count(Distinct v.TNo) Vouchers',
'         From PCC_Voucher v',
'         Join VoucherDetail vd On vd.TNo = v.TNo',
'        Where v.DocTypeCode = ''PAYMENT''',
'          And vd.Amount < 0',
'          And v.VoucherDate Between (Select F From Win) And (Select T From Win)',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'               Or v.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P934_PANEL Is Null Or v.Panel = :P934_PANEL)',
'          And (:P934_COMPANY Is Null Or v.CompanyCode = :P934_COMPANY)),',
'-- FREIGHT. FreightAdvice is the transporter billing document and the only',
'-- defensible freight source: Grn.FreightAmount is not populated, and the',
'-- transportation footer head appears on a handful of documents.',
'Fr As (',
'       Select Sum(f.FreightAdviceAmount) Frt, Count(*) Advices',
'         From PCC_FreightAdvice f',
'        Where f.FreightAdviceDate Between (Select F From Win) And (Select T From Win)',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'               Or f.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P934_PANEL Is Null Or f.Panel = :P934_PANEL)',
'          And (:P934_COMPANY Is Null Or f.CompanyCode = :P934_COMPANY)',
'          And (:P934_TRANSPORTER Is Null Or f.TransporterCode = :P934_TRANSPORTER)),',
'SparkBillM As (',
'       Select Trunc(PurchaseBillDate,''MM'') mn,',
'              Sum(Amount) val, Count(Distinct TNo) bills',
'         From Bill Group By Trunc(PurchaseBillDate,''MM'')),',
'SparkGrnM As (',
'       Select Trunc(g.GrnDate,''MM'') mn, Count(Distinct g.TNo) grns',
'         From PCC_Grn g',
'        Where Exists (Select 1 From GrnDetail valid_line Where valid_line.TNo = g.TNo)',
'          And g.GrnDate Between (Select F From Win) And (Select T From Win)',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'               Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P934_PANEL Is Null Or g.Panel = :P934_PANEL)',
'          And (:P934_COMPANY  Is Null Or g.CompanyCode  = :P934_COMPANY)',
'          And (:P934_LOCATION Is Null Or g.LocationCode = :P934_LOCATION)',
'          And (:P934_SUPPLIER Is Null Or g.PartyCode = :P934_SUPPLIER)',
'        Group By Trunc(g.GrnDate,''MM'')),',
'SparkPV As (',
'       Select Case When Pts Is Null Then ''''',
'            Else ''<svg class="ds-spark ds-spark--gold" viewBox="0 0 100 36" ''',
'              || ''preserveAspectRatio="none" aria-hidden="true">''',
'              || ''<polygon class="ds-spark-fill" points="0,36 '' || Pts || '' 100,36"/>''',
'              || ''<polyline class="ds-spark-line" points="'' || Pts || ''"/>''',
'              || ''</svg>'' End Svg',
'         From (',
'           Select Listagg(px||'',''||py, '' '') Within Group (Order By rn) Pts',
'             From (',
'               Select Round((rn-1)*100/Greatest(cnt-1,1)) px,',
'                      Round(33 - (v-lo)*30/Greatest(hi-lo,1)) py, rn',
'                 From (',
'                   Select val v,',
'                          Row_Number() Over(Order By mn) rn,',
'                          Count(*) Over() cnt,',
'                          Min(val) Over() lo, Max(val) Over() hi',
'                     From SparkBillM)))),',
'SparkPB As (',
'       Select Case When Pts Is Null Then ''''',
'            Else ''<svg class="ds-spark ds-spark--blue" viewBox="0 0 100 36" ''',
'              || ''preserveAspectRatio="none" aria-hidden="true">''',
'              || ''<polygon class="ds-spark-fill" points="0,36 '' || Pts || '' 100,36"/>''',
'              || ''<polyline class="ds-spark-line" points="'' || Pts || ''"/>''',
'              || ''</svg>'' End Svg',
'         From (',
'           Select Listagg(px||'',''||py, '' '') Within Group (Order By rn) Pts',
'             From (',
'               Select Round((rn-1)*100/Greatest(cnt-1,1)) px,',
'                      Round(33 - (v-lo)*30/Greatest(hi-lo,1)) py, rn',
'                 From (',
'                   Select bills v,',
'                          Row_Number() Over(Order By mn) rn,',
'                          Count(*) Over() cnt,',
'                          Min(bills) Over() lo, Max(bills) Over() hi',
'                     From SparkBillM)))),',
'SparkGR As (',
'       Select Case When Pts Is Null Then ''''',
'            Else ''<svg class="ds-spark ds-spark--teal" viewBox="0 0 100 36" ''',
'              || ''preserveAspectRatio="none" aria-hidden="true">''',
'              || ''<polygon class="ds-spark-fill" points="0,36 '' || Pts || '' 100,36"/>''',
'              || ''<polyline class="ds-spark-line" points="'' || Pts || ''"/>''',
'              || ''</svg>'' End Svg',
'         From (',
'           Select Listagg(px||'',''||py, '' '') Within Group (Order By rn) Pts',
'             From (',
'               Select Round((rn-1)*100/Greatest(cnt-1,1)) px,',
'                      Round(33 - (v-lo)*30/Greatest(hi-lo,1)) py, rn',
'                 From (',
'                   Select grns v,',
'                          Row_Number() Over(Order By mn) rn,',
'                          Count(*) Over() cnt,',
'                          Min(grns) Over() lo, Max(grns) Over() hi',
'                     From SparkGrnM))))',
'Select',
'  -- ---- 1. TOTAL PURCHASE VALUE ---------------------------------------',
'  ''<div class="ds-kpi ds-kpi--value ds-kpi--clickable" data-kpi-goto="p668BillReg" title="SUM(PurchaseBillDetail.Amount) ''',
'  || ''over bills dated in the period. Taxable line value; excludes footer tax ''',
'  || ''carried on the bill header.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-inr"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Total Purchase Value</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(a.Val,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(a.Val/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(a.Val,0) >= 100000',
'             Then ''Rs '' || to_char(Round(a.Val/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(a.Val,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     -- Where there is no prior period the card SAYS SO, rather than',
'     -- showing 0% or infinity.',
'     || Case When nvl(pa.Val,0) = 0',
'             Then ''<span class="ds-delta ds-delta--flat">No prior period</span>''',
'             When pa.Val * 100 < a.Val',
'             Then ''<span class="ds-delta ds-delta--flat">No comparable prior period</span>''',
'             When a.Val > pa.Val',
'             Then ''<span class="ds-delta ds-delta--up">&uarr; ''',
'                  || to_char(Round(100*(a.Val-pa.Val)/pa.Val,1),''FM99999990D0'')',
'                  || ''%</span>''',
'             When a.Val < pa.Val',
'             Then ''<span class="ds-delta ds-delta--down">&darr; ''',
'                  || to_char(Round(100*(pa.Val-a.Val)/pa.Val,1),''FM99999990D0'')',
'                  || ''%</span>''',
'             Else ''<span class="ds-delta ds-delta--flat">no change</span>'' End',
'     || '' &middot; '' || to_char(a.Lines,''FM999G999'') || '' bill lines''',
'     || '' &middot; '' || to_char(a.Items,''FM999G999'') || '' distinct items''',
'  || ''</span></span>'' || spv.Svg || ''</div>'' As KPI1,',
'  -- ---- 2. PURCHASE BILLS ---------------------------------------------',
'  ''<div class="ds-kpi ds-kpi--bill ds-kpi--clickable" data-kpi-goto="p668BillReg" title="COUNT(DISTINCT PurchaseBill.TNo) ''',
'  || ''in the period.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-file-text-o"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Purchase Bills</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(a.Bills,0),''FM999G999'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(pa.Bills,0) = 0',
'             Then ''<span class="ds-delta ds-delta--flat">No prior period</span>''',
'             When pa.Bills * 100 < a.Bills',
'             Then ''<span class="ds-delta ds-delta--flat">No comparable prior period</span>''',
'             When a.Bills > pa.Bills',
'             Then ''<span class="ds-delta ds-delta--up">&uarr; ''',
'                  || to_char(Round(100*(a.Bills-pa.Bills)/pa.Bills,1),''FM99999990D0'')',
'                  || ''%</span>''',
'             When a.Bills < pa.Bills',
'             Then ''<span class="ds-delta ds-delta--down">&darr; ''',
'                  || to_char(Round(100*(pa.Bills-a.Bills)/pa.Bills,1),''FM99999990D0'')',
'                  || ''%</span>''',
'             Else ''<span class="ds-delta ds-delta--flat">no change</span>'' End',
'     || '' &middot; supplier invoices entered against receipts</span>''',
'  || ''</span>'' || spb.Svg || ''</div>'' As KPI2,',
'  -- ---- 3. GRN RECEIPTS -----------------------------------------------',
'  ''<div class="ds-kpi ds-kpi--input ds-kpi--clickable" data-kpi-goto="p668Pipeline" title="COUNT(DISTINCT Grn.TNo). ''',
'  || ''Documents with receipt lines. Value is SUM(GrnDetail.Amount), matching the GRN Register. Each receipt line is counted once; missing amounts remain unpriced.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-truck"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">GRN Receipts</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(r.Grns,0),''FM999G999'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(r.PricedLines,0) = 0',
'             Then ''<span class="ds-muted">no stored receipt amount</span>''',
'             Else Case When nvl(r.RecValue,0) >= 10000000',
'                       Then ''Rs '' || to_char(Round(r.RecValue/10000000,2),''FM99G990D00'') || '' Cr''',
'                       When nvl(r.RecValue,0) >= 100000',
'                       Then ''Rs '' || to_char(Round(r.RecValue/100000,2),''FM99G990D00'') || '' L''',
'                       Else ''Rs '' || to_char(nvl(r.RecValue,0),''FM99G99G990D00'') End',
'                  || '' received (''',
'                  || to_char(Round(100 * r.PricedLines / Nullif(r.Lines,0)),''FM990'')',
'                  || ''% of lines with stored amount)'' End',
'     || '' &middot; '' || to_char(nvl(r.RejQty,0),''FM999G999G990'')',
'     || '' rejected</span>''',
'  || ''</span>'' || sgr.Svg || ''</div>'' As KPI3,',
'  -- ---- 4. BILL PASSED VALUE ------------------------------------------',
'  ''<div class="ds-kpi ds-kpi--ok ds-kpi--clickable" data-kpi-goto="p668BillReg" title="SUM(PBPass.PBPassAmount). PBPass is ''',
'  || ''one-to-one with PurchaseBill (unique on PurchaseBillTNo), so the join ''',
'  || ''cannot multiply the grain.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-check-square-o"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Bill Passed Value</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(ps.Passed,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(ps.Passed/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(ps.Passed,0) >= 100000',
'             Then ''Rs '' || to_char(Round(ps.Passed/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(ps.Passed,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(ps.Passes,0),''FM999G999'')',
'     || '' bills passed for payment</span>''',
'  || ''</span></div>'' As KPI4,',
'  -- ---- 5. PAID TO SUPPLIERS ------------------------------------------',
'  ''<div class="ds-kpi ds-kpi--suppl ds-kpi--clickable" data-kpi-goto="p668BillReg" title="SUM(-VoucherDetail.Amount) on ''',
'  || ''PAYMENT vouchers, negative supplier leg only. This is supplier payment ''',
unistr('  || ''FOR THE PERIOD \2014 no route in this ERP ties a payment voucher to an '''),
'  || ''individual bill, so it is never payment matched to these bills. ''',
'  || ''Only the PAYMENT doc type is confirmed present in this application.">''',
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
'  || ''<span class="ds-kpi-sub">''',
'     || Case When nvl(ps.Passed,0) > 0',
'             Then to_char(Round(100 * nvl(py.Paid,0) / ps.Passed,1),''FM99999990D0'')',
'                  || ''% of value passed''',
'             Else ''no passed value in period'' End',
'     || '' &middot; period figure, not matched to bills</span>''',
'  || ''</span></div>'' As KPI5,',
'  -- ---- 6. OWED TO SUPPLIERS ------------------------------------------',
'  -- The one card on this page that is NOT bounded by the period filter, and',
'  -- it says so on its face rather than in a tooltip alone.',
'  ''<div class="ds-kpi ds-kpi--risk ds-kpi--clickable" data-kpi-goto="p668SupTable" title="SUM(-PartyCurrentClosing.Closing) ''',
unistr('  || ''where Closing < 0 \2014 the supplier ledger balance, the only measure that '''),
'  || ''survives every settlement route. It is a snapshot as at today: the ''',
'  || ''period filter does not narrow it, it includes balances carried from ''',
'  || ''earlier years, and PartyCurrentClosing has no LocationCode so the ''',
'  || ''neither the location nor the panel filter can narrow it. Positive balances are advances ''',
'  || ''and are excluded rather than netted off, which would understate the ''',
'  || ''exposure.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-balance-scale"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Owed to Suppliers</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(ow.Owed,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(ow.Owed/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(ow.Owed,0) >= 100000',
'             Then ''Rs '' || to_char(Round(ow.Owed/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(ow.Owed,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  -- A "delta vs prev period" would be meaningless on a snapshot, so the',
'  -- delta slot carries the basis instead.',
'  || ''<span class="ds-kpi-sub">''',
'  || ''<span class="ds-delta ds-delta--flat">Snapshot today</span> ''',
'     || to_char(nvl(ow.Parties,0),''FM999G999'')',
'     || '' suppliers in credit &middot; includes earlier years; period, ''',
'     || ''location and panel filters do not narrow it</span>''',
'  || ''</span></div>'' As KPI6,',
'  -- ---- 7. ACTIVE SUPPLIERS -------------------------------------------',
'  ''<div class="ds-kpi ds-kpi--users ds-kpi--clickable" data-kpi-goto="p668SupTable" title="COUNT(DISTINCT ''',
'  || ''PurchaseBill.PartyCode) in the period.">''',
'  || ''<span class="ds-kpi-ic"><span class="fa fa-users"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Active Suppliers</span>''',
'  || ''<span class="ds-kpi-n">'' || to_char(nvl(a.Parties,0),''FM999G999'') || ''</span>''',
'  || ''<span class="ds-kpi-sub">parties that raised at least one bill</span>''',
'  || ''</span></div>'' As KPI7,',
'  -- ---- 8. FREIGHT BILLED ---------------------------------------------',
'  ''<div class="ds-kpi ds-kpi--freight ds-kpi--clickable" data-kpi-goto="p668Transporter" title="SUM(''',
'  || ''FreightAdvice.FreightAdviceAmount). The transporter billing document is ''',
unistr('  || ''the only defensible freight source \2014 Grn.FreightAmount is not populated.">'''),
'  || ''<span class="ds-kpi-ic"><span class="fa fa-road"></span></span>''',
'  || ''<span class="ds-kpi-body">''',
'  || ''<span class="ds-kpi-t">Freight Billed</span>''',
'  || ''<span class="ds-kpi-n">''',
'     || Case When nvl(f.Frt,0) >= 10000000',
'             Then ''Rs '' || to_char(Round(f.Frt/10000000,2),''FM99G990D00'') || '' Cr''',
'             When nvl(f.Frt,0) >= 100000',
'             Then ''Rs '' || to_char(Round(f.Frt/100000,2),''FM99G990D00'') || '' L''',
'             Else ''Rs '' || to_char(nvl(f.Frt,0),''FM99G99G990D00'') End',
'     || ''</span>''',
'  || ''<span class="ds-kpi-sub">'' || to_char(nvl(f.Advices,0),''FM999G999'')',
'     || '' freight advices''',
'     || Case When nvl(a.Val,0) > 0',
'             Then '' &middot; '' || to_char(Round(100 * nvl(f.Frt,0) / a.Val,2),''FM990D00'')',
'                  || ''% of purchase value''',
'             Else '''' End',
'  || ''</span></span></div>'' As KPI8',
'From Agg a',
'Cross Join PrvAgg pa',
'Cross Join Rec r',
'Cross Join Pass ps',
'Cross Join Owed ow',
'Cross Join Pay py',
'Cross Join Fr f',
'Cross Join SparkPV spv',
'Cross Join SparkPB spb',
'Cross Join SparkGR sgr'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER,P934_ITEMGROUP,P934_ITEM,P934_TRANSPORTER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No purchase activity in this period and scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955504394073436076)
,p_query_column_id=>1
,p_column_alias=>'KPI1'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Total Purchase Value card. SUM(PurchaseBillDetail.Amount) \2014 the value grain. Reconciles to the Purchase Bill Register.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955504434690436076)
,p_query_column_id=>2
,p_column_alias=>'KPI2'
,p_column_display_sequence=>20
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Purchase Bills card. COUNT(DISTINCT PurchaseBill.TNo).'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955504558468436076)
,p_query_column_id=>3
,p_column_alias=>'KPI3'
,p_column_display_sequence=>30
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('GRN Receipts card. Quantity only \2014 GrnDetail carries no usable Rate/Amount. Quantities cross units and are labelled "mixed units".')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955504663250436076)
,p_query_column_id=>4
,p_column_alias=>'KPI4'
,p_column_display_sequence=>40
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Bill Passed Value card. SUM(PBPass.PBPassAmount); PBPass is 1:1 with the bill.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955504772030436076)
,p_query_column_id=>5
,p_column_alias=>'KPI5'
,p_column_display_sequence=>50
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Paid to Suppliers card. Ledger-based, negative supplier leg of PAYMENT vouchers. Period figure, never matched to individual bills. Only the PAYMENT doc type is confirmed in this app.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955504864180436076)
,p_query_column_id=>6
,p_column_alias=>'KPI6'
,p_column_display_sequence=>60
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Bills Awaiting Pass card. Substituted for the blueprint''s Owed to Suppliers, which needs the unverified PartyCurrentClosing table.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955504975802436076)
,p_query_column_id=>7
,p_column_alias=>'KPI7'
,p_column_display_sequence=>70
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Active Suppliers card. COUNT(DISTINCT PurchaseBill.PartyCode).'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955505077282436077)
,p_query_column_id=>8
,p_column_alias=>'KPI8'
,p_column_display_sequence=>80
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Freight Billed card. FreightAdvice only \2014 Grn.FreightAmount is not populated in this ERP.')
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(976401251083085417)
,p_name=>'Location Concentration (Top 12 + Others)'
,p_static_id=>'loc-lolli'
,p_template=>4072358936313175081
,p_display_sequence=>56
,p_region_css_classes=>'ds-dash-panel ds-lollipop'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_display_column=>7
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Lollipop companion to the category donut - billed purchase value by',
'   location/unit (top 12 + the rest grouped), rendered as an HTML row',
'   list (same ds-lolli pattern as the Store dashboard). P934_LOCATION is',
'   deliberately NOT submitted: filtering value-by-location to a single',
'   location would leave one row. */',
'With D As (',
'Select Case When rn <= 12 Then LBL Else ''All other locations'' End As LBL,',
'       Round(Sum(Amt)/100000,2)                                    As VAL_LAC',
'  From (',
'    Select nvl(GetLocationName(h.LocationCode), h.LocationCode) LBL,',
'           Sum(d.Amount) Amt,',
'           Row_Number() Over (Order By Sum(d.Amount) Desc) rn',
'      From PCC_PurchaseBill h',
'      Join PurchaseBillDetail d On d.TNo = h.TNo',
'     Where h.PurchaseBillDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P934_PANEL    Is Null Or h.Panel        = :P934_PANEL)',
'       And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'       And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'     Group By nvl(GetLocationName(h.LocationCode), h.LocationCode)',
'    Having Sum(d.Amount) > 0)',
' Group By Case When rn <= 12 Then LBL Else ''All other locations'' End),',
'     M As (Select Max(VAL_LAC) MX From D)',
'Select ''<div class="ds-lolli ds-lolli--''',
'    || Case When VAL_LAC >= 100 Then ''hi'' When VAL_LAC >= 50 Then ''mid'' Else ''lo'' End || ''">''',
'    || ''<span class="ds-lolli-label" title="''||apex_escape.html_attribute(LBL)||''">''||apex_escape.html(LBL)||''</span>''',
'    || ''<span class="ds-lolli-track"><span class="ds-lolli-line" style="width:''',
'       || to_char(greatest(round(VAL_LAC/nullif(M.MX,0)*100),3)) || ''%"></span><span class="ds-lolli-dot"></span></span>''',
'    || ''<span class="ds-lolli-val">''',
'       || Case When VAL_LAC >= 100 Then ''&#8377;''||to_char(VAL_LAC/100,''FM99G990D00'')||'' Cr''',
'               Else ''&#8377;''||to_char(VAL_LAC,''FM990D00'')||'' L'' End',
'       || ''</span></div>'' As ROW_HTML',
'  From D Cross Join M',
' Order By VAL_LAC Desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No billed purchase value by location in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(976401376841085417)
,p_query_column_id=>1
,p_column_alias=>'ROW_HTML'
,p_column_display_sequence=>10
,p_column_heading=>' '
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955513870881436133)
,p_name=>'Purchase Value by Location - click a bar to filter results'
,p_static_id=>'location-bar'
,p_template=>4072358936313175081
,p_display_sequence=>62
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With chart_q As (',
'Select GetLocationName(h.LocationCode) LOCATION,',
'       h.LocationCode FILTER_KEY,',
'       Round(Sum(d.Amount) / 100000, 2) VALUE_LAC',
'  From PCC_PurchaseBill h',
'  Join PurchaseBillDetail d On d.TNo = h.TNo',
' Where h.PurchaseBillDate',
'       Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'           And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or h.CompanyCode = :P934_COMPANY)',
'   And (:P934_SUPPLIER Is Null Or h.PartyCode   = :P934_SUPPLIER)',
' Group By h.LocationCode',
' Order By Sum(d.Amount) Desc',
')',
'Select',
'  ''<div class="ds-p668-viz" data-chart-type="hbar" data-total-label="Rs lakh" data-filter-item="P934_LOCATION" data-refresh-target="p668SupTable" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.LOCATION), ''v'' value q.VALUE_LAC, ''k'' value q.FILTER_KEY, ''d'' value q.LOCATION, ''u'' value null returning clob)',
'                  order by q.VALUE_LAC Desc returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082807)
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
 p_id=>wwv_flow_imp.id(955512201419436106)
,p_name=>'Material In &rarr; Receipt'
,p_static_id=>'material-in-receipt'
,p_template=>4072358936313175081
,p_display_sequence=>52
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'Mi As (',
'  Select Count(*) Docs,',
'         -- Measured: IsGrnPrepared carries YES / NO, nothing else.',
'         Count(Case When mi.IsGrnPrepared = ''YES'' Then 1 End) Booked,',
'         Count(Case When nvl(mi.IsGrnPrepared,''NO'') <> ''YES'' Then 1 End) Awaiting,',
'         Count(Distinct mi.VehicleNo) Vehicles,',
'         Count(mi.VehicleNo) WithVehicle,',
'         Count(mi.GateInTime) WithGateIn,',
'         Count(Case When mi.GateInTime Is Not Null',
'                     And mi.GateOutTime Is Null Then 1 End) OnSite',
'    From PCC_MaterialIn mi Cross Join Win w',
'   Where mi.MaterialInDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or mi.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or mi.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or mi.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or mi.LocationCode = :P934_LOCATION))',
'Select 10 Seq,',
'       ''Material In documents'' As MEASURE,',
'       to_char(Docs,''FM999G999G990'') As FIGURE,',
'       ''Gate entries recorded in the period'' As BASIS',
'  From Mi',
'Union All',
'Select 20, ''Booked as a receipt'',',
'       to_char(Booked,''FM999G999G990'')',
'       || Case When Docs > 0',
'               Then '' ('' || to_char(Round(100*Booked/Docs,1),''FM99999990D0'') || ''%)''',
'               Else '''' End,',
'       ''MaterialIn.IsGrnPrepared = YES''',
'  From Mi',
'Union All',
'Select 30, ''Awaiting a receipt'',',
'       to_char(Awaiting,''FM999G999G990''),',
'       ''Material taken in at the gate, GRN not yet prepared''',
'  From Mi',
'Union All',
'Select 40, ''Distinct vehicles'',',
'       to_char(Vehicles,''FM999G999G990''),',
'       ''VehicleNo is populated on ''',
'       || Case When Docs > 0',
'               Then to_char(Round(100*WithVehicle/Docs,3),''FM990D000'') || ''%''',
'               Else ''no'' End',
'       || '' of gate entries''',
'  From Mi',
'Union All',
'-- The self-disclosing row. Below 50% coverage the figure is suppressed and',
'-- the reason is printed instead, because a confident-looking count drawn',
'-- from a near-empty column is worse than no count at all.',
'Select 50, ''Live gate occupancy'',',
'       Case When Docs > 0 And WithGateIn / Docs >= 0.5',
'            Then to_char(OnSite,''FM999G999G990'') || '' on site now''',
'            Else ''<span class="ds-muted">not recorded by this ERP</span>''',
'       End,',
'       ''GateInTime populated on '' || to_char(WithGateIn,''FM999G999G990'')',
'       || '' of '' || to_char(Docs,''FM999G999G990'') || '' rows in this window''',
'  From Mi',
' Order By 1'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No material was booked in at the gate in this period and scope.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955512614450436106)
,p_query_column_id=>4
,p_column_alias=>'BASIS'
,p_column_display_sequence=>30
,p_column_heading=>'Basis'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Names the exact column each figure comes from, and states the measured population so a reader can judge how much weight the figure carries.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955512554302436106)
,p_query_column_id=>3
,p_column_alias=>'FIGURE'
,p_column_display_sequence=>20
,p_column_heading=>'Figure'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Live gate occupancy renders "not recorded by this ERP" whenever GateInTime coverage falls below half the rows \2014 the threshold is evaluated at run time, so the row starts reporting a real number if the column is ever populated properly.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955512422971436106)
,p_query_column_id=>2
,p_column_alias=>'MEASURE'
,p_column_display_sequence=>10
,p_column_heading=>'Measure'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'What is being counted at the gate-to-receipt handover.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955512357561436106)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_column_comment=>'Row order. Must stay projected so APEX cannot eliminate the ORDER BY.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955510616699436105)
,p_plug_name=>'Supplier Order-to-Payment Cycle'
,p_static_id=>'order-cycle'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>48
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'-- Unit comes from the ITEM master: PurchaseOrderDetail carries no rate-unit',
'-- column in this application.',
'Lines As (',
'  Select o.PartyCode,',
'         nvl((Select m.MeasuringUnitName From MeasuringUnit m',
'               Where m.MeasuringUnitCode = i.MeasuringUnitCode1),',
'             ''no unit'') Uom,',
'         od.Quantity1 Qty,',
'         Least(nvl(od.ReceivedQuantity1,0), od.Quantity1) Recd,',
'         od.Amount Amt',
'    From PCC_PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'    Left Join Item i On i.ItemCode = od.ItemCode',
'   Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And nvl(od.Quantity1,0) > 0',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)),',
'PerUom As (',
'  Select PartyCode, Uom, Sum(Qty) Qty, Sum(Recd) Recd',
'    From Lines Group By PartyCode, Uom),',
'Agg As (',
'  Select PartyCode,',
'         Count(*) UomCount,',
'         listagg(to_char(Qty,''FM999G999G990'') || '' '' || Uom, '' &middot; '')',
'           Within Group (Order By Qty Desc) QtyText,',
'         Sum(Qty) TotQty, Sum(Recd) TotRecd',
'    From PerUom Group By PartyCode),',
'Val As (',
'  Select PartyCode, Sum(Amt) Ordered From Lines Group By PartyCode),',
'Pss As (',
'  Select h.PartyCode, Sum(p.PBPassAmount) Passed, Sum(p.PaidAmount) PaidAdv',
'    From PCC_PBPass p',
'    Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Cross Join Win w',
'   Where h.PurchaseBillDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
'   Group By h.PartyCode)',
'Select',
'  a.PartyCode As PARTYCODE,',
'  GetPartyName(a.PartyCode) As SUPPLIER,',
'  a.QtyText As QUANTITY_ORDERED,',
'  -- Suppressed on multi-unit suppliers: a ratio across incompatible units',
'  -- would be arithmetic without meaning.',
'  Case When a.UomCount = 1 And a.TotQty > 0',
'       Then ''<span class="ds-sharecell"><span class="ds-bar ds-bar--teal"><i style="width:''',
'            || to_char(Least(Round(100*a.TotRecd/a.TotQty,1),100),''FM99999990D0'')',
'            || ''%"></i></span><b>''',
'            || to_char(Round(100*a.TotRecd/a.TotQty,1),''FM99999990D0'') || ''%</b></span>''',
'       Else ''<span class="ds-muted">mixed units</span>'' End As RECEIVED,',
'  v.Ordered As ORDERED,',
'  p.Passed As PASSED,',
'  p.PaidAdv As PAID,',
'  Case When p.Passed Is Not Null',
'       Then nvl(p.Passed,0) - nvl(p.PaidAdv,0) End As OUTSTANDING',
'From Agg a',
'Join Val v On v.PartyCode = a.PartyCode',
'Left Join Pss p On p.PartyCode = a.PartyCode',
'Order By v.Ordered Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
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
 p_id=>wwv_flow_imp.id(955510741252436105)
,p_no_data_found_message=>'No supplier had orders in this period and scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21510741252436105
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955511235479436105)
,p_db_column_name=>'ORDERED'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Ordered'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Committed order value in the period.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955511503989436105)
,p_db_column_name=>'OUTSTANDING'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Outstanding'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Passed less paid on the advice basis. Null rather than zero where nothing has been passed, so an unpassed supplier does not read as fully settled.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955511439818436105)
,p_db_column_name=>'PAID'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Paid (via advice)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('PBPass.PaidAmount. The heading names the basis because this column covers only the Payment Advice route \2014 the ledger figure is on the KPI strip.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955510810115436105)
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
 p_id=>wwv_flow_imp.id(955511306810436105)
,p_db_column_name=>'PASSED'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Passed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('SUM(PBPass.PBPassAmount) on bills dated in the period. Ordered and Passed are different populations \2014 an order placed now may be billed next period \2014 so the two columns are not expected to agree.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955511078525436105)
,p_db_column_name=>'QUANTITY_ORDERED'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Quantity Ordered (per unit)'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Listagg of quantity PER UNIT, largest first. Never a single total \2014 the units are incompatible and adding them would be meaningless.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955511136509436105)
,p_db_column_name=>'RECEIVED'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Received'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Shown only where the supplier''s orders use ONE unit. Multi-unit suppliers render "mixed units" rather than a ratio built from incompatible bases.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955510980121436105)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Supplier'
,p_column_link=>'f?p=&APP_ID.:935:&APP_SESSION.::NO:935:P935_SUPPLIER,P935_FROMDATE,P935_TODATE,P935_COMPANY,P935_LOCATION,P935_PANEL:#PARTYCODE#,&P934_FROMDATE.,&P934_TODATE.,&P934_COMPANY.,&P934_LOCATION.,&P934_PANEL.'
,p_column_linktext=>'#SUPPLIER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Drills to Supplier 360 with the full filter context.'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(956297297974724555)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PARTYCODE:SUPPLIER:QUANTITY_ORDERED:RECEIVED:ORDERED:PASSED:PAID:OUTSTANDING'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955506204417436077)
,p_name=>'Order Value by Type'
,p_static_id=>'order-value-by-type'
,p_template=>4072358936313175081
,p_display_sequence=>33
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With chart_q As (',
'Select nvl((Select dt.DocTypeName From DocType dt',
'             Where dt.DocTypeCode = o.DocTypeCode), o.DocTypeCode) ORDER_TYPE,',
'       Round(Sum(od.Amount) / 100000, 2) VALUE_LAC',
'  From PCC_PurchaseOrder o',
'  Join PurchaseOrderDetail od On od.TNo = o.TNo',
' Where o.PurchaseOrderDate',
'       Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'           And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)',
' Group By o.DocTypeCode',
' Order By Sum(od.Amount) Desc',
')',
'Select',
'  ''<div class="ds-svgdonut" data-chart-type="donut" data-total-label="Rs lakh" data-focus-item="P934_EXEC_FOCUS" data-refresh-target="p668ExecDetail" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.ORDER_TYPE), ''v'' value q.VALUE_LAC, ''k'' value 10, ''d'' value q.ORDER_TYPE, ''u'' value null returning clob)',
'                  order by q.VALUE_LAC Desc returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082801)
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
 p_id=>wwv_flow_imp.id(955507297284436103)
,p_name=>'Execution Pipeline'
,p_static_id=>'pipeline'
,p_region_name=>'p668Pipeline'
,p_template=>4072358936313175081
,p_display_sequence=>40
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'-- Computed ONCE in its own CTE. As a scalar subquery inside the stage',
'-- select list it referenced w.F/w.T beside Count(Distinct ...) and Oracle',
unistr('-- rejected it with ORA-00937 \2014 the trap the blueprint warns about.'),
'GrnVal As (',
'  Select Sum(gd.Amount) Val',
'    From PCC_Grn g',
'    Join GrnDetail gd On gd.TNo = g.TNo',
'   Cross Join Win w',
'   Where g.GrnDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or g.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or g.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or g.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or g.PartyCode = :P934_SUPPLIER)),',
'Stg As (',
unistr('  -- 10. PURCHASE ORDER \2014 value is real: PurchaseOrderDetail.Amount.'),
'  Select 10 Seq, ''Purchase Order'' Stage, ''fa-shopping-cart'' Ic,',
'         Count(Distinct o.TNo) Docs, Sum(od.Amount) Val,',
'         ''Orders with detail lines raised in the period; committed line value.'' Note',
'    From PCC_PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'   Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)',
'  Union All',
unistr('  -- 20. MATERIAL IN / GATE ENTRY \2014 no value exists at this stage.'),
'  Select 20, ''Material In / Gate Entry'', ''fa-sign-in'',',
'         Count(*), Null,',
'         ''Vehicle arrival and weighment. The ERP records no value here.''',
'    From PCC_MaterialIn x Cross Join Win w',
'   Where x.MaterialInDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or x.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or x.PartyCode = :P934_SUPPLIER)',
'  Union All',
unistr('  -- 30. GRN \2014 priced from the order line, since GrnDetail holds no rate of'),
'  -- its own. Receipts not traceable to an order contribute quantity but no',
'  -- value, so this figure is a floor rather than a complete total.',
'  Select 30, ''GRN (Goods Received)'', ''fa-truck'',',
'         Count(Distinct x.TNo),',
'         -- Max() around the scalar makes the select list uniformly',
'         -- aggregated. A bare scalar subquery here is NOT a group function',
'         -- and Oracle rejects it with ORA-00937 even though it returns one row.',
'         Max((Select Val From GrnVal)),',
'         ''GRNs with receipt lines. Stored GRN line amounts, matching the GRN Register; each receipt line counted once.''',
'    From PCC_Grn x Cross Join Win w',
'   Where Exists (Select 1 From GrnDetail valid_line Where valid_line.TNo = x.TNo)',
'     And x.GrnDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or x.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or x.PartyCode = :P934_SUPPLIER)',
'  Union All',
unistr('  -- 40. PURCHASE BILL \2014 the value grain.'),
'  Select 40, ''Purchase Bill'', ''fa-file-text-o'',',
'         Count(Distinct h.TNo), Sum(d.Amount),',
'         ''Supplier invoice. Taxable line value, excludes footer tax.''',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Cross Join Win w',
'   Where h.PurchaseBillDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'  Union All',
'  -- 50. BILL PASS.',
'  Select 50, ''Bill Pass'', ''fa-check-square-o'',',
'         Count(*), Sum(p.PBPassAmount),',
'         ''Approval for payment. One pass per bill.''',
'    From PCC_PBPass p',
'    Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
'   Cross Join Win w',
'   Where h.PurchaseBillDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'  Union All',
unistr('  -- 60. PAID \2014 ledger. NOTE: this row counts payment VOUCHERS, a different'),
'  -- unit from bill counts, so its conversion % is NOT a funnel drop-off.',
'  Select 60, ''Paid'', ''fa-credit-card'',',
'         Count(Distinct v.TNo), Sum(-vd.Amount),',
unistr('         ''Payment vouchers in the period. Counts vouchers, not bills \2014 the '''),
'         || ''conversion figure here is not a funnel drop-off.''',
'    From PCC_Voucher v',
'    Join VoucherDetail vd On vd.TNo = v.TNo',
'   Cross Join Win w',
'   Where v.DocTypeCode = ''PAYMENT''',
'     And vd.Amount < 0',
'     And v.VoucherDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or v.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or v.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or v.CompanyCode = :P934_COMPANY))',
'Select',
'  s.Seq,',
'  ''<a class="ds-exec-drill" href="javascript:void(0);" data-k="'' || s.Seq || ''"''',
'  || '' style="display:inline-flex;align-items:center;''',
'  || ''gap:9px;font-weight:600;text-decoration:none;">''',
'  || ''<span style="display:grid;place-items:center;width:26px;height:26px;''',
'  || ''font-size:12px;border-radius:7px;color:var(--ds-dash-gold);background:var(--ds-dash-gold-bg);''',
'  || ''flex:0 0 auto;"><span class="fa '' || s.Ic || ''"></span></span>''',
'  || apex_escape.html(s.Stage) || ''</a>'' As STAGE,',
'  s.Docs As DOCS,',
'  -- A stage that genuinely carries no value renders an en-dash, NOT a zero.',
'  Case When s.Val Is Null',
'       Then ''<span class="ds-muted">no value at this stage</span>''',
'       Else ''<b>''',
'            || Case When s.Val >= 10000000',
'                    Then ''Rs '' || to_char(Round(s.Val/10000000,2),''FM99G990D00'') || '' Cr''',
'                    When s.Val >= 100000',
'                    Then ''Rs '' || to_char(Round(s.Val/100000,2),''FM99G990D00'') || '' L''',
'                    Else ''Rs '' || to_char(s.Val,''FM99G99G990D00'') End',
'            || ''</b>'' End As VALUE,',
'  -- Expressed as "% OF ORDERS", not as a funnel drop-off. These stages count',
'  -- different document types against a common baseline, so a stage can and',
unistr('  -- routinely does exceed 100% \2014 one order produces many gate entries, and'),
'  -- documents raised late in the window have not had time to progress. A',
'  -- drop-off framing would read those as leakage, which they are not.',
'  Case',
'    When s.Seq = 10 Then ''<span class="ds-pill ds-pill--muted">baseline</span>''',
'    Else ''<span class="ds-pill ds-pill--''',
'         || Case When 100 * s.Docs / Nullif(First_Value(s.Docs)',
'                       Over (Order By s.Seq),0) >= 90 Then ''good''',
'                 When 100 * s.Docs / Nullif(First_Value(s.Docs)',
'                       Over (Order By s.Seq),0) >= 60 Then ''info''',
'                 Else ''warn'' End',
'         || ''">''',
'         || to_char(Round(100 * s.Docs / Nullif(First_Value(s.Docs)',
'                       Over (Order By s.Seq),0),1),''FM99999990D0'')',
'         || ''% of orders</span>''',
'  End As CONVERSION,',
'  ''<span class="ds-muted">'' || apex_escape.html(s.Note) || ''</span>'' As NOTE',
'From Stg s',
'Order By s.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No purchase-to-pay activity in this period and scope.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955507771207436104)
,p_query_column_id=>5
,p_column_alias=>'CONVERSION'
,p_column_display_sequence=>40
,p_column_heading=>'Volume vs Orders'
,p_column_alignment=>'CENTER'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Documents as a share of the order stage. The Paid row counts vouchers, a different unit from bills, so its figure is not a drop-off.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955507527586436104)
,p_query_column_id=>3
,p_column_alias=>'DOCS'
,p_column_display_sequence=>20
,p_column_heading=>'Documents'
,p_column_format=>'FM999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Document count. The order stage uses COUNT(DISTINCT TNo) because joining the detail multiplies the header.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955507882116436104)
,p_query_column_id=>6
,p_column_alias=>'NOTE'
,p_column_display_sequence=>50
,p_column_heading=>'What This Stage Means'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Plain-language reading guidance, including the caveats that would otherwise mislead.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955507385411436104)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_column_comment=>'Stage order. Must stay projected so APEX cannot eliminate the ORDER BY.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955507475796436104)
,p_query_column_id=>2
,p_column_alias=>'STAGE'
,p_column_display_sequence=>10
,p_column_heading=>'Stage'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Stage name, drilling to the matching legacy register. The Paid stage drills to the Payment register while its figure comes from the ledger \2014 that mismatch is stated in the stage note rather than hidden.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955507602385436104)
,p_query_column_id=>4
,p_column_alias=>'VALUE'
,p_column_display_sequence=>30
,p_column_heading=>'Value'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Stage value. Gate entry and GRN render "no value at this stage" \2014 never zero \2014 because the ERP records none.')
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955507963620436104)
,p_name=>'Pipeline Conversion - click a segment to view orders'
,p_static_id=>'pipeline-conversion'
,p_template=>4072358936313175081
,p_display_sequence=>42
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With chart_q As (',
'Select BUCKET, Count(*) ORDERS, Min(SortKey) SORT_KEY, Min(BucketKey) BUCKET_KEY',
'  From (',
'    Select o.TNo,',
'           Case',
'             When Exists (Select 1 From PurchaseOrderClose poc',
'                           Where poc.PurchaseOrderTNo = o.TNo)',
'                  Then ''Short-closed''',
'             When Sum(Case When nvl(od.Quantity1,0) > 0',
'                            And nvl(od.ReceivedQuantity1,0) >= od.Quantity1',
'                           Then 1 Else 0 End) = Count(*)',
'                  Then ''Fully received''',
'             When Sum(nvl(od.ReceivedQuantity1,0)) > 0',
'                  Then ''Part received''',
'             Else ''Awaiting material''',
'           End BUCKET,',
'           Case',
'             When Exists (Select 1 From PurchaseOrderClose poc',
'                           Where poc.PurchaseOrderTNo = o.TNo) Then 4',
'             When Sum(Case When nvl(od.Quantity1,0) > 0',
'                            And nvl(od.ReceivedQuantity1,0) >= od.Quantity1',
'                           Then 1 Else 0 End) = Count(*) Then 3',
'             When Sum(nvl(od.ReceivedQuantity1,0)) > 0 Then 2',
'             Else 1',
'           End SortKey,',
'           Case',
'             When Exists (Select 1 From PurchaseOrderClose poc',
'                           Where poc.PurchaseOrderTNo = o.TNo) Then ''CLOSED''',
'             When Sum(Case When nvl(od.Quantity1,0) > 0',
'                            And nvl(od.ReceivedQuantity1,0) >= od.Quantity1',
'                           Then 1 Else 0 End) = Count(*) Then ''FULL''',
'             When Sum(nvl(od.ReceivedQuantity1,0)) > 0 Then ''PART''',
'             Else ''AWAIT''',
'           End BucketKey',
'      From PCC_PurchaseOrder o',
'      Join PurchaseOrderDetail od On od.TNo = o.TNo',
'     Where o.PurchaseOrderDate',
'           Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'               And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'            Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'       And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'       And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'       And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)',
'     Group By o.TNo)',
' Group By BUCKET',
' Order By SORT_KEY',
')',
'Select',
'  ''<div class="ds-svgdonut" data-chart-type="donut" data-total-label="orders" data-focus-item="P934_PIPE_FOCUS" data-refresh-target="p668PipeOrders" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.BUCKET), ''v'' value q.ORDERS, ''k'' value q.BUCKET_KEY, ''d'' value q.BUCKET, ''u'' value null returning clob)',
'                  order by q.SORT_KEY returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082802)
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
 p_id=>wwv_flow_imp.id(955506573351436077)
,p_name=>'Pipeline by Document Type'
,p_static_id=>'pipeline-doctype'
,p_template=>4072358936313175081
,p_display_sequence=>34
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_new_grid_row=>false
,p_grid_column_span=>8
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'Ord As (',
'  Select o.DocTypeCode,',
'         Count(Distinct o.TNo) Orders,',
'         Sum(od.Amount) OrderValue,',
'         Count(*) Lines,',
'         Sum(Case When nvl(od.Quantity1,0) > 0',
'                   And nvl(od.ReceivedQuantity1,0) >= od.Quantity1',
'                  Then 1 Else 0 End) LinesFull',
'    From PCC_PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'   Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)',
'   Group By o.DocTypeCode),',
'Bil As (',
'  Select o.DocTypeCode, Sum(d.Amount) Billed',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'    Join PCC_PurchaseOrder o On o.TNo = h.PurchaseOrderTNo',
'   Cross Join Win w',
'   Where o.PurchaseOrderDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or o.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or o.PartyCode = :P934_SUPPLIER)',
'     And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And Exists (Select 1 From PurchaseOrderDetail valid_line Where valid_line.TNo = o.TNo)',
'   Group By o.DocTypeCode)',
'Select',
'  nvl((Select dt.DocTypeName From DocType dt',
'        Where dt.DocTypeCode = o.DocTypeCode), o.DocTypeCode) As ORDER_TYPE,',
'  o.Orders As ORDERS,',
'  Round(o.OrderValue / 100000, 2) As ORDER_VALUE_LAC,',
'  ''<span class="ds-sharecell"><span class="ds-bar ds-bar--teal"><i style="width:''',
'  || to_char(Round(100 * o.LinesFull / Nullif(o.Lines,0),1),''FM99999990D0'')',
'  || ''%"></i></span><b>''',
'  || to_char(Round(100 * o.LinesFull / Nullif(o.Lines,0),1),''FM99999990D0'')',
'  || ''%</b></span>'' As RECEIVED,',
'  Case When nvl(o.OrderValue,0) > 0',
'       Then ''<span class="ds-sharecell"><span class="ds-bar ds-bar--blue"><i style="width:''',
'            || to_char(Least(Round(100 * nvl(b.Billed,0) / o.OrderValue,1),100),''FM99999990D0'')',
'            || ''%"></i></span><b>''',
'            || to_char(Round(100 * nvl(b.Billed,0) / o.OrderValue,1),''FM99999990D0'')',
'            || ''%</b></span>''',
'       Else ''<span class="ds-muted">no order value</span>'' End As BILLED',
'From Ord o',
'Left Join Bil b On b.DocTypeCode = o.DocTypeCode',
'Order By o.OrderValue Desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No purchase orders were raised in this period and scope.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955507016291436078)
,p_query_column_id=>5
,p_column_alias=>'BILLED'
,p_column_display_sequence=>50
,p_column_heading=>'Billed (of value)'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Measured on VALUE, not quantity \2014 PurchaseBillQuantity1 is absent from this application. The bar is capped at 100% but the printed figure is not, so over-billing stays visible rather than being clipped away.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955506705269436078)
,p_query_column_id=>2
,p_column_alias=>'ORDERS'
,p_column_display_sequence=>20
,p_column_heading=>'Orders'
,p_column_format=>'FM999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('COUNT(DISTINCT order) \2014 the join to the detail would otherwise multiply the header.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955506667353436078)
,p_query_column_id=>1
,p_column_alias=>'ORDER_TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Order Type'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'DocType resolved to its name, falling back to the code where the master row is missing.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955506839291436078)
,p_query_column_id=>3
,p_column_alias=>'ORDER_VALUE_LAC'
,p_column_display_sequence=>30
,p_column_heading=>'Order Value (Rs Lac)'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Committed value by document type. A handful of capital orders can outweigh thousands of revenue ones, which is why this panel is ordered by value rather than count.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955506950805436078)
,p_query_column_id=>4
,p_column_alias=>'RECEIVED'
,p_column_display_sequence=>40
,p_column_heading=>'Received (of lines)'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Proportion of order LINES fully received \2014 unit-free, so it stays valid on a mixed-unit order. The heading names the basis because it differs from the Billed column beside it.')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955508243754436104)
,p_plug_name=>'Orders Behind the Selected Slice'
,p_static_id=>'pipeline-orders'
,p_region_name=>'p668PipeOrders'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>43
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  x.PurchaseOrderNo As ORDER_NO,',
'  x.PurchaseOrderDate As ORDER_DATE,',
'  GetPartyName(x.PartyCode) As SUPPLIER,',
'  GetLocationName(x.LocationCode) As LOCATION,',
'  x.Lines As LINES,',
'  x.OrderedQty As ORDERED_QTY,',
'  x.AwaitingQty As AWAITING_QTY,',
'  x.OrderValue As ORDER_VALUE,',
'  x.PendingValue As PENDING_VALUE,',
'  x.PartyCode As PARTYCODE,',
'  x.TNo As PO_TNO',
'From (',
'  Select o.TNo, o.PurchaseOrderNo, o.PurchaseOrderDate,',
'         o.PartyCode, o.LocationCode,',
'         Count(*) Lines,',
'         Sum(od.Quantity1) OrderedQty,',
'         Sum(od.Quantity1 - Least(nvl(od.ReceivedQuantity1,0), od.Quantity1)) AwaitingQty,',
'         Sum(od.Amount) OrderValue,',
'         Sum(od.Amount * (od.Quantity1',
'           - Least(nvl(od.ReceivedQuantity1,0), od.Quantity1))',
'           / Nullif(od.Quantity1,0)) PendingValue,',
'         Case',
'           When Exists (Select 1 From PurchaseOrderClose poc',
'                         Where poc.PurchaseOrderTNo = o.TNo) Then ''CLOSED''',
'           When Sum(Case When nvl(od.Quantity1,0) > 0',
'                          And nvl(od.ReceivedQuantity1,0) >= od.Quantity1',
'                         Then 1 Else 0 End) = Count(*) Then ''FULL''',
'           When Sum(nvl(od.ReceivedQuantity1,0)) > 0 Then ''PART''',
'           Else ''AWAIT''',
'         End BucketKey',
'    From PCC_PurchaseOrder o',
'    Join PurchaseOrderDetail od On od.TNo = o.TNo',
'   Where :P934_PIPE_FOCUS Is Not Null',
'     And o.PurchaseOrderDate',
'         Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)',
'   Group By o.TNo, o.PurchaseOrderNo, o.PurchaseOrderDate,',
'            o.PartyCode, o.LocationCode) x',
'Where x.BucketKey = :P934_PIPE_FOCUS',
'Order By x.OrderValue Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_PIPE_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
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
 p_id=>wwv_flow_imp.id(955508362842436104)
,p_max_row_count=>'100000'
,p_no_data_found_message=>'Click a slice of the Pipeline Conversion chart to list the orders behind it.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21508362842436104
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(978933876244944755)
,p_db_column_name=>'AWAITING_QTY'
,p_display_order=>54
,p_column_identifier=>'I'
,p_column_label=>'Awaiting Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Quantity still to be received (ordered minus received).'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955509029654436104)
,p_db_column_name=>'LINES'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Lines'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Order line count.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955508982886436104)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Location that raised the order.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(978933793406944754)
,p_db_column_name=>'ORDERED_QTY'
,p_display_order=>52
,p_column_identifier=>'H'
,p_column_label=>'Ordered Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Total quantity ordered across the PO lines.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955508713609436104)
,p_db_column_name=>'ORDER_DATE'
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
,p_column_comment=>'Date the order was raised.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955508600189436104)
,p_db_column_name=>'ORDER_NO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Order No'
,p_column_link=>'f?p=&APP_ID.:939:&APP_SESSION.::NO:939:P939_TNO:#PO_TNO#'
,p_column_linktext=>'#ORDER_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Drills to Purchase Order 360. The link travels on TNo so it works whatever the numbering scheme looks like.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955509156539436104)
,p_db_column_name=>'ORDER_VALUE'
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>'Order Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Committed value. Summing this column reproduces the slice''s share of the order book.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955508495549436104)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>4
,p_column_identifier=>'A'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key for the supplier link. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955509245982436104)
,p_db_column_name=>'PENDING_VALUE'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Pending Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Pro-rated within the line and guarded by LEAST so over-receipt cannot make it negative. Zero on the Fully received and Short-closed slices, which is the point of showing it here.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955508522159436104)
,p_db_column_name=>'PO_TNO'
,p_display_order=>5
,p_column_identifier=>'B'
,p_column_label=>'PO Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key to Purchase Order 360. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955508865992436104)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Supplier'
,p_column_link=>'f?p=&APP_ID.:935:&APP_SESSION.::NO:935:P935_SUPPLIER,P935_FROMDATE,P935_TODATE,P935_COMPANY,P935_LOCATION,P935_PANEL:#PARTYCODE#,&P934_FROMDATE.,&P934_TODATE.,&P934_COMPANY.,&P934_LOCATION.,&P934_PANEL.'
,p_column_linktext=>'#SUPPLIER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Drills to Supplier 360 with the full filter context.'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(956296066136724553)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PARTYCODE:PO_TNO:ORDER_NO:ORDER_DATE:SUPPLIER:LOCATION:LINES:ORDERED_QTY:AWAITING_QTY:ORDER_VALUE:PENDING_VALUE'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955512786689436106)
,p_name=>'Purchase by Financial Year - click a column to view supplier results'
,p_static_id=>'purchase-by-fy'
,p_template=>4072358936313175081
,p_display_sequence=>53
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With chart_q As (',
'Select fy.FinancialYearCode As FIN_YEAR,',
'       Round(Sum(d.Amount) / 10000000, 2) As VALUE_CR,',
'       Min(fy.FinancialYearBegin) As SORT_KEY,',
'       to_char(Min(fy.FinancialYearBegin),''DD-MM-RRRR'') FILTER_FROM,',
'       to_char(Max(fy.FinancialYearEnd),''DD-MM-RRRR'') FILTER_TO',
'  From PCC_PurchaseBill h',
'  Join PurchaseBillDetail d On d.TNo = h.TNo',
'  Join FinancialYear fy',
'    On h.PurchaseBillDate Between fy.FinancialYearBegin',
'                              And fy.FinancialYearEnd',
' Where ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
' Group By fy.FinancialYearCode',
' Order By SORT_KEY',
')',
'Select',
'  ''<div class="ds-p668-viz" data-chart-type="column" data-total-label="Rs crore" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.FIN_YEAR), ''v'' value q.VALUE_CR, ''f'' value q.FILTER_FROM, ''t'' value q.FILTER_TO, ''u'' value null returning clob)',
'                  order by q.SORT_KEY returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082804)
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
 p_id=>wwv_flow_imp.id(959347997794803042)
,p_plug_name=>'Quick Periods'
,p_static_id=>'quick-periods'
,p_region_css_classes=>'ds-periods-wrap'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>11
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-periods">',
'  <span class="ds-periods-lbl">Quick period</span>',
'  <button type="button" class="ds-period" data-range="month">This Month</button>',
'  <button type="button" class="ds-period" data-range="quarter">This Quarter</button>',
'  <button type="button" class="ds-period" data-range="fy">This FY</button>',
'  <button type="button" class="ds-period" data-range="d30">Last 30 Days</button>',
'  <button type="button" class="ds-period" data-range="d90">Last 90 Days</button>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955521863610436164)
,p_name=>'Quick Reports'
,p_static_id=>'quick-reports'
,p_template=>4501440665235496320
,p_display_sequence=>112
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--gateway'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Ctx As (',
'       Select :P934_FROMDATE F, :P934_TODATE T,',
'              :P934_COMPANY C, :P934_LOCATION L, :P934_PANEL P',
'         From dual),',
'Tile As (',
'  -- Suite pages: full context, including panel.',
'  Select 10 Seq, ''Supplier 360'' Nm, ''fa-user-circle-o'' Ic,',
'         ''One supplier: ordered, received, billed, passed, paid, outstanding'' D,',
'         apex_page.get_url(',
'           p_page => 935, p_clear_cache => ''935'',',
'           p_items => ''P935_FROMDATE,P935_TODATE,P935_COMPANY,P935_LOCATION,P935_PANEL'',',
'           p_values => F||'',''||T||'',''||C||'',''||L||'',''||P) Url',
'    From Ctx',
'  Union All',
'  Select 20, ''Item 360'', ''fa-cube'',',
'         ''One item and unit: realised rate, specification mix, vendor comparison'',',
'         apex_page.get_url(',
'           p_page => 936, p_clear_cache => ''936'',',
'           p_items => ''P936_FROMDATE,P936_TODATE,P936_COMPANY,P936_LOCATION,P936_PANEL'',',
'           p_values => F||'',''||T||'',''||C||'',''||L||'',''||P)',
'    From Ctx',
'  Union All',
'  Select 30, ''Purchase Order 360'', ''fa-shopping-cart'',',
'         ''One order: lines, receipts, bills and what is still pending'',',
'         apex_page.get_url(p_page => 939, p_clear_cache => ''939'')',
'    From dual',
'  Union All',
'  Select 40, ''Purchase Analytics'', ''fa-line-chart'',',
'         ''Spend by grain and dimension, vendor scorecard, price movement, executive exceptions'',',
'         apex_page.get_url(',
'           p_page => 940, p_clear_cache => ''940'',',
'           p_items => ''P940_FROMDATE,P940_TODATE,P940_COMPANY,P940_LOCATION,P940_PANEL'',',
'           p_values => F||'',''||T||'',''||C||'',''||L||'',''||P)',
'    From Ctx',
'  Union All',
'  Select 35, ''Purchase Bill 360'', ''fa-file-text-o'',',
'         ''One supplier invoice: lines, pass, settlement and the receipts behind it'',',
'         apex_page.get_url(p_page => 937, p_clear_cache => ''937'')',
'    From dual',
'  Union All',
'  -- Legacy registers: each takes only the items it actually defines.',
'  Select 50, ''Purchase Bill Register'', ''fa-file-text-o'',',
'         ''Supplier invoices booked against receipts'',',
'         apex_page.get_url(',
'           p_page => 142, p_clear_cache => ''142'',',
'           p_items => ''P142_FROMDATE,P142_TODATE,P142_COMPANY,P142_LOCATION'',',
'           p_values => F||'',''||T||'',''||C||'',''||L)',
'    From Ctx',
'  Union All',
'  Select 60, ''Purchase Order Register'', ''fa-list-alt'',',
'         ''Every order raised in the period'',',
'         apex_page.get_url(',
'           p_page => 117, p_clear_cache => ''117'',',
'           p_items => ''P117_FROMDATE,P117_TODATE,P117_COMPANY,P117_LOCATION'',',
'           p_values => F||'',''||T||'',''||C||'',''||L)',
'    From Ctx',
'  Union All',
'  Select 70, ''Bill Pass Register'', ''fa-check-square-o'',',
'         ''Bills approved for payment and posted to the ledger'',',
'         apex_page.get_url(p_page => 151, p_clear_cache => ''151'')',
'    From dual',
'  Union All',
'  Select 80, ''GRN Register'', ''fa-truck'',',
'         ''Material accepted into stock'',',
'         apex_page.get_url(p_page => 145, p_clear_cache => ''145'')',
'    From dual',
'  Union All',
'  Select 90, ''Material In Register'', ''fa-sign-in'',',
'         ''Vehicles booked in at the gate'',',
'         apex_page.get_url(p_page => 68, p_clear_cache => ''68'')',
'    From dual',
'  Union All',
'  Select 100, ''Indent Register'', ''fa-file-o'',',
'         ''Internal demand raised before a supplier is chosen'',',
'         apex_page.get_url(p_page => 107, p_clear_cache => ''107'')',
'    From dual',
'  Union All',
'  Select 110, ''Quotation Register'', ''fa-comments-o'',',
'         ''Supplier responses against enquiries'',',
'         apex_page.get_url(p_page => 709, p_clear_cache => ''709'')',
'    From dual',
'  Union All',
'  Select 120, ''Comparative Statement Register'', ''fa-balance-scale'',',
'         ''Quotations set side by side before the buying decision'',',
'         apex_page.get_url(p_page => 711, p_clear_cache => ''711'')',
'    From dual',
'  Union All',
'  Select 130, ''Freight Advice Register'', ''fa-road'',',
'         ''The transporter billing document, the only defensible freight figure'',',
'         apex_page.get_url(p_page => 198, p_clear_cache => ''198'')',
'    From dual',
'  Union All',
'  Select 140, ''Account Ledger'', ''fa-book'',',
unistr('         ''The supplier ledger \2014 the settled position that survives every route'','),
'         apex_page.get_url(',
'           p_page => 11, p_clear_cache => ''11'',',
'           p_items => ''P11_FROMDATE,P11_TODATE,P11_LOCATION'',',
'           p_values => F||'',''||T||'',''||L)',
'    From Ctx)',
'Select',
'  t.Seq,',
'  ''<a class="ds-gateway" href="'' || t.Url || ''">''',
'  || ''<span class="ds-gateway-ic"><span class="fa '' || t.Ic || ''"></span></span>''',
'  || ''<span class="ds-gateway-body">''',
'  || ''<span class="ds-gateway-t">'' || apex_escape.html(t.Nm) || ''</span>''',
'  || ''<span class="ds-gateway-d">'' || apex_escape.html(t.D) || ''</span>''',
'  || ''</span>''',
'  || ''<span class="ds-gateway-go"><span class="fa fa-chevron-right"></span></span>''',
'  || ''</a>'' As TILE',
'From Tile t',
'Order By t.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Quick reports unavailable.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955521978694436164)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_column_comment=>unistr('Tile order \2014 suite 360 pages first, then the registers. Must stay projected so APEX cannot eliminate the ORDER BY.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955522028320436164)
,p_query_column_id=>2
,p_column_alias=>'TILE'
,p_column_display_sequence=>10
,p_column_heading=>'Report'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'One gateway card per destination. Built with apex_page.get_url in SQL because every row targets a different page, which a classic-report link column cannot do. Each URL passes only the items its target actually defines.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955509420186436104)
,p_plug_name=>'Orders in the Last 10 Days'
,p_static_id=>'recent-orders'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>47
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  o.PurchaseOrderNo As ORDER_NO,',
'  o.PurchaseOrderDate As ORDER_DATE,',
'  GetPartyName(o.PartyCode) As SUPPLIER,',
'  GetLocationName(o.LocationCode) As LOCATION,',
'  nvl((Select dt.DocTypeName From DocType dt',
'        Where dt.DocTypeCode = o.DocTypeCode), o.DocTypeCode) As TYPE,',
'  Count(*) As LINES,',
'  Sum(od.Amount) As ORDER_VALUE,',
'  ''<span class="ds-pill ds-pill--''',
'  || Case',
'       When Sum(Case When nvl(od.Quantity1,0) > 0',
'                      And nvl(od.ReceivedQuantity1,0) >= od.Quantity1',
'                     Then 1 Else 0 End) = Count(*) Then ''good''',
'       When Sum(nvl(od.ReceivedQuantity1,0)) > 0 Then ''warn''',
'       Else ''muted'' End',
'  || ''">''',
'  || Case',
'       When Sum(Case When nvl(od.Quantity1,0) > 0',
'                      And nvl(od.ReceivedQuantity1,0) >= od.Quantity1',
'                     Then 1 Else 0 End) = Count(*) Then ''Fully received''',
'       When Sum(nvl(od.ReceivedQuantity1,0)) > 0 Then ''Part received''',
'       Else ''Awaiting material'' End',
'  || ''</span>'' As STATUS,',
'  o.PartyCode As PARTYCODE,',
'  o.TNo As PO_TNO',
'From PCC_PurchaseOrder o',
'Join PurchaseOrderDetail od On od.TNo = o.TNo',
'Where o.PurchaseOrderDate',
'      >  to_date(:P934_TODATE,''DD-MM-RRRR'') - 10',
'  And o.PurchaseOrderDate <= to_date(:P934_TODATE,''DD-MM-RRRR'')',
'  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'       Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'  And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'  And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'  And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'  And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)',
'Group By o.PurchaseOrderNo, o.PurchaseOrderDate, o.PartyCode,',
'         o.LocationCode, o.DocTypeCode, o.TNo',
'Order By o.PurchaseOrderDate Desc, o.PurchaseOrderNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
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
 p_id=>wwv_flow_imp.id(955509572495436105)
,p_no_data_found_message=>'No purchase order was raised in the ten days before the selected To Date.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21509572495436105
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955510380466436105)
,p_db_column_name=>'LINES'
,p_display_order=>60
,p_column_identifier=>'H'
,p_column_label=>'Lines'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Order line count.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955510102858436105)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'F'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Location that raised the order.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955509908207436105)
,p_db_column_name=>'ORDER_DATE'
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
,p_column_comment=>'The date the ten-day window is measured against.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955509832379436105)
,p_db_column_name=>'ORDER_NO'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Order No'
,p_column_link=>'f?p=&APP_ID.:939:&APP_SESSION.::NO:939:P939_TNO:#PO_TNO#'
,p_column_linktext=>'#ORDER_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Printed exactly as stored \2014 most doc types here use a structured number rather than a running serial. The link travels on TNo, so it works whatever the numbering looks like.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955510428630436105)
,p_db_column_name=>'ORDER_VALUE'
,p_display_order=>70
,p_column_identifier=>'I'
,p_column_label=>'Order Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('SUM(PurchaseOrderDetail.Amount) \2014 committed value, excludes footer tax on the header.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955509658521436105)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>4
,p_column_identifier=>'A'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key for the supplier link. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955509771286436105)
,p_db_column_name=>'PO_TNO'
,p_display_order=>5
,p_column_identifier=>'B'
,p_column_label=>'PO Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Technical drill key to Purchase Order 360. Never displayed.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955510574060436105)
,p_db_column_name=>'STATUS'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Derived from the order line. Recent orders are mostly "Awaiting material" by construction \2014 they have not had time to be received, which is not a finding.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955510095412436105)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'E'
,p_column_label=>'Supplier'
,p_column_link=>'f?p=&APP_ID.:935:&APP_SESSION.::NO:935:P935_SUPPLIER,P935_FROMDATE,P935_TODATE,P935_COMPANY,P935_LOCATION,P935_PANEL:#PARTYCODE#,&P934_FROMDATE.,&P934_TODATE.,&P934_COMPANY.,&P934_LOCATION.,&P934_PANEL.'
,p_column_linktext=>'#SUPPLIER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Drills to Supplier 360 with the full filter context.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955510216557436105)
,p_db_column_name=>'TYPE'
,p_display_order=>50
,p_column_identifier=>'G'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Document type \2014 capital, revenue and fuel orders behave very differently and should not be read as one population.')
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(956296670801724554)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PARTYCODE:PO_TNO:ORDER_NO:ORDER_DATE:SUPPLIER:LOCATION:TYPE:LINES:ORDER_VALUE:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979436741235127690)
,p_plug_name=>'Purchase Bill Register'
,p_static_id=>'reg-e-bill'
,p_region_name=>'p668RegE40'
,p_region_css_classes=>'ds-register ds-execreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(b.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       b.PurchaseBillNo                As BILL_NO,',
'       b.PurchaseBillDate              As BILL_DATE,',
'       GetPartyName(b.PartyCode)       As SUPPLIER,',
'       b.PartyBillNo                   As PARTY_BILL_NO,',
'       b.PartyBillDate                 As PARTY_BILL_DATE,',
'       b.PurchaseBillAmount            As BILL_AMOUNT,',
'       GetLocationName(b.LocationCode) As LOCATION',
'  From PCC_PurchaseBill b',
' Where :P934_EXEC_FOCUS = ''40''',
'   And b.PurchaseBillNo Is Not Null',
'   And b.PurchaseBillDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or b.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or b.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or b.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or b.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or b.PartyCode    = :P934_SUPPLIER)',
' Order By b.PurchaseBillDate Desc, b.PurchaseBillNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_EXEC_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_EXEC_FOCUS'
,p_plug_display_when_cond2=>'40'
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
 p_id=>wwv_flow_imp.id(979436809514127690)
,p_no_data_found_message=>'No purchase bills in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45436809514127690
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979437444670127690)
,p_db_column_name=>'BILL_AMOUNT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Bill Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979437056240127690)
,p_db_column_name=>'BILL_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Bill Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979436912627127690)
,p_db_column_name=>'BILL_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Bill No'
,p_column_link=>'f?p=&APP_ID.:937:&APP_SESSION.::NO:937:P937_TNO:#TNO_KEY#'
,p_column_linktext=>'#BILL_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Purchase Bill 360"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979437551420127690)
,p_db_column_name=>'LOCATION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979437324093127690)
,p_db_column_name=>'PARTY_BILL_DATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Party Bill Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979437257199127690)
,p_db_column_name=>'PARTY_BILL_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Party Bill No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979437177099127690)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000001)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979457267345186739)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'BILL_NO:BILL_DATE:SUPPLIER:PARTY_BILL_NO:PARTY_BILL_DATE:BILL_AMOUNT:LOCATION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979437653110127691)
,p_plug_name=>'Bill Pass Register'
,p_static_id=>'reg-e-billpass'
,p_region_name=>'p668RegE50'
,p_region_css_classes=>'ds-register ds-execreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(p.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       p.PBPassNo                      As PASS_NO,',
'       p.PBPassDate                    As PASS_DATE,',
'       GetPartyName(h.PartyCode)       As SUPPLIER,',
'       p.PBPassAmount                  As PASS_AMOUNT,',
'       p.PaidAmount                    As PAID,',
'       p.DueDate                       As DUE_DATE',
'  From PCC_PBPass p',
'  Join PCC_PurchaseBill h On h.TNo = p.PurchaseBillTNo',
' Where :P934_EXEC_FOCUS = ''50''',
'   And p.PBPassNo Is Not Null',
'   And p.PBPassDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or p.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or p.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or p.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or p.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
' Order By p.PBPassDate Desc, p.PBPassNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_EXEC_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_EXEC_FOCUS'
,p_plug_display_when_cond2=>'50'
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
 p_id=>wwv_flow_imp.id(979437768334127691)
,p_no_data_found_message=>'No bill passes in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45437768334127691
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979438393687127711)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979438268162127711)
,p_db_column_name=>'PAID'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Paid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979438153577127711)
,p_db_column_name=>'PASS_AMOUNT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Pass Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979437942873127691)
,p_db_column_name=>'PASS_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Pass Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979437846973127691)
,p_db_column_name=>'PASS_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Pass No'
,p_column_link=>'f?p=&APP_ID.:152:&APP_SESSION.::NO:152:P152_TNO,P152_CALLEDFROMPAGE:#TNO_KEY#,934'
,p_column_linktext=>'#PASS_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Bill Pass form"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979438022203127691)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000002)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979457853605186739)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PASS_NO:PASS_DATE:SUPPLIER:PASS_AMOUNT:PAID:DUE_DATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979435822441127690)
,p_plug_name=>'GRN Register'
,p_static_id=>'reg-e-grn'
,p_region_name=>'p668RegE30'
,p_region_css_classes=>'ds-register ds-execreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(g.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       g.GrnNo                         As GRN_NO,',
'       g.GrnDate                       As GRN_DATE,',
'       GetPartyName(g.PartyCode)       As SUPPLIER,',
'       GetLocationName(g.LocationCode) As LOCATION,',
'       g.VehicleNo                     As VEHICLE,',
'       g.ChallanNo                     As CHALLAN,',
'       g.Remark                        As REMARK',
'  From PCC_Grn g',
' Where :P934_EXEC_FOCUS = ''30''',
'   And Exists (Select 1 From GrnDetail valid_line Where valid_line.TNo = g.TNo)',
'   And g.GrnDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or g.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or g.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or g.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or g.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or g.PartyCode    = :P934_SUPPLIER)',
' Order By g.GrnDate Desc, g.GrnNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_EXEC_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_EXEC_FOCUS'
,p_plug_display_when_cond2=>'30'
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
 p_id=>wwv_flow_imp.id(979435997192127690)
,p_no_data_found_message=>'No GRNs in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45435997192127690
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979436590017127690)
,p_db_column_name=>'CHALLAN'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Challan'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979436132970127690)
,p_db_column_name=>'GRN_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'GRN Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979436093125127690)
,p_db_column_name=>'GRN_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'GRN No'
,p_column_link=>'f?p=&APP_ID.:146:&APP_SESSION.::NO:146:P146_TNO,P146_CALLEDFROMPAGE:#TNO_KEY#,934'
,p_column_linktext=>'#GRN_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open GRN form"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979436371180127690)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979436619346127690)
,p_db_column_name=>'REMARK'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979436279503127690)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000003)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979436493197127690)
,p_db_column_name=>'VEHICLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Vehicle'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979456608950186738)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'GRN_NO:GRN_DATE:SUPPLIER:LOCATION:VEHICLE:CHALLAN:REMARK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979434965220127690)
,p_plug_name=>'Material In Register'
,p_static_id=>'reg-e-materialin'
,p_region_name=>'p668RegE20'
,p_region_css_classes=>'ds-register ds-execreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(m.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       m.MaterialInNo                  As MIN_NO,',
'       m.MaterialInDate                As MIN_DATE,',
'       GetPartyName(m.PartyCode)       As SUPPLIER,',
'       GetLocationName(m.LocationCode) As LOCATION,',
'       m.VehicleNo                     As VEHICLE,',
'       m.NetWeight                     As NET_WT,',
'       m.Remark                        As REMARK',
'  From PCC_MaterialIn m',
' Where :P934_EXEC_FOCUS = ''20''',
'   And m.MaterialInNo Is Not Null',
'   And m.MaterialInDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or m.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or m.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or m.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or m.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or m.PartyCode    = :P934_SUPPLIER)',
' Order By m.MaterialInDate Desc, m.MaterialInNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_EXEC_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_EXEC_FOCUS'
,p_plug_display_when_cond2=>'20'
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
 p_id=>wwv_flow_imp.id(979435066894127690)
,p_no_data_found_message=>'No material-in entries in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45435066894127690
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979435460631127690)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979435200847127690)
,p_db_column_name=>'MIN_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'MIn Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979435101591127690)
,p_db_column_name=>'MIN_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'MIn No'
,p_column_link=>'f?p=&APP_ID.:69:&APP_SESSION.::NO:69:P69_TNO,P69_CALLEDFROMPAGE:#TNO_KEY#,934'
,p_column_linktext=>'#MIN_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Material In form"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979435620879127690)
,p_db_column_name=>'NET_WT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Net Wt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979435795476127690)
,p_db_column_name=>'REMARK'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979435327215127690)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000004)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979435576133127690)
,p_db_column_name=>'VEHICLE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Vehicle'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979456067329186738)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'MIN_NO:MIN_DATE:SUPPLIER:LOCATION:VEHICLE:NET_WT:REMARK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979438447062127711)
,p_plug_name=>'Payment Register'
,p_static_id=>'reg-e-paid'
,p_region_name=>'p668RegE60'
,p_region_css_classes=>'ds-register ds-execreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(v.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       v.VoucherNo                     As VOUCHER_NO,',
'       v.VoucherDate                   As VOUCHER_DATE,',
'       v.Narration                     As NARRATION,',
'       Sum(-vd.Amount)                 As AMOUNT',
'  From PCC_Voucher v',
'  Join VoucherDetail vd On vd.TNo = v.TNo',
' Where :P934_EXEC_FOCUS = ''60''',
'   And v.DocTypeCode = ''PAYMENT''',
'   And vd.Amount < 0',
'   And v.VoucherDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or v.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or v.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or v.CompanyCode  = :P934_COMPANY)',
' Group By v.TNo, v.VoucherNo, v.VoucherDate, v.Narration',
' Order By v.VoucherDate Desc, v.VoucherNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_EXEC_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_EXEC_FOCUS'
,p_plug_display_when_cond2=>'60'
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
 p_id=>wwv_flow_imp.id(979438580762127711)
,p_no_data_found_message=>'No payment vouchers in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45438580762127711
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979438976800127711)
,p_db_column_name=>'AMOUNT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979438803907127711)
,p_db_column_name=>'NARRATION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000005)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979438755358127711)
,p_db_column_name=>'VOUCHER_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Voucher Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979438645317127711)
,p_db_column_name=>'VOUCHER_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Voucher No'
,p_column_link=>'f?p=&APP_ID.:156:&APP_SESSION.::NO:156:P156_TNO,P156_CALLEDFROMPAGE:#TNO_KEY#,934'
,p_column_linktext=>'#VOUCHER_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Payment Voucher form"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979458472704186740)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'VOUCHER_NO:VOUCHER_DATE:NARRATION:AMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979433990265127689)
,p_plug_name=>'Purchase Order Register (Execution)'
,p_static_id=>'reg-e-po'
,p_region_name=>'p668RegE10'
,p_region_css_classes=>'ds-register ds-execreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(o.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       o.PurchaseOrderNo                 As PO_NO,',
'       o.PurchaseOrderDate               As PO_DATE,',
'       GetPartyName(o.PartyCode)         As SUPPLIER,',
'       GetLocationName(o.LocationCode)   As LOCATION,',
'       o.DeliveryDate                    As DELIVERY,',
'       o.PurchaseOrderAmount             As PO_VALUE,',
'       o.PaidAmount                      As PAID,',
'       o.DepartmentCode                  As DEPT',
'  From PCC_PurchaseOrder o',
' Where :P934_EXEC_FOCUS = ''10''',
'   And Exists (Select 1 From PurchaseOrderDetail valid_line Where valid_line.TNo = o.TNo)',
'   And o.PurchaseOrderDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or o.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)',
' Order By o.PurchaseOrderDate Desc, o.PurchaseOrderNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_EXEC_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_EXEC_FOCUS'
,p_plug_display_when_cond2=>'10'
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
 p_id=>wwv_flow_imp.id(979434067750127689)
,p_no_data_found_message=>'No purchase orders in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45434067750127689
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979434551216127689)
,p_db_column_name=>'DELIVERY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Delivery'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979434839446127690)
,p_db_column_name=>'DEPT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Dept'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979434451440127689)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979434720251127690)
,p_db_column_name=>'PAID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Paid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979434227160127689)
,p_db_column_name=>'PO_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'PO Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979434121416127689)
,p_db_column_name=>'PO_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'PO No'
,p_column_link=>'f?p=&APP_ID.:939:&APP_SESSION.::NO:939:P939_TNO:#TNO_KEY#'
,p_column_linktext=>'#PO_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Purchase Order 360"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979434627674127690)
,p_db_column_name=>'PO_VALUE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'PO Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979434357059127689)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000006)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979455405612186737)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PO_NO:PO_DATE:SUPPLIER:LOCATION:DELIVERY:PO_VALUE:PAID:DEPT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979433219546127689)
,p_plug_name=>'Comparative Statement Register'
,p_static_id=>'reg-s-cs'
,p_region_name=>'p668RegS40'
,p_region_css_classes=>'ds-register ds-srcreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(c.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       c.ComparativeStatementNo       As CS_NO,',
'       c.ComparativeStatementDate     As CS_DATE,',
'       GetLocationName(c.LocationCode) As LOCATION,',
'       c.DepartmentCode               As DEPT,',
'       c.Remark                       As REMARK',
'  From PCC_ComparativeStatement c',
' Where :P934_STAGE_FOCUS = ''40''',
'   And c.ComparativeStatementNo Is Not Null',
'   And c.ComparativeStatementDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or c.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or c.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or c.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or c.LocationCode = :P934_LOCATION)',
' Order By c.ComparativeStatementDate Desc, c.ComparativeStatementNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_STAGE_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_STAGE_FOCUS'
,p_plug_display_when_cond2=>'40'
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
 p_id=>wwv_flow_imp.id(979433318870127689)
,p_no_data_found_message=>'No comparative statements in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45433318870127689
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979433580611127689)
,p_db_column_name=>'CS_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'CS Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979433407192127689)
,p_db_column_name=>'CS_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'CS No'
,p_column_link=>'f?p=&APP_ID.:712:&APP_SESSION.::NO:712:P712_TNO,P712_CALLEDFROMPAGE:#TNO_KEY#,934'
,p_column_linktext=>'#CS_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Comparative Statement form"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979433780717127689)
,p_db_column_name=>'DEPT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979433628935127689)
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
 p_id=>wwv_flow_imp.id(979433882864127689)
,p_db_column_name=>'REMARK'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000007)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979454094310186734)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'CS_NO:CS_DATE:LOCATION:DEPT:REMARK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979431739716127688)
,p_plug_name=>'Enquiry Register'
,p_static_id=>'reg-s-enquiry'
,p_region_name=>'p668RegS20'
,p_region_css_classes=>'ds-register ds-srcreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(e.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       e.EnquiryNo                    As ENQUIRY_NO,',
'       e.EnquiryDate                  As ENQUIRY_DATE,',
'       GetLocationName(e.LocationCode) As LOCATION,',
'       e.Subject                      As SUBJECT,',
'       e.Remark                       As REMARK',
'  From PCC_Enquiry e',
' Where :P934_STAGE_FOCUS = ''20''',
'   And e.EnquiryNo Is Not Null',
'   And e.EnquiryDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or e.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or e.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or e.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or e.LocationCode = :P934_LOCATION)',
' Order By e.EnquiryDate Desc, e.EnquiryNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_STAGE_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_STAGE_FOCUS'
,p_plug_display_when_cond2=>'20'
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
 p_id=>wwv_flow_imp.id(979431884916127689)
,p_no_data_found_message=>'No enquiries in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45431884916127689
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979432042301127689)
,p_db_column_name=>'ENQUIRY_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Enquiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979431948320127689)
,p_db_column_name=>'ENQUIRY_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Enquiry No'
,p_column_link=>'f?p=&APP_ID.:708:&APP_SESSION.::NO:708:P708_TNO,P708_CALLEDFROMPAGE:#TNO_KEY#,934'
,p_column_linktext=>'#ENQUIRY_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Enquiry form"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979432154751127689)
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
 p_id=>wwv_flow_imp.id(979432308562127689)
,p_db_column_name=>'REMARK'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979432210891127689)
,p_db_column_name=>'SUBJECT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Subject'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000008)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979452848183186732)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'ENQUIRY_NO:ENQUIRY_DATE:LOCATION:SUBJECT:REMARK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979431044117127667)
,p_plug_name=>'Indent Register'
,p_static_id=>'reg-s-indent'
,p_region_name=>'p668RegS10'
,p_region_css_classes=>'ds-register ds-srcreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(i.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       i.IndentNo                    As INDENT_NO,',
'       i.IndentDate                  As INDENT_DATE,',
'       GetLocationName(i.LocationCode) As LOCATION,',
'       i.DepartmentCode              As DEPT,',
'       i.Remark                      As REMARK',
'  From PCC_Indent i',
' Where :P934_STAGE_FOCUS = ''10''',
'   And i.IndentNo Is Not Null',
'   And i.IndentDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or i.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or i.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or i.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or i.LocationCode = :P934_LOCATION)',
' Order By i.IndentDate Desc, i.IndentNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_STAGE_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_STAGE_FOCUS'
,p_plug_display_when_cond2=>'10'
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
 p_id=>wwv_flow_imp.id(979431122864127667)
,p_no_data_found_message=>'No indents in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45431122864127667
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979431580454127688)
,p_db_column_name=>'DEPT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979431371053127688)
,p_db_column_name=>'INDENT_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Indent Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979431259598127667)
,p_db_column_name=>'INDENT_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Indent No'
,p_column_link=>'f?p=&APP_ID.:108:&APP_SESSION.::NO:108:P108_TNO,P108_CALLEDFROMPAGE:#TNO_KEY#,934'
,p_column_linktext=>'#INDENT_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Indent form"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979431459800127688)
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
 p_id=>wwv_flow_imp.id(979431630467127688)
,p_db_column_name=>'REMARK'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000009)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979452288610186731)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'INDENT_NO:INDENT_DATE:LOCATION:DEPT:REMARK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(977428660770983532)
,p_plug_name=>'Purchase Order Register'
,p_static_id=>'reg-s-po'
,p_region_name=>'p668RegS50'
,p_region_css_classes=>'ds-register ds-srcreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(o.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       o.PurchaseOrderNo                 As PO_NO,',
'       o.PurchaseOrderDate               As PO_DATE,',
'       GetPartyName(o.PartyCode)         As SUPPLIER,',
'       GetLocationName(o.LocationCode)   As LOCATION,',
'       o.DeliveryDate                    As DELIVERY,',
'       o.PurchaseOrderAmount             As PO_VALUE,',
'       o.PaidAmount                      As PAID,',
'       o.DepartmentCode                  As DEPT',
'  From PCC_PurchaseOrder o',
' Where :P934_STAGE_FOCUS = ''50''',
'   And Exists (Select 1 From PurchaseOrderDetail valid_line Where valid_line.TNo = o.TNo)',
'   And o.PurchaseOrderDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or o.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER)',
' Order By o.PurchaseOrderDate Desc, o.PurchaseOrderNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_STAGE_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_STAGE_FOCUS'
,p_plug_display_when_cond2=>'50'
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
 p_id=>wwv_flow_imp.id(977428709971983532)
,p_no_data_found_message=>'No purchase orders in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>43428709971983532
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(977429266798983532)
,p_db_column_name=>'DELIVERY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Delivery'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(977429567393983532)
,p_db_column_name=>'DEPT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Dept'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(977429178087983532)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(977429421734983532)
,p_db_column_name=>'PAID'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Paid'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(977428945595983532)
,p_db_column_name=>'PO_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'PO Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(977428848463983532)
,p_db_column_name=>'PO_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'PO No'
,p_column_link=>'f?p=&APP_ID.:939:&APP_SESSION.::NO:939:P939_TNO:#TNO_KEY#'
,p_column_linktext=>'#PO_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Purchase Order 360"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(977429300842983532)
,p_db_column_name=>'PO_VALUE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'PO Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(977429040678983532)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000010)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(977441382148024886)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'PO_NO:PO_DATE:SUPPLIER:LOCATION:DELIVERY:PO_VALUE:PAID:DEPT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(979432415228127689)
,p_plug_name=>'Quotation Register'
,p_static_id=>'reg-s-quotation'
,p_region_name=>'p668RegS30'
,p_region_css_classes=>'ds-register ds-srcreg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(q.TNo,''FM9999999999999999990'') As TNO_KEY,',
'       q.QuotationNo                  As QUOTATION_NO,',
'       q.QuotationDate                As QUOTATION_DATE,',
'       GetPartyName(q.PartyCode)      As SUPPLIER,',
'       q.QuotationAmount              As AMOUNT,',
'       q.ValidityDate                 As VALIDITY,',
'       q.Remark                       As REMARK',
'  From PCC_Quotation q',
' Where :P934_STAGE_FOCUS = ''30''',
'   And q.QuotationNo Is Not Null',
'   And q.QuotationDate Between to_date(:P934_FROMDATE,''DD-MM-RRRR'') And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or q.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL    Is Null Or q.Panel        = :P934_PANEL)',
'   And (:P934_COMPANY  Is Null Or q.CompanyCode  = :P934_COMPANY)',
'   And (:P934_LOCATION Is Null Or q.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or q.PartyCode    = :P934_SUPPLIER)',
' Order By q.QuotationDate Desc, q.QuotationNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_STAGE_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P934_STAGE_FOCUS'
,p_plug_display_when_cond2=>'30'
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
 p_id=>wwv_flow_imp.id(979432554196127689)
,p_no_data_found_message=>'No quotations in this scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>45432554196127689
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979432921456127689)
,p_db_column_name=>'AMOUNT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979432788997127689)
,p_db_column_name=>'QUOTATION_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Quotation Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979432692832127689)
,p_db_column_name=>'QUOTATION_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Quotation No'
,p_column_link=>'f?p=&APP_ID.:710:&APP_SESSION.::NO:710:P710_TNO,P710_CALLEDFROMPAGE:#TNO_KEY#,934'
,p_column_linktext=>'#QUOTATION_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open Quotation form"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979433124503127689)
,p_db_column_name=>'REMARK'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979432878286127689)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000011)
,p_db_column_name=>'TNO_KEY'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Key'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(979433051502127689)
,p_db_column_name=>'VALIDITY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Validity'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(979453464871186733)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'QUOTATION_NO:QUOTATION_DATE:SUPPLIER:AMOUNT:VALIDITY:REMARK'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955505948783436077)
,p_name=>'How Orders Were Sourced'
,p_static_id=>'route-split'
,p_template=>4072358936313175081
,p_display_sequence=>32
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_new_grid_row=>false
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With chart_q As (',
'Select Route, Count(*) Orders',
'  From (',
'    Select Case',
'             When o.QuotationTno Is Not Null Then ''Tender''',
'             When o.IndentTno    Is Not Null Then ''Direct indent''',
'             Else ''Ad hoc''',
'           End Route',
'      From PCC_PurchaseOrder o',
'     Where Exists (Select 1 From PurchaseOrderDetail valid_line Where valid_line.TNo = o.TNo)',
'       And o.PurchaseOrderDate',
'           Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'               And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'            Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'       And (:P934_COMPANY  Is Null Or o.CompanyCode  = :P934_COMPANY)',
'       And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'       And (:P934_SUPPLIER Is Null Or o.PartyCode    = :P934_SUPPLIER))',
' Group By Route',
' Order By Orders Desc',
')',
'Select',
'  ''<div class="ds-svgdonut" data-chart-type="donut" data-total-label="orders" data-focus-item="P934_STAGE_FOCUS" data-refresh-target="p668StageDetail" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.ROUTE), ''v'' value q.ORDERS, ''k'' value 50, ''d'' value q.ROUTE, ''u'' value null returning clob)',
'                  order by q.ORDERS Desc returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082800)
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
 p_id=>wwv_flow_imp.id(955518007382436135)
,p_plug_name=>'Exceptions and Control'
,p_static_id=>'rule-exceptions'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>90
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Exceptions &amp; Control</h2>',
'  <p>Control failures worth acting on, each with a severity and the value at',
'     stake. Click a count to list the documents behind it. Rules that would',
unistr('     fire on the whole population are deliberately absent \2014 a rule that always'),
'     fires is noise, not control. Where the ERP cannot quantify the exposure,',
'     the register says so instead of showing zero.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955511608711436105)
,p_plug_name=>'Flow Over Time'
,p_static_id=>'rule-flow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>49
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Flow Over Time</h2>',
'  <p>Monthly purchase value, and the live position at the gate. The trend is a',
unistr('     single series by design \2014 a count and a value never share an axis.</p>'),
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955516812266436134)
,p_plug_name=>'Logistics and Intermediaries'
,p_static_id=>'rule-logistics'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>80
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Logistics &amp; Intermediaries</h2>',
'  <p>Freight by transporter, and how much of the buying is routed through a',
'     broker or agent. <strong>Brokerage value is not stored in this ERP</strong>',
'     &mdash; only a commission <em>rate</em> exists &mdash; so coverage is',
'     reported and never a rupee figure. Where a column turns out to be a',
'     placeholder rather than real attribution, the dashboard says so.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955515727765436134)
,p_plug_name=>'What Is Being Bought'
,p_static_id=>'rule-material'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>What Is Being Bought</h2>',
'  <p>Top items by value, and the split by unit of measure. Quantity is',
'     reported <em>within</em> each unit and is never totalled across the',
unistr('     report \2014 showing that a cross-unit total is not available is the whole'),
'     point of the second section.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955509307197436104)
,p_plug_name=>'Order Book'
,p_static_id=>'rule-orderbook'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>46
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Order Book</h2>',
'  <p>Orders raised in the last ten days, and the full order-to-payment cycle',
'     per supplier. The ten-day window is measured backwards from the',
'     <em>To&nbsp;Date</em> above, not from the newest row in the table &mdash;',
'     order dates contain keying errors, and anchoring to the newest row would',
'     land the window in empty space.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955507194643436078)
,p_plug_name=>'Purchase-to-Pay'
,p_static_id=>'rule-pipeline'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>36
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Purchase-to-Pay Execution</h2>',
'  <p>Document flow from order to payment, with conversion against the order',
unistr('     stage. Gate entry and goods receipt carry <em>no value</em> by design \2014'),
unistr('     GrnDetail holds no usable rate or amount in this ERP \2014 so those cells'),
'     render an en-dash rather than a zero.</p>',
'  <p class="ds-clickhint"><span class="ds-clickhint-ic fa fa-hand-o-up"></span> Click any <strong>stage</strong> in the table below &mdash; its full register opens in <strong>&ldquo;Documents Behind the Execution Stage&rdquo;</strong> right underneat'
||'h.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955504115363436075)
,p_plug_name=>'Procurement Pulse'
,p_static_id=>'rule-pulse'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>15
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Procurement Pulse</h2>',
'  <p>Where the period stands. Value is the taxable bill line',
'     (PurchaseBillDetail.Amount) and reconciles to the Purchase Bill Register.',
'     Each card compares against the immediately preceding period of equal',
'     length, and says so plainly where there is no prior period.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955521726185436163)
,p_plug_name=>'Quick Reports'
,p_static_id=>'rule-quickreports'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>110
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Quick Reports</h2>',
'  <p>Every drill page and register this dashboard feeds, in one place. Each',
'     opens carrying the period, company and location selected above, so you',
'     land already scoped rather than re-entering the filters.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955519659853436162)
,p_plug_name=>'Purchase Bill Register'
,p_static_id=>'rule-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>100
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Purchase Bill Register</h2>',
'  <p>Every bill in scope, with its pass and settlement position. The',
unistr('     <em>supplier''s own</em> bill number is shown \2014 internal document keys'),
'     are never displayed. Summing Line Value here reproduces the Total',
'     Purchase Value card at the top of the page.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955505160699436077)
,p_plug_name=>'Sourcing Funnel'
,p_static_id=>'rule-sourcing'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>25
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Sourcing Funnel</h2>',
'  <p>How demand became an order. Requisition is drawn as a standalone stage,',
unistr('     not as the head of the funnel \2014 Indent.RequisitionTno is not populated,'),
'     and drawing the arrow would invent a relationship the data does not',
'     support.</p>',
'  <p class="ds-clickhint"><span class="ds-clickhint-ic fa fa-hand-o-up"></span> Click any <strong>stage</strong> in the table below &mdash; its full register opens in <strong>&ldquo;Documents Behind the Stage&rdquo;</strong> right underneath.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(955513226124436133)
,p_plug_name=>'Where the Money Goes'
,p_static_id=>'rule-supplier'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>57
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Where the Money Goes</h2>',
'  <p>Concentration by supplier and by location, then the full supplier table',
'     with an ABC classification. The two charts deliberately ignore the',
unistr('     supplier and location filters \2014 a "value by supplier" chart narrowed to'),
'     one supplier would leave a single bar.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955505275295436077)
,p_name=>'Sourcing Stages'
,p_static_id=>'sourcing-funnel'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_grid_column_span=>8
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual),',
'Stg As (',
'  -- Requisition is NOT a stage here. Indent.RequisitionTno is not populated,',
unistr('  -- so a requisition cannot be tied to the indent that followed it \2014 showing'),
'  -- it as the head of the funnel would draw a relationship the data does not',
'  -- support. The funnel starts where demand becomes traceable.',
'  Select 10 Seq, ''Indent'' Stage, ''fa-list-alt'' Ic, ''Direct route'' Route,',
'         Count(*) Docs,',
'         ''Internal demand for material. No supplier chosen yet. An indent ''',
'         || ''can go straight to a purchase order.'' Meaning',
'    From PCC_Indent x Cross Join Win w',
'   Where x.IndentDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'  Union All',
'  Select 20, ''Enquiry'', ''fa-question-circle-o'', ''Tender route'', Count(*),',
'         ''Formal tender floated to the market. Sent to several suppliers ''',
'         || ''at once.''',
'    From PCC_Enquiry x Cross Join Win w',
'   Where x.EnquiryDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'  Union All',
'  -- Quotations OUTNUMBER enquiries, and that is correct rather than a',
'  -- defect: several suppliers quote against one enquiry. The meaning column',
'  -- says so, because a reader watching a "funnel" widen will otherwise',
'  -- assume the figures are wrong.',
'  Select 30, ''Quotation'', ''fa-comments-o'', ''Tender route'', Count(*),',
'         ''Supplier responses against an enquiry. May outnumber enquiries ''',
'         || ''because several suppliers quote on each one.''',
'    From PCC_Quotation x Cross Join Win w',
'   Where x.QuotationDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'  Union All',
'  Select 40, ''Comparative Statement'', ''fa-balance-scale'', ''Tender route'',',
'         Count(*),',
'         ''Quotations set side by side so the buying decision is recorded ''',
'         || ''rather than assumed.''',
'    From PCC_ComparativeStatement x Cross Join Win w',
'   Where x.ComparativeStatementDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'  Union All',
'  Select 50, ''Purchase Order'', ''fa-shopping-cart'', ''Both routes'', Count(*),',
'         ''Orders with detail lines. Both sourcing routes converge here, ''',
'         || ''and everything downstream is measured from it.''',
'    From PCC_PurchaseOrder x Cross Join Win w',
'   Where Exists (Select 1 From PurchaseOrderDetail valid_line Where valid_line.TNo = x.TNo)',
'     And x.PurchaseOrderDate Between w.F And w.T',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'     And (:P934_SUPPLIER Is Null Or x.PartyCode = :P934_SUPPLIER))',
'Select',
'  s.Seq,',
'  -- Stage layout is an INLINE STYLE, not a stylesheet class. The label is an',
'  -- anchor inside a report cell, and the theme''s `td a` rules keep knocking',
'  -- the icon chip out of the flex line. An inline style outranks any',
'  -- stylesheet rule without needing !important.',
'  ''<a class="ds-stage-drill" href="javascript:void(0);" data-k="'' || s.Seq || ''"''',
'  || '' style="display:inline-flex;align-items:center;''',
'  || ''gap:9px;font-weight:600;text-decoration:none;">''',
'  || ''<span style="display:grid;place-items:center;width:26px;height:26px;''',
'  || ''font-size:12px;border-radius:7px;color:var(--ds-dash-gold);background:var(--ds-dash-gold-bg);''',
'  || ''flex:0 0 auto;"><span class="fa '' || s.Ic || ''"></span></span>''',
'  || apex_escape.html(s.Stage) || ''</a>'' As STAGE,',
'  ''<span class="ds-pill ds-pill--''',
'  || Case s.Route When ''Tender route''  Then ''info''',
'                  When ''Direct route''  Then ''accent''',
'                  Else ''muted'' End',
'  || ''">'' || apex_escape.html(s.Route) || ''</span>'' As ROUTE,',
'  s.Docs As DOCS,',
'  -- Share against the LARGEST stage, not the first. These stages are not a',
'  -- strict funnel, so a drop-off bar would misrepresent them.',
'  ''<span class="ds-sharecell"><span class="ds-bar ds-bar--gold"><i style="width:''',
'  || to_char(Round(100 * s.Docs / Nullif(Max(s.Docs) Over (),0),1),''FM99999990D0'')',
'  || ''%"></i></span></span>'' As VOLUME,',
'  ''<span class="ds-muted">'' || apex_escape.html(s.Meaning) || ''</span>''',
'    As MEANING',
'From Stg s',
'Order By s.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL,P934_SUPPLIER,P934_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No sourcing documents were raised in this period and scope.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955505663806436077)
,p_query_column_id=>4
,p_column_alias=>'DOCS'
,p_column_display_sequence=>30
,p_column_heading=>'Documents'
,p_column_format=>'FM999G999G990'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'COUNT(*) of documents raised in the period at this stage.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955505817342436077)
,p_query_column_id=>6
,p_column_alias=>'MEANING'
,p_column_display_sequence=>50
,p_column_heading=>'What This Stage Means'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Plain-language reading guidance. Carries the explanation for why quotations exceed enquiries, which otherwise reads as a data error.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955505502545436077)
,p_query_column_id=>3
,p_column_alias=>'ROUTE'
,p_column_display_sequence=>20
,p_column_heading=>'Route'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Which sourcing route the stage belongs to. Requisition is deliberately absent \2014 Indent.RequisitionTno is not populated, so the link cannot be drawn honestly.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955505342983436077)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
,p_column_comment=>unistr('Sort key. MUST stay projected \2014 APEX may eliminate an ORDER BY on a column absent from the select list, which silently reorders the funnel.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955505451052436077)
,p_query_column_id=>2
,p_column_alias=>'STAGE'
,p_column_display_sequence=>10
,p_column_heading=>'Stage'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Stage name as a drill anchor to its own register. Flex layout is inline style because the theme''s td a rules outrank stylesheet classes.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955505712043436077)
,p_query_column_id=>5
,p_column_alias=>'VOLUME'
,p_column_display_sequence=>40
,p_column_heading=>'Relative Volume'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Share bar against the LARGEST stage, not against the first. These stages are not a strict funnel \2014 quotations outnumber enquiries by design \2014 so a drop-off bar would misrepresent them.')
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(956811687836443110)
,p_plug_name=>'Documents Behind the Stage'
,p_static_id=>'stage-detail'
,p_region_name=>'p668StageDetail'
,p_region_css_classes=>'ds-register ds-exc-detailwrap'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>35
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'       Select to_date(:P934_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P934_TODATE,''DD-MM-RRRR'')   T',
'         From dual)',
'-- Each branch repeats its stage''s predicates from Sourcing Stages VERBATIM.',
'-- A drill-down shorter than the count that opened it is the one failure mode',
'-- that may never happen.',
'Select x.IndentNo                                     As DOCUMENT_NO,',
'       x.IndentDate                                   As DOCUMENT_DATE,',
'       ''Indent''                                       As STAGE,',
'       GetLocationName(x.LocationCode)                As LOCATION,',
'       Cast(Null As Varchar2(240))                    As PARTY,',
'       ''Department '' || x.DepartmentCode              As DETAIL,',
'       Cast(Null As Number) As VALUE_RS,',
'       apex_page.get_url(p_page=>108,p_clear_cache=>''108'',p_items=>''P108_TNO,P108_CALLEDFROMPAGE'',p_values=>to_char(x.TNo,''FM9999999999999999990'')||'',934'') As TARGET_URL',
'  From PCC_Indent x Cross Join Win w',
' Where :P934_STAGE_FOCUS = ''10''',
'   And x.IndentDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'Union All',
'Select x.EnquiryNo                                    As DOCUMENT_NO,',
'       x.EnquiryDate                                  As DOCUMENT_DATE,',
'       ''Enquiry''                                      As STAGE,',
'       GetLocationName(x.LocationCode)                As LOCATION,',
'       Cast(Null As Varchar2(240))                    As PARTY,',
'       ''Generated for '' || x.GeneratedFor             As DETAIL,',
'       Cast(Null As Number) As VALUE_RS,',
'       apex_page.get_url(p_page=>708,p_clear_cache=>''708'',p_items=>''P708_TNO,P708_CALLEDFROMPAGE'',p_values=>to_char(x.TNo,''FM9999999999999999990'')||'',934'') As TARGET_URL',
'  From PCC_Enquiry x Cross Join Win w',
' Where :P934_STAGE_FOCUS = ''20''',
'   And x.EnquiryDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'Union All',
'Select x.QuotationNo                                  As DOCUMENT_NO,',
'       x.QuotationDate                                As DOCUMENT_DATE,',
'       ''Quotation''                                    As STAGE,',
'       GetLocationName(x.LocationCode)                As LOCATION,',
'       GetPartyName(x.PartyCode)                      As PARTY,',
'       ''Valid to '' || to_char(x.ValidityDate,''DD-Mon-RRRR'') As DETAIL,',
'       x.QuotationAmount As VALUE_RS,',
'       apex_page.get_url(p_page=>710,p_clear_cache=>''710'',p_items=>''P710_TNO,P710_CALLEDFROMPAGE'',p_values=>to_char(x.TNo,''FM9999999999999999990'')||'',934'') As TARGET_URL',
'  From PCC_Quotation x Cross Join Win w',
' Where :P934_STAGE_FOCUS = ''30''',
'   And x.QuotationDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'Union All',
'Select x.ComparativeStatementNo                       As DOCUMENT_NO,',
'       x.ComparativeStatementDate                     As DOCUMENT_DATE,',
'       ''Comparative Statement''                        As STAGE,',
'       GetLocationName(x.LocationCode)                As LOCATION,',
'       Cast(Null As Varchar2(240))                    As PARTY,',
'       ''Against enquiry '' || to_char(x.EnquiryTNo)    As DETAIL,',
'       Cast(Null As Number) As VALUE_RS,',
'       apex_page.get_url(p_page=>712,p_clear_cache=>''712'',p_items=>''P712_TNO,P712_CALLEDFROMPAGE'',p_values=>to_char(x.TNo,''FM9999999999999999990'')||'',934'') As TARGET_URL',
'  From PCC_ComparativeStatement x Cross Join Win w',
' Where :P934_STAGE_FOCUS = ''40''',
'   And x.ComparativeStatementDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'Union All',
'Select x.PurchaseOrderNo                              As DOCUMENT_NO,',
'       x.PurchaseOrderDate                            As DOCUMENT_DATE,',
'       ''Purchase Order''                               As STAGE,',
'       GetLocationName(x.LocationCode)                As LOCATION,',
'       GetPartyName(x.PartyCode)                      As PARTY,',
'       ''Delivery '' || to_char(x.DeliveryDate,''DD-Mon-RRRR'') As DETAIL,',
'       x.PurchaseOrderAmount As VALUE_RS,',
'       apex_page.get_url(p_page=>939,p_clear_cache=>''939'',p_items=>''P939_TNO'',p_values=>to_char(x.TNo,''FM9999999999999999990'')) As TARGET_URL',
'  From PCC_PurchaseOrder x Cross Join Win w',
' Where :P934_STAGE_FOCUS = ''50''',
'   And Exists (Select 1 From PurchaseOrderDetail valid_line Where valid_line.TNo = x.TNo)',
'     And x.PurchaseOrderDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or x.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_PANEL Is Null Or x.Panel = :P934_PANEL)',
'   And (:P934_COMPANY Is Null Or x.CompanyCode = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or x.LocationCode = :P934_LOCATION)',
'   And (:P934_SUPPLIER Is Null Or x.PartyCode = :P934_SUPPLIER)',
'Order By 2 Desc, 1'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_STAGE_FOCUS,P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER'
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
 p_id=>wwv_flow_imp.id(956811790511443110)
,p_max_row_count=>'100000'
,p_no_data_found_message=>'Click a stage in Sourcing Stages above to list its documents here.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>22811790511443110
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956812342298443134)
,p_db_column_name=>'DETAIL'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956811960645443134)
,p_db_column_name=>'DOCUMENT_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956811853775443134)
,p_db_column_name=>'DOCUMENT_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Document No'
,p_column_link=>'#TARGET_URL#'
,p_column_linktext=>'#DOCUMENT_NO#'
,p_column_link_attr=>'class="pcc-drill-link" title="Open transaction detail"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956812154054443134)
,p_db_column_name=>'LOCATION'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956812223765443134)
,p_db_column_name=>'PARTY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Supplier'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(956812066531443134)
,p_db_column_name=>'STAGE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Stage'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(934000009349000013)
,p_db_column_name=>'TARGET_URL'
,p_display_order=>900
,p_column_identifier=>'Z'
,p_column_label=>'Transaction URL'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(956820030440444705)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>10
,p_report_columns=>'DOCUMENT_NO:DOCUMENT_DATE:STAGE:LOCATION:PARTY:DETAIL'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955513380162436133)
,p_name=>'Top 12 Suppliers by Purchase Value - click a bar to filter results'
,p_static_id=>'supplier-bar'
,p_template=>4072358936313175081
,p_display_sequence=>60
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With chart_q As (',
'Select * From (',
'  Select GetPartyName(h.PartyCode) SUPPLIER,',
'         h.PartyCode FILTER_KEY,',
'         Round(Sum(d.Amount) / 100000, 2) VALUE_LAC',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PurchaseBillDate',
'         Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'   Group By h.PartyCode',
'   Order By Sum(d.Amount) Desc)',
' Where rownum <= 12',
')',
'Select',
'  ''<div class="ds-p668-viz" data-chart-type="hbar" data-total-label="Rs lakh" data-filter-item="P934_SUPPLIER" data-refresh-target="p668SupTable" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.SUPPLIER), ''v'' value q.VALUE_LAC, ''k'' value q.FILTER_KEY, ''d'' value q.SUPPLIER, ''u'' value null returning clob)',
'                  order by q.VALUE_LAC Desc returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082806)
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
 p_id=>wwv_flow_imp.id(955514382165436133)
,p_plug_name=>'Supplier Performance'
,p_static_id=>'supplier-table'
,p_region_name=>'p668SupTable'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>65
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P934_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P934_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P934_ITEMGROUP Is Null),',
'Val As (',
'  Select h.PartyCode,',
'         Sum(d.Amount) Val,',
'         Count(Distinct h.TNo) Bills,',
'         Count(Distinct d.ItemCode) Items,',
'         Max(h.PurchaseBillDate) LastBill',
'    From PCC_PurchaseBill h',
'    Join PurchaseBillDetail d On d.TNo = h.TNo',
'   Where h.PurchaseBillDate',
'         Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'     And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'     And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'     And d.ItemCode In (Select ItemCode From ItemTree)',
'     And (:P934_ITEM Is Null Or d.ItemCode = :P934_ITEM)',
'   Group By h.PartyCode),',
'-- DELIVERY, at ORDER grain. GrnDetail carries no order reference in this',
'-- application, so a receipt is matched to its order on the GRN HEADER',
'-- (Grn.PurchaseOrderTNo) and the earliest receipt per order is compared with',
'-- the promised date. Orders with no delivery date or no receipt are EXCLUDED',
unistr('-- rather than counted as late \2014 counting them would flatter the figure.'),
'Deliv As (',
'  Select PartyCode,',
'         Count(*) Legs,',
'         Sum(Case When DeliveryDate >= FirstGrn Then 1 Else 0 End) OnTime,',
'         Avg(DeliveryDate - FirstGrn) AvgDays',
'    From (',
'      Select o.PartyCode, o.DeliveryDate,',
'             (Select Min(g.GrnDate) From PCC_Grn g',
'               Where g.PurchaseOrderTNo = o.TNo) FirstGrn',
'        From PCC_PurchaseOrder o',
'       Where o.PurchaseOrderDate',
'             Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'                 And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'         And o.DeliveryDate Is Not Null',
'         And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'              Or o.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'         And (:P934_PANEL Is Null Or o.Panel = :P934_PANEL)',
'         And (:P934_COMPANY Is Null Or o.CompanyCode = :P934_COMPANY)',
'         And (:P934_LOCATION Is Null Or o.LocationCode = :P934_LOCATION)',
'         And (:P934_SUPPLIER Is Null Or o.PartyCode = :P934_SUPPLIER))',
'   Where FirstGrn Is Not Null',
'   Group By PartyCode)',
'Select * From (',
'Select',
'  v.PartyCode As PARTYCODE,',
'  GetPartyName(v.PartyCode) As SUPPLIER,',
'  v.Val As PURCHASE_VALUE,',
'  v.Bills As BILLS,',
'  v.Items As ITEMS,',
'  dl.Legs As ORDER_LEGS,',
'  Case When dl.Legs > 0',
'       Then Round(100 * dl.OnTime / dl.Legs, 1) End As ONTIME_PCT,',
'  Round(dl.AvgDays, 1) As AVG_DELIVERY_DAYS,',
'  v.LastBill As LAST_BILL,',
'  Round(100 * v.Val / Nullif(Sum(v.Val) Over (),0), 2) As SHARE_PCT,',
'  Round(100 * Sum(v.Val) Over (Order By v.Val Desc, v.PartyCode',
'                               Rows Between Unbounded Preceding',
'                                        And Current Row)',
'            / Nullif(Sum(v.Val) Over (),0), 2) As CUMULATIVE_PCT,',
'  Case',
'    When 100 * Sum(v.Val) Over (Order By v.Val Desc, v.PartyCode',
'                                Rows Between Unbounded Preceding',
'                                         And Current Row)',
'             / Nullif(Sum(v.Val) Over (),0) <= 80 Then ''A''',
'    When 100 * Sum(v.Val) Over (Order By v.Val Desc, v.PartyCode',
'                                Rows Between Unbounded Preceding',
'                                         And Current Row)',
'             / Nullif(Sum(v.Val) Over (),0) <= 95 Then ''B''',
'    Else ''C''',
'  End As ABC_CLASS',
'From Val v',
'Left Join Deliv dl On dl.PartyCode = v.PartyCode',
') ranked',
'Where :P934_SUPPLIER Is Null Or ranked.PARTYCODE = :P934_SUPPLIER',
'Order By PURCHASE_VALUE Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER,P934_ITEMGROUP,P934_ITEM'
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
 p_id=>wwv_flow_imp.id(955514452298436133)
,p_no_data_found_message=>'No supplier had billing in this period and scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>21514452298436133
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955515600141436134)
,p_db_column_name=>'ABC_CLASS'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'ABC'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Pareto band \2014 A to cumulative 80%, B to 95%, else C.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955515218359436134)
,p_db_column_name=>'AVG_DELIVERY_DAYS'
,p_display_order=>48
,p_column_identifier=>'H'
,p_column_label=>'Avg Days Early'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Average days between the promised date and the earliest receipt. Zero or below means goods arrived on or before the promise, or the order was raised retrospectively \2014 normal for bulk commodity buying.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955514822885436134)
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
 p_id=>wwv_flow_imp.id(955515565274436134)
,p_db_column_name=>'CUMULATIVE_PCT'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Cumulative %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Running share by descending value. Tie-broken on PartyCode so the ordering is deterministic.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955514964183436134)
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
,p_column_comment=>'Distinct items billed by this supplier in the period.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955515305776436134)
,p_db_column_name=>'LAST_BILL'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'Last Bill'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Most recent bill date from this supplier inside the period.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955515184361436134)
,p_db_column_name=>'ONTIME_PCT'
,p_display_order=>46
,p_column_identifier=>'G'
,p_column_label=>'On Time %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('ORDER grain, not order-line grain \2014 GrnDetail carries no order reference here, so the line-level match is not reproducible. Null rather than zero where nothing was measurable.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955515046956436134)
,p_db_column_name=>'ORDER_LEGS'
,p_display_order=>44
,p_column_identifier=>'F'
,p_column_label=>'Order Legs'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Orders carrying BOTH a delivery date and a receipt \2014 the only population on which on-time is measurable. Blank means delivery was never measurable for this supplier, which is different from it being poor.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955514527500436133)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>unistr('Technical drill key. Never displayed \2014 see the internal-key rule in the page help.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955514758847436134)
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
,p_column_comment=>unistr('SUM(PurchaseBillDetail.Amount) for this supplier \2014 the value grain.')
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955515404201436134)
,p_db_column_name=>'SHARE_PCT'
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>'Share %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'This supplier''s share of total purchase value in scope.'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955514612391436134)
,p_db_column_name=>'SUPPLIER'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Supplier'
,p_column_link=>'f?p=&APP_ID.:935:&APP_SESSION.::NO:935:P935_SUPPLIER,P935_FROMDATE,P935_TODATE,P935_COMPANY,P935_LOCATION,P935_PANEL:#PARTYCODE#,&P934_FROMDATE.,&P934_TODATE.,&P934_COMPANY.,&P934_LOCATION.,&P934_PANEL.'
,p_column_linktext=>'#SUPPLIER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
,p_column_comment=>'Supplier name, drilling to Supplier 360 (page 669) with the full filter context.'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(956297862951724558)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'PARTYCODE:SUPPLIER:PURCHASE_VALUE:BILLS:ITEMS:ORDER_LEGS:ONTIME_PCT:AVG_DELIVERY_DAYS:LAST_BILL:SHARE_PCT:CUMULATIVE_PCT:ABC_CLASS'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(955516935121436134)
,p_name=>'Top 10 Transporters by Freight Billed'
,p_static_id=>'transporter-bar'
,p_template=>4072358936313175081
,p_display_sequence=>85
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With chart_q As (',
'Select * From (',
'  Select nvl((Select t.TransporterName From Transporter t',
'               Where t.TransporterCode = f.TransporterCode),',
'             ''No transporter recorded'') TRANSPORTER,',
'         nvl(f.TransporterCode,''__UNASSIGNED__'') TRANSPORTER_CODE,',
'         Round(Sum(f.FreightAdviceAmount) / 100000, 2) FREIGHT_LAC',
'    From PCC_FreightAdvice f',
'   Where f.FreightAdviceDate',
'         Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'             And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'          Or f.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P934_PANEL Is Null Or f.Panel = :P934_PANEL)',
'     And (:P934_COMPANY Is Null Or f.CompanyCode = :P934_COMPANY)',
'     And (:P934_TRANSPORTER Is Null',
'          Or f.TransporterCode = :P934_TRANSPORTER',
'          Or (:P934_TRANSPORTER = ''__UNASSIGNED__'' And f.TransporterCode Is Null))',
'   Group By f.TransporterCode',
'   Order By Sum(f.FreightAdviceAmount) Desc)',
' Where rownum <= 10',
')',
'Select',
'  ''<div class="ds-p668-viz" data-chart-type="hbar" data-total-label="Rs lakh" data-filter-item="P934_TRANSPORTER" data-refresh-target="p668FreightRegister" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.TRANSPORTER), ''v'' value q.FREIGHT_LAC, ''k'' value q.TRANSPORTER_CODE, ''d'' value q.TRANSPORTER, ''u'' value null returning clob)',
'                  order by q.FREIGHT_LAC Desc returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_PANEL,P934_TRANSPORTER,P934_LOCATION,P934_SUPPLIER'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082809)
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
 p_id=>wwv_flow_imp.id(955511725935436106)
,p_name=>'Monthly Purchase Value - click a point to view supplier results'
,p_static_id=>'trend-chart'
,p_template=>4072358936313175081
,p_display_sequence=>50
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>4
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P934_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P934_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P934_ITEMGROUP Is Null)',
', chart_q As (',
'Select',
'  to_char(Trunc(h.PurchaseBillDate,''MM''),''Mon-RR'') MONTH_LABEL,',
'  Round(Sum(d.Amount) / 100000, 2) VALUE_LAC,',
'  -- Projected so a bar click can rescope the whole dashboard to that month.',
'  to_char(Trunc(h.PurchaseBillDate,''MM''),''DD-MM-RRRR'') MONTH_FROM,',
'  to_char(Last_Day(h.PurchaseBillDate),''DD-MM-RRRR'')   MONTH_TO,',
'  Trunc(h.PurchaseBillDate,''MM'') SORT_KEY',
'From PCC_PurchaseBill h',
'Join PurchaseBillDetail d On d.TNo = h.TNo',
'Where h.PurchaseBillDate',
'      Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'          And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'       Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'  And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'  And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'  And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'  And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'  And (:P934_ITEM     Is Null Or d.ItemCode     = :P934_ITEM)',
'  And d.ItemCode In (Select ItemCode From ItemTree)',
'Group By Trunc(h.PurchaseBillDate,''MM''), Last_Day(h.PurchaseBillDate)',
'Order By SORT_KEY',
')',
'Select',
'  ''<div class="ds-p668-viz" data-chart-type="line" data-total-label="Rs lakh" data-json="'' ||',
'  apex_escape.html_attribute(',
'    json_arrayagg(json_object(''l'' value to_char(q.MONTH_LABEL), ''v'' value q.VALUE_LAC, ''f'' value q.MONTH_FROM, ''t'' value q.MONTH_TO, ''u'' value null returning clob)',
'                  order by q.SORT_KEY returning clob)) || ''"></div>'' As CHART_ROW',
'  From chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER,P934_ITEMGROUP,P934_ITEM'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(943106682026082803)
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
 p_id=>wwv_flow_imp.id(955516351360436134)
,p_name=>'Purchase Value by Unit of Measure'
,p_static_id=>'uom-mix'
,p_region_name=>'uom-mix'
,p_template=>4072358936313175081
,p_display_sequence=>77
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--horizontalBorders'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ItemTree As (',
'       Select ItemCode From Item',
'        Where :P934_ITEMGROUP Is Not Null',
'        Start With ItemCode = :P934_ITEMGROUP',
'      Connect By Prior ItemCode = ParentCode',
'       Union All',
'       Select ItemCode From Item Where :P934_ITEMGROUP Is Null)',
'Select',
'  nvl(m.MeasuringUnitName,''No unit recorded'') As UOM,',
'  Sum(d.Amount) As VALUE_RS,',
'  Sum(d.Quantity1) As QTY,',
'  ''<span class="ds-sharecell"><span class="ds-bar ds-bar--teal"><i style="width:''',
'  || to_char(Round(100 * Sum(d.Amount)',
'                 / Nullif(Sum(Sum(d.Amount)) Over (),0),1),''FM99999990D0'')',
'  || ''%"></i></span><b>''',
'  || to_char(Round(100 * Sum(d.Amount)',
'                 / Nullif(Sum(Sum(d.Amount)) Over (),0),1),''FM99999990D0'')',
'  || ''%</b></span>'' As SHARE_PCT',
'From PCC_PurchaseBill h',
'Join PurchaseBillDetail d On d.TNo = h.TNo',
'Left Join MeasuringUnit m',
'       On m.MeasuringUnitCode = d.RateMeasuringUnitCode',
'Where h.PurchaseBillDate',
'      Between to_date(:P934_FROMDATE,''DD-MM-RRRR'')',
'          And to_date(:P934_TODATE,''DD-MM-RRRR'')',
'  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'       Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'  And (:P934_PANEL Is Null Or h.Panel = :P934_PANEL)',
'  And (:P934_COMPANY  Is Null Or h.CompanyCode  = :P934_COMPANY)',
'  And (:P934_LOCATION Is Null Or h.LocationCode = :P934_LOCATION)',
'  And (:P934_SUPPLIER Is Null Or h.PartyCode    = :P934_SUPPLIER)',
'  And (:P934_ITEM     Is Null Or d.ItemCode     = :P934_ITEM)',
'  And d.ItemCode In (Select ItemCode From ItemTree)',
'Group By nvl(m.MeasuringUnitName,''No unit recorded'')',
'Order By Sum(d.Amount) Desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P934_FROMDATE,P934_TODATE,P934_COMPANY,P934_LOCATION,P934_PANEL,P934_SUPPLIER,P934_ITEMGROUP,P934_ITEM'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No billed lines in this period and scope.'
,p_query_num_rows_type=>'ROWS_X_TO_Y'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955516649126436134)
,p_query_column_id=>3
,p_column_alias=>'QTY'
,p_column_display_sequence=>30
,p_column_heading=>'Quantity (within this unit)'
,p_column_format=>'FM999G999G990D000'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>unistr('Quantity is meaningful ONLY within its own row. Never sum this column \2014 the units are incompatible.')
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955516713195436134)
,p_query_column_id=>4
,p_column_alias=>'SHARE_PCT'
,p_column_display_sequence=>40
,p_column_heading=>'Share of Value'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Share bar computed on value, which is the only additive measure here.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955516498280436134)
,p_query_column_id=>1
,p_column_alias=>'UOM'
,p_column_display_sequence=>10
,p_column_heading=>'Unit of Measure'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Rate unit from PurchaseBillDetail.RateMeasuringUnitCode. Lines with no unit form their own group rather than being folded in.'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(955516568055436134)
,p_query_column_id=>2
,p_column_alias=>'VALUE_RS'
,p_column_display_sequence=>20
,p_column_heading=>'Purchase Value'
,p_column_format=>'FM999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
,p_column_comment=>'Value is additive across units and therefore safe to total.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(955524329894436166)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(955503931274436075)
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
 p_id=>wwv_flow_imp.id(955524482634436166)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(955503931274436075)
,p_button_name=>'OPENFILTERS'
,p_static_id=>'open-filters'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'More Filters'
,p_button_redirect_url=>'javascript:apex.theme.openRegion(''p668Drawer'');'
,p_icon_css_classes=>'fa-sliders'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_column=>3
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(955524565195436166)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(955503931274436075)
,p_button_name=>'RESETFILTERS'
,p_static_id=>'reset-filters'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset All Filters'
,p_button_redirect_url=>'f?p=&APP_ID.:934:&SESSION.::&DEBUG.:934'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
,p_grid_column=>4
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955522506584436165)
,p_name=>'P934_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(955503931274436075)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct c.CompanyName d, c.CompanyCode r',
'  From PCC_PurchaseBill h',
'  Join Company c On c.CompanyCode = h.CompanyCode',
' Where ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
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
,p_help_text=>'Restricts every region to one company. The list shows only companies that actually have a purchase bill you are entitled to see.'
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
 p_id=>wwv_flow_imp.id(955524169853436166)
,p_name=>'P934_EXC_FOCUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER. Holds the exception rule id selected in the Exception Register, which drives the detail report. It starts empty so the drill-down costs nothing until a rule is clicked.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(956814460806443221)
,p_name=>'P934_EXEC_FOCUS'
,p_item_sequence=>57
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER. Holds the Execution Pipeline stage whose documents are listed below that table. Starts empty so the drill-down costs nothing until a stage is clicked.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955522166540436164)
,p_name=>'P934_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(955503931274436075)
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
,p_help_text=>'Start of the reporting period. Defaults to the beginning of the current financial year.'
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
 p_id=>wwv_flow_imp.id(955523597272436166)
,p_name=>'P934_ITEM'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select i.ItemName || '' ('' || i.ItemCode || '')'' d, i.ItemCode r',
'  From Item i',
' Where Exists (Select 1 From PurchaseBillDetail d',
'                Where d.ItemCode = i.ItemCode)',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All items'
,p_colspan=>12
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Narrows to a single item. Populated from bill lines, so every entry will return rows.'
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
 p_id=>wwv_flow_imp.id(955523338743436166)
,p_name=>'P934_ITEMGROUP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
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
,p_help_text=>'Selects the WHOLE hierarchy beneath the chosen group, not just its immediate children.'
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
 p_id=>wwv_flow_imp.id(955522753760436166)
,p_name=>'P934_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(955503931274436075)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct l.LocationName d, l.LocationCode r',
'  From PCC_PurchaseBill fb',
'  Join Location l On l.LocationCode = fb.LocationCode',
' Where (:P934_COMPANY Is Null Or fb.CompanyCode = :P934_COMPANY)',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or fb.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P934_COMPANY'
,p_ajax_items_to_submit=>'P934_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_column=>7
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Cascades from Company. Note that a supplier-ledger balance cannot be narrowed by location in this ERP, so any such measure is reported unnarrowed and says so.'
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
 p_id=>wwv_flow_imp.id(955522909740436166)
,p_name=>'P934_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(955503931274436075)
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
,p_help_text=>'Compatibility bind retained internally. Company and Location determine the visible dashboard scope.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE',
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955523921125436166)
,p_name=>'P934_PIPE_FOCUS'
,p_item_sequence=>55
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER. Holds the Pipeline Conversion slice being listed (AWAIT, PART, FULL or CLOSED). Starts empty so the register below the chart costs nothing until a slice is clicked.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(956814206974443196)
,p_name=>'P934_STAGE_FOCUS'
,p_item_sequence=>56
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER. Holds the Sourcing Stage whose documents are listed below that table. Starts empty so the drill-down costs nothing until a stage is clicked.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955523165018436166)
,p_name=>'P934_SUPPLIER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
,p_prompt=>'Supplier'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct p.PartyName d, p.PartyCode r',
'  From PCC_PurchaseBill h',
'  Join Party p On p.PartyCode = h.PartyCode',
' Where ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or h.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P934_COMPANY Is Null Or h.CompanyCode = :P934_COMPANY)',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All suppliers'
,p_lov_cascade_parent_items=>'P934_COMPANY'
,p_ajax_items_to_submit=>'P934_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_colspan=>12
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>unistr('Narrows to one supplier. The concentration charts deliberately ignore this filter \2014 a "top suppliers" chart narrowed to one supplier would leave a single bar.')
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
 p_id=>wwv_flow_imp.id(934000009349000100)
,p_name=>'P934_TNO'
,p_item_sequence=>58
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Compatibility return key used by native transaction forms opened from Purchase Command Centre registers.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(955522372050436165)
,p_name=>'P934_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(955503931274436075)
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
,p_help_text=>'End of the reporting period. Defaults to today. The Order Book window is measured backwards from this date, not from the newest row in the table.'
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
 p_id=>wwv_flow_imp.id(955523797535436166)
,p_name=>'P934_TRANSPORTER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(955504080362436075)
,p_prompt=>'Transporter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct t.TransporterName d, t.TransporterCode r',
'  From PCC_FreightAdvice f',
'  Join Transporter t On t.TransporterCode = f.TransporterCode',
' Where ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'        Or f.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All transporters'
,p_colspan=>12
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3031561666792084173
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'Affects freight only. Freight is not attributable to the material supplier, so the freight measures deliberately ignore the Supplier filter.'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(958361698496249499)
,p_name=>'Install Drill Handlers'
,p_static_id=>'install-drills'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(958361787045249499)
,p_event_id=>wwv_flow_imp.id(958361698496249499)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'bind'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// Pipeline audit fix: discard transient drill selection before submit.',
    'apex.jQuery(document).on(''apexbeforepagesubmit.pipelineAudit'', function () {',
    '  [''P934_EXEC_FOCUS'',''P934_EXC_FOCUS'',''P934_STAGE_FOCUS'',''P934_PIPE_FOCUS''].forEach(function (id) {',
    '    var el = document.getElementById(id);',
    '    if (el && el.type === ''hidden'') { el.value = el.defaultValue; }',
    '  });',
    '});',
    '// Delegate on document: the drill anchors sit inside lazy-loaded',
    '// reports, so a directly-bound handler would miss rows added later.',
    '// One command header only: the app renders its own page-title card,',
    '// and the hero band below repeats it. Fold them into one by removing',
    '// the top card (CSS handles it too; this is the guaranteed fallback).',
    'var _c = document.querySelector(''.hspl-hero-card'');',
    'if (_c) { _c.style.setProperty(''display'', ''none'', ''important''); }',
    '// Navy sidebar: the theme paints the nav in a CSS layer no stylesheet',
    '// can override, so set the gradient inline on the nav container.',
    'var _nav = document.getElementById(''t_Body_nav'');',
    'if (_nav) {',
    '  // keep the sidebar fixed while the page scrolls (it was position:relative',
    '  // and scrolled away with the content).',
    '  _nav.style.setProperty(''position'',''sticky'',''important'');',
    '  _nav.style.setProperty(''top'',''50px'',''important'');',
    '  _nav.style.setProperty(''height'',''calc(100vh - 50px)'',''important'');',
    '  _nav.style.setProperty(''align-self'',''flex-start'',''important'');',
    '  _nav.style.setProperty(''overflow-y'',''auto'',''important'');',
    '}',
    '// Quick-period chips: set the two date items and submit,',
    '// just like typing the dates and pressing Apply.',
    '// KPI cards drill in-page: scroll to and flash the region that',
    '// holds the card''s underlying data.',
    'apex.jQuery(document).off(''click.p668kpi'')',
    '  .on(''click.p668kpi'', ''.ds-kpi--clickable'', function () {',
    '    var id = this.getAttribute(''data-kpi-goto'');',
    '    var t = id && document.getElementById(id);',
    '    if (!t) return;',
    '    t.scrollIntoView({ behavior: ''smooth'', block: ''start'' });',
    '    t.classList.add(''ds-flash'');',
    '    setTimeout(function(){ t.classList.remove(''ds-flash''); }, 1400);',
    '  });',
    'apex.jQuery(document).off(''click.p668period'')',
    '  .on(''click.p668period'', ''.ds-period'', function () {',
    '    var r = this.getAttribute(''data-range'');',
    '    var now = new Date(), f, t = now;',
    '    var pad = function (n) { return (''0'' + n).slice(-2); };',
    '    var fmt = function (d) {',
    '      return pad(d.getDate()) + ''-'' + pad(d.getMonth() + 1) + ''-'' + d.getFullYear();',
    '    };',
    '    if (r === ''month'') { f = new Date(now.getFullYear(), now.getMonth(), 1); }',
    '    else if (r === ''quarter'') { f = new Date(now.getFullYear(), Math.floor(now.getMonth() / 3) * 3, 1); }',
    '    else if (r === ''fy'') { var y = now.getMonth() >= 3 ? now.getFullYear() : now.getFullYear() - 1; f = new Date(y, 3, 1); }',
    '    else if (r === ''d30'') { f = new Date(now); f.setDate(f.getDate() - 29); }',
    '    else { f = new Date(now); f.setDate(f.getDate() - 89); }',
    '    apex.item(''P934_FROMDATE'').setValue(fmt(f));',
    '    apex.item(''P934_TODATE'').setValue(fmt(t));',
    '    apex.page.submit();',
    '  });',
    '/* The stage / execution drill handler now lives in hspl-theme.js',
    '   (delegated on .ds-stage-drill/.ds-exec-drill/.ds-exc-drill). It is',
    '   kept out of this page''s jsCode so the block stays under the 4000-byte',
    '   limit and can carry the dedicated-register show/hide logic. */')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(943006682026082801)
,p_name=>'Install Fast Filter Runtime'
,p_static_id=>'install-fast-filter-runtime'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(943006682026082802)
,p_event_id=>wwv_flow_imp.id(943006682026082801)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'install'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '(function () {',
    '  var u = apex.util, $ = apex.jQuery;',
    '  if (!u.__p668Popup300) {',
    '    var open = u.openPopupLov;',
    '    u.openPopupLov = function () {',
    '      var cfg = arguments[3] || {};',
    '      var target = cfg.itemId === ''P934_COMPANY'' || cfg.itemId === ''P934_LOCATION'';',
    '      if (!target) return open.apply(this, arguments);',
    '      var originalDebounce = u.debounce;',
    '      u.debounce = function (fn, wait, immediate) {',
    '        return originalDebounce(fn, wait === 400 ? 300 : wait, immediate);',
    '      };',
    '      try { return open.apply(this, arguments); }',
    '      finally { u.debounce = originalDebounce; }',
    '    };',
    '    u.__p668Popup300 = true;',
    '  }',
    '  if (!document.getElementById(''p668-popup-lov-focus-css'')) {',
    '    var lovStyle = document.createElement(''style''); lovStyle.id = ''p668-popup-lov-focus-css'';',
    '    lovStyle.textContent = ''body:not(.t-PageBody--login) .ui-dialog.ui-dialog-popuplov .a-PopupLOV-search.apex-item-text{padding-left:40px!important;padding-right:12px!important;box-sizing:border-box!important}.ds-svgd-card.hspl-donut-card{position:a'
||'bsolute!important;right:auto!important;transform:none!important;max-width:min(260px,calc(100% - 16px))!important}.p668-direct-rows{display:inline-flex;align-items:center;gap:6px;margin-left:8px}.p668-direct-rows-label{color:#607d8b;font-size:12px;fon'
||'t-weight:700;white-space:nowrap}.p668-direct-rows-select{height:32px;min-width:72px;padding:0 28px 0 9px;border:1px solid #d7dfec;border-radius:6px;background-color:#fff;color:#1e3a5f;font-weight:600}'';',
    '    document.head.appendChild(lovStyle);',
    '  }',
    '  function focusPopupLovSearch(){setTimeout(function(){var dialogs=document.querySelectorAll(''.ui-dialog-popuplov'');for(var i=dialogs.length-1;i>=0;i--){var d=dialogs[i];if(!d.offsetWidth&&!d.offsetHeight)continue;var input=d.querySelector(''.a-PopupL'
||'OV-search'');if(input){input.focus({preventScroll:true});if(input.setSelectionRange)input.setSelectionRange(input.value.length,input.value.length);}break;}},40);}',
    '  $(document).off(''click.p668lovfocus dialogopen.p668lovfocus'')',
    '    .on(''click.p668lovfocus'',''.a-Button--popupLOV,.apex-item-popup-lov'',focusPopupLovSearch)',
    '    .on(''dialogopen.p668lovfocus'',''.ui-dialog-popuplov'',focusPopupLovSearch);',
    '  if (!document.getElementById(''p668-chart-fix-css'')) {',
    '    var st = document.createElement(''style''); st.id = ''p668-chart-fix-css'';',
    '    st.textContent = ''.ds-lollipop button.ds-lolli{width:100%;border:0!important;background:transparent!important;box-shadow:none!important;font:inherit;text-align:left;cursor:pointer;appearance:none}.ds-lollipop button.ds-lolli:hover,.ds-lollipop bu'
||'tton.ds-lolli:focus-visible{background:transparent!important;outline:2px solid transparent}.ds-p668-viz,.ds-p668-viz:hover,.ds-lollipop,.ds-lollipop:hover{background:transparent!important;filter:none!important}.ds-p668-viz{width:100%;min-height:280px'
||';padding:8px}.ds-p668-viz svg{display:block;width:100%;height:auto;overflow:visible;text-rendering:geometricPrecision;shape-rendering:geometricPrecision;font-family:inherit}.ds-p668-grid{stroke:rgba(30,58,95,.12);stroke-width:1}.ds-p668-axis{fill:#53'
||'657d;font-size:13px;font-weight:600}.ds-p668-line{fill:none;stroke:#2e73c4;stroke-width:4;stroke-linecap:round;stroke-linejoin:round;pointer-events:none}.ds-p668-area{fill:url(#p668Area);opacity:.18;pointer-events:none}.ds-p668-point{fill:#fff;stroke'
||':#2e73c4;stroke-width:4;cursor:pointer}.ds-p668-col{fill:url(#p668Col);rx:7;cursor:pointer}.ds-p668-col:hover,.ds-p668-hbar:hover,.ds-p668-point:hover{filter:brightness(.92)}.ds-p668-slice{stroke:#fff;stroke-width:2}.ds-p668-legend{display:flex;flex-'
||'wrap:wrap;justify-content:center;gap:8px 18px;margin-top:8px;font-size:12px;color:#607d8b}.ds-p668-leg{display:inline-flex;align-items:center;gap:7px}.ds-p668-dot{width:10px;height:10px;border-radius:3px}.ds-p668-hover-tip{position:fixed;z-index:1000'
||'0;display:none;max-width:320px;padding:8px 11px;border-radius:8px;background:#172554;color:#fff;font-size:13px;font-weight:600;line-height:1.25;box-shadow:0 6px 20px rgba(15,23,42,.25);pointer-events:none;white-space:nowrap}'';',
    '    st.textContent += ''.ds-p668-axis-line{stroke:#64748b;stroke-width:1.2;pointer-events:none}.ds-p668-axis-title{fill:#263b57;font-size:14px;font-weight:800}.ds-p668-ylabel{fill:#26315f;font-size:12.5px;font-weight:650}.ds-p668-value{fill:#172554;fo'
||'nt-size:13px;font-weight:800;paint-order:stroke;stroke:#fff;stroke-width:3px;stroke-linejoin:round}.ds-p668-hbar{fill:url(#p668Col);rx:5;cursor:pointer}.ds-svgd-slice.ds-donut-fast{cursor:pointer}.ds-p668-hover-tip{width:max-content;max-width:min(320'
||'px,calc(100vw - 20px));white-space:normal;overflow-wrap:anywhere}'';',
    '    document.head.appendChild(st);',
    '  }',
    '  var NS = ''http://www.w3.org/2000/svg'', pal = [''#2E73C4'',''#26A69A'',''#F5A623'',''#5B7FA6'',''#8B5CF6'',''#4CAF7D''];',
    '  function se(tag,a){var n=document.createElementNS(NS,tag);Object.keys(a||{}).forEach(function(k){n.setAttribute(k,a[k]);});return n;}',
    '  function polar(cx,cy,r,a){return [cx+r*Math.cos(a),cy+r*Math.sin(a)];}',
    '  function piePath(cx,cy,r,a0,a1){var p0=polar(cx,cy,r,a0),p1=polar(cx,cy,r,a1);return ''M''+cx+'' ''+cy+'' L''+p0[0]+'' ''+p0[1]+'' A''+r+'' ''+r+'' 0 ''+((a1-a0)>Math.PI?1:0)+'' 1 ''+p1[0]+'' ''+p1[1]+'' Z'';}',
    '  function donutPath(cx,cy,ri,ro,a0,a1){var o0=polar(cx,cy,ro,a0),o1=polar(cx,cy,ro,a1),i1=polar(cx,cy,ri,a1),i0=polar(cx,cy,ri,a0);return ''M''+o0[0]+'' ''+o0[1]+'' A''+ro+'' ''+ro+'' 0 ''+((a1-a0)>Math.PI?1:0)+'' 1 ''+o1[0]+'' ''+o1[1]+'' L''+i1[0]+'' ''+i1[1]+'' A''+'
||'ri+'' ''+ri+'' 0 ''+((a1-a0)>Math.PI?1:0)+'' 0 ''+i0[0]+'' ''+i0[1]+'' Z'';}',
    '  function axisValue(v){v=+v||0;return Math.abs(v)>=1000?v.toLocaleString(''en-IN'',{maximumFractionDigits:0}):v.toLocaleString(''en-IN'',{maximumFractionDigits:2});}',
    '  function drawViz(host){',
    '    var raw=host.getAttribute(''data-json'')||''[]'', type=host.getAttribute(''data-chart-type''), data;',
    '    if(host.__p668raw===raw)return; host.__p668raw=raw; try{data=JSON.parse(raw);}catch(e){data=[];} host.innerHTML="";',
    '    if(!data.length){host.textContent=''No data for the current filters.'';return;}',
    '    var svg=se(''svg'',{viewBox:''0 0 400 280'',role:''img'',''aria-label'':type+'' chart''}), max=Math.max.apply(null,data.map(function(d){return +d.v||0;}))||1;',
    '    var defs=se(''defs''),ag=se(''linearGradient'',{id:''p668Area'',x1:''0'',y1:''0'',x2:''0'',y2:''1''}),cg=se(''linearGradient'',{id:''p668Col'',x1:''0'',y1:''0'',x2:''0'',y2:''1''});',
    '    [[''0%'',''#57B6E0''],[''100%'',''#fff'']].forEach(function(x){ag.appendChild(se(''stop'',{offset:x[0],''stop-color'':x[1]}));}); [[''0%'',''#2E73C4''],[''100%'',''#26A69A'']].forEach(function(x){cg.appendChild(se(''stop'',{offset:x[0],''stop-color'':x[1]}));}); defs.ap'
||'pendChild(ag);defs.appendChild(cg);svg.appendChild(defs);',
    '    var unit=host.getAttribute(''data-total-label'')||'''';',
    '    if(type===''hbar''){var H=Math.max(280,data.length*34+70),x0=190,x1=430,top=34,bottom=H-38,item=host.getAttribute(''data-filter-item''),target=host.getAttribute(''data-refresh-target'');svg.setAttribute(''viewBox'',''0 0 560 ''+H);var at=se(''text'',{x:x0,y:'
||'16,class:''ds-p668-axis-title''});at.textContent=''Purchase Value (''+unit+'')'';svg.appendChild(at);svg.appendChild(se(''line'',{x1:x0,y1:top,x2:x0,y2:bottom,class:''ds-p668-axis-line''}));svg.appendChild(se(''line'',{x1:x0,y1:bottom,x2:x1,y2:bottom,class:''ds-p'
||'668-axis-line''}));[0,.25,.5,.75,1].forEach(function(f){var x=x0+(x1-x0)*f;svg.appendChild(se(''line'',{x1:x,y1:top,x2:x,y2:bottom,class:''ds-p668-grid''}));var tx=se(''text'',{x:x,y:bottom+18,''text-anchor'':''middle'',class:''ds-p668-axis''});tx.textContent=axi'
||'sValue(max*f);svg.appendChild(tx);});data.forEach(function(d,i){var y=top+9+i*34,w=(+d.v||0)/max*(x1-x0),attrs={x:x0,y:y,width:Math.max(w,2),height:18,class:''ds-p668-hbar'',''aria-label'':d.l+'': ''+d.v+'' ''+unit,tabindex:''0''};if(item&&d.k!==undefined){att'
||'rs.class+='' ds-filter-fast'';attrs[''data-item'']=item;attrs[''data-value'']=d.k;attrs[''data-display'']=d.d||d.l;attrs[''data-target'']=target;}var r=se(''rect'',attrs);svg.appendChild(r);var yl=se(''text'',{x:x0-10,y:y+13,''text-anchor'':''end'',class:''ds-p668-ylab'
||unistr('el''});yl.textContent=d.l.length>19?d.l.slice(0,18)+''\2026'':d.l;var yt=se(''title'');yt.textContent=d.l;yl.appendChild(yt);svg.appendChild(yl);var vt=se(''text'',{x:442,y:y+13,''text-anchor'':''start'',class:''ds-p668-value''});vt.textContent=axisValue(d.v)+'' ''+uni')
||'t;svg.appendChild(vt);});host.appendChild(svg);return;}',
    '    if(type===''pie''){var total=data.reduce(function(s,d){return s+(+d.v||0);},0)||1,a=-Math.PI/2,leg=document.createElement(''div'');leg.className=''ds-p668-legend'';data.forEach(function(d,i){var b=a+(+d.v||0)/total*Math.PI*2,p=se(''path'',{d:piePath(175,'
||'125,92,a,b),fill:pal[i%pal.length],class:''ds-p668-slice''}),ti=se(''title'');ti.textContent=d.l+'': ''+d.v;p.appendChild(ti);svg.appendChild(p);a=b;var li=document.createElement(''span'');li.className=''ds-p668-leg'';li.innerHTML=''<i class="ds-p668-dot" style'
||'="background:''+pal[i%pal.length]+''"></i>''+d.l;leg.appendChild(li);});host.appendChild(svg);host.appendChild(leg);return;}',
    '    var title=se(''text'',{x:58,y:20,class:''ds-p668-axis-title''});title.textContent=''Value (''+unit+'')'';svg.appendChild(title);svg.appendChild(se(''line'',{x1:58,y1:40,x2:58,y2:220,class:''ds-p668-axis-line''}));svg.appendChild(se(''line'',{x1:58,y1:220,x2:38'
||'2,y2:220,class:''ds-p668-axis-line''}));[0,.25,.5,.75,1].forEach(function(f){var y=220-f*165;svg.appendChild(se(''line'',{x1:58,y1:y,x2:382,y2:y,class:''ds-p668-grid''}));var tx=se(''text'',{x:50,y:y+5,''text-anchor'':''end'',class:''ds-p668-axis''});tx.textConten'
||'t=axisValue(max*f);svg.appendChild(tx);});',
    '    if(type===''line''){var pts=data.map(function(d,i){return [72+(data.length===1?0:i*300/(data.length-1)),220-(+d.v||0)/max*165];}),area=''M''+pts[0][0]+'' 220 L''+pts.map(function(p){return p.join('' '');}).join('' L'')+'' L''+pts[pts.length-1][0]+'' 220 Z'';sv'
||'g.appendChild(se(''path'',{d:area,class:''ds-p668-area''}));svg.appendChild(se(''polyline'',{points:pts.map(function(p){return p.join('','');}).join('' ''),class:''ds-p668-line''}));pts.forEach(function(p,i){var label=data[i].l+'': ''+axisValue(data[i].v)+'' ''+unit'
||',c=se(''circle'',{cx:p[0],cy:p[1],r:7,class:''ds-p668-point ds-month-fast'',''data-from'':data[i].f,''data-to'':data[i].t,''aria-label'':label,tabindex:''0''});svg.appendChild(c);var vl=se(''text'',{x:p[0],y:Math.max(42,p[1]-12),''text-anchor'':''middle'',class:''ds-p6'
||'68-value''});vl.textContent=axisValue(data[i].v);svg.appendChild(vl);var tx=se(''text'',{x:p[0],y:252,''text-anchor'':''middle'',class:''ds-p668-axis''});tx.textContent=data[i].l;svg.appendChild(tx);});}',
    '    else {var slot=300/data.length,w=Math.min(68,slot*.56);data.forEach(function(d,i){var rawH=(+d.v||0)/max*165,h=(+d.v||0)>0?Math.max(rawH,4):0,x=72+i*slot+(slot-w)/2,label=d.l+'': ''+axisValue(d.v)+'' ''+unit,r=se(''rect'',{x:x,y:220-h,width:w,height:h,'
||'class:''ds-p668-col ds-period-fast'',''data-from'':d.f,''data-to'':d.t,''aria-label'':label,tabindex:''0''});svg.appendChild(r);var vl=se(''text'',{x:x+w/2,y:Math.max(42,220-h-9),''text-anchor'':''middle'',class:''ds-p668-value''});vl.textContent=axisValue(d.v);svg.ap'
||'pendChild(vl);var tx=se(''text'',{x:x+w/2,y:252,''text-anchor'':''middle'',class:''ds-p668-axis''});tx.textContent=d.l;svg.appendChild(tx);});}',
    '    host.appendChild(svg);',
    '  }',
    '  function scanViz(){document.querySelectorAll(''.ds-p668-viz'').forEach(drawViz);}',
    '  function enhanceDonutSlices(){var pending=false;document.querySelectorAll(''.ds-svgdonut'').forEach(function(host){var raw=host.getAttribute(''data-json'')||''[]'';if(host.__p668slice===raw)return;var data;try{data=JSON.parse(raw).filter(function(d){retu'
||'rn +d.v>0;});}catch(e){return;}var paths=host.querySelectorAll(''.ds-svgd-slice'');if(paths.length!==data.length){pending=true;return;}var total=data.reduce(function(s,d){return s+(+d.v||0);},0)||1,fr=data.map(function(d){return (+d.v||0)/total;}),minF'
||'rac=data.length>2?Math.min(.012,.42/data.length):0,small=fr.filter(function(f){return f>0&&f<minFrac;}).length,largeSum=fr.filter(function(f){return f>=minFrac;}).reduce(function(s,f){return s+f;},0),remain=1-small*minFrac,a=-Math.PI/2,item=host.getA'
||'ttribute(''data-filter-item''),focus=host.getAttribute(''data-focus-item''),target=host.getAttribute(''data-refresh-target'');fr.forEach(function(f,i){var shown=f<minFrac?minFrac:(largeSum?f/largeSum*remain:f),b=a+shown*Math.PI*2,p=paths[i];p.setAttribute('
||'''d'',donutPath(125,125,68,112,a,b-.006));p.setAttribute(''data-actual-share'',(f*100).toFixed(2));if((item||focus)&&data[i].k!==undefined){p.classList.add(''ds-donut-fast'');p.setAttribute(''data-item'',item||focus);p.setAttribute(''data-value'',data[i].k);p.'
||'setAttribute(''data-display'',data[i].d||data[i].l);p.setAttribute(''data-target'',target||'''');}a=b;});host.__p668slice=raw;});if(pending)setTimeout(enhanceDonutSlices,45);}',
    '  scanViz(); enhanceDonutSlices(); $(document).off(''apexafterrefresh.p668viz'').on(''apexafterrefresh.p668viz'',function(){setTimeout(function(){scanViz();enhanceDonutSlices();},20);});',
    '  var hoverTip=document.getElementById(''p668-hover-tip''); if(!hoverTip){hoverTip=document.createElement(''div'');hoverTip.id=''p668-hover-tip'';hoverTip.className=''ds-p668-hover-tip'';hoverTip.setAttribute(''role'',''tooltip'');document.body.appendChild(hover'
||'Tip);}',
    '  function hoverText(el){var a=el.getAttribute(''aria-label'');if(a)return a;var root=el.classList&&el.classList.contains(''ds-lolli-track'')?el.closest(''.ds-lolli''):el,t=root&&root.querySelector&&root.querySelector(''title'');if(t&&t.textContent)return t.'
||'textContent;var l=root&&root.querySelector&&root.querySelector(''.ds-lolli-label''),v=root&&root.querySelector&&root.querySelector(''.ds-lolli-val'');return l&&v?l.textContent.trim()+'': ''+v.textContent.trim():'''';}',
    '  function placeTip(e){var x=e.clientX+14,y=e.clientY+14,maxX=Math.max(10,window.innerWidth-hoverTip.offsetWidth-10),maxY=Math.max(10,window.innerHeight-hoverTip.offsetHeight-10);hoverTip.style.left=Math.max(10,Math.min(x,maxX))+''px'';hoverTip.style.t'
||'op=Math.max(10,Math.min(y,maxY))+''px'';}',
    '  var hoverMarks=''.ds-lolli-track,.ds-month-fast,.ds-period-fast,.ds-p668-hbar,.ds-svgd-slice''; $(document).off(''.p668tip'').on(''mouseenter.p668tip'',hoverMarks,function(e){var t=hoverText(this);if(!t)return;hoverTip.textContent=t;hoverTip.style.displa'
||'y=''block'';placeTip(e);}).on(''mousemove.p668tip'',hoverMarks,placeTip).on(''mouseleave.p668tip'',hoverMarks,function(){hoverTip.style.display=''none'';}).on(''mousemove.p668tipbg'',''.ds-p668-viz,.ds-lollipop'',function(e){if(!$(e.target).closest(hoverMarks).l'
||'ength)hoverTip.style.display=''none'';});',
    '  function placeDonutCard(e,el){var host=el.closest(''.ds-svgdonut''),wrap=host&&host.querySelector(''.ds-svgd-wrap''),card=host&&host.querySelector(''.ds-svgd-card'');if(!wrap||!card)return;var rb=wrap.getBoundingClientRect(),gap=18,w=card.offsetWidth||22'
||'0,h=card.offsetHeight||130,cx=e.clientX-rb.left,cy=e.clientY-rb.top,x=cx+gap,y=cy+gap;if(x+w>rb.width-8)x=cx-w-gap;if(y+h>rb.height-8)y=cy-h-gap;x=Math.max(8,Math.min(x,rb.width-w-8));y=Math.max(8,Math.min(y,rb.height-h-8));card.style.left=x+''px'';car'
||'d.style.top=y+''px'';}',
    '  $(document).off(''.p668donutcard'').on(''mouseenter.p668donutcard mousemove.p668donutcard'',''.ds-svgd-slice'',function(e){placeDonutCard(e,this);});',
    '  var rowsMemory={};try{rowsMemory=JSON.parse(sessionStorage.getItem(''p668-ir-rows'')||''{}'');}catch(ignore){}',
    '  function chooseNativeRows(select){var id=select.getAttribute(''data-region''),value=select.value,node=document.getElementById(id+''_ir''),widget=node?$.data(node,''apex-interactiveReport''):null;select.disabled=true;rowsMemory[id]=value;try{sessionStorag'
||'e.setItem(''p668-ir-rows'',JSON.stringify(rowsMemory));}catch(ignore){}try{if(widget&&typeof widget._pull===''function''){widget.options.currentRowsPerPage=Number(value);widget._pull({pReportId:widget.reportId,pData:{f01:[],f02:[]}});return;}}catch(error'
||'){select.title=error.message||String(error);}select.disabled=false;}',
    '  function installDirectRows(){document.querySelectorAll(''.a-IRR-toolbar'').forEach(function(toolbar){var action=toolbar.querySelector(''.a-IRR-button--actions'');if(!action||toolbar.querySelector(''.p668-direct-rows''))return;var id=action.id.replace(/_a'
||'ctions_button$/,''''),wrap=document.createElement(''label''),select=document.createElement(''select'');wrap.className=''p668-direct-rows'';wrap.innerHTML=''<span class="p668-direct-rows-label">Rows</span>'';select.className=''p668-direct-rows-select'';select.set'
||'Attribute(''data-region'',id);select.setAttribute(''aria-label'',''Rows per page'');[''5'',''10'',''15'',''20'',''25'',''50'',''100''].forEach(function(v){var o=document.createElement(''option'');o.value=v;o.textContent=v;select.appendChild(o);});select.value=rowsMemory[i'
||'d]||((id===''p668SupTable''||id===''p668FreightRegister'')?''20'':''10'');wrap.appendChild(select);action.insertAdjacentElement(''afterend'',wrap);});}',
    '  installDirectRows(); $(document).off(''change.p668rows'').on(''change.p668rows'',''.p668-direct-rows-select'',function(){chooseNativeRows(this);}).off(''apexafterrefresh.p668rows'').on(''apexafterrefresh.p668rows'',function(){setTimeout(installDirectRows,20)'
||';});',
    '  function refreshScroll(id){var el=document.getElementById(id);if(!el)return;var done=function(){setTimeout(function(){el.scrollIntoView({behavior:"smooth",block:"start"});},30);};try{$(el).one("apexafterrefresh.p668scroll",done);apex.region(id).ref'
||'resh();}catch(e){done();}}',
    '  $(document).off(''click.p668pipe'').on(''click.p668pipe'', ''.ds-pipe-fast'', function (e) {',
    '    e.preventDefault();',
    '    apex.item(''P934_PIPE_FOCUS'').setValue(this.getAttribute(''data-k''));',
    '    refreshScroll(''p668PipeOrders'');',
    '  });',
    '  $(document).off(''click.p668month'').on(''click.p668month'', ''.ds-month-fast'', function (e) {',
    '    e.preventDefault();',
    '    apex.item(''P934_FROMDATE'').setValue(this.getAttribute(''data-from''));',
    '    apex.item(''P934_TODATE'').setValue(this.getAttribute(''data-to''));',
    '    refreshScroll(''p668SupTable'');',
    '  });',
    '  $(document).off(''click.p668period'').on(''click.p668period'', ''.ds-period-fast'', function (e) {',
    '    e.preventDefault();',
    '    apex.item(''P934_FROMDATE'').setValue(this.getAttribute(''data-from''));',
    '    apex.item(''P934_TODATE'').setValue(this.getAttribute(''data-to''));',
    '    refreshScroll(''p668SupTable'');',
    '  });',
    '  // Use the same native IR action as choosing a value from a column heading.',
    '  // A graph selection must not remain as an invisible page-item predicate.',
    '  function filterRegisterFromChart(mark, item, target) {',
    '    var label = item === ''P934_SUPPLIER'' ? ''Supplier'' : ''Transporter'';',
    '    var region = document.getElementById(target);',
    '    var node = document.getElementById(target + ''_ir'');',
    '    var widget = node && $.data(node, ''apex-interactiveReport'');',
    '    var header = region && Array.prototype.find.call(',
    '      region.querySelectorAll(''.a-IRR-headerLink[data-column]''),',
    '      function (el) { return el.textContent.trim() === label; });',
    '    if (!widget || typeof widget._action !== ''function'' || !header) {',
    '      apex.message.showErrors([{type:''error'',location:''page'',',
    '        message:''The report is not ready. Please try the chart again.'',unsafe:false}]);',
    '      return;',
    '    }',
    '    // Ignore another click while the native report request is still settling.',
    '    if (region.__p668ChartFilterBusy) return;',
    '    region.__p668ChartFilterBusy = true;',
    '    var column = header.getAttribute(''data-column'');',
    '    var value = mark.getAttribute(''data-display'');',
    '    var oldValue = apex.item(item).getValue();',
    '    var timer = setTimeout(function () {',
    '      region.__p668ChartFilterBusy = false;',
    '      $(region).off(''apexafterrefresh.p668NativeChart'');',
    '    }, 15000);',
    '    function finish() {',
    '      clearTimeout(timer);',
    '      region.__p668ChartFilterBusy = false;',
    '      setTimeout(function () {',
    '        region.scrollIntoView({behavior:''smooth'',block:''start''});',
    '      }, 30);',
    '    }',
    '    function applySelection() {',
    '      // Replace equality selections for this dimension, preserving searches,',
    '      // other column filters, dates, company, location and report formatting.',
    '      var previous = Array.prototype.find.call(',
    '        region.querySelectorAll(''.a-IRR-button--edit[data-filter-id]''),',
    '        function (el) {',
    '          var text = document.getElementById(el.getAttribute(''aria-describedby''));',
    '          return text && text.textContent.trim().indexOf(label + '' = '') === 0;',
    '        });',
    '      if (previous) {',
    '        $(region).one(''apexafterrefresh.p668NativeChart'', applySelection);',
    '        widget._action(''FILTER_DELETE'', {id:previous.getAttribute(''data-filter-id'')});',
    '      } else {',
    '        $(region).one(''apexafterrefresh.p668NativeChart'', finish);',
    '        widget._action(''COL_FILTER'', {f01:[column, ''='', value, '''', '''']});',
    '      }',
    '    }',
    '    try {',
    '      // Clear any selection left by the older chart handler, without firing',
    '      // change events that would refresh every dashboard region.',
    '      apex.item(item).setValue('''', '''', true);',
    '      applySelection();',
    '    } catch (error) {',
    '      apex.item(item).setValue(oldValue, null, true);',
    '      $(region).off(''apexafterrefresh.p668NativeChart'');',
    '      finish();',
    '      apex.message.showErrors([{type:''error'',location:''page'',',
    '        message:''Could not apply the chart filter. Please try again.'',unsafe:false}]);',
    '    }',
    '  }',
    '',
    '  $(document).off(''click.p668chartfilter'').on(''click.p668chartfilter'', ''.ds-filter-fast,.ds-donut-fast'', function (e) {',
    '    e.preventDefault();',
    '    var item=this.getAttribute(''data-item''),target=this.getAttribute(''data-target'');',
    '    if (item === ''P934_SUPPLIER'' || item === ''P934_TRANSPORTER'') {',
    '      filterRegisterFromChart(this, item, item === ''P934_SUPPLIER'' ? ''p668SupTable'' : ''p668FreightRegister'');',
    '      return;',
    '    }',
    '    if(/^p668RegS/.test(target||'''')){document.querySelectorAll(''#p668StageDetail,.ds-srcreg'').forEach(function(n){n.classList.toggle(''ds-reg-hidden'',n.id!==target);});}',
    '    if(/^p668RegE/.test(target||'''')){document.querySelectorAll(''#p668ExecDetail,.ds-execreg'').forEach(function(n){n.classList.toggle(''ds-reg-hidden'',n.id!==target);});}',
    '    if(item===''P934_PIPE_FOCUS''){apex.item(item).setValue(this.getAttribute(''data-value''));}else{apex.item(item).setValue(this.getAttribute(''data-value''),this.getAttribute(''data-display''));}',
    '    refreshScroll(target||(item===''P934_ITEM''?''uom-mix'':''p668SupTable''));',
    '  });',
    '}());')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
