prompt --application/pages/page_00537
begin
--   Manifest
--     PAGE: 00537
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>537
,p_name=>'Product Pipeline Stock group by Module'
,p_alias=>'PRODUCT-PIPELINE-STOCK-GROUP-BY-MODULE'
,p_step_title=>'Product Pipeline Stock group by Module'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'.reportheight{height: 300px;overflow: auto !important}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(262805768210971233)
,p_plug_name=>'Module wise Pipeline Stock'
,p_static_id=>'module-wise-pipeline-stock'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(220149836776954230)
,p_region_id=>wwv_flow_imp.id(262805768210971233)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>true
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlight'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(220150339304954231)
,p_chart_id=>wwv_flow_imp.id(220149836776954230)
,p_static_id=>'new'
,p_seq=>10
,p_name=>'New'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       MODULECODE,',
'       ITEMSPECIFICATIONCODE,',
'       sum(QUANTITY1)QUANTITY1',
'  from D_PRODUCT360VIEW_PIPELINESTOCK',
' where ItemCode like nvl(:P537_ITEMCODE,''%'')',
'   and ItemSpecificationCode like nvl(:P537_ITEMSPECIFICATIONCODE,''%'')',
' Group by MODULECODE,',
'       ITEMSPECIFICATIONCODE'))
,p_series_type=>'pie'
,p_items_value_column_name=>'QUANTITY1'
,p_items_label_column_name=>'MODULECODE'
,p_items_label_rendered=>true
,p_items_label_position=>'auto'
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:108:P108_ITEMSPECIFICATIONCODE,P108_MODULECODE:&ITEMSPECIFICATIONCODE.,&MODULECODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(313679676438990206)
,p_plug_name=>'Product Pipeline Stock group by Module'
,p_static_id=>'product-pipeline-stock-group-by-module'
,p_region_name=>'MYID'
,p_region_css_classes=>'reportheight'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>6
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       MODULECODE,',
'       ITEMSPECIFICATIONCODE,',
'       sum(QUANTITY1)QUANTITY1',
'  from D_PRODUCT360VIEW_PIPELINESTOCK',
' where ItemCode like nvl(:P537_ITEMCODE,''%'')',
'   and ItemSpecificationCode like nvl(:P537_ITEMSPECIFICATIONCODE,''%'')',
' Group by MODULECODE,',
'       ITEMSPECIFICATIONCODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Customer Overdue Invoices'
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
 p_id=>wwv_flow_imp.id(313679737120990207)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_computation=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>104676127216117172
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262940461884026393)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>280
,p_column_identifier=>'CP'
,p_column_label=>'Item Specification Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262938860142026392)
,p_db_column_name=>'MODULECODE'
,p_display_order=>240
,p_column_identifier=>'CL'
,p_column_label=>'Module'
,p_column_link=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:108:P108_ITEMSPECIFICATIONCODE,P108_MODULECODE:#ITEMSPECIFICATIONCODE#,#MODULECODE#'
,p_column_linktext=>'#MODULECODE#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262941662576026393)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Base Qty'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(313743765105273226)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'75103'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MODULECODE:QUANTITY1'
,p_sort_column_1=>'PBPASSNO'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262946959052026399)
,p_name=>'P537_FROMAGE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(313679676438990206)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262947729258026400)
,p_name=>'P537_ITEMCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(313679676438990206)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262948137945026400)
,p_name=>'P537_ITEMSPECIFICATIONCODE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(313679676438990206)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262946591388026399)
,p_name=>'P537_MONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(313679676438990206)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262946185377026399)
,p_name=>'P537_PARTYCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(313679676438990206)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262947371850026399)
,p_name=>'P537_TOAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(313679676438990206)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
