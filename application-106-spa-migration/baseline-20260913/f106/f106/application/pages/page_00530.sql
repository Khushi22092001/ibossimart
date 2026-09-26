prompt --application/pages/page_00530
begin
--   Manifest
--     PAGE: 00530
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
 p_id=>530
,p_name=>'Supplier Active PO'
,p_alias=>'SUPPLIER-ACTIVE-PO'
,p_step_title=>'Supplier Active PO'
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
 p_id=>wwv_flow_imp.id(479341498765713136)
,p_plug_name=>'Supplier Active PO'
,p_static_id=>'supplier-active-po'
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
'       PURCHASEORDERNO,',
'       PURCHASEORDERDATE,',
'       PARTYCODE,',
'       PARTYNAME,',
'       AGENTCODE,',
'       AGENTNAME,',
'       DELIVERYDATE,',
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
'       FREIGHTTYPECODE,',
'       FREIGHTTYPENAME,',
'       GRNSTATUS,',
'       GRNRECEIVEDQUANTITY1,',
'       GRNRECEIVEDQUANTITY2,',
'       BALANCEQUANTITY1,',
'       CREATOR,',
'       CREATIONTIME,',
'       STATECODE,',
'       STATENAME,',
'       CITYCODE,',
'       CITYNAME,',
'       REGIONCODE,',
'       REGIONNAME,',
'       BALANCEQUANTITY2',
'  from D_SUPPLIER_360VIEW_ACTIVEPURCHASEORDERS',
'  where Partycode = :P530_SUPPLIERCODE'))
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
 p_id=>wwv_flow_imp.id(479341559447713137)
,p_max_row_count=>'1000000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_search_textbox=>'N'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>40356690248015153
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461747910087552673)
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
 p_id=>wwv_flow_imp.id(461748289696552673)
,p_db_column_name=>'AGENTNAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Agent Name'
,p_column_html_expression=>'<div style="display:block; width:200px">#AGENTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461751097384552674)
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
 p_id=>wwv_flow_imp.id(461632789766058932)
,p_db_column_name=>'BALANCEQUANTITY1'
,p_display_order=>710
,p_column_identifier=>'BX'
,p_column_label=>'Balance P Qty'
,p_column_html_expression=>'<div style="display:block; width:80px">#BALANCEQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461632869190058933)
,p_db_column_name=>'BALANCEQUANTITY2'
,p_display_order=>720
,p_column_identifier=>'BY'
,p_column_label=>'Balance S Qty'
,p_column_html_expression=>'<div style="display:block; width:80px">#BALANCEQUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461751459454552674)
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
 p_id=>wwv_flow_imp.id(461755837490552676)
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
 p_id=>wwv_flow_imp.id(461756275969552676)
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
 p_id=>wwv_flow_imp.id(461743862141552671)
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
 p_id=>wwv_flow_imp.id(461744286852552672)
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
 p_id=>wwv_flow_imp.id(461754657379552676)
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
 p_id=>wwv_flow_imp.id(461754307860552676)
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
 p_id=>wwv_flow_imp.id(461632215303058926)
,p_db_column_name=>'DELIVERYDATE'
,p_display_order=>650
,p_column_identifier=>'BR'
,p_column_label=>'Delivery Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#DELIVERYDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461745445604552672)
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
 p_id=>wwv_flow_imp.id(461745919469552672)
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
 p_id=>wwv_flow_imp.id(461753111755552675)
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
 p_id=>wwv_flow_imp.id(461761835068552679)
,p_db_column_name=>'FREIGHTTYPECODE'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'Freight Type'
,p_column_html_expression=>'<div style="display:block; width:60px">#FREIGHTTYPECODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461762322571552679)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Freight Type Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTTYPENAME#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461632595826058930)
,p_db_column_name=>'GRNRECEIVEDQUANTITY1'
,p_display_order=>690
,p_column_identifier=>'BV'
,p_column_label=>'GRN Received P Qty'
,p_column_html_expression=>'<div style="display:block; width:80px">#GRNRECEIVEDQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461632701162058931)
,p_db_column_name=>'GRNRECEIVEDQUANTITY2'
,p_display_order=>700
,p_column_identifier=>'BW'
,p_column_label=>'GRN Received S Qty'
,p_column_html_expression=>'<div style="display:block; width:80px">#GRNRECEIVEDQUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461632498287058929)
,p_db_column_name=>'GRNSTATUS'
,p_display_order=>680
,p_column_identifier=>'BU'
,p_column_label=>'GRN Status'
,p_column_html_expression=>'<div style="display:block; width:80px">#GRNSTATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461752319610552675)
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
 p_id=>wwv_flow_imp.id(461748662018552673)
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
 p_id=>wwv_flow_imp.id(461749030588552674)
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
 p_id=>wwv_flow_imp.id(461744690264552672)
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
 p_id=>wwv_flow_imp.id(461745085683552672)
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
 p_id=>wwv_flow_imp.id(461749487707552674)
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
 p_id=>wwv_flow_imp.id(461753501146552675)
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
 p_id=>wwv_flow_imp.id(461759057197552678)
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
 p_id=>wwv_flow_imp.id(461759473985552678)
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
 p_id=>wwv_flow_imp.id(461632064691058925)
,p_db_column_name=>'PURCHASEORDERDATE'
,p_display_order=>640
,p_column_identifier=>'BQ'
,p_column_label=>'Purchase Order Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PURCHASEORDERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461631948271058924)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>630
,p_column_identifier=>'BP'
,p_column_label=>'Purchase Order No'
,p_column_html_expression=>'<div style="display:block; width:200px">#PURCHASEORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461750327725552674)
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
 p_id=>wwv_flow_imp.id(461632406046058928)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>670
,p_column_identifier=>'BT'
,p_column_label=>'S Qty'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461750662713552674)
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
 p_id=>wwv_flow_imp.id(461756670502552677)
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
 p_id=>wwv_flow_imp.id(461757033518552677)
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
 p_id=>wwv_flow_imp.id(461751858180552675)
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
 p_id=>wwv_flow_imp.id(461755115493552676)
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
 p_id=>wwv_flow_imp.id(461755448606552676)
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
 p_id=>wwv_flow_imp.id(461752700355552675)
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
 p_id=>wwv_flow_imp.id(461743496984552671)
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
 p_id=>wwv_flow_imp.id(461753862825552675)
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
 p_id=>wwv_flow_imp.id(461749894297552674)
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
 p_id=>wwv_flow_imp.id(461632287739058927)
,p_db_column_name=>'UOM2'
,p_display_order=>660
,p_column_identifier=>'BS'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(479405587431996156)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'64842'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PURCHASEORDERNO:PURCHASEORDERDATE:DELIVERYDATE:AGENTNAME:FREIGHTTYPECODE:ITEMCODE:MATERIALDESCRIPTION:UOM1:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:GRNSTATUS:GRNRECEIVEDQUANTITY1:GRNRECEIVEDQUANTITY2:BALANCEQUAN'
||'TITY1:BALANCEQUANTITY2:CREATOR:CREATIONTIME:REGIONNAME:CITYNAME:STATENAME'
,p_sum_columns_on_break=>'QUANTITY1:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY:QUANTITY2:GRNRECEIVEDQUANTITY1:GRNRECEIVEDQUANTITY2:BALANCEQUANTITY1:BALANCEQUANTITY2'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461778672689552690)
,p_name=>'P530_SUPPLIERCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(479341498765713136)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
