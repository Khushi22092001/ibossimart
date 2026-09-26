prompt --application/pages/page_00542
begin
--   Manifest
--     PAGE: 00542
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>542
,p_name=>'Supplier Active Purchase Bill Pass'
,p_alias=>'SUPPLIER-ACTIVE-PURCHASE-BILL-PASS'
,p_step_title=>'Supplier Active Purchase Bill Pass'
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
 p_id=>wwv_flow_imp.id(276485037698997802)
,p_plug_name=>'Supplier Active Purchase Bill Pass'
,p_static_id=>'supplier-active-purchase-bill-pass'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
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
'       STATENAME',
'  from D_SUPPLIER_360VIEW_ACTIVEPBPASS',
'  where PARTYCODE = :P542_SUPPLIERCODE',
'    AND TO_CHAR(PBPASSDATE,''MON-YYYY'') LIKE NVL(:P542_MONTH,''%'')',
'    AND (AGEOFBILL BETWEEN :P542_FROMAGE AND :P542_TOAGE  OR :P542_FROMAGE IS  NULL OR :P542_TOAGE IS NULL)'))
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
 p_id=>wwv_flow_imp.id(276485098380997803)
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
,p_internal_uid=>76961692307591132
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252698929613280231)
,p_db_column_name=>'AGEOFBILL'
,p_display_order=>760
,p_column_identifier=>'CH'
,p_column_label=>'Age of Bill'
,p_column_html_expression=>'<div style="display:block; width:60px">#AGEOFBILL#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252681824067272575)
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
 p_id=>wwv_flow_imp.id(252698111338280223)
,p_db_column_name=>'BALANCEAMOUNT'
,p_display_order=>680
,p_column_identifier=>'BZ'
,p_column_label=>'Balance Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#BALANCEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252682169443272575)
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
 p_id=>wwv_flow_imp.id(252686627101272576)
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
 p_id=>wwv_flow_imp.id(252687035465272577)
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
 p_id=>wwv_flow_imp.id(252674649461272572)
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
 p_id=>wwv_flow_imp.id(252675021069272572)
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
 p_id=>wwv_flow_imp.id(252699079198280233)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>780
,p_column_identifier=>'CJ'
,p_column_label=>'Credit Days'
,p_column_html_expression=>'<div style="display:block; width:60px">#CREDITDAYS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252698600197280228)
,p_db_column_name=>'DEBITNOTENO'
,p_display_order=>730
,p_column_identifier=>'CE'
,p_column_label=>'Debit Note No'
,p_column_html_expression=>'<div style="display:block; width:150px">#DEBITNOTENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252698514810280227)
,p_db_column_name=>'DEBITNOTETNO'
,p_display_order=>720
,p_column_identifier=>'CD'
,p_column_label=>'Debit NoteTNo'
,p_column_html_expression=>'<div style="display:block; width:60px">#DEBITNOTETNO#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252698708380280229)
,p_db_column_name=>'DEBITNOTEVOUCHERTNO'
,p_display_order=>740
,p_column_identifier=>'CF'
,p_column_label=>'DebitNoteVoucherTNo'
,p_column_html_expression=>'<div style="display:block; width:40px">#DEBITNOTEVOUCHERTNO#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252698849356280230)
,p_db_column_name=>'DEVITNOTEVOUCHERNO'
,p_display_order=>750
,p_column_identifier=>'CG'
,p_column_label=>'Debit Note Voucher No'
,p_column_html_expression=>'<div style="display:block; width:180px">#DEVITNOTEVOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252676176370272572)
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
 p_id=>wwv_flow_imp.id(252676592371272572)
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
 p_id=>wwv_flow_imp.id(252699038151280232)
,p_db_column_name=>'DUEDATE'
,p_display_order=>770
,p_column_identifier=>'CI'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#DUEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252683772979272575)
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
 p_id=>wwv_flow_imp.id(252683054080272575)
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
 p_id=>wwv_flow_imp.id(252679441317272574)
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
 p_id=>wwv_flow_imp.id(252679788980272574)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Item Name'
,p_column_html_expression=>'<div style="display:block; width:350px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252675397848272572)
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
 p_id=>wwv_flow_imp.id(252675769111272572)
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
 p_id=>wwv_flow_imp.id(252684165646272576)
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
 p_id=>wwv_flow_imp.id(252698005478280222)
,p_db_column_name=>'PAIDAMOUNT'
,p_display_order=>670
,p_column_identifier=>'BY'
,p_column_label=>'Paid Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#PAIDAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252697524760280217)
,p_db_column_name=>'PARTYBILLAMOUNT'
,p_display_order=>620
,p_column_identifier=>'BT'
,p_column_label=>'Party Bill Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252697223813280214)
,p_db_column_name=>'PARTYBILLDATE'
,p_display_order=>590
,p_column_identifier=>'BQ'
,p_column_label=>'Party Bill Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252697117354280213)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>580
,p_column_identifier=>'BP'
,p_column_label=>'Party Bill No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252689804104272578)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Party Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252690207579272578)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Party Name'
,p_column_html_expression=>'<div style="display:block; width:400px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252696973585280212)
,p_db_column_name=>'PBPASSDATE'
,p_display_order=>570
,p_column_identifier=>'BO'
,p_column_label=>'PB Pass Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PBPASSDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252696920186280211)
,p_db_column_name=>'PBPASSNO'
,p_display_order=>560
,p_column_identifier=>'BN'
,p_column_label=>'PB Pass No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PBPASSNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252697279468280215)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>600
,p_column_identifier=>'BR'
,p_column_label=>'Purchase Order No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PURCHASEORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252697431450280216)
,p_db_column_name=>'PURCHASEORDERTNO'
,p_display_order=>610
,p_column_identifier=>'BS'
,p_column_label=>'POTNO'
,p_column_html_expression=>'<div style="display:block; width:60px">#PURCHASEORDERTNO#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252681023016272574)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'P Qty'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252697680944280219)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>640
,p_column_identifier=>'BV'
,p_column_label=>'S Qty'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252681374395272574)
,p_db_column_name=>'RATE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#RATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252682604459272575)
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
 p_id=>wwv_flow_imp.id(252685778735272576)
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
 p_id=>wwv_flow_imp.id(252686196651272576)
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
 p_id=>wwv_flow_imp.id(252683356599272575)
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
 p_id=>wwv_flow_imp.id(252697907456280221)
,p_db_column_name=>'TDS'
,p_display_order=>660
,p_column_identifier=>'BX'
,p_column_label=>'Tds'
,p_column_html_expression=>'<div style="display:block; width:60px">#TDS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252674192152272571)
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
 p_id=>wwv_flow_imp.id(252684588761272576)
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
 p_id=>wwv_flow_imp.id(252697826265280220)
,p_db_column_name=>'UOM'
,p_display_order=>650
,p_column_identifier=>'BW'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252680588354272574)
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
 p_id=>wwv_flow_imp.id(252697625577280218)
,p_db_column_name=>'UOM2'
,p_display_order=>630
,p_column_identifier=>'BU'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252698416585280226)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>710
,p_column_identifier=>'CC'
,p_column_label=>'Voucher Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252698309442280225)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>700
,p_column_identifier=>'CB'
,p_column_label=>'Voucher No'
,p_column_html_expression=>'<div style="display:block; width:180px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(252698246504280224)
,p_db_column_name=>'VOUCHERTNO'
,p_display_order=>690
,p_column_identifier=>'CA'
,p_column_label=>'VoucherTNo'
,p_column_html_expression=>'<div style="display:block; width:60px">#VOUCHERTNO#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(276549126365280822)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'66365'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PBPASSNO:PBPASSDATE:PARTYBILLNO:PARTYBILLDATE:PURCHASEORDERNO:ITEMCODE:ITEMNAME:UOM:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:TDS:OTHERAMOUNT:TOTALAMOUNT:PAIDAMOUNT:BALANCEAMOUNT:VOUCHERNO:VOUCHERDATE:DEBITNOTENO:DEVITNOTEVOUCHERNO:AGEO'
||'FBILL:DUEDATE:CREDITDAYS:STATENAME:CITYNAME'
,p_sort_column_1=>'PBPASSNO'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(252711804621272590)
,p_name=>'P542_FROMAGE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(276485037698997802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(252711345155272590)
,p_name=>'P542_MONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(276485037698997802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(252710945191272590)
,p_name=>'P542_SUPPLIERCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(276485037698997802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(252712185130272590)
,p_name=>'P542_TOAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(276485037698997802)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
