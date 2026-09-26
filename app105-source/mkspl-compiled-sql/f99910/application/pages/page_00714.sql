prompt --application/pages/page_00714
begin
--   Manifest
--     PAGE: 00714
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>99910
,p_default_id_offset=>0
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>714
,p_name=>'Unbilled Liability (GRNI)'
,p_alias=>'AP-GRNI'
,p_step_title=>'Unbilled Liability (GRNI)'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965433630286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Goods received with no supplier bill passed yet. THIS LIABILITY IS NOT PART OF VENDOR AP anywhere in this dashboard, and that is an accounting fact rather than a presentation choice: a GRN credits GRIRACCOUNT ("GR/IR ACCOUNT COST"), which sits under '
||'CURRENTLIABILITIESANDPROVISION, not under SUNDRYCREDITORS. So GRNI has its own page, its own GL account and its own tie-out. The source is the live OpenGRIRCost view, whose Status is BILLED or PENDING; PENDING is the GRNI position. The GRIR clearing '
||'balance and the pending-GRN total differ slightly - partial billing and timing - and the page shows the difference rather than smoothing it. The view carries no Panel column, so panel security is applied through the underlying GRN. Value comes from t'
||'he GRN accounting voucher, not from GrnDetail: GrnDetail.Rate and .Amount are null on virtually every row in this ERP, so a GRN carries quantity only.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12847435107301369)
,p_name=>'Unbilled Liability (GRNI)'
,p_static_id=>'command-header'
,p_template=>4502917002193490937
,p_display_sequence=>5
,p_region_css_classes=>'ds-ap-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-ap-head">''',
'    || ''<div class="ds-ap-eyebrow">Payables &middot; Unbilled Liability</div>''',
'    || ''<h1 class="ds-ap-title">Unbilled Liability (GRNI)</h1>''',
'    || ''<div class="ds-ap-sub">Goods received and credited to the GR/IR clearing account with no supplier bill passed yet - a liability that sits outside vendor AP by accounting design</div>''',
'    || ''<div class="ds-ap-context">''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-crosshairs"></span>Pending as at <b>'' || :P714_TODATE || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-random"></span>GL account <b>GRIRACCOUNT</b> &mdash; outside SUNDRYCREDITORS</span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P714_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P714_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-ap-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced, via the GRN)''',
'               When :P714_PANEL Is Not Null Then :P714_PANEL Else ''A + B'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P714_FROMDATE,P714_TODATE,P714_COMPANY,P714_LOCATION,P714_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12847557101301369)
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
 p_id=>wwv_flow_imp.id(12847693919301369)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p714Filters'
,p_region_css_classes=>'ds-dash-filters'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12847774392301369)
,p_plug_name=>'GRNI Trend'
,p_static_id=>'grni-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>32
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Receipts by the month they were RECEIVED, split by whether they have',
'   since been billed. Billed state is current, not as-at the month end -',
'   the question this answers is "which months are still unbilled", which',
'   is a current-state question, and the axis title says so. */',
'Select to_char(trunc(o.GRNDate,''MM''),''Mon-RR'') As LABEL,',
'       Round(Sum(Case When o.Status = ''PENDING'' Then nvl(o.Amount,0) Else 0 End)/10000000,2) As PENDING_CR,',
'       Round(Sum(Case When o.Status = ''BILLED''  Then nvl(o.Amount,0) Else 0 End)/10000000,2) As BILLED_CR',
'  From OpenGRIRCost o',
'  Join GRN gr On gr.Tno = o.GRNTno',
' Where o.GRNDate >= to_date(:P714_FROMDATE,''DD-MM-RRRR'')',
'   And o.GRNDate <  to_date(:P714_TODATE,''DD-MM-RRRR'') + 1',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or gr.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P714_PANEL    Is Null Or gr.Panel       = :P714_PANEL)',
'   And (:P714_COMPANY  Is Null Or o.CompanyCode  = :P714_COMPANY)',
'   And (:P714_LOCATION Is Null Or o.LocationCode = :P714_LOCATION)',
' Group By trunc(o.GRNDate,''MM'')',
' Order By trunc(o.GRNDate,''MM'')'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P714_FROMDATE,P714_TODATE,P714_COMPANY,P714_LOCATION,P714_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12847847517301369)
,p_region_id=>wwv_flow_imp.id(12847774392301369)
,p_chart_type=>'bar'
,p_height=>'340'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
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
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No goods receipt in this window for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12847920717301369)
,p_chart_id=>wwv_flow_imp.id(12847847517301369)
,p_static_id=>'billed'
,p_seq=>20
,p_name=>unistr('Since billed (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'BILLED_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12848050009301369)
,p_chart_id=>wwv_flow_imp.id(12847847517301369)
,p_static_id=>'pending'
,p_seq=>10
,p_name=>unistr('Still unbilled (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'PENDING_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12848117806301369)
,p_chart_id=>wwv_flow_imp.id(12847847517301369)
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
 p_id=>wwv_flow_imp.id(12848223510301369)
,p_chart_id=>wwv_flow_imp.id(12847847517301369)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Receipt value by month received (\20B9 Cr)')
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
 p_id=>wwv_flow_imp.id(12848384101301369)
,p_name=>'GRNI KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4502917002193490937
,p_display_sequence=>20
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Every card is a band of the same PENDING population, so the age bands',
'   add up to the total and no receipt is counted twice. Age is measured',
'   from the GRN date to the As-of Date. */',
'With P As (',
'       Select o.GRNTno, o.GRNNo, o.GRNDate, nvl(o.Amount,0) Amt,',
'              gr.PartyCode Pty,',
'              to_date(:P714_TODATE,''DD-MM-RRRR'') - o.GRNDate Age',
'         From OpenGRIRCost o',
'         Join GRN gr On gr.Tno = o.GRNTno',
'        Where o.Status = ''PENDING''',
'          And o.GRNDate <= to_date(:P714_TODATE,''DD-MM-RRRR'')',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or gr.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P714_PANEL    Is Null Or gr.Panel       = :P714_PANEL)',
'          And (:P714_COMPANY  Is Null Or o.CompanyCode  = :P714_COMPANY)',
'          And (:P714_LOCATION Is Null Or o.LocationCode = :P714_LOCATION)),',
'     T As (',
'       Select nvl(Sum(Amt),0) Tot, Count(*) N,',
'              Count(Distinct Pty) Vnd,',
'              nvl(Sum(Case When Age > 7  Then Amt Else 0 End),0) A7,',
'              Count(Case When Age > 7  Then 1 End) N7,',
'              nvl(Sum(Case When Age > 30 Then Amt Else 0 End),0) A30,',
'              Count(Case When Age > 30 Then 1 End) N30,',
'              nvl(Sum(Case When Age > 90 Then Amt Else 0 End),0) A90,',
'              Count(Case When Age > 90 Then 1 End) N90,',
'              Max(Age) MaxAge,',
'              nvl(Sum(Case When Amt >= 500000 Then Amt Else 0 End),0) HiVal,',
'              Count(Case When Amt >= 500000 Then 1 End) HiN',
'         From P)',
'Select ''<a class="ds-kpi ds-kpi--struct" href="#p714register" title="Every goods receipt credited to GR/IR with no supplier bill passed as at the As-of Date. This is the GRNI position, and it is not part of vendor AP.">''',
'    || ''<span class="ds-kpi-ic fa fa-truck"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Total Unbilled Liability</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Tot >= 10000000 Then to_char(Round(t.Tot/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Tot/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.N,''FM999G990'') || '' receipts &middot; ''',
'    || to_char(t.Vnd,''FM999G990'') || '' vendors</div></div></a>'' As K1,',
'       ''<div class="ds-kpi ds-kpi--gold" title="Receipts awaiting a supplier bill for more than seven days.">''',
'    || ''<span class="ds-kpi-ic fa fa-hourglass-start"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unbilled Over 7 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.A7 >= 10000000 Then to_char(Round(t.A7/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.A7/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.N7,''FM999G990'') || '' receipts</div></div></div>'' As K2,',
'       ''<a class="ds-kpi ds-kpi--amber" href="''',
'    || apex_page.get_url(p_page => 715, p_clear_cache => ''715'',',
'         p_items => ''P715_FROMDATE,P715_TODATE,P715_COMPANY,P715_LOCATION,P715_PANEL,P715_CONTROL'',',
'         p_values => :P714_FROMDATE ||'',''|| :P714_TODATE ||'',''|| :P714_COMPANY ||'',''|| :P714_LOCATION ||'',''|| :P714_PANEL ||'',AP-G01'')',
'    || ''" title="Receipts awaiting a supplier bill for more than thirty days - control AP-G01. Beyond a month the goods are consumed and the liability is real but unrecorded as vendor AP.">''',
'    || ''<span class="ds-kpi-ic fa fa-hourglass-half"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unbilled Over 30 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.A30 >= 10000000 Then to_char(Round(t.A30/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.A30/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.N30,''FM999G990'')',
'    || '' receipts &middot; control AP-G01</div></div></a>'' As K3,',
'       ''<div class="ds-kpi ds-kpi--risk" title="Receipts awaiting a supplier bill for more than ninety days. At this age the supplier bill may never arrive, and the accrual needs a decision rather than a reminder.">''',
'    || ''<span class="ds-kpi-ic fa fa-hourglass-end"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Unbilled Over 90 Days</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.A90 >= 10000000 Then to_char(Round(t.A90/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.A90/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.N90,''FM999G990'') || '' receipts &middot; oldest ''',
'    || to_char(t.MaxAge,''FM999G990'') || '' days</div></div></div>'' As K4,',
'       ''<div class="ds-kpi ds-kpi--violet" title="Individual receipts of five lakh or more awaiting a bill. Value, not age - a large recent accrual matters as much as a small old one.">''',
'    || ''<span class="ds-kpi-ic fa fa-inr"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">High-Value Unbilled</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.HiVal >= 10000000 Then to_char(Round(t.HiVal/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.HiVal/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.HiN,''FM999G990'')',
'    || '' receipts of &#8377;5 Lac or more</div></div></div>'' As K5,',
'       ''<div class="ds-apexcl"><div class="ds-apexcl-h">What a GRN cannot tell you</div>''',
'    || ''<div class="ds-apexcl-b"><code>GrnDetail.Rate</code> and <code>GrnDetail.Amount</code> are null on ''',
'    || ''virtually every row in this ERP, so a goods receipt carries <b>quantity only</b>. Every rupee figure on this page ''',
'    || ''therefore comes from the GRN <b>accounting voucher</b> through the <code>OpenGRIRCost</code> view, never from the ''',
'    || ''receipt lines. Quantity is not summed across receipts either: this ERP books in Quintal, MT, KG and NOS on the ''',
'    || ''same item, and a total across units of measure would be meaningless.</div></div>'' As K6',
'  From T t'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P714_FROMDATE,P714_TODATE,P714_COMPANY,P714_LOCATION,P714_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12848461868301369)
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
 p_id=>wwv_flow_imp.id(12848507809301369)
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
 p_id=>wwv_flow_imp.id(12848620567301370)
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
 p_id=>wwv_flow_imp.id(12848724085301370)
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
 p_id=>wwv_flow_imp.id(12848866918301370)
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
 p_id=>wwv_flow_imp.id(12848919987301370)
,p_query_column_id=>6
,p_column_alias=>'K6'
,p_column_display_sequence=>60
,p_column_heading=>'K6'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12849088592301370)
,p_name=>'Go to'
,p_static_id=>'quick-links'
,p_template=>4502917002193490937
,p_display_sequence=>900
,p_region_css_classes=>'ds-kpiwrap ds-apnavwrap'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Pg As (',
'  Select 708 Id, ''AP Command Centre''          Nm, ''Payable, due and overdue, payments, advances and the exceptions behind every number'' Sub, ''fa-dashboard''              Ic From dual Union All',
'  Select 709,    ''Vendor-wise Payable'',           ''One row per vendor, with ageing and the netting position'',             ''fa-users''                  From dual Union All',
'  Select 710,    ''Bill-wise Payable'',             ''Every open item at line level, with its source document'',              ''fa-list-alt''               From dual Union All',
'  Select 711,    ''Creditor 360'',                  ''One vendor from every angle - bills, payments, advances, statement'',   ''fa-user''                   From dual Union All',
'  Select 712,    ''Payments and Settlement'',       ''Cash actually paid, which bank paid it, how much is applied'',          ''fa-upload''                 From dual Union All',
'  Select 713,    ''Advances and Unapplied Payments'',''Money already with vendors, and the payable it could clear'',          ''fa-hand-o-up''              From dual Union All',
'  Select 715,    ''Exceptions and Controls'',       ''Every control, what it tests, and the records that fail it'',           ''fa-exclamation-triangle''   From dual Union All',
'  Select 716,    ''Reconciliation and Data Health'',''The open-item register against the general-ledger control account'',    ''fa-balance-scale''          From dual Union All',
'  Select 718,    ''Trends and Cash Forecast'',      ''How the position moved, and the cash the due dates demand'',            ''fa-line-chart''             From dual Union All',
'  Select 719,    ''Daily Payment MIS'',             ''One day: position, movement, dues and what remains unexplained'',       ''fa-calendar-o''             From dual Union All',
'  Select 720,    ''Weekly AP Review'',              ''Opening against closing, and the controls that failed in the week'',    ''fa-calendar''               From dual Union All',
'  Select 721,    ''Monthly Management MIS'',        ''The management pack, reconciled to the GL at the foot'',                ''fa-file-text-o''            From dual)',
'Select ''<a class="ds-kpi ds-kpi--link ds-kpi--teal" href="''',
'    || apex_page.get_url(',
'         p_page        => Pg.Id,',
'         p_clear_cache => to_char(Pg.Id),',
'         p_items  => Case When Pg.Id = 719',
'                          Then ''P719_DAY,P719_COMPANY,P719_LOCATION,P719_PANEL''',
'                          Else ''P''||Pg.Id||''_FROMDATE,P''||Pg.Id||''_TODATE,P''',
'                               ||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION,P''||Pg.Id||''_PANEL'' End,',
'         p_values => Case When Pg.Id = 719',
'                          Then :P714_TODATE ||'',''|| :P714_COMPANY ||'',''|| :P714_LOCATION ||'',''|| :P714_PANEL',
'                          Else :P714_FROMDATE ||'',''|| :P714_TODATE ||'',''|| :P714_COMPANY ||'',''|| :P714_LOCATION ||'',''|| :P714_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where (APEX_CUSTOM_AUTH.GET_USERNAME = ''BOSS''',
'        Or Exists (',
'             Select 1',
'               From ApexReportPrivilege a',
'               Join ApexReportPrivilegeDetail b On b.Tno = a.Tno',
'               Join BossUser c On c.BossUserCode = a.BossUserCode',
'              Where b.PageID = Pg.Id',
'                And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                     Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME))))',
' Order By Pg.Id'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From dual',
' Where APEX_CUSTOM_AUTH.GET_USERNAME = ''BOSS''',
'    Or Exists (',
'         Select 1',
'           From ApexReportPrivilege a',
'           Join ApexReportPrivilegeDetail b On b.Tno = a.Tno',
'           Join BossUser c On c.BossUserCode = a.BossUserCode',
'          Where b.PageID Between 708 And 721',
'            And b.PageID <> 714',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P714_FROMDATE,P714_TODATE,P714_COMPANY,P714_LOCATION,P714_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12849159388301370)
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
 p_id=>wwv_flow_imp.id(12849240893301370)
,p_plug_name=>'Pending GRN Register'
,p_static_id=>'register'
,p_region_name=>'p714register'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* One row per pending goods receipt. Ageing is from the GRN date to the',
'   As-of Date. The purchase voucher columns come from the view itself,',
'   which already resolves the accounting document behind each receipt. */',
'Select o.GRNNo                                          As GRN_NO,',
'       o.GRNDate                                        As GRN_DATE,',
'       nvl(p.PartyName, gr.PartyCode)  As VENDOR,',
'       gr.PartyCode                                     As PARTY_CODE,',
'       Round(nvl(o.Amount,0),2)                         As UNBILLED_VALUE,',
'       to_date(:P714_TODATE,''DD-MM-RRRR'') - o.GRNDate   As DAYS_UNBILLED,',
'       Case When to_date(:P714_TODATE,''DD-MM-RRRR'') - o.GRNDate > 90',
'                 Then ''<span class="ds-apchip ds-apchip--fail">Over 90 days</span>''',
'            When to_date(:P714_TODATE,''DD-MM-RRRR'') - o.GRNDate > 30',
'                 Then ''<span class="ds-apchip ds-apchip--warn">Over 30 days</span>''',
'            When to_date(:P714_TODATE,''DD-MM-RRRR'') - o.GRNDate > 7',
'                 Then ''<span class="ds-apchip ds-apchip--info">Over 7 days</span>''',
'            Else ''<span class="ds-apchip ds-apchip--pass">Recent</span>'' End As AGE_BAND,',
'       o.VoucherNo                                      As GRN_VOUCHER,',
'       o.VOCUHERTNO                                     As VOUCHER_TNO,',
'       o.VehicleNo                                      As VEHICLE,',
'       o.TransporterName               As TRANSPORTER,',
'       o.PartyBillNo                   As SUPPLIER_BILL_NO,',
'       nvl(c.CompanyName, o.CompanyCode)  As COMPANY,',
'       nvl(l.LocationName, o.LocationCode) As LOCATION,',
'       gr.Panel                                         As PANEL',
'  From OpenGRIRCost o',
'  Join GRN gr On gr.Tno = o.GRNTno',
'  Left Join Party p On p.PartyCode = gr.PartyCode',
'  Left Join Company c On c.CompanyCode = o.CompanyCode',
'  Left Join Location l On l.LocationCode = o.LocationCode',
' Where o.Status = ''PENDING''',
'   And o.GRNDate <= to_date(:P714_TODATE,''DD-MM-RRRR'')',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or gr.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P714_PANEL    Is Null Or gr.Panel       = :P714_PANEL)',
'   And (:P714_COMPANY  Is Null Or o.CompanyCode  = :P714_COMPANY)',
'   And (:P714_LOCATION Is Null Or o.LocationCode = :P714_LOCATION)',
' Order By o.GRNDate, o.GRNNo'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P714_FROMDATE,P714_TODATE,P714_COMPANY,P714_LOCATION,P714_PANEL'
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
 p_id=>wwv_flow_imp.id(12849389259301370)
,p_no_data_found_message=>'Every goods receipt in this scope has a supplier bill against it.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>68354388779868915
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12849402719301370)
,p_db_column_name=>'AGE_BAND'
,p_display_order=>70
,p_column_identifier=>'A'
,p_column_label=>'Age Band'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12849549187301370)
,p_db_column_name=>'COMPANY'
,p_display_order=>130
,p_column_identifier=>'B'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12849612215301370)
,p_db_column_name=>'DAYS_UNBILLED'
,p_display_order=>60
,p_column_identifier=>'C'
,p_column_label=>'Days Unbilled'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12849730141301370)
,p_db_column_name=>'GRN_DATE'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'GRN Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12849806711301370)
,p_db_column_name=>'GRN_NO'
,p_display_order=>10
,p_column_identifier=>'E'
,p_column_label=>'GRN No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12849959819301370)
,p_db_column_name=>'GRN_VOUCHER'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'GRN Voucher'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'#GRN_VOUCHER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12850084827301370)
,p_db_column_name=>'LOCATION'
,p_display_order=>140
,p_column_identifier=>'G'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12850163426301370)
,p_db_column_name=>'PANEL'
,p_display_order=>150
,p_column_identifier=>'H'
,p_column_label=>'Panel'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12850260151301370)
,p_db_column_name=>'PARTY_CODE'
,p_display_order=>40
,p_column_identifier=>'I'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12850397406301370)
,p_db_column_name=>'SUPPLIER_BILL_NO'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'Supplier Bill No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12850408170301370)
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
 p_id=>wwv_flow_imp.id(12850557540301370)
,p_db_column_name=>'UNBILLED_VALUE'
,p_display_order=>50
,p_column_identifier=>'L'
,p_column_label=>unistr('Unbilled Value (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12850669380301370)
,p_db_column_name=>'VEHICLE'
,p_display_order=>100
,p_column_identifier=>'M'
,p_column_label=>'Vehicle'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12850796516301370)
,p_db_column_name=>'VENDOR'
,p_display_order=>30
,p_column_identifier=>'N'
,p_column_label=>'Vendor'
,p_column_link=>'f?p=&APP_ID.:711:&SESSION.::&DEBUG.:711:P711_PARTY,P711_FROMDATE,P711_TODATE,P711_COMPANY,P711_LOCATION,P711_PANEL:#PARTY_CODE#,&P714_FROMDATE.,&P714_TODATE.,&P714_COMPANY.,&P714_LOCATION.,&P714_PANEL.'
,p_column_linktext=>'#VENDOR#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12850870848301370)
,p_db_column_name=>'VOUCHER_TNO'
,p_display_order=>90
,p_column_identifier=>'O'
,p_column_label=>'Voucher Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12850979089301370)
,p_plug_name=>'Where the Unbilled Liability Sits'
,p_static_id=>'rule-analysis'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>28
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Where the Unbilled Liability Sits</h2>',
'  <p>By vendor and by location, and how the position has moved month by month</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12851071682301370)
,p_plug_name=>'Pending Receipts'
,p_static_id=>'rule-register'
,p_region_css_classes=>'ds-dash-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>38
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-dash-section">',
'  <h2>Every Receipt Awaiting a Supplier Bill</h2>',
'  <p>Oldest first, with the vendor, the vehicle and the purchase voucher that recorded it</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12851168459301371)
,p_name=>'Why GRNI is not in vendor AP'
,p_static_id=>'separate-note'
,p_template=>4502917002193490937
,p_display_sequence=>15
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* A REPORT, not static text: the tie-out figures are measured live, so',
'   the note can never quote a stale difference. */',
'With G As (',
'       Select nvl(Sum(nvl(o.Amount,0)),0) Pend, Count(*) N',
'         From OpenGRIRCost o',
'         Join GRN gr On gr.Tno = o.GRNTno',
'        Where o.Status = ''PENDING''',
'          And o.GRNDate <= to_date(:P714_TODATE,''DD-MM-RRRR'')',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or gr.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P714_PANEL    Is Null Or gr.Panel       = :P714_PANEL)',
'          And (:P714_COMPANY  Is Null Or o.CompanyCode  = :P714_COMPANY)',
'          And (:P714_LOCATION Is Null Or o.LocationCode = :P714_LOCATION)),',
'     Gl As (',
'       /* The GR/IR clearing account straight off the ledger. A credit is',
'          positive here, exactly as on the payables pages. */',
'       Select nvl(Sum(d.Amount),0) Bal',
'         From VoucherDetail d',
'        Where d.AccountCode = ''GRIRACCOUNT''',
'          And d.VoucherDate <= to_date(:P714_TODATE,''DD-MM-RRRR'')',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P714_PANEL    Is Null Or d.Panel        = :P714_PANEL)',
'          And (:P714_COMPANY  Is Null Or d.CompanyCode  = :P714_COMPANY)',
'          And (:P714_LOCATION Is Null Or d.LocationCode = :P714_LOCATION)),',
'     Fp As (',
'       Select nvl(Sum(d.Amount),0) Bal',
'         From VoucherDetail d',
'        Where d.AccountCode = ''FREIGHTPAYABLE''',
'          And d.VoucherDate <= to_date(:P714_TODATE,''DD-MM-RRRR'')',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P714_PANEL    Is Null Or d.Panel        = :P714_PANEL)',
'          And (:P714_COMPANY  Is Null Or d.CompanyCode  = :P714_COMPANY)',
'          And (:P714_LOCATION Is Null Or d.LocationCode = :P714_LOCATION))',
'Select ''<div class="ds-apnote"><span class="fa fa-random"></span><div>''',
'    || ''<b>This liability is deliberately absent from every payable figure on the other AP pages.</b> ''',
'    || ''A goods receipt credits <code>GRIRACCOUNT</code>, which sits under CURRENTLIABILITIESANDPROVISION in this ''',
'    || ''chart of accounts &mdash; <b>not</b> under SUNDRYCREDITORS. It becomes vendor AP only when a supplier bill is ''',
'    || ''passed, at which point the clearing account is relieved. Adding the two together would double-count the same goods.''',
'    || ''</div></div>''',
'    || ''<div class="ds-apnote"><span class="fa fa-balance-scale"></span><div>''',
'    || ''<b>Tie-out.</b> Pending GRNs in this scope: <b>&#8377;''',
'    || to_char(Round(g.Pend,2),''FM999G99G99G990D00'') || ''</b> across '' || to_char(g.N,''FM999G990'')',
'    || '' receipts. GR/IR clearing balance on the ledger: <b>&#8377;''',
'    || to_char(Round(gl.Bal,2),''FM999G99G99G990D00'') || ''</b>. Difference: <b>&#8377;''',
'    || to_char(Round(gl.Bal - g.Pend,2),''FM999G99G99G990D00'') || ''</b> &mdash; ''',
'    || Case When Abs(gl.Bal - g.Pend) < 1',
'            Then ''the view and the account agree.''',
'            Else ''partial billing and timing, where a receipt has been billed in part or billed after the As-of Date. ''',
'                 || ''It is shown rather than smoothed: the two measures answer slightly different questions, and the gap is the finding.'' End',
'    || '' Freight clearing (<code>FREIGHTPAYABLE</code>) carries a further <b>&#8377;''',
'    || to_char(Round(fp.Bal,2),''FM999G99G99G990D00'') || ''</b>, which is the transporter twin of this position.''',
'    || ''</div></div>'' As NOTE',
'  From G g Cross Join Gl gl Cross Join Fp fp'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P714_FROMDATE,P714_TODATE,P714_COMPANY,P714_LOCATION,P714_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12851265158301371)
,p_query_column_id=>1
,p_column_alias=>'NOTE'
,p_column_display_sequence=>10
,p_column_heading=>'NOTE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12851388682301371)
,p_plug_name=>'Top Vendors by Unbilled Liability'
,p_static_id=>'top-vendors'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With P As (',
'       Select gr.PartyCode Pty, nvl(o.Amount,0) Amt,',
'              to_date(:P714_TODATE,''DD-MM-RRRR'') - o.GRNDate Age',
'         From OpenGRIRCost o',
'         Join GRN gr On gr.Tno = o.GRNTno',
'        Where o.Status = ''PENDING''',
'          And o.GRNDate <= to_date(:P714_TODATE,''DD-MM-RRRR'')',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or gr.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P714_PANEL    Is Null Or gr.Panel       = :P714_PANEL)',
'          And (:P714_COMPANY  Is Null Or o.CompanyCode  = :P714_COMPANY)',
'          And (:P714_LOCATION Is Null Or o.LocationCode = :P714_LOCATION))',
'Select * From (',
'  Select nvl(pa.PartyName, p.Pty)                                  As LABEL,',
'         Round(Sum(p.Amt)/100000,2)                                As UNBILLED_LAC,',
'         Round(Sum(Case When p.Age > 30 Then p.Amt Else 0 End)/100000,2) As OVER30_LAC,',
'         p.Pty                                                     As PARTY_CODE',
'    From P p Left Join Party pa On pa.PartyCode = p.Pty',
'   Group By p.Pty, pa.PartyName',
'   Having Sum(p.Amt) > 0',
'   Order By Sum(p.Amt) Desc)',
' Where rownum <= 12',
' /* Outer Order By is required: the inner one only picks the twelve',
'    rows, it does not survive to the result set. */',
' Order By UNBILLED_LAC Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P714_FROMDATE,P714_TODATE,P714_COMPANY,P714_LOCATION,P714_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12851481740301371)
,p_region_id=>wwv_flow_imp.id(12851388682301371)
,p_chart_type=>'bar'
,p_height=>'340'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
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
,p_legend_rendered=>'on'
,p_legend_position=>'bottom'
,p_overview_rendered=>'off'
,p_no_data_found_message=>'No vendor carries an unbilled receipt in this scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12851574933301371)
,p_chart_id=>wwv_flow_imp.id(12851481740301371)
,p_static_id=>'over30'
,p_seq=>20
,p_name=>unistr('Of which over 30 days (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'OVER30_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12851694946301371)
,p_chart_id=>wwv_flow_imp.id(12851481740301371)
,p_static_id=>'unbilled'
,p_seq=>10
,p_name=>unistr('Unbilled (\20B9 Lac)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'UNBILLED_LAC'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:711:&SESSION.::&DEBUG.::P711_PARTY,P711_FROMDATE,P711_TODATE,P711_COMPANY,P711_LOCATION,P711_PANEL:&PARTY_CODE.,&P714_FROMDATE.,&P714_TODATE.,&P714_COMPANY.,&P714_LOCATION.,&P714_PANEL.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12851727017301371)
,p_chart_id=>wwv_flow_imp.id(12851481740301371)
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
 p_id=>wwv_flow_imp.id(12851814471301371)
,p_chart_id=>wwv_flow_imp.id(12851481740301371)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Unbilled Liability (\20B9 Lac)')
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12852866409301371)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12847693919301369)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12851906417301371)
,p_name=>'P714_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12847693919301369)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From OpenGRIRCost o',
'                Where o.CompanyCode = c.CompanyCode)',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12852045276301371)
,p_name=>'P714_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12847693919301369)
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
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'Start of the FLOW window, which bounds the GRNI Trend chart only. The pending position, its ageing and the register are point-in-time measures taken at the To Date and are not affected by this item.'
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
 p_id=>wwv_flow_imp.id(12852262786301371)
,p_name=>'P714_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12847693919301369)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From OpenGRIRCost o',
'                Where o.LocationCode = l.LocationCode',
'                  And (:P714_COMPANY Is Null Or o.CompanyCode = :P714_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P714_COMPANY'
,p_ajax_items_to_submit=>'P714_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'"Location" is the business term throughout this dashboard; the underlying column is LocationCode and is never renamed, only relabelled. The list shows only locations that actually carry a goods receipt, narrowed by the selected Company.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12852486303301371)
,p_name=>'P714_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12847693919301369)
,p_prompt=>'Panel'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:A;A,B;B'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'A + B'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'GetUserPanelAB_apex() Is Null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'The OpenGRIRCost view carries no Panel column, so panel security on this page is applied through the underlying GRN record rather than the view.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12852623388301371)
,p_name=>'P714_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12847693919301369)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date / As-of'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'End of the flow window AND the As-of Date for the pending position. Receipts dated after this date are excluded, and ageing is measured from the GRN date to this date.'
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
