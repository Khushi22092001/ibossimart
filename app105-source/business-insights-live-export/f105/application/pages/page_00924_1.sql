prompt --application/pages/page_00924
begin
--   Manifest
--     PAGE: 00924
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
 p_id=>924
,p_name=>'Payments and Settlement'
,p_alias=>'AP-PAYMENTS'
,p_step_title=>'Payments and Settlement'
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
,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Payments are actual PAYMENT, CASHPAYMENT and BANKPAYMENT voucher lines debited to a vendor account between From Date and To Date - every channel, so bank-statement uploads (EBSUPLOAD) and direct vouchers count alongside payment advices. Never a fall '
||'in outstanding, which also moves through debit notes, journals and allocation. This page is a FLOW report: the As-of Date bounds only the settlement state. Bank is derived from the contra (credit) account on the same payment voucher and covers all ch'
||'annels. Payment MODE is reliable only where a PaymentAdvice exists (99.7% coverage there, about 30% of payment value overall) - the mode chart is scoped to advice-routed payments and says so on its face.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12836218581301324)
,p_name=>'Payment Approval Pipeline'
,p_static_id=>'approval-pipeline'
,p_template=>4072358936313175081
,p_display_sequence=>36
,p_region_css_classes=>'ds-dash-panel ds-matchchart'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_new_grid_row=>false
,p_grid_column_span=>6
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Advices raised but not marked done - approved liability queued for',
'   execution. This is the operational payment-approval pipeline the',
'   brief asks for, and it exists only in the PaymentAdvice channel:',
'   bank uploads and direct vouchers have no approval state to show. */',
'Select pa.PaymentAdviceNo                                As ADVICE_NO,',
'       pa.PaymentAdviceDate                              As ADVICE_DATE,',
'       nvl(p.PartyName, pa.PartyCode)   As VENDOR,',
'       Round(nvl(pa.AmountCr,0),2)                       As AMOUNT,',
'       nvl(pa.MoneyTransferModeCode,''-'')                 As TRANSFER_MODE,',
'       trunc(sysdate) - pa.PaymentAdviceDate             As DAYS_WAITING,',
'       substr(pa.Remark,1,200)          As REMARK',
'  From PaymentAdvice pa',
'  Left Join Party p On p.PartyCode = pa.PartyCode',
' Where nvl(pa.PaymentDone,''NO'') <> ''YES''',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P924_COMPANY  Is Null Or pa.CompanyCode  = :P924_COMPANY)',
'   And (:P924_LOCATION Is Null Or pa.LocationCode = :P924_LOCATION)',
' Order By pa.PaymentAdviceDate, pa.PaymentAdviceNo'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'Nothing is waiting in the approval pipeline for this scope - every advice raised has been executed.'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12836339551301324)
,p_query_column_id=>2
,p_column_alias=>'ADVICE_DATE'
,p_column_display_sequence=>20
,p_column_heading=>'Date'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12836479962301324)
,p_query_column_id=>1
,p_column_alias=>'ADVICE_NO'
,p_column_display_sequence=>10
,p_column_heading=>'Advice No'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12836516111301324)
,p_query_column_id=>4
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>40
,p_column_heading=>unistr('Amount (\20B9)')
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12836643342301324)
,p_query_column_id=>6
,p_column_alias=>'DAYS_WAITING'
,p_column_display_sequence=>60
,p_column_heading=>'Days Waiting'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12836717162301324)
,p_query_column_id=>7
,p_column_alias=>'REMARK'
,p_column_display_sequence=>70
,p_column_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12836813015301324)
,p_query_column_id=>5
,p_column_alias=>'TRANSFER_MODE'
,p_column_display_sequence=>50
,p_column_heading=>'Mode'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12836981649301324)
,p_query_column_id=>3
,p_column_alias=>'VENDOR'
,p_column_display_sequence=>30
,p_column_heading=>'Vendor'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12837021606301324)
,p_plug_name=>'Payments by Bank'
,p_static_id=>'bank-mix'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Bank is the CONTRA account on the payment voucher - the account that',
'   was credited when the vendor was debited. It is not stored on the',
'   payment line, and it is the only banking dimension that covers ALL',
'   payment channels (advices, bank-statement uploads, direct vouchers).',
'   The contra is aggregated per voucher before it is attributed, so a',
'   payment split across two banks is not double counted. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Rv As (',
'       Select Distinct d.Tno',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'          And d.Amount < 0',
'          And d.VoucherDate >= to_date(:P924_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P924_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P924_COMPANY  Is Null Or d.CompanyCode  = :P924_COMPANY)',
'          And (:P924_LOCATION Is Null Or d.LocationCode = :P924_LOCATION))',
'Select * From (',
'  Select nvl(p.PartyName, o.AccountCode) As LABEL,',
'         Round(Sum(o.Amount)/100000,2) As RECEIVED_LAC',
'    From VoucherDetail o',
'    Join Rv On Rv.Tno = o.Tno',
'    Left Join Party p On p.PartyCode = o.AccountCode',
'   Where o.Amount > 0',
'     And o.AccountCode Not In (Select PartyCode From Sd)',
'   Group By o.AccountCode, p.PartyName',
'   Order By Sum(o.Amount) Desc)',
' Where rownum <= 12',
' /* Outer Order By is required: the inner one only picks the twelve',
'    rows, it does not survive to the result set. */',
' Order By RECEIVED_LAC Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12837139781301324)
,p_region_id=>wwv_flow_imp.id(12837021606301324)
,p_chart_type=>'bar'
,p_height=>'340'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No payment left a bank in this period for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12837227180301324)
,p_chart_id=>wwv_flow_imp.id(12837139781301324)
,p_static_id=>'received'
,p_seq=>10
,p_name=>unistr('Paid (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'RECEIVED_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12837302887301324)
,p_chart_id=>wwv_flow_imp.id(12837139781301324)
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
 p_id=>wwv_flow_imp.id(12837411167301324)
,p_chart_id=>wwv_flow_imp.id(12837139781301324)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Paid (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12837592940301324)
,p_name=>'Payments and Settlement'
,p_static_id=>'command-header'
,p_template=>4072358936313175081
,p_display_sequence=>5
,p_region_css_classes=>'ds-ap-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-ap-head">''',
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Payments</div>''',
'    || ''<h1 class="ds-ap-title">Payments &amp; Settlement</h1>''',
'    || ''<div class="ds-ap-sub">Cash actually paid to vendors in the period, which bank paid it, through which channel, and how much of it has been applied to a bill</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-calendar"></span>Payments <b>''',
'       || :P924_FROMDATE || '' &rarr; '' || :P924_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-info-circle"></span><b>Flow report</b> &mdash; not an as-at balance</span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P924_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P924_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12837601112301324)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_column_heading=>'HEAD'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12837757563301324)
,p_plug_name=>'Daily Payment Trend'
,p_static_id=>'daily-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>32
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode)',
'Select to_char(d.VoucherDate,''DD-Mon'') As LABEL,',
'       Round(Sum(-d.Amount)/100000,2)  As COLLECTED_LAC',
'  From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'   And d.Amount < 0',
'   And d.VoucherDate >= to_date(:P924_FROMDATE,''DD-MM-RRRR'')',
'   And d.VoucherDate <  to_date(:P924_TODATE,''DD-MM-RRRR'') + 1',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P924_COMPANY  Is Null Or d.CompanyCode  = :P924_COMPANY)',
'   And (:P924_LOCATION Is Null Or d.LocationCode = :P924_LOCATION)',
' Group By d.VoucherDate',
' Order By d.VoucherDate'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12837818618301324)
,p_region_id=>wwv_flow_imp.id(12837757563301324)
,p_chart_type=>'line'
,p_height=>'340'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_fill_multi_series_gaps=>false
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No payment in this period for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12837929065301324)
,p_chart_id=>wwv_flow_imp.id(12837818618301324)
,p_static_id=>'collected'
,p_seq=>10
,p_name=>unistr('Collected (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'COLLECTED_LAC'
,p_items_label_column_name=>'LABEL'
,p_line_style=>'solid'
,p_line_type=>'auto'
,p_marker_rendered=>'auto'
,p_marker_shape=>'auto'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12838083762301324)
,p_chart_id=>wwv_flow_imp.id(12837818618301324)
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
 p_id=>wwv_flow_imp.id(12838123212301324)
,p_chart_id=>wwv_flow_imp.id(12837818618301324)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Collected (\20B9 Lac)')
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12838202963301324)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p712Filters'
,p_region_css_classes=>'ds-dash-filters'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12838375836301324)
,p_name=>'Payment KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4072358936313175081
,p_display_sequence=>20
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P924_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       /* A payment line is a DEBIT, so its settlements sit on the Dr',
'          side of the bridge - the mirror of the receipts page. */',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno, Sum(a.Amount) Amt, Count(*) N',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.DrVoucherTno, a.DrVoucherSno),',
'     AgeSplit As (',
'       /* Payment of OLD debt versus CURRENT bills, decided by the age',
'          of the BILL each allocation settled - not by the age of the',
'          payment. A payment posted today that clears a six-month-old',
'          bill is payment of old debt, and any other reading would',
'          flatter the payment discipline. The payment is the Dr side',
'          (dv); the bill it settles is the Cr side (cv). */',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno,',
'              Sum(Case When dv.VoucherDate - cv.VoucherDate > 90 Then a.Amount Else 0 End) OldDebt,',
'              Sum(Case When dv.VoucherDate - cv.VoucherDate <= 90 Then a.Amount Else 0 End) CurrentDebt,',
'              Sum(a.Amount * (dv.VoucherDate - cv.VoucherDate)) LagWeighted',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.DrVoucherTno, a.DrVoucherSno),',
'     R As (',
'       /* One row per payment LINE in the flow window. Allocation is',
'          joined pre-aggregated to (Tno,Sno) so a payment settling many',
'          bills is still one row. Amt is flipped positive - a payment',
'          is a debit in this ledger. */',
'       Select d.Tno, d.Sno, d.AccountCode Pty, -d.Amount Amt,',
'              nvl(al.Amt,0) Applied, nvl(al.N,0) Bills, d.VoucherDate Vdt,',
'              nvl(ag.OldDebt,0) OldDebt, nvl(ag.CurrentDebt,0) CurrentDebt,',
'              ag.LagWeighted LagW',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Alc al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join AgeSplit ag On ag.Tno = d.Tno And ag.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'          And d.Amount < 0',
'          And d.VoucherDate >= to_date(:P924_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P924_TODATE,''DD-MM-RRRR'') + 1',
'          And (cast(null as varchar2(100)) Is Null',
'               Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'          And (null    Is Null Or cast(null as varchar2(100))        = null)',
'          And (:P924_COMPANY  Is Null Or d.CompanyCode  = :P924_COMPANY)',
'          And (:P924_LOCATION Is Null Or d.LocationCode = :P924_LOCATION)),',
'     T As (',
'       Select nvl(Sum(Amt),0) Amt, Count(Distinct Tno) Vch, Count(*) Lines,',
'              Count(Distinct Pty) Pty,',
'              nvl(Sum(Applied),0) Applied,',
'              nvl(Sum(Amt - Applied),0) Unapplied,',
'              Count(Case When Bills = 0 Then 1 End) NoAlloc,',
'              Count(Case When Bills > 0 And Amt - Applied > 0.005 Then 1 End) Partial,',
'              Count(Case When Bills > 0 And Amt - Applied <= 0.005 Then 1 End) FullyApplied,',
'              nvl(Sum(Bills),0) Settlements,',
'              nvl(Avg(Amt),0) AvgAmt,',
'              nvl(Sum(OldDebt),0) OldDebt,',
'              nvl(Sum(CurrentDebt),0) CurrentDebt,',
'              nvl(Sum(LagW),0) LagW,',
'              nvl(Sum(Case When Bills > 0 Then Applied End),0) AppliedForLag',
'         From R)',
'Select ''<a class="ds-kpi ds-kpi--teal" href="#p712register" title="Sum of payment voucher lines (all channels) debited to a vendor account inside the flow window. An actual transaction total, never a movement in outstanding.">''',
'    || ''<span class="ds-kpi-ic fa fa-download"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Payments in Period</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Amt >= 10000000 Then to_char(Round(t.Amt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Amt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.Vch,''FM999G990'') || '' payment lines to ''',
'    || to_char(t.Pty,''FM999G990'') || '' vendors</div></div></a>'' As K1,',
'       ''<div class="ds-kpi ds-kpi--ok" title="The part of period payments that has been allocated to a bill.">''',
'    || ''<span class="ds-kpi-ic fa fa-link"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Applied to Bills</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Applied >= 10000000 Then to_char(Round(t.Applied/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Applied/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When t.Amt > 0 Then to_char(Round(100 * t.Applied / t.Amt,1),''FM990D0'') || ''% of payments'' Else ''&mdash;'' End',
'    || '' &middot; '' || to_char(t.Settlements,''FM999G990'') || '' bill settlements</div></div></div>'' As K2,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 925, p_clear_cache => ''925'',',
'         p_items => ''P925_FROMDATE,P925_TODATE,P925_COMPANY,P925_LOCATION'',',
'         p_values => :P924_FROMDATE ||'',''|| :P924_TODATE ||'',''|| :P924_COMPANY ||'',''|| :P924_LOCATION)',
'    || ''" title="The part of period payments still sitting unapplied. Only a third of AP lines in this ledger have ever been allocated.">''',
'    || ''<span class="ds-kpi-ic fa fa-unlink"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Still Unapplied</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Unapplied >= 10000000 Then to_char(Round(t.Unapplied/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Unapplied/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.NoAlloc,''FM999G990'')',
'    || '' payments never allocated at all</div></div></a>'' As K3,',
'       ''<div class="ds-kpi ds-kpi--struct" title="How period payments split between fully applied, partly applied and untouched.">''',
'    || ''<span class="ds-kpi-ic fa fa-pie-chart"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Application Status</div><div class="ds-kpi-n">''',
'    || to_char(t.FullyApplied,''FM999G990'') || '' / '' || to_char(t.Partial,''FM999G990'')',
'    || '' / '' || to_char(t.NoAlloc,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">fully applied / partial / unapplied</div></div></div>'' As K4,',
'       ''<div class="ds-kpi ds-kpi--gold" title="Average value of a payment line in this period.">''',
'    || ''<span class="ds-kpi-ic fa fa-calculator"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Average Payment</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.AvgAmt >= 100000 Then to_char(Round(t.AvgAmt/100000,2),''FM999G990D00'') || '' Lac''',
'            Else to_char(Round(t.AvgAmt,0),''FM999G99G99G990'') End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.Lines,''FM999G990'') || '' payment lines</div></div></div>'' As K5,',
'       ''<div class="ds-kpi ds-kpi--amber" title="Payments that cleared a bill more than 90 days older than the payment. Aged by the BILL, not the payment - a payment today against a six-month-old bill is payment of old debt.">''',
'    || ''<span class="ds-kpi-ic fa fa-hourglass-end"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Old Debt Paid</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.OldDebt >= 10000000 Then to_char(Round(t.OldDebt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.OldDebt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">bill older than 90 days at settlement</div></div></div>'' As K7,',
'       ''<div class="ds-kpi ds-kpi--ok" title="Payments that cleared a bill within 90 days of its own date.">''',
'    || ''<span class="ds-kpi-ic fa fa-check-circle-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Current Bills Paid</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.CurrentDebt >= 10000000 Then to_char(Round(t.CurrentDebt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.CurrentDebt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">settled within 90 days of the bill</div></div></div>'' As K8,',
'       ''<div class="ds-kpi ds-kpi--struct" title="Amount-weighted days between a bill and the payment that settled it - the realised days-to-pay. Measured only over allocations - payments that were never applied carry no lag and are excluded from bot'
||'h sides.">''',
'    || ''<span class="ds-kpi-ic fa fa-clock-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Average Allocation Lag</div><div class="ds-kpi-n">''',
'    || nvl(to_char(Round(t.LagW / Nullif(t.AppliedForLag,0),0),''FM999G990''),''&mdash;'')',
'    || '' <span style="font-size:15px">days</span></div>''',
'    || ''<div class="ds-kpi-sub">weighted by amount, over applied payments only</div></div></div>'' As K9,',
'       ''<div class="ds-kpi ds-kpi--violet" title="Payments that settled at least one bill but still carry a residual unapplied balance.">''',
'    || ''<span class="ds-kpi-ic fa fa-adjust"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Partial Settlements</div><div class="ds-kpi-n">''',
'    || to_char(t.Partial,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">applied in part, residual still on account</div></div></div>'' As K10,',
'       /* Stated, not silently omitted. */',
'       ''<div class="ds-apexcl"><div class="ds-apexcl-h">Payment Mode &mdash; not analysed</div>''',
'    || ''<div class="ds-apexcl-b">A transfer mode is recorded only where a <b>PaymentAdvice</b> exists (99.7% coverage there) - but advices carry only about 30% of payment value; ''',
'    || ''bank-statement uploads and direct vouchers carry none. The mode donut below is therefore scoped to <b>advice-routed payments only</b> and titled as such; ''',
'    || ''<b>Bank</b> covers 100% of payments, taken from the contra account of every payment voucher.</div></div>'' As K11',
'  From T t'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12838495850301324)
,p_query_column_id=>1
,p_column_alias=>'K1'
,p_column_display_sequence=>10
,p_column_heading=>'K1'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12838548194301324)
,p_query_column_id=>9
,p_column_alias=>'K10'
,p_column_display_sequence=>90
,p_column_heading=>'K10'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12838616684301325)
,p_query_column_id=>10
,p_column_alias=>'K11'
,p_column_display_sequence=>100
,p_column_heading=>'K11'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12838718487301325)
,p_query_column_id=>2
,p_column_alias=>'K2'
,p_column_display_sequence=>20
,p_column_heading=>'K2'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12838852643301325)
,p_query_column_id=>3
,p_column_alias=>'K3'
,p_column_display_sequence=>30
,p_column_heading=>'K3'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12838963889301325)
,p_query_column_id=>4
,p_column_alias=>'K4'
,p_column_display_sequence=>40
,p_column_heading=>'K4'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12839085627301325)
,p_query_column_id=>5
,p_column_alias=>'K5'
,p_column_display_sequence=>50
,p_column_heading=>'K5'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12839169953301325)
,p_query_column_id=>6
,p_column_alias=>'K7'
,p_column_display_sequence=>60
,p_column_heading=>'K7'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12839217572301325)
,p_query_column_id=>7
,p_column_alias=>'K8'
,p_column_display_sequence=>70
,p_column_heading=>'K8'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12839302187301325)
,p_query_column_id=>8
,p_column_alias=>'K9'
,p_column_display_sequence=>80
,p_column_heading=>'K9'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12839434170301325)
,p_plug_name=>unistr('Payment Mode \2014 Advice-Routed Payments Only')
,p_static_id=>'mode-mix'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>34
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Scoped deliberately: a transfer mode exists only on PaymentAdvice',
'   (99.7% coverage there), and advices carry ~30% of payment value.',
'   Charting mode across ALL payments would present the missing 70%',
'   as if it did not exist - so the region name carries the scope. */',
'Select nvl(pa.MoneyTransferModeCode,''(not set)'') As LABEL,',
'       Round(Sum(nvl(pa.AmountCr,0))/100000,2)   As PAID_LAC',
'  From PaymentAdvice pa',
' Where nvl(pa.PaymentDone,''NO'') = ''YES''',
'   And pa.PaymentAdviceDate >= to_date(:P924_FROMDATE,''DD-MM-RRRR'')',
'   And pa.PaymentAdviceDate <  to_date(:P924_TODATE,''DD-MM-RRRR'') + 1',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P924_COMPANY  Is Null Or pa.CompanyCode  = :P924_COMPANY)',
'   And (:P924_LOCATION Is Null Or pa.LocationCode = :P924_LOCATION)',
' Group By nvl(pa.MoneyTransferModeCode,''(not set)'')',
' /* A donut in this APEX version always sorts by label ascending -',
'    all 82 donuts and pies in this app do - so this ORDER BY does',
'    not survive to the rendered chart. It is kept because the same',
'    query is what Download exports, where the order does hold. The',
'    segments therefore read alphabetically by mode, which is',
'    acceptable for a mode mix: unlike a concentration band, a',
'    transfer mode carries no inherent rank. */',
' Order By 2 Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12839570942301325)
,p_region_id=>wwv_flow_imp.id(12839434170301325)
,p_chart_type=>'donut'
,p_height=>'340'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_scaling=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
,p_no_data_found_message=>'No advice-routed payment in this period for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12839658929301325)
,p_chart_id=>wwv_flow_imp.id(12839570942301325)
,p_static_id=>'mode'
,p_seq=>10
,p_name=>unistr('Paid via Advice (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'donut'
,p_items_value_column_name=>'PAID_LAC'
,p_items_label_column_name=>'LABEL'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12839752039301325)
,p_name=>'Go to'
,p_static_id=>'quick-links'
,p_template=>4072358936313175081
,p_display_sequence=>900
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-apnavwrap'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* The quick-links strip: one card per sibling page in this section.',
'   One report ROW per card, so the report''s own tbody becomes the',
'   grid (see `.ds-kpiwrap` in design-system.css) and the number of',
'   cards can vary with the reader''s privileges without the layout',
'   caring.',
'',
'   AUTHORISATION. The menu gates each entry on',
'   GetApexReportPrivilege, but that function returns a PL/SQL',
'   BOOLEAN and therefore cannot be called from SQL. Its logic is',
'   reproduced below against the same three tables, INCLUDING the',
'   hard-coded ''BOSS'' bypass it carries, so a card appears only',
'   where the menu entry would. A reader never sees a card for a',
'   page they cannot open. If that function''s rule changes, this',
'   predicate has to change with it - that duplication is the price',
'   of the boolean return type.',
'',
'   Page 698 (Bill Detail) is deliberately absent: it is keyed on a',
'   specific (Tno, Sno) and is meaningless without one, so it is',
'   reached by clicking a bill, never from a menu. */',
'With Pg As (',
'  Select 920 Id, ''AP Command Centre''          Nm, ''Payable, due and overdue, payments, advances and the exceptions behind every number'' Sub, ''fa-dashboard''              Ic From dual Union All',
'  Select 921,    ''Vendor-wise Payable'',           ''One row per vendor, with ageing and the netting position'',             ''fa-users''                  From dual Union All',
'  Select 922,    ''Bill-wise Payable'',             ''Every open item at line level, with its source document'',              ''fa-list-alt''               From dual Union All',
'  Select 923,    ''Creditor 360'',                  ''One vendor from every angle - bills, payments, advances, statement'',   ''fa-user''                   From dual Union All',
'  Select 924,    ''Payments and Settlement'',       ''Cash actually paid, which bank paid it, how much is applied'',          ''fa-upload''                 From dual Union All',
'  Select 925,    ''Advances and Unapplied Payments'',''Money already with vendors, and the payable it could clear'',          ''fa-hand-o-up''              From dual Union All',
'  Select 926,    ''Unbilled Liability (GRNI)'',     ''Goods received, no supplier bill yet - tied to the GR/IR account'',     ''fa-truck''                  From dual Union All',
'  Select 927,    ''Exceptions and Controls'',       ''Every control, what it tests, and the records that fail it'',           ''fa-exclamation-triangle''   From dual Union All',
'  Select 928,    ''Reconciliation and Data Health'',''The open-item register against the general-ledger control account'',    ''fa-balance-scale''          From dual Union All',
'  Select 930,    ''Trends and Cash Forecast'',      ''How the position moved, and the cash the due dates demand'',            ''fa-line-chart''             From dual Union All',
'  Select 931,    ''Daily Payment MIS'',             ''One day: position, movement, dues and what remains unexplained'',       ''fa-calendar-o''             From dual Union All',
'  Select 932,    ''Weekly AP Review'',              ''Opening against closing, and the controls that failed in the week'',    ''fa-calendar''               From dual Union All',
'  Select 933,    ''Monthly Management MIS'',        ''The management pack, reconciled to the GL at the foot'',                ''fa-file-text-o''            From dual)',
'Select ''<a class="ds-kpi ds-kpi--link ds-kpi--teal" href="''',
'    || apex_page.get_url(',
'         p_page        => Pg.Id,',
'         p_clear_cache => to_char(Pg.Id),',
'         /* Page 700 is a single-day report and has no From/To pair -',
'            naming an item that does not exist on the target page',
'            fails at run time, so its filter list is built separately. */',
'         p_items  => Case When Pg.Id = 931',
'                          Then ''P931_DAY,P931_COMPANY,P931_LOCATION''',
'                          Else ''P''||Pg.Id||''_FROMDATE,P''||Pg.Id||''_TODATE,P''',
'                               ||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION'' End,',
'         p_values => Case When Pg.Id = 931',
'                          Then :P924_TODATE ||'',''|| :P924_COMPANY ||'',''|| :P924_LOCATION',
'                          Else :P924_FROMDATE ||'',''|| :P924_TODATE ||'',''|| :P924_COMPANY ||'',''|| :P924_LOCATION End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 924',
' Order By Pg.Id'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12839847663301325)
,p_query_column_id=>1
,p_column_alias=>'CARD'
,p_column_display_sequence=>10
,p_column_heading=>'CARD'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12839922658301325)
,p_plug_name=>'Payment Register'
,p_static_id=>'register'
,p_region_name=>'p694register'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(2102002977963900996)
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYCREDITORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P924_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       /* A payment line is a DEBIT - its settlements sit on the Dr',
'          side; the counterpart (cv) is the bill it cleared. */',
'       Select a.DrVoucherTno Tno, a.DrVoucherSno Sno,',
'              Sum(a.Amount) Amt, Count(*) N, Max(cv.VoucherDate) LastAlloc',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.DrVoucherTno, a.DrVoucherSno),',
'     Bank As (',
'       /* The contra account, reduced to ONE row per voucher before it',
'          joins. A payment voucher can credit more than one bank line;',
'          taking the largest keeps the register at one row per payment',
'          instead of fanning the amount out across banks. */',
'       Select Tno, AccountCode Bnk From (',
'         Select o.Tno, o.AccountCode,',
'                Row_Number() Over (Partition By o.Tno Order By o.Amount Desc) Rn',
'           From VoucherDetail o',
'           Join Voucher bv On bv.Tno = o.Tno',
'          Where o.Amount > 0',
'            And bv.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'            And o.AccountCode Not In (Select PartyCode From Sd))',
'        Where Rn = 1),',
'     Adv As (',
'       /* Payment advice enrichment where the voucher came from one -',
'          the only channel that records a transfer mode reliably. */',
'       Select v2.Tno, pa.PaymentAdviceNo, pa.MoneyTransferModeCode Mtm,',
'              pa.MoneyTransferReferenceNo Mtr',
'         From Voucher v2',
'         Join PaymentAdvice pa On pa.Tno = v2.ModuleTno',
'        Where v2.ModuleCode = ''PAYMENTADVICE'')',
'Select d.Tno                                          As VOUCHER_TNO,',
'       v.VoucherNo                                    As RECEIPT_NO,',
'       d.VoucherDate                                  As RECEIPT_DATE,',
'       nvl(p.PartyName, d.AccountCode) As CUSTOMER,',
'       d.AccountCode                                  As PARTY_CODE,',
'       nvl(bp.PartyName, b.Bnk)     As BANK_OR_CASH,',
'       Round(-d.Amount,2)                             As RECEIPT_AMOUNT,',
'       Round(nvl(al.Amt,0),2)                         As APPLIED,',
'       Round(-d.Amount - nvl(al.Amt,0),2)             As UNAPPLIED,',
'       nvl(al.N,0)                                    As BILLS_SETTLED,',
'       Case When nvl(al.N,0) = 0',
'                 Then ''<span class="ds-apchip ds-apchip--fail">Unapplied</span>''',
'            When -d.Amount - nvl(al.Amt,0) > 0.005',
'                 Then ''<span class="ds-apchip ds-apchip--warn">Partly applied</span>''',
'            Else ''<span class="ds-apchip ds-apchip--pass">Fully applied</span>'' End As STATUS,',
'       al.LastAlloc                                   As LAST_ALLOCATION,',
'       Case When al.LastAlloc Is Not Null',
'            Then d.VoucherDate - al.LastAlloc End     As ALLOCATION_LAG_DAYS,',
'       nvl(adv.Mtr, v.MoneyTransferReferenceNo) As BANK_REFERENCE,',
'       adv.PaymentAdviceNo          As ADVICE_NO,',
'       Case When adv.Tno Is Not Null Then ''Payment Advice''',
'            When v.ModuleCode = ''EBSUPLOAD'' Then ''Bank Upload''',
'            Else ''Direct Voucher'' End As CHANNEL,',
'       /* Aliased PAYMENT_MODE, not MODE: MODE is an Oracle reserved',
'          word and an unquoted column alias of that name raises',
'          ORA-00923 at render. apex validate does not execute region',
'          SQL, so it passes this cleanly. Mode is reliable only on',
'          advice-routed payments; everywhere else it reads',
'          "not recorded" and the mode chart says so. */',
'       nvl(coalesce(adv.Mtm, v.MoneyTransferModeCode),''not recorded'') As PAYMENT_MODE,',
'       nvl(c.CompanyName, d.CompanyCode)  As COMPANY,',
'       nvl(l.LocationName, d.LocationCode) As LOCATION,',
'       cast(null as varchar2(100))                                        As PANEL,',
'       substr(d.Narration,1,300)    As NARRATION',
'  From VoucherDetail d',
'  Join Voucher v On v.Tno = d.Tno',
'  Left Join Alc al On al.Tno = d.Tno And al.Sno = d.Sno',
'  Left Join Bank b On b.Tno = d.Tno',
'  Left Join Adv adv On adv.Tno = d.Tno',
'  Left Join Party bp On bp.PartyCode = b.Bnk',
'  Left Join Party p On p.PartyCode = d.AccountCode',
'  Left Join Company c On c.CompanyCode = d.CompanyCode',
'  Left Join Location l On l.LocationCode = d.LocationCode',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And v.DocTypeCode In (''PAYMENT'',''CASHPAYMENT'',''BANKPAYMENT'')',
'   And d.Amount < 0',
'   And d.VoucherDate >= to_date(:P924_FROMDATE,''DD-MM-RRRR'')',
'   And d.VoucherDate <  to_date(:P924_TODATE,''DD-MM-RRRR'') + 1',
'   And (cast(null as varchar2(100)) Is Null',
'        Or cast(null as varchar2(100)) = cast(null as varchar2(100)))',
'   And (null    Is Null Or cast(null as varchar2(100))        = null)',
'   And (:P924_COMPANY  Is Null Or d.CompanyCode  = :P924_COMPANY)',
'   And (:P924_LOCATION Is Null Or d.LocationCode = :P924_LOCATION)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P924_FROMDATE,P924_TODATE,P924_COMPANY,P924_LOCATION'
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
 p_id=>wwv_flow_imp.id(12840043935301325)
,p_max_row_count=>'200000'
,p_no_data_found_message=>'No payment was posted to a vendor account in this period for the selected scope.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>69400000000000694
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840191445301325)
,p_db_column_name=>'ADVICE_NO'
,p_display_order=>145
,p_column_identifier=>'A'
,p_column_label=>'Advice No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840236633301325)
,p_db_column_name=>'ALLOCATION_LAG_DAYS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Days After Bill'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840377466301325)
,p_db_column_name=>'APPLIED'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>unistr('Applied (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840469484301325)
,p_db_column_name=>'BANK_OR_CASH'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Bank / Cash'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840536363301325)
,p_db_column_name=>'BANK_REFERENCE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Bank Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840605684301345)
,p_db_column_name=>'BILLS_SETTLED'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Bills Settled'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840735713301345)
,p_db_column_name=>'CHANNEL'
,p_display_order=>147
,p_column_identifier=>'O'
,p_column_label=>'Channel'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840859746301345)
,p_db_column_name=>'COMPANY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12840980511301345)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Vendor'
,p_column_link=>'f?p=&APP_ID.:923:&SESSION.::&DEBUG.:923:P923_PARTY,P923_FROMDATE,P923_TODATE,P923_COMPANY,P923_LOCATION:#PARTY_CODE#,&P924_FROMDATE.,&P924_TODATE.,&P924_COMPANY.,&P924_LOCATION.'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841079697301345)
,p_db_column_name=>'LAST_ALLOCATION'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Last Allocation'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841137530301345)
,p_db_column_name=>'LOCATION'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841259527301345)
,p_db_column_name=>'NARRATION'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841316332301345)
,p_db_column_name=>'PANEL'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Internal Scope'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841442090301345)
,p_db_column_name=>'PARTY_CODE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841569242301345)
,p_db_column_name=>'PAYMENT_MODE'
,p_display_order=>150
,p_column_identifier=>'U'
,p_column_label=>'Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841601319301345)
,p_db_column_name=>'RECEIPT_AMOUNT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Payment (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841714171301345)
,p_db_column_name=>'RECEIPT_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Payment Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841852269301345)
,p_db_column_name=>'RECEIPT_NO'
,p_display_order=>10
,p_column_identifier=>'T'
,p_column_label=>'Payment Voucher'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'#RECEIPT_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12841926629301345)
,p_db_column_name=>'STATUS'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12842041922301345)
,p_db_column_name=>'UNAPPLIED'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>unistr('Unapplied (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12842183117301345)
,p_db_column_name=>'VOUCHER_TNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12842229143301345)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69401'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RECEIPT_NO:RECEIPT_DATE:CUSTOMER:BANK_OR_CASH:RECEIPT_AMOUNT:APPLIED:UNAPPLIED:STATUS:BILLS_SETTLED:ALLOCATION_LAG_DAYS'
,p_sum_columns_on_break=>'RECEIPT_AMOUNT:APPLIED:UNAPPLIED'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12842849110301346)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12838202963301324)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12842954596301346)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12838202963301324)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:920:&SESSION.::&DEBUG.::P920_FROMDATE,P920_TODATE,P920_COMPANY,P920_LOCATION:&P924_FROMDATE.,&P924_TODATE.,&P924_COMPANY.,&P924_LOCATION.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12842387909301345)
,p_name=>'P924_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12838202963301324)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYCREDITORS'' Connect By Prior PartyCode = ParentCode))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12842439907301345)
,p_name=>'P924_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12838202963301324)
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
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(12842525008301345)
,p_name=>'P924_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12838202963301324)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.LocationCode = l.LocationCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYCREDITORS'' Connect By Prior PartyCode = ParentCode)',
'                  And (:P924_COMPANY Is Null Or v.CompanyCode = :P924_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P924_COMPANY'
,p_ajax_items_to_submit=>'P924_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12842733336301345)
,p_name=>'P924_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12838202963301324)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_grid_label_column_span=>0
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
