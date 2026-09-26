prompt --application/pages/page_00522
begin
--   Manifest
--     PAGE: 00522
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
 p_id=>522
,p_name=>'Customer Pending Orders'
,p_alias=>'CUSTOMER-PENDING-ORDERS'
,p_step_title=>'Customer Pending Orders'
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
 p_id=>wwv_flow_imp.id(460483333894453885)
,p_plug_name=>'Customer Pending Orders'
,p_static_id=>'customer-pending-orders'
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
'       SALESORDERNO,',
'       SALESORDERDATE,',
'       VENDORCODE,',
'       VENDORNAME,',
'       CONSIGNEECODE,',
'       CONSIGNEENAME,',
'       AGENTCODE,',
'       AGENTNAME,',
'       PARTYPONO,',
'       PARTYPODATE,',
'       VALIDITYUPTODATE,',
'       ITEMCODE,',
'       ITEMNAME,',
'       MATERIALDESCRIPTION,',
'       UOM1,',
'       QUANTITY1,',
'       UOM2,',
'       QUANTITY2,',
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
'       DESPATCHQUANTITY,',
'       INVOICEQUANTITY,',
'       BALANCEQUANTITY,',
'       STATECODE,',
'       STATENAME,',
'       CITYCODE,',
'       CITYNAME,',
'       REGIONCODE,',
'       REGIONNAME,',
'       SALESPERSONCODE,',
'       SALESPERSONNAME,',
'       ITEMSPECIFICATIONCODE',
'  from D_CUSTOMER_360VIEW_PENDINGORDERS ',
'  Where VENDORCODE LIKE NVL(:P522_CUSTOMERCODE,''%'')',
'    AND ITEMCODE LIKE NVL(:P522_ITEMCODE,''%'')',
'    AND ITEMSPECIFICATIONCODE LIKE NVL(:P522_ITEMSPECIFICATIONCODE,''%'')',
''))
,p_plug_source_type=>'NATIVE_IR'
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
 p_id=>wwv_flow_imp.id(460483394576453886)
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
,p_internal_uid=>21498525376755902
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460484772980453900)
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
 p_id=>wwv_flow_imp.id(460484882837453901)
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
 p_id=>wwv_flow_imp.id(460526955131719463)
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
 p_id=>wwv_flow_imp.id(460528214883719475)
,p_db_column_name=>'BALANCEQUANTITY'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Balance Quantity'
,p_column_html_expression=>'<div style="display:block; width:100px">#BALANCEQUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460527054986719464)
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
 p_id=>wwv_flow_imp.id(460528473477719478)
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
 p_id=>wwv_flow_imp.id(460528553718719479)
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
 p_id=>wwv_flow_imp.id(460483630353453888)
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
 p_id=>wwv_flow_imp.id(460483690876453889)
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
 p_id=>wwv_flow_imp.id(460484643032453898)
,p_db_column_name=>'CONSIGNEECODE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Consignee Code'
,p_column_html_expression=>'<div style="display:block; width:85px">#CONSIGNEECODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460484718188453899)
,p_db_column_name=>'CONSIGNEENAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Consignee Name'
,p_column_html_expression=>'<div style="display:block; width:350px">#CONSIGNEENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460527945090719472)
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
 p_id=>wwv_flow_imp.id(460527765118719471)
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
 p_id=>wwv_flow_imp.id(460528004949719473)
,p_db_column_name=>'DESPATCHQUANTITY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Despatch Quantity'
,p_column_html_expression=>'<div style="display:block; width:100px">#DESPATCHQUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460484032898453892)
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
 p_id=>wwv_flow_imp.id(460484088529453893)
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
 p_id=>wwv_flow_imp.id(460527470863719468)
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
 p_id=>wwv_flow_imp.id(460527346551719466)
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
 p_id=>wwv_flow_imp.id(460528052138719474)
,p_db_column_name=>'INVOICEQUANTITY'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Invoice Quantity'
,p_column_html_expression=>'<div style="display:block; width:100px">#INVOICEQUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460485337719453905)
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
 p_id=>wwv_flow_imp.id(460485445367453906)
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
 p_id=>wwv_flow_imp.id(461943753290340607)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460483818095453890)
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
 p_id=>wwv_flow_imp.id(460483933396453891)
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
 p_id=>wwv_flow_imp.id(460485508516453907)
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
 p_id=>wwv_flow_imp.id(460527593270719469)
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
 p_id=>wwv_flow_imp.id(460485055727453903)
,p_db_column_name=>'PARTYPODATE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Party PO Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYPODATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460484974856453902)
,p_db_column_name=>'PARTYPONO'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Party PO No'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYPONO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460485687551453909)
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
 p_id=>wwv_flow_imp.id(460526843719719461)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'S Qty'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460526891455719462)
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
 p_id=>wwv_flow_imp.id(460528677778719480)
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
 p_id=>wwv_flow_imp.id(460528807216719481)
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
 p_id=>wwv_flow_imp.id(460484288736453895)
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
 p_id=>wwv_flow_imp.id(460484220604453894)
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
 p_id=>wwv_flow_imp.id(460528914760719482)
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
 p_id=>wwv_flow_imp.id(460529042959719483)
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
 p_id=>wwv_flow_imp.id(460527245695719465)
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
 p_id=>wwv_flow_imp.id(460528302299719476)
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
 p_id=>wwv_flow_imp.id(460528357094719477)
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
 p_id=>wwv_flow_imp.id(460527423982719467)
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
 p_id=>wwv_flow_imp.id(460483498736453887)
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
 p_id=>wwv_flow_imp.id(460527702433719470)
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
 p_id=>wwv_flow_imp.id(460485554712453908)
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
 p_id=>wwv_flow_imp.id(460485831312453910)
,p_db_column_name=>'UOM2'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460485183007453904)
,p_db_column_name=>'VALIDITYUPTODATE'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Validity up to'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALIDITYUPTODATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460484401705453896)
,p_db_column_name=>'VENDORCODE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Vendor Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#VENDORCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460484452544453897)
,p_db_column_name=>'VENDORNAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Vendor Name'
,p_column_html_expression=>'<div style="display:block; width:350px">#VENDORNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(460547422560736905)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'54280'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SALESORDERNO:SALESORDERDATE:VENDORCODE:VENDORNAME:CONSIGNEECODE:CONSIGNEENAME:AGENTCODE:AGENTNAME:PARTYPONO:PARTYPODATE:VALIDITYUPTODATE:ITEMCODE:MATERIALDESCRIPTION:UOM1:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT'
||':CREATOR:CREATIONTIME:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY:STATENAME:CITYNAME:REGIONNAME:SALESPERSONCODE:SALESPERSONNAME'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(460544462203719576)
,p_name=>'P522_CUSTOMERCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(460483333894453885)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461958933322340697)
,p_name=>'P522_ITEMCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(460483333894453885)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461959046370340698)
,p_name=>'P522_ITEMSPECIFICATIONCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(460483333894453885)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
