prompt --application/pages/page_00118
begin
--   Manifest
--     PAGE: 00118
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
 p_id=>118
,p_name=>'Purchase Order'
,p_alias=>'PURCHASE-ORDER'
,p_step_title=>'Purchase Order'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function formatDate(date) {',
'  var monthNames = [',
'    "JAN", "FEB", "MAR",',
'    "APR", "MAY", "JUN", "JUL",',
'    "AUG", "SEP", "OCT",',
'    "NOV", "DEC"',
'  ];',
'',
'  var day = date.getDate();',
'  var monthIndex = date.getMonth();',
'  var year = date.getFullYear();',
'',
'  return day + ''-'' + monthNames[monthIndex] + ''-'' + year;',
'}',
'',
'function generatePDF() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P118_BIREPORTURL'').val()',
'  var reportName = ''PurchaseOrder.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P118_TNO'').val() ',
'      ;',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'$(document).ready(function(){',
'    // Intercept keydown event',
'    $(document).on(''keydown'', function(e){',
'        // Check if the pressed key is a navigation key (e.g., arrow keys)',
'        if(e.keyCode >= 37 && e.keyCode <= 40) {',
'            // Check if the focused element is readonly',
'            if($('':focus'').attr(''readonly'')) {',
'                // Prevent default key navigation',
'                e.preventDefault();',
'            }',
'        }',
'    });',
'});',
'',
'',
'/// Change Over All Sum Text of IG',
'',
'function agg() {',
'',
'    console.log(''agg'');',
'',
'    var g = apex.region(''Detail'').widget().interactiveGrid(''getViews'', ''grid'');  ',
'',
'    // change the aggregateLabels for SUM',
'',
'    var labels = g.view$.grid(''option'', ''aggregateLabels'');  ',
'',
'    labels.SUM.label = ''Subtotal'';  ',
'',
'    labels.SUM.overallLabel = ''Total'';  ',
'',
'    g.view$.grid(''option'', ''aggregateLabels'', labels);  ',
'',
'    // set the selector column width to 40px (box-sizing:border-box)  ',
'',
'    g.view$.grid(''option'', ''rowHeaderWidth'', 40);  ',
'',
'    // refresh the grid (doesn''t work on reload/F5 w/o refresh, despite the docs)',
'',
'    g.view$.grid(''refresh'');',
'',
'}',
'// update the labels on IG view changes',
'',
'$(''#Detail'').on(''interactivegridviewchange'', function(event , ui){',
'',
'    console.log(''%cinteractivegridviewchange'', ''color:orange''); ',
'',
'    agg();',
'',
'});',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P118_BIREPORTURL'').val()',
'  var reportName =  ''PurchaseOrder.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P118_TNO'').val() ',
'      ;',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'// function openFileInNewTab(pReferenceTNo) {',
'//     if (!pReferenceTNo) {',
'//         console.error("Reference TNo is missing!");',
'//         return;',
'//     }',
'    ',
'//     var url = ''f?p='' + $v(''pFlowId'') + '':0:'' + $v(''pInstance'') + '':APPLICATION_PROCESS=GET_BINARY_FILE:::x01:'' + pReferenceTNo;',
'    ',
'//     window.open(url, ''_blank'');',
'// }',
'',
'function openFileInNewTab(pReferenceTNo) {',
'    if (!pReferenceTNo) return;',
'',
'    // var url = "f?p=" + $v("pFlowId") + ":0:" + $v("pInstance") + ":APPLICATION_PROCESS=GET_BINARY_FILE:::x01:" + pReferenceTNo;',
'    ',
'    var finalUrl = "wwv_flow.show?p_flow_id=" + $v("pFlowId") + ',
'                   "&p_flow_step_id=0" + ',
'                   "&p_instance=" + $v("pInstance") + ',
'                   "&p_debug=" + $v("pdebug") +',
'                   "&p_request=APPLICATION_PROCESS%3DGET_BINARY_FILE" + ',
'                   "&x01=" + pReferenceTNo;',
'',
'    window.open(finalUrl, ''_blank'');',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#P118_REMARK'').on(''keydown'', function(e) {',
'    ',
'    if(e.shiftKey && e.which == 9) { ',
'        //shift was down when tab was pressed',
'        e.preventDefault(); ',
'        $(".apex-rds [href=''#General'']").trigger("click");',
'        apex.item(''P118_COMMISSIONRATE'').setFocus();',
'    }',
'   else if(e.which == 9) { ',
'      e.preventDefault(); ',
'     // $(".apex-rds [href=''#Detail'']").trigger("click");',
'     // apex.item(''P23_NEW'').setFocus();',
'     apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
'',
'     //   apex.region( "Detail" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
'   }',
'   ',
'});',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.btn1 {',
'    position: absolute;',
'    left: 190px;',
'  top: 140px;',
'}',
'',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1236356746089008121)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_region_name=>'Attach'
,p_parent_plug_id=>wwv_flow_imp.id(643520979526379452)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       --A.SNO,',
'       --DESCRIPTION,',
'       A.ATTRIBUTEVALUE,',
'       A.ATTACHMENTBLOB,',
'       A.FILENAME,',
'       A.ATTRIBUTECODE,',
'       A.MODULETNO,',
'       A.MODULESNO,',
'       b.PARTYATTRIBUTEname',
'  from MODULEATTACHMENT A, partyattribute b',
'  WHERE A.MODULETNO = :P118_TNO',
'  and a.ATTRIBUTECODE = b.PARTYATTRIBUTECODE'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P118_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Attachment'
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
 p_id=>wwv_flow_imp.id(1236357490664008129)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:63:P63_MODULESNO,P63_MODULETNO:#MODULESNO#,#MODULETNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>1135617446672328572
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1236358060150008134)
,p_db_column_name=>'ATTACHMENTBLOB'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Attachmentblob'
,p_column_type=>'OTHER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(955973471868878442)
,p_db_column_name=>'ATTRIBUTECODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Attributecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1083572346391822817)
,p_db_column_name=>'ATTRIBUTEVALUE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Attribute Value'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1236358131390008135)
,p_db_column_name=>'FILENAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(804104261139192934)
,p_db_column_name=>'MODULESNO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Modulesno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(802709985805061883)
,p_db_column_name=>'MODULETNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(558321482261172831)
,p_db_column_name=>'PARTYATTRIBUTENAME'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Attribute name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1236357649967008130)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1239003080061983583)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYATTRIBUTENAME:ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(792334967369383907)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1159718010530453248)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(659835166940673363)
,p_plug_name=>'Currency'
,p_static_id=>'currency'
,p_parent_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(643521010222379453)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(643520979526379452)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       INDENTTNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       DESCRIPTION,',
'       GetMeasuringUnitNameFromItem(ITEMCODE) as Unit1,',
'       QUANTITY1,',
'       GetMeasuringUnit2NameFromItem(ITEMCODE) as Unit2,',
'       QUANTITY2,',
'       TOLERANCE,',
'       RECEIVEDQUANTITY1,',
'       RECEIVEDQUANTITY2,',
'       RATEMEASURINGUNITCODE,',
'       RATE,',
'       AMOUNT,',
'       FOOTERAMOUNT,',
'       TOTALAMOUNT,',
'       REMARK,',
'       DOCUMENTSTATUSCODE,',
'       MATERIALINQUANTITY1,',
'       MATERIALINQUANTITY2,',
'       LOWERTOLERANCEPERCENT,',
'       HIGHERTOLERANCEPERCENT,',
'       PURCHASEBILLQUANTITY1,',
'       PURCHASEBILLQUANTITY2,',
'       GATEPASSQUANTITY1,',
'       GATEPASSQUANTITY2,',
'       ACCEPTEDQUANTITY1,',
'       ACCEPTEDQUANTITY2,',
'       INSPECTEDQUANTITY1,',
'       INSPECTEDQUANTITY2,',
'       JOININSPECTEDQUANTITY1,',
'       JOININSPECTEDQUANTITY2,',
'       JOINACCEPTEDQUANTITY1,',
'       JOINACCEPTEDQUANTITY2,',
'       CHALANQUANTITY1,',
'       CHALANQUANTITY2,',
'       PBPASSQUANTITY1,',
'       PBPASSQUANTITY2,',
'       SHORTAGETOLERANCE,',
'       SHORTAGEDEDUCTIONFROM,',
'       SHORTAGETOLERANCEMETHOD,',
'       TAXRULECODE,',
'       DEDUCTIONBASISCODE,',
'       DEDUCTIONRATE,',
'       --PRORATA,',
'       --QUALITYCODE,',
'       WITHOUTDISCOUNTRATE,',
'       DISCOUNTPERCENTAGE,',
'       DISCOUNTRATE,',
'       RATEAFTERDISCOUNT,',
'       ISRATEINCLUSIVETAX,',
'       FREIGHTDEDUCTIONRATE,',
'       ''Q'' as Q,',
'       ''FD'' as FD',
'  from PURCHASEORDERDETAIL',
'  where tno = :P118_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P118_TNO'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(651472610412874742)
,p_heading=>'Discount'
,p_static_id=>'discount'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(651472314081874739)
,p_heading=>'Item Specification'
,p_static_id=>'item-specification'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(651472434996874740)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(651472582708874741)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(651472839790874744)
,p_heading=>'Shortage'
,p_static_id=>'shortage'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(651472739695874743)
,p_heading=>'Tolerance %'
,p_static_id=>'tolerance'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455384292586532)
,p_name=>'ACCEPTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCEPTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Accepted Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>380
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455457212586533)
,p_name=>'ACCEPTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCEPTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Accepted Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>390
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(500934694757915467)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>220
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'AMOUNT'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646457960238586558)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646458016094586559)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456162377586540)
,p_name=>'CHALANQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Chalan Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>460
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456196734586541)
,p_name=>'CHALANQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Chalan Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>470
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456949692586548)
,p_name=>'DEDUCTIONBASISCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEDUCTIONBASISCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Deduction Basis'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>540
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646457070845586549)
,p_name=>'DEDUCTIONRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEDUCTIONRATE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Deduction Rate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>550
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643521870075379461)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(651472314081874739)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646457480209586553)
,p_name=>'DISCOUNTPERCENTAGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISCOUNTPERCENTAGE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'%'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472610412874742)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'DISCOUNTPERCENTAGE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646457561746586554)
,p_name=>'DISCOUNTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DISCOUNTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472610412874742)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'DISCOUNTRATE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643522991784379473)
,p_name=>'DOCUMENTSTATUSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCUMENTSTATUSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Document Status'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646584027652787229)
,p_name=>'FD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'FD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''FooterDetail'')'
,p_link_text=>'&FD.'
,p_link_attributes=>'class="t-Button t-Button--simple t-Button--hot t-Button--stretch"'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="javascript:openModal(''FooterDetail'')">',
' <span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">FD</span></a>'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(500934827465915468)
,p_name=>'FOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>260
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'FOOTERAMOUNT'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646457881947586557)
,p_name=>'FREIGHTDEDUCTIONRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FREIGHTDEDUCTIONRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Freight <br> Deduction Rate</br>'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>570
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455092615586530)
,p_name=>'GATEPASSQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GATEPASSQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Gate Pass Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>360
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455213925586531)
,p_name=>'GATEPASSQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GATEPASSQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Gate Pass Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>370
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646454830427586527)
,p_name=>'HIGHERTOLERANCEPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'HIGHERTOLERANCEPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Higher %'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>330
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472739695874743)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643521558522379458)
,p_name=>'INDENTTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INDENTTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Indent No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(651472314081874739)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select indentno , tno from indent'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455501432586534)
,p_name=>'INSPECTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSPECTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Inspected Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>400
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455643033586535)
,p_name=>'INSPECTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INSPECTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Inspected Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>410
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646457765406586556)
,p_name=>'ISRATEINCLUSIVETAX'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISRATEINCLUSIVETAX'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Is Rate <br>Inclusive Tax</br>'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>560
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643521668507379459)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(651472314081874739)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'B.ITEMNAME D, B.ITEMCODE R',
'FROM PURCHASEORDERDETAIL  A, ITEM B',
'WHERE A.ITEMCODE = B.ITEMCODE',
'AND A.TNO = :P118_TNO',
'union all',
'SELECT ',
'A.ITEMNAME D, A.ITEMCODE R ',
'from item a',
'where itemnaturecode = ''SERVICES''',
'union all',
'SELECT ',
'A.ITEMNAME D, A.ITEMCODE R ',
'from item a',
'where NVL(:P118_ISOPENSPEC,''NO'')=''YES''',
'',
';',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P118_INDENTTNO,P118_TNO,P118_ISOPENSPEC'
,p_ajax_optimize_refresh=>false
,p_static_id=>'ITEMCODE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643521733622379460)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(651472314081874739)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ITEMSPECIFICATIONNAME , ITEMSPECIFICATIONCODE',
'from itemspecification',
'where tno in (select tno from item where itemcode = :ITEMCODE )'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455958706586538)
,p_name=>'JOINACCEPTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOINACCEPTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Join Accepted Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>440
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456060434586539)
,p_name=>'JOINACCEPTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOINACCEPTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Join Accepted Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>450
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455784267586536)
,p_name=>'JOININSPECTEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOININSPECTEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Join Inspected Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>420
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455842495586537)
,p_name=>'JOININSPECTEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOININSPECTEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Join Inspected Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>430
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646454714856586526)
,p_name=>'LOWERTOLERANCEPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOWERTOLERANCEPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Lower %'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>320
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472739695874743)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643523089179379474)
,p_name=>'MATERIALINQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MATERIALINQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Material In Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>300
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643523210310379475)
,p_name=>'MATERIALINQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MATERIALINQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Material In Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>310
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456314443586542)
,p_name=>'PBPASSQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PBPASSQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'PB Pass Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>480
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456445397586543)
,p_name=>'PBPASSQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PBPASSQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'PB Pass Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>490
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646454977827586528)
,p_name=>'PURCHASEBILLQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEBILLQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Purchase Bill Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>340
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646455050815586529)
,p_name=>'PURCHASEBILLQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEBILLQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Purchase Bill Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>350
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646583952184787228)
,p_name=>'Q'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'Q'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Q'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>580
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643521950864379462)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472434996874740)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'QUANTITY1'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643522062322379463)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472582708874741)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(500934652277915466)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'RATE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646457614823586555)
,p_name=>'RATEAFTERDISCOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEAFTERDISCOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Discounted <br>Rate</br>'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472610412874742)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'RATEAFTERDISCOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643522416044379467)
,p_name=>'RATEMEASURINGUNITCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEMEASURINGUNITCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Rate UOM'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
' Select MEASURINGUNITNAME, MEASURINGUNITCODE',
'  From Item A, MEASURINGUNIT B',
' Where a.measuringunitcode1 = b.measuringunitcode',
'   And A.itemcode = :ITEMCODE',
'Union All',
'Select MEASURINGUNITNAME, MEASURINGUNITCODE',
'  From Item A, MEASURINGUNIT B',
' Where a.measuringunitcode2 = b.measuringunitcode',
'   And A.itemcode = :ITEMCODE',
'  ;'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643522234683379465)
,p_name=>'RECEIVEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Received Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643522380178379466)
,p_name=>'RECEIVEDQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Received Quantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643522952961379472)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'REMARK'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643521259448379455)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456650727586545)
,p_name=>'SHORTAGEDEDUCTIONFROM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHORTAGEDEDUCTIONFROM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Deduction From'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>510
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(651472839790874744)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>15
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Supplier;SUPPLIER,Transporter;TRANSPORTER'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456539710586544)
,p_name=>'SHORTAGETOLERANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHORTAGETOLERANCE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Shortage Tolerance'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>500
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472839790874744)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456726753586546)
,p_name=>'SHORTAGETOLERANCEMETHOD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHORTAGETOLERANCEMETHOD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Tolerance Method'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>520
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(651472839790874744)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>10
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Percent;PERCENT,Fix;FIX,None;NONE'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643521387704379457)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>620
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'SNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646456848375586547)
,p_name=>'TAXRULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXRULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tax Rule'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>530
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643521354613379456)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>610
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P118_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(643522180322379464)
,p_name=>'TOLERANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOLERANCE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tolerance'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(651472839790874744)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(500934945411915469)
,p_name=>'TOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>270
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TOTALAMOUNT'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(663277345221904144)
,p_name=>'UNIT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>590
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(651472434996874740)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(663277453417904145)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>600
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(651472582708874741)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646457370455586552)
,p_name=>'WITHOUTDISCOUNTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WITHOUTDISCOUNTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Without <br> Discount Rate </br>'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'WITHOUTDISCOUNTRATE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(643521163887379454)
,p_internal_uid=>542781119895699897
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU:RESET'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>350
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    //Tab and Shift-Tab will skip over cells that are read-only',
'    options.defaultGridViewOptions = {  ',
'        skipReadonlyCells: true  ',
'        ',
'    }',
'    return options;',
'}',
'',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(646460300654589523)
,p_interactive_grid_id=>wwv_flow_imp.id(643521163887379454)
,p_static_id=>'1490027'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(646460546459589527)
,p_report_id=>wwv_flow_imp.id(646460300654589523)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(500993557399346483)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(500934652277915466)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(500994331865346485)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(500934694757915467)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(500995252117346487)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(500934827465915468)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(500996171536346491)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(500934945411915469)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646461031077589534)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(643521259448379455)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646461945037589539)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(643521354613379456)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646462826513589542)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(643521387704379457)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646463757553589544)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(643521558522379458)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646464601119589546)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(643521668507379459)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>188
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646465520805589548)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(643521733622379460)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>343
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646466404377589550)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(643521870075379461)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646467305074589552)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(643521950864379462)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646468203315589554)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(643522062322379463)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646469175950589556)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(643522180322379464)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646469909700589560)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(643522234683379465)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646470802191589562)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(643522380178379466)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646471716899589564)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(643522416044379467)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646476240683589578)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(643522952961379472)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646477104401589580)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(643522991784379473)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646477995929589582)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(643523089179379474)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646478967826589584)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(643523210310379475)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646479796686589590)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(646454714856586526)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646480772809589593)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(646454830427586527)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646481597470589595)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(646454977827586528)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646482523880589598)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(646455050815586529)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646483453284589600)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(646455092615586530)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646484306281589602)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(646455213925586531)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646485246795589604)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(646455384292586532)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646486142295589606)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(646455457212586533)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646487025289589608)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(646455501432586534)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646487952561589610)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(646455643033586535)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646488847992589612)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(646455784267586536)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>165
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646489759964589614)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(646455842495586537)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>173
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646490661386589616)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(646455958706586538)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646491508264589619)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(646456060434586539)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>156
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646492456069589622)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(646456162377586540)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646493343909589624)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(646456196734586541)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646494206320589626)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(646456314443586542)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646495103453589628)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(646456445397586543)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646496067977589630)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(646456539710586544)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646496955799589632)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(646456650727586545)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646497811703589635)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(646456726753586546)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646498741744589637)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(646456848375586547)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646499597651589639)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(646456949692586548)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646500521564589641)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(646457070845586549)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646503253502589647)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(646457370455586552)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646504150738589649)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(646457480209586553)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646505049469589651)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(646457561746586554)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646505916029589653)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(646457614823586555)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646506808498589655)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(646457765406586556)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646507703584589657)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(646457881947586557)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646511997771593274)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(646457960238586558)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646608652623190837)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(646583952184787228)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646609554134190840)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(646584027652787229)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(663973127705419403)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(663277345221904144)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(663974023533419407)
,p_view_id=>wwv_flow_imp.id(646460546459589527)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(663277453417904145)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(650733334331695359)
,p_plug_name=>'E-Mail'
,p_static_id=>'e-mail'
,p_region_name=>'Email'
,p_parent_plug_id=>wwv_flow_imp.id(643520979526379452)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       MODULETNO,',
'       MODULESNO,',
'       MODULESN,',
'       MODULECODE,',
'      -- MODULETABLENAME,',
'      -- MODULESERIALNO,',
'       ATTRIBUTECODE,',
'       ATTRIBUTEVALUE,',
'      -- DESCRIPTION,',
'      -- ATTACHMENTBLOB,',
'      decode( nvl(FileName, ''NULL''), ''NULL'', ''NO'', ''YES'') as FILENAME,',
'      -- MIMETYPE,',
'       REMARK',
'  from MODULEATTACHMENT ',
'  where tno = :P118_TNO'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P118_TNO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(646584114830787230)
,p_plug_name=>'FooterDetail'
,p_static_id=>'footerdetail'
,p_region_name=>'FooterDetail'
,p_region_css_classes=>'js-dialog-size900x500'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       FOOTERHEADCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE,',
'       SERIALNO,',
'       TAXFORMCODE,',
'       LEGENDSCODE',
'  from PURCHASEORDERDETAILFOOTER',
'-- where tno = :P118_TNO',
' --and sno = :P118_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(643521010222379453)
,p_ajax_items_to_submit=>'P118_TNO,P118_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'FooterDetail'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646585215684787241)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646585352223787242)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646584562607787234)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Footer Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'X.FOOTERHEADNAME,',
'X.FOOTERHEADCODE',
'From ',
'(',
'Select',
'Case When a.footerheadcode = ''.IGST.'' Then',
'	     ''INTERSTATE''',
'			When a.footerheadcode In ( ''.CGST.'',''.SGST.'')Then',
'				''INTRASTATE''',
'      Else ''BOTH''',
'End TransactionTYPE,',
'a.FOOTERHEADNAME,',
'a.FOOTERHEADCODE',
'FROM FOOTERHEAD a',
') X',
'WHERE (X.TransactionTYPE = ''BOTH'' Or X.TransactionTYPE = :P118_TRANSACTIONTYPECODE)',
'  And NOT EXISTS ( SELECT 1 FROM PURCHASEORDERDETAILFOOTER AA WHERE AA.FOOTERHEADCODE = X.FOOTERHEADCODE AND AA.TNO = :P118_TNO and aa.sno = :P118_SNO AND :P118_FORMSTATUS = ''NEWRECORD'')',
'',
'/*SELECT',
'a.FOOTERHEADNAME,',
'a.FOOTERHEADCODE',
'FROM FOOTERHEAD a',
'WHERE NOT EXISTS ( SELECT 1 FROM PURCHASEORDERDETAILFOOTER AA WHERE AA.FOOTERHEADCODE = A.FOOTERHEADCODE AND AA.TNO = :P155_TNO)',
'*/',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P118_TNO,P118_TRANSACTIONTYPECODE,P118_FORMSTATUS,P118_SNO'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646584630913787235)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Percent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646584691621787236)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'FOOTERVALUE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646585044617787239)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Legends Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'LEGENDSCODE d,',
'LEGENDSCODE r',
'FROM LEGENDS'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'LEGENDSCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646585150365787240)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646584811865787237)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646584396072787233)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(643521387704379457)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646584927212787238)
,p_name=>'TAXFORMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXFORMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tax Form Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646584373682787232)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(643521354613379456)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(646584242430787231)
,p_internal_uid=>545844198439107674
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>false
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(646611460249212363)
,p_interactive_grid_id=>wwv_flow_imp.id(646584242430787231)
,p_static_id=>'1491538'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(646611617859212363)
,p_report_id=>wwv_flow_imp.id(646611460249212363)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646612178462212364)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(646584373682787232)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646613024528212366)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(646584396072787233)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646613934142212368)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(646584562607787234)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143.75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646614793540212370)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(646584630913787235)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129.75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646615733839212372)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(646584691621787236)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646616637741212374)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(646584811865787237)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646617559221212376)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(646584927212787238)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646618403311212380)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(646585044617787239)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111.75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646619315331212384)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(646585150365787240)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646621507867218267)
,p_view_id=>wwv_flow_imp.id(646611617859212363)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(646585215684787241)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(646225442166544647)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(643520979526379452)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       DEPARTMENTCODE,',
'       EMPLOYEECODE,',
'       PURCHASEORDERNO,',
'       PURCHASEORDERDATE,',
'       DELIVERYDATE,',
'       CURRENCYUNITCODE,',
'       CURRENCYVALUE,',
'       WORKORDERTNO,',
'       PARTYCODE,',
'       QUOTATIONTNO,',
'       RATECONTRACTTNO,',
'       DELIVERYORDERTNO,',
'       INDENTTNO,',
'       PURCHASEORDERAMOUNT,',
'       SUBJECTTEXT,',
'       REFERENCETEXT,',
'       LETTERTEXT,',
'       TITLETEXT,',
'       REMARK,',
'       ITEMWISEFOOTER,',
'       SUMOFAMOUNT,',
'       SUMOFFOOTERAMOUNT,',
'       AGENTCODE,',
'       CREDITDAYS,',
'       STORAGELOCATIONCODE,',
'       STOCKDATE,',
'       COMMISSIONRATE,',
'       CREATOR,',
'       FREIGHTTYPECODE,',
'       FREIGHTCONTRACTTNO,',
'       FREIGHTRATE,',
'       ISEVENTRANSACTION,',
'       COMPARATIVESTATEMENTTNO,',
'       XPLANT,',
'       EXPARTYPLANT,',
'       LIFTINGFROMCITYCODE,',
'       UNLOADINGCITYCODE,',
'       TRANCTIONTYPECODE,',
'       TRANSACTIONTYPECODE,',
'       PAYMENTBYLC,',
'       NATUREOFSUPPLYCODE,',
'       PREDI,',
'       DELIVERYSCHEDULEWITHPO,',
'       ITEMWISESCHEDULE,',
'       REFERENCEPURCHASEORDERTNO,',
'       CREATIONTIME,',
'       PAIDAMOUNT,',
'       ROYALTYPERCENTAGE,',
'       ROYALTYPENALTYPERUNIT,',
'       ISFULLADVANCE,',
'       POADVANCEAMOUNT,',
'       PAYMENTADVICELOCATIONCODE,',
'       MARINEINSURANCETNO,',
'       MARINEINSURANCEAMOUNT,',
'       SAUDAPATRAKNO,',
'       SAUDAPATRAKDATE,',
'       lendingongross,',
'       shipto,',
'       customercode,',
'       pendingsotno,',
'       isopenspec,',
'       quantity',
'  from PURCHASEORDER'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(659835069408673362)
,p_plug_name=>'General'
,p_static_id=>'general-2'
,p_parent_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(659835459572673366)
,p_plug_name=>'GST In Nature And Transaction'
,p_static_id=>'gst-in-nature-and-transaction'
,p_parent_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(643520979526379452)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple:t-Form--slimPadding:margin-top-none'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(554750420819529735)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_parent_plug_id=>wwv_flow_imp.id(646584114830787230)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(659835563974673367)
,p_plug_name=>'Other Informations'
,p_static_id=>'other-informations'
,p_region_name=>'OTHER'
,p_parent_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(650730585285695331)
,p_plug_name=>'Payment'
,p_static_id=>'payment'
,p_region_name=>'Payment'
,p_parent_plug_id=>wwv_flow_imp.id(643520979526379452)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(502986137783273496)
,p_plug_name=>'PO Amendment Detail'
,p_static_id=>'po-amendment-detail'
,p_region_name=>'POAMENDMENTDETAIL'
,p_parent_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(659835260810673364)
,p_plug_name=>'Select Indent'
,p_static_id=>'select-indent'
,p_parent_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45592769740848168)
,p_plug_name=>'Send Email'
,p_static_id=>'send-email'
,p_parent_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>180
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(268449113764998811)
,p_plug_name=>'Ship To'
,p_static_id=>'ship-to'
,p_parent_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_column=>9
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(650730603829695332)
,p_plug_name=>'Special Note'
,p_static_id=>'special-note'
,p_region_name=>'NOTE'
,p_parent_plug_id=>wwv_flow_imp.id(643520979526379452)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       FOOTERNOTE',
'  from PURCHASEORDERFN',
'  where tno = :P118_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P118_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Special Note'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(650731270413695338)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(650731361771695339)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(650731049546695336)
,p_name=>'FOOTERNOTE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERNOTE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Note'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'FOOTERNOTE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(650731089507695337)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(650730894566695335)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(650730862598695334)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P118_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(650730743689695333)
,p_internal_uid=>549990699698015776
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(651411331807404141)
,p_interactive_grid_id=>wwv_flow_imp.id(650730743689695333)
,p_static_id=>'1539537'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(651411505284404146)
,p_report_id=>wwv_flow_imp.id(651411331807404141)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(651412016940404149)
,p_view_id=>wwv_flow_imp.id(651411505284404146)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(650730862598695334)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(651412909513404152)
,p_view_id=>wwv_flow_imp.id(651411505284404146)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(650730894566695335)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(651413794439404155)
,p_view_id=>wwv_flow_imp.id(651411505284404146)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(650731049546695336)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(651414691270404157)
,p_view_id=>wwv_flow_imp.id(651411505284404146)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(650731089507695337)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(651415546620404159)
,p_view_id=>wwv_flow_imp.id(651411505284404146)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(650731270413695338)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(561980300358647392)
,p_plug_name=>'Summary'
,p_static_id=>'summary'
,p_parent_plug_id=>wwv_flow_imp.id(643521010222379453)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--accent1:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_column=>8
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(646458929220586568)
,p_plug_name=>'Terms and Conditions'
,p_static_id=>'terms-and-conditions'
,p_region_name=>'TAC'
,p_parent_plug_id=>wwv_flow_imp.id(643520979526379452)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       TERMSANDCONDITIONHEADCODE,',
'       TERMSANDCONDITION',
'  from PURCHASEORDERTAC',
'  where tno = :P118_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P118_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Terms and Conditions'
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
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646459626942586575)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646583706015787226)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646459507483586574)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646459190544586571)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646459441955586573)
,p_name=>'TERMSANDCONDITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'Y',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.termsandcondition a , a.termsandcondition b from TERMSANDCONDITIONHEADDETAIL a , TERMSANDCONDITIONHEAD b',
'where a.tno = b.tno',
'and b.tno = :TERMSANDCONDITIONHEADCODE'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_items_to_submit=>'TERMSANDCONDITIONHEADCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646459334664586572)
,p_name=>'TERMSANDCONDITIONHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITIONHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'select TERMSANDCONDITIONHEADNAME , tno from TERMSANDCONDITIONHEAD'
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'TERMSANDCONDITIONHEADCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(646459088859586570)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P118_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(646459037048586569)
,p_internal_uid=>545718993056907012
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>false
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>400
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(646578341335770925)
,p_interactive_grid_id=>wwv_flow_imp.id(646459037048586569)
,p_static_id=>'1491207'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(646578523665770925)
,p_report_id=>wwv_flow_imp.id(646578341335770925)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646578998716770927)
,p_view_id=>wwv_flow_imp.id(646578523665770925)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(646459088859586570)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646579930510770929)
,p_view_id=>wwv_flow_imp.id(646578523665770925)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(646459190544586571)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646580816613770933)
,p_view_id=>wwv_flow_imp.id(646578523665770925)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(646459334664586572)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>287
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646581699821770935)
,p_view_id=>wwv_flow_imp.id(646578523665770925)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(646459441955586573)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646582686549770937)
,p_view_id=>wwv_flow_imp.id(646578523665770925)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(646459507483586574)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(646589699883787476)
,p_view_id=>wwv_flow_imp.id(646578523665770925)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(646459626942586575)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(659834929418673361)
,p_plug_name=>'Texts'
,p_static_id=>'texts'
,p_parent_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(45592658021848167)
,p_plug_name=>'Upload File'
,p_static_id=>'upload-file'
,p_parent_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>170
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'PLUGIN_DE.DANIELH.DROPZONE2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'COLLECTION',
  'attribute_02', 'DROPZONE_UPLOAD',
  'attribute_07', 'STYLE4',
  'attribute_08', '100%',
  'attribute_09', '10px',
  'attribute_10', '5',
  'attribute_11', '1',
  'attribute_13', '.pdf',
  'attribute_15', 'NORMAL',
  'attribute_16', 'true',
  'attribute_17', 'true',
  'attribute_18', 'true',
  'attribute_19', 'true',
  'attribute_20', 'false',
  'attribute_22', 'false')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(650731749442695343)
,p_plug_name=>'Vendor Acceptance'
,p_static_id=>'vendor-acceptance'
,p_region_name=>'Vendor'
,p_parent_plug_id=>wwv_flow_imp.id(643520979526379452)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'       TNO,',
'       MODULECODE,',
'       MODULETNO,',
'       MODULESNO,',
'       ACCEPTANCEDATE,',
'       DELIVERYDATE,',
'       PERSONACCOUNTABLE,',
'       DESIGNATION,',
'       MOBILENO,',
'       ACCEPTANCE,',
'      -- ISUPDATED,',
'       EXPIRYTIME',
'  from MA_ACCEPTANCE',
'  where moduletno = :P118_TNO',
''))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P118_TNO'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(52668293295987216)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_button_name=>'ADD_PARTY_EMAIL'
,p_static_id=>'add-party-email'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--simple'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Add Party Email'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-plus-square-o'
,p_grid_column_attributes=>'style="Margin-top:3px;"'
,p_grid_new_row=>'N'
,p_grid_column=>5
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161811062480236666)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record?'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tModuleFlow number;',
'  tmp         number;',
'  tmp1        number;',
'BEGIN',
'   select count(*) into tmp1 from ModuleFlow a where a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID);',
'   if nvl(tmp1,0) > 0 then',
'        select ',
'            count(*) into tModuleFlow',
'        from ModuleFlow a, ModuleFlowUser b, Bossuser c',
'        where a.tno = b.tno',
'          and b.bossusercode = c.bossusercode',
'          and a.Modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
'          and c.bossusername = :APP_USER',
'          ;',
'',
'          if nvl(tModuleFlow,0) > 0 then',
'             return(TRUE) ;',
'          else',
'             return(FALSE);',
'          end if;',
'     else',
'            Select',
'            	COUNT(*) into tmp ',
'            From Module a, ModulePrivilege b, BossUser c',
'            Where a.ModuleCode = b.ModuleCode',
'            	and b.BossUsercode = c.BossUserCode',
'            	and c.LoginName = :GLOBAL_LOGINNAME',
'                and a.ModuleCode= getmodulecodeforpageno(:APP_PAGE_ID)',
'            	and b.CompanyCode = :GLOBAL_COMPANYCODE',
'            	and b.InsertPrivilege = ''YES'' ;',
'            if nvl(tmp,0) > 0 then',
'               return(TRUE);',
'            else',
'               return(FALSE);',
'            end if;',
'      end if;',
'              ',
'END;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161802064870236660)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1236356746089008121)
,p_button_name=>'ADDNEW_1'
,p_static_id=>'addnew-2'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:63:P63_MODULETNO:&P118_TNO.'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161807963397236664)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(646584114830787230)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_static_id=>'back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161813501162236667)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161814680457236667)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P118_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161813894054236667)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P118_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161791084118236652)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_button_name=>'DnLoad'
,p_static_id=>'dnload'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'DnLoad'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:63:P63_MODULETNO,P63_MODULESNO:&P118_TNO.,&P118_MODULESNO_1.'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161811925249236667)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P118_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161812306249236667)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P118_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(45594526849848186)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_button_name=>'GET_BINARY_FILE_BTN'
,p_static_id=>'get-binary-file-btn'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Open File'
,p_button_redirect_url=>'javascript:openFileInNewTab($v(''P118_FILE_TNO''));'
,p_button_condition_type=>'NEVER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161774402848236641)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(646458929220586568)
,p_button_name=>'GetDefault'
,p_static_id=>'getdefault'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Default'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161723644658236605)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(643521010222379453)
,p_button_name=>'GetItem'
,p_static_id=>'getitem'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161811459720236667)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P118_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161791452029236652)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_button_name=>'Preview'
,p_static_id=>'preview'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Preview'
,p_button_position=>'CLOSE'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161813140004236667)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P118_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161814307803236667)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P118_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161791892123236652)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_button_name=>'SendE-MailToParty'
,p_static_id=>'sende-mailtoparty'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight:t-Button--hoverIconPush'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Send E-mail To Party'
,p_icon_css_classes=>'fa-envelope-arrow-up'
,p_grid_new_row=>'Y'
,p_grid_column=>3
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161812658926236667)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(792334967369383907)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P118_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P118_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(161790701388236652)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_button_name=>'Upload'
,p_static_id=>'upload'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'UpLoad'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:63:P63_MODULETNO:&P118_TNO.'
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(161903600740236710)
,p_branch_name=>'Go To Page 117'
,p_branch_action=>'f?p=&APP_ID.:117:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(161813894054236667)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818923872695418)
,p_name=>'P118_ACCEPTANCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_prompt=>'Accepted'
,p_source=>'ACCEPTANCE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>3
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818370451695413)
,p_name=>'P118_ACCEPTANCEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_prompt=>'Acceptance Date'
,p_source=>'ACCEPTANCEDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646306735027544709)
,p_name=>'P118_AGENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(659835563974673367)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Agent'
,p_source=>'AGENTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.PartyName as AgentName,',
'a.PartyCode as AgentCode',
'from Party a',
'where a.PartyTypeCode = ''AGENT''',
'and GetDocumentStatusCode(''PARTY'', A.TNO) = ''ACTIVE''',
'order by 1'))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(510002072274977771)
,p_name=>'P118_ALLOWEDBACK'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(510002453350988094)
,p_name=>'P118_ALLOWEDFORWARD'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650829681464695437)
,p_name=>'P118_ATTRIBUTECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_source_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_source=>'ATTRIBUTECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650829816735695438)
,p_name=>'P118_ATTRIBUTEVALUE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_source_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_source=>'ATTRIBUTEVALUE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(270467347073402495)
,p_name=>'P118_BALANCEQTY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(643521010222379453)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1246229087650695310)
,p_name=>'P118_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1187610742434426918)
,p_name=>'P118_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_item_default=>'117'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(504244660100517974)
,p_name=>'P118_CALLEDFROMTNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646308372920544709)
,p_name=>'P118_COMMISSIONRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(659835563974673367)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Commission Rate'
,p_source=>'COMMISSIONRATE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646258151015544677)
,p_name=>'P118_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646305687344544706)
,p_name=>'P118_COMPARATIVESTATEMENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(659835260810673364)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'CS No'
,p_source=>'COMPARATIVESTATEMENTTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P118_COMPARATIVESTATEMENTTNO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_lov_cascade_parent_items=>'P118_PARTYCODE'
,p_ajax_items_to_submit=>'P118_PARTYCODE,P118_TNO,P118_LOCATIONCODE,P118_RATECONTRACTTNO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646277734597544686)
,p_name=>'P118_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select to_char(sysdate,''DD-MM-YYYY HH24:MI:SS'') from dual',
''))
,p_item_default_type=>'SQL_QUERY'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646270488666544683)
,p_name=>'P118_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646307125402544709)
,p_name=>'P118_CREDITDAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(659835563974673367)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Credit Days'
,p_source=>'CREDITDAYS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646293366571544700)
,p_name=>'P118_CURRENCYUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(659835166940673363)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'1'
,p_prompt=>'Currency Unit'
,p_source=>'CURRENCYUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select CURRENCYUNITNAME , CURRENCYUNITCODE from currencyunit'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646293682342544700)
,p_name=>'P118_CURRENCYVALUE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(659835166940673363)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Value'
,p_source=>'CURRENCYVALUE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(268500843170998848)
,p_name=>'P118_CUSTOMERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(268449113764998811)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Customer'
,p_source=>'CUSTOMERCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode from party    ',
'where partytypecode=''CUSTOMER'''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_cMaxlength=>50
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646287638387544697)
,p_name=>'P118_DELIVERYDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(659835069408673362)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Delivery Date'
,p_source=>'DELIVERYDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P118_PURCHASEORDERDATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818452704695414)
,p_name=>'P118_DELIVERYDATE_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_prompt=>'Delivery Date'
,p_source=>'DELIVERYDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646264177766544681)
,p_name=>'P118_DELIVERYORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'DELIVERYORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646276559102544686)
,p_name=>'P118_DELIVERYSCHEDULEWITHPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'DELIVERYSCHEDULEWITHPO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646259765464544677)
,p_name=>'P118_DEPARTMENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'DEPARTMENTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818734342695416)
,p_name=>'P118_DESIGNATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_prompt=>'Designation'
,p_source=>'DESIGNATION'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646697728217787331)
,p_name=>'P118_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(646584114830787230)
,p_use_cache_before_default=>'NO'
,p_format_mask=>'999999999.99'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(556346652771176671)
,p_name=>'P118_DFQUANTITY1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(646584114830787230)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646697840646787332)
,p_name=>'P118_DFTOTALAMOUNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(646584114830787230)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(556262559582176614)
,p_name=>'P118_DISCOUNTRATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(643521010222379453)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646285717742544694)
,p_name=>'P118_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(659835069408673362)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.DocTypeName as d,',
'	a.DocTypeCode as r',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c, Module d',
'where a.DocTypeCode = b.DocTypeCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode',
'    and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45595797973848198)
,p_name=>'P118_EMAIL_BCC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_prompt=>'Bcc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45595632593848197)
,p_name=>'P118_EMAIL_CC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Cc'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>34
,p_cHeight=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646298364900544703)
,p_name=>'P118_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(659835563974673367)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Under Signed'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select employeename , employeecode from employee'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646273308881544684)
,p_name=>'P118_EXPARTYPLANT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'EXPARTYPLANT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650819055459695420)
,p_name=>'P118_EXPIRYTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_source=>'EXPIRYTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650830056294695441)
,p_name=>'P118_FILENAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_prompt=>'P.O. Signed Copy Attached'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="javascript:openFileInNewTab($v(''P118_FILE_TNO''));" ',
'   style="margin-left:10px; font-weight:bold; color:#0066cc; text-decoration:underline; cursor:pointer;">',
'   <i class="fa fa-external-link"></i> Open File',
'</a>'))
,p_source=>'Select File_Name From Binary_Store Where TNo = :P118_FILE_TNO and Reference_TNo = :P118_TNO;'
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44535001361019109)
,p_name=>'P118_FILE_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646258490816544677)
,p_name=>'P118_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1187610655955426917)
,p_name=>'P118_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P118_TNO is null then',
'		return(''NEWRECORD'');',
'	else',
'		return(''EDITRECORD'');',
'	End if;',
'	end ;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646271370558544684)
,p_name=>'P118_FREIGHTCONTRACTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'FREIGHTCONTRACTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646271705845544684)
,p_name=>'P118_FREIGHTRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'FREIGHTRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646309113934544710)
,p_name=>'P118_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(659835563974673367)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Freight Type'
,p_source=>'FREIGHTTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select freighttypename , freighttypecode    from freighttype   WHERE MODULECODE=''GRN''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646699953685787335)
,p_name=>'P118_FVALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(554750420819529735)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54097506044517779)
,p_name=>'P118_HIDDEN_MAIL_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(556920236918249512)
,p_name=>'P118_HSNCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(643521010222379453)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646297713409544703)
,p_name=>'P118_INDENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(659835260810673364)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Indent No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:108:&SESSION.::NO:RP,108:P108_TNO,P108_CALLEDFROMPAGE,P108_FORMSTATUS,P108_CALLEDFROMTNO:&P118_INDENTTNO.,118,CALLED,&P118_TNO."><span class="fa fa-magic"></span></a>',
'',
''))
,p_source=>'INDENTTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P118_INDENT'
,p_lov_cascade_parent_items=>'P118_LOCATIONCODE'
,p_ajax_items_to_submit=>'P118_LOCATIONCODE,P118_TNO,P118_INDENTTNO,P118_FORMSTATUS,P118_PURCHASEORDERDATE,P118_DEPARTMENTCODE,P118_DOCTYPECODE,P118_MODULECODE,P118_WORKORDERTNO,P118_QUOTATIONTNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '700')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646272173891544684)
,p_name=>'P118_ISEVENTRANSACTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'ISEVENTRANSACTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646326163316544718)
,p_name=>'P118_ISFULLADVANCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(650730585285695331)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Is Full Advance'
,p_source=>'ISFULLADVANCE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(269221991515552958)
,p_name=>'P118_ISOPENSPEC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(659835069408673362)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Is Open Spec'
,p_source=>'ISOPENSPEC'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646267336529544682)
,p_name=>'P118_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'YES'
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646276957899544686)
,p_name=>'P118_ITEMWISESCHEDULE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'ITEMWISESCHEDULE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(520904542699194880)
,p_name=>'P118_LENDINGONGROSS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(659835459572673366)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'LENDINGONGROSS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646289709173544697)
,p_name=>'P118_LETTERTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(659834929418673361)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'With reference to your above referred offer / Proforma Invoice & subsiquent negotiations we are pleased to place our purchase order for supply of the items described below :'
,p_prompt=>'Letter Text'
,p_post_element_text=>'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P118_LETTERTEXT."><span class="fa fa-search"></span></a>'
,p_source=>'LETTERTEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>2000
,p_colspan=>12
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646273761437544684)
,p_name=>'P118_LIFTINGFROMCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'LIFTINGFROMCITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646285328133544694)
,p_name=>'P118_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(659835069408673362)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'RC'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.LocationName as d,',
'	a.LocationCode as r',
'from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
'where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(651566784264874798)
,p_name=>'P118_MAILSTATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_prompt=>'Mail Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646280951730544687)
,p_name=>'P118_MARINEINSURANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'MARINEINSURANCEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646280565602544687)
,p_name=>'P118_MARINEINSURANCETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'MARINEINSURANCETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818825564695417)
,p_name=>'P118_MOBILENO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_prompt=>'Mobile No'
,p_source=>'MOBILENO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>35
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818130218695410)
,p_name=>'P118_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_default=>'PURCHASEORDER'
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650829352988695434)
,p_name=>'P118_MODULECODE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_source_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_default=>'GetModuleCodeForPageNo(:APP_PAGE_ID)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1187606938638426880)
,p_name=>'P118_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650829300800695433)
,p_name=>'P118_MODULESN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_source_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_source=>'MODULESN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818338786695412)
,p_name=>'P118_MODULESNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_source=>'MODULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650829166674695432)
,p_name=>'P118_MODULESNO_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_source_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_default=>'select globaltno.nextval from dual;'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'MODULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818187557695411)
,p_name=>'P118_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_default=>'P118_TNO'
,p_item_default_type=>'ITEM'
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650829070163695431)
,p_name=>'P118_MODULETNO_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_source_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_default=>'P118_TNO'
,p_item_default_type=>'ITEM'
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646311730007544710)
,p_name=>'P118_NATUREOFSUPPLYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(659835459572673366)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Nature Of Supply'
,p_source=>'NATUREOFSUPPLYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select NATUREOFSUPPLYNAME , NATUREOFSUPPLYCODE from natureofsupply'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>3
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(651566438841874795)
,p_name=>'P118_OFFICEEMAIL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(45592769740848168)
,p_prompt=>'Party E-mail ID'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1187015159534155614)
,p_name=>'P118_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646324966904544718)
,p_name=>'P118_PAIDAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(650730585285695331)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'PAIDAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646289280220544698)
,p_name=>'P118_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(659835069408673362)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P118_PARTY'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1161663677398802078)
,p_name=>'P118_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646326972559544719)
,p_name=>'P118_PAYMENTADVICELOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(650730585285695331)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'P118_LOCATIONCODE'
,p_item_default_type=>'ITEM'
,p_source=>'PAYMENTADVICELOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(651550791323874795)
,p_name=>'P118_PAYMENTADVICENO'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(650730585285695331)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select paymentadviceno from paymentadvice ',
'where moduletno = :P118_TNO',
''))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Payment Advice No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(503067329861273579)
,p_name=>'P118_PAYMENTADVICETNO'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(650730585285695331)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno from paymentadvice ',
'where moduletno = :P118_TNO',
''))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646275364989544685)
,p_name=>'P118_PAYMENTBYLC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'PAYMENTBYLC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(268500956660998849)
,p_name=>'P118_PENDINGSOTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(268449113764998811)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Pending SO'
,p_source=>'PENDINGSOTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P118_PENDINGSO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_lov_cascade_parent_items=>'P118_LOCATIONCODE,P118_CUSTOMERCODE'
,p_ajax_items_to_submit=>'P118_LOCATIONCODE,P118_CUSTOMERCODE,P118_PENDINGSOTNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650818560235695415)
,p_name=>'P118_PERSONACCOUNTABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_prompt=>'Person Accountable'
,p_source=>'PERSONACCOUNTABLE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646326603705544719)
,p_name=>'P118_POADVANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(650730585285695331)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'PO Advance Amount'
,p_format_mask=>'999999999.99'
,p_source=>'POADVANCEAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(503041200875273546)
,p_name=>'P118_POAMENDMENTAMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(502986137783273496)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select poamendmentamount from poamendment',
'where purchaseordertno = :P118_TNO;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Amount'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(503040440702273538)
,p_name=>'P118_POAMENDMENTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(502986137783273496)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select poamendmentno from poamendment',
'where purchaseordertno = :P118_TNO;'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'PO Amendment No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>35
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(503040532309273539)
,p_name=>'P118_POAMENDMENTTNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(502986137783273496)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno from poamendment',
'where purchaseordertno = :P118_TNO;'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646276167005544685)
,p_name=>'P118_PREDI'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'PREDI'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(562010277700647420)
,p_name=>'P118_PURCHASEORDERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(561980300358647392)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Purchase Order Amount'
,p_format_mask=>'9999999999.99'
,p_source=>'PURCHASEORDERAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646287255581544695)
,p_name=>'P118_PURCHASEORDERDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(659835069408673362)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Purchase Order Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'PURCHASEORDERDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P118_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P118_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646286888301544695)
,p_name=>'P118_PURCHASEORDERNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(659835069408673362)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Purchase Order No'
,p_source=>'PURCHASEORDERNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(269222065931552959)
,p_name=>'P118_QUANTITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(659835069408673362)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Quantity'
,p_format_mask=>'999999999.999'
,p_source=>'QUANTITY'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646296465888544703)
,p_name=>'P118_QUOTATIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(659835260810673364)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Quotation No'
,p_source=>'QUOTATIONTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P118_QUOTATIONTNO'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P118_COMPARATIVESTATEMENTTNO'
,p_ajax_items_to_submit=>'P118_PURCHASEORDERDATE,P118_COMPARATIVESTATEMENTTNO,P118_PARTYCODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646296898070544703)
,p_name=>'P118_RATECONTRACTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(659835260810673364)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Rate Contract No'
,p_source=>'RATECONTRACTTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P118_RATECONTRACTTNO'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_lov_cascade_parent_items=>'P118_PURCHASEORDERDATE,P118_COMPARATIVESTATEMENTTNO'
,p_ajax_items_to_submit=>'P118_PURCHASEORDERDATE,P118_PARTYCODE,P118_COMPARATIVESTATEMENTTNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646277302300544686)
,p_name=>'P118_REFERENCEPURCHASEORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'REFERENCEPURCHASEORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646289248869544697)
,p_name=>'P118_REFERENCETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(659834929418673361)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Reference Text'
,p_post_element_text=>'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P118_REFERENCETEXT."><span class="fa fa-search"></span></a>'
,p_source=>'REFERENCETEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646305093316544708)
,p_name=>'P118_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(659835563974673367)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>100
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650830320919695443)
,p_name=>'P118_REMARK_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_source_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_source=>'REMARK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646278906125544686)
,p_name=>'P118_ROYALTYPENALTYPERUNIT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'ROYALTYPENALTYPERUNIT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646278558935544686)
,p_name=>'P118_ROYALTYPERCENTAGE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'ROYALTYPERCENTAGE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646281780665544687)
,p_name=>'P118_SAUDAPATRAKDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'SAUDAPATRAKDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646281337635544687)
,p_name=>'P118_SAUDAPATRAKNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'SAUDAPATRAKNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(268500769483998847)
,p_name=>'P118_SHIPTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(268449113764998811)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Ship To'
,p_source=>'SHIPTO'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC:Ship To Our WareHouse;WAREHOUSE,Ship To Buyer;BUYER'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646485517140586583)
,p_name=>'P118_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(643521010222379453)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(651593447800874849)
,p_name=>'P118_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P118_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1161663513753802077)
,p_name=>'P118_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1159718010530453248)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.STATUSPRIVILEGE',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.ENTRYPAGENO = :APP_PAGE_ID',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646269685774544683)
,p_name=>'P118_STOCKDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'STOCKDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646269309965544683)
,p_name=>'P118_STORAGELOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'STORAGELOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646288900796544697)
,p_name=>'P118_SUBJECTTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(659834929418673361)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Subject Text'
,p_post_element_text=>'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P118_SUBJECTTEXT.)"><span class="fa fa-search"></span></a>'
,p_source=>'SUBJECTTEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(562010108462647418)
,p_name=>'P118_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(561980300358647392)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Sum Of Amount'
,p_format_mask=>'9999999999.99'
,p_source=>'SUMOFAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(562010132956647419)
,p_name=>'P118_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(561980300358647392)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Sum of Footer Amount'
,p_format_mask=>'9999999999.99'
,p_source=>'SUMOFFOOTERAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(501047094682915556)
,p_name=>'P118_TEMPFOOTERVALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(646584114830787230)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646290060100544697)
,p_name=>'P118_TITLETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(659834929418673361)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Title Text'
,p_post_element_text=>'<a href="f?p=&APP_ID.:9997:&APP_SESSION.:::9997:P9997_TEXT:&P118_TITLETEXT."><span class="fa fa-search"></span></a>'
,p_source=>'TITLETEXT'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_colspan=>12
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646257707871544674)
,p_name=>'P118_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650817960387695409)
,p_name=>'P118_TNO_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_source_plug_id=>wwv_flow_imp.id(650731749442695343)
,p_item_default=>'P118_TNO'
,p_item_default_type=>'ITEM'
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(650828991464695430)
,p_name=>'P118_TNO_2'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_item_source_plug_id=>wwv_flow_imp.id(650733334331695359)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646274509943544685)
,p_name=>'P118_TRANCTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'TRANCTIONTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646310896096544710)
,p_name=>'P118_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(659835459572673366)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_prompt=>'Transaction Type'
,p_source=>'TRANSACTIONTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select TRANSACTIONTYPENAME , TRANSACTIONTYPECODE from TRANSACTIONTYPE'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>3
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646274104247544685)
,p_name=>'P118_UNLOADINGCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'UNLOADINGCITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646262541249544681)
,p_name=>'P118_WORKORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'WORKORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(646272935880544684)
,p_name=>'P118_XPLANT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_item_source_plug_id=>wwv_flow_imp.id(646225442166544647)
,p_source=>'XPLANT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161850524824236685)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(646584114830787230)
,p_triggering_element=>'LEGENDSCODE,FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161850950155236686)
,p_event_id=>wwv_flow_imp.id(161850524824236685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERVALUE',
  'items_to_submit', 'FOOTERHEADCODE,LEGENDSCODE,FOOTERPERCENT,P118_DFAMOUNT,P118_DFQUANTITY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare	',
    'cursor cFooterSchemeDetail is',
    '	select a.* ',
    '	from FooterSchemeList a, FooterSchemeList c',
    '	where a.tno = c.tno',
    '		and a.Status = ''ACTIVE''',
    '		and c.FooterHeadCode = :FooterHeadCode',
    '		and a.sno < c.sno ',
    '		and a.companycode = :global_CompanyCode',
    '		and a.financialyearcode = :global_financialyearcode',
    '		and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '	order by a.sno;',
    'vFooterSchemeDetail cFooterSchemeDetail%ROWTYPE;',
    '',
    'cursor c3FooterSchemeDetail is',
    '	select a.* ',
    '	from FooterSchemeList a, FooterSchemeList c',
    '	where a.tno = c.tno',
    '		and a.Status = ''ACTIVE''',
    '		and c.FooterHeadCode = :FooterHeadCode',
    '		and a.companycode = :global_CompanyCode',
    '		and a.financialyearcode = :global_financialyearcode',
    '		and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '	order by a.sno;',
    'v3FooterSchemeDetail c3FooterSchemeDetail%ROWTYPE;',
    '',
    '',
    'cursor c2FooterSchemeDetail is',
    '	select a.* ',
    '	from FooterSchemeList a',
    '	where a.Status = ''ACTIVE''',
    '		and a.FooterHeadCode = :FooterHeadCode',
    '		and a.companycode = :global_CompanyCode',
    '		and a.financialyearcode = :global_financialyearcode',
    '		and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '	order by a.sno;',
    'v2FooterSchemeDetail c2FooterSchemeDetail%ROWTYPE;',
    '',
    'myFormula varchar2(1000);',
    'isFound varchar2(10);',
    'fvalue number;',
    'tTotalDetailAmount number;',
    'tmp varchar2(100);',
    '',
    'BEGIN',
    '   -- raise_application_error(-20000, ''101 ''||:P118_DFAMOUNT);',
    '    tTotalDetailAmount := to_number(:P118_DFAMOUNT);',
    '',
    '  --   raise_application_error(-20000,''102'');',
    'open c2FooterSchemeDetail;',
    'fetch c2FooterSchemeDetail into v2FooterSchemeDetail;',
    'if c2FooterSchemeDetail%FOUND then',
    'if length(nvl(v2FooterSchemeDetail.Formula,''''))>0 then',
    '	myFormula := v2FooterSchemeDetail.Formula;',
    '	myFormula := replace(myFormula, ''.A.'', nvl(tTotalDetailAmount,0) );',
    '	for vFooterSchemeDetail  in cFooterSchemeDetail ',
    '	loop',
    '		if :FooterHeadCode = vFooterSchemeDetail.FooterHeadCode then',
    '				isFound := ''YES'';',
    '				myFormula := replace(myFormula, vFooterSchemeDetail.FooterHeadCode, nvl(:FooterValue,0) );',
    '				exit;',
    '		end if;',
    '	end loop;	',
    '              ',
    '		myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0) );		',
    '	for v3FooterSchemeDetail  in c3FooterSchemeDetail ',
    '	loop',
    '			myFormula := replace(myFormula, v3FooterSchemeDetail.FooterHeadCode, ''0'' );',
    '	end loop;',
    '	if (:legendscode is null and NVL(GetMYparametervalue(''LEGENDS''),''YES'') = ''NO'') then ',
    '		myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '		:footervalue := getvalue(myformula);',
    '    end if;',
    '	if (:LEGENDSCODE is not null  and  NVL(GetMyparametervalue(''LEGENDS''),''NO'')= ''YES'') ',
    '      then ',
    '      ',
    '	select getvalue(myFormula) into  fvalue 	from dual;             ',
    '	if :LEGENDSCODE = ''PRA'' then ',
    '		 	:footervalue := nvl(round(fvalue,0),0);',
    '	end if; 				',
    '	if :LEGENDSCODE = ''PRD'' then ',
    '			:footervalue := (-1)* nvl(round(fvalue,0),0);		  					',
    '	end if;',
    '	if :LEGENDSCODE is null then ',
    '			myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '	end if;',
    '	if :LEGENDSCODE = ''PAA'' then        ',
    '		:footervalue := nvl(round(fvalue,2),0);          ',
    '	end if;				',
    '	if :LEGENDSCODE = ''PAD'' then ',
    '		:footervalue := (-1)* nvl(round(fvalue,2),0);',
    '	end if;',
    '	if :LEGENDSCODE = ''LSA'' then ',
    '		:footervalue := 0;',
    '	end if;',
    '    if :LEGENDSCODE = ''LSD'' then ',
    '		:footervalue := 0;',
    '	end if;',
    '',
    '	if :LEGENDSCODE IN (''OQD'') then ',
    '			:Footervalue := (-1)* ROUND(:footerpercent * :P118_DFQUANTITY1, 0 );',
    '	elsif :LEGENDSCODE IN (''OQA'') then ',
    '    ',
    '			:Footervalue := ROUND(:footerpercent * :P118_DFQUANTITY1, 0 );',
    '	end if;',
    ' END IF;	',
    'end if;',
    'if :LEGENDSCODE IN (''OQD'') then ',
    '	:Footervalue := (-1)* ROUND(:footerpercent * :P118_DFQUANTITY1, 0 );',
    'elsif :LEGENDSCODE IN (''OQA'') then ',
    '	:Footervalue := ROUND(:footerpercent * :P118_DFQUANTITY1, 0 );',
    'end if;',
    '',
    'end if;',
    '',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161851507204236686)
,p_event_id=>wwv_flow_imp.id(161850524824236685)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161852818912236686)
,p_name=>'Calculate Detail Footer Total Amount value '
,p_static_id=>'calculate-detail-footer-total-amount-value'
,p_event_sequence=>170
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(646584114830787230)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161853254758236686)
,p_event_id=>wwv_flow_imp.id(161852818912236686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P118_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161851904594236686)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(646584114830787230)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161852401787236686)
,p_event_id=>wwv_flow_imp.id(161851904594236686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("FOOTERVALUE");',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '});',
    '',
    '$s("P118_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161855508776236688)
,p_name=>'Calculate Footer Total'
,p_static_id=>'calculate-footer-total'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161807963397236664)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161856040817236688)
,p_event_id=>wwv_flow_imp.id(161855508776236688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow,index, id) {',
    '',
    'meta = model.getRecordMetadata(id);',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '',
    '    if (!isNaN(n_amt) && !meta.agg) {',
    '        n_totamt += n_amt;',
    '    }',
    '',
    '});',
    'apex.item("P118_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161880576250236699)
,p_name=>'check advance amount'
,p_static_id=>'check-advance-amount'
,p_event_sequence=>440
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_POADVANCEAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161881119928236699)
,p_event_id=>wwv_flow_imp.id(161880576250236699)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_POADVANCEAMOUNT,P118_PURCHASEORDERAMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '',
    '',
    'if to_number(NVL(:P118_POADVANCEAMOUNT,0)) > to_number(NVL(:P118_PURCHASEORDERAMOUNT,0)) then',
    '    raise_application_error(-20000,''Advance Amount Cannot Be greater than PO Amount'');',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161899809665236708)
,p_name=>'check balance'
,p_static_id=>'check-balance'
,p_event_sequence=>620
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'QUANTITY1,UNIT2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161900289320236708)
,p_event_id=>wwv_flow_imp.id(161899809665236708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'QUANTITY1,P118_BALANCEQTY',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if to_number(:quantity1) < to_number(:P118_BALANCEQTY) then',
    '    raise_application_error(-20000,''Quantity mismatch. - ''||:quantity1||''-''||:P118_BALANCEQTY);',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161836792463236680)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161813501162236667)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161837746834236680)
,p_event_id=>wwv_flow_imp.id(161836792463236680)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P118_TNO);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161837252669236680)
,p_event_id=>wwv_flow_imp.id(161836792463236680)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PURCHASEORDERDETAIL a',
    '    where not exists (',
    '        select 1 from PURCHASEORDER  aa  ',
    '        where aa.tno = a.tno',
    '    );',
    '',
    'delete from PURCHASEORDERDETAILFOOTER a',
    '    where not exists (',
    '        select 1 from PURCHASEORDER  aa  ',
    '        where aa.tno = a.tno',
    '    ); ',
    'delete from PURCHASEORDERTAC a',
    '    where not exists (',
    '        select 1 from PURCHASEORDER  aa  ',
    '        where aa.tno = a.tno',
    '    ); ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161838294909236680)
,p_event_id=>wwv_flow_imp.id(161836792463236680)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P118_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P118_CALLEDFROMTNO'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
    '',
    '',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#:P#2002#_TNO:#P2002_TNO#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    '',
    'url = url.replace("#P2002_TNO#", y);',
    '//window.alert(x);',
    '//window.alert(y);',
    '//window.alert(url);',
    '',
    '',
    '//call',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161876026497236697)
,p_name=>'delete unsaved record from detail table'
,p_static_id=>'delete-unsaved-record-from-detail-table'
,p_event_sequence=>400
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161876533128236697)
,p_event_id=>wwv_flow_imp.id(161876026497236697)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PURCHASEORDERDETAILFOOTER a',
    '    where not exists (',
    '        select 1 from PURCHASEORDER  aa  ',
    '        where aa.tno = a.tno',
    '    ); ',
    '',
    ' delete from PURCHASEORDERDETAIL a',
    '    where not exists (',
    '        select 1 from PURCHASEORDER  aa  ',
    '        where aa.tno = a.tno',
    '    ); ',
    'delete from PURCHASEORDERTAC a',
    '    where not exists (',
    '        select 1 from PURCHASEORDER  aa  ',
    '        where aa.tno = a.tno',
    '    ); ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161827743297236675)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161828656575236675)
,p_event_id=>wwv_flow_imp.id(161827743297236675)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161813894054236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161829224340236677)
,p_event_id=>wwv_flow_imp.id(161827743297236675)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161813894054236667)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P118_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161829652939236677)
,p_event_id=>wwv_flow_imp.id(161827743297236675)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161813894054236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from loadingadvice aa where aa.purchaseordertno = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161830176634236677)
,p_event_id=>wwv_flow_imp.id(161827743297236675)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161813894054236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from paymentadvice aa where aa.moduletno = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161828185457236675)
,p_event_id=>wwv_flow_imp.id(161827743297236675)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161813894054236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161835397368236678)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161836350275236680)
,p_event_id=>wwv_flow_imp.id(161835397368236678)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161813140004236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161835935030236678)
,p_event_id=>wwv_flow_imp.id(161835397368236678)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161813140004236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161830582265236677)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161831112503236677)
,p_event_id=>wwv_flow_imp.id(161830582265236677)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161814307803236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''NO''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161832046705236677)
,p_event_id=>wwv_flow_imp.id(161830582265236677)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161814307803236667)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P118_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161832618988236677)
,p_event_id=>wwv_flow_imp.id(161830582265236677)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161814307803236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from loadingadvice aa where aa.purchaseordertno = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161833108190236678)
,p_event_id=>wwv_flow_imp.id(161830582265236677)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161814307803236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from paymentadvice aa where aa.moduletno = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161831617686236677)
,p_event_id=>wwv_flow_imp.id(161830582265236677)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161814307803236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM MODULEFLOW A , MODULEFLOWUSER B , bossuser C',
'WHERE A.TNO = B.TNO',
'AND A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'AND B.BOSSUSERCODE = C.BOSSUSERCODE',
'AND C.BOSSUSERNAME = :APP_USER',
'AND B.UPDATEPRIVILEGE = ''YES''',
'UNION ALL',
'Select 1',
'  From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.UPDATEPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161833562895236678)
,p_event_id=>wwv_flow_imp.id(161830582265236677)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-enable-2'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161814307803236667)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P118_ISOPENSPEC'
,p_server_condition_expr2=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161834017557236678)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161835037247236678)
,p_event_id=>wwv_flow_imp.id(161834017557236678)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161812658926236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161834541121236678)
,p_event_id=>wwv_flow_imp.id(161834017557236678)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161812658926236667)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161842467530236682)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161812658926236667)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161845991754236683)
,p_event_id=>wwv_flow_imp.id(161842467530236682)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161812658926236667)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161845459062236683)
,p_event_id=>wwv_flow_imp.id(161842467530236682)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161812658926236667)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P118_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161843517789236683)
,p_event_id=>wwv_flow_imp.id(161842467530236682)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO,P118_STATUS,P118_ISOPENSPEC',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P118_TNO,:P118_STATUS);',
    '',
    'declare',
    '    tpaymentadvice number;',
    '',
    'begin',
    '    SELECT COUNT(A.TNO) INTO tpaymentadvice',
    '	FROM PAYMENTADVICE A',
    '	WHERE A.MODULETNO = :P118_TNO ;',
    '',
    '    if nvl(tpaymentadvice, 0) = 0 then',
    '        if :P118_STATUS = ''ACTIVE'' then',
    '        ',
    '            CREATEPAYMENTADVICEFORPO(:P118_TNO);',
    '',
    '        end if;',
    '',
    '    end if;',
    '--RAISE_APPLICATION_ERROR(-20005,'' STATUS ''||:P118_STATUS||'' ISOPEN ''||:P118_ISOPENSPEC);',
    '    if :P118_STATUS = ''ACTIVE'' and nvl(:P118_ISOPENSPEC,''NO'') = ''YES'' then',
    '        ',
    '            createindentfrompo(:P118_TNO);',
    '            COMMIT;',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161843997200236683)
,p_event_id=>wwv_flow_imp.id(161842467530236682)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P118_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161844456993236683)
,p_event_id=>wwv_flow_imp.id(161842467530236682)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161812658926236667)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161845031071236683)
,p_event_id=>wwv_flow_imp.id(161842467530236682)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(792334967369383907)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161843031263236682)
,p_event_id=>wwv_flow_imp.id(161842467530236682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161895612264236707)
,p_name=>'enable customer and SO field'
,p_static_id=>'enable-customer-and-so-field'
,p_event_sequence=>590
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_SHIPTO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161896637313236707)
,p_event_id=>wwv_flow_imp.id(161895612264236707)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_CUSTOMERCODE,P118_PENDINGSOTNO'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_SHIPTO'
,p_client_condition_expression=>'WAREHOUSE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161896080151236707)
,p_event_id=>wwv_flow_imp.id(161895612264236707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_CUSTOMERCODE,P118_PENDINGSOTNO'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_SHIPTO'
,p_client_condition_expression=>'BUYER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161897092065236707)
,p_event_id=>wwv_flow_imp.id(161895612264236707)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_CUSTOMERCODE,P118_PENDINGSOTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'select null a , null b from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_SHIPTO'
,p_client_condition_expression=>'WAREHOUSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45597197576848212)
,p_name=>'Enable/Disable EMAIL_CC'
,p_static_id=>'enable-disable-email-cc'
,p_event_sequence=>690
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_ALLOW_CC_MAIL'
,p_condition_element=>'P118_ALLOW_CC_MAIL'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Y'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45597377030848214)
,p_event_id=>wwv_flow_imp.id(45597197576848212)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_EMAIL_CC'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45597229540848213)
,p_event_id=>wwv_flow_imp.id(45597197576848212)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_EMAIL_CC'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161825754695236675)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161826272986236675)
,p_event_id=>wwv_flow_imp.id(161825754695236675)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161811459720236667)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161826777798236675)
,p_event_id=>wwv_flow_imp.id(161825754695236675)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161811925249236667)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161827312738236675)
,p_event_id=>wwv_flow_imp.id(161825754695236675)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161812306249236667)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161897527155236707)
,p_name=>'enable quantity'
,p_static_id=>'enable-quantity'
,p_event_sequence=>600
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_ISOPENSPEC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161898528265236707)
,p_event_id=>wwv_flow_imp.id(161897527155236707)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_QUANTITY'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ISOPENSPEC'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161897991935236707)
,p_event_id=>wwv_flow_imp.id(161897527155236707)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_QUANTITY'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ISOPENSPEC'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161840631068236682)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161811925249236667)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161841640138236682)
,p_event_id=>wwv_flow_imp.id(161840631068236682)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO,P118_COMPANYCODE,P118_PURCHASEORDERNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '		cursor cPassFail is',
    '				select',
    '						a.TNo,',
    '						a.TokenNo										',
    '				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '				where a.ModuleFlowTNo = b.TNo',
    '						and b.TNo = c.TNo',
    '						and a.BossUserCode = c.BossUserCode',
    '						and c.BossUserCode = d.BossUserCode',
    '						and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '						and d.LoginName = User',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100) := :P60_TNO;',
    'begin',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = '':P''||to_char(:APP_PAGE_ID)||''_PASSFAILREMARK''',
    '				where a.TNo = vPassFail.TNo;',
    '				',
    '				SendBackPassFail(tTokenNo , TMP );',
    '		    		',
    '				',
    '				commit;',
    '		else',
    '				close cPassFail;',
    '		end if;',
    '',
    '	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161842092688236682)
,p_event_id=>wwv_flow_imp.id(161840631068236682)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161841099893236682)
,p_event_id=>wwv_flow_imp.id(161840631068236682)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161867860059236692)
,p_name=>'Focus on Party'
,p_static_id=>'focus-on-party'
,p_event_sequence=>310
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".txtPaymentMessage").keydown(function(e)',
'            {',
'                if(e.keyCode == 9)',
'                {',
'                    alert("You Press Tab Only");',
'                }',
'    });'))
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'ON TAB PRESS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161868436327236694)
,p_event_id=>wwv_flow_imp.id(161867860059236692)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161866969078236692)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161813140004236667)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161867468565236692)
,p_event_id=>wwv_flow_imp.id(161866969078236692)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161853700177236686)
,p_name=>'Get DFA_AMT'
,p_static_id=>'get-dfa-amt'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(646584114830787230)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161854202532236686)
,p_event_id=>wwv_flow_imp.id(161853700177236686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget      = apex.region(''Detail'').widget();',
    'var grid        = widget.interactiveGrid(''getViews'',''grid'');  ',
    'var model = grid.getSelectedRecords(); ',
    'var jsonData     = [];',
    '',
    'model.forEach(function(r) {',
    '    var record = r;   ',
    '    jsonData.push(record);',
    '})',
    '',
    'let value = null;',
    'value = jsonData[0][16];',
    '',
    '$s(''P118_DFAMOUNT'',value);',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161857779774236688)
,p_name=>'Hide'
,p_static_id=>'hide'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161807963397236664)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161858303674236689)
,p_event_id=>wwv_flow_imp.id(161857779774236688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(646584114830787230)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161870565027236694)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>340
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161871139747236694)
,p_event_id=>wwv_flow_imp.id(161870565027236694)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161846383731236683)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161846897894236683)
,p_event_id=>wwv_flow_imp.id(161846383731236683)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161861015014236689)
,p_name=>'Initialize SNO Sequence1'
,p_static_id=>'initialize-sno-sequence-2'
,p_event_sequence=>250
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(650730603829695332)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161861478373236691)
,p_event_id=>wwv_flow_imp.id(161861015014236689)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare',
    'mysno number;',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161858649938236689)
,p_name=>'Insert into detail'
,p_static_id=>'insert-into-detail'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_INDENTTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161859210917236689)
,p_event_id=>wwv_flow_imp.id(161858649938236689)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO,P118_INDENTTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    DELETE FROM purchaseorderdetail WHERE TNO = :P118_TNO;',
    '    insert into purchaseorderdetail',
    '    (',
    '        tno,',
    '        sno,',
    '        INDENTTNO,',
    '        ITEMCODE,',
    '        ITEMSPECIFICATIONCODE,',
    '        QUANTITY1,',
    '        QUANTITY2,',
    '        RATE,',
    '        AMOUNT , ',
    '        RATEMEASURINGUNITCODE',
    '    )',
    '    (',
    '        select ',
    '            :P118_TNO,',
    '            globaltno.nextval,',
    '            :P118_INDENTTNO,',
    '            a.ITEMCODE , ',
    '            a.ITEMSPECIFICATIONCODE , ',
    '           round( nvl(a.QUANTITY1,0) - nvl(a.ORDEREDQUANTITY1,0) , getuomdecimal(b.measuringunitcode1)), ',
    '           round( nvl(a.QUANTITY2,0) - nvl(a.ORDEREDQUANTITY2,0) , getuomdecimal(b.measuringunitcode2)), ',
    '            null , ',
    '            null ,',
    '            GetMeasuringUnitCodeFromItem(a.itemcode) ',
    '        from indentdetail a , item b',
    '        where a.itemcode = b.itemcode',
    '        and a.tno = :P118_INDENTTNO',
    '',
    '        AND NVL(QUANTITY1,0)-NVL(ORDEREDQUANTITY1,0)>0',
    '        ',
    '   );',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161859649149236689)
,p_event_id=>wwv_flow_imp.id(161858649938236689)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(643521010222379453)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161900737362236708)
,p_name=>'insert into detail'
,p_static_id=>'insert-into-detail-2'
,p_event_sequence=>630
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161723644658236605)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161901152440236708)
,p_event_id=>wwv_flow_imp.id(161900737362236708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'insert detail with CS'
,p_static_id=>'insert-detail-with-cs'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO,P118_QUOTATIONTNO,P118_COMPARATIVESTATEMENTTNO,P118_INDENTTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from purchaseorderdetail where tno=:P118_TNO;',
    'for i in ',
    '(',
    '    SELECT DISTINCT',
    '    ',
    '    --globaltno.nextval as sno ,',
    '    b.itemcode,',
    '    b.itemspecificationcode,				       			',
    '    e.itemname,',
    '    ee.itemspecificationname,',
    '    b.quantity1 - nvl(q.quantity1, 0) AS quantity1,',
    '    round((b.quantity1 - nvl(q.quantity1, 0)) * ee.multiplyingfactor,',
    '          3)                          AS quantity2,',
    '    b.withoutdiscountrate,',
    '    b.discountpercentage,',
    '    b.discountrate,',
    '    b.rateafterdiscount,',
    '    b.israteinclusivetax,',
    '    b.rate,',
    '    b.description,',
    '    b.amount,',
    '    p.measuringunitcode,',
    '    a.itemwisefooter,',
    '    ee.hsncode,',
    '    a.transactiontypecode,',
    '    a.natureofsupplycode,',
    '    a.creditdays,',
    '    a.freighttypecode',
    'FROM',
    '    quotation         a,',
    '    quotationdetail   b,  ',
    '     item              e,',
    '    itemspecification ee,',
    '    measuringunit     p,',
    '   (',
    '        SELECT',
    '            aa.quotationtno,',
    '            bb.itemcode,',
    '            bb.itemspecificationcode,',
    '            SUM(bb.quantity1) AS quantity1',
    '        FROM',
    '            purchaseorder       aa,',
    '            purchaseorderdetail bb',
    '        WHERE',
    '                aa.tno = bb.tno',
    '            AND aa.quotationtno = :p118_quotationtno',
    '        GROUP BY',
    '            aa.quotationtno,',
    '            bb.itemcode,',
    '            bb.itemspecificationcode',
    '    )                 q',
    '				      				',
    'WHERE',
    '        a.tno = b.tno',
    '    AND a.tno = :p118_quotationtno',
    '   AND b.itemcode = e.itemcode',
    '    AND b.itemspecificationcode = ee.itemspecificationcode',
    '    AND e.measuringunitcode1 = p.measuringunitcode',
    '    AND b.tno = q.quotationtno (+)',
    '    AND b.itemcode = q.itemcode (+)',
    '    AND b.itemspecificationcode = q.itemspecificationcode (+)',
    '							   ',
    '    AND ( :p118_comparativestatementtno IS NULL',
    '          OR EXISTS (',
    '        SELECT',
    '            aa.tno',
    '        FROM',
    '            quotationdetail            aa,',
    '            comparativestatementdetail bb,',
    '            comparativestatementitem   cc',
    '        WHERE',
    '                aa.tno = a.tno',
    '            AND aa.itemcode = b.itemcode',
    '            AND aa.itemspecificationcode = b.itemspecificationcode',
    '            AND aa.tno = bb.quotationtno',
    '            AND bb.tno = cc.tno',
    '            AND bb.quotationtno = cc.quotationtno',
    '            AND aa.itemcode = cc.itemcode',
    '            AND aa.itemspecificationcode = cc.itemspecificationcode',
    '    ) )',
    '',
    'ORDER BY',
    '    1',
    ')',
    'loop',
    '    insert into purchaseorderdetail',
    '    (',
    '    tno,',
    '    sno,',
    '    itemcode,',
    '    itemspecificationcode,				       			',
    '    quantity1 ,',
    '     quantity2,',
    '    withoutdiscountrate,',
    '    discountpercentage,',
    '    discountrate,',
    '    rateafterdiscount,',
    '    israteinclusivetax,',
    '    rate,',
    '    ratemeasuringunitcode,',
    '    description,',
    '    amount,',
    '    indenttno',
    '    )',
    '    values',
    '    (',
    '        :P118_TNO,',
    '        globaltno.nextval,',
    '        i.itemcode,',
    '        i.itemspecificationcode,				       			',
    '        i.quantity1 ,',
    '         i.quantity2,',
    '        i.withoutdiscountrate,',
    '        i.discountpercentage,',
    '        i.discountrate,',
    '        i.rateafterdiscount,',
    '        i.israteinclusivetax,',
    '        i.rate,',
    '        i.measuringunitcode,',
    '        i.description,',
    '        i.amount,',
    '        :P118_INDENTTNO',
    '    );',
    'end loop;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P118_RATECONTRACTTNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161901694626236710)
,p_event_id=>wwv_flow_imp.id(161900737362236708)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'insert detail with Rate Contract'
,p_static_id=>'insert-detail-with-rate-contract'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO,P118_QUOTATIONTNO,P118_COMPARATIVESTATEMENTTNO,P118_RATECONTRACTTNO,P118_INDENTTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'TMP NUMBER;',
    'BEGIN',
    'if :P118_RATECONTRACTTNO is not null then ',
    '    delete from purchaseorderdetail where tno=:P118_TNO;',
    '    for i in ',
    '    (',
    '        SELECT',
    '    a.itemcode,',
    '    a.itemspecificationcode,',
    '    a.description,',
    '    b.itemname,',
    '    c.itemspecificationname,',
    '    a.quantity1 - nvl(a.orderedquantity1, 0) AS quantity1,',
    '    a.quantity2 - nvl(a.orderedquantity2, 0) AS quantity2',
    'FROM',
    '    indentdetail      a,',
    '    item              b,',
    '    itemspecification c',
    'WHERE',
    '        a.tno = :p118_indenttno',
    '    AND a.itemcode = b.itemcode',
    '    AND a.itemspecificationcode = c.itemspecificationcode',
    '    AND a.documentstatuscode = ''ACTIVE''',
    '    AND nvl(a.quantity1, 1) - nvl(a.orderedquantity1, 0) >= 0',
    '    AND b.tno = c.tno',
    '    --AND getitemforpurchaseorder(b.itemcode, :p118_comparativestatementtno, :p118_ratecontracttno) = ''YES''',
    'AND ( :P118_QUOTATIONTNO IS NULL',
    '      OR EXISTS (',
    '    SELECT',
    '        aa.tno',
    '    FROM',
    '        quotationdetail aa',
    '    WHERE',
    '            aa.tno = :P118_QUOTATIONTNO',
    '        AND aa.itemcode = a.itemcode',
    '        AND aa.itemspecificationcode = a.itemspecificationcode',
    '        AND aa.itemspecificationcode IS NOT NULL',
    '    UNION',
    '    SELECT',
    '        aa.tno',
    '    FROM',
    '        quotationdetail aa',
    '    WHERE',
    '            aa.tno = :P118_QUOTATIONTNO',
    '        AND aa.itemcode = a.itemcode',
    '										        		',
    '    ) )',
    '    AND ( :P118_COMPARATIVESTATEMENTTNO IS NULL',
    '          OR EXISTS (',
    '    SELECT',
    '        aa.tno',
    '    FROM',
    '        quotationdetail            aa,',
    '        comparativestatementdetail bb,',
    '        comparativestatementitem   cc',
    '    WHERE',
    '            aa.tno = :P118_QUOTATIONTNO',
    '        AND aa.itemcode = a.itemcode',
    '        AND aa.itemspecificationcode = a.itemspecificationcode',
    '        AND aa.tno = bb.quotationtno',
    '        AND bb.tno = cc.tno',
    '        AND bb.quotationtno = cc.quotationtno',
    '        AND aa.itemcode = cc.itemcode',
    '        AND aa.itemspecificationcode = cc.itemspecificationcode',
    '        AND aa.itemspecificationcode IS NOT NULL',
    '    UNION',
    '    SELECT',
    '        aa.tno',
    '    FROM',
    '        quotationdetail            aa,',
    '        comparativestatementdetail bb,',
    '        comparativestatementitem   cc',
    '    WHERE',
    '            aa.tno = :P118_QUOTATIONTNO',
    '        AND aa.itemcode = a.itemcode',
    '		AND aa.tno = bb.quotationtno',
    '        AND bb.tno = cc.tno',
    '        AND bb.quotationtno = cc.quotationtno',
    '        AND aa.itemcode = cc.itemcode',
    '										        	',
    '    ) )',
    '    -- dT. 07-AUG-2025',
    '    AND (',
    '        :P118_RATECONTRACTTNO IS NULL ',
    '        OR',
    '        EXISTS',
    '        (',
    '            SELECT 1 FROM RATECONTRACTDETAIL X',
    '            WHERE X.TNO = :P118_RATECONTRACTTNO',
    '              AND X.ITEMCODE = A.ITEMCODE',
    '              AND X.ITEMSPECIFICATIONCODE = A.ITEMSPECIFICATIONCODE',
    '        )',
    '    )',
    '    )',
    '    loop',
    '        insert into purchaseorderdetail',
    '        (',
    '        tno,',
    '        sno,',
    '        itemcode,',
    '        itemspecificationcode,	',
    '        description,			       			',
    '        quantity1 ,',
    '         quantity2 ,',
    '         indenttno ,',
    '         rate ,',
    '         amount ,',
    '         WITHOUTDISCOUNTRATE',
    '        )',
    '        values',
    '        (',
    '        :P118_TNO,',
    '        globaltno.nextval,',
    '        i.itemcode,',
    '        i.itemspecificationcode,	',
    '        i.description,			       			',
    '        i.quantity1 ,',
    '         i.quantity2,',
    '         :P118_INDENTTNO,',
    '        GET_RATE(:P118_RATECONTRACTTNO ,i.itemcode , i.itemspecificationcode ),',
    '        i.quantity1 * GET_RATE(:P118_RATECONTRACTTNO ,i.itemcode , i.itemspecificationcode ),',
    '        GET_RATE(:P118_RATECONTRACTTNO ,i.itemcode , i.itemspecificationcode )',
    '        );',
    '    end loop;',
    'end if;',
    'SELECT COUNT(*)  INTO TMP  FROM PURCHASEORDERDETAIL',
    'WHERE TNO = :P118_TNO ;',
    'IF NVL(TMP,0) = 0 then',
    '   raise_application_error(-20000, ''Pl. Match Item of Indent With Refered Doc e.g. CS, Quotaion or Rate Contract'');',
    'end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33753746497252315)
,p_event_id=>wwv_flow_imp.id(161900737362236708)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'insert footer detail'
,p_static_id=>'insert-footer-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO,P118_PARTYCODE,P118_TRANSACTIONTYPECODE,P118_HSNCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'tfooteramount number;',
    'begin',
    '---- INSERT INTO FOOTER DETAIL',
    'for vdet in  (',
    '   select a.tno,a.sno,b.hsncode,nvl(a.amount,(nvl(a.rate,0)*nvl(a.quantity1,0))) as amount,a.rate  from purchaseorderdetail a, itemspecification b',
    '   where a.itemspecificationcode = b.itemspecificationcode',
    '     and a.tno = :P118_TNO',
    '   ORDER BY SNO',
    '',
    ') loop',
    '    if nvl(vdet.Rate,0) > 0 then',
    '    --raise_application_error(-20000,''100'');',
    '     -- RAISE_APPLICATION_ERROR(-20000,''party ''||:P118_PARTYCODE||''tr type ''||:P118_TRANSACTIONTYPECODE||'' hsn ''||:P118_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P118_DFAMOUNT||'' specs''||:itemspecificationcode);',
    '',
    '           DELETE FROM PurchaseOrderDetailFooter WHERE TNO = vdet.TNO AND SNO = vdet.SNO;',
    '',
    '            for vTaxRule',
    '            				in (',
    '            					select',
    '            						rownum as slno,',
    '            						b.TNo,',
    '            						b.SNO,',
    '            						a.LegendsCode,',
    '            						c.FooterHeadCode,',
    '            						c.FooterHeadName,',
    '            						b.TaxRate as FooterPercent,',
    '                                    (:AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '            					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, party F',
    '            					where a.TNO = b.TNo',
    '            						and a.SNO = b.SNo',
    '            						and b.FooterHeadCode = c.FooterHeadCode',
    '            						and a.TNO = d.TNo',
    '                                    and d.tno = e.tno',
    '                                    and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                                    and f.PartyCode = :P118_PARTYCODE',
    '                                    And d.transactiontypecode = :P118_TRANSACTIONTYPECODE',
    '                                    and e.HSNCODE = vdet.HSNCODE',
    '                                    ',
    '            					--order by b.SNo',
    '            				)',
    '            			loop',
    '           -- raise_application_error(-20000,phsn);	',
    '           --if nvl(:rate,0) > 0 then',
    '           --RAISE_APPLICATION_ERROR(-20000,''party ''||:P118_PARTYCODE||''tr type ''||:P118_TRANSACTIONTYPECODE||'' hsn ''||:P118_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P118_DFAMOUNT||'' specs''||:itemspecificationcode||'' footervalue ''||vTaxRul'
||'e.FooterValue);',
    '           --end if;',
    '            			    Insert into PurchaseOrderDetailFooter',
    '                            (tno,sno,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '            				values',
    '                            (vdet.TNO,vdet.SNO,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '            			',
    '            			end loop; -- for vTaxRule',
    '                        commit;',
    '        end if;',
    '   SELECT SUM(FOOTERVALUE) INTO tfooteramount from PurchaseOrderDetailFooter',
    '   where tno = vdet.TNO',
    '     and sno = vdet.SNO;',
    '  ',
    '   update purchaseorderdetail set amount = vdet.amount,',
    '                                  footeramount = nvl(tfooteramount,0),',
    '                                  totalamount = nvl(amount,(nvl(rate,0)*nvl(quantity1,0))) + nvl(tfooteramount,0)',
    '     where tno = vdet.TNO',
    '     and sno = vdet.SNO;',
    '',
    'end loop;',
    '   ----',
    ' ',
    ' ',
    'end ;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(25948953629256775)
,p_event_id=>wwv_flow_imp.id(161900737362236708)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(161723644658236605)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'SELECT * FROM purchaseorderdetail WHERE TNO = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161902193345236710)
,p_event_id=>wwv_flow_imp.id(161900737362236708)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'refresh detail'
,p_static_id=>'refresh-detail'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(643521010222379453)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33753877250252316)
,p_event_id=>wwv_flow_imp.id(161900737362236708)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'refresh footer detail'
,p_static_id=>'refresh-footer-detail'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(646584114830787230)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161879156541236699)
,p_name=>'Insert into tac'
,p_static_id=>'insert-into-tac'
,p_event_sequence=>430
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161774402848236641)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161879675410236699)
,p_event_id=>wwv_flow_imp.id(161879156541236699)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO,P118_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from PURCHASEORDERTAC where tno = :P118_TNO;',
    'insert into PURCHASEORDERTAC',
    '(',
    '    TNO, ',
    '    SNO, ',
    '    TERMSANDCONDITIONHEADCODE, ',
    '    TERMSANDCONDITION',
    ')',
    '(',
    '    SELECT',
    '        :P118_TNO,',
    '        globaltno.nextval,',
    '        termsandconditionheadcode,',
    '        termsandconditionvalue',
    '    FROM',
    '        moduledoctypewisetacdetail',
    '    WHERE',
    '        tno IN (',
    '            SELECT',
    '                tno',
    '            FROM',
    '                moduledoctypewisetac',
    '            WHERE',
    '                    modulecode = getModuleCodeForPageNo(:APP_PAGE_ID)',
    '                AND doctypecode = :P118_DOCTYPECODE',
    '        )',
    ');',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161880178646236699)
,p_event_id=>wwv_flow_imp.id(161879156541236699)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(646458929220586568)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161882362265236700)
,p_name=>'make discount rate read only'
,p_static_id=>'make-discount-rate-read-only'
,p_event_sequence=>460
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'DISCOUNTPERCENTAGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161882890225236700)
,p_event_id=>wwv_flow_imp.id(161882362265236700)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//if (tModuleEntryPageNo = call )',
    '',
    '//{',
    ' //   var button = document.getElementById(''cancel'');',
    '',
    '  // Click the button',
    ' // button.click();',
    '//}',
    '',
    '',
    'if ($v(''DISCOUNTPERCENTAGE'') > 0) {',
    '$("#DISCOUNTRATE").attr(''readonly'',''readonly'');',
    '} ',
    'else',
    '{',
    '$("#DISCOUNTRATE").removeAttr(''readonly'');',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161883299825236700)
,p_name=>'make readonly based on LSA and LSD'
,p_static_id=>'make-readonly-based-on-lsa-and-lsd'
,p_event_sequence=>470
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(646584114830787230)
,p_triggering_element=>'LEGENDSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161883784383236700)
,p_event_id=>wwv_flow_imp.id(161883299825236700)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if ($v(''LEGENDSCODE'') != ''LSA'' && $v(''LEGENDSCODE'') != ''LSD'') {',
    ' $("#FOOTERVALUE").attr(''readonly'',''readonly'');',
    '} ',
    'else',
    '{',
    '        $("#FOOTERVALUE").removeAttr(''readonly'');',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161890980419236703)
,p_name=>'move nxt tab'
,p_static_id=>'move-nxt-tab'
,p_event_sequence=>550
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_PURCHASEORDERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161891478869236703)
,p_event_id=>wwv_flow_imp.id(161890980419236703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Detail"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161885082640236702)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>490
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161885567128236702)
,p_event_id=>wwv_flow_imp.id(161885082640236702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    l_region_id number;',
    '    l_context   apex_exec.t_context; ',
    '    l_sno_ids number; ',
    '    l_sno     varchar2(1000 CHAR);',
    '    totalrecord number;',
    '    i number;',
    'begin',
    ' --raise_application_error(-20001,''last'');',
    '    -- Get the region id for the IG',
    '    select region_id',
    '      into l_region_id',
    '      from apex_application_page_regions',
    '     where application_id = :APP_ID',
    '       and page_id        = :APP_PAGE_ID',
    '       and static_id      = ''Detail'';',
    '',
    '    -- Get the query context for the IG',
    '    l_context := apex_region.open_query_context (',
    '                        p_page_id => :APP_PAGE_ID,',
    '                        p_region_id => l_region_id );',
    '    ',
    '    totalrecord := apex_Exec.get_total_row_count(l_context);',
    '',
    ' raise_application_error(-20001,''totalrecord ''||to_char(totalrecord));',
    '    -- Get the column positions for column(s)',
    '    l_sno_ids := apex_exec.get_column_position( l_context, ''SNO'' );',
    '',
    '    -- Loop through the query of the context',
    '    i := 0 ;',
    '    while apex_exec.next_row( l_context ) loop ',
    '       i := i + 1;',
    '       if i = totalrecord then',
    '         raise_application_error(-20001,''last'');',
    '       end if;',
    '        /*if l_sno is null then',
    '            -- first row without seperator ":"',
    '            ',
    '        else    ',
    '            -- add seperator ":" to each additional row',
    '            l_sno := l_sno || '':'' || apex_exec.get_number( l_context, l_sno_ids );',
    '        end if;',
    '        */    ',
    '    end loop;',
    '',
    '    -- Set Page Item',
    '    --:P1_EMPNO_SQL := l_empno;',
    '',
    '    -- Close query context',
    '    apex_exec.close( l_context );',
    'exception',
    '      when others then        ',
    '        apex_exec.close( l_context );',
    '      raise;',
    'end;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161886098840236702)
,p_event_id=>wwv_flow_imp.id(161885082640236702)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var gridID = "Detail";',
    'var ig$ = apex.region(gridID).widget();',
    'var grid = ig$.interactiveGrid("getViews","grid");',
    'var model   = ig$.interactiveGrid("getViews","grid").model;',
    'var selectedRecords = grid.getSelectedRecords();',
    'var totalrecord = parseFloat(model.totalRecords);',
    '',
    'apex.message.alert(''fired ''+totalrecord);',
    '',
    'for (idx = 0; idx < selectedRecords.length; idx++) {',
    '',
    '    record = model.getRecord(selectedRecords[idx][0]);',
    '    apex.message.alert(''idx ''+idx+ ''selec ''+selectedRecords.length);',
    '',
    '  if (idx == selectedRecords.length){',
    '        alert();',
    '    };',
    '',
    '};',
    '',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161886488937236702)
,p_name=>'move tab1'
,p_static_id=>'move-tab-2'
,p_event_sequence=>500
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(646458929220586568)
,p_triggering_element=>'TERMSANDCONDITION'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'TERMSANDCONDITIONHEADCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161887019084236702)
,p_event_id=>wwv_flow_imp.id(161886488937236702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_TAC"].moveNext();',
    '//apex.region( "NOTE" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161887433955236702)
,p_name=>'move tab2'
,p_static_id=>'move-tab-3'
,p_event_sequence=>510
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(650730603829695332)
,p_triggering_element=>'FOOTERNOTE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'FOOTERNOTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161887851232236702)
,p_event_id=>wwv_flow_imp.id(161887433955236702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '	apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_NOTE"].moveNext();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161888254132236702)
,p_name=>'move tab3'
,p_static_id=>'move-tab-4'
,p_event_sequence=>520
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_PAYMENTADVICENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161888785325236703)
,p_event_id=>wwv_flow_imp.id(161888254132236702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Payment"].moveNext();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161889196508236703)
,p_name=>'move tab4'
,p_static_id=>'move-tab-5'
,p_event_sequence=>530
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_MOBILENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161889666667236703)
,p_event_id=>wwv_flow_imp.id(161889196508236703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Vendor"].moveNext();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161890127709236703)
,p_name=>'move tab5'
,p_static_id=>'move-tab-6'
,p_event_sequence=>540
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_MAILSTATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161890553546236703)
,p_event_id=>wwv_flow_imp.id(161890127709236703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Email"].moveNext();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161891883929236703)
,p_name=>'move tab next'
,p_static_id=>'move-tab-next'
,p_event_sequence=>560
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'DESCRIPTION'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'ITEMCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161892352868236703)
,p_event_id=>wwv_flow_imp.id(161891883929236703)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Detail"].moveNext();')).to_clob
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'ITEMSPECIFICATIONCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161884200481236700)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>480
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161884658158236700)
,p_event_id=>wwv_flow_imp.id(161884200481236700)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(646584114830787230)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'ui-dialog-titlebar-close .ui-icon')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161873283873236696)
,p_name=>'open Indent page'
,p_static_id=>'open-indent-page'
,p_event_sequence=>370
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_INDENTTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161873748568236696)
,p_event_id=>wwv_flow_imp.id(161873283873236696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P118_INDENTTNO'').getValue();',
    'var y = ''118'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P118_INDENTTNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:108:#SESSION#::NO:RP,108:P108_TNO,P108_CALLEDFROMPAGE,P108_FORMSTATUS,P108_CALLEDFROMTNO:#P118_INDENTTNO#,#P118_CALLEDFROMPAGE#,#P118_FORMSTATUS#,#P118_CALLEDFROMTNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P118_TNO#", x);',
    'url = url.replace("#P118_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P118_FORMSTATUS#", z);',
    'url = url.replace("#P118_CALLEDFROMTNO#", x1);',
    '',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161872442518236696)
,p_name=>'Open Payment advice page'
,p_static_id=>'open-payment-advice-page'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_PAYMENTADVICENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161872941858236696)
,p_event_id=>wwv_flow_imp.id(161872442518236696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P118_PAYMENTADVICETNO'').getValue();',
    'var y = ''118'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P118_TNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:140:#SESSION#::NO:RP,140:P140_TNO,P140_CALLEDFROMPAGE,P140_FORMSTATUS,P140_CALLEDFROMTNO:#P140_TNO#,#P140_CALLEDFROMPAGE#,#P140_FORMSTATUS#,#P140_CALLEDFROMTNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P140_TNO#", x);',
    'url = url.replace("#P140_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P140_FORMSTATUS#", z);',
    'url = url.replace("#P140_CALLEDFROMTNO#", x1);',
    '',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161871534213236696)
,p_name=>'Open PO Amendment No'
,p_static_id=>'open-po-amendment-no'
,p_event_sequence=>350
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_POAMENDMENTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161872014053236696)
,p_event_id=>wwv_flow_imp.id(161871534213236696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P118_POAMENDMENTTNO'').getValue();',
    'var y = ''118'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P118_TNO'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:148:#SESSION#::NO:RP,148:P148_TNO,P148_CALLEDFROMPAGE,P148_FORMSTATUS,P148_CALLEDFROMTNO:#P148_TNO#,#P148_CALLEDFROMPAGE#,#P148_FORMSTATUS#,#P148_CALLEDFROMTNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P148_TNO#", x);',
    'url = url.replace("#P148_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P148_FORMSTATUS#", z);',
    'url = url.replace("#P148_CALLEDFROMTNO#", x1);',
    '',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161862815796236691)
,p_name=>'P.O. Signed Copy Attached'
,p_static_id=>'p-o-signed-copy-attached'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161790701388236652)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161863280134236691)
,p_event_id=>wwv_flow_imp.id(161862815796236691)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_FILENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ''YES'' from ',
    'ModuleAttachment',
    'where moduletno = :P118_TNO',
    'and modulesno = :P118_MODULESNO_1')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161838651532236680)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161811459720236667)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161839693290236680)
,p_event_id=>wwv_flow_imp.id(161838651532236680)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P118_TNO,P118_COMPANYCODE,P118_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) ;--:= :P80_PICKUPREQUESTNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = '':P''||:APP_PAGE_ID||''_TNo''',
    '				and d.LoginName = User',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = '':P''||:APP_PAGE_ID||''_PASSFAILREMARK''',
    '			where a.TNo = vPassFail.TNo;',
    '			',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, '':P''||:APP_PAGE_ID||''_TNo'' , TMP, :global_CompanyCode );',
    '',
    '             if :P118_STATUS = ''ACTIVE'' then',
    '        ',
    '                CREATEPAYMENTADVICEFORPO(:P118_TNO);',
    '',
    '              end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161840180816236682)
,p_event_id=>wwv_flow_imp.id(161838651532236680)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161839237767236680)
,p_event_id=>wwv_flow_imp.id(161838651532236680)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161860079141236689)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161802064870236660)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161860587913236689)
,p_event_id=>wwv_flow_imp.id(161860079141236689)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1236356746089008121)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45594829101848189)
,p_name=>'Send Email to Party'
,p_static_id=>'send-email-to-party'
,p_event_sequence=>670
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161791892123236652)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45594927438848190)
,p_event_id=>wwv_flow_imp.id(45594829101848189)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    apex_mail.send(',
    '        p_to   => ''vibhordutt@infomatics.in'', ',
    '        p_from => ''operations@ironmart.in'',',
    '        p_body => ''Zoho SMTP test from APEX'',',
    '        p_subj => ''Test Vibhor Mail''',
    '    );',
    '',
    '    APEX_APPLICATION.g_print_success_message := ''PO email sent successfully!'';',
    '',
    '    COMMIT;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161894661426236705)
,p_name=>'SET'
,p_static_id=>'set'
,p_event_sequence=>580
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'DESCRIPTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161895236519236705)
,p_event_id=>wwv_flow_imp.id(161894661426236705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATEMEASURINGUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', 'select MEASURINGUNITCODE1 from ITEM WHERE ITEMCODE = :ITEMCODE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161892789891236705)
,p_name=>'set amount'
,p_static_id=>'set-amount'
,p_event_sequence=>570
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'QUANTITY1,QUANTITY2,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,DISCOUNTRATE,RATEAFTERDISCOUNT,RATE,AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161893294782236705)
,p_event_id=>wwv_flow_imp.id(161892789891236705)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1,QUANTITY2,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,DISCOUNTRATE,RATEAFTERDISCOUNT,RATE,AMOUNT,TOTALAMOUNT,FOOTERAMOUNT',
  'items_to_submit', 'QUANTITY1,QUANTITY2,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,DISCOUNTRATE,RATEAFTERDISCOUNT,RATE,AMOUNT,TOTALAMOUNT,TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,RATEMEASURINGUNITCODE,P118_PARTYCODE,P118_TRANSACTIONTYPECODE,P118_HSNCODE,P118_FORMSTATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    '    unit1 varchar2(30);',
    '    unit2 varchar2(30);',
    '    tmp    number;',
    '    phsn varchar(30);',
    ' ',
    'begin',
    '    :Quantity1 := round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '    select max(MULTIPLYINGFACTOR) into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;      ',
    '    :quantity2 := round(:QUANTITY1*mfactor,3);',
    '    ',
    '    if nvl(:DISCOUNTPERCENTAGE,0) > 0 then',
    '        :DISCOUNTRATE      := (nvl(:DISCOUNTPERCENTAGE,0)/100)*nvl(:WITHOUTDISCOUNTRATE,0) ;',
    '    end if;',
    '        ',
    '    :RATEAFTERDISCOUNT := nvl(:WITHOUTDISCOUNTRATE,0) - nvl(:discountrate,0) ;',
    '    :RATE              := :RATEAFTERDISCOUNT ;',
    '',
    '    select MEASURINGUNITCODE1 into unit1 from item where itemcode = :ITEMCODE;',
    '    select MEASURINGUNITCODE2 into unit2 from item where itemcode = :ITEMCODE;',
    '    ',
    '    if :RATEMEASURINGUNITCODE = unit1 then',
    '       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);',
    '    else ',
    '       :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY2,0);',
    '    end if;',
    '    :P118_DFAMOUNT   := :Amount ;',
    '    :P118_DFQUANTITY1 := :Quantity1;',
    '    select trim(hsncode) INTO :P118_HSNCODE from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   ---- INSERT INTO FOOTER DETAIL',
    '    ',
    '    if nvl(:Rate,0) > 0 then',
    '    --raise_application_error(-20000,''100'');',
    '      --RAISE_APPLICATION_ERROR(-20000,''party ''||:P118_PARTYCODE||''tr type ''||:P118_TRANSACTIONTYPECODE||'' hsn ''||:P118_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P118_DFAMOUNT||'' specs''||:itemspecificationcode);',
    '',
    '           DELETE FROM PurchaseOrderDetailFooter WHERE TNO = :TNO AND SNO = :SNO;',
    '',
    '            for vTaxRule',
    '            				in (',
    '            					select',
    '            						rownum as slno,',
    '            						b.TNo,',
    '            						b.SNO,',
    '            						a.LegendsCode,',
    '            						c.FooterHeadCode,',
    '            						c.FooterHeadName,',
    '            						b.TaxRate as FooterPercent,',
    '                                    (:AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '            					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, party F',
    '            					where a.TNO = b.TNo',
    '            						and a.SNO = b.SNo',
    '            						and b.FooterHeadCode = c.FooterHeadCode',
    '            						and a.TNO = d.TNo',
    '                                    and d.tno = e.tno',
    '                                    and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                                    and f.PartyCode = :P118_PARTYCODE',
    '                                    And d.transactiontypecode = :P118_TRANSACTIONTYPECODE',
    '                                    and e.HSNCODE = :P118_HSNCODE',
    '                                    ',
    '            					--order by b.SNo',
    '            				)',
    '            			loop',
    '           -- raise_application_error(-20000,phsn);	',
    '           --if nvl(:rate,0) > 0 then',
    '           --RAISE_APPLICATION_ERROR(-20000,''party ''||:P118_PARTYCODE||''tr type ''||:P118_TRANSACTIONTYPECODE||'' hsn ''||:P118_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P118_DFAMOUNT||'' specs''||:itemspecificationcode||'' footervalue ''||vTaxRul'
||'e.FooterValue);',
    '           --end if;',
    '            			    Insert into PurchaseOrderDetailFooter',
    '                            (tno,sno,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '            				values',
    '                            (:TNO,:SNO,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '            			',
    '            			end loop; -- for vTaxRule',
    '                        commit;',
    '        end if;',
    '',
    '   ----',
    '   SELECT SUM(FOOTERVALUE) INTO :footeramount from PurchaseOrderDetailFooter',
    '   where tno = :TNO',
    '     and sno = :SNO;',
    '   ',
    '   :Totalamount := nvl(:amount,0) + nvl(:footeramount,0);',
    '',
    'end;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161894298155236705)
,p_event_id=>wwv_flow_imp.id(161892789891236705)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(646584114830787230)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161893831647236705)
,p_event_id=>wwv_flow_imp.id(161892789891236705)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'setTimeout(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let quantity1_total = 0;',
    'let quantity2_total = 0;',
    'let discountrate_total = 0;',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    '',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '    if (model.getValue(record, "QUANTITY2") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity2_total += Number(model.getValue(record, "QUANTITY2"));',
    '    }',
    '    if (model.getValue(record, "DISCOUNTRATE") !== "" && !meta.deleted && !meta.agg) {',
    '        discountrate_total += Number(model.getValue(record, "DISCOUNTRATE"));',
    '    }',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '});',
    '',
    '$s(''P118_SUMOFAMOUNT'',amount_total);',
    '$s(''P118_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P118_PURCHASEORDERAMOUNT'',totalamount_total);',
    '',
    '},400',
    ');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161898866925236708)
,p_name=>'set balance qty'
,p_static_id=>'set-balance-qty'
,p_event_sequence=>610
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'ITEMCODE,ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161899440633236708)
,p_event_id=>wwv_flow_imp.id(161898866925236708)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_BALANCEQTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,P118_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(nvl(b.quantity1 , 0)) from loadingadvice a , loadingadvicedetail b ',
    'where a.tno = b.tno   ',
    'and a.purchaseordertno = :P118_TNO',
    'and b.itemcode = :itemcode',
    'and b.itemspecificationcode = :itemspecificationcode')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161863662204236691)
,p_name=>'Set Currency Value'
,p_static_id=>'set-currency-value'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_CURRENCYUNITCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161864216262236691)
,p_event_id=>wwv_flow_imp.id(161863662204236691)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_CURRENCYVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_CURRENCYUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select CURRENCYVALUE from currencyunit',
    'where CURRENCYUNITCODE = :P118_CURRENCYUNITCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161874189630236696)
,p_name=>'set decimal on qty2'
,p_static_id=>'set-decimal-on-qty'
,p_event_sequence=>380
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161874665257236697)
,p_event_id=>wwv_flow_imp.id(161874189630236696)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY2,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161856399074236688)
,p_name=>'Set Footer Total'
,p_static_id=>'set-footer-total'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(161807963397236664)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161857376112236688)
,p_event_id=>wwv_flow_imp.id(161856399074236688)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget = apex.region(''Detail'').widget();',
    'var grid = widget.interactiveGrid("getViews", "grid");',
    'var model = grid.model;',
    'var amount = 0',
    'var totalfooter=0;',
    '',
    '// Get the selected records',
    'var selectedRecords = grid.getSelectedRecords();',
    '',
    '// Iterate over the selected records and set a value in a specific column',
    'for (var i = 0; i < selectedRecords.length; i++) {',
    '  var record = selectedRecords[i];',
    '  amount        = model.getValue(record,''AMOUNT'');',
    '',
    '  var columnAlias1 = "FOOTERAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value1 = $v("P118_FVALUE"); // Replace with the new value you want to set',
    '  var columnAlias2 = "TOTALAMOUNT"; // Replace with the alias of the column you want to set a value for',
    ' // var value2 =  (parseInt($v("P118_FVALUE"), 10)+ parseInt($v("P118_DFAMOUNT"), 10)).toString(); // Replace with the new value you want to set',
    '  var value2 = parseFloat($v("P118_FVALUE")) + parseFloat(amount) ;',
    '',
    '  model.setValue(record, columnAlias1, value1);',
    '  //model.setValue(record, columnAlias2, value2);',
    '}',
    '',
    '',
    '//var selectedRowIds = grid.getSelectedRowIds();',
    '//var view = grid.view();',
    '//// Iterate over the array to access each selected row ID',
    '////for (var i = 0; i < selectedRowIds.length; i++) {',
    '////  var rowId = selectedRowIds[i];',
    '////  // Access or manipulate the row ID as needed',
    '////}',
    '//var rowId = selectedRecords[0];',
    '//view.setSelection(rowId, false);',
    '//console.log(apex.region(''Detail'').getSelectedRowIds())',
    '//console.log(apex.region(''Detail'').getViewId())',
    '//grid.refresh();')))).to_clob
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_element=>'P118_FVALUE'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161856913070236688)
,p_event_id=>wwv_flow_imp.id(161856399074236688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_FVALUE,P118_DFAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_FVALUE,P118_DFAMOUNT',
  'sql_query', 'select :P118_FVALUE, :P118_DFAMOUNT from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161876852608236697)
,p_name=>'set hsn'
,p_static_id=>'set-hsn'
,p_event_sequence=>410
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_ITEMSPECIFICATION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161877401613236697)
,p_event_id=>wwv_flow_imp.id(161876852608236697)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_ITEMSPECIFICATION',
  'sql_query', 'select hsncode from itemspecification where itemspecificationcode = :p118_itemspecification;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161848174405236685)
,p_name=>'set hsn code'
,p_static_id=>'set-hsn-code'
,p_event_sequence=>130
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161848705699236685)
,p_event_id=>wwv_flow_imp.id(161848174405236685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', 'select hsncode from itemspecification where itemspecificationcode = :itemspecificationcode;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161849235825236685)
,p_event_id=>wwv_flow_imp.id(161848174405236685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', ' select hsncode from itemspecification where itemspecificationcode =  :itemspecificationcode',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161902549644236710)
,p_name=>'set indent'
,p_static_id=>'set-indent'
,p_event_sequence=>640
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_QUOTATIONTNO'
,p_condition_element=>'P118_QUOTATIONTNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161903136813236710)
,p_event_id=>wwv_flow_imp.id(161902549644236710)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_INDENTTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_QUOTATIONTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT',
    '    indenttno',
    'FROM',
    '    enquiryindentdetail',
    'WHERE',
    '    tno IN (',
    '        SELECT',
    '            enquirytno',
    '        FROM',
    '            quotation',
    '        WHERE',
    '            tno = :p118_quotationtno',
    '    )')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45595853832848199)
,p_name=>'Set Mail Status css styles on Page Load'
,p_static_id=>'set-mail-status-css-styles-on-page-load'
,p_event_sequence=>680
,p_condition_element=>'P118_MAILSTATUS'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45595967554848200)
,p_event_id=>wwv_flow_imp.id(45595853832848199)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var status  = $v(''P118_MAILSTATUS'');',
    'var $item   = $(''#P118_MAILSTATUS'');',
    'var $display = $item.closest(''.t-Form-fieldContainer'');',
    '',
    '$display.removeClass(''has-success has-error has-warning'');',
    '',
    'if (status === ''SUCCESS'') {',
    '    $item.css({''color'': ''#28a745'', ''font-weight'': ''600''});',
    '} else if (status === ''FAILED'') {',
    '    $item.css({''color'': ''#dc3545'', ''font-weight'': ''600''});',
    '} else if (status === ''NO_EMAIL'' || status === ''NO_FILE'') {',
    '    $item.css({''color'': ''#fd7e14'', ''font-weight'': ''600''});',
    '} else if (status === ''NO_DATA'') {',
    '    $item.css({''color'': ''#6c757d'', ''font-weight'': ''600''});',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161861912677236691)
,p_name=>'Set Office Email'
,p_static_id=>'set-office-email'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161862394262236691)
,p_event_id=>wwv_flow_imp.id(161861912677236691)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_OFFICEEMAIL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_PARTYCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select officeemail from party',
    'where partycode = :P118_PARTYCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161847332008236685)
,p_name=>'Set page item sno'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161847769418236685)
,p_event_id=>wwv_flow_imp.id(161847332008236685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno,',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "SNO");',
    '',
    'apex.item( "P118_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161864579178236691)
,p_name=>'Set POAdvance Amount'
,p_static_id=>'set-poadvance-amount'
,p_event_sequence=>290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_ISFULLADVANCE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161866101034236692)
,p_event_id=>wwv_flow_imp.id(161864579178236691)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#P118_POADVANCEAMOUNT").prop(''readonly'', true);',
    '')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ISFULLADVANCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161866586565236692)
,p_event_id=>wwv_flow_imp.id(161864579178236691)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("#P118_POADVANCEAMOUNT").prop(''readonly'', false);',
    '')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ISFULLADVANCE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161865119356236692)
,p_event_id=>wwv_flow_imp.id(161864579178236691)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_POADVANCEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_PURCHASEORDERAMOUNT',
  'sql_query', 'select :P118_PURCHASEORDERAMOUNT from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ISFULLADVANCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161865633302236692)
,p_event_id=>wwv_flow_imp.id(161864579178236691)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_POADVANCEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'select 0 from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ISFULLADVANCE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161875063023236697)
,p_name=>'Set Qty1'
,p_static_id=>'set-qty'
,p_event_sequence=>390
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'QUANTITY2'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'QUANTITY2'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161875594458236697)
,p_event_id=>wwv_flow_imp.id(161875063023236697)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY2,ITEMSPECIFICATIONCODE,UNIT2',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return to_number(:QUANTITY2/mfactor);',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'QUANTITY2'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161868753360236694)
,p_name=>'Set Quantity2'
,p_static_id=>'set-quantity'
,p_event_sequence=>320
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161869292575236694)
,p_event_id=>wwv_flow_imp.id(161868753360236694)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,QUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return round(:QUANTITY1*mfactor,3);',
    '    exception when others then',
    '        null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(166588510665955061)
,p_name=>'set quotation no'
,p_static_id=>'set-quotation-no'
,p_event_sequence=>650
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_COMPARATIVESTATEMENTTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(166588621442955062)
,p_event_id=>wwv_flow_imp.id(166588510665955061)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_QUOTATIONTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_PURCHASEORDERDATE,P118_COMPARATIVESTATEMENTTNO,P118_PARTYCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT',
    'A.TNO',
    'FROM Quotation a, DocumentStatusDetail b, party c, vendor d',
    'where a.TNo = b.ModuleTNo',
    'and b.Modulecode = ''QUOTATION''',
    'and b.DocumentStatusCode = ''ACTIVE''',
    'and c.vendorcode = d.vendorcode',
    'and a.QuotationDate <= :P118_PurchaseOrderDate',
    'and c.PartyCode = :P118_PartyCode',
    'and a.CompanyCode = :global_CompanyCode',
    'and exists(',
    '       select',
    '            aa.tno',
    '       from Comparativestatementitem aa',
    '       where aa.TNO = :P118_ComparativeStatementTNo',
    '           and aa.QuotationTNo = a.TNO',
    '',
    '   )',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161849639280236685)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(646584114830787230)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161850126757236685)
,p_event_id=>wwv_flow_imp.id(161849639280236685)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERHEADCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '      SNO',
    'From  FOOTERSCHEMEDETAIL',
    'Where FooterHeadCode = :FOOTERHEADCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(54096301945517767)
,p_name=>'Set the Default Party Email'
,p_static_id=>'set-the-default-party-email'
,p_event_sequence=>700
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(52668293295987216)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54096445391517769)
,p_event_id=>wwv_flow_imp.id(54096301945517767)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Make To_Email Readonly'
,p_static_id=>'make-to-email-readonly'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var email = $(''#P118_OFFICEEMAIL'');',
    'email.prop(''readonly'', true);       // make it readonly',
    'email.css(''font-weight'', ''bold'');   // make it bold')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54096344057517768)
,p_event_id=>wwv_flow_imp.id(54096301945517767)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_OFFICEEMAIL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_PARTYCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(officeemail,''No_Email_Found@test.in'') from party',
    'where partycode = :P118_PARTYCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161869680193236694)
,p_name=>'Set Transaction'
,p_static_id=>'set-transaction'
,p_event_sequence=>330
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161870232434236694)
,p_event_id=>wwv_flow_imp.id(161869680193236694)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_TRANSACTIONTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P118_PARTYCODE,P118_LOCATIONCODE,P118_DOCTYPECODE,P118_COMPANYCODE,P118_PURCHASEORDERDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    'GetTransactionTypeCodeFor(:P118_PARTYCODE , :P118_LOCATIONCODE , :P118_DOCTYPECODE , :P118_COMPANYCODE , :P118_PURCHASEORDERDATE) as A   ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161877811523236697)
,p_name=>'Set Unit'
,p_static_id=>'set-unit'
,p_event_sequence=>420
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(643521010222379453)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161878262914236697)
,p_event_id=>wwv_flow_imp.id(161877811523236697)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNIT1,UNIT2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', 'select GetMeasuringUnitNameFromItem(:ITEMCODE) as unit1, GetMeasuringUnit2NameFromItem(:ITEMCODE) as unit2 from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161878757586236699)
,p_event_id=>wwv_flow_imp.id(161877811523236697)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATEMEASURINGUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', 'select MEASURINGUNITCODE1 from ITEM WHERE ITEMCODE = :ITEMCODE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161854642407236688)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>190
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(646584114830787230)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161855127887236688)
,p_event_id=>wwv_flow_imp.id(161854642407236688)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("FooterDetail").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseInt(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P118_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(161881522476236699)
,p_name=>'skip focus to partycode '
,p_static_id=>'skip-focus-to-partycode'
,p_event_sequence=>450
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_PURCHASEORDERDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM CODESCHEME A',
'WHERE A.MODULECODE = getmodulecodeforpageno(:APP_PAGE_ID)',
'AND CODESCHEME=''AUTO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(161882000479236700)
,p_event_id=>wwv_flow_imp.id(161881522476236699)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(44535255592019112)
,p_name=>'Upload File'
,p_static_id=>'upload-file'
,p_event_sequence=>660
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(45592658021848167)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'PLUGIN_DE.DANIELH.DROPZONE2|REGION TYPE|dropzone-upload-success'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44535461929019114)
,p_event_id=>wwv_flow_imp.id(44535255592019112)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P118_FILE_TNO,P118_FILENAME',
  'items_to_submit', 'P118_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    l_tno           BINARY_STORE.TNO%TYPE;',
    '    l_last_filename BINARY_STORE.FILE_NAME%TYPE;',
    '    v_collection    CONSTANT VARCHAR2(100) := ''DROPZONE_UPLOAD'';',
    'BEGIN',
    '    IF APEX_COLLECTION.COLLECTION_EXISTS(v_collection) THEN',
    '        ',
    '        -- Loop through the collection',
    '        FOR r IN (',
    '            SELECT c001, c002, blob001 ',
    '            FROM apex_collections ',
    '            WHERE collection_name = v_collection',
    '            ORDER BY seq_id DESC -- Processing most recent first',
    '        ) LOOP',
    '            ',
    '            INSERT INTO BINARY_STORE (',
    '                REFERENCE_TNO, ',
    '                REFERENCE_MODULE, ',
    '                FILE_NAME, ',
    '                MIME_TYPE, ',
    '                FILE_DATA',
    '            ) VALUES (',
    '                :P118_TNO, ',
    '                ''PURCHASEORDER'',',
    '                r.c001, ',
    '                r.c002, ',
    '                r.blob001',
    '            ) RETURNING TNO, FILE_NAME INTO l_tno, l_last_filename;',
    '',
    '        END LOOP;',
    '',
    '        -- Assign the last processed file info to page items',
    '        :P118_FILE_TNO := l_tno;',
    '        :P118_FILENAME := l_last_filename;',
    '',
    '        -- Efficiently clear the collection',
    '        APEX_COLLECTION.DELETE_COLLECTION(v_collection);',
    '    END IF;',
    '',
    'EXCEPTION',
    '    WHEN OTHERS THEN',
    '        apex_debug.error(''Collection Upload Error: '' || SQLERRM);',
    '        RAISE;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44535578781019115)
,p_event_id=>wwv_flow_imp.id(44535255592019112)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_FILENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45596964714848210)
,p_event_id=>wwv_flow_imp.id(44535255592019112)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'plugin-uc-notifications'
,p_action=>'PLUGIN_UC_NOTIFICATIONS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'success',
  'attribute_02', 'static',
  'attribute_03', 'Success',
  'attribute_04', 'File Successfully Uploaded',
  'attribute_09', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(54096862355517773)
,p_name=>'Validate Correct CC_Email Address'
,p_static_id=>'validate-correct-cc-email-address'
,p_event_sequence=>720
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_EMAIL_CC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54097071858517775)
,p_event_id=>wwv_flow_imp.id(54096862355517773)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Multi Email Validate'
,p_static_id=>'multi-email-validate'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var emailField = apex.item(''P118_EMAIL_CC'');',
    'var emailValue = emailField.getValue();',
    '',
    'if (emailValue) {',
    '    // Comma (,) ya Semicolon (;) dono se split karne ke liye',
    '    var emails = emailValue.split(/[\s,;]+/); ',
    '    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;',
    '    var invalidEmails = [];',
    '',
    '    // Har ek email ko loop mein check karein',
    '    emails.forEach(function(email) {',
    '        email = email.trim(); // Extra spaces hatane ke liye',
    '        if (email.length > 0 && !emailRegex.test(email)) {',
    '            invalidEmails.push(email);',
    '        }',
    '    });',
    '',
    '    // Agar koi email invalid mila toh error dikhayein',
    '    if (invalidEmails.length > 0) {',
    '        apex.message.alert(''These emails are invalid: '' + invalidEmails.join('', ''));',
    '        // Optional: Aap chahein toh field clear kar sakte hain',
    '        // emailField.setValue('''');',
    '    }',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54096972411517774)
,p_event_id=>wwv_flow_imp.id(54096862355517773)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Single Email Validate'
,p_static_id=>'single-email-validate'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var emailField = apex.item(''P118_OFFICEEMAIL'');',
    'var emailValue = emailField.getValue();',
    'var regex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;',
    '',
    'if (emailValue && !regex.test(emailValue)) {',
    '    // Show an error alert',
    '    apex.message.alert(''Please enter a valid email address.'');',
    '    ',
    '    // Optional: Clear the invalid value and clear focus',
    '    emailField.setValue('''');',
    '}',
    '')))).to_clob
,p_build_option_id=>wwv_flow_imp.id(566229566348256666)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(54096544535517770)
,p_name=>'Validate Correct TO_Email Address'
,p_static_id=>'validate-correct-to-email-address'
,p_event_sequence=>710
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P118_OFFICEEMAIL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54096789669517772)
,p_event_id=>wwv_flow_imp.id(54096544535517770)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Multi Email Validate'
,p_static_id=>'multi-email-validate'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var emailField = apex.item(''P118_OFFICEEMAIL'');',
    'var emailValue = emailField.getValue();',
    '',
    'if (emailValue) {',
    '    // Comma (,) ya Semicolon (;) dono se split karne ke liye',
    '    var emails = emailValue.split(/[\s,;]+/); ',
    '    var emailRegex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;',
    '    var invalidEmails = [];',
    '',
    '    // Har ek email ko loop mein check karein',
    '    emails.forEach(function(email) {',
    '        email = email.trim(); // Extra spaces hatane ke liye',
    '        if (email.length > 0 && !emailRegex.test(email)) {',
    '            invalidEmails.push(email);',
    '        }',
    '    });',
    '',
    '    // Agar koi email invalid mila toh error dikhayein',
    '    if (invalidEmails.length > 0) {',
    '        apex.message.alert(''These emails are invalid: '' + invalidEmails.join('', ''));',
    '        // Optional: Aap chahein toh field clear kar sakte hain',
    '        // emailField.setValue('''');',
    '    }',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54096678316517771)
,p_event_id=>wwv_flow_imp.id(54096544535517770)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Single Email Validate'
,p_static_id=>'single-email-validate'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var emailField = apex.item(''P118_OFFICEEMAIL'');',
    'var emailValue = emailField.getValue();',
    'var regex = /^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/;',
    '',
    'if (emailValue && !regex.test(emailValue)) {',
    '    // Show an error alert',
    '    apex.message.alert(''Please enter a valid email address.'');',
    '    ',
    '    // Optional: Clear the invalid value and clear focus',
    '    emailField.setValue('''');',
    '}',
    '')))).to_clob
,p_build_option_id=>wwv_flow_imp.id(566229566348256666)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161821754497236672)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'check advance amount'
,p_static_id=>'check-advance-amount'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if to_number(:P118_POADVANCEAMOUNT) > to_number(:P118_PURCHASEORDERAMOUNT) then',
'    raise_application_error(-20000,''Advance Amount Cannot Be greater than PO Amount'');',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61081710505557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161819014785236671)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'check ship to buyer'
,p_static_id=>'check-ship-to-buyer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P118_SHIPTO = ''BUYER'' then',
'    if :P118_CUSTOMERCODE is null then',
'        raise_application_error(-20000,''Customer is required in case of ship to buyer selected.'');',
'    end if;',
'    if :P118_PENDINGSOTNO is null then',
'        raise_application_error(-20000,''Sales Order is required in case of ship to buyer selected.'');',
'    end if;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61078970793557114
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161823398626236674)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from purchaseorderdetail where tno = :P118_TNO;',
'delete from purchaseorderdetailfooter where tno = :P118_TNO;',
'delete from purchaseorderfooter where tno = :P118_TNO;',
'delete from purchaseordertac where tno = :P118_TNO;',
'delete from purchaseorderfn where tno = :P118_TNO;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(161813894054236667)
,p_internal_uid=>61083354634557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161821346427236672)
,p_process_sequence=>230
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P118_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61081302435557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161725412695236607)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(643521010222379453)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    if nvl(:rate ,0) = 0 then',
'        raise_application_error(-20001, ''Rate Should Not Zero'');',
'    end if;',
'    if nvl(:WITHOUTDISCOUNTRATE ,0) = 0 then',
'        raise_application_error(-20002, ''Without Discount Rate Should Not Zero'');',
'    end if;',
'',
'    if nvl(:quantity1 ,0) = 0 then',
'        raise_application_error(-20003, ''Quantity Should Not Zero'');',
'    end if;',
'    if nvl(:rateafterdiscount ,0) = 0 then',
'        raise_application_error(-20004, ''Rate After Discount Should Not Zero'');',
'    end if;',
'    if :ITEMCODE is not null  then',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into purchaseorderdetail (                 ',
'                    TNO,',
'                    SNO,',
'                    INDENTTNO,',
'                    ITEMCODE,',
'                    ITEMSPECIFICATIONCODE,',
'                    DESCRIPTION,',
'                    QUANTITY1,',
'                    QUANTITY2,',
'                    TOLERANCE,',
'                    RECEIVEDQUANTITY1,',
'                    RECEIVEDQUANTITY2,',
'                    RATEMEASURINGUNITCODE,',
'                    RATE,',
'                    AMOUNT,',
'                    FOOTERAMOUNT,',
'                    TOTALAMOUNT,',
'                    REMARK,',
'                    DOCUMENTSTATUSCODE,',
'                    MATERIALINQUANTITY1,',
'                    MATERIALINQUANTITY2,',
'                    LOWERTOLERANCEPERCENT,',
'                    HIGHERTOLERANCEPERCENT,',
'                    PURCHASEBILLQUANTITY1,',
'                    PURCHASEBILLQUANTITY2,',
'                    GATEPASSQUANTITY1,',
'                    GATEPASSQUANTITY2,',
'                    ACCEPTEDQUANTITY1,',
'                    ACCEPTEDQUANTITY2,',
'                    INSPECTEDQUANTITY1,',
'                    INSPECTEDQUANTITY2,',
'                    JOININSPECTEDQUANTITY1,',
'                    JOININSPECTEDQUANTITY2,',
'                    JOINACCEPTEDQUANTITY1,',
'                    JOINACCEPTEDQUANTITY2,',
'                    CHALANQUANTITY1,',
'                    CHALANQUANTITY2,',
'                    PBPASSQUANTITY1,',
'                    PBPASSQUANTITY2,',
'                    SHORTAGETOLERANCE,',
'                    SHORTAGEDEDUCTIONFROM,',
'                    SHORTAGETOLERANCEMETHOD,',
'                    TAXRULECODE,',
'                    DEDUCTIONBASISCODE,',
'                    DEDUCTIONRATE,',
'                    --PRORATA,',
'                    --QUALITYCODE,',
'                    WITHOUTDISCOUNTRATE,',
'                    DISCOUNTPERCENTAGE,',
'                    DISCOUNTRATE,',
'                    RATEAFTERDISCOUNT,',
'                    ISRATEINCLUSIVETAX,',
'                    FREIGHTDEDUCTIONRATE',
'',
'            )',
'            Values (',
'                :TNO,',
'                :SNO,',
'                :INDENTTNO,',
'                :ITEMCODE,',
'                :ITEMSPECIFICATIONCODE,',
'                :DESCRIPTION,',
'                :QUANTITY1,',
'                :QUANTITY2,',
'                :TOLERANCE,',
'                :RECEIVEDQUANTITY1,',
'                :RECEIVEDQUANTITY2,',
'                :RATEMEASURINGUNITCODE,',
'                :RATE,',
'                :AMOUNT,',
'                :FOOTERAMOUNT,',
'                nvl(:AMOUNT,0) + nvl(:FOOTERAMOUNT,0),',
'                :REMARK,',
'                :DOCUMENTSTATUSCODE,',
'                :MATERIALINQUANTITY1,',
'                :MATERIALINQUANTITY2,',
'                :LOWERTOLERANCEPERCENT,',
'                :HIGHERTOLERANCEPERCENT,',
'                :PURCHASEBILLQUANTITY1,',
'                :PURCHASEBILLQUANTITY2,',
'                :GATEPASSQUANTITY1,',
'                :GATEPASSQUANTITY2,',
'                :ACCEPTEDQUANTITY1,',
'                :ACCEPTEDQUANTITY2,',
'                :INSPECTEDQUANTITY1,',
'                :INSPECTEDQUANTITY2,',
'                :JOININSPECTEDQUANTITY1,',
'                :JOININSPECTEDQUANTITY2,',
'                :JOINACCEPTEDQUANTITY1,',
'                :JOINACCEPTEDQUANTITY2,',
'                :CHALANQUANTITY1,',
'                :CHALANQUANTITY2,',
'                :PBPASSQUANTITY1,',
'                :PBPASSQUANTITY2,',
'                :SHORTAGETOLERANCE,',
'                :SHORTAGEDEDUCTIONFROM,',
'                :SHORTAGETOLERANCEMETHOD,',
'                :TAXRULECODE,',
'                :DEDUCTIONBASISCODE,',
'                :DEDUCTIONRATE,',
'                --:PRORATA,',
'                --:QUALITYCODE,',
'                :WITHOUTDISCOUNTRATE,',
'                :DISCOUNTPERCENTAGE,',
'                :DISCOUNTRATE,',
'                :RATEAFTERDISCOUNT,',
'                :ISRATEINCLUSIVETAX,',
'                :FREIGHTDEDUCTIONRATE',
'',
'            );',
'        ',
'        when ''U'' then',
'            update purchaseorderdetail Set',
'                  TNO=:TNO,',
'                    SNO=:SNO,',
'                    INDENTTNO=:INDENTTNO,',
'                    ITEMCODE=:ITEMCODE,',
'                    ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE,',
'                    DESCRIPTION=:DESCRIPTION,',
'                    QUANTITY1=:QUANTITY1,',
'                    QUANTITY2=:QUANTITY2,',
'                    TOLERANCE=:TOLERANCE,',
'                    RECEIVEDQUANTITY1=:RECEIVEDQUANTITY1,',
'                    RECEIVEDQUANTITY2=:RECEIVEDQUANTITY2,',
'                    RATEMEASURINGUNITCODE=:RATEMEASURINGUNITCODE,',
'                    RATE=:RATE,',
'                    AMOUNT=:AMOUNT,',
'                    FOOTERAMOUNT=:FOOTERAMOUNT,',
'                    TOTALAMOUNT=:TOTALAMOUNT,',
'                    REMARK=:REMARK,',
'                    DOCUMENTSTATUSCODE=:DOCUMENTSTATUSCODE,',
'                    MATERIALINQUANTITY1=:MATERIALINQUANTITY1,',
'                    MATERIALINQUANTITY2=:MATERIALINQUANTITY2,',
'                    LOWERTOLERANCEPERCENT=:LOWERTOLERANCEPERCENT,',
'                    HIGHERTOLERANCEPERCENT=:HIGHERTOLERANCEPERCENT,',
'                    PURCHASEBILLQUANTITY1=:PURCHASEBILLQUANTITY1,',
'                    PURCHASEBILLQUANTITY2=:PURCHASEBILLQUANTITY2,',
'                    GATEPASSQUANTITY1=:GATEPASSQUANTITY1,',
'                    GATEPASSQUANTITY2=:GATEPASSQUANTITY2,',
'                    ACCEPTEDQUANTITY1=:ACCEPTEDQUANTITY1,',
'                    ACCEPTEDQUANTITY2=:ACCEPTEDQUANTITY2,',
'                    INSPECTEDQUANTITY1=:INSPECTEDQUANTITY1,',
'                    INSPECTEDQUANTITY2=:INSPECTEDQUANTITY2,',
'                    JOININSPECTEDQUANTITY1=:JOININSPECTEDQUANTITY1,',
'                    JOININSPECTEDQUANTITY2=:JOININSPECTEDQUANTITY2,',
'                    JOINACCEPTEDQUANTITY1=:JOINACCEPTEDQUANTITY1,',
'                    JOINACCEPTEDQUANTITY2=:JOINACCEPTEDQUANTITY2,',
'                    CHALANQUANTITY1=:CHALANQUANTITY1,',
'                    CHALANQUANTITY2=:CHALANQUANTITY2,',
'                    PBPASSQUANTITY1=:PBPASSQUANTITY1,',
'                    PBPASSQUANTITY2=:PBPASSQUANTITY2,',
'                    SHORTAGETOLERANCE=:SHORTAGETOLERANCE,',
'                    SHORTAGEDEDUCTIONFROM=:SHORTAGEDEDUCTIONFROM,',
'                    SHORTAGETOLERANCEMETHOD=:SHORTAGETOLERANCEMETHOD,',
'                    TAXRULECODE=:TAXRULECODE,',
'                    DEDUCTIONBASISCODE=:DEDUCTIONBASISCODE,',
'                    DEDUCTIONRATE=:DEDUCTIONRATE,',
'                    --PRORATA=:PRORATA,',
'                    --QUALITYCODE=:QUALITYCODE,',
'                    WITHOUTDISCOUNTRATE=:WITHOUTDISCOUNTRATE,',
'                    DISCOUNTPERCENTAGE=:DISCOUNTPERCENTAGE,',
'                    DISCOUNTRATE=:DISCOUNTRATE,',
'                    RATEAFTERDISCOUNT=:RATEAFTERDISCOUNT,',
'                    ISRATEINCLUSIVETAX=:ISRATEINCLUSIVETAX,',
'                    FREIGHTDEDUCTIONRATE=:FREIGHTDEDUCTIONRATE',
'',
'            WHERE TNO = :P118_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From purchaseorderdetail',
'            Where TNo = :P118_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'    else ',
'        raise_application_error(-20000,''Please check ITEM, RATE , AMOUNT.'');',
'    end if;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>60985368703557050
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45594474862848185)
,p_process_sequence=>160
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch the attached file from Binary Store'
,p_static_id=>'fetch-the-attached-file-from-binary-store'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_file_tno BINARY_STORE.TNO%TYPE;',
'BEGIN',
'    SELECT TNO ',
'    INTO   v_file_tno',
'    FROM   BINARY_STORE ',
'    WHERE  REFERENCE_TNO = :P118_TNO',
'    ORDER BY TNO DESC',
'    FETCH FIRST 1 ROW ONLY;',
'',
'    :P118_FILE_TNO := v_file_tno;',
'',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'        :P118_FILE_TNO := NULL; ',
'    WHEN OTHERS THEN',
'        RAISE_APPLICATION_ERROR(-20001, ''Error retrieving file: '' || SQLERRM);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35668952546321619
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(54097419382517778)
,p_process_sequence=>170
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch the Email Status'
,p_static_id=>'fetch-the-email-status'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_mail_Id        PURCHASEORDER.MAILID%TYPE;',
'    v_mail_Status   PURCHASEORDER.MAILID%TYPE;',
'BEGIN',
'    SELECT ',
'           MailID ,',
unistr('           CASE WHEN po.MailID IS NULL THEN ''\274C Not Sent'''),
unistr('                WHEN EXISTS (SELECT 1 FROM apex_mail_queue q WHERE q.ID = po.MailID) THEN ''\23F3 Sending (In Queue)'''),
unistr('                WHEN EXISTS (SELECT 1 FROM apex_mail_log l WHERE l.Mail_ID = po.MailID AND l.mail_send_error IS NULL) THEN ''\2705 Sent Successfully'''),
unistr('                WHEN EXISTS (SELECT 1 FROM apex_mail_log l WHERE l.Mail_ID = po.MailID AND l.mail_send_error IS NOT NULL) THEN ''\26A0\FE0F Delivery Failed'''),
unistr('                ELSE ''\2753 Unknown Status'''),
'            END AS email_status ',
'        INTO :P118_HIDDEN_MAIL_ID, :P118_MAILSTATUS',
'    FROM   PURCHASEORDER po',
'    WHERE  po.TNO = :P118_TNO',
'    ORDER BY po.TNO DESC',
'    FETCH FIRST 1 ROW ONLY;',
'',
'',
'EXCEPTION',
'    WHEN NO_DATA_FOUND THEN',
'        :P118_HIDDEN_MAIL_ID := NULL; ',
'        :P118_MAILSTATUS    := NULL;',
'    WHEN OTHERS THEN',
'        RAISE_APPLICATION_ERROR(-20001, ''Error retrieving file: '' || SQLERRM);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>44171897065991212
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161809672707236666)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(646584114830787230)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'FooterDetail - Save Interactive Grid Data'
,p_static_id=>'footerdetail-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>61069628715557109
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161823040702236674)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No'
,p_static_id=>'get-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P118_Tno is null then',
'        Select GlobalTno.NextVal into :P118_Tno From Dual;',
'     end if;',
'    ----',
'    if :P118_PURCHASEORDERNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P118_LocationCode,',
'					:P118_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P118_PURCHASEORDERDATE, ''DD-MM-RRRR'')',
'				);',
'        :P118_PURCHASEORDERNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P118_LocationCode,',
'                    :P118_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P118_PURCHASEORDERDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61082996710557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161822207327236672)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P118_TNO is null then',
'    :P118_TNO := GlobalTNo.nextval;',
'    :P118_FORMSTATUS := ''NEWRECORD'';',
'    :P118_SHIPTO := ''WAREHOUSE'';',
'  ',
'else',
'    :P118_FORMSTATUS := ''EDITRECORD'';',
'   ',
'End if;',
'',
':P118_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P118_TNO), ''Status'');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>61082163335557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161822559174236672)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetOnTheTable'
,p_static_id=>'getonthetable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P118_MODULEFLOW := ''YES'';',
'   else',
'       :P118_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P118_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P118_ONTHETABLE := ''YES'' ;',
'   else',
'       :P118_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>61082515182557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161798422184236655)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(650733334331695359)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form E-Mail'
,p_static_id=>'initialize-form-e-mail'
,p_internal_uid=>61058378192557098
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161747714598236621)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(646225442166544647)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Purchase Order'
,p_static_id=>'initialize-form-purchase-order'
,p_internal_uid=>61007670606557064
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161789607687236650)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(650731749442695343)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Vendor Accptance'
,p_static_id=>'initialize-form-vendor-accptance'
,p_internal_uid=>61049563695557093
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25948430056256770)
,p_process_sequence=>200
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert into indent'
,p_static_id=>'insert-into-indent'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tmp number;',
'begin',
'    ',
'	  if :P118_ISOPENSPEC = ''YES'' then',
'			  createindentfrompo(:P118_TNO);',
'	  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>16022907739730204
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161824963649236674)
,p_process_sequence=>190
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert into ma_acceptance'
,p_static_id=>'insert-into-ma-acceptance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tmp number;',
'begin',
'    select count(*) into tmp from ma_acceptance x where x.moduletno = :P118_TNO;',
'	  if nvl(tmp,0) = 0 then',
'			  insert into ma_acceptance ( tno, modulecode,moduletno )',
'			  values ( globaltno.nextval,GetModuleCodeForPageNo(:APP_PAGE_ID),:P118_TNO);',
'	  end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61084919657557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161825403813236674)
,p_process_sequence=>210
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Insert into Payment Advice'
,p_static_id=>'insert-into-payment-advice'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tpaymentadvice number;',
'',
'begin',
'    SELECT COUNT(A.TNO) INTO tpaymentadvice',
'	FROM PAYMENTADVICE A',
'	WHERE A.MODULETNO = :P118_TNO ;',
'',
'    if nvl(tpaymentadvice, 0) = 0 then',
'        if :P118_STATUS = ''ACTIVE'' then',
'        ',
'            CREATEPAYMENTADVICEFORPO(:P118_TNO);',
'',
'        end if;',
'',
'    end if;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61085359821557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161820593850236672)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'intialize ma_acceptance'
,p_static_id=>'intialize-ma-acceptance'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  TMP NUMBER;',
'BEGIN',
'SELECT COUNT(*) into tmp FROM ma_acceptance A WHERE A.TNO = :p118_tno;',
'if nvl(tmp,0) > 0 then',
'        select ',
'        TNO                 ,',
'        MODULECODE,',
'        MODULETNO,',
'        MODULESNO,',
'        ACCEPTANCE,',
'        ACCEPTANCEDATE,',
'        PERSONACCOUNTABLE,',
'        DELIVERYDATE,',
'        DESIGNATION,',
'        MOBILENO,',
'        EXPIRYTIME',
'        into ',
'        :P118_TNO_1,',
'        :P118_MODULECODE,',
'        :P118_MODULETNO,',
'        :P118_MODULESNO,',
'        :P118_ACCEPTANCE,',
'        :P118_ACCEPTANCEDATE,',
'        :P118_PERSONACCOUNTABLE,',
'        :P118_DELIVERYDATE_1,',
'        :P118_DESIGNATION,',
'        :P118_MOBILENO,',
'        :P118_EXPIRYTIME',
'        from ma_acceptance',
'        WHERE MODULETNO = :P118_TNO',
'        ;',
'',
'    END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>61080549858557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161824239131236674)
,p_process_sequence=>70
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'PREPARE_URL'
,p_static_id=>'prepare-url'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   result varchar2(2000);',
'begin',
'   result:=apex_util.prepare_url(apex_application.g_x01);',
'   apex_json.open_object;',
'   apex_json.write(''success'', true);',
'   apex_json.write(''url'', result);',
'   apex_json.close_object;',
'exception',
' when others then',
'   apex_json.open_object;',
'   apex_json.write(''success'', false);',
'   apex_json.write(''message'', sqlerrm);',
'   apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>61084195139557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161748077311236621)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(646225442166544647)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Purchase Order'
,p_static_id=>'process-form-purchase-order'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61008033319557064
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161789964635236650)
,p_process_sequence=>180
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(650731749442695343)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Vendor Acceptance'
,p_static_id=>'process-form-vendor-acceptance'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>61049920643557093
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161824630131236674)
,p_process_sequence=>160
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SavePurchaseOrderFooter'
,p_static_id=>'savepurchaseorderfooter'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    delete from purchaseorderfooter where tno = :P118_TNO;',
'    insert into purchaseorderfooter',
'        (tno ,',
'        FOOTERHEADCODE , ',
'        FOOTERVALUE )',
'        (   select ',
'                :P118_TNO , ',
'                FOOTERHEADCODE , ',
'                sum(FOOTERVALUE) as sumofvalue ',
'            from purchaseorderdetailfooter',
'            where tno = :P118_TNO',
'            group by FOOTERHEADCODE',
'        );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61084586139557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45595477063848195)
,p_process_sequence=>240
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Email to Party'
,p_static_id=>'send-email-to-party'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_po_tno       NUMBER := :P118_TNO;',
'    l_mail_subject VARCHAR2(4000);',
'    l_mail_body    VARCHAR2(31999); ',
'    l_mail_from    VARCHAR2(1000);',
'    l_mail_cc      VARCHAR2(1000);',
'    l_mail_bcc     VARCHAR2(1000);',
'    l_item_row     VARCHAR2(31999); ',
'    v_email_id     NUMBER;',
'    ',
'    CURSOR cur_po_row IS ',
'        SELECT po.PurchaseOrderNo, ',
'               po.PurchaseOrderDate, ',
'               po.DeliveryDate, ',
'               p.PrintName AS PartyName, ',
'               p.OfficeEmail as PartyEmailAddress, ',
'               po.PurchaseOrderAmount,',
'               ''Main Warehouse, Sector 5'' as SHIPPING_ADDRESS,',
'               bs.file_Name,',
'               bs.File_Data,',
'               bs.Mime_Type',
'        FROM PurchaseOrder po ',
'        LEFT JOIN BINARY_STORE bs on bs.REFERENCE_TNO =  po.TNO',
'        JOIN Party p ON p.PartyCode = po.PartyCode ',
'        WHERE po.TNO = v_po_tno',
'          and bs.TNO = :P118_FILE_TNO;',
'',
'    v_po_row cur_po_row%ROWTYPE;',
'BEGIN',
'    -- Parameters fetch karein',
'    l_mail_subject := GET_PARAMETER_SETTING(''PO_EMAIL_SUBJECT_TEMPLATE'');',
'    l_mail_body    := GET_PARAMETER_SETTING(''PO_EMAIL_BODY_TEMPLATE'');',
'    l_mail_from    := GETMYPARAMETERVALUE(''EMAIL_FROM_ADDRESS'');',
'',
'    OPEN cur_po_row;',
'    FETCH cur_po_row INTO v_po_row;',
'    ',
'    IF cur_po_row%FOUND THEN',
'        -- 1. Subject Replace',
'        l_mail_subject := REPLACE(l_mail_subject, ''[PO_NUMBER]''     , v_po_row.PurchaseOrderNo);',
'        l_mail_subject := REPLACE(l_mail_subject, ''[COMPANY_NAME]''  , :GLOBAL_COMPANYNAME);',
'',
'        -- 2. Body Replace (Formatting ke saath)',
'        l_mail_body := REPLACE(l_mail_body, ''[PARTY_NAME]''          , v_po_row.PartyName);',
'        l_mail_body := REPLACE(l_mail_body, ''[PO_NUMBER]''           , v_po_row.PurchaseOrderNo);',
'        l_mail_body := REPLACE(l_mail_body, ''[PO_DELIVERY_DATE]''    , TO_CHAR(v_po_row.DeliveryDate, ''DD-MON-YYYY''));',
'        l_mail_body := REPLACE(l_mail_body, ''[PO_AMOUNT]''           , TO_CHAR(v_po_row.PurchaseOrderAmount, ''FML99,99,999.00''));',
'        l_mail_body := REPLACE(l_mail_body, ''[PO_SHIPPING_ADDRESS]'' , v_po_row.SHIPPING_ADDRESS);',
'        ',
'        -- Signature placeholders',
'        l_mail_body := REPLACE(l_mail_body, ''[SENDER_NAME]'', :GLOBAL_BOSSUSERNAME); ',
'        l_mail_body := REPLACE(l_mail_body, ''[COMPANY_NAME]'', :GLOBAL_COMPANYNAME);',
'',
'        l_item_row := ''''; -- Item Row Initilize',
'',
'        --Get the Item Details',
'        FOR r IN (',
'            SELECT',
'                 vi.ITEMNAME,',
'                 vi.ITEMSPECIFICATIONNAME,',
'                 pod.DESCRIPTION,',
'                 vi.UOM1,',
'                 pod.QUANTITY1',
'            FROM PurchaseOrderDetail pod',
'            JOIN V_Item_Details vi ON vi.ITEMCODE = pod.ITEMCODE AND vi.ITEMSPECIFICATIONCODE = pod.ITEMSPECIFICATIONCODE',
'            Where pod.TNo = v_po_tno',
'            Order by pod.SNO',
'        )',
'        LOOP',
'        --Direct HTML Row',
'        l_item_row := l_item_row ||',
'            ''<tr>''',
'        || ''<td style="text-align: left; border: 1px solid #b9b9b9; font-family: Arial, sans-serif; font-size:13px; padding: 4px 8px;"><span style="white-space:pre; word-break: break-word;">''',
'        || r.ITEMNAME',
'        || ''</span></td>">''',
'',
'        || ''<td style="text-align: left; border: 1px solid #b9b9b9; font-family: Arial, sans-serif; font-size:13px; padding: 4px 8px;"><span style="white-space:pre; word-break: break-word;">''',
'        || r.ITEMSPECIFICATIONNAME',
'        || ''</span></td>">''',
'',
'        || ''<td style="text-align: left; border: 1px solid #b9b9b9; font-family: Arial, sans-serif; font-size:13px; padding: 4px 8px;"><span style="white-space:pre; word-break: break-word;">''',
'        || r.DESCRIPTION',
'        || ''</span></td>">''',
'',
'        || ''<td style="text-align: left; border: 1px solid #b9b9b9; font-family: Arial, sans-serif; font-size:13px; padding: 4px 8px;"><span style="white-space:pre; word-break: break-word;">''',
'        || r.UOM1',
'        || ''</span></td>">''',
'',
'        || ''<td style="text-align: left; border: 1px solid #b9b9b9; font-family: Arial, sans-serif; font-size:13px;<span style="white-space:pre; word-break: break-word;">''',
'        || r.QUANTITY1',
'        || ''</span></td>">'';',
'        END LOOP;',
'',
'        --Replace once : inject all rows',
'        l_mail_body := REPLACE(l_mail_body,''<tr data-placeholder="ITEM_DETAIL"></tr>'',l_item_row);',
'',
'',
'        -- 3. Prepare Send Email',
'        IF v_po_row.PartyEmailAddress IS NOT NULL THEN',
'            v_email_id  :=   APEX_MAIL.SEND(',
'                            p_from      => l_mail_from,',
'                            p_to        => v_po_row.PartyEmailAddress,',
'                            p_cc        => l_mail_cc,',
'                            p_bcc       => l_mail_bcc,',
'                            p_subj      => l_mail_subject,',
'                            p_body      => l_mail_body,',
'                            p_body_html => l_mail_body);',
'            ',
'            IF v_po_row.File_Data is not null then',
'                ---Add the File Attachment',
'                APEX_MAIL.ADD_ATTACHMENT(',
'                    p_mail_id       =>  v_email_id,',
'                    p_attachment    => v_po_row.File_Data,',
'                    p_filename      => v_po_row.File_name,',
'                    p_mime_type     => v_po_row.Mime_Type',
'                );',
'            End If;',
'            ',
'            APEX_MAIL.PUSH_QUEUE;',
'',
'            COMMIT;',
'',
'            --Success Messsage',
'            APEX_APPLICATION.g_print_success_message :=',
'                ''PO Mail successfully sent to ''|| v_po_row.PartyEmailAddress;',
'        ELSE',
'            APEX_ERROR.ADD_ERROR(',
'                p_message       => ''Party email address not found, Email Not sent.'',',
'                p_display_location  => apex_error.c_inline_in_notification',
'            );',
'',
'        END IF;',
'    ELSE',
'            APEX_ERROR.ADD_ERROR(',
'                p_message       => ''Purchaser Order data not found for TNO: ''||v_po_tno,',
'                p_display_location  => apex_error.c_inline_in_notification',
'            );',
'    END IF;',
'    CLOSE cur_po_row;',
'',
'EXCEPTION',
'    WHEN OTHERS THEN',
'    IF cur_po_row%ISOPEN THEN',
'        CLOSE cur_po_row;',
'    END IF; ',
'    APEX_ERROR.ADD_ERROR(',
'                p_message       => ''Email send failed: ''||SQLERRM,',
'                p_display_location  => apex_error.c_inline_in_notification',
'    );   ',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(161791892123236652)
,p_process_when_type=>'NEVER'
,p_internal_uid=>35669954747321629
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45595532766848196)
,p_process_sequence=>250
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Email via Procedure execution'
,p_static_id=>'send-email-via-procedure-execution'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_status    VARCHAR2(20);',
'BEGIN',
'    PKG_EMAIL_MGR.SEND_PO(',
'        p_po_tno    => :P118_TNO,',
'        p_file_tno  => :P118_FILE_TNO,',
'        p_to_email  => :P118_OFFICEEMAIL,',
'        p_cc_email  => :P118_EMAIL_CC,',
'        p_status    => l_status',
'    );',
'',
'    :P118_MAILSTATUS := l_status;',
'    ',
'    APEX_APPLICATION.g_print_success_message := ''PO email sent successfully!'';',
'',
'    --Update Mail Status to Purchase Order',
'    Update PurchaseOrder Set MailStatus = l_status Where TNO = :P118_TNO;',
'    ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        APEX_ERROR.ADD_ERROR(',
'            p_message          => SQLERRM,',
'            p_display_location => apex_error.c_inline_in_notification',
'        );',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(161791892123236652)
,p_internal_uid=>35670010450321630
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161823766495236674)
,p_process_sequence=>220
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P118_TNO, :P118_PURCHASEORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(161814680457236667)
,p_internal_uid=>61083722503557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161820959042236672)
,p_process_sequence=>150
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P118_FORMSTATUS = ''NEWRECORD'' THEN',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P118_ALLOWEDBACK,:P118_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'        else',
'     :P118_ALLOWEDBACK       := :P118_PURCHASEORDERDATE ; ',
'    :P118_ALLOWEDFORWARD    := :P118_PURCHASEORDERDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>61080915050557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161782216025236647)
,p_process_sequence=>170
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(650730603829695332)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Special Note - Save Interactive Grid Data'
,p_static_id=>'special-note-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61042172033557090
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161774867297236641)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(646458929220586568)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Terms and Conditions - Save Interactive Grid Data'
,p_static_id=>'terms-and-conditions-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>61034823305557084
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161820210385236672)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate balance LA'
,p_static_id=>'validate-balance-la'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    balance number:=0;',
'begin',
'    for i in (select tno , sno , quantity1 , itemcode , itemspecificationcode from purchaseorderdetail where tno=:P118_TNO)',
'    loop',
'        balance:=0;',
'        select sum(nvl(b.quantity1 , 0)) into balance from loadingadvice a , loadingadvicedetail b ',
'        where a.tno = b.tno   ',
'        and a.purchaseordertno = :P118_TNO',
'        and b.itemcode = i.itemcode',
'        and b.itemspecificationcode = i.itemspecificationcode;',
'',
'        if i.quantity1 < balance then',
'            raise_application_error(-20000,''Quantity Mismatch. - ''|| i.quantity1 ||''-''|| balance);',
'        end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(161814307803236667)
,p_internal_uid=>61080166393557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161819356423236671)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate qty'
,p_static_id=>'validate-qty'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    sumq1 number:=0;',
'begin',
'    if :P118_ISOPENSPEC = ''YES'' then',
'        select round(sum(nvl(quantity1,0)),3) into sumq1 from purchaseorderdetail ',
'        where tno=:P118_TNO;',
'        if sumq1<>round(to_number(:P118_QUANTITY),3) then',
'            raise_application_error(-20000,''Sum Of Detail Qty Not Matching with Master Qty. Detail - ''||sumq1|| '' Master - ''||:P118_QUANTITY);',
'        end if;',
'    end if;',
'   ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(161814680457236667)
,p_internal_uid=>61079312431557114
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161819819233236672)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'validate qty_1'
,p_static_id=>'validate-qty-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    sumq1 number:=0;',
'begin',
'    if :P118_ISOPENSPEC = ''YES'' then',
'        select round(sum(nvl(quantity1,0)),3) into sumq1 from purchaseorderdetail ',
'        where tno=:P118_TNO;',
'        if sumq1<>round(to_number(:P118_QUANTITY),3) then',
'            raise_application_error(-20000,''Sum Of Detail Qty Not Matching with Master Qty. Detail - ''||sumq1|| '' Master - ''||:P118_QUANTITY);',
'        end if;',
'    end if;',
'   ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(161814307803236667)
,p_internal_uid=>61079775241557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(161725783293236607)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(643521010222379453)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validations'
,p_static_id=>'validations'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number;',
'begin',
'    for vloop in (select           ',
'                    a.ITEMCODE           ',
'                    from purchaseorderdetail a , item b',
'                    where a.itemcode = b.itemcode',
'                    and a.tno = :P118_TNO )',
'    loop',
'        select count(*) into tmp from indentdetail',
'        where tno = :P118_INDENTTNO',
'        and itemcode = vloop.itemcode;',
'',
'        --if nvl(tmp,0) = 0 then',
'        --    raise_application_error(-20000,''Item details not matching with Selected Indent No'');',
'        --end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'SAVE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_exec_cond_for_each_row=>'Y'
,p_internal_uid=>60985739301557050
);
wwv_flow_imp.component_end;
end;
/
