prompt --application/pages/page_00506
begin
--   Manifest
--     PAGE: 00506
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>506
,p_name=>'Purchase Dashboard'
,p_alias=>'PURCHASE-DASHBOARD'
,p_step_title=>'Purchase Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.mycardtext{color:white;}',
'.mycardsize{font-size: 15px;font-weight:bold;}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463387944511393890)
,p_plug_name=>'Parameters'
,p_static_id=>'parameters'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463894621523328356)
,p_plug_name=>'Posted'
,p_static_id=>'posted'
,p_parent_plug_id=>wwv_flow_imp.id(463388019228393891)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
unistr('''\20B9 ''||to_char(Round(sum(a.PBPassAmount)/100000,2),''99,99,99,99,999.99'') ||'' Lac'' Value,'),
'''Posted'' as Text,',
'''u-color-18'' as card_color',
'From  PBPass a, Financialyear b',
'Where to_Char(a.PBPassDate,''YYYY'') = to_Char(To_Date(:P506_DATE,''DD-MM-YYYY''),''YYYY'')',
'  and exists (Select 1 from Voucher v where v.ModuleTNo = a.TNo)',
'  and a.FinancialYearCode = b.FinancialyearCode',
'  and :P506_DATE between b.FinancialYearBegin and b.FinancialyearEnd',
'  and a.PBPassDate <= :P506_DATE'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P506_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433601777392841825)
,p_region_id=>wwv_flow_imp.id(463894621523328356)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433602257956841825)
,p_card_id=>wwv_flow_imp.id(433601777392841825)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:151:P151_COMPANY,P151_VSTATUS,P151_FROMDATE,P151_TODATE:&GLOBAL_COMPANYCODE.,PREPARED,&P506_FROMDATE.,&P506_DATE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463894185375328352)
,p_plug_name=>'Purchase Per Day'
,p_static_id=>'purchase-per-day'
,p_parent_plug_id=>wwv_flow_imp.id(463388019228393891)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
unistr('''\20B9 ''||to_char(Round(sum(a.PBPassAmount)/100000 /'),
'GetDayofYear(To_Date(:P506_DATE,''DD-MM-YYYY''))',
',2),''99,99,99,99,999.99'')',
'||'' Lac'' Value,',
'''Purchase per Day'' as Text,',
'''u-color-5'' as card_color',
'From PBPass a, financialyear b',
' Where a.financialyearcode = b.financialyearcode',
'   And :P506_DATE Between b.financialyearbegin And b.financialyearend',
'   And to_Char(a.PBPassDate, ''YYYY'') = to_Char(To_Date(:P506_DATE, ''DD-MM-YYYY''), ''YYYY'')',
'   And a.PBPassDate <= :P506_DATE'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P506_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433599920018841824)
,p_region_id=>wwv_flow_imp.id(463894185375328352)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardsize mycardtext'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463896145122328371)
,p_plug_name=>'Purchase Trends'
,p_static_id=>'purchase-trends'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    x.LabelName,',
'    x.ValueName,',
'    Case When rownum = 1 then ''#76B947''',
'         When rownum = 2 then ''#2E8BC0''',
'         When rownum = 3 then ''#FFA384''',
'         When rownum = 4 then ''#FF8300''',
'         When rownum = 5 then ''#B7AC44''',
'         When rownum = 6 then ''#FF4500''',
'         When rownum = 7 then ''#DF362D''',
'         When rownum = 8 then ''#FAD02C''',
'         When rownum = 9 then ''#333652''',
'         When rownum = 10 then ''#90ADC6''',
'         When rownum = 11 then ''#94C973''',
'         When rownum = 12 then ''u-color-12''',
'    End as Color',
'',
'From',
'(Select',
'      ',
'      Decode(nvl(:P506_COMPARE,''MONTH''),',
'              ''MONTH'',',
'              to_char(a.PBPassdate, ''MON-YY''),',
'              to_char(a.PBPassdate, ''YYYY'')) LabelName,',
'      Decode(nvl(:P506_COMPARE,''MONTH''),',
'               ''MONTH'',',
'               to_char(a.PBPassdate, ''YYYYMM''),',
'               to_char(a.PBPassdate, ''YYYY'')) OrderName,       ',
'      Round(sum(TotalAmount),2)as ValueName',
'From  BI_PRevenue a, FinancialYear b',
'Where a.PBPassDate <= NVL(:P506_DATE,TRUNC(SYSDATE))',
'  and a.FinancialyearCode = b.Financialyearcode',
'  and :P506_DATE between b.FinancialyearBegin and b.FinancialyearEnd',
'Group by Decode(nvl(:P506_COMPARE,''MONTH''),',
'              ''MONTH'',',
'              to_char(a.PBPassdate, ''MON-YY''),',
'              to_char(a.PBPassdate, ''YYYY'')) ,',
'      Decode(nvl(:P506_COMPARE,''MONTH''),',
'               ''MONTH'',',
'               to_char(a.PBPassdate, ''YYYYMM''),',
'               to_char(a.PBPassdate, ''YYYY''))',
'Order by Decode(nvl(:P506_COMPARE,''MONTH''),',
'               ''MONTH'',',
'               to_char(a.PBPassdate, ''YYYYMM''),',
'               to_char(a.PBPassdate, ''YYYY'')) desc',
')x',
'Where Rownum <= NVL(:P506_VALUE,1)'))
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_ajax_items_to_submit=>'P506_VALUE,P506_DATE,P506_COMPARE'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433604684417841827)
,p_region_id=>wwv_flow_imp.id(463896145122328371)
,p_chart_type=>'bar'
,p_height=>'400'
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
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433606435581841828)
,p_chart_id=>wwv_flow_imp.id(433604684417841827)
,p_static_id=>'jet_chart_series'
,p_seq=>10
,p_name=>'1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'VALUENAME'
,p_items_label_column_name=>'LABELNAME'
,p_color=>'&COLOR.'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideBarEdge'
,p_items_label_display_as=>'PERCENT'
,p_items_label_font_style=>'italic'
,p_items_label_font_size=>'10'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433605847152841828)
,p_chart_id=>wwv_flow_imp.id(433604684417841827)
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
 p_id=>wwv_flow_imp.id(433605227098841827)
,p_chart_id=>wwv_flow_imp.id(433604684417841827)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_imp.id(463192423399573685)
,p_plug_name=>'Top 10  Product'
,p_static_id=>'top-10-product'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LABELNAME,',
'       LABELVALUE,',
'       P1,',
'       P2,',
'       P3,',
'       P4,',
'       P5,',
'       P6,',
'       P7,',
'       P8,',
'       P9,',
'       P10,',
'       P11,',
'       P12',
'  from TEMP_TOP10purItem',
'Order by 2 desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433583659152841816)
,p_region_id=>wwv_flow_imp.id(463192423399573685)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433585282650841816)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'current'
,p_seq=>10
,p_name=>'Current'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'LABELVALUE'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433585950939841817)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous'
,p_seq=>20
,p_name=>'Previous_1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P1'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433591310829841819)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-10'
,p_seq=>110
,p_name=>'Previous_10'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P10'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433591979317841819)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-11'
,p_seq=>120
,p_name=>'Previous_11'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P11'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433592483437841820)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-12'
,p_seq=>130
,p_name=>'Previous_12'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P12'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433586548579841817)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-2'
,p_seq=>30
,p_name=>'Previous_2'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P2'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433587114097841817)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-3'
,p_seq=>40
,p_name=>'Previous_3'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P3'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433587705958841817)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-4'
,p_seq=>50
,p_name=>'Previous_4'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P4'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433588294730841818)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-5'
,p_seq=>60
,p_name=>'Previous_5'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P5'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433588903838841818)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-6'
,p_seq=>70
,p_name=>'Previous_6'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P6'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433589520981841818)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-7'
,p_seq=>80
,p_name=>'Previous_7'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P7'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433590102888841819)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-8'
,p_seq=>90
,p_name=>'Previous_8'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P8'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433590694629841819)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'previous-9'
,p_seq=>100
,p_name=>'Previous_9'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P9'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433584085655841816)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
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
 p_id=>wwv_flow_imp.id(433584745614841816)
,p_chart_id=>wwv_flow_imp.id(433583659152841816)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_imp.id(463190742470573668)
,p_plug_name=>'Top 10  State'
,p_static_id=>'top-10-state'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LABELNAME,',
'       LABELVALUE,',
'       P1,',
'       P2,',
'       P3,',
'       P4,',
'       P5,',
'       P6,',
'       P7,',
'       P8,',
'       P9,',
'       P10,',
'       P11,',
'       P12',
'  from TEMP_TOP10purstate',
'Order by 2 desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433573695758841811)
,p_region_id=>wwv_flow_imp.id(463190742470573668)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433575444487841812)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'current'
,p_seq=>10
,p_name=>'Current'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'LABELVALUE'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433576065714841812)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous'
,p_seq=>20
,p_name=>'Previous_1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P1'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433581477839841814)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-10'
,p_seq=>110
,p_name=>'Previous_10'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P10'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433581984162841815)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-11'
,p_seq=>120
,p_name=>'Previous_11'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P11'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433582582425841815)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-12'
,p_seq=>130
,p_name=>'Previous_12'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P12'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433576678235841812)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-2'
,p_seq=>30
,p_name=>'Previous_2'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P2'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433577199610841813)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-3'
,p_seq=>40
,p_name=>'Previous_3'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P3'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433577820279841813)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-4'
,p_seq=>50
,p_name=>'Previous_4'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P4'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433578465497841813)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-5'
,p_seq=>60
,p_name=>'Previous_5'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P5'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433579045031841813)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-6'
,p_seq=>70
,p_name=>'Previous_6'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P6'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433579630591841814)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-7'
,p_seq=>80
,p_name=>'Previous_7'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P7'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433580229577841814)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-8'
,p_seq=>90
,p_name=>'Previous_8'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P8'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433580870441841814)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'previous-9'
,p_seq=>100
,p_name=>'Previous_9'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P9'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433574273544841811)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
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
 p_id=>wwv_flow_imp.id(433574814614841811)
,p_chart_id=>wwv_flow_imp.id(433573695758841811)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_imp.id(463896708408328377)
,p_plug_name=>'Top 10 Supplier'
,p_static_id=>'top-10-supplier'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--showIcon:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select LABELNAME,',
'       LABELVALUE,',
'       P1,',
'       P2,',
'       P3,',
'       P4,',
'       P5,',
'       P6,',
'       P7,',
'       P8,',
'       P9,',
'       P10,',
'       P11,',
'       P12',
'  from TEMP_TOP10SUPPLIER',
'Order by 2 desc'))
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433607411813841828)
,p_region_id=>wwv_flow_imp.id(463896708408328377)
,p_chart_type=>'bar'
,p_height=>'400'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'horizontal'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'value-desc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433609178725841829)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'current'
,p_seq=>10
,p_name=>'Current'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'LABELVALUE'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433609715618841830)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous'
,p_seq=>20
,p_name=>'Previous_1'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P1'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433615169999841832)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-10'
,p_seq=>110
,p_name=>'Previous_10'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P10'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433615729017841832)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-11'
,p_seq=>120
,p_name=>'Previous_11'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P11'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433616290043841833)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-12'
,p_seq=>130
,p_name=>'Previous_12'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P12'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433610362315841830)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-2'
,p_seq=>30
,p_name=>'Previous_2'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P2'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433610910906841830)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-3'
,p_seq=>40
,p_name=>'Previous_3'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P3'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433611568995841830)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-4'
,p_seq=>50
,p_name=>'Previous_4'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P4'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433612160714841831)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-5'
,p_seq=>60
,p_name=>'Previous_5'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P5'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433612679922841831)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-6'
,p_seq=>70
,p_name=>'Previous_6'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P6'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433613349491841831)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-7'
,p_seq=>80
,p_name=>'Previous_7'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P7'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433613929261841832)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-8'
,p_seq=>90
,p_name=>'Previous_8'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P8'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433614557247841832)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'previous-9'
,p_seq=>100
,p_name=>'Previous_9'
,p_location=>'REGION_SOURCE'
,p_series_type=>'bar'
,p_items_value_column_name=>'P9'
,p_items_label_column_name=>'LABELNAME'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433607955834841829)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
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
 p_id=>wwv_flow_imp.id(433608569989841829)
,p_chart_id=>wwv_flow_imp.id(433607411813841828)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
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
 p_id=>wwv_flow_imp.id(463388019228393891)
,p_plug_name=>'Top KPI Trends'
,p_static_id=>'top-kpi-trends'
,p_icon_css_classes=>'fa-credit-card'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463893960028328350)
,p_plug_name=>'Total Purchase'
,p_static_id=>'total-purchase'
,p_parent_plug_id=>wwv_flow_imp.id(463388019228393891)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
unistr('''\20B9 ''||to_char(Round(sum(a.PBPassAmount)/100000,2),''99,99,99,99,999.99'') ||'' Lac'' Value,'),
'''Total Purchase'' as Text,',
'''u-color-22'' as card_color',
'From PBPass a, financialyear b',
' Where a.financialyearcode = b.financialyearcode',
'   And :P506_DATE Between b.financialyearbegin And b.financialyearend',
'   And to_Char(a.PBPassDate, ''YYYY'') = to_Char(To_Date(:P506_DATE, ''DD-MM-YYYY''), ''YYYY'')',
'   And a.PBPassDate <= :P506_DATE',
'   '))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P506_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433598468013841823)
,p_region_id=>wwv_flow_imp.id(463893960028328350)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433598932161841824)
,p_card_id=>wwv_flow_imp.id(433598468013841823)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:507:&SESSION.::&DEBUG.:507:P507_DATE:&P506_DATE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463894395464328354)
,p_plug_name=>'Total Quantity'
,p_static_id=>'total-quantity'
,p_parent_plug_id=>wwv_flow_imp.id(463388019228393891)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'to_char(Round(sum(a.Quantity1),2),''99,99,99,999.99'') ||'' MT'' Value,',
'''Total Quantity'' as Text,',
'''u-color-11'' as card_color',
'From  BI_PRevenue a, Item e, FinancialYear f',
'Where to_Char(a.PBPassDate,''YYYY'') = to_Char(To_Date(:P506_DATE,''DD-MM-YYYY''),''YYYY'')',
'  and e.MeasuringUnitCode1 = ''MT''',
'  and a.ItemCode = e.ItemCode',
'  and a.financialyearcode = f.financialyearCode',
'  and :P506_DATE between f.financialyearbegin and f.financialyearend',
'  and a.PBPassDate <= :P506_DATE'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P506_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433600820355841825)
,p_region_id=>wwv_flow_imp.id(463894395464328354)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardtext mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463893784208328348)
,p_plug_name=>'Total Transactions'
,p_static_id=>'total-transactions'
,p_parent_plug_id=>wwv_flow_imp.id(463388019228393891)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'count(a.TNo),',
'''Total Transaction'' as Text,',
'''u-color-14'' as card_color',
'From PBPass a, financialyear b',
' Where a.financialyearcode = b.financialyearcode',
'   And a.PBPassDate Between b.financialyearbegin And :P506_DATE',
'   And to_Char(a.PBPassDate, ''YYYY'') = to_Char(To_Date(:P506_DATE, ''DD-MM-YYYY''), ''YYYY'')',
'   ',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P506_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433596932414841822)
,p_region_id=>wwv_flow_imp.id(463893784208328348)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'COUNT(A.TNO)'
,p_sub_title_css_classes=>'u-color-13-text mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433597450436841823)
,p_card_id=>wwv_flow_imp.id(433596932414841822)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:151:P151_COMPANY,P151_FROMDATE,P151_TODATE:&GLOBAL_COMPANYCODE.,&P506_FROMDATE.,&P506_DATE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463894779913328358)
,p_plug_name=>'Un-Posted'
,p_static_id=>'un-posted'
,p_parent_plug_id=>wwv_flow_imp.id(463388019228393891)
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>40
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
unistr('''\20B9 ''||to_char(Round(sum(a.PBPassAmount)/100000,2),''99,99,99,99,999.99'') ||'' Lac'' Value,'),
'''Un-Posted'' as Text,',
'''u-color-9'' as card_color',
'From  PBPass a, Financialyear b',
'Where to_Char(a.PBPassDate,''YYYY'') = to_Char(To_Date(:P506_DATE,''DD-MM-YYYY''),''YYYY'')',
'  and not exists (Select 1 from Voucher v where v.ModuleTNo = a.TNo)',
'  and a.FinancialyearCode = b.Financialyearcode',
'  and :P506_DATE between b.Financialyearbegin and b.FinancialyearEnd',
'  and a.PBPassDate <= :P506_DATE'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_ajax_items_to_submit=>'P506_DATE'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433603261979841826)
,p_region_id=>wwv_flow_imp.id(463894779913328358)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'u-color-13-text mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433603695496841826)
,p_card_id=>wwv_flow_imp.id(433603261979841826)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:151:&SESSION.::&DEBUG.:RP,151:P151_COMPANY,P151_FROMDATE,P151_VSTATUS,P151_TODATE:&GLOBAL_COMPANYCODE.,&P506_FROMDATE.,PENDING,&P506_DATE.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(433593485249841820)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(463387944511393890)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Clear'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(433593954572841820)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(463387944511393890)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(443125687191711170)
,p_name=>'P506_COMPARE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(463387944511393890)
,p_item_default=>'MONTH'
,p_prompt=>'Compare'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:MONTH;MONTH,YEAR;YEAR'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(443125225474711170)
,p_name=>'P506_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(463387944511393890)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Month/Year'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(453474551372144583)
,p_name=>'P506_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(463387944511393890)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.financialyearbegin',
'From financialyear a ',
'Where nvl(:P506_DATE,TRUNC(SYSDATE)) Between a.financialyearbegin And a.financialyearend'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(453474636358144584)
,p_name=>'P506_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(463387944511393890)
,p_item_default=>'CO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(453474811000144585)
,p_name=>'P506_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(463387944511393890)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>1609121967514267634
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(443126059360711170)
,p_name=>'P506_VALUE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(463387944511393890)
,p_item_default=>'1'
,p_prompt=>'Value (1-12)'
,p_placeholder=>'Value ( 1-3)'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>7
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'max_value', '12',
  'min_value', '1',
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433617976400841841)
,p_name=>'Clear Compare Item'
,p_static_id=>'clear-compare-item'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(433593485249841820)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433618476273841841)
,p_event_id=>wwv_flow_imp.id(433617976400841841)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P506_COMPARE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(434057042396532676)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434057411661532676)
,p_event_id=>wwv_flow_imp.id(434057042396532676)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(433617503956841838)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CREATE TEMP DATA'
,p_static_id=>'create-temp-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Top 10 Supplier */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10Supplier;',
'  For c In (Select x.LabelName, x.ValueName, X.PARTYCODE',
'              From (Select GetPartyname(a.PartyCode) LabelName,',
'                           Sum(a.TotalAmount) As ValueName,',
'                           A.PARTYCODE',
'                      From BI_PRevenue a, Financialyear b',
'                     Where a.PBPassDate <= :P506_DATE',
'                       and a.Financialyearcode = b.Financialyearcode',
'                       and :P506_DATE between b.Financialyearbegin and b.Financialyearend',
'                     Group By GetPartyname(a.PartyCode), A.PARTYCODE',
'                     Order By 2 Desc) x',
'             Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p506_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp1',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp2',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp3',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp4',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp5',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp6',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp7',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp8',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp9',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp10',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp11',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp12',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10Supplier',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (c.labelname,',
'       c.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
'',
'/* Top 10 PurchaseState */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10Purstate;',
'  For vTopItem In (Select x.LabelName, x.ValueName, X.StateCode',
'                     From (Select c.StateName LabelName,',
'                                  Sum(a.TotalAmount) As ValueName,',
'                                  C.StateCode',
'                             From BI_PRevenue a, Party b, State c, FinancialYear d',
'                            Where a.partyCode = b.PartyCode',
'                              And b.Officestatecode = c.StateCode',
'                              And a.PBPassDate <= :P506_DATE',
'                              and a.FinancialyearCode = d.Financialyearcode',
'                              and :P506_DATE between d.financialyearbegin and d.financialyearend',
'                            Group By c.StateName, c.StateCode',
'                            Order By 2 Desc) x',
'                    Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p506_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp1',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp2',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp3',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp4',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp5',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp6',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp7',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp8',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp9',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp10',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp11',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp12',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10PurState',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (vTopItem.labelname,',
'       vTopItem.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
'',
'/* TOP 10 Purchase Item */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10PurItem;',
'  For vTopItem In (Select x.LabelName, x.ValueName, X.ITEMCODE',
'                     From (Select GetItemname(a.ItemCode) LabelName,',
'                                  Sum(a.TotalAmount) As ValueName,',
'                                  A.ITEMCODE',
'                             From BI_PRevenue a, Financialyear b',
'                            Where a.PBPassDate <= :P506_DATE',
'                              and a.FinancialyearCode = b.FinancialyearCode',
'                              and :P506_DATE between b.FinancialyearBegin and b.FinancialyearEnd',
'                            Group By GetItemname(a.ItemCode), A.ITEMCODE',
'                            Order By 2 Desc) x',
'                    Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p506_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp1',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp2',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp3',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp4',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp5',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp6',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp7',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp8',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp9',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp10',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp11',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp12',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10Puritem',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (vTopItem.labelname,',
'       vTopItem.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2174124565846604
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(433617150304841833)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Top 10 Supplier */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10Supplier;',
'  For c In (Select x.LabelName, x.ValueName, X.PARTYCODE',
'              From (Select GetPartyname(a.PartyCode) LabelName,',
'                           Sum(a.TotalAmount) As ValueName,',
'                           A.PARTYCODE',
'                      From BI_PRevenue a, Financialyear b',
'                     Where a.PBPassDate <= :P506_DATE',
'                       and a.Financialyearcode = b.Financialyearcode',
'                       and :P506_DATE between b.Financialyearbegin and b.Financialyearend',
'                     Group By GetPartyname(a.PartyCode), A.PARTYCODE',
'                     Order By 2 Desc) x',
'             Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p506_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp1',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp2',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp3',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp4',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp5',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp6',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp7',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp8',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp9',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp10',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp11',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp12',
'          From BI_PRevenue aa',
'         Where AA.PARTYCODE = C.PARTYCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10Supplier',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (c.labelname,',
'       c.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
'',
'/* Top 10 PurchaseState */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10Purstate;',
'  For vTopItem In (Select x.LabelName, x.ValueName, X.StateCode',
'                     From (Select c.StateName LabelName,',
'                                  Sum(a.TotalAmount) As ValueName,',
'                                  C.StateCode',
'                             From BI_PRevenue a, Party b, State c, FinancialYear d',
'                            Where a.partyCode = b.PartyCode',
'                              And b.Officestatecode = c.StateCode',
'                              And a.PBPassDate <= :P506_DATE',
'                              and a.FinancialyearCode = d.Financialyearcode',
'                              and :P506_DATE between d.financialyearbegin and d.financialyearend',
'                            Group By c.StateName, c.StateCode',
'                            Order By 2 Desc) x',
'                    Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p506_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp1',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp2',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp3',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp4',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp5',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp6',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp7',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp8',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp9',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp10',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp11',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp12',
'          From BI_PRevenue aa, Party bb, State CC',
'         Where AA.PartyCode = bb.PartyCode',
'           And bb.officestatecode = cc.statecode',
'           And cc.statecode = vTopItem.Statecode',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10PurState',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (vTopItem.labelname,',
'       vTopItem.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
'',
'/* TOP 10 Purchase Item */',
'Declare',
'  i Number;',
'',
'  vp1  Number;',
'  vp2  Number;',
'  vp3  Number;',
'  vp4  Number;',
'  vp5  Number;',
'  vp6  Number;',
'  vp7  Number;',
'  vp8  Number;',
'  vp9  Number;',
'  vp10 Number;',
'  vp11 Number;',
'  vp12 Number;',
'',
'Begin',
'  Delete From temp_top10PurItem;',
'  For vTopItem In (Select x.LabelName, x.ValueName, X.ITEMCODE',
'                     From (Select GetItemname(a.ItemCode) LabelName,',
'                                  Sum(a.TotalAmount) As ValueName,',
'                                  A.ITEMCODE',
'                             From BI_PRevenue a, Financialyear b',
'                            Where a.PBPassDate <= :P506_DATE',
'                              and a.FinancialyearCode = b.FinancialyearCode',
'                              and :P506_DATE between b.FinancialyearBegin and b.FinancialyearEnd',
'                            Group By GetItemname(a.ItemCode), A.ITEMCODE',
'                            Order By 2 Desc) x',
'                    Where rownum <= 10) Loop',
'    For i In 1 .. to_number(:p506_value) Loop',
'      If I-1 = 1 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp1',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 2 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp2',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 3 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp3',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 4 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp4',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 5 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp5',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 6 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp6',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 7 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp7',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 8 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp8',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 9 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp9',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 10 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp10',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 11 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp11',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      Elsif I-1 = 12 Then',
'        Select Sum(aa.TotalAmount)',
'          Into vp12',
'          From BI_PRevenue aa',
'         Where AA.ITEMCODE = vTopItem.ITEMCODE',
'           And to_Char(aa.PBPassDate, ''YYYYMM'') =',
'               to_Char(Add_Months(to_date(:P506_DATE, ''DD-MON-YYYY''),',
'                                  -1 *',
'                                  (Decode(:P506_COMPARE, ''MONTH'', 1, 12)) *',
'                                  nvl(i-1, 1)),',
'                       ''YYYYMM'');',
'      End If;',
'    End Loop;',
'  ',
'    Insert Into temp_top10Puritem',
'      (labelname,',
'       labelvalue,',
'       p1,',
'       p2,',
'       p3,',
'       p4,',
'       p5,',
'       p6,',
'       p7,',
'       p8,',
'       p9,',
'       p10,',
'       p11,',
'       p12)',
'    Values',
'      (vTopItem.labelname,',
'       vTopItem.valuename,',
'       vp1,',
'       vp2,',
'       vp3,',
'       vp4,',
'       vp5,',
'       vp6,',
'       vp7,',
'       vp8,',
'       vp9,',
'       vp10,',
'       vp11,',
'       vp12);',
'  End Loop;',
'End;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>2173770913846599
);
wwv_flow_imp.component_end;
end;
/
