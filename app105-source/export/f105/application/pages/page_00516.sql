prompt --application/pages/page_00516
begin
--   Manifest
--     PAGE: 00516
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
 p_id=>516
,p_name=>'Finished Products'
,p_alias=>'FINISHED-PRODUCTS'
,p_step_title=>'Finished Products'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*    ',
'    function codeAddress()',
'    {',
'    document.getElementById("X").style.color="red";}',
'    /*var tb = document.getElementById("C5361576669511002");',
'    var tds = tb.getElementsByTagName("tr");',
'        tds[0].style.color="red";',
'    }',
'    window.onload = codeAddress;',
'*/'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(461339157891949803)
,p_plug_name=>'Products 360 View Report'
,p_static_id=>'products-360-view-report'
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
'       ITEMCODE,',
'       ITEMNAME,',
'       ITEMSPECIFICATIONCODE,',
'       ITEMSPECIFICATIONNAME,',
'       ITEMDESCRIPTION,',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':518:''||:APP_SESSION||''::''||'':518:P518_ITEMSPECIFICATIONCODEP:''||ITEMSPECIFICATIONCODE,NULL,''SESSION'' )||''">''||ITEMDESCRIPTION||''</a>'' as ProductLink,',
'       UOM1,',
'       UOM2,',
'       ROUND(STOCKQUANTITY1,2)STOCKQUANTITY1,',
'       ROUND(STOCKQUANTITY2,2)STOCKQUANTITY2,',
'       ROUND(PENDINGSOVALUE,2)PENDINGSOVALUE,',
'       ROUND(PENDINGSOQUANTITY1,2)PENDINGSOQUANTITY1,',
'       ROUND(PENDINGSOQUANTITY2,2)PENDINGSOQUANTITY2,',
'       PENDINGSOCOUNT,',
'       ROUND(STOCKVALUE,2)STOCKVALUE,',
'       ROUND(PENDINGPOVALUE,2)PENDINGPOVALUE,',
'       ROUND(PENDINGPOQUANTITY1,2)PENDINGPOQUANTITY1,',
'       ROUND(PENDINGPOQUANTITY2,2)PENDINGPOQUANTITY2,',
'       PENDINGPOCOUNT,',
'       ROUND(PIPELINESTOCK,2)PIPELINESTOCK,',
'       RANKINSALES,',
'       RANKINPURCHASE,',
'       ROUND(LAST12MONTHSALES,2)LAST12MONTHSALES,',
'       ROUND(LAST12MONTHPURCHASE,2)LAST12MONTHPURCHASE,',
'       ROUND(LAST12MONTHPRODUCTION,2)LAST12MONTHPRODUCTION,',
'       ROUND(LAST12MONTHSALESRETURN,2)LAST12MONTHSALESRETURN,',
'       ROUND(LAST12MONTHPURCHASERETURN,2)LAST12MONTHPURCHASERETURN',
'  from D_PRODUCT360VIEW A',
'  WHERE EXISTS ( SELECT 1 FROM ITEM AA WHERE A.ITEMCODE = AA.ITEMCODE AND AA.ITEMNATURECODE in(''FINISHEDITEM'',''TRADING'') )'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Customer 360 View Report'
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
 p_id=>wwv_flow_imp.id(461342053949949832)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'100'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'NONE'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_computation=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>22357184750251848
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449868658035341741)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449869095307341741)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Company Name'
,p_column_html_expression=>'<div style="display:block; width:210px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449701932610833723)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>40
,p_column_identifier=>'AR'
,p_column_label=>'Item Code'
,p_column_link=>'f?p=&APP_ID.:517:&SESSION.::&DEBUG.:517:P517_ITEMCODE,P517_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#ITEMCODE#'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878198861371377)
,p_db_column_name=>'ITEMDESCRIPTION'
,p_display_order=>80
,p_column_identifier=>'AV'
,p_column_label=>'Item Detail'
,p_column_html_expression=>'<div style="display:block; width:355px">#ITEMDESCRIPTION#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449701991251833724)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>50
,p_column_identifier=>'AS'
,p_column_label=>'Item Name'
,p_column_html_expression=>'<div style="display:block; width:210px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449702121851833725)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>60
,p_column_identifier=>'AT'
,p_column_label=>'Item Specification Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#ITEMSPECIFICATIONCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878040066371376)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>70
,p_column_identifier=>'AU'
,p_column_label=>'Item Specification Name'
,p_column_html_expression=>'<div style="display:block; width:210px">#ITEMSPECIFICATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879491157371390)
,p_db_column_name=>'LAST12MONTHPRODUCTION'
,p_display_order=>210
,p_column_identifier=>'BI'
,p_column_label=>'Last 12 Month Production'
,p_column_html_expression=>'<div style="display:block; width:80px">#LAST12MONTHPRODUCTION#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879396926371389)
,p_db_column_name=>'LAST12MONTHPURCHASE'
,p_display_order=>200
,p_column_identifier=>'BH'
,p_column_label=>'Last 12 Month Purchase'
,p_column_html_expression=>'<div style="display:block; width:80px">#LAST12MONTHPURCHASE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879675206371392)
,p_db_column_name=>'LAST12MONTHPURCHASERETURN'
,p_display_order=>230
,p_column_identifier=>'BK'
,p_column_label=>'Last 12 Month Purchase Return'
,p_column_html_expression=>'<div style="display:block; width:80px">#LAST12MONTHPURCHASERETURN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879249002371388)
,p_db_column_name=>'LAST12MONTHSALES'
,p_display_order=>190
,p_column_identifier=>'BG'
,p_column_label=>'Last 12 Month Sales'
,p_column_html_expression=>'<div style="display:block; width:80px">#LAST12MONTHSALES#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879630640371391)
,p_db_column_name=>'LAST12MONTHSALESRETURN'
,p_display_order=>220
,p_column_identifier=>'BJ'
,p_column_label=>'Last 12 Month Sales Return'
,p_column_html_expression=>'<div style="display:block; width:80px">#LAST12MONTHSALESRETURN#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449880249537371398)
,p_db_column_name=>'PENDINGPOCOUNT'
,p_display_order=>290
,p_column_identifier=>'BQ'
,p_column_label=>'Pending PO Count'
,p_column_link=>'f?p=&APP_ID.:535:&SESSION.::&DEBUG.:535:P535_ITEMCODE,P535_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PENDINGPOCOUNT#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449880114984371396)
,p_db_column_name=>'PENDINGPOQUANTITY1'
,p_display_order=>270
,p_column_identifier=>'BO'
,p_column_label=>'Pending PO Base Qty'
,p_column_link=>'f?p=&APP_ID.:535:&SESSION.::&DEBUG.:535:P535_ITEMCODE,P535_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PENDINGPOQUANTITY1#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449880216495371397)
,p_db_column_name=>'PENDINGPOQUANTITY2'
,p_display_order=>280
,p_column_identifier=>'BP'
,p_column_label=>'Pending PO Secondary Qty'
,p_column_link=>'f?p=&APP_ID.:535:&SESSION.::&DEBUG.:535:P535_ITEMCODE,P535_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PENDINGPOQUANTITY2#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878851963371384)
,p_db_column_name=>'PENDINGPOVALUE'
,p_display_order=>150
,p_column_identifier=>'BC'
,p_column_label=>'Pending PO Value'
,p_column_link=>'f?p=&APP_ID.:535:&SESSION.::&DEBUG.:535:P535_ITEMCODE,P535_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PENDINGPOVALUE#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879951389371395)
,p_db_column_name=>'PENDINGSOCOUNT'
,p_display_order=>260
,p_column_identifier=>'BN'
,p_column_label=>'Pending SO Count'
,p_column_link=>'f?p=&APP_ID.:534:&SESSION.::&DEBUG.:534:P534_ITEMCODE,P534_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PENDINGSOCOUNT#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879740666371393)
,p_db_column_name=>'PENDINGSOQUANTITY1'
,p_display_order=>240
,p_column_identifier=>'BL'
,p_column_label=>'Pending SO Base Qty'
,p_column_link=>'f?p=&APP_ID.:534:&SESSION.::&DEBUG.:534:P534_ITEMCODE,P534_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PENDINGSOQUANTITY1#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879865633371394)
,p_db_column_name=>'PENDINGSOQUANTITY2'
,p_display_order=>250
,p_column_identifier=>'BM'
,p_column_label=>'Pending SO Secondary Qty'
,p_column_link=>'f?p=&APP_ID.:534:&SESSION.::&DEBUG.:534:P534_ITEMCODE,P534_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PENDINGSOQUANTITY2#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878707856371382)
,p_db_column_name=>'PENDINGSOVALUE'
,p_display_order=>130
,p_column_identifier=>'BA'
,p_column_label=>'Pending SO Value'
,p_column_link=>'f?p=&APP_ID.:534:&SESSION.::&DEBUG.:534:P534_ITEMCODE,P534_ITEMSPECIFICATIONCODE:#ITEMCODE#,#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PENDINGSOVALUE#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879019284371385)
,p_db_column_name=>'PIPELINESTOCK'
,p_display_order=>160
,p_column_identifier=>'BD'
,p_column_label=>'Pipeline Stock'
,p_column_link=>'f?p=&APP_ID.:537:&SESSION.::&DEBUG.:537:P537_ITEMSPECIFICATIONCODE:#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#PIPELINESTOCK#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450154425411920990)
,p_db_column_name=>'PRODUCTLINK'
,p_display_order=>300
,p_column_identifier=>'BR'
,p_column_label=>'Description'
,p_column_html_expression=>'<div style="display:block; width:355px">#PRODUCTLINK#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879134593371387)
,p_db_column_name=>'RANKINPURCHASE'
,p_display_order=>180
,p_column_identifier=>'BF'
,p_column_label=>'Rank in Purchase'
,p_column_html_expression=>'<div style="display:block; width:80px">#RANKINPURCHASE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449879063749371386)
,p_db_column_name=>'RANKINSALES'
,p_display_order=>170
,p_column_identifier=>'BE'
,p_column_label=>'Rank in Sales'
,p_column_html_expression=>'<div style="display:block; width:80px">#RANKINSALES#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878512405371380)
,p_db_column_name=>'STOCKQUANTITY1'
,p_display_order=>110
,p_column_identifier=>'AY'
,p_column_label=>'Stock Base Qty'
,p_column_link=>'f?p=&APP_ID.:536:&SESSION.::&DEBUG.:536:P536_ITEMSPECIFICATIONCODE:#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#STOCKQUANTITY1#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878616488371381)
,p_db_column_name=>'STOCKQUANTITY2'
,p_display_order=>120
,p_column_identifier=>'AZ'
,p_column_label=>'Stock Secondary Qty'
,p_column_link=>'f?p=&APP_ID.:536:&SESSION.::&DEBUG.:536:P536_ITEMSPECIFICATIONCODE:#ITEMSPECIFICATIONCODE#'
,p_column_linktext=>'#STOCKQUANTITY2#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878756493371383)
,p_db_column_name=>'STOCKVALUE'
,p_display_order=>140
,p_column_identifier=>'BB'
,p_column_label=>'Stock Value'
,p_column_html_expression=>'<div style="display:block; width:80px">#STOCKVALUE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449701799733833722)
,p_db_column_name=>'TNO'
,p_display_order=>30
,p_column_identifier=>'AQ'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878305627371378)
,p_db_column_name=>'UOM1'
,p_display_order=>90
,p_column_identifier=>'AW'
,p_column_label=>'Base UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449878394561371379)
,p_db_column_name=>'UOM2'
,p_display_order=>100
,p_column_identifier=>'AX'
,p_column_label=>'Secondary UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(461656604137190735)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'68171'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ITEMCODE:PRODUCTLINK:UOM1:UOM2:PENDINGSOQUANTITY1:PENDINGSOQUANTITY2:PENDINGSOCOUNT:PENDINGSOVALUE:STOCKQUANTITY1:STOCKQUANTITY2:PENDINGPOQUANTITY1:PENDINGPOQUANTITY2:PENDINGPOCOUNT:PENDINGPOVALUE:PIPELINESTOCK:STOCKVALUE:RANKINSALES:RANKINPURCHASE:L'
||'AST12MONTHSALES:LAST12MONTHPURCHASE:LAST12MONTHPRODUCTION:LAST12MONTHSALESRETURN:LAST12MONTHPURCHASERETURN'
,p_sort_column_1=>'ITEMDESCRIPTION'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'SUPPLIERNAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'CUSTOMERNAME'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(441402195297648928)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(461339157891949803)
,p_button_name=>'LASTRUN'
,p_static_id=>'lastrun'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'<p style="text-size:12px; color:#da1b1b;font-weight:bold">Last Run Date : &P516_RUNDATE.</p>'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449886664428341752)
,p_name=>'P516_RUNDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(461339157891949803)
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     TO_CHAR(LASTRUNDATE,''DD-MM-YYYY HH:MI AM'') LASTRUNDATE',
'FROM D_SUPPLIER_360VIEW'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441605734652242613)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441606071492242613)
,p_event_id=>wwv_flow_imp.id(441605734652242613)
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
wwv_flow_imp.component_end;
end;
/
