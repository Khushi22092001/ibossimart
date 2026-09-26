prompt --application/pages/page_00699
begin
--   Manifest
--     PAGE: 00699
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
 p_id=>699
,p_name=>'AR Trend Analysis'
,p_alias=>'AR-TREND-ANALYSIS'
,p_step_title=>'AR Trend Analysis'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965686798286257)
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'Every series here is a POINT-IN-TIME position re-derived at each month end, not a running total of period movements - outstanding at 30-Jun is what was actually open on that date, with allocations counted only if both their vouchers were dated on or '
||'before it. That is why the month spine is cross-joined into the open-item layer rather than the layer being summed by month. Month ends before 01-04-2026 are not shown: VoucherDetail begins 01-03-2026 and prior-year AR arrives as OPENING journals dat'
||'ed 31-03-2026, so an earlier point would be reconstructed from a carry-forward that does not represent a real position.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12745450202300865)
,p_plug_name=>'Ageing Mix Trend'
,p_static_id=>'ageing-mix'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Composition of the open receivable at each month end. Ageing here is',
'   on the DOCUMENT basis deliberately: on the Due basis 72% of value',
'   would land in Cannot Age at every point and the chart would say',
'   nothing about how the mix is moving. The document basis ages every',
'   item, which is what a mix chart needs. The page says so. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Spine As (',
'       Select Me From (',
'         Select Least(Last_Day(Add_Months(trunc(to_date(:P699_FROMDATE,''DD-MM-RRRR''),''MM''), Level - 1)),',
'                      to_date(:P699_TODATE,''DD-MM-RRRR'')) Me',
'           From dual',
'        Connect By Level <= Months_Between(trunc(to_date(:P699_TODATE,''DD-MM-RRRR''),''MM''),',
'                                           trunc(to_date(:P699_FROMDATE,''DD-MM-RRRR''),''MM'')) + 1)',
'        Where Me >= date ''2026-04-01''),',
'     Ln As (',
'       Select d.Tno, d.Sno, d.Amount Amt, d.VoucherDate Vdt,',
'              coalesce(i.InvoiceDate, ao.BillDate, d.VoucherDate) DocDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Invoice i On v.ModuleCode = ''INVOICE'' And i.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING'' And ao.Tno = d.ModuleTno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P699_PANEL    Is Null Or d.Panel        = :P699_PANEL)',
'          And (:P699_COMPANY  Is Null Or d.CompanyCode  = :P699_COMPANY)',
'          And (:P699_LOCATION Is Null Or d.LocationCode = :P699_LOCATION)),',
'     AlSpine As (',
'       Select s.Me, a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Spine s',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= s.Me And cv.VoucherDate <= s.Me',
'        Group By s.Me, a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select s.Me, a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Spine s',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= s.Me And cv.VoucherDate <= s.Me',
'        Group By s.Me, a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Me, Tno, Sno, Sum(Amt) Amt From AlSpine Group By Me, Tno, Sno),',
'     P As (',
'       Select s.Me, -(l.Amt - nvl(al.Amt,0)) Recv, s.Me - l.DocDate Age',
'         From Ln l',
'         Join Spine s On l.Vdt <= s.Me',
'         Left Join Al al On al.Me = s.Me And al.Tno = l.Tno And al.Sno = l.Sno)',
'Select to_char(Me,''Mon-RR'')                                                  As LABEL,',
'       Round(Sum(Case When Recv > 0 And Age <=  30 Then Recv Else 0 End)/10000000,2) As D0_30,',
'       Round(Sum(Case When Recv > 0 And Age >  30 And Age <=  60 Then Recv Else 0 End)/10000000,2) As D31_60,',
'       Round(Sum(Case When Recv > 0 And Age >  60 And Age <=  90 Then Recv Else 0 End)/10000000,2) As D61_90,',
'       Round(Sum(Case When Recv > 0 And Age >  90 And Age <= 180 Then Recv Else 0 End)/10000000,2) As D91_180,',
'       Round(Sum(Case When Recv > 0 And Age > 180 Then Recv Else 0 End)/10000000,2) As D180_PLUS',
'  From P Group By Me Order By Me'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P699_FROMDATE,P699_TODATE,P699_COMPANY,P699_LOCATION,P699_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12745545830300865)
,p_region_id=>wwv_flow_imp.id(12745450202300865)
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
,p_no_data_found_message=>'No open receivable at any month end in this window.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12745641438300865)
,p_chart_id=>wwv_flow_imp.id(12745545830300865)
,p_static_id=>'b1'
,p_seq=>10
,p_name=>unistr('0\201330 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D0_30'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12745711785300865)
,p_chart_id=>wwv_flow_imp.id(12745545830300865)
,p_static_id=>'b2'
,p_seq=>20
,p_name=>unistr('31\201360 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D31_60'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12745882440300865)
,p_chart_id=>wwv_flow_imp.id(12745545830300865)
,p_static_id=>'b3'
,p_seq=>30
,p_name=>unistr('61\201390 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D61_90'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12745909627300865)
,p_chart_id=>wwv_flow_imp.id(12745545830300865)
,p_static_id=>'b4'
,p_seq=>40
,p_name=>unistr('91\2013180 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D91_180'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12746079094300865)
,p_chart_id=>wwv_flow_imp.id(12745545830300865)
,p_static_id=>'b5'
,p_seq=>50
,p_name=>unistr('Over 180 (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'D180_PLUS'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12746129983300865)
,p_chart_id=>wwv_flow_imp.id(12745545830300865)
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
 p_id=>wwv_flow_imp.id(12746241399300865)
,p_chart_id=>wwv_flow_imp.id(12745545830300865)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Open Receivable (\20B9 Cr)')
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
 p_id=>wwv_flow_imp.id(12746398795300865)
,p_plug_name=>'How these series are built'
,p_static_id=>'basis-note'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-arnote"><span class="fa fa-line-chart"></span><div>',
'  <b>Each point is a position, not a movement.</b> Outstanding at a month end is re-derived from the',
'  open-item layer as at that date, counting an allocation only when <i>both</i> of its vouchers are dated',
'  on or before it &mdash; so a bill paid in July still shows open at the end of June.',
'  Billing and Collection are the exception: those two <i>are</i> flows, summed within each month.',
'  <br><br>',
'  Month ends before <b>01-04-2026</b> are not plotted. <code>VoucherDetail</code> begins 01-03-2026 and',
'  prior-year receivables arrive as <code>OPENING</code> journals dated 31-03-2026, so any earlier point',
'  would be an artefact of the carry-forward rather than a real position.',
'</div></div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12746411833300865)
,p_plug_name=>'Billing vs Collection'
,p_static_id=>'billing-collection'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>50
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* These two ARE flows and are summed within each month - the one place',
'   on this page where that is the correct treatment. Collection is the',
'   credit side of RECEIPT vouchers, never a fall in outstanding. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode)',
'Select to_char(trunc(d.VoucherDate,''MM''),''Mon-RR'') As LABEL,',
'       Round(Sum(Case When v.DocTypeCode In (''SALE'',''SERVICEBILL'') And d.Amount < 0',
'                      Then -d.Amount Else 0 End)/10000000,2) As BILLING_CR,',
'       Round(Sum(Case When v.DocTypeCode = ''RECEIPT'' And d.Amount > 0',
'                      Then d.Amount Else 0 End)/10000000,2)  As COLLECTION_CR,',
'       Round(Sum(Case When v.DocTypeCode = ''CREDITNOTE'' And d.Amount > 0',
'                      Then d.Amount Else 0 End)/10000000,2)  As CREDITNOTE_CR',
'  From VoucherDetail d Join Voucher v On v.Tno = d.Tno',
' Where d.AccountCode In (Select PartyCode From Sd)',
'   And d.VoucherDate >= to_date(:P699_FROMDATE,''DD-MM-RRRR'')',
'   And d.VoucherDate <  to_date(:P699_TODATE,''DD-MM-RRRR'') + 1',
'   And ((Select GetUserPanelAB_apex() From dual) Is Null',
'        Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'   And (:P699_PANEL    Is Null Or d.Panel        = :P699_PANEL)',
'   And (:P699_COMPANY  Is Null Or d.CompanyCode  = :P699_COMPANY)',
'   And (:P699_LOCATION Is Null Or d.LocationCode = :P699_LOCATION)',
' Group By trunc(d.VoucherDate,''MM'')',
' Order By trunc(d.VoucherDate,''MM'')'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P699_FROMDATE,P699_TODATE,P699_COMPANY,P699_LOCATION,P699_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12746590966300865)
,p_region_id=>wwv_flow_imp.id(12746411833300865)
,p_chart_type=>'bar'
,p_height=>'330'
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
,p_no_data_found_message=>'Nothing was billed or collected in this window.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12746693950300865)
,p_chart_id=>wwv_flow_imp.id(12746590966300865)
,p_static_id=>'billing'
,p_seq=>10
,p_name=>unistr('Billing (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'BILLING_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12746790192300865)
,p_chart_id=>wwv_flow_imp.id(12746590966300865)
,p_static_id=>'collection'
,p_seq=>20
,p_name=>unistr('Collection (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'COLLECTION_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12746864306300866)
,p_chart_id=>wwv_flow_imp.id(12746590966300865)
,p_static_id=>'creditnote'
,p_seq=>30
,p_name=>unistr('Credit Notes (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'CREDITNOTE_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12746944328300866)
,p_chart_id=>wwv_flow_imp.id(12746590966300865)
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
 p_id=>wwv_flow_imp.id(12747094972300866)
,p_chart_id=>wwv_flow_imp.id(12746590966300865)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\20B9 Crore')
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
 p_id=>wwv_flow_imp.id(12747152811300866)
,p_name=>'AR Trend Analysis'
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
'    || ''<div class="ds-ar-eyebrow">Receivables &middot; Trend</div>''',
'    || ''<h1 class="ds-ar-title">AR Trend Analysis</h1>''',
'    || ''<div class="ds-ar-sub">Outstanding, ageing mix, billing against collection and receipt application, each re-derived at every month end in the window</div>''',
'    || ''<div class="ds-ar-context">''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-calendar"></span>Window <b>''',
'       || :P699_FROMDATE || '' &rarr; '' || :P699_TODATE || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-crosshairs"></span>Each point is a <b>position at that month end</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P699_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P699_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-ar-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P699_PANEL Is Not Null Then :P699_PANEL Else ''A + B'' End || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P699_FROMDATE,P699_TODATE,P699_COMPANY,P699_LOCATION,P699_PANEL'
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
 p_id=>wwv_flow_imp.id(12747299796300866)
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
 p_id=>wwv_flow_imp.id(12747372018300866)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p699Filters'
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
 p_id=>wwv_flow_imp.id(12747433085300866)
,p_plug_name=>'Outstanding Trend'
,p_static_id=>'outstanding-trend'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>30
,p_plug_grid_column_span=>12
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* THE MONTH SPINE IS CROSS-JOINED INTO THE OPEN-ITEM LAYER.',
'   Summing period movements would give a running total, which is a',
'   different (and wrong) thing: it cannot show a bill that was open in',
'   June and settled in July as open in June. The cost is one pass over',
'   the AR grain per month end - about 9,700 lines x 6 months here,',
'   which is small enough to do honestly. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Spine As (',
'       Select Me From (',
'         Select Least(Last_Day(Add_Months(trunc(to_date(:P699_FROMDATE,''DD-MM-RRRR''),''MM''), Level - 1)),',
'                      to_date(:P699_TODATE,''DD-MM-RRRR'')) Me',
'           From dual',
'        Connect By Level <= Months_Between(trunc(to_date(:P699_TODATE,''DD-MM-RRRR''),''MM''),',
'                                           trunc(to_date(:P699_FROMDATE,''DD-MM-RRRR''),''MM'')) + 1)',
'        Where Me >= date ''2026-04-01''),',
'     Ln As (',
'       Select d.Tno, d.Sno, d.Amount Amt, d.VoucherDate Vdt,',
'              coalesce(i.DueDate, sb.DueDate, ao.BillDueDate) DueDate',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Invoice     i  On v.ModuleCode = ''INVOICE''     And i.Tno  = v.ModuleTno',
'         Left Join ServiceBill sb On v.ModuleCode = ''SERVICEBILL'' And sb.Tno = v.ModuleTno',
'         Left Join AccountOpening ao On v.VoucherNo = ''OPENING''   And ao.Tno = d.ModuleTno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P699_PANEL    Is Null Or d.Panel        = :P699_PANEL)',
'          And (:P699_COMPANY  Is Null Or d.CompanyCode  = :P699_COMPANY)',
'          And (:P699_LOCATION Is Null Or d.LocationCode = :P699_LOCATION)),',
'     AlSpine As (',
'       Select s.Me, a.DrVoucherTno Tno, a.DrVoucherSno Sno, -Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Spine s',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= s.Me And cv.VoucherDate <= s.Me',
'        Group By s.Me, a.DrVoucherTno, a.DrVoucherSno',
'       Union All',
'       Select s.Me, a.CrVoucherTno, a.CrVoucherSno, Sum(a.Amount)',
'         From DrCrAllocation a, Voucher dv, Voucher cv, Spine s',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'          And dv.VoucherDate <= s.Me And cv.VoucherDate <= s.Me',
'        Group By s.Me, a.CrVoucherTno, a.CrVoucherSno),',
'     Al As (Select Me, Tno, Sno, Sum(Amt) Amt From AlSpine Group By Me, Tno, Sno),',
'     P As (',
'       Select s.Me, -(l.Amt - nvl(al.Amt,0)) Recv,',
'              Case When l.DueDate Is Null Then Null',
'                   Else Greatest(s.Me - l.DueDate,0) End DaysOd',
'         From Ln l',
'         Join Spine s On l.Vdt <= s.Me',
'         Left Join Al al On al.Me = s.Me And al.Tno = l.Tno And al.Sno = l.Sno)',
'Select to_char(Me,''Mon-RR'')                                                       As LABEL,',
'       Round(Sum(Case When Recv > 0 Then Recv Else 0 End)/10000000,2)             As GROSS_CR,',
'       Round(Sum(Case When Recv > 0 And DaysOd > 0 Then Recv Else 0 End)/10000000,2) As OVERDUE_CR,',
'       Round(Sum(Case When Recv > 0 And DaysOd > 90 Then Recv Else 0 End)/10000000,2) As OVER90_CR,',
'       Round(Sum(Case When Recv < 0 Then -Recv Else 0 End)/10000000,2)            As CREDITS_CR,',
'       Round(Sum(Recv)/10000000,2)                                                As NET_CR',
'  From P Group By Me Order By Me'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P699_FROMDATE,P699_TODATE,P699_COMPANY,P699_LOCATION,P699_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12747577952300866)
,p_region_id=>wwv_flow_imp.id(12747433085300866)
,p_chart_type=>'line'
,p_height=>'360'
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
,p_no_data_found_message=>'No month end in this window falls on or after 01-04-2026, so no position can be reconstructed.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12747627557300866)
,p_chart_id=>wwv_flow_imp.id(12747577952300866)
,p_static_id=>'credits'
,p_seq=>40
,p_name=>unistr('Customer Credits (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'CREDITS_CR'
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
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12747763104300866)
,p_chart_id=>wwv_flow_imp.id(12747577952300866)
,p_static_id=>'gross'
,p_seq=>10
,p_name=>unistr('Gross Outstanding (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'GROSS_CR'
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
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12747825054300866)
,p_chart_id=>wwv_flow_imp.id(12747577952300866)
,p_static_id=>'net'
,p_seq=>50
,p_name=>unistr('Net Exposure (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'NET_CR'
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
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12747935321300866)
,p_chart_id=>wwv_flow_imp.id(12747577952300866)
,p_static_id=>'over90'
,p_seq=>30
,p_name=>unistr('90+ Days (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'OVER90_CR'
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
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12748056289300866)
,p_chart_id=>wwv_flow_imp.id(12747577952300866)
,p_static_id=>'overdue'
,p_seq=>20
,p_name=>unistr('Overdue (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'line'
,p_items_value_column_name=>'OVERDUE_CR'
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
 p_id=>wwv_flow_imp.id(12748180350300866)
,p_chart_id=>wwv_flow_imp.id(12747577952300866)
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
 p_id=>wwv_flow_imp.id(12748229437300898)
,p_chart_id=>wwv_flow_imp.id(12747577952300866)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('\20B9 Crore')
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
 p_id=>wwv_flow_imp.id(12748391601300898)
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
'                          Then :P699_TODATE ||'',''|| :P699_COMPANY ||'',''|| :P699_LOCATION ||'',''|| :P699_PANEL',
'                          Else :P699_FROMDATE ||'',''|| :P699_TODATE ||'',''|| :P699_COMPANY ||'',''|| :P699_LOCATION ||'',''|| :P699_PANEL End)',
'    || ''"><span class="ds-kpi-ic fa '' || Pg.Ic || ''"></span>''',
'    || ''<div class="ds-kpi-body"><div class="ds-kpi-t">'' || Pg.Nm || ''</div>''',
'    || ''<div class="ds-kpi-sub">'' || Pg.Sub || ''</div></div></a>'' As CARD',
'  From Pg',
' Where Pg.Id <> 699',
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
'            And b.PageID <> 699',
'            And (upper(c.BossUserName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)',
'                 Or upper(c.LoginName) = upper(APEX_CUSTOM_AUTH.GET_USERNAME)))'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P699_FROMDATE,P699_TODATE,P699_COMPANY,P699_LOCATION,P699_PANEL'
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
 p_id=>wwv_flow_imp.id(12748492818300899)
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
 p_id=>wwv_flow_imp.id(12748544384300899)
,p_plug_name=>'Receipt Application'
,p_static_id=>'receipt-application'
,p_region_css_classes=>'ds-dash-panel'
,p_region_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4073835273271169698
,p_plug_display_sequence=>52
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Of the cash received in each month, how much has since been applied',
'   to a bill and how much is still on account. Applied is measured as at',
'   TODAY, not as at the month end - the question this answers is "has',
'   this cash been matched yet", which is a current-state question. */',
'With Sd As (',
'       Select PartyCode From Party',
'        Start With PartyCode = ''SUNDRYDEBTORS''',
'        Connect By Prior PartyCode = ParentCode),',
'     Alc As (',
'       Select a.CrVoucherTno Tno, a.CrVoucherSno Sno, Sum(a.Amount) Amt',
'         From DrCrAllocation a, Voucher dv, Voucher cv',
'        Where dv.Tno = a.DrVoucherTno And cv.Tno = a.CrVoucherTno',
'        Group By a.CrVoucherTno, a.CrVoucherSno),',
'     R As (',
'       Select trunc(d.VoucherDate,''MM'') Mth, d.Amount Amt, nvl(al.Amt,0) Applied',
'         From VoucherDetail d',
'         Join Voucher v On v.Tno = d.Tno',
'         Left Join Alc al On al.Tno = d.Tno And al.Sno = d.Sno',
'        Where d.AccountCode In (Select PartyCode From Sd)',
'          And v.DocTypeCode = ''RECEIPT''',
'          And d.VoucherDate >= to_date(:P699_FROMDATE,''DD-MM-RRRR'')',
'          And d.VoucherDate <  to_date(:P699_TODATE,''DD-MM-RRRR'') + 1',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null',
'               Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P699_PANEL    Is Null Or d.Panel        = :P699_PANEL)',
'          And (:P699_COMPANY  Is Null Or d.CompanyCode  = :P699_COMPANY)',
'          And (:P699_LOCATION Is Null Or d.LocationCode = :P699_LOCATION))',
'Select to_char(Mth,''Mon-RR'')                            As LABEL,',
'       Round(Sum(Applied)/10000000,2)                   As APPLIED_CR,',
'       Round(Sum(Amt - Applied)/10000000,2)             As UNAPPLIED_CR',
'  From R Group By Mth Order By Mth'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P699_FROMDATE,P699_TODATE,P699_COMPANY,P699_LOCATION,P699_PANEL'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(12748635037300899)
,p_region_id=>wwv_flow_imp.id(12748544384300899)
,p_chart_type=>'bar'
,p_height=>'330'
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
,p_no_data_found_message=>'No receipt was posted in this window.'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12748753021300899)
,p_chart_id=>wwv_flow_imp.id(12748635037300899)
,p_static_id=>'applied'
,p_seq=>10
,p_name=>unistr('Applied to a bill (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'APPLIED_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(12748873598300899)
,p_chart_id=>wwv_flow_imp.id(12748635037300899)
,p_static_id=>'unapplied'
,p_seq=>20
,p_name=>unistr('Still on account (\20B9 Cr)')
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'UNAPPLIED_CR'
,p_items_label_column_name=>'LABEL'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(12748987605300899)
,p_chart_id=>wwv_flow_imp.id(12748635037300899)
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
 p_id=>wwv_flow_imp.id(12749063594300899)
,p_chart_id=>wwv_flow_imp.id(12748635037300899)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>unistr('Receipts (\20B9 Cr)')
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
 p_id=>wwv_flow_imp.id(12749621706300900)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(12747372018300866)
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
 p_id=>wwv_flow_imp.id(12749714348300900)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(12747372018300866)
,p_button_name=>'BACK'
,p_static_id=>'back'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Command Centre'
,p_button_redirect_url=>'f?p=&APP_ID.:690:&SESSION.::&DEBUG.::P690_FROMDATE,P690_TODATE,P690_COMPANY,P690_LOCATION,P690_PANEL:&P699_FROMDATE.,&P699_TODATE.,&P699_COMPANY.,&P699_LOCATION.,&P699_PANEL.'
,p_icon_css_classes=>'fa-arrow-left'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12749146128300899)
,p_name=>'P699_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12747372018300866)
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
 p_id=>wwv_flow_imp.id(12749250726300899)
,p_name=>'P699_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12747372018300866)
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
 p_id=>wwv_flow_imp.id(12749370387300899)
,p_name=>'P699_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12747372018300866)
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
'                  And (:P699_COMPANY Is Null Or v.CompanyCode = :P699_COMPANY))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P699_COMPANY'
,p_ajax_items_to_submit=>'P699_COMPANY'
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
 p_id=>wwv_flow_imp.id(12749481205300900)
,p_name=>'P699_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12747372018300866)
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
 p_id=>wwv_flow_imp.id(12749558136300900)
,p_name=>'P699_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12747372018300866)
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
