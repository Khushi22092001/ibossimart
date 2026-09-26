prompt --application/pages/page_00694
begin
--   Manifest
--     PAGE: 00694
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
 p_id=>694
,p_name=>'Receipts and Collections'
,p_alias=>'AR-COLLECTIONS'
,p_step_title=>'Receipts and Collections'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965686798286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Collections are actual RECEIPT voucher lines posted to a customer account between From Date and To Date - never a fall in outstanding, which also moves through credit notes, journals and allocation. This page is a FLOW report: the As-of Date does not'
||' apply to it. Bank is derived from the contra (debit) account on the same receipt voucher, which resolves cleanly. Payment mode is NOT analysed: VoucherDetail.MoneyTransferModeCode is null on all 114,284 rows and the voucher header carries a mode on '
||'only 225 of 2,551 debtor receipts, so a mode chart would be a lie at 9% coverage.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12721797381300724)
,p_plug_name=>'Collections by Bank'
,p_static_id=>'bank-mix'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Bank is the CONTRA account on the receipt voucher - the account that',
'   was debited when the customer was credited. It is not stored on the',
'   receipt line, and it is the only reliable banking dimension here.',
'   The contra is aggregated per voucher before it is attributed, so a',
'   receipt split across two banks is not double counted. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Rv As (',
'       Select Distinct d.Tno',
'         From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate >= to_date(:P694_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P694_TODATE,''DD-MM-RRRR'') + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P694_PANEL    Is Null Or d.Panel        = :P694_PANEL)',
'          And (:P694_COMPANY  Is Null Or d.CompanyCode  = :P694_COMPANY)',
'          And (:P694_LOCATION Is Null Or d.LocationCode = :P694_LOCATION))',
'Select * From (',
'  Select nvl(p.PartyName, o.AccountCode) As LABEL,',
'         Round(Sum(-o.Amount)/100000,2) As RECEIVED_LAC',
'    From VoucherDetail o',
'    Join Rv On Rv.Tno = o.Tno',
'    Left Join Party p On p.PartyCode = o.AccountCode',
'   Where o.Amount < 0',
'     And o.AccountCode Not In (Select PartyCode From Sd)',
'   Group By o.AccountCode, p.PartyName',
'   Order By Sum(-o.Amount) Desc)',
' Where rownum <= 12',
' /* Outer Order By is required: the inner one only picks the twelve',
'    rows, it does not survive to the result set. */',
' Order By RECEIVED_LAC Desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P694_FROMDATE,P694_TODATE,P694_COMPANY,P694_LOCATION,P694_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12721800915300724)
,p_region_id=>wwv_flow_imp.id(12721797381300724)
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
,p_no_data_found_message=>'No receipt was banked in this period for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12721937824300724)
,p_chart_id=>wwv_flow_imp.id(12721800915300724)
,p_static_id=>'received'
,p_seq=>10
,p_name=>unistr('Received (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12722098719300724)
,p_chart_id=>wwv_flow_imp.id(12721800915300724)
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
 p_id=>wwv_flow_imp.id(12722137950300724)
,p_chart_id=>wwv_flow_imp.id(12721800915300724)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Received (\20B9 Lac)')
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
 p_id=>wwv_flow_imp.id(12722261277300724)
,p_name=>'Receipts and Collections'
,p_static_id=>'command-header'
,p_template=>4502917002193490937
,p_display_sequence=>5
,p_region_css_classes=>'ds-ar-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-ar-head">''',
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Collections</div>''',
'    || ''<h1 class="ds-ar-title">Receipts &amp; Collections</h1>''',
'    || ''<div class="ds-ar-sub">Cash actually received from customers in the period, which bank took it, and how much of it has been applied to a bill</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-calendar"></span>Receipts <b>''',
'       || :P694_FROMDATE || '' &rarr; '' || :P694_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-info-circle"></span><b>Flow report</b> &mdash; not an as-at balance</span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P694_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P694_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P694_PANEL Is Not Null Then :P694_PANEL Else ''A + B'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P694_FROMDATE,P694_TODATE,P694_COMPANY,P694_LOCATION,P694_PANEL'
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
 p_id=>wwv_flow_imp.id(12722326448300724)
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
 p_id=>wwv_flow_imp.id(12722484895300724)
,p_plug_name=>'Daily Collection Trend'
,p_static_id=>'daily-trend'
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
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode)',
'Select to_char(d.VoucherDate,''DD-Mon'') As LABEL,',
'       Round(Sum(d.Amount)/100000,2)   As COLLECTED_LAC',
'  From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And v.DocTypeCode = ''RECEIPT''',
'   And d.VoucherDate >= to_date(:P694_FROMDATE,''DD-MM-RRRR'')',
'   And d.VoucherDate <  to_date(:P694_TODATE,''DD-MM-RRRR'') + 1',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P694_PANEL    Is Null Or d.Panel        = :P694_PANEL)',
'   And (:P694_COMPANY  Is Null Or d.CompanyCode  = :P694_COMPANY)',
'   And (:P694_LOCATION Is Null Or d.LocationCode = :P694_LOCATION)',
' Group By d.VoucherDate',
' Order By d.VoucherDate'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P694_FROMDATE,P694_TODATE,P694_COMPANY,P694_LOCATION,P694_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12722557293300724)
,p_region_id=>wwv_flow_imp.id(12722484895300724)
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
,p_no_data_found_message=>'No collection in this period for the selected scope.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12722615909300724)
,p_chart_id=>wwv_flow_imp.id(12722557293300724)
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
 p_id=>wwv_flow_imp.id(12722782569300725)
,p_chart_id=>wwv_flow_imp.id(12722557293300724)
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
 p_id=>wwv_flow_imp.id(12722834503300725)
,p_chart_id=>wwv_flow_imp.id(12722557293300724)
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
 p_id=>wwv_flow_imp.id(12722904962300725)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p694Filters'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12723098325300725)
,p_name=>'Collection KPIs'
,p_static_id=>'kpi-strip'
,p_template=>4502917002193490937
,p_display_sequence=>20
,p_region_css_classes=>'ds-kpiwrap ds-kpiwrap--cols ds-kpiwrap--5up'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P694_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       Select a.CrVoucherTno Tno, a.CrVoucherSno Sno, Sum(a.Amount) Amt, Count(*) N',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     AgeSplit As (',
'       /* Collection against OLD debt versus CURRENT bills, decided by',
'          the age of the BILL each allocation settled - not by the age',
'          of the receipt. A receipt posted today that clears a',
'          six-month-old invoice is a collection against old debt, and',
'          any other reading would flatter the collection effort. */',
'       Select a.CrVoucherTno Tno, a.CrVoucherSno Sno,',
'              Sum(Case When cv.VoucherDate - dv.VoucherDate > 90 Then a.Amount Else 0 End) OldDebt,',
'              Sum(Case When cv.VoucherDate - dv.VoucherDate <= 90 Then a.Amount Else 0 End) CurrentDebt,',
'              Sum(a.Amount * (cv.VoucherDate - dv.VoucherDate)) LagWeighted',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     R As (',
'       /* One row per receipt LINE in the flow window. Allocation is',
'          joined pre-aggregated to (Tno,Sno) so a receipt settling many',
'          bills is still one row. */',
'       Select d.Tno, d.Sno, d.AccountCode Pty, d.Amount Amt,',
'              nvl(al.Amt,0) Applied, nvl(al.N,0) Bills, d.VoucherDate Vdt,',
'              nvl(ag.OldDebt,0) OldDebt, nvl(ag.CurrentDebt,0) CurrentDebt,',
'              ag.LagWeighted LagW',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Alc al On al.Tno = d.Tno And al.Sno = d.Sno',
'         Left Join AgeSplit ag On ag.Tno = d.Tno And ag.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate >= to_date(:P694_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P694_TODATE,''DD-MM-RRRR'') + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P694_PANEL    Is Null Or d.Panel        = :P694_PANEL)',
'          And (:P694_COMPANY  Is Null Or d.CompanyCode  = :P694_COMPANY)',
'          And (:P694_LOCATION Is Null Or d.LocationCode = :P694_LOCATION)),',
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
'Select ''<a class="ds-kpi ds-kpi--teal" href="#p694register" title="Sum of RECEIPT voucher lines posted to a customer account inside the flow window. An actual transaction total, never a movement in outstanding.">''',
'    || ''<span class="ds-kpi-ic fa fa-download"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Receipts in Period</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Amt >= 10000000 Then to_char(Round(t.Amt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Amt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.Vch,''FM999G990'') || '' receipts from ''',
'    || to_char(t.Pty,''FM999G990'') || '' customers</div></div></a>'' As K1,',
'       ''<div class="ds-kpi ds-kpi--ok" title="The part of period receipts that has been allocated to a bill.">''',
'    || ''<span class="ds-kpi-ic fa fa-link"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Applied to Bills</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Applied >= 10000000 Then to_char(Round(t.Applied/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Applied/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">''',
'    || Case When t.Amt > 0 Then to_char(Round(100 * t.Applied / t.Amt,1),''FM990D0'') || ''% of receipts'' Else ''&mdash;'' End',
'    || '' &middot; '' || to_char(t.Settlements,''FM999G990'') || '' bill settlements</div></div></div>'' As K2,',
'       ''<a class="ds-kpi ds-kpi--risk" href="''',
'    || apex_page.get_url(p_page => 695, p_clear_cache => ''695'',',
'         p_items => ''P695_FROMDATE,P695_TODATE,P695_COMPANY,P695_LOCATION,P695_PANEL'',',
'         p_values => :P694_FROMDATE ||'',''|| :P694_TODATE ||'',''|| :P694_COMPANY ||'',''|| :P694_LOCATION ||'',''|| :P694_PANEL)',
'    || ''" title="The part of period receipts still sitting on account. Only 31% of AR lines in this ledger have ever been allocated.">''',
'    || ''<span class="ds-kpi-ic fa fa-unlink"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Still Unapplied</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.Unapplied >= 10000000 Then to_char(Round(t.Unapplied/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.Unapplied/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.NoAlloc,''FM999G990'')',
'    || '' receipts never allocated at all</div></div></a>'' As K3,',
'       ''<div class="ds-kpi ds-kpi--struct" title="How period receipts split between fully applied, partly applied and untouched.">''',
'    || ''<span class="ds-kpi-ic fa fa-pie-chart"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Application Status</div><div class="ds-kpi-n">''',
'    || to_char(t.FullyApplied,''FM999G990'') || '' / '' || to_char(t.Partial,''FM999G990'')',
'    || '' / '' || to_char(t.NoAlloc,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">fully applied / partial / unapplied</div></div></div>'' As K4,',
'       ''<div class="ds-kpi ds-kpi--gold" title="Average value of a receipt line in this period.">''',
'    || ''<span class="ds-kpi-ic fa fa-calculator"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Average Receipt</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.AvgAmt >= 100000 Then to_char(Round(t.AvgAmt/100000,2),''FM999G990D00'') || '' Lac''',
'            Else to_char(Round(t.AvgAmt,0),''FM999G99G99G990'') End',
'    || ''</div><div class="ds-kpi-sub">'' || to_char(t.Lines,''FM999G990'') || '' receipt lines</div></div></div>'' As K5,',
'       ''<div class="ds-kpi ds-kpi--amber" title="Collections that cleared a bill more than 90 days older than the receipt. Aged by the BILL, not the receipt - a payment today against a six-month-old invoice is collection against old debt.">''',
'    || ''<span class="ds-kpi-ic fa fa-hourglass-end"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Collection vs Old Debt</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.OldDebt >= 10000000 Then to_char(Round(t.OldDebt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.OldDebt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">bill older than 90 days at settlement</div></div></div>'' As K7,',
'       ''<div class="ds-kpi ds-kpi--ok" title="Collections that cleared a bill within 90 days of its own date.">''',
'    || ''<span class="ds-kpi-ic fa fa-check-circle-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Collection vs Current Bills</div><div class="ds-kpi-n">&#8377;''',
'    || Case When t.CurrentDebt >= 10000000 Then to_char(Round(t.CurrentDebt/10000000,2),''FM999G990D00'') || '' Cr''',
'            Else to_char(Round(t.CurrentDebt/100000,2),''FM999G990D00'') || '' Lac'' End',
'    || ''</div><div class="ds-kpi-sub">settled within 90 days of the bill</div></div></div>'' As K8,',
'       ''<div class="ds-kpi ds-kpi--struct" title="Amount-weighted days between a bill and the receipt that settled it. Measured only over allocations - receipts that were never applied carry no lag and are excluded from both sides.">''',
'    || ''<span class="ds-kpi-ic fa fa-clock-o"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Average Allocation Lag</div><div class="ds-kpi-n">''',
'    || nvl(to_char(Round(t.LagW / Nullif(t.AppliedForLag,0),0),''FM999G990''),''&mdash;'')',
'    || '' <span style="font-size:15px">days</span></div>''',
'    || ''<div class="ds-kpi-sub">weighted by amount, over applied receipts only</div></div></div>'' As K9,',
'       ''<div class="ds-kpi ds-kpi--violet" title="Receipts that settled at least one bill but still carry a residual balance on account.">''',
'    || ''<span class="ds-kpi-ic fa fa-adjust"></span><div class="ds-kpi-body">''',
'    || ''<div class="ds-kpi-t">Partial Settlements</div><div class="ds-kpi-n">''',
'    || to_char(t.Partial,''FM999G990'') || ''</div>''',
'    || ''<div class="ds-kpi-sub">applied in part, residual still on account</div></div></div>'' As K10,',
'       /* Stated, not silently omitted. */',
'       ''<div class="ds-arexcl"><div class="ds-arexcl-h">Payment Mode &mdash; not analysed</div>''',
'    || ''<div class="ds-arexcl-b">VoucherDetail.MoneyTransferModeCode is null on all 114,284 rows and the voucher header carries a mode on only <b>225 of 2,551</b> debtor receipts. ''',
'    || ''At 9% coverage a mode breakdown would mislead. <b>Bank is reliable</b> and is analysed below instead, taken from the contra account on the receipt voucher.</div></div>'' As K11',
'  From T t'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P694_FROMDATE,P694_TODATE,P694_COMPANY,P694_LOCATION,P694_PANEL'
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
 p_id=>wwv_flow_imp.id(12723143714300725)
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
 p_id=>wwv_flow_imp.id(12723257604300725)
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
 p_id=>wwv_flow_imp.id(12723372067300725)
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
 p_id=>wwv_flow_imp.id(12723424300300725)
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
 p_id=>wwv_flow_imp.id(12723503830300725)
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
 p_id=>wwv_flow_imp.id(12723619297300725)
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
 p_id=>wwv_flow_imp.id(12723750965300725)
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
 p_id=>wwv_flow_imp.id(12723845223300725)
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
 p_id=>wwv_flow_imp.id(12723917780300725)
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
 p_id=>wwv_flow_imp.id(12724008940300725)
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12724152807300725)
,p_name=>'Go to'
,p_static_id=>'quick-links'
,p_template=>4502917002193490937
,p_display_sequence=>900
,p_region_css_classes=>'ds-kpiwrap ds-arnavwrap'
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
'  Select 690 Id, ''AR Command Centre''          Nm, ''Exposure, ageing, collections and the exceptions behind every number'' Sub, ''fa-dashboard''              Ic From dual Union All',
'  Select 691,    ''Party-wise Outstanding'',        ''One row per customer, with ageing and the contact position'',           ''fa-users''                  From dual Union All',
'  Select 692,    ''Bill-wise Outstanding'',         ''Every open item at line level, with its source document'',              ''fa-list-alt''               From dual Union All',
'  Select 693,    ''Debtor 360'',                    ''One customer from every angle - bills, receipts, credits, statement'',  ''fa-user''                   From dual Union All',
'  Select 694,    ''Receipts and Collections'',      ''Cash actually received, which bank took it, how much is applied'',      ''fa-download''               From dual Union All',
'  Select 695,    ''Advances and Unapplied Cash'',   ''Customer money already held, and the receivable it could clear'',       ''fa-hand-o-up''              From dual Union All',
'  Select 696,    ''Exceptions and Controls'',       ''Every control, what it tests, and the records that fail it'',           ''fa-exclamation-triangle''   From dual Union All',
'  Select 697,    ''Reconciliation and Data Health'',''The open-item register against the general-ledger control account'',    ''fa-balance-scale''          From dual Union All',
'  Select 699,    ''Trend Analysis'',                ''How the position moved, month by month'',                               ''fa-line-chart''             From dual Union All',
'  Select 700,    ''Daily Collection MIS'',          ''One day: position, movement, and what remains unexplained'',            ''fa-calendar-o''             From dual Union All',
'  Select 701,    ''Weekly AR Review'',              ''Opening against closing, and the controls that failed in the week'',    ''fa-calendar''               From dual Union All',
'  Select 702,    ''Monthly Management MIS'',        ''The nine-section management pack'',                                     ''fa-file-text-o''            From dual)',
'Select ''<a class="ds-kpi ds-kpi--link ds-kpi--teal" href="''',
'    || apex_page.get_url(',
'         p_page        => Pg.Id,',
'         p_clear_cache => to_char(Pg.Id),',
'         /* Page 700 is a single-day report and has no From/To pair -',
'            naming an item that does not exist on the target page',
'            fails at run time, so its filter list is built separately. */',
'         p_items  => Case When Pg.Id = 700',
'                          Then ''P700_DAY,P700_COMPANY,P700_LOCATION,P700_PANEL''',
'                          Else ''P''||Pg.Id||''_FROMDATE,P''||Pg.Id||''_TODATE,P''',
'                               ||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION,P''||Pg.Id||''_PANEL'' End,',
'         p_values => Case When Pg.Id = 700',
'                          Then :P694_TODATE ||'',''|| :P694_COMPANY ||'',''|| :P694_LOCATION ||'',''|| :P694_PANEL',
'                          Else :P694_FROMDATE ||'',''|| :P694_TODATE ||'',''|| :P694_COMPANY ||'',''|| :P694_LOCATION ||'',''|| :P694_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 694',
'   And (APEX_CUSTOM_AUTH.GET_USERNAME = ''BOSS''',
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
'/* Render nothing rather than an empty panel when the reader has',
'   privilege on no other page in the section. */',
'Select 1 From dual',
' Where APEX_CUSTOM_AUTH.GET_USERNAME = ''BOSS''',
'    Or Exists (',
'         Select 1',
'           From ApexReportPrivilege a',
'           Join ApexReportPrivilegeDetail b On b.Tno = a.Tno',
'           Join BossUser c On c.BossUserCode = a.BossUserCode',
'          Where b.PageID Between 690 And 702',
'            And b.PageID <> 694',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P694_FROMDATE,P694_TODATE,P694_COMPANY,P694_LOCATION,P694_PANEL'
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
 p_id=>wwv_flow_imp.id(12724238226300726)
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
 p_id=>wwv_flow_imp.id(12724326307300726)
,p_plug_name=>'Receipt Register'
,p_static_id=>'register'
,p_region_name=>'p694register'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Asof As (Select to_date(:P694_TODATE,''DD-MM-RRRR'') D From dual),',
'     Alc As (',
'       Select a.CrVoucherTno Tno, a.CrVoucherSno Sno,',
'              Sum(a.Amount) Amt, Count(*) N, Max(dv.VoucherDate) LastAlloc',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Asof',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= Asof.D And cv.VoucherDate <= Asof.D',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     Bank As (',
'       /* The contra account, reduced to ONE row per voucher before it',
'          joins. A receipt voucher can debit more than one bank line;',
'          taking the largest keeps the register at one row per receipt',
'          instead of fanning the amount out across banks. */',
'       Select Tno, AccountCode Bnk From (',
'         Select o.Tno, o.AccountCode,',
'                Row_Number() Over (Partition By o.Tno Order By o.Amount) Rn',
'           From VoucherDetail o',
'           Join Voucher bv On bv.Tno = o.Tno',
'          Where o.Amount < 0',
'            And bv.DocTypeCode = ''RECEIPT''',
'            And o.AccountCode Not In (Select PartyCode From Sd))',
'        Where Rn = 1)',
'Select d.Tno                                          As VOUCHER_TNO,',
'       v.VoucherNo                                    As RECEIPT_NO,',
'       d.VoucherDate                                  As RECEIPT_DATE,',
'       nvl(p.PartyName, d.AccountCode) As CUSTOMER,',
'       d.AccountCode                                  As PARTY_CODE,',
'       nvl(bp.PartyName, b.Bnk)     As BANK_OR_CASH,',
'       Round(d.Amount,2)                              As RECEIPT_AMOUNT,',
'       Round(nvl(al.Amt,0),2)                         As APPLIED,',
'       Round(d.Amount - nvl(al.Amt,0),2)              As UNAPPLIED,',
'       nvl(al.N,0)                                    As BILLS_SETTLED,',
'       Case When nvl(al.N,0) = 0',
'                 Then ''<span class="ds-archip ds-archip--fail">Unapplied</span>''',
'            When d.Amount - nvl(al.Amt,0) > 0.005',
'                 Then ''<span class="ds-archip ds-archip--warn">Partly applied</span>''',
'            Else ''<span class="ds-archip ds-archip--pass">Fully applied</span>'' End As STATUS,',
'       al.LastAlloc                                   As LAST_ALLOCATION,',
'       Case When al.LastAlloc Is Not Null',
'            Then al.LastAlloc - d.VoucherDate End     As ALLOCATION_LAG_DAYS,',
'       v.MoneyTransferReferenceNo   As BANK_REFERENCE,',
'       /* Aliased PAYMENT_MODE, not MODE: MODE is an Oracle reserved',
'          word and an unquoted column alias of that name raises',
'          ORA-00923 at render. apex validate does not execute region',
'          SQL, so it passes this cleanly. */',
'       nvl(v.MoneyTransferModeCode,''not recorded'') As PAYMENT_MODE,',
'       nvl(c.CompanyName, d.CompanyCode)  As COMPANY,',
'       nvl(l.LocationName, d.LocationCode) As LOCATION,',
'       d.Panel                                        As PANEL,',
'       substr(d.Narration,1,300)    As NARRATION',
'  From VoucherDetail d',
'  Join Voucher v On v.Tno = d.Tno',
'  Left Join Alc al On al.Tno = d.Tno And al.Sno = d.Sno',
'  Left Join Bank b On b.Tno = d.Tno',
'  Left Join Party bp On bp.PartyCode = b.Bnk',
'  Left Join Party p On p.PartyCode = d.AccountCode',
'  Left Join Company c On c.CompanyCode = d.CompanyCode',
'  Left Join Location l On l.LocationCode = d.LocationCode',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And v.DocTypeCode = ''RECEIPT''',
'   And d.VoucherDate >= to_date(:P694_FROMDATE,''DD-MM-RRRR'')',
'   And d.VoucherDate <  to_date(:P694_TODATE,''DD-MM-RRRR'') + 1',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P694_PANEL    Is Null Or d.Panel        = :P694_PANEL)',
'   And (:P694_COMPANY  Is Null Or d.CompanyCode  = :P694_COMPANY)',
'   And (:P694_LOCATION Is Null Or d.LocationCode = :P694_LOCATION)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P694_FROMDATE,P694_TODATE,P694_COMPANY,P694_LOCATION,P694_PANEL'
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
 p_id=>wwv_flow_imp.id(12724436937300726)
,p_max_row_count=>'200000'
,p_no_data_found_message=>'No receipt was posted to a customer account in this period for the selected scope.'
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
 p_id=>wwv_flow_imp.id(12724522902300726)
,p_db_column_name=>'ALLOCATION_LAG_DAYS'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Allocation Lag (days)'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12724623201300726)
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
 p_id=>wwv_flow_imp.id(12724770451300726)
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
 p_id=>wwv_flow_imp.id(12724842653300726)
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
 p_id=>wwv_flow_imp.id(12724940450300726)
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
 p_id=>wwv_flow_imp.id(12725023342300726)
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
 p_id=>wwv_flow_imp.id(12725110804300726)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Customer'
,p_column_link=>'f?p=&APP_ID.:693:&SESSION.::&DEBUG.:693:P693_PARTY,P693_FROMDATE,P693_TODATE,P693_COMPANY,P693_LOCATION,P693_PANEL:#PARTY_CODE#,&P694_FROMDATE.,&P694_TODATE.,&P694_COMPANY.,&P694_LOCATION.,&P694_PANEL.'
,p_column_linktext=>'#CUSTOMER#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12725285228300726)
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
 p_id=>wwv_flow_imp.id(12725344638300727)
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
 p_id=>wwv_flow_imp.id(12725418001300727)
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
 p_id=>wwv_flow_imp.id(12725527224300727)
,p_db_column_name=>'PANEL'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Panel'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12725620106300727)
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
 p_id=>wwv_flow_imp.id(12725774830300727)
,p_db_column_name=>'PAYMENT_MODE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12725885958300727)
,p_db_column_name=>'RECEIPT_AMOUNT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>unistr('Receipt (\20B9)')
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12725992500300727)
,p_db_column_name=>'RECEIPT_DATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Receipt Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12726004414300727)
,p_db_column_name=>'RECEIPT_NO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Receipt No'
,p_column_link=>'f?p=&APP_ID.:678:&SESSION.::&DEBUG.:678:P678_TNO:#VOUCHER_TNO#'
,p_column_linktext=>'#RECEIPT_NO#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12726149087300727)
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
 p_id=>wwv_flow_imp.id(12726251293300727)
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
 p_id=>wwv_flow_imp.id(12726384849300727)
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
 p_id=>wwv_flow_imp.id(12726490556300727)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'69401'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'RECEIPT_NO:RECEIPT_DATE:CUSTOMER:BANK_OR_CASH:RECEIPT_AMOUNT:APPLIED:UNAPPLIED:STATUS:BILLS_SETTLED:ALLOCATION_LAG_DAYS'
,p_sum_columns_on_break=>'RECEIPT_AMOUNT:APPLIED:UNAPPLIED'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12727087683300757)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12722904962300725)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12727152508300757)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12722904962300725)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:690:&SESSION.::&DEBUG.::P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL:&P694_FROMDATE.,&P694_TODATE.,&P694_COMPANY.,&P694_LOCATION.,&P694_PANEL.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12726569898300727)
,p_name=>'P694_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12722904962300725)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYDEBTORS'' Connect By Prior PartyCode = ParentCode))',
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
 p_id=>wwv_flow_imp.id(12726646239300757)
,p_name=>'P694_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12722904962300725)
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
 p_id=>wwv_flow_imp.id(12726723666300757)
,p_name=>'P694_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12722904962300725)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.LocationCode = l.LocationCode',
'                  And v.AccountCode In (Select PartyCode From Party',
'                        Start With PartyCode = ''SUNDRYDEBTORS'' Connect By Prior PartyCode = ParentCode)',
'                  And (:P694_COMPANY Is Null Or v.CompanyCode = :P694_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P694_COMPANY'
,p_ajax_items_to_submit=>'P694_COMPANY'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(12726826480300757)
,p_name=>'P694_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12722904962300725)
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
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12726988760300757)
,p_name=>'P694_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12722904962300725)
,p_item_default=>'Select to_char(trunc(sysdate),''DD-MM-RRRR'') From dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3033038003750078790
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
