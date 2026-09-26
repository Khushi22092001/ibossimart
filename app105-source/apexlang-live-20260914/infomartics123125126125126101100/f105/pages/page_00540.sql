prompt --application/pages/page_00540
begin
--   Manifest
--     PAGE: 00540
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
 p_id=>540
,p_name=>'Products 12 Months Detail'
,p_alias=>'PRODUCTS-12-MONTHS-DETAIL'
,p_step_title=>'Products 12 Months Detail'
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
 p_id=>wwv_flow_imp.id(245775627864970956)
,p_plug_name=>'Conditions'
,p_static_id=>'conditions'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'1'
,p_plug_display_when_cond2=>'2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(245778072065970980)
,p_plug_name=>'Products 12 Months Production Detail'
,p_static_id=>'products-12-months-production-detail'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       COMPANYNAME,',
'       BATCHNO,',
'       PRODUCTIONNO,',
'       PRODUCTIONDATE,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       ITEMNAME,',
'       QUANTITY1,',
'       QUANTITY2,',
'       AMOUNT',
'  from D_PRODUCT360VIEW_PRODUCTION',
'  Where ItemSpecificationCode like nvl(:P540_ITEMSPECIFICATIONCODE,''%'')',
'   and To_Char(PRODUCTIONDATE,''MON-YYYY'') like nvl(:P540_MONTH,''%'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P540_MODULE'
,p_plug_display_when_cond2=>'PRODUCTION'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Customer Pending Orders'
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
 p_id=>wwv_flow_imp.id(245778178540970981)
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
,p_internal_uid=>53796262276267060
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245779446353970994)
,p_db_column_name=>'AMOUNT'
,p_display_order=>130
,p_column_identifier=>'G'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245821476835992782)
,p_db_column_name=>'BATCHNO'
,p_display_order=>370
,p_column_identifier=>'J'
,p_column_label=>'Batch No'
,p_column_html_expression=>'<div style="display:block; width:100px">#BATCHNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245778365178970983)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Company Code'
,p_column_html_expression=>'<div style="display:block; width:100px">#COMPANYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245778398722970984)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Company Name'
,p_column_html_expression=>'<div style="display:block; width:300px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245778960558970989)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>80
,p_column_identifier=>'D'
,p_column_label=>'Item Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245779073666970990)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>90
,p_column_identifier=>'E'
,p_column_label=>'Item Name'
,p_column_html_expression=>'<div style="display:block; width:150px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245818861066992756)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>250
,p_column_identifier=>'H'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245821682824992784)
,p_db_column_name=>'PRODUCTIONDATE'
,p_display_order=>390
,p_column_identifier=>'L'
,p_column_label=>'Production Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PRODUCTIONDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245821554184992783)
,p_db_column_name=>'PRODUCTIONNO'
,p_display_order=>380
,p_column_identifier=>'K'
,p_column_label=>'Production No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PRODUCTIONNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245779257603970992)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>110
,p_column_identifier=>'F'
,p_column_label=>'P Qty'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245819970459992767)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>360
,p_column_identifier=>'I'
,p_column_label=>'S Qty'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245778228244970982)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(245865357144197655)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'74163'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TNO:COMPANYCODE:COMPANYNAME:ITEMCODE:ITEMNAME:QUANTITY1:AMOUNT:ITEMSPECIFICATIONCODE:QUANTITY2:BATCHNO:PRODUCTIONNO:PRODUCTIONDATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(245681147018310193)
,p_plug_name=>'Products 12 Months Purchase Detail'
,p_static_id=>'products-12-months-purchase-detail'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       COMPANYNAME,',
'       LOCATIONCODE,',
'       LOCATIONNAME,',
'       DOCTYPECODE,',
'       DOCTYPENAME,',
'       PBPASSNO,',
'       PBPASSDATE,',
'       PARTYCODE,',
'       PARTYNAME,',
'       PARTYBILLNO,',
'       PARTYBILLDATE,',
'       PURCHASEORDERNO,',
'       PURCHASEORDERTNO,',
'       PARTYBILLAMOUNT,',
'       ITEMCODE,',
'       ITEMNAME,',
'       UOM1,',
'       QUANTITY1,',
'       UOM2,',
'       QUANTITY2,',
'       RATE,',
'       UOM,',
'       AMOUNT,',
'       CGST,',
'       SGST,',
'       IGST,',
'       TCS,',
'       TDS,',
'       FOOTERAMOUNT,',
'       OTHERAMOUNT,',
'       TOTALAMOUNT,',
'       PAIDAMOUNT,',
'       BALANCEAMOUNT,',
'       VOUCHERTNO,',
'       VOUCHERNO,',
'       VOUCHERDATE,',
'       DEBITNOTETNO,',
'       DEBITNOTENO,',
'       DEBITNOTEVOUCHERTNO,',
'       DEVITNOTEVOUCHERNO,',
'       AGEOFBILL,',
'       DUEDATE,',
'       CREDITDAYS,',
'       CITYCODE,',
'       CITYNAME,',
'       STATECODE,',
'       STATENAME,',
'       ITEMSPECIFICATIONCODE',
'  from D_SUPPLIER_360VIEW_ACTIVEPBPASS',
'  Where PartyCode like nvl(:P540_CUSTOMERCODE,''%'')',
'   and ItemSpecificationCode like nvl(:P540_ITEMSPECIFICATIONCODE,''%'')',
'   and To_Char(PBPASSDATE,''MON-YYYY'') like nvl(:P540_MONTH,''%'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P540_MODULE'
,p_plug_display_when_cond2=>'PURCHASE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Customer Pending Orders'
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
 p_id=>wwv_flow_imp.id(245681776035310199)
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
,p_internal_uid=>53699859770606278
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777689575970977)
,p_db_column_name=>'AGEOFBILL'
,p_display_order=>670
,p_column_identifier=>'BY'
,p_column_label=>'Age of Bill'
,p_column_html_expression=>'<div style="display:block; width:80px">#AGEOFBILL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245771924945970969)
,p_db_column_name=>'AMOUNT'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776887823970969)
,p_db_column_name=>'BALANCEAMOUNT'
,p_display_order=>590
,p_column_identifier=>'BQ'
,p_column_label=>'Balance Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#BALANCEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245771996043970970)
,p_db_column_name=>'CGST'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Cgst'
,p_column_html_expression=>'<div style="display:block; width:80px">#CGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245773130867970981)
,p_db_column_name=>'CITYCODE'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'City Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#CITYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245773230821970982)
,p_db_column_name=>'CITYNAME'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'City Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#CITYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245770140529970951)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Company Code'
,p_column_html_expression=>'<div style="display:block; width:100px">#COMPANYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245770199682970952)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Company Name'
,p_column_html_expression=>'<div style="display:block; width:300px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777905509970979)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>690
,p_column_identifier=>'CA'
,p_column_label=>'Credit Days'
,p_column_html_expression=>'<div style="display:block; width:80px">#CREDITDAYS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777435782970974)
,p_db_column_name=>'DEBITNOTENO'
,p_display_order=>640
,p_column_identifier=>'BV'
,p_column_label=>'Debit Note No'
,p_column_html_expression=>'<div style="display:block; width:150px">#DEBITNOTENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777319668970973)
,p_db_column_name=>'DEBITNOTETNO'
,p_display_order=>630
,p_column_identifier=>'BU'
,p_column_label=>'Debitnotetno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777504274970975)
,p_db_column_name=>'DEBITNOTEVOUCHERTNO'
,p_display_order=>650
,p_column_identifier=>'BW'
,p_column_label=>'Debitnotevouchertno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777674536970976)
,p_db_column_name=>'DEVITNOTEVOUCHERNO'
,p_display_order=>660
,p_column_identifier=>'BX'
,p_column_label=>'Devit Note Voucher No'
,p_column_html_expression=>'<div style="display:block; width:200px">#DEVITNOTEVOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245770520852970955)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Doctype Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245770666725970956)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Doctype Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777877338970978)
,p_db_column_name=>'DUEDATE'
,p_display_order=>680
,p_column_identifier=>'BZ'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#DUEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245772477057970974)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Footer Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#FOOTERAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245772199691970972)
,p_db_column_name=>'IGST'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Igst'
,p_column_html_expression=>'<div style="display:block; width:80px">#IGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245771342346970963)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Item Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245771442310970964)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Item Name'
,p_column_html_expression=>'<div style="display:block; width:350px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245773703430970987)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245770298300970953)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#LOCATIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245770416581970954)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Location Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245772508464970975)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Other Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#OTHERAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776789478970968)
,p_db_column_name=>'PAIDAMOUNT'
,p_display_order=>580
,p_column_identifier=>'BP'
,p_column_label=>'Paid Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#PAIDAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776327478970963)
,p_db_column_name=>'PARTYBILLAMOUNT'
,p_display_order=>530
,p_column_identifier=>'BK'
,p_column_label=>'Party Bill Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776014771970960)
,p_db_column_name=>'PARTYBILLDATE'
,p_display_order=>500
,p_column_identifier=>'BH'
,p_column_label=>'Party Bill Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245775892003970959)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>490
,p_column_identifier=>'BG'
,p_column_label=>'Party Bill No'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245774474958970994)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Party Code'
,p_column_html_expression=>'<div style="display:block; width:60px">#PARTYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245774520904970995)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Party Name'
,p_column_html_expression=>'<div style="display:block; width:300px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245775828483970958)
,p_db_column_name=>'PBPASSDATE'
,p_display_order=>480
,p_column_identifier=>'BF'
,p_column_label=>'PB Pass Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PBPASSDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245775694982970957)
,p_db_column_name=>'PBPASSNO'
,p_display_order=>470
,p_column_identifier=>'BE'
,p_column_label=>'PB Pass No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PBPASSNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776169656970961)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>510
,p_column_identifier=>'BI'
,p_column_label=>'Purchase Order No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PURCHASEORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776216783970962)
,p_db_column_name=>'PURCHASEORDERTNO'
,p_display_order=>520
,p_column_identifier=>'BJ'
,p_column_label=>'Purchaseordertno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245771758594970967)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'P Qty'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776513013970965)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>550
,p_column_identifier=>'BM'
,p_column_label=>'S Qty'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245771839416970968)
,p_db_column_name=>'RATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#RATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245772163607970971)
,p_db_column_name=>'SGST'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Sgst'
,p_column_html_expression=>'<div style="display:block; width:80px">#SGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245772947849970979)
,p_db_column_name=>'STATECODE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'State Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#STATECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245773018514970980)
,p_db_column_name=>'STATENAME'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'State Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#STATENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245772320198970973)
,p_db_column_name=>'TCS'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Tcs'
,p_column_html_expression=>'<div style="display:block; width:80px">#TCS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776749127970967)
,p_db_column_name=>'TDS'
,p_display_order=>570
,p_column_identifier=>'BO'
,p_column_label=>'TDS'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245681884352310200)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245772589543970976)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Total Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776604892970966)
,p_db_column_name=>'UOM'
,p_display_order=>560
,p_column_identifier=>'BN'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:80px">#UOM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245771641188970966)
,p_db_column_name=>'UOM1'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245776481535970964)
,p_db_column_name=>'UOM2'
,p_display_order=>540
,p_column_identifier=>'BL'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:80px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777283907970972)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>620
,p_column_identifier=>'BT'
,p_column_label=>'Voucher Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777167981970971)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>610
,p_column_identifier=>'BS'
,p_column_label=>'Voucher No'
,p_column_html_expression=>'<div style="display:block; width:200px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245777018956970970)
,p_db_column_name=>'VOUCHERTNO'
,p_display_order=>600
,p_column_identifier=>'BR'
,p_column_label=>'Vouchertno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(245846430750014581)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'73974'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PBPASSNO:PBPASSDATE:PARTYCODE:PARTYNAME:PARTYBILLNO:PARTYBILLDATE:PURCHASEORDERNO:PARTYBILLAMOUNT:ITEMCODE:ITEMNAME:UOM1:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:FOOTERAMOUNT:OTHERAMOUNT:TDS:TOTALAMOUNT:PAIDAMOUNT:BALANCEAMOUNT:VOUCHER'
||'NO:VOUCHERDATE:DEBITNOTENO:DEVITNOTEVOUCHERNO:AGEOFBILL:DUEDATE:CREDITDAYS:STATENAME:CITYNAME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(258145725767201434)
,p_plug_name=>'Products 12 Months Sale Detail'
,p_static_id=>'products-12-months-sale-detail'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       COMPANYNAME,',
'       LOCATIONCODE,',
'       LOCATIONNAME,',
'       DOCTYPECODE,',
'       DOCTYPENAME,',
'       CCINVOICENO,',
'       CCINVOICEDATE,',
'       DESPATCHADVICETNO,',
'       DESPATCHADVICENO,',
'       DESPATCHADVICEDATE,',
'       SALESORDERTNO,',
'       SALESORDERNO,',
'       SALESORDERDATE,',
'       PARTYCODE,',
'       PARTYNAME,',
'       CONSIGNEECODE,',
'       CONSIGNEENAME,',
'       TRANSPORTERCODE,',
'       TRANSPORTERNAME,',
'       VEHICLENO,',
'       LORRYNO,',
'       LORRYDATE,',
'       FREIGHTTYPECODE,',
'       FREIGHTTYPENAME,',
'       FREIGHTRATE,',
'       FREIGHTUNITCODE,',
'       ITEMCODE,',
'       ITEMNAME,',
'       MATERIALDESCRIPTION,',
'       UOM1,',
'       QUANTITY1,',
'       RATE,',
'       AMOUNT,',
'       CGST,',
'       SGST,',
'       IGST,',
'       TCS,',
'       FOOTERAMOUNT,',
'       OTHERAMOUNT,',
'       TOTALAMOUNT,',
'       CREATOR,',
'       CREATIONTIME,',
'       AGENTCODE,',
'       AGENTNAME,',
'       CITYCODE,',
'       CITYNAME,',
'       STATECODE,',
'       STATENAME,',
'       REGIONCODE,',
'       REGIONNAME,',
'       AGEOFINVOICE,',
'       SALESPERSONCODE,',
'       SALESPERSONNAME,',
'       ITEMSPECIFICATIONCODE',
'  from D_CUSTOMER_360VIEW_ACTIVEINVOICE',
' Where PartyCode like nvl(:P540_CUSTOMERCODE,''%'')',
'   and ItemSpecificationCode like nvl(:P540_ITEMSPECIFICATIONCODE,''%'')',
'   and To_Char(CCINVOICEDATE,''MON-YYYY'') like nvl(:P540_MONTH,''%'')'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P540_MODULE'
,p_plug_display_when_cond2=>'SALE'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Customer Pending Orders'
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
 p_id=>wwv_flow_imp.id(258145786449201435)
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
,p_internal_uid=>66163870184497514
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245737949060783904)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Agent Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#AGENTCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245738342039783905)
,p_db_column_name=>'AGENTNAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Agent Name'
,p_column_html_expression=>'<div style="display:block; width:150px">#AGENTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680995288310192)
,p_db_column_name=>'AGEOFINVOICE'
,p_display_order=>660
,p_column_identifier=>'BN'
,p_column_label=>'Age of Invoice'
,p_column_html_expression=>'<div style="display:block; width:80px">#AGEOFINVOICE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245743102710783906)
,p_db_column_name=>'AMOUNT'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245679462046310176)
,p_db_column_name=>'CCINVOICEDATE'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'CCInvoice Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#CCINVOICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245679341196310175)
,p_db_column_name=>'CCINVOICENO'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'CCInvoice No'
,p_column_html_expression=>'<div style="display:block; width:100px">#CCINVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245743486883783906)
,p_db_column_name=>'CGST'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Cgst'
,p_column_html_expression=>'<div style="display:block; width:80px">#CGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245749170241783908)
,p_db_column_name=>'CITYCODE'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'City Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#CITYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245749540914783909)
,p_db_column_name=>'CITYNAME'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'City Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#CITYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245733095747783903)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Company Code'
,p_column_html_expression=>'<div style="display:block; width:100px">#COMPANYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245733509892783903)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Company Name'
,p_column_html_expression=>'<div style="display:block; width:300px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245737105280783904)
,p_db_column_name=>'CONSIGNEECODE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Consignee Code'
,p_column_html_expression=>'<div style="display:block; width:60px">#CONSIGNEECODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245737493115783904)
,p_db_column_name=>'CONSIGNEENAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Consignee Name'
,p_column_html_expression=>'<div style="display:block; width:300px">#CONSIGNEENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245746723085783908)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Creation Time'
,p_column_html_expression=>'<div style="display:block; width:125px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245746307997783907)
,p_db_column_name=>'CREATOR'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Creator'
,p_column_html_expression=>'<div style="display:block; width:200px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245679695077310179)
,p_db_column_name=>'DESPATCHADVICEDATE'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Dispatch Advice Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#DESPATCHADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245679655020310178)
,p_db_column_name=>'DESPATCHADVICENO'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Dispatch Advice No'
,p_column_html_expression=>'<div style="display:block; width:150px">#DESPATCHADVICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245679574119310177)
,p_db_column_name=>'DESPATCHADVICETNO'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Despatchadvicetno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245734740216783903)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Doctype Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245735086854783903)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Doctype Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245745184732783907)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Footer Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#FOOTERAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680842482310190)
,p_db_column_name=>'FREIGHTRATE'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'Freight Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTRATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680622840310188)
,p_db_column_name=>'FREIGHTTYPECODE'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Freight Type Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680782732310189)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'Freight Type'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680965430310191)
,p_db_column_name=>'FREIGHTUNITCODE'
,p_display_order=>650
,p_column_identifier=>'BM'
,p_column_label=>'Freight Unit'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTUNITCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245744317226783907)
,p_db_column_name=>'IGST'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Igst'
,p_column_html_expression=>'<div style="display:block; width:80px">#IGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245739977992783905)
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
 p_id=>wwv_flow_imp.id(245740303267783905)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Item Name'
,p_column_html_expression=>'<div style="display:block; width:150px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245751491390783909)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Item Specification Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#ITEMSPECIFICATIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245733946843783903)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#LOCATIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245734382810783903)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Location Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680524650310187)
,p_db_column_name=>'LORRYDATE'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Lorry Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#LORRYDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680478146310186)
,p_db_column_name=>'LORRYNO'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Lorry No'
,p_column_html_expression=>'<div style="display:block; width:80px">#LORRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245740747446783905)
,p_db_column_name=>'MATERIALDESCRIPTION'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Material Description'
,p_column_html_expression=>'<div style="display:block; width:400px">#MATERIALDESCRIPTION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245745500115783907)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Other Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#OTHERAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245679951316310181)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Party Code'
,p_column_html_expression=>'<div style="display:block; width:60px">#PARTYCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680068121310182)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Party Name'
,p_column_html_expression=>'<div style="display:block; width:300px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245741530429783906)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'P Qty'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245742701753783906)
,p_db_column_name=>'RATE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#RATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245749940583783909)
,p_db_column_name=>'REGIONCODE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Region Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#REGIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245750364431783909)
,p_db_column_name=>'REGIONNAME'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Region Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#REGIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245735907809783904)
,p_db_column_name=>'SALESORDERDATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Sales Order Date'
,p_column_html_expression=>'<div style="display:block; width:100px">#SALESORDERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245735495775783904)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Sales Order No'
,p_column_html_expression=>'<div style="display:block; width:150px">#SALESORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245679794459310180)
,p_db_column_name=>'SALESORDERTNO'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Salesordertno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245750691852783909)
,p_db_column_name=>'SALESPERSONCODE'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Sales Person Code'
,p_column_html_expression=>'<div style="display:block; width:100px">#SALESPERSONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245751113281783909)
,p_db_column_name=>'SALESPERSONNAME'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Sales Person Name'
,p_column_html_expression=>'<div style="display:block; width:150px">#SALESPERSONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245743921550783907)
,p_db_column_name=>'SGST'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Sgst'
,p_column_html_expression=>'<div style="display:block; width:80px">#SGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245748338330783908)
,p_db_column_name=>'STATECODE'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'State Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#STATECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245748720103783908)
,p_db_column_name=>'STATENAME'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'State Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#STATENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245744724851783907)
,p_db_column_name=>'TCS'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Tcs'
,p_column_html_expression=>'<div style="display:block; width:80px">#TCS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245732811700783902)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245745915027783907)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Total Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680099538310183)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Transporter Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680216754310184)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Transporter Name'
,p_column_html_expression=>'<div style="display:block; width:250px">#TRANSPORTERNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245741106340783906)
,p_db_column_name=>'UOM1'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(245680333299310185)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Vehicle No'
,p_column_html_expression=>'<div style="display:block; width:80px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(258209814433484454)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'73028'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CCINVOICENO:CCINVOICEDATE:PARTYCODE:PARTYNAME:CONSIGNEECODE:CONSIGNEENAME:DESPATCHADVICENO:SALESORDERNO:AGENTNAME:TRANSPORTERNAME:VEHICLENO:LORRYNO:LORRYDATE:FREIGHTTYPENAME:FREIGHTRATE:FREIGHTUNITCODE:ITEMCODE:MATERIALDESCRIPTION:UOM1:QUANTITY1:RATE'
||':AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATIONTIME:STATENAME:CITYNAME:REGIONNAME:SALESPERSONCODE:SALESPERSONNAME:AGEOFINVOICE'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(245768964404783923)
,p_name=>'P540_CUSTOMERCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(245775627864970956)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(245769379301783924)
,p_name=>'P540_ITEMCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(245775627864970956)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(245769733236783924)
,p_name=>'P540_ITEMSPECIFICATIONCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(245775627864970956)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(245695848125310186)
,p_name=>'P540_MODULE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(245775627864970956)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(245695782283310185)
,p_name=>'P540_MONTH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(245775627864970956)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
