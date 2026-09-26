prompt --application/pages/page_00510
begin
--   Manifest
--     PAGE: 00510
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
 p_id=>510
,p_name=>'Customer'
,p_alias=>'CUSTOMER'
,p_step_title=>'Customer'
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
 p_id=>wwv_flow_imp.id(447975328220177255)
,p_plug_name=>'Customer 360 View Report'
,p_static_id=>'customer-360-view-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select DISTINCT a.COMPANYCODE,',
'       a.COMPANYNAME,',
'       a.LOCATIONCODE,',
'       a.LOCATIONNAME,',
'       a.CUSTOMERCODE,',
'       a.CUSTOMERNAME,',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':511:''||:APP_SESSION||''::''||'':511:P511_CUSTOMERCODE:''|| a.CUSTOMERCODE,NULL,''SESSION'' )||''">''||a.CUSTOMERNAME||''</a>'' as CustomerLink,    ',
'       a.YEAROFASSOCIATION,',
'       a.LASTORDERDATE,',
'       a.LASTBILLEDDATE,',
'       a.CREDITLIMIT,',
'       a.LEDGERBALANCE,',
'       a.OVERDUEAMOUNT,',
'       a.TOTALSALESAMOUNT,',
'       a.GROSSPROFITPERCENTAGE,',
'       a.RANKINGBYSALES,',
'       a.AVERAGEORDERVALUE,',
'       a.QUOTETOORDERPERCENT,',
'       a.PENDINGORDERS,',
'       a.INACTIVEINVOICE,',
'       a.REGIONCODE,',
'       a.REGIONNAME,',
'       a.CITYCODE,',
'       a.CITYNAME,',
'       a.STATECODE,',
'       a.STATENAME,',
'       a.COUNTRYCODE,',
'       a.COUNTRYNAME,',
'       a.LASTRUNDATE',
'  from D_CUSTOMER_360VIEW a'))
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
 p_id=>wwv_flow_imp.id(447978224278177284)
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
,p_show_filter=>'N'
,p_show_computation=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>8993355078479300
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271401314417550)
,p_db_column_name=>'AVERAGEORDERVALUE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Average Order Value'
,p_column_html_expression=>'<div style="display:block; width:110px">#AVERAGEORDERVALUE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271963192417556)
,p_db_column_name=>'CITYCODE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'City Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#CITYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448272045810417557)
,p_db_column_name=>'CITYNAME'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'City Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#CITYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(447978328002177285)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(447978505195177286)
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
 p_id=>wwv_flow_imp.id(448272377041417560)
,p_db_column_name=>'COUNTRYCODE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Country Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#COUNTRYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448272445756417561)
,p_db_column_name=>'COUNTRYNAME'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Country Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#COUNTRYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448270783249417544)
,p_db_column_name=>'CREDITLIMIT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Credit Limit'
,p_column_html_expression=>'<div style="display:block; width:80px">#CREDITLIMIT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448270286571417539)
,p_db_column_name=>'CUSTOMERCODE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Customer Code'
,p_column_link=>'f?p=&APP_ID.:512:&SESSION.::&DEBUG.:512:P512_PARTYCODE:#CUSTOMERCODE#'
,p_column_linktext=>'#CUSTOMERCODE#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448746397921222784)
,p_db_column_name=>'CUSTOMERLINK'
,p_display_order=>290
,p_column_identifier=>'AD'
,p_column_label=>'Customer Name'
,p_column_html_expression=>'<div style="display:block; width:400px">#CUSTOMERLINK#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448270383318417540)
,p_db_column_name=>'CUSTOMERNAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Customer Name'
,p_column_link=>'f?p=&APP_ID.:511:&SESSION.::&DEBUG.:511:P511_CUSTOMERCODE:#CUSTOMERCODE#'
,p_column_linktext=>'#CUSTOMERNAME#'
,p_column_type=>'STRING'
,p_static_id=>'X'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271193766417548)
,p_db_column_name=>'GROSSPROFITPERCENTAGE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Gross Profit Percentage'
,p_column_html_expression=>'<div style="display:block; width:130px">#GROSSPROFITPERCENTAGE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271608128417553)
,p_db_column_name=>'INACTIVEINVOICE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Inactive Invoice'
,p_column_link=>'f?p=&APP_ID.:527:&SESSION.::&DEBUG.:527:P527_CUSTOMERCODE:#CUSTOMERCODE#'
,p_column_linktext=>'#INACTIVEINVOICE#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448270671325417543)
,p_db_column_name=>'LASTBILLEDDATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Last Billed Date'
,p_column_html_expression=>'<div style="display:block; width:100px">#LASTBILLEDDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448270532399417542)
,p_db_column_name=>'LASTORDERDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Last Order Date'
,p_column_html_expression=>'<div style="display:block; width:100px">#LASTORDERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448272528058417562)
,p_db_column_name=>'LASTRUNDATE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Last Run Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#LASTRUNDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448270868165417545)
,p_db_column_name=>'LEDGERBALANCE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Ledger Balance'
,p_column_html_expression=>'<div style="display:block; width:80px">#LEDGERBALANCE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(447978602851177287)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Location Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(447978688121177288)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448270934635417546)
,p_db_column_name=>'OVERDUEAMOUNT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Overdue Amount'
,p_column_link=>'f?p=&APP_ID.:524:&SESSION.::&DEBUG.:524:P524_CUSTOMERCODE:#CUSTOMERCODE#'
,p_column_linktext=>'#OVERDUEAMOUNT#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271521897417552)
,p_db_column_name=>'PENDINGORDERS'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Pending Orders'
,p_column_link=>'f?p=&APP_ID.:522:&SESSION.::&DEBUG.:522:P522_CUSTOMERCODE:#CUSTOMERCODE#'
,p_column_linktext=>'#PENDINGORDERS#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271420293417551)
,p_db_column_name=>'QUOTETOORDERPERCENT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Quote to Order Percent'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271220018417549)
,p_db_column_name=>'RANKINGBYSALES'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Ranking by Sales'
,p_column_html_expression=>'<div style="display:block; width:100px">#RANKINGBYSALES#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271714990417554)
,p_db_column_name=>'REGIONCODE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Region Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#REGIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271828311417555)
,p_db_column_name=>'REGIONNAME'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Region Name'
,p_column_html_expression=>'<div style="display:block; width:80px">#REGIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448272116078417558)
,p_db_column_name=>'STATECODE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'State Code'
,p_column_html_expression=>'<div style="display:block; width:80px">#STATECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448272302798417559)
,p_db_column_name=>'STATENAME'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'State Name'
,p_column_html_expression=>'<div style="display: block; width:120px">#STATENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448271010066417547)
,p_db_column_name=>'TOTALSALESAMOUNT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Total Sales Amount'
,p_column_link=>'f?p=&APP_ID.:525:&SESSION.::&DEBUG.:525:P525_CUSTOMERCODE:#CUSTOMERCODE#'
,p_column_linktext=>'#TOTALSALESAMOUNT#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448270503358417541)
,p_db_column_name=>'YEAROFASSOCIATION'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Year of Association'
,p_column_html_expression=>'<div style="display:block; width:100px">#YEAROFASSOCIATION#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(448292774465418187)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'53840'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CUSTOMERCODE:CUSTOMERLINK:YEAROFASSOCIATION:LOCATIONNAME:LASTORDERDATE:LASTBILLEDDATE:CREDITLIMIT:LEDGERBALANCE:OVERDUEAMOUNT:TOTALSALESAMOUNT:GROSSPROFITPERCENTAGE:RANKINGBYSALES:AVERAGEORDERVALUE:PENDINGORDERS:INACTIVEINVOICE:REGIONNAME:CITYNAME:ST'
||'ATENAME:COUNTRYNAME'
,p_sort_column_1=>'CUSTOMERNAME'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(441252452143581794)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(447975328220177255)
,p_button_name=>'LASTRUN'
,p_static_id=>'lastrun'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'<p style="text-size:12px; color:#da1b1b;font-weight:bold">Last Run Date : &P510_RUNDATE.</p>'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449269598714892451)
,p_name=>'P510_RUNDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(447975328220177255)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     TO_CHAR(LASTRUNDATE,''DD-MM-YYYY HH:MI AM'') LASTRUNDATE',
'FROM D_CUSTOMER_360VIEW'))
,p_item_default_type=>'SQL_QUERY'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     TO_CHAR(LASTRUNDATE,''DD-MM-YYYY HH:MI AM'') LASTRUNDATE',
'FROM D_CUSTOMER_360VIEW'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(441601678738239153)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(441602084106239153)
,p_event_id=>wwv_flow_imp.id(441601678738239153)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(218030205669771883)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(218030299891771884)
,p_event_id=>wwv_flow_imp.id(218030205669771883)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P510_RUNDATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT',
    '     TO_CHAR(LASTRUNDATE,''DD-MM-YYYY HH:MI AM'') LASTRUNDATE',
    'FROM D_CUSTOMER_360VIEW')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
