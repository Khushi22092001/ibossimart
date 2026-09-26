prompt --application/pages/page_00538
begin
--   Manifest
--     PAGE: 00538
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
 p_id=>538
,p_name=>'Product Stock Storage Location wise'
,p_alias=>'PRODUCT-STOCK-STORAGE-LOCATION-WISE'
,p_step_title=>'Product Stock Storage Location wise'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(320543486069292109)
,p_plug_name=>'Product Stock Storage Location wise'
,p_static_id=>'product-stock-storage-location-wise'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       STOCKMODULECODE,',
'       STOCKMODULETNO,',
'       STOCKMODULENO,',
'       STORAGELOCATIONCODE,',
'       STORAGELOCATIONNAME,',
'       STOCKQUANTITY1,',
'       USEDSTOCKQUANTITY1,',
'       RESERVESTOCKQUANTITY1,',
'       BALANCEQUANTITY1,',
'       STOCKQUANTITY2,',
'       USEDSTOCKQUANTITY2,',
'       RESERVESTOCKQUANTITY2,',
'       BALANCEQUANTITY2,',
'       STOCKVALUE,',
'       AGEOFSTOCK',
'  from D_PRODUCT360VIEW_STOCKSTORAGELOCATIONWISE',
'  where  ITEMSPECIFICATIONCODE like nvl(:P538_ITEMSPECIFICATIONCODE,''%'')',
'    and StorageLocationCode like nvl(:P538_STORAGELOCATION,''%'')'))
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
 p_id=>wwv_flow_imp.id(320543546751292110)
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
,p_internal_uid=>111539936846419075
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262880369374606886)
,p_db_column_name=>'AGEOFSTOCK'
,p_display_order=>420
,p_column_identifier=>'DD'
,p_column_label=>'Age of Stock'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262877999802606885)
,p_db_column_name=>'BALANCEQUANTITY1'
,p_display_order=>360
,p_column_identifier=>'CX'
,p_column_label=>'Balance Base Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262879568403606886)
,p_db_column_name=>'BALANCEQUANTITY2'
,p_display_order=>400
,p_column_identifier=>'DB'
,p_column_label=>'Balance Secondary Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262881153051606886)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Item Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262880762650606886)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>280
,p_column_identifier=>'CP'
,p_column_label=>'Item Specification Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262877527171606885)
,p_db_column_name=>'RESERVESTOCKQUANTITY1'
,p_display_order=>350
,p_column_identifier=>'CW'
,p_column_label=>'Reserve Stock Base Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262879192326606886)
,p_db_column_name=>'RESERVESTOCKQUANTITY2'
,p_display_order=>390
,p_column_identifier=>'DA'
,p_column_label=>'Reserve Stock Secondary Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262875547661606884)
,p_db_column_name=>'STOCKMODULECODE'
,p_display_order=>300
,p_column_identifier=>'CR'
,p_column_label=>'Stock Module'
,p_column_html_expression=>'<div style="display:block; width:80px">#STOCKMODULECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262876424631606884)
,p_db_column_name=>'STOCKMODULENO'
,p_display_order=>320
,p_column_identifier=>'CT'
,p_column_label=>'Stock Module No'
,p_column_html_expression=>'<div style="display:block; width:250px">#STOCKMODULENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262875965088606884)
,p_db_column_name=>'STOCKMODULETNO'
,p_display_order=>310
,p_column_identifier=>'CS'
,p_column_label=>'Stockmoduletno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262876797810606885)
,p_db_column_name=>'STOCKQUANTITY1'
,p_display_order=>330
,p_column_identifier=>'CU'
,p_column_label=>'Stock Base Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262878357876606885)
,p_db_column_name=>'STOCKQUANTITY2'
,p_display_order=>370
,p_column_identifier=>'CY'
,p_column_label=>'Stock Secondary Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262879941506606886)
,p_db_column_name=>'STOCKVALUE'
,p_display_order=>410
,p_column_identifier=>'DC'
,p_column_label=>'Stock Value'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262814961932043539)
,p_db_column_name=>'STORAGELOCATIONCODE'
,p_display_order=>430
,p_column_identifier=>'DE'
,p_column_label=>'Storage Location Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262815107483043540)
,p_db_column_name=>'STORAGELOCATIONNAME'
,p_display_order=>440
,p_column_identifier=>'DF'
,p_column_label=>'Storage Location Name'
,p_column_html_expression=>'<div style="display:block; width:250px">#STORAGELOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262875185658606884)
,p_db_column_name=>'TNO'
,p_display_order=>290
,p_column_identifier=>'CQ'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262877196318606885)
,p_db_column_name=>'USEDSTOCKQUANTITY1'
,p_display_order=>340
,p_column_identifier=>'CV'
,p_column_label=>'Used Stock Base Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(262878741898606885)
,p_db_column_name=>'USEDSTOCKQUANTITY2'
,p_display_order=>380
,p_column_identifier=>'CZ'
,p_column_label=>'Used Stock Secondary Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(320607574735575129)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'74392'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STORAGELOCATIONNAME:STOCKMODULECODE:STOCKMODULENO:STOCKQUANTITY1:STOCKQUANTITY2:USEDSTOCKQUANTITY1:USEDSTOCKQUANTITY2:RESERVESTOCKQUANTITY1:RESERVESTOCKQUANTITY2:BALANCEQUANTITY1:BALANCEQUANTITY2:STOCKVALUE:AGEOFSTOCK'
,p_sort_column_1=>'PBPASSNO'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'TCS:OTHERAMOUNT:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY:STOCKQUANTITY1:STOCKQUANTITY2:USEDSTOCKQUANTITY1:USEDSTOCKQUANTITY2:RESERVESTOCKQUANTITY1:RESERVESTOCKQUANTITY2:BALANCEQUANTITY1:BALANCEQUANTITY2:STOCKVALUE:AGEOFSTOCK'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262889416218606893)
,p_name=>'P538_FROMAGE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(320543486069292109)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262890189538606893)
,p_name=>'P538_ITEMCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(320543486069292109)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262890629378606893)
,p_name=>'P538_ITEMSPECIFICATIONCODE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(320543486069292109)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262888986441606892)
,p_name=>'P538_MONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(320543486069292109)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262888563209606892)
,p_name=>'P538_PARTYCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(320543486069292109)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262821924633043547)
,p_name=>'P538_STORAGELOCATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(320543486069292109)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(262889757981606893)
,p_name=>'P538_TOAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(320543486069292109)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
