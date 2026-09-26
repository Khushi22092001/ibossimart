prompt --application/pages/page_00507
begin
--   Manifest
--     PAGE: 00507
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
 p_id=>507
,p_name=>'Purchase Detail (with Filter)'
,p_alias=>'PURCHASE-DETAIL-WITH-FILTER'
,p_step_title=>'Purchase Detail (with Filter)'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2526646919027767344
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'22'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(458261269644191271)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_icon_css_classes=>'fa-filter'
,p_region_template_options=>'#DEFAULT#:t-Region--showIcon:t-Region--accent9:t-Region--hiddenOverflow'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_FACETED_SEARCH'
,p_filtered_region_id=>wwv_flow_imp.id(471755090449772786)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'batch_facet_search', 'N',
  'compact_numbers_threshold', '10000',
  'display_chart_for_top_n_values', '10',
  'show_charts', 'Y',
  'show_current_facets', 'Y',
  'show_total_row_count', 'Y',
  'total_row_count_label', 'Record:')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450748146204628966)
,p_name=>'P507_AMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(458261269644191271)
,p_prompt=>'Amount'
,p_source=>'AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_RANGE'
,p_lov=>'STATIC2:<100 K;|100000,100 K - 500 K;100000|500000,500 K - 1 M;50000|1000000,1 M - 5 M;1000000|5000000,>5 M;5000000|'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'manual_entry', 'Y',
  'select_multiple', 'Y')).to_clob
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>100
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450749419444628967)
,p_name=>'P507_CUSTOMER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(458261269644191271)
,p_prompt=>'Customer'
,p_source=>'PARTYCODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'PARTY LIST1'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450749783662628967)
,p_name=>'P507_ITEM'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(458261269644191271)
,p_prompt=>'Item'
,p_source=>'ITEMCODE'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'ITEM LIST 1'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450748993679628966)
,p_name=>'P507_MONTH'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(458261269644191271)
,p_prompt=>'Month'
,p_source=>'YYYYMM'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'MONTH1'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>false
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_show_selected_first=>false
,p_fc_show_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450747751237628965)
,p_name=>'P507_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(458261269644191271)
,p_prompt=>'Search'
,p_source=>'YYYYMM,YYYY,ITEMCODE,PARTYCODE,ITEMNAME,PARTYNAME,MONYYYY,AMOUNT'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_SEARCH'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'input_field', 'FACET',
  'search_type', 'ROW')).to_clob
,p_fc_show_chart=>false
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450748592257628966)
,p_name=>'P507_YEAR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(458261269644191271)
,p_prompt=>'Year'
,p_source=>'YYYY'
,p_source_type=>'FACET_COLUMN'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'YEAR1'
,p_encrypt_session_state_yn=>'N'
,p_fc_show_label=>true
,p_fc_collapsible=>true
,p_fc_initial_collapsed=>true
,p_fc_compute_counts=>true
,p_fc_show_counts=>true
,p_fc_zero_count_entries=>'H'
,p_fc_show_more_count=>5
,p_fc_filter_values=>false
,p_fc_sort_by_top_counts=>true
,p_fc_show_selected_first=>false
,p_fc_show_chart=>true
,p_fc_initial_chart=>false
,p_fc_actions_filter=>false
,p_fc_display_as=>'INLINE'
,p_fc_exclude_allowed=>false
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(471755090449772786)
,p_name=>'Sample'
,p_static_id=>'sample'
,p_template=>2100526641005906379
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.PBPassDate,',
'      to_Char(a.PBPassDate,''YYYYMM'') as YYYYMM,',
'      to_Char(a.PBPassDate,''YYYY'') as YYYY,',
'      a.PartyCode,',
'      p.PartyName,',
'      a.ItemCode,',
'      e.ItemName,',
'      e.MeasuringUnitCode1,',
'      sum(a.Quantity1) PQTY,',
'      sum(a.Quantity2) SQTY,',
'      sum(a.TotalAmount) Amount',
'From  BI_PRevenue a, Party p, Item e, FinancialYear fy',
'Where a.PartyCode = p.PartyCode',
'  and a.ItemCode = e.ItemCode',
'  and a.FinancialYearCode = fy.FinancialYearCode',
'  and a.PBPassDate between fy.FinancialYearBegin and  :P507_DATE',
'Group by a.PBPassDate,',
'      to_Char(a.PBPassDate,''YYYYMM''),',
'      to_Char(a.PBPassDate,''YYYY''),',
'      a.PartyCode,',
'      p.PartyName,',
'      a.ItemCode,',
'      e.ItemName,',
'      e.MeasuringUnitCode1'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>true
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441180512483552639)
,p_query_column_id=>11
,p_column_alias=>'AMOUNT'
,p_column_display_sequence=>120
,p_column_heading=>'Amount'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441178554888552638)
,p_query_column_id=>6
,p_column_alias=>'ITEMCODE'
,p_column_display_sequence=>70
,p_column_heading=>'Item Code'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441178942020552638)
,p_query_column_id=>7
,p_column_alias=>'ITEMNAME'
,p_column_display_sequence=>80
,p_column_heading=>'Item Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441179300050552638)
,p_query_column_id=>8
,p_column_alias=>'MEASURINGUNITCODE1'
,p_column_display_sequence=>90
,p_column_heading=>'UOM'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441177753329552638)
,p_query_column_id=>4
,p_column_alias=>'PARTYCODE'
,p_column_display_sequence=>50
,p_column_heading=>'Party Code'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441178166644552638)
,p_query_column_id=>5
,p_column_alias=>'PARTYNAME'
,p_column_display_sequence=>60
,p_column_heading=>'Party Name'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441176541441552637)
,p_query_column_id=>1
,p_column_alias=>'PBPASSDATE'
,p_column_display_sequence=>40
,p_column_heading=>'Date'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441179684014552639)
,p_query_column_id=>9
,p_column_alias=>'PQTY'
,p_column_display_sequence=>100
,p_column_heading=>'P Qty'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441180130520552639)
,p_query_column_id=>10
,p_column_alias=>'SQTY'
,p_column_display_sequence=>110
,p_column_heading=>'S Qty'
,p_column_format=>'999G999G999G999G990D00'
,p_column_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441177297468552637)
,p_query_column_id=>3
,p_column_alias=>'YYYY'
,p_column_display_sequence=>30
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(441176955040552637)
,p_query_column_id=>2
,p_column_alias=>'YYYYMM'
,p_column_display_sequence=>20
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450754180456628968)
,p_name=>'P507_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(471755090449772786)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441599279942236442)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441599674128236443)
,p_event_id=>wwv_flow_imp.id(441599279942236442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
