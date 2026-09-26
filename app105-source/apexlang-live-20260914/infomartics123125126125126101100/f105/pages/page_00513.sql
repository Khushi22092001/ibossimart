prompt --application/pages/page_00513
begin
--   Manifest
--     PAGE: 00513
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
 p_id=>513
,p_name=>'Supplier'
,p_alias=>'SUPPLIER'
,p_step_title=>'Supplier'
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
 p_id=>wwv_flow_imp.id(446927780841869835)
,p_plug_name=>'Supplier 360 View Report'
,p_static_id=>'supplier-360-view-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select COMPANYCODE,',
'       COMPANYNAME,',
'       LOCATIONCODE,',
'       LOCATIONNAME,',
'       SUPPLIERCODE,',
'       SUPPLIERNAME,',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':515:''||:APP_SESSION||''::''||'':515:P515_SUPPLIERCODE:''|| SUPPLIERCODE,NULL,''SESSION'' )||''">''||SUPPLIERNAME||''</a>'' as SupplierLink,',
'       YEAROFASSOCIATION,',
'       CREDITLIMIT,',
'       OUTSTANDINGAMOUNT,',
'       OVERDUEAMOUNT,',
'       LEDGERBALANCE,',
'       TOTALRETURNVALUE,',
'       TOTALDISCOUNTVALUE,',
'       AVGDISCOUNTPERCENT,',
'       ACTIVEPOVALUE,',
'       PENDINGFORGRN,',
'       ORDERSCOMPLETED,',
'       ORDERSDELIVEREDONTIME,',
'       REGIONCODE,',
'       REGIONNAME,',
'       CITYCODE,',
'       CITYNAME,',
'       STATECODE,',
'       STATENAME,',
'       COUNTRYCODE,',
'       COUNTRYNAME,',
'       LOCALIMPORT,',
'       LASTRUNDATE',
'  from D_SUPPLIER_360VIEW '))
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
 p_id=>wwv_flow_imp.id(446930676899869864)
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
,p_download_formats=>'XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>15487297508874630
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441803661013247681)
,p_db_column_name=>'ACTIVEPOVALUE'
,p_display_order=>350
,p_column_identifier=>'AK'
,p_column_label=>'Active PO Value'
,p_column_link=>'f?p=&APP_ID.:530:&SESSION.::&DEBUG.:530:P530_SUPPLIERCODE:#SUPPLIERCODE#'
,p_column_linktext=>'#ACTIVEPOVALUE#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441803561697247680)
,p_db_column_name=>'AVGDISCOUNTPERCENT'
,p_display_order=>340
,p_column_identifier=>'AJ'
,p_column_label=>'Avg Discount Percent'
,p_column_html_expression=>'<div style="display:block; width:80px">#AVGDISCOUNTPERCENT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441870297792599132)
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
 p_id=>wwv_flow_imp.id(441870741843599133)
,p_db_column_name=>'CITYNAME'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'City Name'
,p_column_html_expression=>'<div style="display:block; width:120px">#CITYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441861929111599129)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441862260310599129)
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
 p_id=>wwv_flow_imp.id(441871901777599133)
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
 p_id=>wwv_flow_imp.id(441872281509599133)
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
 p_id=>wwv_flow_imp.id(441865504339599131)
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
 p_id=>wwv_flow_imp.id(441872724191599133)
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
 p_id=>wwv_flow_imp.id(441865939404599131)
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
 p_id=>wwv_flow_imp.id(441804101696247685)
,p_db_column_name=>'LOCALIMPORT'
,p_display_order=>390
,p_column_identifier=>'AO'
,p_column_label=>'Import/Local'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCALIMPORT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441862711508599129)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Location Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441863071016599130)
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
 p_id=>wwv_flow_imp.id(441803914643247683)
,p_db_column_name=>'ORDERSCOMPLETED'
,p_display_order=>370
,p_column_identifier=>'AM'
,p_column_label=>'Orders Completed'
,p_column_link=>'f?p=&APP_ID.:532:&SESSION.::&DEBUG.:532:P532_SUPPLIERCODE:#SUPPLIERCODE#'
,p_column_linktext=>'#ORDERSCOMPLETED#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441804040752247684)
,p_db_column_name=>'ORDERSDELIVEREDONTIME'
,p_display_order=>380
,p_column_identifier=>'AN'
,p_column_label=>'Orders Delivered on Time'
,p_column_link=>'f?p=&APP_ID.:533:&SESSION.::&DEBUG.:533:P533_SUPPLIERCODE:#SUPPLIERCODE#'
,p_column_linktext=>'#ORDERSDELIVEREDONTIME#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441803334157247677)
,p_db_column_name=>'OUTSTANDINGAMOUNT'
,p_display_order=>310
,p_column_identifier=>'AG'
,p_column_label=>'Outstanding Amount'
,p_column_link=>'f?p=&APP_ID.:529:&SESSION.::&DEBUG.:529:P529_SUPPLIERCODE:#SUPPLIERCODE#'
,p_column_linktext=>'#OUTSTANDINGAMOUNT#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441866297924599131)
,p_db_column_name=>'OVERDUEAMOUNT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Overdue Amount'
,p_column_link=>'f?p=&APP_ID.:528:&SESSION.::&DEBUG.:528:P528_SUPPLIERCODE:#SUPPLIERCODE#'
,p_column_linktext=>'#OVERDUEAMOUNT#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441803753936247682)
,p_db_column_name=>'PENDINGFORGRN'
,p_display_order=>360
,p_column_identifier=>'AL'
,p_column_label=>'Pending for GRN'
,p_column_link=>'f?p=&APP_ID.:531:&SESSION.::&DEBUG.:531:P531_SUPPLIERCODE:#SUPPLIERCODE#'
,p_column_linktext=>'#PENDINGFORGRN#'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441869512946599132)
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
 p_id=>wwv_flow_imp.id(441869916649599132)
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
 p_id=>wwv_flow_imp.id(441871079782599133)
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
 p_id=>wwv_flow_imp.id(441871457418599133)
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
 p_id=>wwv_flow_imp.id(441803083968247675)
,p_db_column_name=>'SUPPLIERCODE'
,p_display_order=>290
,p_column_identifier=>'AE'
,p_column_label=>'Supplier Code'
,p_column_link=>'f?p=&APP_ID.:514:&SESSION.::&DEBUG.:514:P514_SUPPLIERCODE:#SUPPLIERCODE#'
,p_column_linktext=>'#SUPPLIERCODE#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441805318607247697)
,p_db_column_name=>'SUPPLIERLINK'
,p_display_order=>400
,p_column_identifier=>'AP'
,p_column_label=>'Supplier Name'
,p_column_html_expression=>'<div style="display:block; width:355px">#SUPPLIERLINK#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441803189207247676)
,p_db_column_name=>'SUPPLIERNAME'
,p_display_order=>300
,p_column_identifier=>'AF'
,p_column_label=>'Supplier Name'
,p_column_html_expression=>'<div style="display:block; width:355px">#SUPPLIERNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441803521566247679)
,p_db_column_name=>'TOTALDISCOUNTVALUE'
,p_display_order=>330
,p_column_identifier=>'AI'
,p_column_label=>'Total Discount Value'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALDISCOUNTVALUE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441803435080247678)
,p_db_column_name=>'TOTALRETURNVALUE'
,p_display_order=>320
,p_column_identifier=>'AH'
,p_column_label=>'Total Return Value'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALRETURNVALUE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99,99,99,99,99,999.90'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441864249590599130)
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
 p_id=>wwv_flow_imp.id(447245227087110767)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'64215'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SUPPLIERCODE:SUPPLIERLINK:YEAROFASSOCIATION:CREDITLIMIT:OUTSTANDINGAMOUNT:OVERDUEAMOUNT:LEDGERBALANCE:TOTALRETURNVALUE:TOTALDISCOUNTVALUE:AVGDISCOUNTPERCENT:ACTIVEPOVALUE:PENDINGFORGRN:ORDERSCOMPLETED:ORDERSDELIVEREDONTIME:REGIONNAME:COUNTRYNAME:STAT'
||'ENAME:CITYNAME:LOCALIMPORT'
,p_sort_column_1=>'SUPPLIERNAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CUSTOMERNAME'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(433795512600937023)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(446927780841869835)
,p_button_name=>'LASTRUN'
,p_static_id=>'lastrun'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'<p style="text-size:12px; color:#da1b1b;font-weight:bold">Last Run Date : &P513_RUNDATE.</p>'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441884290406599149)
,p_name=>'P513_RUNDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(446927780841869835)
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
 p_id=>wwv_flow_imp.id(434062639110538554)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434063061322538555)
,p_event_id=>wwv_flow_imp.id(434062639110538554)
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
