prompt --application/pages/page_00721
begin
--   Manifest
--     PAGE: 00721
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
 p_id=>721
,p_name=>'Sales Lifecycle Control Tower'
,p_alias=>'SALES-LIFECYCLE-CONTROL-TOWER'
,p_step_title=>'Sales Lifecycle Control Tower'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
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
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_IMAGES#dashboard-fast-runtime.js?version=#APP_VERSION#&cb=20260829v',
'#APP_IMAGES#dashboard-fast-charts.js?version=#APP_VERSION#&cb=20260830a'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('SALES LIFECYCLE CONTROL TOWER (SLC) \2014 data contract (HSPL).'),
'',
'LIFECYCLE (data-validated 22-08-2026, see docs/slc-dashboard-investigation.md):',
'  SLC_SalesConfirm -> SLC_SalesOrder(.SalesConfirmTNo) -> SLC_DespatchAdvice(.SalesOrderTNo)',
'  -> SLC_MaterialOut(.ReferenceTNo=SLC_DespatchAdvice; GateInTime/GateOutTime = Gate In/Out)',
'  -> SLC_Weighment(FirstWeight/SecondWeight = SLC_Weighment/Final; Gross/Tare/Net)',
'  -> SLC_CCInvoice(.SalesOrderTNo,.DespatchAdviceTNo) -> SLC_EInvoice(.CCInvoiceTNo; IRN/ACK/EWB).',
'Gate In+Out are ONE SLC_MaterialOut row; SLC_Weighment+Final are ONE SLC_Weighment row (two weighings).',
'',
'VALUE GRAIN. Funnel/KPI value = SUM(detail.Amount) (taxable line value) at each stage',
'that has value (Quotation, Sales Order, Invoice), so the value funnel is one grain and',
'the Invoice figure reconciles to the CC Invoice (Sales) Register (page 56). Dispatch/Gate/',
'SLC_Weighment/E-Invoice have no rupee value in the ERP -> count/quantity only.',
'',
'CATEGORY. Master = SLC_ItemSpecification.ItemCategoryCode -> ItemCategory. Override exists ONLY',
'at SLC_SalesConfirmDetail.ItemCategoryCode; SO/Invoice inherit from the specification master.',
'Reporting uses the spec-master category; a quotation-time override is a data-quality flag.',
'',
'BILL RECEIPT / COLLECTION. No sales bill-receipt document exists (RECEIPT vouchers are FREIGHT).',
'Customer collection/outstanding reuses the AR model (pages 690-702). Profitability is',
'UNAVAILABLE (no cost on sales lines) and is labelled so, never fabricated.',
'',
'SCOPE. Company and Location are the dashboard business scope.',
'No additional dashboard partition filter is shown or applied.',
'READ-ONLY. Every region is a SELECT. No INSERT/UPDATE/DELETE/MERGE.'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482188401429676336)
,p_plug_name=>'Agent Performance'
,p_static_id=>'agent-performance'
,p_region_name=>'p730Agents'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>64
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Case When ci.AgentCode Is Not Null Then ''<a href="''||apex_page.get_url(p_page=>174,p_clear_cache=>''174,RIR'',p_items=>''P174_FROMDATE,P174_TODATE,P174_COMPANY,P174_LOCATION,P174_AGENTCODE'',p_values=>:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_'
||'COMPANY||'',''||:P721_LOCATION||'',''||ci.AgentCode)||''">''||apex_escape.html(GetPartyName(ci.AgentCode))||''</a>'' Else ''(direct / no agent)'' End AGENT,',
'       Round(Sum(d.Amount)/1e7,2) INV_CR,',
'       Round(Sum(d.Quantity1)) QTY,',
'       Count(Distinct ci.TNo) INVOICES,',
'       Count(Distinct ci.PartyCode) CUSTOMERS',
'  From SLC_CCInvoice ci Join SLC_CCInvoiceDetail d On d.TNo=ci.TNo',
' Where ci.CCInvoiceDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY)',
'   And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION)',
'   And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
' Group By ci.AgentCode',
' Order By Sum(d.Amount) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1482188496700676336)
,p_no_data_found_message=>'No sales in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47729986509379086
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482188572140676336)
,p_db_column_name=>'AGENT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Agent'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482188951651676336)
,p_db_column_name=>'CUSTOMERS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Customers'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482188862990676336)
,p_db_column_name=>'INVOICES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Invoices'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482188661451676336)
,p_db_column_name=>'INV_CR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Invoiced (Cr)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482188787258676336)
,p_db_column_name=>'QTY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1482193795201748652)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'AGENT:INV_CR:QTY:INVOICES:CUSTOMERS'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1481690246588482423)
,p_name=>'Bottlenecks'
,p_static_id=>'bottlenecks'
,p_template=>4501440665235496320
,p_display_sequence=>41
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F, to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual),',
'B As (',
'  Select 1 Seq, 10 FromK, ''Quotation &rarr; Order'' Nm,',
'         Count(*) Cnt, Round(Nvl(Sum(v),0)/1e7,2) ValCr, Round(Avg(age)) AvgAge, Round(Max(age)) MaxAge',
'    From (Select (Select Nvl(Sum(d.Amount),0) From SLC_SalesConfirmDetail d Where d.TNo=a.TNo) v, sysdate-a.SalesConfirmDate age',
'            From SLC_SalesConfirm a Cross Join Win w Where a.SalesConfirmDate Between w.F And w.T',
'             And Not Exists (Select 1 From SLC_SalesOrder x Where x.SalesConfirmTNo=a.TNo)',
'             And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'             And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL))',
'  Union All',
'  Select 2, 20, ''Order &rarr; Dispatch'',',
'         Count(*), Round(Nvl(Sum(v),0)/1e7,2), Round(Avg(age)), Round(Max(age))',
'    From (Select (Select Nvl(Sum(d.Amount),0) From SalesOrderDetail d Where d.TNo=a.TNo) v, sysdate-a.SalesOrderDate age',
'            From SLC_SalesOrder a Cross Join Win w Where a.SalesOrderDate Between w.F And w.T',
'             And Not Exists (Select 1 From SLC_DespatchAdvice x Where x.SalesOrderTNo=a.TNo)',
'             And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'             And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL))',
'  Union All',
'  Select 3, 30, ''Dispatch &rarr; Gate'',',
'         Count(*), Null, Round(Avg(age)), Round(Max(age))',
'    From (Select sysdate-a.DespatchAdviceDate age',
'            From SLC_DespatchAdvice a Cross Join Win w Where a.DespatchAdviceDate Between w.F And w.T',
'             And Not Exists (Select 1 From SLC_MaterialOut x Where x.ReferenceTNo=a.TNo)',
'             And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'             And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL))',
'  Union All',
'  Select 4, 30, ''Gate-out &rarr; Invoice'',',
'         Count(*), Null, Round(Avg(age)), Round(Max(age))',
'    From (Select sysdate-a.DespatchAdviceDate age',
'            From SLC_DespatchAdvice a Cross Join Win w Where a.DespatchAdviceDate Between w.F And w.T',
'             And Exists (Select 1 From SLC_MaterialOut m Where m.ReferenceTNo=a.TNo And m.GateOutTime Is Not Null)',
'             And Not Exists (Select 1 From SLC_CCInvoice c Where c.DespatchAdviceTNo=a.TNo)',
'             And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'             And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL))',
'  Union All',
'  Select 5, 60, ''Invoice &rarr; E-Invoice'',',
'         Count(*), Round(Nvl(Sum(v),0)/1e7,2), Round(Avg(age)), Round(Max(age))',
'    From (Select (Select Nvl(Sum(d.Amount),0) From SLC_CCInvoiceDetail d Where d.TNo=a.TNo) v, sysdate-a.CCInvoiceDate age',
'            From SLC_CCInvoice a Cross Join Win w Where a.CCInvoiceDate Between w.F And w.T',
'             And Not Exists (Select 1 From SLC_EInvoice x Where x.CCInvoiceTNo=a.TNo)',
'             And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'             And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)))',
'Select',
'  ''<a class="ds-kpi ds-slc-drill ''||Case When b.Cnt=0 Then ''ds-kpi--ok'' When Nvl(b.MaxAge,0) > 30 Then ''ds-kpi--risk'' Else ''ds-kpi--value'' End||''" data-k="''||b.FromK||''" href="javascript:void(0);">''',
'  ||''<span class="ds-kpi-ic"><span class="fa fa-hourglass-half"></span></span>''',
'  ||''<span class="ds-kpi-body"><span class="ds-kpi-t">''||b.Nm||''</span>''',
'  ||''<span class="ds-kpi-n">''||to_char(b.Cnt,''FM999G999G990'')||''</span>''',
'  ||''<span class="ds-kpi-sub">''',
'     ||Case When b.ValCr Is Not Null Then ''&#8377; ''||to_char(b.ValCr,''FM999G990D00'')||'' Cr &#183; '' Else '''' End',
'     ||''avg ''||to_char(Nvl(b.AvgAge,0),''FM990'')||''d &#183; max ''||to_char(Nvl(b.MaxAge,0),''FM990'')||''d</span>''',
'  ||''</span></a>'' As CARD',
'From B b Order By b.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No bottlenecks in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1481690319589482423)
,p_query_column_id=>1
,p_column_alias=>'CARD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1483437776045395165)
,p_name=>'Category Mix'
,p_static_id=>'category-chart'
,p_template=>4072358936313175081
,p_display_sequence=>60
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With ds_chart_ordered As (',
'  Select Nvl(cat.ItemCategoryName, Nvl(isp.ItemCategoryCode,''Uncategorised'')) CATEGORY,',
'         Round(Sum(d.Amount)/1e7,2) VAL_CR',
'    From SLC_CCInvoice ci Join SLC_CCInvoiceDetail d On d.TNo=ci.TNo',
'    Left Join SLC_ItemSpecification isp On isp.ItemSpecificationCode = d.ItemSpecificationCode',
'    Left Join ItemCategory cat On cat.ItemCategoryCode = isp.ItemCategoryCode',
'   Where ci.CCInvoiceDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY)',
'     And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION)',
'     And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
'   Group By Nvl(cat.ItemCategoryName, Nvl(isp.ItemCategoryCode,''Uncategorised''))',
'   Order By Sum(d.Amount) Desc',
'),',
'ds_chart_q As (',
'  Select ordered_q.*, rownum ds_ord',
'    From ds_chart_ordered ordered_q',
')',
'Select',
'  ''<div class="ds-fast-chart" data-chart-type="hbar" aria-label="Category Mix"><script type="application/json" class="ds-fast-chart-data">'' ||',
'  replace(',
'    json_object(',
'      ''unit'' value ''Rs Cr'',',
'      ''series'' value json_array(''Invoiced Value (Rs Cr)'' returning clob) format json,',
'      ''rows'' value json_arrayagg(',
'        json_object(''l'' value to_char(q.CATEGORY),',
'                    ''values'' value json_array(q.VAL_CR returning clob) format json,',
'                    ''u'' value null',
'                    returning clob)',
'        order by q.ds_ord returning clob) format json',
'      returning clob),',
'    ''<'', ''\\u003c''',
'  ) || ''</script></div>'' As CHART_ROW',
'From ds_chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1483437992411395165)
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
 p_id=>wwv_flow_imp.id(1482440727768773376)
,p_plug_name=>'Category Flow'
,p_static_id=>'category-flow'
,p_region_name=>'p730CatFlow'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F, to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual),',
'ConfCat As (',
'  Select Distinct sc.TNo t, scd.ItemCategoryCode ccat',
'    From SLC_SalesConfirm sc Join SLC_SalesConfirmDetail scd On scd.TNo=sc.TNo Cross Join Win w',
'   Where sc.SalesConfirmDate Between w.F And w.T And scd.ItemCategoryCode Is Not Null',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'     And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'     And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)),',
'OrdCat As (',
'  Select Distinct so.SalesConfirmTNo t, isp.ItemCategoryCode ocat',
'    From SLC_SalesOrder so Join SalesOrderDetail sod On sod.TNo=so.TNo',
'    Join SLC_ItemSpecification isp On isp.ItemSpecificationCode=sod.ItemSpecificationCode',
'   Where so.SalesConfirmTNo Is Not Null And isp.ItemCategoryCode Is Not Null)',
'Select Nvl(cc.ItemCategoryName,x.ccat) CONFIRMED_CAT,',
'       Nvl(oc.ItemCategoryName,x.ocat) ORDER_CAT,',
'       ''<span class="ds-pill ds-pill--''||Case When x.ccat=x.ocat Then ''good">Same'' Else ''warn">Changed'' End||''</span>'' MATCH,',
'       Count(*) LINKS,',
'       ''<a href="#" class="ds-cflow-drill" data-c="''||x.ccat||''" data-o="''||x.ocat||''" data-cl="''||Nvl(cc.ItemCategoryName,x.ccat)||''" data-ol="''||Nvl(oc.ItemCategoryName,x.ocat)||''">View lines &rsaquo;</a>'' DETAIL,',
'       Case When x.ccat=x.ocat Then 1 Else 0 End SAME_ORD',
'  From (Select c.ccat, o.ocat From ConfCat c Join OrdCat o On o.t=c.t) x',
'  Left Join ItemCategory cc On cc.ItemCategoryCode=x.ccat',
'  Left Join ItemCategory oc On oc.ItemCategoryCode=x.ocat',
' Group By x.ccat, x.ocat, cc.ItemCategoryName, oc.ItemCategoryName',
' Order By Case When x.ccat=x.ocat Then 1 Else 0 End, Count(*) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1482440856490773376)
,p_no_data_found_message=>'No confirmed-to-order category links in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47982346299476126
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482441008774773376)
,p_db_column_name=>'CONFIRMED_CAT'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Confirmed Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483438303763395190)
,p_db_column_name=>'DETAIL'
,p_display_order=>45
,p_column_identifier=>'E'
,p_column_label=>'Detail'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482441283788773376)
,p_db_column_name=>'LINKS'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Links'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482441166306773376)
,p_db_column_name=>'MATCH'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Match'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482441068660773376)
,p_db_column_name=>'ORDER_CAT'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Order Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482441326267773376)
,p_db_column_name=>'SAME_ORD'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Sort'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1482444290084779547)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'CONFIRMED_CAT:ORDER_CAT:MATCH:LINKS:DETAIL:SAME_ORD'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1483438405110395190)
,p_plug_name=>'Category Flow &mdash; Quotation vs Order Detail'
,p_static_id=>'category-flow-detail'
,p_region_name=>'p730CatFlowDetail'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F, to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual)',
'Select ''<a href="''||apex_page.get_url(p_page=>722,p_items=>''P722_TNO'',p_values=>sc.TNo)||''">''||sc.SalesConfirmNo||''</a>'' CONFIRM_NO,',
'       sc.SalesConfirmDate CONFIRM_DATE,',
'       so.SalesOrderNo ORDER_NO,',
'       so.SalesOrderDate ORDER_DATE,',
'       trunc(so.SalesOrderDate-sc.SalesConfirmDate) GAP_DAYS,',
'       GetPartyName(sc.PartyCode) CUSTOMER,',
'       Nvl(cc.ItemCategoryName,:P721_CFLOW_C) CONFIRMED_CAT,',
'       Nvl(oc.ItemCategoryName,:P721_CFLOW_O) ORDER_CAT',
'  From SLC_SalesConfirm sc',
'  Join SLC_SalesOrder so On so.SalesConfirmTNo=sc.TNo',
'  Cross Join Win w',
'  Left Join ItemCategory cc On cc.ItemCategoryCode=:P721_CFLOW_C',
'  Left Join ItemCategory oc On oc.ItemCategoryCode=:P721_CFLOW_O',
' Where :P721_CFLOW_C Is Not Null',
'   And sc.SalesConfirmDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'   And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'   And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)',
'   And Exists (Select 1 From SLC_SalesConfirmDetail scd Where scd.TNo=sc.TNo And scd.ItemCategoryCode=:P721_CFLOW_C)',
'   And Exists (Select 1 From SalesOrderDetail sod Join SLC_ItemSpecification isp On isp.ItemSpecificationCode=sod.ItemSpecificationCode Where sod.TNo=so.TNo And isp.ItemCategoryCode=:P721_CFLOW_O)',
' Order By sc.SalesConfirmDate Desc, so.SalesOrderDate Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1483438459800395190)
,p_no_data_found_message=>'Click "View lines" on any Category Flow row above to trace the exact confirmations and the orders they became.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>48979949609097940
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483439181162395191)
,p_db_column_name=>'CONFIRMED_CAT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Confirmed Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483438691413395191)
,p_db_column_name=>'CONFIRM_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Confirmed On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483438607888395190)
,p_db_column_name=>'CONFIRM_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Confirmation No'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483439088955395191)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483438911646395191)
,p_db_column_name=>'GAP_DAYS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Gap (days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483439299405395191)
,p_db_column_name=>'ORDER_CAT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Order Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483438894844395191)
,p_db_column_name=>'ORDER_DATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Ordered On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483438780832395191)
,p_db_column_name=>'ORDER_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Order No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1483447914744408441)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'CONFIRM_NO:CONFIRM_DATE:ORDER_NO:ORDER_DATE:GAP_DAYS:CUSTOMER:CONFIRMED_CAT:ORDER_CAT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482186143573676335)
,p_plug_name=>'Category 360 Register'
,p_static_id=>'category-performance'
,p_region_name=>'p730CatPerf'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>61
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Case When isp.ItemCategoryCode Is Not Null Then',
'         ''<a href="''||apex_page.get_url(p_page=>725,p_clear_cache=>''725'',p_items=>''P725_CATEGORY'',p_values=>isp.ItemCategoryCode)||''">''',
'         ||apex_escape.html(Nvl(cat.ItemCategoryName,isp.ItemCategoryCode))||''</a>''',
'       Else ''Uncategorised'' End CATEGORY,',
'       Round(Sum(d.Amount)/1e7,2) VAL_CR,',
'       Round(Sum(d.Quantity1)) QTY,',
'       Count(Distinct ci.TNo) INVOICES,',
'       Count(Distinct ci.PartyCode) CUSTOMERS,',
'       Round(Sum(d.Amount)/Nullif(Sum(d.Quantity1),0)) AVG_RATE',
'  From SLC_CCInvoice ci Join SLC_CCInvoiceDetail d On d.TNo=ci.TNo',
'  Left Join SLC_ItemSpecification isp On isp.ItemSpecificationCode = d.ItemSpecificationCode',
'  Left Join ItemCategory cat On cat.ItemCategoryCode = isp.ItemCategoryCode',
' Where ci.CCInvoiceDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY)',
'   And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION)',
'   And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
' Group By isp.ItemCategoryCode, cat.ItemCategoryName',
' Order By Sum(d.Amount) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1482186303527676335)
,p_no_data_found_message=>'No sales in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47727793336379085
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482186846027676336)
,p_db_column_name=>'AVG_RATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Avg Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482186319859676335)
,p_db_column_name=>'CATEGORY'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Category'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482186741267676336)
,p_db_column_name=>'CUSTOMERS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Customers'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482186706322676336)
,p_db_column_name=>'INVOICES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Invoices'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482186587028676336)
,p_db_column_name=>'QTY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482186486695676336)
,p_db_column_name=>'VAL_CR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Value (Cr)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1482191979447748650)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'CATEGORY:VAL_CR:QTY:INVOICES:CUSTOMERS:AVG_RATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1486535742323381144)
,p_plug_name=>'CC Invoice Register'
,p_static_id=>'cc-invoice-follow-up'
,p_region_name=>'p730InvoiceRegister'
,p_region_css_classes=>'ds-register ds-slc-kpireg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>32
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Scope As (',
'  Select ci.*',
'    From SLC_CCInvoice ci',
'   Where :P721_REGISTER_FOCUS In (''INV'',''INV_NO_IRN'')',
'     And ci.CCInvoiceDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY)',
'     And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION)',
'     And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
'     And (:P721_REGISTER_FOCUS<>''INV_NO_IRN'' Or Not Exists',
'           (Select 1 From SLC_EInvoice e Where e.CCInvoiceTNo=ci.TNo And e.IRN Is Not Null))),',
'Footer As (',
'  Select f.TNo,f.SNo,',
'         Sum(Case When f.FooterHeadCode=''.CGST.'' Then f.FooterValue Else 0 End) CGST,',
'         Sum(Case When f.FooterHeadCode=''.SGST.'' Then f.FooterValue Else 0 End) SGST,',
'         Sum(Case When f.FooterHeadCode=''.IGST.'' Then f.FooterValue Else 0 End) IGST,',
'         Sum(Case When f.FooterHeadCode=''.TCS.'' Then f.FooterValue Else 0 End) TCS,',
'         Sum(Case When f.FooterHeadCode=''.INSURANCE.'' Then f.FooterValue Else 0 End) Insurance,',
'         Sum(Case When f.FooterHeadCode In (''.LOADINGCHARGES.'',''.LOADINGUNLOADING.'') Then f.FooterValue Else 0 End) LoadingCharges,',
'         Sum(Case When f.FooterHeadCode=''.CUTTINGCHARGES.'' Then f.FooterValue Else 0 End) CuttingCharges,',
'         Sum(Case When f.FooterHeadCode=''.EXPENSES.'' Then f.FooterValue Else 0 End) Expense',
'    From CCInvoiceDetailFooter f Join Scope s On s.TNo=f.TNo',
'   Group By f.TNo,f.SNo),',
'EInv As (',
'  Select e.CCInvoiceTNo,Max(e.IRN) IRN',
'    From SLC_EInvoice e Join Scope s On s.TNo=e.CCInvoiceTNo',
'   Group By e.CCInvoiceTNo),',
'CurrentStatus As (',
'  Select ModuleTNo,DocumentStatusCode',
'    From (Select d.ModuleTNo,d.DocumentStatusCode,',
'                 Row_Number() Over(Partition By d.ModuleTNo Order By d.StatusTime Desc Nulls Last,d.TNo Desc) rn',
'            From DocumentStatusDetail d Join Scope s On s.TNo=d.ModuleTNo',
'           Where d.ModuleCode=''CCInvoice'')',
'   Where rn=1)',
'Select s.TNo,d.SNo,l.LocationName,dt.DocTypeName,''<a href="''||apex_page.get_url(p_page=>175,p_clear_cache=>''175'',p_items=>''P175_TNO,P175_FORMSTATUS'',p_values=>s.TNo||'',EDITRECORD'')||''">''||apex_escape.html(s.CCInvoiceNo)||''</a>'' CCInvoiceNo,s.CCInvoic'
||'eDate,',
'       da.DespatchAdviceNo,da.DespatchAdviceDate,so.SalesOrderNo,so.SalesOrderDate,',
'       p.PartyName,GetPartyName(s.ConsigneeCode) Consignee,GetPartyName(s.TransporterCode) Transporter,',
'       s.VehicleNo,s.LorryNo,s.LorryDate,ft.FreightTypeName,s.FreightRate,s.FreightUnitCode,',
'       d.ItemCode,i.ItemName,isp.ItemSpecificationName,ic.ItemCategoryName,',
'       i.MeasuringUnitCode1 UOM,i.MeasuringUnitCode2 UOM2,d.Quantity1,d.Quantity2,d.Rate,d.Amount,',
'       Nvl(f.CGST,0) CGST,Nvl(f.SGST,0) SGST,Nvl(f.IGST,0) IGST,Nvl(f.TCS,0) TCS,',
'       Nvl(f.Insurance,0) Insurance,Nvl(f.LoadingCharges,0) LoadingCharges,',
'       Nvl(f.CuttingCharges,0) CuttingCharges,Nvl(f.Expense,0) Expense,',
'       d.BasicRate,d.ConversionRate,d.FooterAmount,',
'       Abs(Nvl(d.FooterAmount,0)-(Nvl(f.CGST,0)+Nvl(f.SGST,0)+Nvl(f.IGST,0)+Nvl(f.TCS,0)+',
'           Nvl(f.Insurance,0)+Nvl(f.LoadingCharges,0)+Nvl(f.CuttingCharges,0)+Nvl(f.Expense,0))) OtherAmount,',
'       d.TotalAmount,be.EmployeeName||'' ( ''||s.Creator||'')'' Creator,s.CreationTime,',
'       GetPartyName(so.AgentCode) AgentName,GetCityName(p.OfficeCityCode) CityName,',
'       GetStateName(p.OfficeStateCode) StateName,d.Description,d.Remark,',
'       Case When ei.IRN Is Not Null Then ''IRN generated'' Else ''IRN pending'' End IRNStatus,',
'       Nvl(cs.DocumentStatusCode,''NONACTIVE'') Status',
'  From Scope s',
'  Join SLC_CCInvoiceDetail d On d.TNo=s.TNo',
'  Left Join Footer f On f.TNo=d.TNo And f.SNo=d.SNo',
'  Left Join EInv ei On ei.CCInvoiceTNo=s.TNo',
'  Left Join CurrentStatus cs On cs.ModuleTNo=s.TNo',
'  Left Join Location l On l.LocationCode=s.LocationCode',
'  Left Join DocType dt On dt.DocTypeCode=s.DocTypeCode',
'  Left Join SLC_DespatchAdvice da On da.TNo=s.DespatchAdviceTNo',
'  Left Join SLC_SalesOrder so On so.TNo=s.SalesOrderTNo',
'  Left Join Party p On p.PartyCode=s.PartyCode',
'  Left Join FreightType ft On ft.FreightTypeCode=s.FreightTypeCode',
'  Left Join Item i On i.ItemCode=d.ItemCode',
'  Left Join SLC_ItemSpecification isp On isp.ItemSpecificationCode=d.ItemSpecificationCode',
'  Left Join ItemCategory ic On ic.ItemCategoryCode=isp.ItemCategoryCode',
'  Left Join BossUser bu On bu.LoginName=s.Creator',
'  Left Join Employee be On be.EmployeeCode=bu.EmployeeCode',
' Order By s.CCInvoiceDate Desc,s.CCInvoiceNo Desc,d.SNo'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1486535838719381144)
,p_no_data_found_message=>'No CC invoices match this KPI and filter scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>52077328528083894
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540198230381145)
,p_db_column_name=>'AGENTNAME'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538549620381145)
,p_db_column_name=>'AMOUNT'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539485100381145)
,p_db_column_name=>'BASICRATE'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Basic Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536070196381144)
,p_db_column_name=>'CCINVOICEDATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Invoice Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486535979491381144)
,p_db_column_name=>'CCINVOICENO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'CC Invoice No'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538645142381145)
,p_db_column_name=>'CGST'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540298242381145)
,p_db_column_name=>'CITYNAME'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'City'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536843076381144)
,p_db_column_name=>'CONSIGNEE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Consignee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539541192381145)
,p_db_column_name=>'CONVERSIONRATE'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Conversion Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540019870381145)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539992519381145)
,p_db_column_name=>'CREATOR'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539289360381145)
,p_db_column_name=>'CUTTINGCHARGES'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Cutting Charges'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540449079381145)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536414983381144)
,p_db_column_name=>'DESPATCHADVICEDATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dispatch Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536328994381144)
,p_db_column_name=>'DESPATCHADVICENO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Dispatch Advice'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536253201381144)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539368655381145)
,p_db_column_name=>'EXPENSE'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Expense'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539663501381145)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537498285381145)
,p_db_column_name=>'FREIGHTRATE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Freight Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537340263381145)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Freight Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537593618381145)
,p_db_column_name=>'FREIGHTUNITCODE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Freight Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538894630381145)
,p_db_column_name=>'IGST'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539036938381145)
,p_db_column_name=>'INSURANCE'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Insurance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540694065381145)
,p_db_column_name=>'IRNSTATUS'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'E-Invoice / IRN'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538000964381145)
,p_db_column_name=>'ITEMCATEGORYNAME'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Item Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537658474381145)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Item Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537722069381145)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537865818381145)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Item Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539130272381145)
,p_db_column_name=>'LOADINGCHARGES'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Loading Charges'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536209270381144)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537218897381145)
,p_db_column_name=>'LORRYDATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Lorry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537148907381145)
,p_db_column_name=>'LORRYNO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Lorry No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539722883381145)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Other Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536803476381144)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538171284381145)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Quantity 1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538391753381145)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Quantity 2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538493708381145)
,p_db_column_name=>'RATE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540518337381145)
,p_db_column_name=>'REMARK'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536633912381144)
,p_db_column_name=>'SALESORDERDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Sales Order Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536545798381144)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Sales Order'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538711120381145)
,p_db_column_name=>'SGST'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540944007381145)
,p_db_column_name=>'SNO'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'S No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540402556381145)
,p_db_column_name=>'STATENAME'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'State'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540769616381145)
,p_db_column_name=>'STATUS'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Document Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538922044381145)
,p_db_column_name=>'TCS'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486540882561381145)
,p_db_column_name=>'TNO'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Transaction No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486539909865381145)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Total Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486536988838381145)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Transporter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538022459381145)
,p_db_column_name=>'UOM'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486538281326381145)
,p_db_column_name=>'UOM2'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'UOM 2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486537035468381145)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Vehicle'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1486550937996385228)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'CCINVOICENO:CCINVOICEDATE:LOCATIONNAME:DOCTYPENAME:DESPATCHADVICENO:DESPATCHADVICEDATE:SALESORDERNO:SALESORDERDATE:PARTYNAME:CONSIGNEE:TRANSPORTER:VEHICLENO:LORRYNO:LORRYDATE:FREIGHTTYPENAME:FREIGHTRATE:FREIGHTUNITCODE:ITEMCODE:ITEMNAME:ITEMSPECIFICA'
||'TIONNAME:ITEMCATEGORYNAME:UOM:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:INSURANCE:LOADINGCHARGES:CUTTINGCHARGES:EXPENSE:BASICRATE:CONVERSIONRATE:FOOTERAMOUNT:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATIONTIME:AGENTNAME:CITYNAME:STATENAME:DESC'
||'RIPTION:REMARK:IRNSTATUS:STATUS:TNO:SNO'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1481442733058410827)
,p_name=>'Sales Lifecycle Control Tower'
,p_static_id=>'command-header'
,p_template=>4501440665235496320
,p_display_sequence=>5
,p_region_css_classes=>'ds-slc-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'  ''<div class="ds-slc-hero">''',
'  || ''<div class="ds-slc-hero-row">''',
'  || ''<span class="ds-slc-hero-icon"><span class="fa fa-truck"></span></span>''',
'  || ''<span class="ds-slc-hero-text">''',
'  || ''<span class="ds-slc-hero-eyebrow">Commercial &middot; Sales Execution</span>''',
'  || ''<span class="ds-slc-hero-title">Sales Lifecycle Control Tower</span>''',
'  || ''<span class="ds-slc-hero-sub">Every sale end to end &mdash; confirmation, order, ''',
'  || ''dispatch, vehicle gate and weighment, invoice and e-invoice &mdash; with the ''',
'  || ''count, value and where each stage is getting stuck.</span>''',
'  || ''</span></div>''',
'  || ''<div class="ds-slc-hero-chips">''',
'  || ''<span class="ds-chip"><span class="fa fa-calendar ds-chip-ic"></span>''',
'     || ''<span class="ds-chip-k">Period</span><b>''',
'     || apex_escape.html(:P721_FROMDATE) || '' &ndash; ''',
'     || apex_escape.html(:P721_TODATE) || ''</b>''',
'     || ''<i class="ds-chip-sub">''',
'     || to_char(to_date(:P721_TODATE,''DD-MM-RRRR'')',
'             - to_date(:P721_FROMDATE,''DD-MM-RRRR'') + 1) || '' days</i></span>''',
'  || ''<span class="ds-chip"><span class="fa fa-building-o ds-chip-ic"></span>''',
'     || ''<span class="ds-chip-k">Company</span><b>''',
'     || apex_escape.html(nvl(GetCompanyName(:P721_COMPANY),''All companies''))',
'     || ''</b></span>''',
'  || ''<span class="ds-chip"><span class="fa fa-map-marker ds-chip-ic"></span>''',
'     || ''<span class="ds-chip-k">Location</span><b>''',
'     || apex_escape.html(nvl(GetLocationName(:P721_LOCATION),''All locations''))',
'     || ''</b></span>''',
'  || ''<span class="ds-chip ds-chip--live"><span class="fa fa-calendar-check-o ds-chip-ic"></span>''',
'     || ''<span class="ds-chip-k">Invoices as of</span><b>''',
'     || apex_escape.html(nvl(to_char(',
'          (Select Max(a.CCInvoiceDate) From SLC_CCInvoice a',
'            Where ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                   Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))),',
'          ''DD-Mon-RRRR''),''no invoices visible''))',
'     || ''</b></span>''',
'  || ''</div></div>'' As HEAD',
'From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1481442903883410827)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1485477113950966185)
,p_plug_name=>'Customer Collections &amp; Balance'
,p_static_id=>'customer-collection-position'
,p_region_name=>'p730CustomerCollections'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>67
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Receipts are a period FLOW; outstanding is the ledger position AS OF',
'   To Date. Keeping both measures at their correct grain prevents a',
'   credit note or journal from being misreported as cash collection. */',
'With Win As (',
'       Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F,',
'              to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual),',
'     Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode=''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode=ParentCode),',
'     Rcpt As (',
'       Select d.AccountCode PartyCode,d.CompanyCode,d.LocationCode,',
'              Round(Sum(d.Amount),2) ReceivedAmount,',
'              Count(Distinct d.Tno) ReceiptCount,',
'              Max(d.VoucherDate) LastReceiptDate',
'         From SLC_VoucherDetail d',
'         Join Voucher v On v.Tno=d.Tno',
'         Cross Join Win w',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode=''RECEIPT''',
'          And d.Amount>0',
'          And d.VoucherDate>=w.F And d.VoucherDate<w.T+1',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or d.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P721_COMPANY Is Null Or d.CompanyCode=:P721_COMPANY)',
'          And (:P721_LOCATION Is Null Or d.LocationCode=:P721_LOCATION)',
'          And (:P721_PANEL Is Null Or d.Panel=:P721_PANEL)',
'        Group By d.AccountCode,d.CompanyCode,d.LocationCode),',
'     Bal As (',
'       Select d.AccountCode PartyCode,d.CompanyCode,d.LocationCode,',
'              Round(Sum(-d.Amount),2) NetOutstanding,',
'              Max(d.VoucherDate) LastLedgerMovement',
'         From SLC_VoucherDetail d Cross Join Win w',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate<w.T+1',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or d.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P721_COMPANY Is Null Or d.CompanyCode=:P721_COMPANY)',
'          And (:P721_LOCATION Is Null Or d.LocationCode=:P721_LOCATION)',
'          And (:P721_PANEL Is Null Or d.Panel=:P721_PANEL)',
'        Group By d.AccountCode,d.CompanyCode,d.LocationCode),',
'     Keys As (',
'       Select PartyCode,CompanyCode,LocationCode From Rcpt',
'       Union',
'       Select PartyCode,CompanyCode,LocationCode From Bal)',
'Select ''<a href="''||apex_page.get_url(p_page=>511,p_clear_cache=>''511'',',
'         p_items=>''P511_PARTY,P511_FROMDATE,P511_TODATE,P511_COMPANY,P511_LOCATION,P511_PANEL'',',
'         p_values=>k.PartyCode||'',''||:P721_FROMDATE||'',''||:P721_TODATE||'',''||',
'                   k.CompanyCode||'',''||k.LocationCode||'',''||:P721_PANEL)||''">''',
'         ||apex_escape.html(GetPartyName(k.PartyCode))||''</a>'' Customer,',
'       k.PartyCode,',
'       GetCompanyName(k.CompanyCode) Company,',
'       GetLocationName(k.LocationCode) Location,',
'       Nvl((Select SAGAR.GetUserPanelAB_apex() From dual),Nvl(:P721_PANEL,''A + B'')) Panel,',
'       Nvl(r.ReceivedAmount,0) ReceivedInPeriod,',
'       Nvl(r.ReceiptCount,0) ReceiptCount,',
'       r.LastReceiptDate,',
'       Greatest(Nvl(b.NetOutstanding,0),0) AmountOutstanding,',
'       Greatest(-Nvl(b.NetOutstanding,0),0) CustomerAdvance,',
'       ''<span class="ds-pill ds-pill--''||',
'         Case When Nvl(b.NetOutstanding,0)>0.005 Then ''bad">Payment Due''',
'              When Nvl(b.NetOutstanding,0)<-0.005 Then ''info">Advance / Credit''',
'              Else ''good">Settled'' End||''</span>'' BalanceStatus,',
'       b.LastLedgerMovement,',
'       ''<a class="ds-link-arrow" href="''||apex_page.get_url(p_page=>511,p_clear_cache=>''511'',',
'         p_items=>''P511_PARTY,P511_FROMDATE,P511_TODATE,P511_COMPANY,P511_LOCATION,P511_PANEL'',',
'         p_values=>k.PartyCode||'',''||:P721_FROMDATE||'',''||:P721_TODATE||'',''||',
'                   k.CompanyCode||'',''||k.LocationCode||'',''||:P721_PANEL)||''">Open Ledger &rsaquo;</a>'' Ledger',
'  From Keys k',
'  Left Join Rcpt r On r.PartyCode=k.PartyCode And r.CompanyCode=k.CompanyCode',
'                  And r.LocationCode=k.LocationCode',
'  Left Join Bal b On b.PartyCode=k.PartyCode And b.CompanyCode=k.CompanyCode',
'                 And b.LocationCode=k.LocationCode',
' Where Nvl(r.ReceivedAmount,0)<>0 Or Abs(Nvl(b.NetOutstanding,0))>0.005',
' Order By Greatest(Nvl(b.NetOutstanding,0),0) Desc,Nvl(r.ReceivedAmount,0) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1485477277580966185)
,p_no_data_found_message=>'No customer receipt or ledger balance exists in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>51018767389668935
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485478116663966186)
,p_db_column_name=>'AMOUNTOUTSTANDING'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>unistr('Amount Outstanding (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485478371524966186)
,p_db_column_name=>'BALANCESTATUS'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Balance Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485477576707966186)
,p_db_column_name=>'COMPANY'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485477386650966186)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485478272484966186)
,p_db_column_name=>'CUSTOMERADVANCE'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>unistr('Customer Advance (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485478414201966186)
,p_db_column_name=>'LASTLEDGERMOVEMENT'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Last Ledger Movement'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485478048264966186)
,p_db_column_name=>'LASTRECEIPTDATE'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Last Receipt'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485478532714966186)
,p_db_column_name=>'LEDGER'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Ledger'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485477708937966186)
,p_db_column_name=>'LOCATION'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485477768997966186)
,p_db_column_name=>'PANEL'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Internal Scope'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485477505740966186)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>15
,p_column_identifier=>'B'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485477914203966186)
,p_db_column_name=>'RECEIPTCOUNT'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Receipts'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485477819346966186)
,p_db_column_name=>'RECEIVEDINPERIOD'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>unistr('Received in Period (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1485486511990048802)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'CUSTOMER:PARTYCODE:COMPANY:LOCATION:RECEIVEDINPERIOD:RECEIPTCOUNT:LASTRECEIPTDATE:AMOUNTOUTSTANDING:CUSTOMERADVANCE:BALANCESTATUS:LASTLEDGERMOVEMENT:LEDGER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1485478651518966186)
,p_plug_name=>'Customer Credit Limit &amp; Exposure'
,p_static_id=>'customer-credit-exposure'
,p_region_name=>'p730CreditExposure'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>68
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Asof As (',
'       Select to_date(:P721_TODATE,''DD-MM-RRRR'') D From dual),',
'     Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode=''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode=ParentCode),',
'     Ex As (',
'       Select d.AccountCode PartyCode, d.CompanyCode, d.LocationCode, d.Panel,',
'              Round(Sum(-d.Amount),2) NetExposure,',
'              Max(d.VoucherDate) LastMovement',
'         From SLC_VoucherDetail d Cross Join Asof x',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And d.VoucherDate<=x.D',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or d.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P721_COMPANY Is Null Or d.CompanyCode=:P721_COMPANY)',
'          And (:P721_LOCATION Is Null Or d.LocationCode=:P721_LOCATION)',
'          And (:P721_PANEL Is Null Or d.Panel=:P721_PANEL)',
'        Group By d.AccountCode,d.CompanyCode,d.LocationCode,d.Panel),',
'     Ap0 As (',
'       Select a.*,',
'              Row_Number() Over (',
'                Partition By a.PartyCode,a.CompanyCode,a.LocationCode,a.Panel',
'                Order By a.CreditLimitApprovalDate Desc,a.TNo Desc) Rn',
'         From SLC_CreditLimitApproval a Cross Join Asof x',
'        Where a.CreditLimitApprovalDate<=x.D',
'          And (a.TillDate Is Null Or a.TillDate>=x.D)',
'          And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'          And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'          And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'          And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)),',
'     Ap As (Select * From Ap0 Where Rn=1),',
'     Lim As (',
'       Select a.PartyCode,a.CompanyCode,a.LocationCode,a.Panel,',
'              p.CreditAmount MasterLimit,a.CreditAmount EffectiveLimit,',
'              ''Credit Limit Approval'' LimitSource,a.CreditLimitApprovalNo ApprovalNo,',
'              a.CreditLimitApprovalDate ApprovalDate,a.TillDate,',
'              a.CreditDays,a.SalesOrderTNo,a.IsGroupOfParty',
'         From Ap a Join Party p On p.PartyCode=a.PartyCode',
'       Union All',
'       Select e.PartyCode,e.CompanyCode,e.LocationCode,e.Panel,',
'              p.CreditAmount,p.CreditAmount,''Account Master'',',
'              Cast(Null As Varchar2(50)),Cast(Null As Date),Cast(Null As Date),',
'              p.CreditDays,Cast(Null As Number),Cast(Null As Varchar2(5))',
'         From Ex e Join Party p On p.PartyCode=e.PartyCode',
'        Where Nvl(p.CreditAmount,0)>0',
'          And Not Exists (',
'                Select 1 From Ap a',
'                 Where a.PartyCode=e.PartyCode',
'                   And a.CompanyCode=e.CompanyCode',
'                   And a.LocationCode=e.LocationCode',
'                   And Nvl(a.Panel,''~'')=Nvl(e.Panel,''~''))),',
'     R As (',
'       Select l.*,Nvl(e.NetExposure,0) NetExposure,e.LastMovement,',
'              so.SalesOrderNo',
'         From Lim l',
'         Left Join Ex e On e.PartyCode=l.PartyCode',
'                       And e.CompanyCode=l.CompanyCode',
'                       And e.LocationCode=l.LocationCode',
'                       And Nvl(e.Panel,''~'')=Nvl(l.Panel,''~'')',
'         Left Join SLC_SalesOrder so On so.TNo=l.SalesOrderTNo)',
'Select ''<a href="''||apex_page.get_url(p_page=>511,p_clear_cache=>''511'',',
'         p_items=>''P511_PARTY'',p_values=>r.PartyCode)||''">''',
'         ||apex_escape.html(GetPartyName(r.PartyCode))||''</a>'' Customer,',
'       r.PartyCode,',
'       GetCompanyName(r.CompanyCode) Company,',
'       GetLocationName(r.LocationCode) Location,',
'       r.Panel,',
'       r.LimitSource,',
'       r.ApprovalNo,',
'       r.ApprovalDate,',
'       r.TillDate ValidTill,',
'       r.SalesOrderNo,',
'       r.CreditDays,',
'       r.MasterLimit,',
'       r.EffectiveLimit,',
'       r.NetExposure,',
'       Case When r.EffectiveLimit>=1e18 Then Null',
'            Else Round(100*Greatest(r.NetExposure,0)/Nullif(r.EffectiveLimit,0),1) End UtilisationPct,',
'       Case When r.EffectiveLimit>=1e18 Then Null',
'            Else Round(r.EffectiveLimit-Greatest(r.NetExposure,0),2) End AvailableOrOver,',
'       ''<span class="ds-pill ds-pill--''||',
'         Case When r.EffectiveLimit>=1e18 Then ''info">Unlimited''',
'              When r.NetExposure<0 Then ''good">Customer in Credit''',
'              When r.NetExposure>r.EffectiveLimit Then ''bad">Over Limit''',
'              When r.NetExposure>=r.EffectiveLimit*.8 Then ''warn">Near Limit''',
'              Else ''good">Within Limit'' End||''</span>'' Status,',
'       r.LastMovement',
'  From R r',
' Order By Case When r.EffectiveLimit<1e18 And r.NetExposure>r.EffectiveLimit Then 1',
'               When r.EffectiveLimit<1e18 And r.NetExposure>=r.EffectiveLimit*.8 Then 2 Else 3 End,',
'          Greatest(r.NetExposure,0)-r.EffectiveLimit Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1485478785969966186)
,p_no_data_found_message=>'No active customer credit limit exists in this scope as at the To Date.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>51020275778668936
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479550495966210)
,p_db_column_name=>'APPROVALDATE'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Approval Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479446173966187)
,p_db_column_name=>'APPROVALNO'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Approval No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485480390211966210)
,p_db_column_name=>'AVAILABLEOROVER'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>unistr('Available / (Over) \20B9')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479055169966187)
,p_db_column_name=>'COMPANY'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479826575966210)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Credit Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485478883360966187)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485480085625966210)
,p_db_column_name=>'EFFECTIVELIMIT'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>unistr('Effective Limit (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485480510238966210)
,p_db_column_name=>'LASTMOVEMENT'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Last Ledger Movement'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479390680966187)
,p_db_column_name=>'LIMITSOURCE'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Limit Source'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479126587966187)
,p_db_column_name=>'LOCATION'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479931145966210)
,p_db_column_name=>'MASTERLIMIT'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>unistr('Master Limit (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485480188766966210)
,p_db_column_name=>'NETEXPOSURE'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>unistr('Net Exposure (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479307456966187)
,p_db_column_name=>'PANEL'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Internal Scope'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485478934112966187)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>15
,p_column_identifier=>'B'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479741469966210)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Sales Order'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485480504735966210)
,p_db_column_name=>'STATUS'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485480309146966210)
,p_db_column_name=>'UTILISATIONPCT'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Utilisation %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485479695244966210)
,p_db_column_name=>'VALIDTILL'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Valid Till'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1485487135686048804)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'CUSTOMER:PARTYCODE:COMPANY:LOCATION:LIMITSOURCE:APPROVALNO:APPROVALDATE:VALIDTILL:SALESORDERNO:CREDITDAYS:MASTERLIMIT:EFFECTIVELIMIT:NETEXPOSURE:UTILISATIONPCT:AVAILABLEOROVER:STATUS:LASTMOVEMENT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1484456653972854960)
,p_name=>'Exception Mix'
,p_static_id=>'exception-mix'
,p_template=>4072358936313175081
,p_display_sequence=>43
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F, to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual),',
'E As (',
'  Select ''Order not dispatched'' LBL, Count(*) VAL',
'    From SLC_SalesOrder so Cross Join Win w',
'   Where so.SalesOrderDate Between w.F And w.T',
'     And Not Exists (Select 1 From SLC_DespatchAdvice x Where x.SalesOrderTNo=so.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or so.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or so.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or so.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or so.Panel=:P721_PANEL)',
'  Union All',
'  Select ''Dispatch not gated'', Count(*)',
'    From SLC_DespatchAdvice da Cross Join Win w',
'   Where da.DespatchAdviceDate Between w.F And w.T',
'     And Not Exists (Select 1 From SLC_MaterialOut x Where x.ReferenceTNo=da.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or da.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or da.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or da.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or da.Panel=:P721_PANEL)',
'  Union All',
'  Select ''Gate-out not invoiced'', Count(*)',
'    From SLC_DespatchAdvice da Cross Join Win w',
'   Where da.DespatchAdviceDate Between w.F And w.T',
'     And Exists (Select 1 From SLC_MaterialOut m Where m.ReferenceTNo=da.TNo And m.GateOutTime Is Not Null)',
'     And Not Exists (Select 1 From SLC_CCInvoice c Where c.DespatchAdviceTNo=da.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or da.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or da.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or da.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or da.Panel=:P721_PANEL)',
'  Union All',
'  Select ''Invoice without IRN'', Count(*)',
'    From SLC_CCInvoice ci Cross Join Win w',
'   Where ci.CCInvoiceDate Between w.F And w.T',
'     And Not Exists (Select 1 From SLC_EInvoice x Where x.CCInvoiceTNo=ci.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
'  Union All',
'  Select ''Stale open gate movement'', Count(*)',
'    From SLC_MaterialOut mo',
'   Where mo.GateInTime <= sysdate-2 And mo.GateInTime > sysdate-400 And mo.GateOutTime Is Null',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)',
'  Union All',
'  Select ''Awaiting final weighment'', Count(*)',
'    From SLC_Weighment w2',
'   Where w2.WeighmentDate > sysdate-30 And w2.SecondWeight Is Null',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or w2.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or w2.CompanyCode=:P721_COMPANY) And (:P721_PANEL Is Null Or w2.Panel=:P721_PANEL)),',
'ds_chart_ordered As (',
'  Select LBL, VAL From E Where VAL > 0 Order By VAL Desc',
'),',
'ds_chart_q As (',
'  Select ordered_q.*, rownum ds_ord',
'    From ds_chart_ordered ordered_q',
')',
'Select',
'  ''<div class="ds-fast-chart" data-chart-type="donut" aria-label="Exception Mix"><script type="application/json" class="ds-fast-chart-data">'' ||',
'  replace(',
'    json_object(',
'      ''unit'' value '''',',
'      ''series'' value json_array(''Exception records'' returning clob) format json,',
'      ''rows'' value json_arrayagg(',
'        json_object(''l'' value to_char(q.LBL),',
'                    ''values'' value json_array(q.VAL returning clob) format json,',
'                    ''u'' value null',
'                    returning clob)',
'        order by q.ds_ord returning clob) format json',
'      returning clob),',
'    ''<'', ''\\u003c''',
'  ) || ''</script></div>'' As CHART_ROW',
'From ds_chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1484456829069854960)
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
 p_id=>wwv_flow_imp.id(1485742029510329891)
,p_name=>'Exception Summary by Condition'
,p_static_id=>'exception-summary'
,p_template=>4072358936313175081
,p_display_sequence=>72
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F,to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual),',
'R As (',
'  Select 1 Seq,''Critical'' Severity,''Order not dispatched'' RuleName,',
'         Count(*) Items,Nvl(Sum((Select Nvl(Sum(d.Amount),0) From SalesOrderDetail d Where d.TNo=so.TNo)),0) ValueAtStake,',
'         ''Schedule dispatch and confirm vehicle readiness'' NextAction',
'    From SLC_SalesOrder so Cross Join Win w',
'   Where so.SalesOrderDate Between w.F And w.T And Not Exists (Select 1 From SLC_DespatchAdvice x Where x.SalesOrderTNo=so.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or so.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or so.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or so.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or so.Panel=:P721_PANEL)',
'  Union All',
'  Select 2,''Critical'',''Dispatch not gated'',Count(*),0,''Create or reconcile the vehicle gate entry''',
'    From SLC_DespatchAdvice da Cross Join Win w',
'   Where da.DespatchAdviceDate Between w.F And w.T And Not Exists (Select 1 From SLC_MaterialOut x Where x.ReferenceTNo=da.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or da.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or da.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or da.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or da.Panel=:P721_PANEL)',
'  Union All',
'  Select 3,''Critical'',''Gate-out not invoiced'',Count(*),0,''Create or reconcile the commercial invoice''',
'    From SLC_DespatchAdvice da Cross Join Win w',
'   Where da.DespatchAdviceDate Between w.F And w.T',
'     And Exists (Select 1 From SLC_MaterialOut m Where m.ReferenceTNo=da.TNo And m.GateOutTime Is Not Null)',
'     And Not Exists (Select 1 From SLC_CCInvoice c Where c.DespatchAdviceTNo=da.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or da.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or da.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or da.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or da.Panel=:P721_PANEL)',
'  Union All',
'  Select 4,''High'',''Invoice without IRN'',Count(*),Nvl(Sum(ci.CCInvoiceAmount),0),''Generate or retry the e-invoice IRN''',
'    From SLC_CCInvoice ci Cross Join Win w',
'   Where ci.CCInvoiceDate Between w.F And w.T And Not Exists (Select 1 From SLC_EInvoice x Where x.CCInvoiceTNo=ci.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
'  Union All',
'  Select 5,''Critical'',''Stale open gate movement'',Count(*),0,''Complete gate-out or correct the open movement''',
'    From SLC_MaterialOut mo',
'   Where mo.GateInTime<=sysdate-2 And mo.GateInTime>sysdate-400 And mo.GateOutTime Is Null',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)',
'  Union All',
'  Select 6,''High'',''Awaiting final weighment'',Count(*),0,''Capture the second weight and close weighment''',
'    From SLC_Weighment w2',
'   Where w2.WeighmentDate>sysdate-30 And w2.SecondWeight Is Null',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or w2.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or w2.CompanyCode=:P721_COMPANY) And (:P721_PANEL Is Null Or w2.Panel=:P721_PANEL))',
'Select ''<span class="ds-pill ds-pill--''||Case Severity When ''Critical'' Then ''bad'' Else ''warn'' End||''">''||Severity||''</span>'' Severity,',
'       RuleName Condition,',
'       ''<a href="javascript:void(0);" class="ds-exception-count" data-exc="''||apex_escape.html_attribute(RuleName)||''">''',
'         ||to_char(Items,''FM999G999G990'')||''</a>'' Records,',
'       ValueAtStake,NextAction',
'  From R Where Items>0 Order By Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No exception condition is active in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1485742247315329892)
,p_query_column_id=>2
,p_column_alias=>'CONDITION'
,p_column_display_sequence=>20
,p_column_heading=>'Condition'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1485742528725329892)
,p_query_column_id=>5
,p_column_alias=>'NEXTACTION'
,p_column_display_sequence=>50
,p_column_heading=>'Required Action'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1485742400602329892)
,p_query_column_id=>3
,p_column_alias=>'RECORDS'
,p_column_display_sequence=>30
,p_column_heading=>'Records'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1485742150261329892)
,p_query_column_id=>1
,p_column_alias=>'SEVERITY'
,p_column_display_sequence=>10
,p_column_heading=>'Severity'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1485742486424329892)
,p_query_column_id=>4
,p_column_alias=>'VALUEATSTAKE'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Value at Stake (\20B9)')
,p_column_format=>'FM999G99G99G99G990D00'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482189208169676337)
,p_plug_name=>'Documents Behind the Selected Exception'
,p_static_id=>'exceptions'
,p_region_name=>'p730Exceptions'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>73
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F, to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual),',
'E As (',
'  Select Case When trunc(sysdate-so.SalesOrderDate)>15 Then 1 When trunc(sysdate-so.SalesOrderDate)>7 Then 2 Else 3 End SEV_ORD,',
'         ''Order not dispatched'' EXC_TYPE, ''Sales Order'' STAGE, ''<a href="''||apex_page.get_url(p_page=>723,p_clear_cache=>''723'',p_items=>''P723_TNO'',p_values=>so.TNo)||''">''||apex_escape.html(so.SalesOrderNo)||''</a>'' DOC_NO,',
'         GetPartyName(so.PartyCode) CUSTOMER, so.VehicleNo VEHICLE,',
'         (Select Nvl(Sum(d.Amount),0) From SalesOrderDetail d Where d.TNo=so.TNo) AMOUNT,',
'         trunc(sysdate-so.SalesOrderDate) AGE_DAYS,',
'         ''Schedule dispatch and confirm vehicle readiness'' NEXT_ACTION',
'    From SLC_SalesOrder so Cross Join Win w',
'   Where so.SalesOrderDate Between w.F And w.T And Not Exists (Select 1 From SLC_DespatchAdvice x Where x.SalesOrderTNo=so.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or so.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or so.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or so.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or so.Panel=:P721_PANEL)',
'  Union All',
'  Select Case When trunc(sysdate-da.DespatchAdviceDate)>10 Then 1 Else 2 End,',
'         ''Dispatch not gated'', ''Dispatch Advice'', ''<a href="''||apex_page.get_url(p_page=>161,p_clear_cache=>''161'',p_items=>''P161_TNO'',p_values=>da.TNo)||''">''||apex_escape.html(da.DespatchAdviceNo)||''</a>'',',
'         GetPartyName(da.PartyCode), da.VehicleNo, Null, trunc(sysdate-da.DespatchAdviceDate),',
'         ''Create or reconcile the vehicle gate entry''',
'    From SLC_DespatchAdvice da Cross Join Win w',
'   Where da.DespatchAdviceDate Between w.F And w.T And Not Exists (Select 1 From SLC_MaterialOut x Where x.ReferenceTNo=da.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or da.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or da.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or da.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or da.Panel=:P721_PANEL)',
'  Union All',
'  Select 1, ''Gate-out not invoiced'', ''Gate Out'', ''<a href="''||apex_page.get_url(p_page=>161,p_clear_cache=>''161'',p_items=>''P161_TNO'',p_values=>da.TNo)||''">''||apex_escape.html(da.DespatchAdviceNo)||''</a>'',',
'         GetPartyName(da.PartyCode), da.VehicleNo, Null, trunc(sysdate-da.DespatchAdviceDate),',
'         ''Create or reconcile the commercial invoice''',
'    From SLC_DespatchAdvice da Cross Join Win w',
'   Where da.DespatchAdviceDate Between w.F And w.T',
'     And Exists (Select 1 From SLC_MaterialOut m Where m.ReferenceTNo=da.TNo And m.GateOutTime Is Not Null)',
'     And Not Exists (Select 1 From SLC_CCInvoice c Where c.DespatchAdviceTNo=da.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or da.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or da.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or da.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or da.Panel=:P721_PANEL)',
'  Union All',
'  Select Case When trunc(sysdate-ci.CCInvoiceDate)>3 Then 2 Else 3 End,',
'         ''Invoice without IRN'', ''Invoice'', ''<a href="''||apex_page.get_url(p_page=>175,p_clear_cache=>''175'',p_items=>''P175_TNO,P175_FORMSTATUS'',p_values=>ci.TNo||'',EDITRECORD'')||''">''||apex_escape.html(ci.CCInvoiceNo)||''</a>'',',
'         GetPartyName(ci.PartyCode), ci.VehicleNo, ci.CCInvoiceAmount, trunc(sysdate-ci.CCInvoiceDate),',
'         ''Generate or retry the e-invoice IRN''',
'    From SLC_CCInvoice ci Cross Join Win w',
'   Where ci.CCInvoiceDate Between w.F And w.T And Not Exists (Select 1 From SLC_EInvoice x Where x.CCInvoiceTNo=ci.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
'  Union All',
'  Select 1, ''Stale open gate movement'', ''Gate Out'', ''<a href="''||apex_page.get_url(p_page=>168,p_clear_cache=>''168'',p_items=>''P168_TNO,P168_FORMSTATUS'',p_values=>mo.TNo||'',EDITRECORD'')||''">''||apex_escape.html(mo.MaterialOutNo)||''</a>'',',
'         GetPartyName(mo.PartyCode), mo.VehicleNo, Null, trunc(sysdate-mo.GateInTime),',
'         ''Complete gate-out or correct the open movement''',
'    From SLC_MaterialOut mo',
'   Where mo.GateInTime <= sysdate-2 And mo.GateInTime > sysdate-400 And mo.GateOutTime Is Null',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)',
'  Union All',
'  Select Case When trunc(sysdate-w2.WeighmentDate)>1 Then 2 Else 4 End,',
'         ''Awaiting final weighment'', ''Weighment'', ''<a href="''||apex_page.get_url(p_page=>133,p_clear_cache=>''133'',p_items=>''P133_TNO'',p_values=>w2.TNo)||''">''||apex_escape.html(w2.WeighmentNo)||''</a>'',',
'         GetPartyName(w2.PartyCode), w2.VehicleNo, Null, trunc(sysdate-w2.WeighmentDate),',
'         ''Capture the second weight and close weighment''',
'    From SLC_Weighment w2',
'   Where w2.WeighmentDate > sysdate-30 And w2.SecondWeight Is Null',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or w2.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or w2.CompanyCode=:P721_COMPANY) And (:P721_PANEL Is Null Or w2.Panel=:P721_PANEL))',
'Select',
'  ''<span class="ds-pill ds-pill--''||Decode(e.SEV_ORD,1,''bad'',2,''warn'',3,''info'',''muted'')||''">''',
'    ||Decode(e.SEV_ORD,1,''Critical'',2,''High'',3,''Medium'',''Low'')||''</span>'' SEVERITY,',
'  e.EXC_TYPE, e.STAGE, e.DOC_NO, e.CUSTOMER, e.VEHICLE, e.NEXT_ACTION, e.AMOUNT, e.AGE_DAYS',
'From E e',
'Where :P721_EXCEPTION_FOCUS Is Not Null And e.EXC_TYPE=:P721_EXCEPTION_FOCUS',
'Order By e.SEV_ORD, e.AGE_DAYS Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1482189250825676337)
,p_no_data_found_message=>'Click a condition count or donut slice to list its documents.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47730740634379087
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482190079416676337)
,p_db_column_name=>'AGE_DAYS'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Age (days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482189930442676337)
,p_db_column_name=>'AMOUNT'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482189756313676337)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482189693414676337)
,p_db_column_name=>'DOC_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Document'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482189509129676337)
,p_db_column_name=>'EXC_TYPE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Exception'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1484457192458855008)
,p_db_column_name=>'NEXT_ACTION'
,p_display_order=>65
,p_column_identifier=>'G'
,p_column_label=>'Next Action'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482189332343676337)
,p_db_column_name=>'SEVERITY'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Severity'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482189573660676337)
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
 p_id=>wwv_flow_imp.id(1482189832864676337)
,p_db_column_name=>'VEHICLE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Vehicle'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1482194341622748653)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'SEVERITY:EXC_TYPE:STAGE:DOC_NO:CUSTOMER:VEHICLE:NEXT_ACTION:AMOUNT:AGE_DAYS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481442948391410827)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p730Filters'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1483699904160088084)
,p_name=>'Fulfilment Health'
,p_static_id=>'fulfilment-health'
,p_region_name=>'p730FulfilmentHealth'
,p_template=>4501440665235496320
,p_display_sequence=>22
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F,',
'         to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual),',
'K As (',
'  Select',
'    (Select Count(*) From SLC_SalesConfirm sc Cross Join Win w',
'      Where sc.SalesConfirmDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'        And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)) ConfTotal,',
'    (Select Count(*) From SLC_SalesConfirm sc Cross Join Win w',
'      Where sc.SalesConfirmDate Between w.F And w.T',
'        And Exists (Select 1 From SLC_SalesOrder so Where so.SalesConfirmTNo=sc.TNo)',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'        And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)) ConfConverted,',
'    (Select Median(so.SalesOrderDate-sc.SalesConfirmDate)',
'       From SLC_SalesConfirm sc Join SLC_SalesOrder so On so.SalesConfirmTNo=sc.TNo Cross Join Win w',
'      Where sc.SalesConfirmDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'        And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)) MedianConvDays,',
'    (Select Sum(Greatest(Nvl(d.Quantity1,0)-Nvl(d.CCInvoiceQuantity1,0),0))',
'       From SLC_SalesOrder so Join SalesOrderDetail d On d.TNo=so.TNo Cross Join Win w',
'      Where so.SalesOrderDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or so.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or so.CompanyCode=:P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or so.LocationCode=:P721_LOCATION)',
'        And (:P721_PANEL Is Null Or so.Panel=:P721_PANEL)) OpenQty,',
'    (Select Sum(Case When Nvl(d.Quantity1,0)>0 Then d.Amount*Greatest(Nvl(d.Quantity1,0)-Nvl(d.CCInvoiceQuantity1,0),0)/d.Quantity1 Else 0 End)',
'       From SLC_SalesOrder so Join SalesOrderDetail d On d.TNo=so.TNo Cross Join Win w',
'      Where so.SalesOrderDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or so.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or so.CompanyCode=:P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or so.LocationCode=:P721_LOCATION)',
'        And (:P721_PANEL Is Null Or so.Panel=:P721_PANEL)) OpenVal,',
'    (Select Count(*) From SLC_SalesOrder so Cross Join Win w',
'      Where so.SalesOrderDate Between w.F And w.T And trunc(sysdate-so.SalesOrderDate)>7',
'        And Not Exists (Select 1 From SLC_DespatchAdvice da Where da.SalesOrderTNo=so.TNo)',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or so.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or so.CompanyCode=:P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or so.LocationCode=:P721_LOCATION)',
'        And (:P721_PANEL Is Null Or so.Panel=:P721_PANEL))',
'    + (Select Count(*) From SLC_DespatchAdvice da Cross Join Win w',
'      Where da.DespatchAdviceDate Between w.F And w.T And trunc(sysdate-da.DespatchAdviceDate)>2',
'        And Not Exists (Select 1 From SLC_MaterialOut mo Where mo.ReferenceTNo=da.TNo)',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or da.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or da.CompanyCode=:P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or da.LocationCode=:P721_LOCATION)',
'        And (:P721_PANEL Is Null Or da.Panel=:P721_PANEL)) CriticalBacklog,',
'    (Select Count(*) From SLC_SCBalance b Join SLC_SalesConfirm sc On sc.TNo=b.TNo Cross Join Win w',
'      Where b.BalanceQty>0 And sc.SalesConfirmDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'        And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)) ScBalanceCnt',
'  From dual)',
'Select Case x.Seq',
'  When 1 Then q''~<a class="ds-kpi ds-kpi--ok ds-kpi--clickable" href="#p730ScRegister" data-kpi-goto="p730ScRegister"><span class="ds-kpi-ic"><span class="fa fa-exchange"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">Confirmation Con'
||'version</span><span class="ds-kpi-n">~''||to_char(Round(100*K.ConfConverted/Nullif(K.ConfTotal,0),1),''FM990D0'')||q''~%</span><span class="ds-kpi-sub">Quotations linked to an order</span></span></a>~''',
'  When 2 Then q''~<a class="ds-kpi ds-kpi--bill ds-kpi--clickable" href="#p730ScRegister" data-kpi-goto="p730ScRegister"><span class="ds-kpi-ic"><span class="fa fa-clock-o"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">Median Confirm '
||'&rarr; Order</span><span class="ds-kpi-n">~''||to_char(Nvl(K.MedianConvDays,0),''FM990D0'')||q''~ d</span><span class="ds-kpi-sub">Speed from commitment to order</span></span></a>~''',
'  When 3 Then q''~<a class="ds-kpi ds-kpi--value ds-kpi--clickable" href="#p730Exceptions" data-kpi-goto="p730Exceptions"><span class="ds-kpi-ic"><span class="fa fa-cubes"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">Open Order Quant'
||'ity</span><span class="ds-kpi-n">~''||to_char(Nvl(K.OpenQty,0),''FM999G999G990'')||q''~</span><span class="ds-kpi-sub">Estimated open value &#8377; ~''||to_char(Nvl(K.OpenVal,0)/1e7,''FM999G990D00'')||q''~ Cr</span></span></a>~''',
'  When 4 Then q''~<a class="ds-kpi ds-kpi--risk ds-kpi--clickable" href="#p730Exceptions" data-kpi-goto="p730Exceptions"><span class="ds-kpi-ic"><span class="fa fa-exclamation-triangle"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">Cr'
||'itical Stage Backlog</span><span class="ds-kpi-n">~''||to_char(Nvl(K.CriticalBacklog,0),''FM999G990'')||q''~</span><span class="ds-kpi-sub">Order &gt;7d or dispatch &gt;2d without next step</span></span></a>~''',
'  Else q''~<a class="ds-kpi ds-kpi--value ds-kpi--clickable" href="#p730ScBalanceRegister" data-kpi-goto="p730ScBalanceRegister"><span class="ds-kpi-ic"><span class="fa fa-balance-scale"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">S'
||'C Balance</span><span class="ds-kpi-n">~''||to_char(Nvl(K.ScBalanceCnt,0),''FM999G990'')||q''~</span><span class="ds-kpi-sub">Open confirmations carrying balance</span></span></a>~''',
'End As CARD',
'From K, (Select Level Seq From dual Connect By Level<=5) x',
'Order By x.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No fulfilment health data in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1483699971045088084)
,p_query_column_id=>1
,p_column_alias=>'CARD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1486533341403381122)
,p_plug_name=>'Vehicles Inside &mdash; Gate In Register'
,p_static_id=>'gate-in-follow-up'
,p_region_name=>'p730GateInRegister'
,p_region_css_classes=>'ds-register ds-slc-kpireg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>31
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Scope As (',
'  Select mo.*',
'    From SLC_MaterialOut mo',
'   Where :P721_REGISTER_FOCUS = ''GATE_IN''',
'     And mo.GateInTime Is Not Null',
'     And mo.GateOutTime Is Null',
'     And mo.GateInTime>sysdate-2',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY)',
'     And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION)',
'     And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)),',
'WeightAgg As (',
'  Select w.ReferenceTNo,',
'         Max(w.WeighmentNo) Keep (Dense_Rank Last Order By w.WeighmentDate,w.TNo) WeighmentNo,',
'         Max(w.FirstWeight) Keep (Dense_Rank Last Order By w.WeighmentDate,w.TNo) FirstWeight,',
'         Max(w.SecondWeight) Keep (Dense_Rank Last Order By w.WeighmentDate,w.TNo) SecondWeight,',
'         Max(Nvl(w.NetWeight,Abs(w.SecondWeight-w.FirstWeight))) Keep (Dense_Rank Last Order By w.WeighmentDate,w.TNo) NetWeight',
'    From SLC_Weighment w Join Scope s On s.ReferenceTNo=w.ReferenceTNo',
'   Group By w.ReferenceTNo)',
'Select Case When s.VehicleNo Is Not Null Then',
'         ''<a href="''||apex_page.get_url(p_page=>724,p_clear_cache=>''724'',p_items=>''P724_VEHICLE'',p_values=>s.VehicleNo)||''">''||',
'         apex_escape.html(s.VehicleNo)||''</a>'' Else ''-'' End Vehicle,',
'       s.MaterialOutNo,s.MaterialOutDate,s.GateInTime,',
'       Round((sysdate-s.GateInTime)*24,1) Dwell_Hrs,',
'       da.DespatchAdviceNo DispatchAdvice,da.DespatchAdviceDate DispatchDate,',
'       so.SalesOrderNo SALESORDER,so.SalesOrderDate SalesDate,',
'       GetPartyName(Nvl(s.PartyCode,da.PartyCode)) Customer,',
'       GetPartyName(s.TransporterCode) Transporter,',
'       s.DriverName,s.DriverMobileNo,s.DLNo,s.DLValidity,s.PUCValidity,',
'       w.WeighmentNo,w.FirstWeight,w.SecondWeight,w.NetWeight,s.Remark,s.TNo',
'  From Scope s',
'  Left Join SLC_DespatchAdvice da On da.TNo=s.ReferenceTNo',
'  Left Join SLC_SalesOrder so On so.TNo=da.SalesOrderTNo',
'  Left Join WeightAgg w On w.ReferenceTNo=s.ReferenceTNo',
' Order By s.GateInTime Desc,s.MaterialOutNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1486533425535381122)
,p_no_data_found_message=>'No vehicles are currently inside for this company and location.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>52074915344083872
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534469217381143)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534065257381123)
,p_db_column_name=>'DISPATCHADVICE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dispatch Advice'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534192998381123)
,p_db_column_name=>'DISPATCHDATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Dispatch Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534827379381143)
,p_db_column_name=>'DLNO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'DL No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534944715381143)
,p_db_column_name=>'DLVALIDITY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'DL Validity'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534788304381143)
,p_db_column_name=>'DRIVERMOBILENO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Driver Mobile'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534611358381143)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Driver'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486533922930381123)
,p_db_column_name=>'DWELL_HRS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Gate Dwell (h)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486535215005381143)
,p_db_column_name=>'FIRSTWEIGHT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'First Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486533837850381123)
,p_db_column_name=>'GATEINTIME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Gate In'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486533797394381123)
,p_db_column_name=>'MATERIALOUTDATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Gate Pass Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486533707609381123)
,p_db_column_name=>'MATERIALOUTNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Gate Pass No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486535421876381143)
,p_db_column_name=>'NETWEIGHT'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Net Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486535055514381143)
,p_db_column_name=>'PUCVALIDITY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'PUC Validity'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486535589210381143)
,p_db_column_name=>'REMARK'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534366506381143)
,p_db_column_name=>'SALESDATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Sales Order Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534238667381123)
,p_db_column_name=>'SALESORDER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Sales Order'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486535351418381143)
,p_db_column_name=>'SECONDWEIGHT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Second Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486535634050381143)
,p_db_column_name=>'TNO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Transaction No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486534595592381143)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Transporter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486533604873381123)
,p_db_column_name=>'VEHICLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vehicle'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486535171575381143)
,p_db_column_name=>'WEIGHMENTNO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'SLC_Weighment No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1486550368493385227)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'VEHICLE:MATERIALOUTNO:MATERIALOUTDATE:GATEINTIME:DWELL_HRS:DISPATCHADVICE:DISPATCHDATE:SALESORDER:SALESDATE:CUSTOMER:TRANSPORTER:DRIVERNAME:DRIVERMOBILENO:DLNO:DLVALIDITY:PUCVALIDITY:WEIGHMENTNO:FIRSTWEIGHT:SECONDWEIGHT:NETWEIGHT:REMARK:TNO'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1484456974026854960)
,p_name=>'Handoff Pressure'
,p_static_id=>'handoff-pressure'
,p_template=>4072358936313175081
,p_display_sequence=>43
,p_region_css_classes=>'ds-dash-panel ds-lollipop ds-slc-lollipop'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F, to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual),',
'B As (',
'  Select 1 Seq, 10 FromK, ''Quotation to order'' LBL, Count(*) CNT, Round(Max(sysdate-a.SalesConfirmDate)) MAX_AGE',
'    From SLC_SalesConfirm a Cross Join Win w',
'   Where a.SalesConfirmDate Between w.F And w.T And Not Exists (Select 1 From SLC_SalesOrder x Where x.SalesConfirmTNo=a.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)',
'  Union All',
'  Select 2, 20, ''Order to dispatch'', Count(*), Round(Max(sysdate-a.SalesOrderDate))',
'    From SLC_SalesOrder a Cross Join Win w',
'   Where a.SalesOrderDate Between w.F And w.T And Not Exists (Select 1 From SLC_DespatchAdvice x Where x.SalesOrderTNo=a.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)',
'  Union All',
'  Select 3, 30, ''Dispatch to gate'', Count(*), Round(Max(sysdate-a.DespatchAdviceDate))',
'    From SLC_DespatchAdvice a Cross Join Win w',
'   Where a.DespatchAdviceDate Between w.F And w.T And Not Exists (Select 1 From SLC_MaterialOut x Where x.ReferenceTNo=a.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)',
'  Union All',
'  Select 4, 30, ''Gate-out to invoice'', Count(*), Round(Max(sysdate-a.DespatchAdviceDate))',
'    From SLC_DespatchAdvice a Cross Join Win w',
'   Where a.DespatchAdviceDate Between w.F And w.T',
'     And Exists (Select 1 From SLC_MaterialOut m Where m.ReferenceTNo=a.TNo And m.GateOutTime Is Not Null)',
'     And Not Exists (Select 1 From SLC_CCInvoice c Where c.DespatchAdviceTNo=a.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)',
'  Union All',
'  Select 5, 60, ''Invoice to IRN'', Count(*), Round(Max(sysdate-a.CCInvoiceDate))',
'    From SLC_CCInvoice a Cross Join Win w',
'   Where a.CCInvoiceDate Between w.F And w.T And Not Exists (Select 1 From SLC_EInvoice x Where x.CCInvoiceTNo=a.TNo)',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)),',
'M As (Select Max(CNT) MX From B)',
'Select ''<a href="javascript:void(0);" class="ds-lolli ds-slc-drill ds-lolli--''',
'    ||Case When Nvl(B.MAX_AGE,0)>30 Then ''hi'' When Nvl(B.MAX_AGE,0)>7 Then ''mid'' Else ''lo'' End||''" data-k="H''||B.Seq||''">''',
'    ||''<span class="ds-lolli-label" title="''||apex_escape.html_attribute(B.LBL)||''">''||apex_escape.html(B.LBL)||''</span>''',
'    ||''<span class="ds-lolli-track"><span class="ds-lolli-line" style="width:''',
'    ||Case When B.CNT=0 Then ''0'' Else to_char(greatest(round(B.CNT/nullif(M.MX,0)*100),3)) End||''%"></span><span class="ds-lolli-dot"></span></span>''',
'    ||''<span class="ds-lolli-val">''||to_char(B.CNT,''FM999G990'')||'' docs &middot; max ''||to_char(Nvl(B.MAX_AGE,0),''FM990'')||''d</span></a>'' ROW_HTML',
'  From B Cross Join M Order By B.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No handoff backlog in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1484457041168854960)
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
 p_id=>wwv_flow_imp.id(1481443233338410828)
,p_name=>'Executive KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4501440665235496320
,p_display_sequence=>21
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--6up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F,',
'         to_date(:P721_TODATE,''DD-MM-RRRR'')   T From dual),',
'K As (',
'  Select',
'    (Select Count(*) From SLC_SalesConfirm a Cross Join Win w',
'      Where a.SalesConfirmDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) ConfCnt,',
'    (Select Nvl(Sum(d.Amount),0) From SLC_SalesConfirm a Join SLC_SalesConfirmDetail d On d.TNo=a.TNo Cross Join Win w',
'      Where a.SalesConfirmDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) ConfVal,',
'    (Select Count(*) From SLC_SalesOrder a Cross Join Win w',
'      Where a.SalesOrderDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) SoCnt,',
'    (Select Nvl(Sum(d.Amount),0) From SLC_SalesOrder a Join SalesOrderDetail d On d.TNo=a.TNo Cross Join Win w',
'      Where a.SalesOrderDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) SoVal,',
'    (Select Nvl(Sum(d.Amount),0) From SLC_SalesOrder a Join SalesOrderDetail d On d.TNo=a.TNo Cross Join Win w',
'      Where a.SalesOrderDate Between w.F And w.T',
'        And Not Exists (Select 1 From SLC_DespatchAdvice x Where x.SalesOrderTNo=a.TNo)',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) PendSoVal,',
'    (Select Count(*) From SLC_DespatchAdvice a Cross Join Win w',
'      Where a.DespatchAdviceDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) DaCnt,',
'    (Select Count(*) From SLC_MaterialOut a Cross Join Win w',
'      Where a.GateInTime Is Not Null And a.GateOutTime Is Null And a.GateInTime > sysdate-2',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) VehInside,',
'    (Select Nvl(Sum(d.Amount),0) From SLC_CCInvoice a Join SLC_CCInvoiceDetail d On d.TNo=a.TNo Cross Join Win w',
'      Where a.CCInvoiceDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) InvVal,',
'    (Select Count(*) From SLC_CCInvoice a Cross Join Win w',
'      Where a.CCInvoiceDate Between w.F And w.T',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) InvCnt,',
'    (Select Count(*) From SLC_CCInvoice a Cross Join Win w',
'      Where a.CCInvoiceDate Between w.F And w.T',
'        And Exists (Select 1 From SLC_EInvoice e Where e.CCInvoiceTNo=a.TNo And e.IRN Is Not Null)',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'        And (:P721_LOCATION Is Null Or a.LocationCode = :P721_LOCATION)',
'        And (:P721_PANEL Is Null Or a.Panel = :P721_PANEL)) EinvCnt',
'  From dual)',
'Select Case x.Seq',
'      When 1 Then q''~<a class="ds-kpi ds-slc-register-drill ds-kpi--value" data-focus="SC" data-reg="p730ScRegister" style="order:1" href="javascript:void(0);"><span class="ds-kpi-ic"><span class="fa fa-handshake-o"></span></span><span class="ds-kpi-'
||'body"><span class="ds-kpi-t">Sales Quotations</span><span class="ds-kpi-n">~''||to_char(K.ConfCnt,''FM999G999G990'')||q''~</span><span class="ds-kpi-sub">Quoted value &#8377; ~''||to_char(Round(K.ConfVal/1e7,2),''FM999G990D00'')||q''~ Cr</span></span></a>~''',
'      When 2 Then q''~<a class="ds-kpi ds-slc-register-drill ds-kpi--bill" data-focus="SO" data-reg="p730SoRegister" style="order:2" href="javascript:void(0);"><span class="ds-kpi-ic"><span class="fa fa-file-text-o"></span></span><span class="ds-kpi-b'
||'ody"><span class="ds-kpi-t">Sales Orders</span><span class="ds-kpi-n">~''||to_char(K.SoCnt,''FM999G999G990'')||q''~</span><span class="ds-kpi-sub">Order value &#8377; ~''||to_char(Round(K.SoVal/1e7,2),''FM999G990D00'')||q''~ Cr</span></span></a>~''',
'      When 3 Then q''~<a class="ds-kpi ds-slc-register-drill ds-kpi--risk" data-focus="SO_PENDING" data-reg="p730SoRegister" style="order:5" href="javascript:void(0);"><span class="ds-kpi-ic"><span class="fa fa-hourglass-half"></span></span><span clas'
||'s="ds-kpi-body"><span class="ds-kpi-t">Pending Order Value</span><span class="ds-kpi-n">&#8377; ~''||to_char(Round(K.PendSoVal/1e7,2),''FM999G990D00'')||q''~ Cr</span><span class="ds-kpi-sub">Orders not yet dispatched</span></span></a>~''',
'      When 4 Then q''~<a class="ds-kpi ds-slc-register-drill ds-kpi--input" data-focus="GATE_IN" data-reg="p730GateInRegister" style="order:3" href="javascript:void(0);"><span class="ds-kpi-ic"><span class="fa fa-truck"></span></span><span class="ds-k'
||'pi-body"><span class="ds-kpi-t">Vehicles Inside</span><span class="ds-kpi-n">~''||to_char(K.VehInside,''FM999G990'')||q''~</span><span class="ds-kpi-sub">Gated in, not yet gated out &#183; ~''||to_char(K.DaCnt,''FM999G990'')||q''~ dispatch advices</span></sp'
||'an></a>~''',
'      When 5 Then q''~<a class="ds-kpi ds-slc-register-drill ds-kpi--ok" data-focus="INV" data-reg="p730InvoiceRegister" style="order:4" href="javascript:void(0);"><span class="ds-kpi-ic"><span class="fa fa-inr"></span></span><span class="ds-kpi-body"'
||'><span class="ds-kpi-t">Invoiced Value</span><span class="ds-kpi-n">&#8377; ~''||to_char(Round(K.InvVal/1e7,2),''FM999G990D00'')||q''~ Cr</span><span class="ds-kpi-sub">~''||to_char(K.InvCnt,''FM999G990'')||q''~ invoices</span></span></a>~''',
'      Else q''~<a class="ds-kpi ds-slc-register-drill ds-kpi--suppl" data-focus="INV_NO_IRN" data-reg="p730InvoiceRegister" style="order:6" href="javascript:void(0);"><span class="ds-kpi-ic"><span class="fa fa-qrcode"></span></span><span class="ds-kpi'
||'-body"><span class="ds-kpi-t">E-Invoice Coverage</span><span class="ds-kpi-n">~''||to_char(Round(100*K.EinvCnt/Nullif(K.InvCnt,0),1),''FM990D0'')||q''~%</span><span class="ds-kpi-sub">~''||to_char(K.InvCnt-K.EinvCnt,''FM999G990'')||q''~ invoices without IRN<'
||'/span></span></a>~''',
'    End As CARD',
'From K, (Select Level Seq From dual Connect By Level <= 6) x',
'Order By x.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No lifecycle activity in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1481443382421410828)
,p_query_column_id=>1
,p_column_alias=>'CARD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1481443558338410828)
,p_name=>'Sales Lifecycle Register Flow'
,p_static_id=>'lifecycle-funnel'
,p_region_name=>'p730LifecycleFlow'
,p_template=>4072358936313175081
,p_display_sequence=>24
,p_region_css_classes=>'ds-dash-panel ds-slc-flow--register'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F,',
'         to_date(:P721_TODATE,''DD-MM-RRRR'')   T From dual),',
'U As (',
'  Select',
'    apex_page.get_url(p_page=>704,p_clear_cache=>''704,RIR'',',
'      p_items=>''P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION'',',
'      p_values=>:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION) ScUrl,',
'    apex_page.get_url(p_page=>170,p_clear_cache=>''170,RIR'',',
'      p_items=>''P170_FROMDATE,P170_TODATE,P170_COMPANY,P170_LOCATION'',',
'      p_values=>:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION) SoUrl,',
'    apex_page.get_url(p_page=>160,p_clear_cache=>''160,RIR'',',
'      p_items=>''P160_FROMDATE,P160_TODATE,P160_COMPANY,P160_LOCATION'',',
'      p_values=>:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION) DaUrl,',
'    apex_page.get_url(p_page=>167,p_clear_cache=>''167,RIR'',',
'      p_items=>''P167_FROMDATE,P167_TODATE,P167_COMPANY,P167_LOCATION'',',
'      p_values=>:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION) GateInUrl,',
'    apex_page.get_url(p_page=>132,p_request=>''IR[MYID]_NN_FIRSTWEIGHT'',p_clear_cache=>''132,RIR'') FirstUrl,',
'    apex_page.get_url(p_page=>132,p_request=>''IR[MYID]_NN_SECONDWEIGHT'',p_clear_cache=>''132,RIR'') SecondUrl,',
'    apex_page.get_url(p_page=>167,p_clear_cache=>''167,RIR'',',
'      p_items=>''P167_FROMDATE,P167_TODATE,P167_COMPANY,P167_LOCATION'',',
'      p_values=>:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION) GateOutUrl,',
'    apex_page.get_url(p_page=>174,p_clear_cache=>''174,RIR'',',
'      p_items=>''P174_FROMDATE,P174_TODATE,P174_COMPANY,P174_LOCATION'',',
'      p_values=>:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION) InvUrl',
'  From dual),',
'Stg As (',
'  Select 10 Seq, ''Sales Quotation'' Nm, ''Commitment recorded'' SubLbl, ''fa-handshake-o'' Ic, U.ScUrl Url,',
'         (Select Count(*) From SLC_SalesConfirm a Cross Join Win w Where a.SalesConfirmDate Between w.F And w.T',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)) Cnt,',
'         (Select Nvl(Sum(d.Amount),0) From SLC_SalesConfirm a Join SLC_SalesConfirmDetail d On d.TNo=a.TNo Cross Join Win w Where a.SalesConfirmDate Between w.F And w.T',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)) Val,',
'         Null Pend, Null PendLbl From U',
'  Union All',
'  Select 20,''Sales Order'',''Order booked'',''fa-file-text-o'',U.SoUrl,',
'         (Select Count(*) From SLC_SalesOrder a Cross Join Win w Where a.SalesOrderDate Between w.F And w.T',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)),',
'         (Select Nvl(Sum(d.Amount),0) From SLC_SalesOrder a Join SalesOrderDetail d On d.TNo=a.TNo Cross Join Win w Where a.SalesOrderDate Between w.F And w.T',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)),',
'         Null,Null From U',
'  Union All',
'  Select 30,''Dispatch Advice'',''Vehicle planned'',''fa-clipboard'',U.DaUrl,',
'         (Select Count(*) From SLC_DespatchAdvice a Cross Join Win w Where a.DespatchAdviceDate Between w.F And w.T',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)), Null,Null,Null From U',
'  Union All',
'  Select 40,''Gate In'',''Vehicle arrived'',''fa-sign-in'',U.GateInUrl,',
'         (Select Count(*) From SLC_MaterialOut a Cross Join Win w Where a.MaterialOutDate Between w.F And w.T',
'            And a.GateInTime Is Not Null',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)), Null,Null,Null From U',
'  Union All',
'  Select 50,''First Weight'',''Initial weigh'',''fa-balance-scale'',U.FirstUrl,',
'         (Select Count(*) From SLC_Weighment a Cross Join Win w Where a.WeighmentDate Between w.F And w.T',
'            And a.FirstWeight Is Not Null',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)), Null,Null,Null From U',
'  Union All',
'  Select 60,''Second Weight'',''Final weigh'',''fa-check-circle-o'',U.SecondUrl,',
'         (Select Count(*) From SLC_Weighment a Cross Join Win w Where a.WeighmentDate Between w.F And w.T',
'            And a.SecondWeight Is Not Null',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)), Null,Null,Null From U',
'  Union All',
'  Select 70,''Gate Out'',''Vehicle released'',''fa-sign-out'',U.GateOutUrl,',
'         (Select Count(*) From SLC_MaterialOut a Cross Join Win w Where a.MaterialOutDate Between w.F And w.T',
'            And a.GateOutTime Is Not Null',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)), Null,Null,Null From U',
'  Union All',
'  Select 80,''CC Invoice'',''Customer billed'',''fa-inr'',U.InvUrl,',
'         (Select Count(*) From SLC_CCInvoice a Cross Join Win w Where a.CCInvoiceDate Between w.F And w.T',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)),',
'         (Select Nvl(Sum(d.Amount),0) From SLC_CCInvoice a Join SLC_CCInvoiceDetail d On d.TNo=a.TNo Cross Join Win w Where a.CCInvoiceDate Between w.F And w.T',
'            And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'            And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'            And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'            And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)),Null,Null From U)',
'Select',
'    ''<a class="ds-slc-stage" style="--i:''||to_char(s.Seq/10)||''" href="''||apex_escape.html_attribute(s.Url)||''" title="Open ''||apex_escape.html_attribute(s.Nm)||'' register with current dashboard filters">''',
'    || ''<span class="ds-slc-st-head"><span class="ds-slc-st-ic"><span class="fa ''||s.Ic||''"></span></span>''',
'    || ''<span><span class="ds-slc-st-step">Step ''||to_char(s.Seq/10)||''</span><span class="ds-slc-st-name">''||apex_escape.html(s.Nm)||''</span></span></span>''',
'    || ''<span class="ds-slc-st-cnt">''||to_char(s.Cnt,''FM999G999G990'')||''</span>''',
'    || Case When s.Val Is Not Null Then ''<span class="ds-slc-st-val">&#8377; ''||to_char(Round(s.Val/1e7,2),''FM999G990D00'')||'' Cr</span>'' Else ''<span class="ds-slc-st-sub">''||apex_escape.html(s.SubLbl)||''</span>'' End',
'    || ''<span class="ds-slc-register-link">Open register <span class="fa fa-arrow-right"></span></span>''',
'    || ''</a>'' As FLOW',
'From Stg s',
'Order By s.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No lifecycle activity in this scope.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1481443628910410829)
,p_query_column_id=>1
,p_column_alias=>'FLOW'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481937214183528679)
,p_plug_name=>'Vehicle Operational Detail'
,p_static_id=>'live-vehicles'
,p_region_name=>'p730LiveVehicles'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>52
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<a href="''||apex_page.get_url(p_page=>724,p_clear_cache=>''724'',p_items=>''P724_VEHICLE'',p_values=>q.VehicleNo)||''">''',
'         ||apex_escape.html(q.VehicleNo)||''</a>'' VEHICLE,',
'       GetPartyName(q.PartyCode) CUSTOMER,q.DaNo DA_NO,',
'       Case When q.SoTNo Is Not Null Then',
'              ''<a href="''||apex_page.get_url(p_page=>723,p_clear_cache=>''723'',p_items=>''P723_TNO'',p_values=>q.SoTNo)||''">''||apex_escape.html(q.SoNo)||''</a>''',
'            When q.InternalNo Is Not Null Then ''<span class="ds-pill ds-pill--muted">Inter-unit transfer &middot; ''||apex_escape.html(q.InternalNo)||''</span>''',
'            Else ''<span class="ds-pill ds-pill--bad">Source link missing</span>'' End SO_NO,',
'       q.EventTime EVENT_TIME,q.HoursValue HOURS,q.STATUS',
'  From (',
'    Select mo.VehicleNo,mo.PartyCode,da.DespatchAdviceNo DaNo,so.SalesOrderNo SoNo,so.TNo SoTNo,iut.InterunittransferNo InternalNo,',
'           mo.GateInTime EventTime,Round((sysdate-mo.GateInTime)*24,1) HoursValue,',
'           ''<span class="ds-pill ds-pill--''||Case When (sysdate-mo.GateInTime)*24>8 Then ''warn">Delayed'' Else ''info">Inside'' End||''</span>'' Status',
'      From SLC_MaterialOut mo',
'      Left Join SLC_DespatchAdvice da On da.TNo=mo.ReferenceTNo',
'      Left Join SLC_SalesOrder so On so.TNo=da.SalesOrderTNo',
'      Left Join Interunittransfer iut On iut.TNo=da.ReferenceTNo',
'     Where Nvl(:P721_VEHICLE_FOCUS,''INSIDE'')=''INSIDE''',
'       And mo.GateInTime>sysdate-2 And mo.GateOutTime Is Null',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY)',
'       And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION)',
'       And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)',
'    Union All',
'    Select w2.VehicleNo,w2.PartyCode,Null,Null,Null,Null,w2.WeighmentDate,',
'           Round((sysdate-w2.WeighmentDate)*24,1),',
'           ''<span class="ds-pill ds-pill--warn">Awaiting final weigh</span>''',
'      From SLC_Weighment w2',
'     Where :P721_VEHICLE_FOCUS=''WEIGH''',
'       And w2.WeighmentDate>sysdate-2 And w2.SecondWeight Is Null',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or w2.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P721_COMPANY Is Null Or w2.CompanyCode=:P721_COMPANY)',
'       And (:P721_PANEL Is Null Or w2.Panel=:P721_PANEL)',
'    Union All',
'    Select mo.VehicleNo,mo.PartyCode,da.DespatchAdviceNo,so.SalesOrderNo,so.TNo,iut.InterunittransferNo,mo.GateInTime,',
'           Round((mo.GateOutTime-mo.GateInTime)*24,1),',
'           ''<span class="ds-pill ds-pill--good">Clean completed trip</span>''',
'      From SLC_MaterialOut mo',
'      Left Join SLC_DespatchAdvice da On da.TNo=mo.ReferenceTNo',
'      Left Join SLC_SalesOrder so On so.TNo=da.SalesOrderTNo',
'      Left Join Interunittransfer iut On iut.TNo=da.ReferenceTNo',
'     Where :P721_VEHICLE_FOCUS=''DWELL''',
'       And mo.GateInTime Is Not Null And mo.GateOutTime Is Not Null And mo.GateOutTime>sysdate-90',
'       And (mo.GateOutTime-mo.GateInTime)*24 Between 0 And 72',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY)',
'       And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION)',
'       And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)',
'    Union All',
'    Select mo.VehicleNo,mo.PartyCode,da.DespatchAdviceNo,so.SalesOrderNo,so.TNo,iut.InterunittransferNo,mo.GateInTime,',
'           Round((sysdate-mo.GateInTime)*24,1),',
'           ''<span class="ds-pill ds-pill--bad">Gate-out not recorded</span>''',
'      From SLC_MaterialOut mo',
'      Left Join SLC_DespatchAdvice da On da.TNo=mo.ReferenceTNo',
'      Left Join SLC_SalesOrder so On so.TNo=da.SalesOrderTNo',
'      Left Join Interunittransfer iut On iut.TNo=da.ReferenceTNo',
'     Where :P721_VEHICLE_FOCUS=''STALE''',
'       And mo.GateInTime<=sysdate-2 And mo.GateInTime>sysdate-400 And mo.GateOutTime Is Null',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY)',
'       And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION)',
'       And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)) q',
' Order By q.EventTime Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1481937366785528679)
,p_no_data_found_message=>'No vehicle records match the selected KPI condition.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47478856594231429
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481937599910528679)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481937699836528680)
,p_db_column_name=>'DA_NO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Dispatch Advice'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485741890159329839)
,p_db_column_name=>'EVENT_TIME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Event Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1485741930031329839)
,p_db_column_name=>'HOURS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Hours / Dwell'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481937726668528680)
,p_db_column_name=>'SO_NO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sales Order'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481938023467528680)
,p_db_column_name=>'STATUS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481937453862528679)
,p_db_column_name=>'VEHICLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vehicle'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1482191339869748649)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'VEHICLE:CUSTOMER:DA_NO:SO_NO:EVENT_TIME:HOURS:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481442630437410827)
,p_plug_name=>'SLC Theme'
,p_static_id=>'page-style'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>1
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'body:has(.ds-slc-headregion){',
'  --slc-primary:#0F766E; --slc-secondary:#0891B2; --slc-deep:#134E4A;',
'  --ds-dash-gold:#0F766E; --ds-dash-gold-bg:#E5F3F1;',
'  --ds-dash-ink:#0B3B36; --ds-dash-ink2:#2E5A55;',
'}',
'body:has(.ds-slc-headregion) .ds-kpi--value{--ds-kpi-accent:#0F766E;--ds-kpi-accent-bg:#E5F3F1;}',
'body:has(.ds-slc-headregion) .ds-kpi--bill {--ds-kpi-accent:#0891B2;--ds-kpi-accent-bg:#E2F4F8;}',
'body:has(.ds-slc-headregion) .ds-kpi--input{--ds-kpi-accent:#0E7490;--ds-kpi-accent-bg:#E2F1F6;}',
'body:has(.ds-slc-headregion) .ds-kpi--ok   {--ds-kpi-accent:#15803D;--ds-kpi-accent-bg:#E6F4EA;}',
'body:has(.ds-slc-headregion) .ds-kpi--risk {--ds-kpi-accent:#B45309;--ds-kpi-accent-bg:#FBF0E2;}',
'body:has(.ds-slc-headregion) .ds-kpi--suppl{--ds-kpi-accent:#4F46E5;--ds-kpi-accent-bg:#EEF0FE;}',
'body:has(.ds-slc-headregion) .ds-purchase-section::before{background:linear-gradient(180deg,#0891B2,#134E4A);}',
'body:has(.ds-slc-headregion) .ds-kpiwrap--4up{grid-template-columns:repeat(4,minmax(0,1fr));}',
'@media(max-width:900px){body:has(.ds-slc-headregion) .ds-kpiwrap--4up{grid-template-columns:repeat(2,minmax(0,1fr));}}',
'body:has(.ds-slc-headregion) .ds-kpiwrap--6up{grid-template-columns:repeat(6,minmax(0,1fr));}',
'@media(max-width:1200px){body:has(.ds-slc-headregion) .ds-kpiwrap--6up{grid-template-columns:repeat(3,minmax(0,1fr));}}',
'@media(max-width:640px){body:has(.ds-slc-headregion) .ds-kpiwrap--6up{grid-template-columns:repeat(2,minmax(0,1fr));}}',
'body:has(.ds-slc-headregion) .ds-dash-filters::before{',
'  background:url("data:image/svg+xml,%3Csvg xmlns=''http://www.w3.org/2000/svg'' viewBox=''0 0 24 24'' fill=''none'' stroke=''%230F766E'' stroke-width=''2'' stroke-linecap=''round'' stroke-linejoin=''round''%3E%3Cpolygon points=''22 3 2 3 10 12.46 10 19 14 21 14 12'
||'.46 22 3''/%3E%3C/svg%3E") left center / 14px 14px no-repeat;}',
'body:has(.ds-slc-headregion) .ds-dash-filters::after{display:none;}',
'/* SLC HERO band */',
'.ds-slc-hero{position:relative;overflow:hidden;padding:24px 26px 20px;',
'  border:1px solid #A7D9D3;border-radius:16px;',
'  background:radial-gradient(130% 130% at 92% 8%, rgba(8,145,178,.26) 0%, rgba(8,145,178,0) 48%),',
'    radial-gradient(120% 120% at 0% 100%, rgba(19,78,74,.18) 0%, rgba(19,78,74,0) 44%),',
'    linear-gradient(120deg,#D3EEEA 0%,#CDEBE8 34%,#DAF1EF 66%,#E9F7F5 100%);',
'  box-shadow:0 1px 2px rgba(16,24,40,.05),0 12px 34px rgba(15,118,110,.12);}',
'.ds-slc-hero-row{position:relative;z-index:1;display:flex;align-items:flex-start;gap:16px;}',
'.ds-slc-hero-icon{flex:0 0 auto;display:grid;place-items:center;width:54px;height:54px;',
'  border-radius:14px;color:#fff;font-size:22px;',
'  background:linear-gradient(135deg,#0D9488 0%,#0F766E 100%);',
'  box-shadow:0 6px 16px rgba(15,118,110,.32);}',
'.ds-slc-hero-text{display:flex;flex-direction:column;}',
'.ds-slc-hero-eyebrow{font-size:11px;font-weight:700;letter-spacing:.12em;',
'  text-transform:uppercase;color:#0F766E;margin-bottom:3px;}',
'.ds-slc-hero-title{font-size:27px;font-weight:700;line-height:1.15;',
'  letter-spacing:-.02em;color:#0B3B36;}',
'.ds-slc-hero-sub{margin-top:6px;font-size:13.5px;line-height:1.5;color:#2E5A55;max-width:60ch;}',
'.ds-slc-hero-chips{position:relative;z-index:1;display:flex;flex-wrap:wrap;gap:8px;margin-top:18px;max-width:70%;}',
'',
'/* ===== Lifecycle funnel ===== */',
'.ds-slc-flow{display:flex;flex-wrap:wrap;gap:0;align-items:stretch;}',
'.ds-slc-stage{position:relative;flex:1 1 0;min-width:118px;display:flex;flex-direction:column;',
'  padding:14px 14px 13px;background:var(--ds-dash-surface);border:1px solid var(--ds-dash-line);',
'  border-right:0;text-decoration:none;transition:background .14s,transform .1s;}',
'.ds-slc-stage:first-child{border-radius:12px 0 0 12px;}',
'.ds-slc-stage:last-child{border-right:1px solid var(--ds-dash-line);border-radius:0 12px 12px 0;}',
'.ds-slc-stage:hover{background:#F0FAF8;}',
'.ds-slc-stage::after{content:"";position:absolute;top:50%;right:-11px;z-index:2;',
'  width:22px;height:22px;transform:translateY(-50%) rotate(45deg);',
'  background:var(--ds-dash-surface);border-top:1px solid var(--ds-dash-line);',
'  border-right:1px solid var(--ds-dash-line);}',
'.ds-slc-stage:last-child::after{display:none;}',
'.ds-slc-stage:hover::after{background:#F0FAF8;}',
'.ds-slc-st-head{display:flex;align-items:center;gap:8px;margin-bottom:9px;}',
'.ds-slc-st-ic{display:grid;place-items:center;width:26px;height:26px;flex:0 0 auto;',
'  font-size:12px;border-radius:7px;color:#0F766E;background:#E5F3F1;}',
'.ds-slc-st-name{font-size:11px;font-weight:700;letter-spacing:.02em;color:#2E5A55;line-height:1.2;}',
'.ds-slc-st-cnt{font-size:20px;font-weight:700;letter-spacing:-.02em;color:#0B3B36;',
'  font-variant-numeric:tabular-nums;line-height:1;}',
'.ds-slc-st-val{margin-top:3px;font-size:12px;font-weight:600;color:#0F766E;font-variant-numeric:tabular-nums;}',
'.ds-slc-st-sub{margin-top:2px;font-size:11px;color:var(--ds-dash-muted);}',
'.ds-slc-st-pend{margin-top:8px;display:inline-flex;align-items:center;gap:5px;align-self:flex-start;',
'  padding:2px 8px;border-radius:20px;font-size:10.5px;font-weight:700;',
'  color:#B45309;background:#FBF0E2;}',
'.ds-slc-st-pend.is-zero{color:#15803D;background:#E6F4EA;}',
'.ds-slc-stage[data-hint]:hover .ds-slc-st-name{color:#0F766E;}',
'.ds-slc-stage.is-active{background:#E5F3F1;}',
'.ds-slc-stage.is-active::after{background:#E5F3F1;}',
'.ds-slc-stage.is-active .ds-slc-st-name{color:#0F766E;}',
'.ds-slc-stage.is-active .ds-slc-st-cnt{color:#0F766E;}',
'.ds-slc-flow--register .t-Report-report{display:block;width:100%;overflow:visible;}',
'.ds-slc-flow--register .t-Report-report thead{display:none;}',
'.ds-slc-flow--register .t-Report-report tbody{position:relative;display:grid;grid-template-columns:repeat(8,minmax(124px,1fr));',
'  gap:10px;align-items:stretch;padding:12px 3px 15px;overflow-x:auto;scrollbar-width:thin;',
'  scrollbar-color:#9FD8D0 transparent;isolation:isolate;}',
'.ds-slc-flow--register .t-Report-report tbody::before{content:"";position:absolute;z-index:-1;left:4%;right:4%;top:50%;height:3px;',
'  background:linear-gradient(90deg,#CDE5E2,#5EEAD4,#0F766E,#CDE5E2);background-size:220% 100%;',
'  border-radius:999px;animation:dsSlcRoute 4.5s linear infinite;}',
'.ds-slc-flow--register .t-Report-report tr,.ds-slc-flow--register .t-Report-report td{display:block;border:0;padding:0;background:transparent;}',
'.ds-slc-flow--register .ds-slc-stage{min-width:124px;border:1px solid #CDE5E2!important;border-radius:14px!important;',
'  height:100%;background:rgba(255,255,255,.96);box-shadow:0 5px 15px rgba(15,76,69,.07);padding:13px 12px 11px;',
'  transition:transform .18s ease,border-color .18s ease,box-shadow .18s ease;}',
'.ds-slc-flow--register .ds-slc-stage:hover,.ds-slc-flow--register .ds-slc-stage:focus{transform:translateY(-4px);',
'  border-color:#0F766E!important;box-shadow:0 10px 24px rgba(15,118,110,.15);outline:none;}',
'.ds-slc-flow--register .ds-slc-stage::after{top:50%;right:-9px;width:8px;height:8px;border:0;border-top:2px solid #0F766E;',
'  border-right:2px solid #0F766E;background:transparent!important;transform:translateY(-50%) rotate(45deg);',
'  animation:dsSlcArrow 1.8s ease-in-out infinite;animation-delay:calc(var(--i) * .12s);}',
'.ds-slc-flow--register .ds-slc-st-ic{width:30px;height:30px;background:#E5F3F1;border-color:#A7D8D1;}',
'.ds-slc-flow--register .ds-slc-st-step{display:block;margin-bottom:3px;font-size:9px;font-weight:800;',
'  letter-spacing:.11em;text-transform:uppercase;color:#0F766E;}',
'.ds-slc-flow--register .ds-slc-register-link{display:inline-flex;align-items:center;gap:4px;margin-top:9px;',
'  font-size:10.5px;font-weight:700;color:#0F766E;}',
'.ds-slc-flow--register .t-Report-report tbody{grid-auto-rows:1fr;gap:14px;padding:12px 4px 16px;}',
'.ds-slc-flow--register .t-Report-report tbody::before{display:none;animation:none;}',
'.ds-slc-flow--register .t-Report-report tr{height:100%;}',
'.ds-slc-flow--register .ds-slc-stage{box-sizing:border-box;min-height:176px;height:100%;display:grid;',
'  grid-template-rows:auto auto auto 1fr auto;align-content:start;padding:15px 14px 13px;}',
'.ds-slc-flow--register .ds-slc-stage::after{right:-12px;width:9px;height:9px;z-index:4;',
'  border-top:2px solid #0F766E;border-right:2px solid #0F766E;background:#F5F8F8!important;}',
'.ds-slc-flow--register .ds-slc-st-head{min-height:43px;align-items:flex-start;}',
'.ds-slc-flow--register .ds-slc-st-name{min-height:28px;display:flex;align-items:center;}',
'#p730FulfilmentHealth{margin-top:16px;}',
'@keyframes dsSlcRoute{to{background-position:-220% 0;}}',
'@keyframes dsSlcArrow{0%,100%{opacity:.38;}50%{opacity:1;}}',
'@media(prefers-reduced-motion:reduce){.ds-slc-flow--register .t-Report-report tbody::before,.ds-slc-flow--register .ds-slc-stage::after{animation:none;}}',
'',
'/* Monthly trend (HTML bars, no JET) */',
'.ds-slc-trend{display:flex;gap:8px;align-items:flex-end;height:150px;padding:10px 6px 0;}',
'.ds-slc-tmon{flex:1 1 0;display:flex;flex-direction:column;align-items:center;justify-content:flex-end;height:100%;gap:5px;}',
'.ds-slc-tbar{width:64%;max-width:40px;border-radius:6px 6px 0 0;',
'  background:linear-gradient(180deg,#14B8A6,#0F766E);min-height:3px;transition:height .3s ease;}',
'.ds-slc-tval{font-size:11px;font-weight:700;color:#0B3B36;font-variant-numeric:tabular-nums;}',
'.ds-slc-tlbl{font-size:10.5px;color:var(--ds-dash-muted);font-weight:600;letter-spacing:.03em;}',
'.ds-slc-guide{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:10px;margin:4px 0 8px;}',
'.ds-slc-guide-step{display:flex;align-items:flex-start;gap:11px;padding:13px 14px;border:1px solid #CDE5E2;',
'  border-radius:12px;background:linear-gradient(135deg,#FFFFFF 0%,#F3FAF9 100%);}',
'.ds-slc-guide-no{display:grid;place-items:center;flex:0 0 auto;width:27px;height:27px;border-radius:9px;',
'  color:#fff;background:#0F766E;font-size:12px;font-weight:800;box-shadow:0 4px 10px rgba(15,118,110,.2);}',
'.ds-slc-guide-copy{display:flex;flex-direction:column;gap:2px;min-width:0;}',
'.ds-slc-guide-copy b{font-size:12px;color:#0B3B36;}',
'.ds-slc-guide-copy span{font-size:11.5px;line-height:1.4;color:#54706D;}',
'.ds-slc-lenses{grid-column:1/-1;display:flex;align-items:center;flex-wrap:wrap;gap:7px;',
'  padding:2px 2px 0;color:#54706D;font-size:11.5px;}',
'.ds-slc-lenses>span{font-weight:800;letter-spacing:.07em;text-transform:uppercase;color:#0F766E;margin-right:2px;}',
'.ds-slc-lenses a{display:inline-flex;align-items:center;gap:6px;padding:6px 10px;border:1px solid #CDE5E2;',
'  border-radius:999px;background:#fff;color:#0F766E;font-weight:700;text-decoration:none;}',
'.ds-slc-lenses a:hover,.ds-slc-lenses a:focus{border-color:#0F766E;background:#E5F3F1;outline:none;}',
'#p730Executive,#p730Action,#p730Commercial,#p730Exceptions{scroll-margin-top:76px;}',
'.ds-slc-lollipop .ds-lolli-line{background:linear-gradient(90deg,#5EEAD4,#0F766E);}',
'.ds-slc-lollipop .ds-lolli-dot{background:#0F766E;box-shadow:0 0 0 3px rgba(15,118,110,.16);}',
'.ds-slc-lollipop .ds-lolli--hi .ds-lolli-line{background:linear-gradient(90deg,#FDBA74,#B45309);}',
'.ds-slc-lollipop .ds-lolli--hi .ds-lolli-dot{background:#B45309;box-shadow:0 0 0 3px rgba(180,83,9,.16);}',
'.ds-slc-lollipop{min-height:450px;}',
'@media(max-width:800px){.ds-slc-guide{grid-template-columns:1fr;}.ds-slc-lollipop{min-height:0;}}',
'html.page-730 .t-Body-title.hspl-hero-card,',
'html.page-730 .t-Body-title{display:none !important;}',
'</style>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481443072606410828)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1483437070914395138)
,p_plug_name=>'Quick Links'
,p_static_id=>'related-nav'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>7
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:flex;flex-wrap:wrap;gap:8px;align-items:center;margin:8px 0 2px;">',
'  <span style="font-size:10.5px;font-weight:700;letter-spacing:.08em;text-transform:uppercase;color:#2E5A55;margin-right:2px;">Quick links</span>',
'  <a href="f?p=&APP_ID.:722:&APP_SESSION.:::722" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #A7D9D3;border-radius:20px;background:#E5F3F1;color:#0F766E;font-size:12px;font-weight:600;text-decoration:none;"'
||'><span class="fa fa-handshake-o"></span>Sales Quotation 360</a>',
'  <a href="f?p=&APP_ID.:723:&APP_SESSION.:::723" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #A7D9D3;border-radius:20px;background:#E5F3F1;color:#0F766E;font-size:12px;font-weight:600;text-decoration:none;"'
||'><span class="fa fa-file-text-o"></span>Sales Order 360</a>',
'  <a href="f?p=&APP_ID.:724:&APP_SESSION.:::724" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #A7D9D3;border-radius:20px;background:#E5F3F1;color:#0F766E;font-size:12px;font-weight:600;text-decoration:none;"'
||'><span class="fa fa-truck"></span>Vehicle 360</a>',
'  <a href="f?p=&APP_ID.:725:&APP_SESSION.:::725" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #A7D9D3;border-radius:20px;background:#E5F3F1;color:#0F766E;font-size:12px;font-weight:600;text-decoration:none;"'
||'><span class="fa fa-cubes"></span>Category 360</a>',
'  <a class="ds-slc-register-drill" data-focus="SC" data-reg="p730ScRegister" href="javascript:void(0);" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #CDE5E2;border-radius:20px;background:#fff;color:#0F766E;f'
||'ont-size:12px;font-weight:600;text-decoration:none;"><span class="fa fa-list-alt"></span>Quotation Register</a>',
'  <a class="ds-slc-register-drill" data-focus="SO" data-reg="p730SoRegister" href="javascript:void(0);" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #CDE5E2;border-radius:20px;background:#fff;color:#0F766E;f'
||'ont-size:12px;font-weight:600;text-decoration:none;"><span class="fa fa-list-alt"></span>Order Register</a>',
'  <a class="ds-slc-register-drill" data-focus="GATE_IN" data-reg="p730GateInRegister" href="javascript:void(0);" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #CDE5E2;border-radius:20px;background:#fff;color:'
||'#0F766E;font-size:12px;font-weight:600;text-decoration:none;"><span class="fa fa-list-alt"></span>Gate-In Register</a>',
'  <a class="ds-slc-register-drill" data-focus="INV" data-reg="p730InvoiceRegister" href="javascript:void(0);" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #CDE5E2;border-radius:20px;background:#fff;color:#0F'
||'766E;font-size:12px;font-weight:600;text-decoration:none;"><span class="fa fa-list-alt"></span>CC Invoice Register</a>',
'  <a href="#p730ScBalanceRegister" style="display:inline-flex;align-items:center;gap:6px;padding:7px 14px;border:1px solid #F0D9B8;border-radius:20px;background:#FBF0E2;color:#8A4708;font-size:12px;font-weight:600;text-decoration:none;"><span class="'
||'fa fa-balance-scale"></span>SC Balance</a>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1484456520507854959)
,p_plug_name=>'Action Centre Note'
,p_static_id=>'rule-action-centre'
,p_region_name=>'p730Action'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>42
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Action Centre</h2>',
'  <p>What needs attention now. The donut shows the mix of exception records; the lollipop ranks lifecycle handoffs by stuck-document volume and age. Click a lollipop row to open its stage documents.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482186106095676335)
,p_plug_name=>'Analytics Note'
,p_static_id=>'rule-analytics'
,p_region_name=>'p730Commercial'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Commercial Analytics</h2>',
'  <p>What sold, to whom, and through whom &mdash; by category, customer, item and agent, on invoiced value (taxable line, reconciles to the CC Invoice Register). Category resolves through the specification master.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481690170129482423)
,p_plug_name=>'Bottleneck Note'
,p_static_id=>'rule-bottleneck'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Lifecycle Bottlenecks</h2>',
'  <p>Where transactions are stuck between stages &mdash; how many, how much value, and how old. Click a card to list the stuck documents below.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482440642287773376)
,p_plug_name=>'Category Flow Note'
,p_static_id=>'rule-catflow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>69
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Quotation &rarr; Order Category Flow</h2>',
'  <p>Sales Quotations are booked by <b>category</b>; the resulting Sales Order carries <b>specifications</b> that roll up to a category. This shows where the ordered category <b>differs</b> from what was quoted &mdash; substitution or a booking misma'
||'tch. "Changed" rows are listed first.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482189100909676336)
,p_plug_name=>'Exceptions Note'
,p_static_id=>'rule-exceptions'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>71
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Exception Register</h2>',
'  <p>Where the lifecycle needs attention &mdash; stuck documents, missing downstream records, and data gaps &mdash; ranked by severity and age. Every row is a real document; search, sort and filter freely.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481443416377410828)
,p_plug_name=>'Lifecycle Funnel Note'
,p_static_id=>'rule-funnel'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>23
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Sales Execution Lifecycle</h2>',
'  <p>Follow one sale from confirmation to billing. Every animated step opens its designated register with the dashboard period, company and location carried forward.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1486527181330381099)
,p_plug_name=>'Lifecycle Follow-up Note'
,p_static_id=>'rule-kpi-registers'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>28
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Lifecycle Follow-up Registers</h2>',
'  <p>Click a Lifecycle Pulse KPI to open its complete register here without reloading the dashboard. The active period, company and location are retained.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481443187376410828)
,p_plug_name=>'Lifecycle Pulse'
,p_static_id=>'rule-pulse'
,p_region_name=>'p730Executive'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Lifecycle Pulse</h2>',
'  <p>The period position at each stage of the sales execution chain. Value is the taxable line (detail Amount) and the Invoice figure reconciles to the CC Invoice Register.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482185761579676305)
,p_plug_name=>'Trend Note'
,p_static_id=>'rule-trend'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>34
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Invoiced Value Trend</h2>',
'  <p>Monthly invoiced value (&#8377; Cr, taxable line) across the selected window.</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481936951525528679)
,p_plug_name=>'Vehicle Control Tower Note'
,p_static_id=>'rule-vehicle'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-purchase-section">',
'  <h2>Vehicle Control Tower</h2>',
'  <p>Live operational view (independent of the date filter). "Inside" counts vehicles gated in within the last 2 days with no gate-out; older open gate-ins are flagged as a data gap, not live vehicles. Dwell time is the median of clean gate-in&rarr;g'
||'ate-out trips (anomalous records excluded).</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1486527269700381119)
,p_plug_name=>'Sales Quotation Follow-up &mdash; Detail Register'
,p_static_id=>'sales-confirmation-follow-up'
,p_region_name=>'p730ScRegister'
,p_region_css_classes=>'ds-register ds-slc-kpireg'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>29
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Scope As (',
'  Select sc.TNo,sc.SalesConfirmNo,sc.SalesConfirmDate,sc.PartyCode,sc.CompanyCode,sc.LocationCode,sc.Panel',
'    From SLC_SalesConfirm sc',
'   Where sc.SalesConfirmDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'     And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'     And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)),',
'CurrentStatus As (',
'  Select ModuleCode,ModuleTNo,DocumentStatusCode',
'    From (Select d.ModuleCode,d.ModuleTNo,d.DocumentStatusCode,',
'                 Row_Number() Over(Partition By d.ModuleCode,d.ModuleTNo Order By d.StatusTime Desc Nulls Last,d.TNo Desc) rn',
'            From DocumentStatusDetail d',
'           Where d.ModuleCode In (''SalesConfirm'',''SalesOrder'',''DespatchAdvice'',''CCInvoice''))',
'   Where rn=1),',
'DetailAgg As (',
'  Select d.TNo,',
'         Sum(Nvl(d.Quantity1,0)) SCQty,',
'         Max(Case When d.ItemCategoryCode=''SCP'' Then d.WithoutDiscountRate End) SCP,',
'         Max(Case When d.ItemCategoryCode=''BEAM'' Then d.WithoutDiscountRate End) BEAM,',
'         Max(Case When d.ItemCategoryCode=''LS'' Then d.WithoutDiscountRate End) LS,',
'         Max(Case When d.ItemCategoryCode=''FLAT'' Then d.WithoutDiscountRate End) FLAT,',
'         Max(Case When d.ItemCategoryCode=''MS'' Then d.WithoutDiscountRate End) MS,',
'         Max(Case When d.ItemCategoryCode=''STRIPS'' Then d.WithoutDiscountRate End) STRIPS,',
'         Max(Case When d.ItemCategoryCode=''PIPES'' Then d.WithoutDiscountRate End) PIPES,',
'         Max(Case When d.ItemCategoryCode=''BP'' Then d.WithoutDiscountRate End) BP',
'    From SLC_SalesConfirmDetail d Join Scope s On s.TNo=d.TNo',
'   Group By d.TNo),',
'SoAgg As (',
'  Select so.SalesConfirmTNo TNo,Sum(sod.Quantity1) SOQty',
'    From SLC_SalesOrder so Join Scope s On s.TNo=so.SalesConfirmTNo',
'    Join SalesOrderDetail sod On sod.TNo=so.TNo',
'    Join CurrentStatus cs On cs.ModuleCode=''SalesOrder'' And cs.ModuleTNo=so.TNo And cs.DocumentStatusCode=''ACTIVE''',
'   Group By so.SalesConfirmTNo),',
'DaDoc As (',
'  Select so.SalesConfirmTNo TNo,da.TNo DaTNo,Sum(dad.Quantity1) DAQty',
'    From SLC_SalesOrder so Join Scope s On s.TNo=so.SalesConfirmTNo',
'    Join SLC_DespatchAdvice da On da.SalesOrderTNo=so.TNo',
'    Join DespatchAdviceDetail dad On dad.TNo=da.TNo',
'    Join CurrentStatus cs On cs.ModuleCode=''DespatchAdvice'' And cs.ModuleTNo=da.TNo And cs.DocumentStatusCode=''ACTIVE''',
'   Group By so.SalesConfirmTNo,da.TNo),',
'DaAgg As (',
'  Select x.TNo,Sum(x.DAQty) DAQty,Sum(Nvl(w.WTQty,0)) WTQty',
'    From DaDoc x',
'    Left Join (Select w.ReferenceTNo,Sum(Distinct w.NetWeight) WTQty From SLC_Weighment w Group By w.ReferenceTNo) w On w.ReferenceTNo=x.DaTNo',
'   Group By x.TNo),',
'CcAgg As (',
'  Select so.SalesConfirmTNo TNo,Sum(cid.Quantity1) CCQty',
'    From SLC_SalesOrder so Join Scope s On s.TNo=so.SalesConfirmTNo',
'    Join SLC_CCInvoice ci On ci.SalesOrderTNo=so.TNo',
'    Join SLC_CCInvoiceDetail cid On cid.TNo=ci.TNo',
'    Left Join CurrentStatus cs On cs.ModuleCode=''CCInvoice'' And cs.ModuleTNo=ci.TNo',
'   Where cs.DocumentStatusCode=''ACTIVE'' Or cs.ModuleTNo Is Null',
'   Group By so.SalesConfirmTNo)',
'Select s.TNo,',
'       ''<a href="''||apex_page.get_url(p_page=>722,p_clear_cache=>''722'',p_items=>''P722_TNO'',p_values=>s.TNo)||''">''',
'         ||apex_escape.html(s.SalesConfirmNo)||''</a>'' SalesConfirmNo,',
'       s.SalesConfirmDate,',
'       s.PartyCode,',
'       p.PartyName,',
'       Nvl(ds.DocumentStatusName,cs.DocumentStatusCode) Status,',
'       d.SCQty,',
'       so.SOQty,',
'       da.DAQty,',
'       Greatest(Nvl(da.DAQty,0)-Nvl(cc.CCQty,0),0) DABalance,',
'       da.WTQty,',
'       cc.CCQty,',
'       Greatest(Nvl(d.SCQty,0)-Nvl(cc.CCQty,0),0) BalanceQty,',
'       s.TNo TNo1,',
'       d.SCP,d.BEAM,d.LS,d.FLAT,d.MS,d.STRIPS,d.PIPES,d.BP',
'  From Scope s',
'  Join DetailAgg d On d.TNo=s.TNo',
'  Left Join Party p On p.PartyCode=s.PartyCode',
'  Left Join CurrentStatus cs On cs.ModuleCode=''SalesConfirm'' And cs.ModuleTNo=s.TNo',
'  Left Join DocumentStatus ds On ds.DocumentStatusCode=cs.DocumentStatusCode',
'  Left Join SoAgg so On so.TNo=s.TNo',
'  Left Join DaAgg da On da.TNo=s.TNo',
'  Left Join CcAgg cc On cc.TNo=s.TNo',
' Order By s.TNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1486527409713381120)
,p_no_data_found_message=>'No sales quotations in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>52068899522083870
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486527726369381120)
,p_db_column_name=>'BALANCEQTY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Balance Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.900'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528753778381120)
,p_db_column_name=>'BEAM'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Beam'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486529441161381120)
,p_db_column_name=>'BP'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Bp'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528540047381120)
,p_db_column_name=>'CCQTY'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Ccqty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.900'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528348198381120)
,p_db_column_name=>'DABALANCE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Dabalance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.900'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528309614381120)
,p_db_column_name=>'DAQTY'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Daqty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.900'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528976437381120)
,p_db_column_name=>'FLAT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Flat'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528908790381120)
,p_db_column_name=>'LS'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Ls'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486529054607381120)
,p_db_column_name=>'MS'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Ms'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486527962642381120)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486527637485381120)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486529241036381120)
,p_db_column_name=>'PIPES'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Pipes'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486527561841381120)
,p_db_column_name=>'SALESCONFIRMDATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sales Confirm Date'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486527444509381120)
,p_db_column_name=>'SALESCONFIRMNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Sales Confirm No'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486529329465381120)
,p_db_column_name=>'SCP'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Scp'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528032427381120)
,p_db_column_name=>'SCQTY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Scqty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.900'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528148501381120)
,p_db_column_name=>'SOQTY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Soqty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.900'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486529601468381120)
,p_db_column_name=>'STATUS'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486529135559381120)
,p_db_column_name=>'STRIPS'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Strips'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486527820886381120)
,p_db_column_name=>'TNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528658831381120)
,p_db_column_name=>'TNO1'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Tno1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486528495574381120)
,p_db_column_name=>'WTQTY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Wtqty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999.900'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1486549205692385224)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'SALESCONFIRMNO:SALESCONFIRMDATE:PARTYNAME:BALANCEQTY:TNO:PARTYCODE:SCQTY:SOQTY:DAQTY:DABALANCE:WTQTY:CCQTY:TNO1:BEAM:LS:FLAT:MS:STRIPS:PIPES:SCP:BP:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1483700100982088131)
,p_plug_name=>'Sales Quotation 360 Register'
,p_static_id=>'sales-confirmation-register'
,p_region_name=>'p730Sc360Register'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>65
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Scope As (',
'  Select sc.TNo,sc.SalesConfirmNo,sc.SalesConfirmDate,sc.PartyCode',
'    From SLC_SalesConfirm sc',
'   Where sc.SalesConfirmDate >= to_date(:P721_FROMDATE,''DD-MM-RRRR'')',
'     And sc.SalesConfirmDate <  to_date(:P721_TODATE,''DD-MM-RRRR'')+1',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'     And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'     And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)),',
'CurrentStatus As (',
'  Select ModuleCode,ModuleTNo,DocumentStatusCode',
'    From (Select d.ModuleCode,d.ModuleTNo,d.DocumentStatusCode,',
'                 Row_Number() Over(Partition By d.ModuleCode,d.ModuleTNo Order By d.StatusTime Desc Nulls Last,d.TNo Desc) rn',
'            From DocumentStatusDetail d',
'           Where d.ModuleCode In (''SalesOrder'',''DespatchAdvice'',''CCInvoice''))',
'   Where rn=1),',
'Confirmed As (',
'  Select d.TNo,Sum(Nvl(d.Quantity1,0)) Qty',
'    From SLC_SalesConfirmDetail d Join Scope s On s.TNo=d.TNo Group By d.TNo),',
'Ordered As (',
'  Select so.SalesConfirmTNo TNo,Sum(Nvl(d.Quantity1,0)) Qty',
'    From SLC_SalesOrder so Join Scope s On s.TNo=so.SalesConfirmTNo',
'    Join SalesOrderDetail d On d.TNo=so.TNo',
'    Left Join CurrentStatus cs On cs.ModuleCode=''SalesOrder'' And cs.ModuleTNo=so.TNo',
'   Where cs.DocumentStatusCode=''ACTIVE'' Or cs.ModuleTNo Is Null',
'   Group By so.SalesConfirmTNo),',
'Dispatched As (',
'  Select so.SalesConfirmTNo TNo,Sum(Nvl(d.Quantity1,0)) Qty',
'    From SLC_SalesOrder so Join Scope s On s.TNo=so.SalesConfirmTNo',
'    Join SLC_DespatchAdvice da On da.SalesOrderTNo=so.TNo',
'    Join DespatchAdviceDetail d On d.TNo=da.TNo',
'    Left Join CurrentStatus cs On cs.ModuleCode=''DespatchAdvice'' And cs.ModuleTNo=da.TNo',
'   Where cs.DocumentStatusCode=''ACTIVE'' Or cs.ModuleTNo Is Null',
'   Group By so.SalesConfirmTNo),',
'Invoiced As (',
'  Select so.SalesConfirmTNo TNo,Sum(Nvl(d.Quantity1,0)) Qty',
'    From SLC_SalesOrder so Join Scope s On s.TNo=so.SalesConfirmTNo',
'    Join SLC_CCInvoice ci On ci.SalesOrderTNo=so.TNo',
'    Join SLC_CCInvoiceDetail d On d.TNo=ci.TNo',
'    Left Join CurrentStatus cs On cs.ModuleCode=''CCInvoice'' And cs.ModuleTNo=ci.TNo',
'   Where cs.DocumentStatusCode=''ACTIVE'' Or cs.ModuleTNo Is Null',
'   Group By so.SalesConfirmTNo)',
'Select ''<a href="''||apex_page.get_url(p_page=>722,p_clear_cache=>''722'',p_items=>''P722_TNO'',p_values=>s.TNo)||''">''',
'         ||apex_escape.html(s.SalesConfirmNo)||''</a>'' QUOTATION,',
'       s.SalesConfirmDate CONFIRM_DATE,',
'       GetPartyName(s.PartyCode) CUSTOMER,',
'       Round(Nvl(c.Qty,0),3) CONFIRMED_QTY,',
'       Round(Nvl(o.Qty,0),3) ORDERED_QTY,',
'       Round(Nvl(d.Qty,0),3) DISPATCH_QTY,',
'       Round(Nvl(i.Qty,0),3) INVOICED_QTY,',
'       Round(Greatest(Nvl(c.Qty,0)-Nvl(i.Qty,0),0),3) BALANCE_QTY,',
'       trunc(sysdate-s.SalesConfirmDate) AGE_DAYS,',
'       ''<span class="ds-pill ds-pill--''||',
'         Case When Nvl(c.Qty,0)=0 Then ''bad">Quantity data gap''',
'              When Greatest(Nvl(c.Qty,0)-Nvl(i.Qty,0),0)<=0.0005 Then ''good">Complete''',
'              When Nvl(o.Qty,0)=0 Then ''bad">Awaiting Order''',
'              When Nvl(d.Qty,0)=0 Then ''warn">Awaiting Dispatch''',
'              When Nvl(i.Qty,0)=0 Then ''warn">Awaiting Invoice''',
'              Else ''info">Part Fulfilled'' End||''</span>'' STATUS',
'  From Scope s',
'  Left Join Confirmed c On c.TNo=s.TNo',
'  Left Join Ordered o On o.TNo=s.TNo',
'  Left Join Dispatched d On d.TNo=s.TNo',
'  Left Join Invoiced i On i.TNo=s.TNo',
' Order By s.SalesConfirmDate Desc, s.SalesConfirmNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1483700114632088131)
,p_no_data_found_message=>'No sales quotations in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>49241604440790881
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483701089886088132)
,p_db_column_name=>'AGE_DAYS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Age (days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483700939630088132)
,p_db_column_name=>'BALANCE_QTY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Balance Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483700538823088131)
,p_db_column_name=>'CONFIRMED_QTY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Quoted Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483700327337088131)
,p_db_column_name=>'CONFIRM_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Confirmed On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483700440911088131)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483700710968088131)
,p_db_column_name=>'DISPATCH_QTY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dispatch Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483700873606088131)
,p_db_column_name=>'INVOICED_QTY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Invoiced Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483700645513088131)
,p_db_column_name=>'ORDERED_QTY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Ordered Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483700283039088131)
,p_db_column_name=>'QUOTATION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Quotation'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483701200941088132)
,p_db_column_name=>'STATUS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1483953290211370718)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'QUOTATION:CONFIRM_DATE:CUSTOMER:CONFIRMED_QTY:ORDERED_QTY:DISPATCH_QTY:INVOICED_QTY:BALANCE_QTY:AGE_DAYS:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1486529615569381121)
,p_plug_name=>'Sales Order Register'
,p_static_id=>'sales-order-follow-up'
,p_region_name=>'p730SoRegister'
,p_region_css_classes=>'ds-register ds-slc-kpireg ds-reg-hidden'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Scope As (',
'  Select so.*',
'    From SLC_SalesOrder so',
'   Where :P721_REGISTER_FOCUS In (''SO'',''SO_PENDING'')',
'     And so.SalesOrderDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'     And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or so.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'     And (:P721_COMPANY Is Null Or so.CompanyCode=:P721_COMPANY)',
'     And (:P721_LOCATION Is Null Or so.LocationCode=:P721_LOCATION)',
'     And (:P721_PANEL Is Null Or so.Panel=:P721_PANEL)',
'     And (:P721_REGISTER_FOCUS<>''SO_PENDING'' Or Not Exists (Select 1 From SLC_DespatchAdvice da Where da.SalesOrderTNo=so.TNo))),',
'Footer As (',
'  Select f.TNo,f.SNo,',
'         Sum(Case When f.FooterHeadCode=''.CGST.'' Then f.FooterValue Else 0 End) CGST,',
'         Sum(Case When f.FooterHeadCode=''.SGST.'' Then f.FooterValue Else 0 End) SGST,',
'         Sum(Case When f.FooterHeadCode=''.IGST.'' Then f.FooterValue Else 0 End) IGST,',
'         Sum(Case When f.FooterHeadCode=''.TCS.'' Then f.FooterValue Else 0 End) TCS',
'    From SalesOrderDetailFooter f Join Scope s On s.TNo=f.TNo',
'   Group By f.TNo,f.SNo),',
'Movement As (',
'  Select h.SalesOrderTNo ReferenceTNo,d.ItemCode,d.ItemSpecificationCode,',
'         Sum(Case When h.DocTypeCode=''CHALAN'' Then d.Quantity1 Else 0 End) DespatchQuantity,',
'         Sum(Case When h.DocTypeCode=''CHALANCUMINVOICE'' Then d.Quantity1 Else 0 End) InvoiceQuantity',
'    From SLC_CCInvoice h Join SLC_CCInvoiceDetail d On d.TNo=h.TNo',
'    Join Scope s On s.TNo=h.SalesOrderTNo',
'   Group By h.SalesOrderTNo,d.ItemCode,d.ItemSpecificationCode),',
'CurrentStatus As (',
'  Select ModuleTNo,DocumentStatusCode',
'    From (Select d.ModuleTNo,d.DocumentStatusCode,',
'                 Row_Number() Over(Partition By d.ModuleTNo Order By d.StatusTime Desc Nulls Last,d.TNo Desc) rn',
'            From DocumentStatusDetail d Join Scope s On s.TNo=d.ModuleTNo',
'           Where d.ModuleCode=''SalesOrder'')',
'   Where rn=1)',
'Select Row_Number() Over(Order By s.SalesOrderDate Desc,s.SalesOrderNo Desc,d.SNo) SNo,',
'       s.TNo,',
'       ''<a href="''||apex_page.get_url(p_page=>723,p_clear_cache=>''723'',p_items=>''P723_TNO'',p_values=>s.TNo)||''">''||apex_escape.html(s.SalesOrderNo)||''</a>'' SalesOrderNo,',
'       s.SalesOrderDate,',
'       pv.PartyName Vendor,pc.PartyName Consignee,ct.CityName,pa.PartyName Agent,',
'       s.PartyPONo,s.PartyPODate,s.ValidityUptoDate,',
'       d.ItemCode,i.ItemName,i.ItemName||'' ~ ''||isp.ItemSpecificationName Item,',
'       i.MeasuringUnitCode1 UOM,d.Quantity1,Nvl(d.PackingTypeCode,i.MeasuringUnitCode2) UOM2,d.Quantity2,',
'       d.Rate,d.Amount,Nvl(f.CGST,0) CGST,Nvl(f.SGST,0) SGST,Nvl(f.IGST,0) IGST,Nvl(f.TCS,0) TCS,',
'       d.FooterAmount,',
'       d.FooterAmount-(Nvl(f.CGST,0)+Nvl(f.SGST,0)+Nvl(f.IGST,0)+Nvl(f.TCS,0)) OtherAmount,',
'       d.TotalAmount,Nvl(m.DespatchQuantity,0) DespatchQuantity,Nvl(m.InvoiceQuantity,0) InvoiceQuantity,',
'       Nvl(d.Quantity1,d.Quantity2)-Nvl(Nvl(m.DespatchQuantity,m.InvoiceQuantity),0) BalanceQuantity,',
'       ft.FreightTypeName,',
'       Case When Nvl(d.Quantity1,0)-Nvl(m.InvoiceQuantity,0)>0 Then Trunc(sysdate)-s.ValidityUptoDate Else 0 End DueDays,',
'       Nvl(cs.DocumentStatusCode,''NONACTIVE'') Status,',
'       be.EmployeeName||'' ( ''||s.Creator||'')'' Creator,s.CreationTime',
'  From Scope s Join SalesOrderDetail d On d.TNo=s.TNo',
'  Left Join Footer f On f.TNo=d.TNo And f.SNo=d.SNo',
'  Left Join Movement m On m.ReferenceTNo=d.TNo And m.ItemCode=d.ItemCode And m.ItemSpecificationCode=d.ItemSpecificationCode',
'  Left Join Item i On i.ItemCode=d.ItemCode',
'  Left Join SLC_ItemSpecification isp On isp.ItemSpecificationCode=d.ItemSpecificationCode',
'  Left Join Party pv On pv.PartyCode=s.PartyCode',
'  Left Join Party pc On pc.PartyCode=Nvl(s.ConsigneeCode,s.PartyCode)',
'  Left Join City ct On ct.CityCode=Nvl(pc.WorksCityCode,pc.OfficeCityCode)',
'  Left Join Party pa On pa.PartyCode=s.AgentCode',
'  Left Join FreightType ft On ft.FreightTypeCode=s.FreightTypeCode',
'  Left Join BossUser bu On bu.LoginName=s.Creator',
'  Left Join Employee be On be.EmployeeCode=bu.EmployeeCode',
'  Left Join CurrentStatus cs On cs.ModuleTNo=s.TNo',
' Order By s.SalesOrderDate Desc,s.SalesOrderNo Desc,d.SNo'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1486529799566381121)
,p_no_data_found_message=>'No sales orders match this KPI and filter scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>52071289375083871
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530438742381121)
,p_db_column_name=>'AGENT'
,p_display_order=>60
,p_column_identifier=>'G'
,p_column_label=>'Agent'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531637230381122)
,p_db_column_name=>'AMOUNT'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532652905381122)
,p_db_column_name=>'BALANCEQUANTITY'
,p_display_order=>280
,p_column_identifier=>'AC'
,p_column_label=>'Balance Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531774743381122)
,p_db_column_name=>'CGST'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530324872381121)
,p_db_column_name=>'CITYNAME'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'City'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530302443381121)
,p_db_column_name=>'CONSIGNEE'
,p_display_order=>40
,p_column_identifier=>'E'
,p_column_label=>'Consignee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486533193203381122)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>330
,p_column_identifier=>'AH'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486533056976381122)
,p_db_column_name=>'CREATOR'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532416147381122)
,p_db_column_name=>'DESPATCHQUANTITY'
,p_display_order=>260
,p_column_identifier=>'AA'
,p_column_label=>'Despatch Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532869440381122)
,p_db_column_name=>'DUEDAYS'
,p_display_order=>300
,p_column_identifier=>'AE'
,p_column_label=>'Due Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532130318381122)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>230
,p_column_identifier=>'X'
,p_column_label=>'Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532739086381122)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>290
,p_column_identifier=>'AD'
,p_column_label=>'Freight Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531950738381122)
,p_db_column_name=>'IGST'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532582772381122)
,p_db_column_name=>'INVOICEQUANTITY'
,p_display_order=>270
,p_column_identifier=>'AB'
,p_column_label=>'Invoice Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531050170381122)
,p_db_column_name=>'ITEM'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530818094381121)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Item Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530970997381122)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>110
,p_column_identifier=>'L'
,p_column_label=>'Item Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532249338381122)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'Other Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530650315381121)
,p_db_column_name=>'PARTYPODATE'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Party PO Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530571743381121)
,p_db_column_name=>'PARTYPONO'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Party PO No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531285407381122)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Quantity 1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531461562381122)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>160
,p_column_identifier=>'Q'
,p_column_label=>'Quantity 2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531588713381122)
,p_db_column_name=>'RATE'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530095717381121)
,p_db_column_name=>'SALESORDERDATE'
,p_display_order=>20
,p_column_identifier=>'C'
,p_column_label=>'Sales Order Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530006070381121)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>10
,p_column_identifier=>'B'
,p_column_label=>'Sales Order No'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531865775381122)
,p_db_column_name=>'SGST'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486529848966381121)
,p_db_column_name=>'SNO'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'S No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532956071381122)
,p_db_column_name=>'STATUS'
,p_display_order=>310
,p_column_identifier=>'AF'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532089783381122)
,p_db_column_name=>'TCS'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486533259639381122)
,p_db_column_name=>'TNO'
,p_display_order=>340
,p_column_identifier=>'AI'
,p_column_label=>'Transaction No'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486532320085381122)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>250
,p_column_identifier=>'Z'
,p_column_label=>'Total Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531159206381122)
,p_db_column_name=>'UOM'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486531347217381122)
,p_db_column_name=>'UOM2'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'UOM 2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530801572381121)
,p_db_column_name=>'VALIDITYUPTODATE'
,p_display_order=>90
,p_column_identifier=>'J'
,p_column_label=>'Validity Upto Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486530181911381121)
,p_db_column_name=>'VENDOR'
,p_display_order=>30
,p_column_identifier=>'D'
,p_column_label=>'Vendor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1486549772438385226)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'SNO:SALESORDERNO:SALESORDERDATE:VENDOR:CONSIGNEE:CITYNAME:AGENT:PARTYPONO:PARTYPODATE:VALIDITYUPTODATE:ITEMCODE:ITEMNAME:ITEM:UOM:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:FOOTERAMOUNT:OTHERAMOUNT:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUA'
||'NTITY:BALANCEQUANTITY:FREIGHTTYPENAME:DUEDAYS:STATUS:CREATOR:CREATIONTIME:TNO'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1482185826366676305)
,p_name=>'Lifecycle Trend'
,p_static_id=>'sales-trend'
,p_template=>4072358936313175081
,p_display_sequence=>35
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F, to_date(:P721_TODATE,''DD-MM-RRRR'') + 1 T From dual),',
'ds_chart_ordered As (',
'  Select to_char(Trunc(x.dt,''MM''),''Mon-RR'') MONTH_LABEL,',
'         Round(Sum(x.conf)/1e7,2) CONFIRMED_CR,',
'         Round(Sum(x.so)/1e7,2) ORDER_CR,',
'         Round(Sum(x.inv)/1e7,2) INVOICED_CR,',
'         Trunc(x.dt,''MM'') SORT_KEY',
'    From (',
'      Select a.SalesConfirmDate dt, d.Amount conf, 0 so, 0 inv',
'        From SLC_SalesConfirm a Join SLC_SalesConfirmDetail d On d.TNo=a.TNo Cross Join Win w',
'       Where a.SalesConfirmDate >= w.F And a.SalesConfirmDate < w.T',
'         And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'         And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'         And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'         And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)',
'      Union All',
'      Select a.SalesOrderDate, 0, d.Amount, 0',
'        From SLC_SalesOrder a Join SalesOrderDetail d On d.TNo=a.TNo Cross Join Win w',
'       Where a.SalesOrderDate >= w.F And a.SalesOrderDate < w.T',
'         And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'         And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'         And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'         And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)',
'      Union All',
'      Select a.CCInvoiceDate, 0, 0, d.Amount',
'        From SLC_CCInvoice a Join SLC_CCInvoiceDetail d On d.TNo=a.TNo Cross Join Win w',
'       Where a.CCInvoiceDate >= w.F And a.CCInvoiceDate < w.T',
'         And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'         And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY)',
'         And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION)',
'         And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)',
'    ) x',
'   Group By Trunc(x.dt,''MM'')',
'   Order By SORT_KEY',
'),',
'ds_chart_q As (',
'  Select ordered_q.*, rownum ds_ord',
'    From ds_chart_ordered ordered_q',
')',
'Select',
'  ''<div class="ds-fast-chart" data-chart-type="line" aria-label="Lifecycle Trend"><script type="application/json" class="ds-fast-chart-data">'' ||',
'  replace(',
'    json_object(',
'      ''unit'' value ''Rs Cr'',',
'      ''series'' value json_array(''Confirmed (Rs Cr)'', ''Invoiced (Rs Cr)'', ''Ordered (Rs Cr)'' returning clob) format json,',
'      ''rows'' value json_arrayagg(',
'        json_object(''l'' value to_char(q.SORT_KEY),',
'                    ''values'' value json_array(q.CONFIRMED_CR, q.INVOICED_CR, q.ORDER_CR returning clob) format json,',
'                    ''u'' value null',
'                    returning clob)',
'        order by q.ds_ord returning clob) format json',
'      returning clob),',
'    ''<'', ''\\u003c''',
'  ) || ''</script></div>'' As CHART_ROW',
'From ds_chart_q q'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No data for the current filters.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1483437236391395140)
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
 p_id=>wwv_flow_imp.id(1487578062871751380)
,p_plug_name=>'Sales Quotation Balance Register'
,p_static_id=>'sc-balance-register'
,p_region_name=>'p730ScBalanceRegister'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'[#DEFAULT# t-Region--scrollBody]'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>64
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<a href="''||apex_page.get_url(p_page=>722,p_clear_cache=>''722'',p_items=>''P722_TNO'',p_values=>b.TNo)||''">''||apex_escape.html(b.SalesConfirmNo)||''</a>'' Quotation,',
'       b.SalesConfirmDate Confirm_Date,b.PartyName Customer,',
'       Round(b.ScQty,3) Confirmed_Qty,Round(b.SoQty,3) Ordered_Qty,',
'       Round(b.DaQty,3) Dispatch_Qty,Round(b.CcQty,3) Invoice_Qty,',
'       Round(b.BalanceQty,3) Balance_Qty,Trunc(sysdate-b.SalesConfirmDate) Age_Days,',
'       Case When nvl(b.SoQty,0)=0 Then ''Awaiting order''',
'            When nvl(b.DaQty,0)=0 Then ''Awaiting dispatch''',
'            When nvl(b.CcQty,0)=0 Then ''Awaiting invoice'' Else ''Part fulfilled'' End Status',
'  From SLC_SCBalance b Join SLC_SalesConfirm sc On sc.TNo=b.TNo',
' Where b.BalanceQty>0',
'   And sc.SalesConfirmDate>=to_date(:P721_FROMDATE,''DD-MM-RRRR'')',
'   And sc.SalesConfirmDate<to_date(:P721_TODATE,''DD-MM-RRRR'')+1',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY)',
'   And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION)',
'   And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)',
' Order By b.SalesConfirmDate Desc,b.SalesConfirmNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1487578148113751380)
,p_no_data_found_message=>'No open sales quotation balance in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>53119637922454130
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487579016431751381)
,p_db_column_name=>'AGE_DAYS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Age (d)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487578920257751381)
,p_db_column_name=>'BALANCE_QTY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Balance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487578550060751381)
,p_db_column_name=>'CONFIRMED_QTY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Confirmed'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487578342094751381)
,p_db_column_name=>'CONFIRM_DATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Confirmed On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487578492642751381)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487578757976751381)
,p_db_column_name=>'DISPATCH_QTY'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Dispatched'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487578890566751381)
,p_db_column_name=>'INVOICE_QTY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Invoiced'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487578672079751381)
,p_db_column_name=>'ORDERED_QTY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Ordered'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487578258858751381)
,p_db_column_name=>'QUOTATION'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Quotation'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487579186867751381)
,p_db_column_name=>'STATUS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1488090429904052868)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'QUOTATION:CONFIRM_DATE:CUSTOMER:CONFIRMED_QTY:ORDERED_QTY:DISPATCH_QTY:INVOICE_QTY:BALANCE_QTY:AGE_DAYS:STATUS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1481690413360482423)
,p_plug_name=>'Stage Documents'
,p_static_id=>'stage-detail'
,p_region_name=>'p730StageDetail'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>44
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Win As (',
'  Select to_date(:P721_FROMDATE,''DD-MM-RRRR'') F, to_date(:P721_TODATE,''DD-MM-RRRR'') T From dual)',
'Select ''Sales Quotation'' STAGE, ''<a href="''||apex_page.get_url(p_page=>722,p_clear_cache=>''722'',p_items=>''P722_TNO'',p_values=>sc.TNo)||''">''||apex_escape.html(sc.SalesConfirmNo)||''</a>'' DOC_NO, sc.SalesConfirmDate DOC_DATE, GetPartyName(sc.PartyCode) '
||'PARTY, Cast(Null As Varchar2(30)) VEHICLE, sc.SalesConfirmAmount DOC_VALUE,',
'       Trunc(sysdate-sc.SalesConfirmDate) AGE_DAYS,Cast(Null As Varchar2(120)) RELATED_DOCUMENT,',
'       Case When :P721_STAGE_FOCUS=''H1'' Then ''Waiting for Sales Order'' Else ''Quotation recorded'' End STATUS,',
'       Case When :P721_STAGE_FOCUS=''H1'' Then ''Create or link Sales Order; verify customer, items, quantity, rate and validity'' Else ''Review customer commitment and confirmation status'' End NEXT_ACTION',
'  From SLC_SalesConfirm sc Cross Join Win w',
' Where :P721_STAGE_FOCUS In (''10'',''H1'') And sc.SalesConfirmDate Between w.F And w.T',
'   And (:P721_STAGE_FOCUS<>''H1'' Or Not Exists (Select 1 From SLC_SalesOrder x Where x.SalesConfirmTNo=sc.TNo))',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or sc.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or sc.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or sc.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or sc.Panel=:P721_PANEL)',
'Union All',
'Select ''Sales Order'', ''<a href="''||apex_page.get_url(p_page=>723,p_clear_cache=>''723'',p_items=>''P723_TNO'',p_values=>so.TNo)||''">''||apex_escape.html(so.SalesOrderNo)||''</a>'', so.SalesOrderDate, GetPartyName(so.PartyCode), so.VehicleNo, so.SalesOrderAm'
||'ount,',
'       Trunc(sysdate-so.SalesOrderDate),(Select Max(sc.SalesConfirmNo) From SLC_SalesConfirm sc Where sc.TNo=so.SalesConfirmTNo),',
'       Case When :P721_STAGE_FOCUS=''H2'' Then ''Waiting for Dispatch Advice'' Else ''Order booked'' End,',
'       Case When :P721_STAGE_FOCUS=''H2'' Then ''Schedule dispatch; verify balance quantity, validity, vehicle and customer readiness'' Else ''Review fulfilment and order balance'' End',
'  From SLC_SalesOrder so Cross Join Win w',
' Where :P721_STAGE_FOCUS In (''20'',''H2'') And so.SalesOrderDate Between w.F And w.T',
'   And (:P721_STAGE_FOCUS<>''H2'' Or Not Exists (Select 1 From SLC_DespatchAdvice x Where x.SalesOrderTNo=so.TNo))',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or so.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or so.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or so.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or so.Panel=:P721_PANEL)',
'Union All',
'Select ''Dispatch Advice'', ''<a href="''||apex_page.get_url(p_page=>161,p_clear_cache=>''161'',p_items=>''P161_TNO'',p_values=>da.TNo)||''">''||apex_escape.html(da.DespatchAdviceNo)||''</a>'', da.DespatchAdviceDate, GetPartyName(da.PartyCode), da.VehicleNo,',
'       Nvl((Select Max(Nvl(w2.NetWeight,Abs(w2.SecondWeight-w2.FirstWeight))) From SLC_Weighment w2 Where w2.ReferenceTNo=da.TNo),',
'           (Select Sum(d.Quantity1) From DespatchAdviceDetail d Where d.TNo=da.TNo)),',
'       Trunc(sysdate-da.DespatchAdviceDate),(Select Max(so.SalesOrderNo) From SLC_SalesOrder so Where so.TNo=da.SalesOrderTNo),',
'       Case When :P721_STAGE_FOCUS=''H3'' Then ''Vehicle not gated in'' When :P721_STAGE_FOCUS=''H4'' Then ''Gate-out completed; invoice missing'' Else ''Vehicle planned'' End,',
'       Case When :P721_STAGE_FOCUS=''H3'' Then ''Contact transporter/driver and verify planned arrival'' When :P721_STAGE_FOCUS=''H4'' Then ''Create CC invoice and reconcile weight, quantity and tax details'' Else ''Track gate arrival and vehicle readiness'' E'
||'nd',
'  From SLC_DespatchAdvice da Cross Join Win w',
' Where (:P721_STAGE_FOCUS=''30''',
'        Or (:P721_STAGE_FOCUS=''H3'' And Not Exists (Select 1 From SLC_MaterialOut x Where x.ReferenceTNo=da.TNo))',
'        Or (:P721_STAGE_FOCUS=''H4'' And Exists (Select 1 From SLC_MaterialOut x Where x.ReferenceTNo=da.TNo And x.GateOutTime Is Not Null)',
'            And Not Exists (Select 1 From SLC_CCInvoice x Where x.DespatchAdviceTNo=da.TNo)))',
'   And da.DespatchAdviceDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or da.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or da.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or da.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or da.Panel=:P721_PANEL)',
'Union All',
'Select ''Gate (Material Out)'', ''<a href="''||apex_page.get_url(p_page=>168,p_clear_cache=>''168'',p_items=>''P168_TNO,P168_FORMSTATUS'',p_values=>mo.TNo||'',EDITRECORD'')||''">''||apex_escape.html(mo.MaterialOutNo)||''</a>'', mo.MaterialOutDate, GetPartyName(mo.'
||'PartyCode), mo.VehicleNo,',
'       (Select Max(Nvl(w2.NetWeight,Abs(w2.SecondWeight-w2.FirstWeight))) From SLC_Weighment w2 Where w2.ReferenceTNo=mo.ReferenceTNo),',
'       Trunc(sysdate-mo.MaterialOutDate),(Select Max(da.DespatchAdviceNo) From SLC_DespatchAdvice da Where da.TNo=mo.ReferenceTNo),',
'       Case When mo.GateOutTime Is Null Then ''Vehicle inside'' Else ''Gate completed'' End,',
'       Case When mo.GateOutTime Is Null Then ''Complete weighment and gate-out'' Else ''Verify downstream invoice'' End',
'  From SLC_MaterialOut mo Cross Join Win w',
' Where :P721_STAGE_FOCUS=''40'' And mo.MaterialOutDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)',
'Union All',
'Select ''Weighment'', ''<a href="''||apex_page.get_url(p_page=>133,p_clear_cache=>''133'',p_items=>''P133_TNO'',p_values=>w2.TNo)||''">''||apex_escape.html(w2.WeighmentNo)||''</a>'', w2.WeighmentDate, GetPartyName(w2.PartyCode), w2.VehicleNo, w2.NetWeight,',
'       Trunc(sysdate-w2.WeighmentDate),(Select Max(da.DespatchAdviceNo) From SLC_DespatchAdvice da Where da.TNo=w2.ReferenceTNo),',
'       Case When w2.SecondWeight Is Null Then ''Final weight pending'' Else ''Weighment complete'' End,',
'       Case When w2.SecondWeight Is Null Then ''Record second weight'' Else ''Proceed to gate-out / invoice'' End',
'  From SLC_Weighment w2 Cross Join Win w',
' Where :P721_STAGE_FOCUS=''50'' And w2.WeighmentDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or w2.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or w2.CompanyCode=:P721_COMPANY) And (:P721_PANEL Is Null Or w2.Panel=:P721_PANEL)',
'Union All',
'Select ''Invoice'', ''<a href="''||apex_page.get_url(p_page=>175,p_clear_cache=>''175'',p_items=>''P175_TNO,P175_FORMSTATUS'',p_values=>ci.TNo||'',EDITRECORD'')||''">''||apex_escape.html(ci.CCInvoiceNo)||''</a>'', ci.CCInvoiceDate, GetPartyName(ci.PartyCode), ci.V'
||'ehicleNo, ci.CCInvoiceAmount,',
'       Trunc(sysdate-ci.CCInvoiceDate),(Select Max(so.SalesOrderNo) From SLC_SalesOrder so Where so.TNo=ci.SalesOrderTNo),',
'       Case When :P721_STAGE_FOCUS=''H5'' Then ''Invoice posted; IRN missing'' Else ''CC invoice posted'' End,',
'       Case When :P721_STAGE_FOCUS=''H5'' Then ''Generate or retry IRN; validate GSTIN, payload and portal error'' Else ''Review invoice and e-invoice status'' End',
'  From SLC_CCInvoice ci Cross Join Win w',
' Where :P721_STAGE_FOCUS In (''60'',''H5'') And ci.CCInvoiceDate Between w.F And w.T',
'   And (:P721_STAGE_FOCUS<>''H5'' Or Not Exists (Select 1 From SLC_EInvoice x Where x.CCInvoiceTNo=ci.TNo And x.IRN Is Not Null))',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
'Union All',
'Select ''E-Invoice'', ''<a href="''||apex_page.get_url(p_page=>182,p_clear_cache=>''182'',p_items=>''P182_TNO'',p_values=>e.TNo)||''">''||apex_escape.html(e.Irn)||''</a>'', e.AckDate, GetPartyName(ci.PartyCode), ci.VehicleNo, ci.CCInvoiceAmount,',
'       Trunc(sysdate-ci.CCInvoiceDate),ci.CCInvoiceNo,''IRN generated'',''Monitor e-way bill validity and exceptions''',
'  From SLC_EInvoice e Join SLC_CCInvoice ci On ci.TNo=e.CCInvoiceTNo Cross Join Win w',
' Where :P721_STAGE_FOCUS=''70'' And ci.CCInvoiceDate Between w.F And w.T',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1481690529487482424)
,p_no_data_found_message=>'Click a stage in the funnel or a bottleneck card above to list its documents here.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47232019296185174
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486541032927381168)
,p_db_column_name=>'AGE_DAYS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Age (days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481690824590482449)
,p_db_column_name=>'DOC_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
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
 p_id=>wwv_flow_imp.id(1481690712590482448)
,p_db_column_name=>'DOC_NO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Document No'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481691189393482449)
,p_db_column_name=>'DOC_VALUE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Value / Net Wt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486541371108381168)
,p_db_column_name=>'NEXT_ACTION'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Recommended Next Action'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481690912401482449)
,p_db_column_name=>'PARTY'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486541120773381168)
,p_db_column_name=>'RELATED_DOCUMENT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Related Document'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481690638971482448)
,p_db_column_name=>'STAGE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Stage'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1486541236805381168)
,p_db_column_name=>'STATUS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Current Position'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1481691105447482449)
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
 p_id=>wwv_flow_imp.id(1482190766384748647)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'STAGE:DOC_NO:DOC_DATE:PARTY:VEHICLE:DOC_VALUE:AGE_DAYS:RELATED_DOCUMENT:STATUS:NEXT_ACTION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1484456449620854935)
,p_plug_name=>'How to use this dashboard'
,p_static_id=>'start-here'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>12
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-slc-guide" aria-label="How to use the Sales Lifecycle Control Tower">',
'  <div class="ds-slc-guide-step"><span class="ds-slc-guide-no">1</span><span class="ds-slc-guide-copy"><b>Set the scope</b><span>Choose period, company and location, then Apply. Header chips confirm the active view.</span></span></div>',
'  <div class="ds-slc-guide-step"><span class="ds-slc-guide-no">2</span><span class="ds-slc-guide-copy"><b>Read left to right</b><span>Use the lifecycle funnel to see volume and value through quotation, order, dispatch, gate, invoice and IRN.</span></'
||'span></div>',
'  <div class="ds-slc-guide-step"><span class="ds-slc-guide-no">3</span><span class="ds-slc-guide-copy"><b>Act on delays</b><span>Click a bottleneck or lollipop row for its documents, then work the ranked Exception Register and 360 drills.</span></spa'
||'n></div>',
'  <nav class="ds-slc-lenses" aria-label="Jump to a dashboard view"><span>Go to</span><a href="#p730Executive"><span class="fa fa-line-chart"></span>Executive pulse</a><a href="#p730Action"><span class="fa fa-exclamation-triangle"></span>Operations ac'
||'tion centre</a><a href="#p730Commercial"><span class="fa fa-bar-chart"></span>Commercial analytics</a><a href="#p730Exceptions"><span class="fa fa-list-alt"></span>Exception register</a></nav>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482187628350676336)
,p_plug_name=>'Top Customers'
,p_static_id=>'top-customers'
,p_region_name=>'p730TopCust'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>63
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<a href="''||apex_page.get_url(p_page=>910,p_clear_cache=>''910'',p_items=>''P910_PARTY,P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION'',p_values=>ci.PartyCode||'',''||:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION)'
||'||''">''||apex_escape.html(GetPartyName(ci.PartyCode))||''</a>'' CUSTOMER,',
'       Round(Sum(d.Amount)/1e7,2) VAL_CR,',
'       Round(Sum(d.Quantity1)) QTY,',
'       Count(Distinct ci.TNo) INVOICES,',
'       Count(Distinct ci.SalesOrderTNo) ORDERS',
'  From SLC_CCInvoice ci Join SLC_CCInvoiceDetail d On d.TNo=ci.TNo',
' Where ci.CCInvoiceDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY)',
'   And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION)',
'   And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
' Group By ci.PartyCode',
' Order By Sum(d.Amount) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1482187780985676336)
,p_no_data_found_message=>'No sales in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47729270794379086
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482187876776676336)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482188124749676336)
,p_db_column_name=>'INVOICES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Invoices'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482188212070676336)
,p_db_column_name=>'ORDERS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Orders'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482188074617676336)
,p_db_column_name=>'QTY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482187971533676336)
,p_db_column_name=>'VAL_CR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Value (Cr)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1482193200895748651)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'CUSTOMER:VAL_CR:QTY:INVOICES:ORDERS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1482186943401676336)
,p_plug_name=>'Item Performance'
,p_static_id=>'top-items'
,p_region_name=>'p730TopItems'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>62
,p_plug_grid_column_span=>12
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<a href="''||apex_page.get_url(p_page=>726,p_clear_cache=>''726'',p_items=>''P726_ITEMCODE'',p_values=>d.ItemCode)||''">''||GetItemName(d.ItemCode)||''</a>'' ITEM,',
'       Round(Sum(d.Amount)/1e7,2) VAL_CR,',
'       Round(Sum(d.Quantity1)) QTY,',
'       Count(Distinct ci.TNo) INVOICES,',
'       Count(Distinct ci.PartyCode) CUSTOMERS',
'  From SLC_CCInvoice ci Join SLC_CCInvoiceDetail d On d.TNo=ci.TNo',
' Where ci.CCInvoiceDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or ci.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or ci.CompanyCode=:P721_COMPANY)',
'   And (:P721_LOCATION Is Null Or ci.LocationCode=:P721_LOCATION)',
'   And (:P721_PANEL Is Null Or ci.Panel=:P721_PANEL)',
' Group By d.ItemCode',
' Order By Sum(d.Amount) Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1482187046240676336)
,p_no_data_found_message=>'No sales in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>47728536049379086
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482187535218676336)
,p_db_column_name=>'CUSTOMERS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Customers'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482187483848676336)
,p_db_column_name=>'INVOICES'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Invoices'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482187147940676336)
,p_db_column_name=>'ITEM'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482187319414676336)
,p_db_column_name=>'QTY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1482187303439676336)
,p_db_column_name=>'VAL_CR'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Value (Cr)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1482192596003748651)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'ITEM:VAL_CR:QTY:INVOICES:CUSTOMERS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1483701246715088132)
,p_plug_name=>'Vehicle 360 Register'
,p_static_id=>'vehicle-360-register'
,p_region_name=>'p730VehicleRegister'
,p_region_css_classes=>'ds-register'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>66
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With RefRank As (',
'  Select w.*, Row_Number() Over (Partition By w.ReferenceTNo Order By w.WeighmentDate Desc,w.TNo Desc) rn',
'    From SLC_Weighment w Where w.ReferenceTNo Is Not Null),',
'DaRank As (',
'  Select w.*, Row_Number() Over (Partition By w.DespatchAdviceTNo Order By w.WeighmentDate Desc,w.TNo Desc) rn',
'    From SLC_Weighment w Where w.DespatchAdviceTNo Is Not Null),',
'SoRank As (',
'  Select w.*, Row_Number() Over (Partition By w.SalesOrderTNo Order By w.WeighmentDate Desc,w.TNo Desc) rn',
'    From SLC_Weighment w Where w.SalesOrderTNo Is Not Null)',
'Select Case When mo.VehicleNo Is Not Null Then',
'         ''<a href="''||apex_page.get_url(p_page=>724,p_clear_cache=>''724'',p_items=>''P724_VEHICLE'',p_values=>mo.VehicleNo)||''">''',
'         ||apex_escape.html(mo.VehicleNo)||''</a>'' Else ''-'' End VEHICLE,',
'       mo.MaterialOutNo GATE_PASS,',
'       da.DespatchAdviceNo DISPATCH_ADVICE,',
'       Case When so.TNo Is Not Null Then so.SalesOrderNo',
'            When iut.TNo Is Not Null Then ''Inter-unit: ''||iut.InterunittransferNo End SALES_ORDER,',
'       GetPartyName(Nvl(mo.PartyCode,da.PartyCode)) CUSTOMER,',
'       mo.GateInTime GATE_IN,',
'       mo.GateOutTime GATE_OUT,',
'       Case When mo.GateInTime Is Not Null Then Round((Nvl(mo.GateOutTime,sysdate)-mo.GateInTime)*24,1) End DWELL_HRS,',
'       Coalesce(wr.WeighmentNo,wd.WeighmentNo,ws.WeighmentNo) WEIGHMENT_NO,',
'       Coalesce(wr.FirstWeight,wd.FirstWeight,ws.FirstWeight) FIRST_WEIGHT,',
'       Coalesce(wr.SecondWeight,wd.SecondWeight,ws.SecondWeight) SECOND_WEIGHT,',
'       Coalesce(wr.NetWeight,wd.NetWeight,ws.NetWeight) NET_WEIGHT,',
'       ''<span class="ds-pill ds-pill--''||',
'         Case When mo.GateInTime Is Null And mo.GateOutTime Is Not Null Then ''bad">Gate-in Missing''',
'              When mo.GateInTime Is Null Then ''muted">Gate Pending''',
'              When mo.GateOutTime Is Null And mo.GateInTime<=sysdate-2 Then ''bad">Gate-out Missing''',
'              When mo.GateOutTime Is Null Then ''warn">Inside''',
'              Else ''good">Completed'' End||''</span>'' STATUS',
'  From SLC_MaterialOut mo',
'  Left Join SLC_DespatchAdvice da On da.TNo=mo.ReferenceTNo',
'  Left Join SLC_SalesOrder so On so.TNo=da.SalesOrderTNo',
'  Left Join Interunittransfer iut On iut.TNo=da.ReferenceTNo',
'  Left Join RefRank wr On wr.rn=1 And wr.ReferenceTNo=da.TNo',
'  Left Join DaRank wd On wd.rn=1 And wd.DespatchAdviceTNo=da.TNo',
'  Left Join SoRank ws On ws.rn=1 And ws.SalesOrderTNo=so.TNo',
' Where mo.MaterialOutDate Between to_date(:P721_FROMDATE,''DD-MM-RRRR'') And to_date(:P721_TODATE,''DD-MM-RRRR'')',
'   And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'   And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY)',
'   And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION)',
'   And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)',
' Order By mo.MaterialOutDate Desc, mo.MaterialOutNo Desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
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
 p_id=>wwv_flow_imp.id(1483701357205088132)
,p_no_data_found_message=>'No vehicle movements in this scope.'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>49242847013790882
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483701869918088132)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483701618887088132)
,p_db_column_name=>'DISPATCH_ADVICE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Dispatch Advice'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483702178459088132)
,p_db_column_name=>'DWELL_HRS'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Dwell (h)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487579306990751382)
,p_db_column_name=>'FIRST_WEIGHT'
,p_display_order=>92
,p_column_identifier=>'J'
,p_column_label=>'First Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483701968647088132)
,p_db_column_name=>'GATE_IN'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Gate In'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483702055481088132)
,p_db_column_name=>'GATE_OUT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Gate Out'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-Mon HH24:MI'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483701555729088132)
,p_db_column_name=>'GATE_PASS'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Gate Pass'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487579439635751382)
,p_db_column_name=>'NET_WEIGHT'
,p_display_order=>96
,p_column_identifier=>'L'
,p_column_label=>'Net Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483701722636088132)
,p_db_column_name=>'SALES_ORDER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Sales Order'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1487579319421751382)
,p_db_column_name=>'SECOND_WEIGHT'
,p_display_order=>94
,p_column_identifier=>'K'
,p_column_label=>'Second Weight'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'FM999G99G99G99G99G99G99G99G99G99G99G99G99G99G99G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483702393369088132)
,p_db_column_name=>'STATUS'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483701493282088132)
,p_db_column_name=>'VEHICLE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Vehicle'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1483702309478088132)
,p_db_column_name=>'WEIGHMENT_NO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Weighment'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1483953828483370719)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'primary'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>20
,p_report_columns=>'VEHICLE:GATE_PASS:DISPATCH_ADVICE:SALES_ORDER:CUSTOMER:GATE_IN:GATE_OUT:DWELL_HRS:WEIGHMENT_NO:FIRST_WEIGHT:SECOND_WEIGHT:NET_WEIGHT:STATUS'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(1481937040418528679)
,p_name=>'Vehicle KPIs'
,p_static_id=>'vehicle-kpi'
,p_template=>4501440665235496320
,p_display_sequence=>51
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--4up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--hideNoPagination'
,p_grid_column_span=>12
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With K As (',
'  Select',
'    (Select Count(*) From SLC_MaterialOut a Where a.GateInTime > sysdate-2 And a.GateOutTime Is Null',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)) Inside,',
'    (Select Count(*) From SLC_Weighment a Where a.WeighmentDate > sysdate-2 And a.SecondWeight Is Null',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)) AwaitWeigh,',
'    (Select Round(Median((mo.GateOutTime-mo.GateInTime)*24),1) From SLC_MaterialOut mo',
'      Where mo.GateInTime Is Not Null And mo.GateOutTime Is Not Null And mo.GateOutTime > sysdate-90',
'        And (mo.GateOutTime-mo.GateInTime)*24 Between 0 And 72',
'        And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or mo.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'        And (:P721_COMPANY Is Null Or mo.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or mo.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or mo.Panel=:P721_PANEL)) MedDwell,',
'    (Select Count(*) From SLC_MaterialOut a Where a.GateInTime <= sysdate-2 And a.GateInTime > sysdate-400 And a.GateOutTime Is Null',
'       And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel=(Select SAGAR.GetUserPanelAB_apex() From dual))',
'       And (:P721_COMPANY Is Null Or a.CompanyCode=:P721_COMPANY) And (:P721_LOCATION Is Null Or a.LocationCode=:P721_LOCATION) And (:P721_PANEL Is Null Or a.Panel=:P721_PANEL)) StaleGate',
'  From dual)',
'Select Case x.Seq',
'  When 1 Then q''~<a href="javascript:void(0);" class="ds-kpi ds-kpi--input ds-vehicle-kpi" data-v="INSIDE"><span class="ds-kpi-ic"><span class="fa fa-truck"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">Vehicles Inside</span><span cl'
||'ass="ds-kpi-n">~''||to_char(K.Inside,''FM999G990'')||q''~</span><span class="ds-kpi-sub">Gated in (last 2 days), not out</span></span></a>~''',
'  When 2 Then q''~<a href="javascript:void(0);" class="ds-kpi ds-kpi--bill ds-vehicle-kpi" data-v="WEIGH"><span class="ds-kpi-ic"><span class="fa fa-balance-scale"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">Awaiting Final Weigh</sp'
||'an><span class="ds-kpi-n">~''||to_char(K.AwaitWeigh,''FM999G990'')||q''~</span><span class="ds-kpi-sub">First weight done, second pending</span></span></a>~''',
'  When 3 Then q''~<a href="javascript:void(0);" class="ds-kpi ds-kpi--ok ds-vehicle-kpi" data-v="DWELL"><span class="ds-kpi-ic"><span class="fa fa-clock-o"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">Median Dwell</span><span class="'
||'ds-kpi-n">~''||to_char(Nvl(K.MedDwell,0),''FM990D0'')||q''~ h</span><span class="ds-kpi-sub">Gate-in to gate-out (clean trips, 90d)</span></span></a>~''',
'  Else q''~<a href="javascript:void(0);" class="ds-kpi ds-kpi--risk ds-vehicle-kpi" data-v="STALE"><span class="ds-kpi-ic"><span class="fa fa-exclamation-triangle"></span></span><span class="ds-kpi-body"><span class="ds-kpi-t">Gate-out Not Recorded</s'
||'pan><span class="ds-kpi-n">~''||to_char(K.StaleGate,''FM999G990'')||q''~</span><span class="ds-kpi-sub">Open gate-ins &gt; 2 days &#183; data gap</span></span></a>~''',
'End As CARD',
'From K, (Select Level Seq From dual Connect By Level <= 4) x',
'Order By x.Seq'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P721_FROMDATE,P721_TODATE,P721_COMPANY,P721_LOCATION,P721_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No vehicle activity.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(1481937207337528679)
,p_query_column_id=>1
,p_column_alias=>'CARD'
,p_column_display_sequence=>10
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1481444244385410829)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_button_name=>'APPLY'
,p_static_id=>'apply-filters'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_icon_css_classes=>'fa-search'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1481444318827410829)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_button_name=>'RESETFILTERS'
,p_static_id=>'reset-filters'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Reset'
,p_button_redirect_url=>'f?p=&APP_ID.:721:&SESSION.::&DEBUG.:721'
,p_icon_css_classes=>'fa-undo'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>1
,p_grid_column=>2
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1483439443957395192)
,p_name=>'P721_CFLOW_C'
,p_item_sequence=>91
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER. Holds the confirmed-category code clicked in Category Flow; drives the Quotation vs Order Detail register.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1483439643842395192)
,p_name=>'P721_CFLOW_O'
,p_item_sequence=>92
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER. Holds the order-category code clicked in Category Flow; drives the Quotation vs Order Detail register.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1481443917615410829)
,p_name=>'P721_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From SLC_SalesOrder a',
'                Where a.CompanyCode = c.CompanyCode',
'                  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                       Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>5
,p_field_alignment=>'LEFT-CENTER'
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
 p_id=>wwv_flow_imp.id(1485480884946966213)
,p_name=>'P721_EXCEPTION_FOCUS'
,p_item_sequence=>93
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER-BAR CONTROL. Set by an Exception Mix slice; filters the Exceptions register to that exact exception type.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1481443775859410829)
,p_name=>'P721_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_item_default=>'to_char(add_months(trunc(sysdate,''MM''),-1),''DD-MM-RRRR'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_colspan=>2
,p_grid_column=>1
,p_field_alignment=>'LEFT-CENTER'
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
 p_id=>wwv_flow_imp.id(1481444016895410829)
,p_name=>'P721_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From SLC_SalesOrder a',
'                Where a.LocationCode = l.LocationCode',
'                  And (:P721_COMPANY Is Null Or a.CompanyCode = :P721_COMPANY)',
'                  And ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null',
'                       Or a.Panel = (Select SAGAR.GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P721_COMPANY'
,p_ajax_items_to_submit=>'P721_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>8
,p_field_alignment=>'LEFT-CENTER'
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
 p_id=>wwv_flow_imp.id(1481444175853410829)
,p_name=>'P721_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_lov=>'STATIC:A;A,B;B'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'A + B'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'SAGAR.GetUserPanelAB_apex() Is Null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_lov_display_extra=>'NO'
,p_help_text=>'Compatibility bind retained internally; Company and Location determine the visible dashboard scope.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE',
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1486541596425381240)
,p_name=>'P721_REGISTER_FOCUS'
,p_item_sequence=>89
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_item_default=>'SC'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'Selects the in-dashboard register opened from the Lifecycle Pulse KPI cards. Values are SC, SO, SO_PENDING, GATE_IN, INV and INV_NO_IRN.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1481691271831482449)
,p_name=>'P721_STAGE_FOCUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER. Holds the lifecycle stage whose documents are listed in Stage Documents. Empty until a funnel stage or bottleneck card is clicked.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1481443904122410829)
,p_name=>'P721_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
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
 p_id=>wwv_flow_imp.id(1485742935728329893)
,p_name=>'P721_VEHICLE_FOCUS'
,p_item_sequence=>94
,p_item_plug_id=>wwv_flow_imp.id(1481442948391410827)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_help_text=>'NOT A FILTER-BAR CONTROL. Set by a Vehicle KPI card; drives the exact operational detail condition below the cards.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1481444484775410829)
,p_name=>'Quick Period Chips'
,p_static_id=>'install-quickperiods'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1481444527050410829)
,p_event_id=>wwv_flow_imp.id(1481444484775410829)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'bind'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.jQuery(document).off(''click.p730period'')',
    '  .on(''click.p730period'', ''.ds-period'', function () {',
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
    '    apex.item(''P721_FROMDATE'').setValue(fmt(f));',
    '    apex.item(''P721_TODATE'').setValue(fmt(t));',
    '    apex.page.submit();',
    '  });')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(1435188712799587251)
,p_process_sequence=>50
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_DASHBOARD_FOCUS'
,p_static_id=>'set-dashboard-focus'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'  lKind   Varchar2(20):=Upper(Trim(apex_application.g_x01));',
'  lValue  Varchar2(100):=Trim(apex_application.g_x02);',
'  lValue2 Varchar2(100):=Trim(apex_application.g_x03);',
'Begin',
'  Case lKind',
'    When ''REGISTER'' Then',
'      If lValue Not In (''SC'',''SO'',''SO_PENDING'',''GATE_IN'',''INV'',''INV_NO_IRN'') Then',
'        raise_application_error(-20001,''Invalid register selection.'');',
'      End If;',
'      apex_util.set_session_state(''P721_REGISTER_FOCUS'',lValue);',
'    When ''STAGE'' Then',
'      If lValue Not In (''10'',''20'',''30'',''40'',''50'',''60'',''70'',''H1'',''H2'',''H3'',''H4'',''H5'') Then',
'        raise_application_error(-20002,''Invalid lifecycle stage.'');',
'      End If;',
'      apex_util.set_session_state(''P721_STAGE_FOCUS'',lValue);',
'    When ''EXCEPTION'' Then',
'      If lValue Not In (''Order not dispatched'',''Dispatch not gated'',''Gate-out not invoiced'',''Invoice without IRN'',''Stale open gate movement'',''Awaiting final weighment'') Then',
'        raise_application_error(-20003,''Invalid exception selection.'');',
'      End If;',
'      apex_util.set_session_state(''P721_EXCEPTION_FOCUS'',lValue);',
'    When ''VEHICLE'' Then',
'      If lValue Not In (''INSIDE'',''WEIGH'',''DWELL'',''STALE'') Then',
'        raise_application_error(-20004,''Invalid vehicle selection.'');',
'      End If;',
'      apex_util.set_session_state(''P721_VEHICLE_FOCUS'',lValue);',
'    When ''CFLOW'' Then',
'      If lValue Is Null Or lValue2 Is Null',
'         Or Not regexp_like(lValue,''^[[:alnum:]_ .()/:-]{1,100}$'')',
'         Or Not regexp_like(lValue2,''^[[:alnum:]_ .()/:-]{1,100}$'') Then',
'        raise_application_error(-20005,''Invalid category selection.'');',
'      End If;',
'      apex_util.set_session_state(''P721_CFLOW_C'',lValue);',
'      apex_util.set_session_state(''P721_CFLOW_O'',lValue2);',
'    Else',
'      raise_application_error(-20006,''Invalid dashboard selection.'');',
'  End Case;',
'  apex_json.open_object;',
'  apex_json.write(''success'',True);',
'  apex_json.close_object;',
'Exception',
'  When Others Then',
'    apex_json.open_object;',
'    apex_json.write(''success'',False);',
'    apex_json.write(''message'',Regexp_Replace(SqlErrM,''^ORA-[0-9]+:[[:space:]]*'',''''));',
'    apex_json.close_object;',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>730202608290001
);
wwv_flow_imp.component_end;
end;
/
