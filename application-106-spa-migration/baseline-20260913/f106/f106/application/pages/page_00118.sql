prompt --application/pages/page_00118
begin
--   Manifest
--     PAGE: 00118
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
 p_id=>wwv_flow_imp.id(1243898235897710871)
,p_plug_name=>'Attachment'
,p_static_id=>'attachment'
,p_region_name=>'Attach'
,p_parent_plug_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(1243898980472710879)
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
 p_id=>wwv_flow_imp.id(1243899549958710884)
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
 p_id=>wwv_flow_imp.id(963514961677581192)
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
 p_id=>wwv_flow_imp.id(1091113836200525567)
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
 p_id=>wwv_flow_imp.id(1243899621198710885)
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
 p_id=>wwv_flow_imp.id(811645750947895684)
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
 p_id=>wwv_flow_imp.id(810251475613764633)
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
 p_id=>wwv_flow_imp.id(565862972069875581)
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
 p_id=>wwv_flow_imp.id(1243899139775710880)
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
 p_id=>wwv_flow_imp.id(1246544569870686333)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'371612'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYATTRIBUTENAME:ATTRIBUTEVALUE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(1167259500339155998)
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
 p_id=>wwv_flow_imp.id(667376656749376113)
,p_plug_name=>'Currency'
,p_static_id=>'currency'
,p_parent_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(651062500031082203)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(659014100221577492)
,p_heading=>'Discount'
,p_static_id=>'discount'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(659013803890577489)
,p_heading=>'Item Specification'
,p_static_id=>'item-specification'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(659013924805577490)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(659014072517577491)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(659014329599577494)
,p_heading=>'Shortage'
,p_static_id=>'shortage'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(659014229504577493)
,p_heading=>'Tolerance %'
,p_static_id=>'tolerance'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(653996874101289282)
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
 p_id=>wwv_flow_imp.id(653996947021289283)
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
 p_id=>wwv_flow_imp.id(508476184566618217)
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
 p_id=>wwv_flow_imp.id(653999450047289308)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(653999505903289309)
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
 p_id=>wwv_flow_imp.id(653997652186289290)
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
 p_id=>wwv_flow_imp.id(653997686543289291)
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
 p_id=>wwv_flow_imp.id(653998439501289298)
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
 p_id=>wwv_flow_imp.id(653998560654289299)
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
 p_id=>wwv_flow_imp.id(651063359884082211)
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
,p_group_id=>wwv_flow_imp.id(659013803890577489)
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
 p_id=>wwv_flow_imp.id(653998970018289303)
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
,p_group_id=>wwv_flow_imp.id(659014100221577492)
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
 p_id=>wwv_flow_imp.id(653999051555289304)
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
,p_group_id=>wwv_flow_imp.id(659014100221577492)
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
 p_id=>wwv_flow_imp.id(651064481593082223)
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
 p_id=>wwv_flow_imp.id(654125517461489979)
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
 p_id=>wwv_flow_imp.id(508476317274618218)
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
 p_id=>wwv_flow_imp.id(653999371756289307)
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
 p_id=>wwv_flow_imp.id(653996582424289280)
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
 p_id=>wwv_flow_imp.id(653996703734289281)
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
 p_id=>wwv_flow_imp.id(653996320236289277)
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
,p_group_id=>wwv_flow_imp.id(659014229504577493)
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
 p_id=>wwv_flow_imp.id(651063048331082208)
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
,p_group_id=>wwv_flow_imp.id(659013803890577489)
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
 p_id=>wwv_flow_imp.id(653996991241289284)
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
 p_id=>wwv_flow_imp.id(653997132842289285)
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
 p_id=>wwv_flow_imp.id(653999255215289306)
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
 p_id=>wwv_flow_imp.id(651063158316082209)
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
,p_group_id=>wwv_flow_imp.id(659013803890577489)
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
 p_id=>wwv_flow_imp.id(651063223431082210)
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
,p_group_id=>wwv_flow_imp.id(659013803890577489)
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
 p_id=>wwv_flow_imp.id(653997448515289288)
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
 p_id=>wwv_flow_imp.id(653997550243289289)
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
 p_id=>wwv_flow_imp.id(653997274076289286)
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
 p_id=>wwv_flow_imp.id(653997332304289287)
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
 p_id=>wwv_flow_imp.id(653996204665289276)
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
,p_group_id=>wwv_flow_imp.id(659014229504577493)
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
 p_id=>wwv_flow_imp.id(651064578988082224)
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
 p_id=>wwv_flow_imp.id(651064700119082225)
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
 p_id=>wwv_flow_imp.id(653997804252289292)
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
 p_id=>wwv_flow_imp.id(653997935206289293)
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
 p_id=>wwv_flow_imp.id(653996467636289278)
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
 p_id=>wwv_flow_imp.id(653996540624289279)
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
 p_id=>wwv_flow_imp.id(654125441993489978)
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
 p_id=>wwv_flow_imp.id(651063440673082212)
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
,p_group_id=>wwv_flow_imp.id(659013924805577490)
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
 p_id=>wwv_flow_imp.id(651063552131082213)
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
,p_group_id=>wwv_flow_imp.id(659014072517577491)
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
 p_id=>wwv_flow_imp.id(508476142086618216)
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
 p_id=>wwv_flow_imp.id(653999104632289305)
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
,p_group_id=>wwv_flow_imp.id(659014100221577492)
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
 p_id=>wwv_flow_imp.id(651063905853082217)
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
 p_id=>wwv_flow_imp.id(651063724492082215)
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
 p_id=>wwv_flow_imp.id(651063869987082216)
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
 p_id=>wwv_flow_imp.id(651064442770082222)
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
 p_id=>wwv_flow_imp.id(651062749257082205)
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
 p_id=>wwv_flow_imp.id(653998140536289295)
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
,p_group_id=>wwv_flow_imp.id(659014329599577494)
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
 p_id=>wwv_flow_imp.id(653998029519289294)
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
,p_group_id=>wwv_flow_imp.id(659014329599577494)
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
 p_id=>wwv_flow_imp.id(653998216562289296)
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
,p_group_id=>wwv_flow_imp.id(659014329599577494)
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
 p_id=>wwv_flow_imp.id(651062877513082207)
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
 p_id=>wwv_flow_imp.id(653998338184289297)
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
 p_id=>wwv_flow_imp.id(651062844422082206)
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
 p_id=>wwv_flow_imp.id(651063670131082214)
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
,p_group_id=>wwv_flow_imp.id(659014329599577494)
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
 p_id=>wwv_flow_imp.id(508476435220618219)
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
 p_id=>wwv_flow_imp.id(670818835030606894)
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
,p_group_id=>wwv_flow_imp.id(659013924805577490)
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
 p_id=>wwv_flow_imp.id(670818943226606895)
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
,p_group_id=>wwv_flow_imp.id(659014072517577491)
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
 p_id=>wwv_flow_imp.id(653998860264289302)
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
 p_id=>wwv_flow_imp.id(651062653696082204)
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
 p_id=>wwv_flow_imp.id(654001790463292273)
,p_interactive_grid_id=>wwv_flow_imp.id(651062653696082204)
,p_static_id=>'1490027'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(654002036268292277)
,p_report_id=>wwv_flow_imp.id(654001790463292273)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(508535047208049233)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(508476142086618216)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(508535821674049235)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(508476184566618217)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(508536741926049237)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(508476317274618218)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(508537661345049241)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(508476435220618219)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654002520886292284)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(651062749257082205)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654003434846292289)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(651062844422082206)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654004316322292292)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(651062877513082207)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654005247362292294)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(651063048331082208)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654006090928292296)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(651063158316082209)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>188
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654007010614292298)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(651063223431082210)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>343
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654007894186292300)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(651063359884082211)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>91
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654008794883292302)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(651063440673082212)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654009693124292304)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(651063552131082213)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>80
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654010665759292306)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(651063670131082214)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654011399509292310)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(651063724492082215)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654012292000292312)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(651063869987082216)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654013206708292314)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(651063905853082217)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654017730492292328)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(651064442770082222)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654018594210292330)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(651064481593082223)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654019485738292332)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(651064578988082224)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654020457635292334)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(651064700119082225)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654021286495292340)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(653996204665289276)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654022262618292343)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(653996320236289277)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654023087279292345)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(653996467636289278)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>153
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654024013689292348)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(653996540624289279)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>144
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654024943093292350)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(653996582424289280)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>130
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654025796090292352)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(653996703734289281)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654026736604292354)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(653996874101289282)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654027632104292356)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(653996947021289283)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>134
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654028515098292358)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(653996991241289284)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654029442370292360)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(653997132842289285)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>136
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654030337801292362)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(653997274076289286)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>165
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654031249773292364)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(653997332304289287)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>173
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654032151195292366)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(653997448515289288)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>159
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654032998073292369)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(653997550243289289)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>156
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654033945878292372)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(653997652186289290)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654034833718292374)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(653997686543289291)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654035696129292376)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(653997804252289292)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654036593262292378)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>51
,p_column_id=>wwv_flow_imp.id(653997935206289293)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>135
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654037557786292380)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>52
,p_column_id=>wwv_flow_imp.id(653998029519289294)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>137
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654038445608292382)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(653998140536289295)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654039301512292385)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(653998216562289296)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654040231553292387)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>53
,p_column_id=>wwv_flow_imp.id(653998338184289297)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>120
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654041087460292389)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>54
,p_column_id=>wwv_flow_imp.id(653998439501289298)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>148
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654042011373292391)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>55
,p_column_id=>wwv_flow_imp.id(653998560654289299)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654044743311292397)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(653998860264289302)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654045640547292399)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(653998970018289303)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654046539278292401)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(653999051555289304)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654047405838292403)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(653999104632289305)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654048298307292405)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(653999255215289306)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>96
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654049193393292407)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(653999371756289307)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654053487580296024)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(653999450047289308)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654150142431893587)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>56
,p_column_id=>wwv_flow_imp.id(654125441993489978)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654151043942893590)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(654125517461489979)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>61
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(671514617514122153)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(670818835030606894)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(671515513342122157)
,p_view_id=>wwv_flow_imp.id(654002036268292277)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(670818943226606895)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(658274824140398109)
,p_plug_name=>'E-Mail'
,p_static_id=>'e-mail'
,p_region_name=>'Email'
,p_parent_plug_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(654125604639489980)
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
,p_master_region_id=>wwv_flow_imp.id(651062500031082203)
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
 p_id=>wwv_flow_imp.id(654126705493489991)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(654126842032489992)
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
 p_id=>wwv_flow_imp.id(654126052416489984)
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
 p_id=>wwv_flow_imp.id(654126120722489985)
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
 p_id=>wwv_flow_imp.id(654126181430489986)
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
 p_id=>wwv_flow_imp.id(654126534426489989)
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
 p_id=>wwv_flow_imp.id(654126640174489990)
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
 p_id=>wwv_flow_imp.id(654126301674489987)
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
 p_id=>wwv_flow_imp.id(654125885881489983)
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
,p_parent_column_id=>wwv_flow_imp.id(651062877513082207)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(654126417021489988)
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
 p_id=>wwv_flow_imp.id(654125863491489982)
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
,p_parent_column_id=>wwv_flow_imp.id(651062844422082206)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(654125732239489981)
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
 p_id=>wwv_flow_imp.id(654152950057915113)
,p_interactive_grid_id=>wwv_flow_imp.id(654125732239489981)
,p_static_id=>'1491538'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(654153107667915113)
,p_report_id=>wwv_flow_imp.id(654152950057915113)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654153668270915114)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(654125863491489982)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654154514336915116)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(654125885881489983)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654155423950915118)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(654126052416489984)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>143.75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654156283348915120)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(654126120722489985)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129.75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654157223647915122)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(654126181430489986)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654158127549915124)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(654126301674489987)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654159049029915126)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(654126417021489988)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654159893119915130)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(654126534426489989)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111.75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654160805139915134)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(654126640174489990)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654162997675921017)
,p_view_id=>wwv_flow_imp.id(654153107667915113)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(654126705493489991)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(653766931975247397)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(667376559217376112)
,p_plug_name=>'General'
,p_static_id=>'general-2'
,p_parent_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(667376949381376116)
,p_plug_name=>'GST In Nature And Transaction'
,p_static_id=>'gst-in-nature-and-transaction'
,p_parent_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(562291910628232485)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_parent_plug_id=>wwv_flow_imp.id(654125604639489980)
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
 p_id=>wwv_flow_imp.id(667377053783376117)
,p_plug_name=>'Other Informations'
,p_static_id=>'other-informations'
,p_region_name=>'OTHER'
,p_parent_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(658272075094398081)
,p_plug_name=>'Payment'
,p_static_id=>'payment'
,p_region_name=>'Payment'
,p_parent_plug_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(510527627591976246)
,p_plug_name=>'PO Amendment Detail'
,p_static_id=>'po-amendment-detail'
,p_region_name=>'POAMENDMENTDETAIL'
,p_parent_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(667376750619376114)
,p_plug_name=>'Select Indent'
,p_static_id=>'select-indent'
,p_parent_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(53134259549550918)
,p_plug_name=>'Send Email'
,p_static_id=>'send-email'
,p_parent_plug_id=>wwv_flow_imp.id(658274824140398109)
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
 p_id=>wwv_flow_imp.id(275990603573701561)
,p_plug_name=>'Ship To'
,p_static_id=>'ship-to'
,p_parent_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(658272093638398082)
,p_plug_name=>'Special Note'
,p_static_id=>'special-note'
,p_region_name=>'NOTE'
,p_parent_plug_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(658272760222398088)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(658272851580398089)
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
 p_id=>wwv_flow_imp.id(658272539355398086)
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
 p_id=>wwv_flow_imp.id(658272579316398087)
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
 p_id=>wwv_flow_imp.id(658272384375398085)
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
 p_id=>wwv_flow_imp.id(658272352407398084)
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
 p_id=>wwv_flow_imp.id(658272233498398083)
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
 p_id=>wwv_flow_imp.id(658952821616106891)
,p_interactive_grid_id=>wwv_flow_imp.id(658272233498398083)
,p_static_id=>'1539537'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(658952995093106896)
,p_report_id=>wwv_flow_imp.id(658952821616106891)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(658953506749106899)
,p_view_id=>wwv_flow_imp.id(658952995093106896)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(658272352407398084)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(658954399322106902)
,p_view_id=>wwv_flow_imp.id(658952995093106896)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(658272384375398085)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(658955284248106905)
,p_view_id=>wwv_flow_imp.id(658952995093106896)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(658272539355398086)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(658956181079106907)
,p_view_id=>wwv_flow_imp.id(658952995093106896)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(658272579316398087)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(658957036429106909)
,p_view_id=>wwv_flow_imp.id(658952995093106896)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(658272760222398088)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(569521790167350142)
,p_plug_name=>'Summary'
,p_static_id=>'summary'
,p_parent_plug_id=>wwv_flow_imp.id(651062500031082203)
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
 p_id=>wwv_flow_imp.id(654000419029289318)
,p_plug_name=>'Terms and Conditions'
,p_static_id=>'terms-and-conditions'
,p_region_name=>'TAC'
,p_parent_plug_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(654001116751289325)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(654125195824489976)
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
 p_id=>wwv_flow_imp.id(654000997292289324)
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
 p_id=>wwv_flow_imp.id(654000680353289321)
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
 p_id=>wwv_flow_imp.id(654000931764289323)
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
 p_id=>wwv_flow_imp.id(654000824473289322)
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
 p_id=>wwv_flow_imp.id(654000578668289320)
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
 p_id=>wwv_flow_imp.id(654000526857289319)
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
 p_id=>wwv_flow_imp.id(654119831144473675)
,p_interactive_grid_id=>wwv_flow_imp.id(654000526857289319)
,p_static_id=>'1491207'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(654120013474473675)
,p_report_id=>wwv_flow_imp.id(654119831144473675)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654120488525473677)
,p_view_id=>wwv_flow_imp.id(654120013474473675)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(654000578668289320)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654121420319473679)
,p_view_id=>wwv_flow_imp.id(654120013474473675)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(654000680353289321)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654122306422473683)
,p_view_id=>wwv_flow_imp.id(654120013474473675)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(654000824473289322)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>287
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654123189630473685)
,p_view_id=>wwv_flow_imp.id(654120013474473675)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(654000931764289323)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654124176358473687)
,p_view_id=>wwv_flow_imp.id(654120013474473675)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(654000997292289324)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(654131189692490226)
,p_view_id=>wwv_flow_imp.id(654120013474473675)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(654001116751289325)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(667376419227376111)
,p_plug_name=>'Texts'
,p_static_id=>'texts'
,p_parent_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(53134147830550917)
,p_plug_name=>'Upload File'
,p_static_id=>'upload-file'
,p_parent_plug_id=>wwv_flow_imp.id(658274824140398109)
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
 p_id=>wwv_flow_imp.id(658273239251398093)
,p_plug_name=>'Vendor Acceptance'
,p_static_id=>'vendor-acceptance'
,p_region_name=>'Vendor'
,p_parent_plug_id=>wwv_flow_imp.id(651062469335082202)
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
 p_id=>wwv_flow_imp.id(60209783104689966)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(53134259549550918)
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
 p_id=>wwv_flow_imp.id(169352552288939416)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169343554678939410)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1243898235897710871)
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
 p_id=>wwv_flow_imp.id(169349453205939414)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(654125604639489980)
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
 p_id=>wwv_flow_imp.id(169354990970939417)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169356170265939417)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169355383862939417)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169332573926939402)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(658274824140398109)
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
 p_id=>wwv_flow_imp.id(169353415057939417)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169353796057939417)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(53136016658550936)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(53134259549550918)
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
 p_id=>wwv_flow_imp.id(169315892656939391)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(654000419029289318)
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
 p_id=>wwv_flow_imp.id(169265134466939355)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(651062500031082203)
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
 p_id=>wwv_flow_imp.id(169352949528939417)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169332941837939402)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(658274824140398109)
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
 p_id=>wwv_flow_imp.id(169354629812939417)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169355797611939417)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169333381931939402)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(53134259549550918)
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
 p_id=>wwv_flow_imp.id(169354148734939417)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(799876457178086657)
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
 p_id=>wwv_flow_imp.id(169332191196939402)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(658274824140398109)
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
 p_id=>wwv_flow_imp.id(169445090548939460)
,p_branch_name=>'Go To Page 117'
,p_branch_action=>'f?p=&APP_ID.:117:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(169355383862939417)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658360413681398168)
,p_name=>'P118_ACCEPTANCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(658359860260398163)
,p_name=>'P118_ACCEPTANCEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(653848224836247459)
,p_name=>'P118_AGENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(667377053783376117)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(517543562083680521)
,p_name=>'P118_ALLOWEDBACK'
,p_item_sequence=>610
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517543943159690844)
,p_name=>'P118_ALLOWEDFORWARD'
,p_item_sequence=>620
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658371171273398187)
,p_name=>'P118_ATTRIBUTECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_source_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_source=>'ATTRIBUTECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658371306544398188)
,p_name=>'P118_ATTRIBUTEVALUE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_source_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_source=>'ATTRIBUTEVALUE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(278008836882105245)
,p_name=>'P118_BALANCEQTY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(651062500031082203)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1253770577459398060)
,p_name=>'P118_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1195152232243129668)
,p_name=>'P118_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
,p_item_default=>'117'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(511786149909220724)
,p_name=>'P118_CALLEDFROMTNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653849862729247459)
,p_name=>'P118_COMMISSIONRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(667377053783376117)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653799640824247427)
,p_name=>'P118_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653847177153247456)
,p_name=>'P118_COMPARATIVESTATEMENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(667376750619376114)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653819224406247436)
,p_name=>'P118_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653811978475247433)
,p_name=>'P118_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653848615211247459)
,p_name=>'P118_CREDITDAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(667377053783376117)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653834856380247450)
,p_name=>'P118_CURRENCYUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(667376656749376113)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653835172151247450)
,p_name=>'P118_CURRENCYVALUE'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(667376656749376113)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(276042332979701598)
,p_name=>'P118_CUSTOMERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(275990603573701561)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653829128196247447)
,p_name=>'P118_DELIVERYDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(667376559217376112)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(658359942513398164)
,p_name=>'P118_DELIVERYDATE_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(653805667575247431)
,p_name=>'P118_DELIVERYORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'DELIVERYORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653818048911247436)
,p_name=>'P118_DELIVERYSCHEDULEWITHPO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'DELIVERYSCHEDULEWITHPO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653801255273247427)
,p_name=>'P118_DEPARTMENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'DEPARTMENTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658360224151398166)
,p_name=>'P118_DESIGNATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(654239218026490081)
,p_name=>'P118_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(654125604639489980)
,p_use_cache_before_default=>'NO'
,p_format_mask=>'999999999.99'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(563888142579879421)
,p_name=>'P118_DFQUANTITY1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(654125604639489980)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(654239330455490082)
,p_name=>'P118_DFTOTALAMOUNT'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(654125604639489980)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(563804049390879364)
,p_name=>'P118_DISCOUNTRATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(651062500031082203)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653827207551247444)
,p_name=>'P118_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(667376559217376112)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(53137287782550948)
,p_name=>'P118_EMAIL_BCC'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(53134259549550918)
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
 p_id=>wwv_flow_imp.id(53137122402550947)
,p_name=>'P118_EMAIL_CC'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(53134259549550918)
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
 p_id=>wwv_flow_imp.id(653839854709247453)
,p_name=>'P118_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(667377053783376117)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653814798690247434)
,p_name=>'P118_EXPARTYPLANT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'EXPARTYPLANT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658360545268398170)
,p_name=>'P118_EXPIRYTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_source=>'EXPIRYTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658371546103398191)
,p_name=>'P118_FILENAME'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(53134259549550918)
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
 p_id=>wwv_flow_imp.id(52076491169721859)
,p_name=>'P118_FILE_TNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(53134259549550918)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653799980625247427)
,p_name=>'P118_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1195152145764129667)
,p_name=>'P118_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
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
 p_id=>wwv_flow_imp.id(653812860367247434)
,p_name=>'P118_FREIGHTCONTRACTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'FREIGHTCONTRACTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653813195654247434)
,p_name=>'P118_FREIGHTRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'FREIGHTRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653850603743247460)
,p_name=>'P118_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(667377053783376117)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(654241443494490085)
,p_name=>'P118_FVALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(562291910628232485)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(61638995853220529)
,p_name=>'P118_HIDDEN_MAIL_ID'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(53134259549550918)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(564461726726952262)
,p_name=>'P118_HSNCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(651062500031082203)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653839203218247453)
,p_name=>'P118_INDENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(667376750619376114)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653813663700247434)
,p_name=>'P118_ISEVENTRANSACTION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'ISEVENTRANSACTION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653867653125247468)
,p_name=>'P118_ISFULLADVANCE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(658272075094398081)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(276763481324255708)
,p_name=>'P118_ISOPENSPEC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(667376559217376112)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653808826338247432)
,p_name=>'P118_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_default=>'YES'
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653818447708247436)
,p_name=>'P118_ITEMWISESCHEDULE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'ITEMWISESCHEDULE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(528446032507897630)
,p_name=>'P118_LENDINGONGROSS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(667376949381376116)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'LENDINGONGROSS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653831198982247447)
,p_name=>'P118_LETTERTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(667376419227376111)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653815251246247434)
,p_name=>'P118_LIFTINGFROMCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'LIFTINGFROMCITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653826817942247444)
,p_name=>'P118_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(667376559217376112)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(659108274073577548)
,p_name=>'P118_MAILSTATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(53134259549550918)
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
 p_id=>wwv_flow_imp.id(653822441539247437)
,p_name=>'P118_MARINEINSURANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'MARINEINSURANCEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653822055411247437)
,p_name=>'P118_MARINEINSURANCETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'MARINEINSURANCETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658360315373398167)
,p_name=>'P118_MOBILENO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(658359620027398160)
,p_name=>'P118_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_default=>'PURCHASEORDER'
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658370842797398184)
,p_name=>'P118_MODULECODE_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_source_plug_id=>wwv_flow_imp.id(658274824140398109)
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
 p_id=>wwv_flow_imp.id(1195148428447129630)
,p_name=>'P118_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658370790609398183)
,p_name=>'P118_MODULESN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_source_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_source=>'MODULESN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658359828595398162)
,p_name=>'P118_MODULESNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_source=>'MODULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658370656483398182)
,p_name=>'P118_MODULESNO_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_source_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_default=>'select globaltno.nextval from dual;'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'MODULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658359677366398161)
,p_name=>'P118_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(658370559972398181)
,p_name=>'P118_MODULETNO_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_source_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_default=>'P118_TNO'
,p_item_default_type=>'ITEM'
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653853219816247460)
,p_name=>'P118_NATUREOFSUPPLYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(667376949381376116)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(659107928650577545)
,p_name=>'P118_OFFICEEMAIL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53134259549550918)
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
 p_id=>wwv_flow_imp.id(1194556649342858364)
,p_name=>'P118_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653866456713247468)
,p_name=>'P118_PAIDAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(658272075094398081)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'PAIDAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653830770029247448)
,p_name=>'P118_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(667376559217376112)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(1169205167207504828)
,p_name=>'P118_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653868462368247469)
,p_name=>'P118_PAYMENTADVICELOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>580
,p_item_plug_id=>wwv_flow_imp.id(658272075094398081)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_default=>'P118_LOCATIONCODE'
,p_item_default_type=>'ITEM'
,p_source=>'PAYMENTADVICELOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(659092281132577545)
,p_name=>'P118_PAYMENTADVICENO'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(658272075094398081)
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
 p_id=>wwv_flow_imp.id(510608819669976329)
,p_name=>'P118_PAYMENTADVICETNO'
,p_item_sequence=>600
,p_item_plug_id=>wwv_flow_imp.id(658272075094398081)
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
 p_id=>wwv_flow_imp.id(653816854798247435)
,p_name=>'P118_PAYMENTBYLC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'PAYMENTBYLC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(276042446469701599)
,p_name=>'P118_PENDINGSOTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>590
,p_item_plug_id=>wwv_flow_imp.id(275990603573701561)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(658360050044398165)
,p_name=>'P118_PERSONACCOUNTABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(653868093514247469)
,p_name=>'P118_POADVANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(658272075094398081)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(510582690683976296)
,p_name=>'P118_POAMENDMENTAMOUNT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(510527627591976246)
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
 p_id=>wwv_flow_imp.id(510581930510976288)
,p_name=>'P118_POAMENDMENTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(510527627591976246)
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
 p_id=>wwv_flow_imp.id(510582022117976289)
,p_name=>'P118_POAMENDMENTTNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(510527627591976246)
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
 p_id=>wwv_flow_imp.id(653817656814247435)
,p_name=>'P118_PREDI'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'PREDI'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(569551767509350170)
,p_name=>'P118_PURCHASEORDERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(569521790167350142)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653828745390247445)
,p_name=>'P118_PURCHASEORDERDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(667376559217376112)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653828378110247445)
,p_name=>'P118_PURCHASEORDERNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(667376559217376112)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(276763555740255709)
,p_name=>'P118_QUANTITY'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(667376559217376112)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653837955697247453)
,p_name=>'P118_QUOTATIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(667376750619376114)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653838387879247453)
,p_name=>'P118_RATECONTRACTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(667376750619376114)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653818792109247436)
,p_name=>'P118_REFERENCEPURCHASEORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'REFERENCEPURCHASEORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653830738678247447)
,p_name=>'P118_REFERENCETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(667376419227376111)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653846583125247458)
,p_name=>'P118_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(667377053783376117)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(658371810728398193)
,p_name=>'P118_REMARK_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_source_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_source=>'REMARK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653820395934247436)
,p_name=>'P118_ROYALTYPENALTYPERUNIT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'ROYALTYPENALTYPERUNIT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653820048744247436)
,p_name=>'P118_ROYALTYPERCENTAGE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'ROYALTYPERCENTAGE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653823270474247437)
,p_name=>'P118_SAUDAPATRAKDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'SAUDAPATRAKDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653822827444247437)
,p_name=>'P118_SAUDAPATRAKNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'SAUDAPATRAKNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(276042259292701597)
,p_name=>'P118_SHIPTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>570
,p_item_plug_id=>wwv_flow_imp.id(275990603573701561)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(654027006949289333)
,p_name=>'P118_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(651062500031082203)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(659134937609577599)
,p_name=>'P118_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
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
 p_id=>wwv_flow_imp.id(1169205003562504827)
,p_name=>'P118_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1167259500339155998)
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
 p_id=>wwv_flow_imp.id(653811175583247433)
,p_name=>'P118_STOCKDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'STOCKDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653810799774247433)
,p_name=>'P118_STORAGELOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'STORAGELOCATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653830390605247447)
,p_name=>'P118_SUBJECTTEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(667376419227376111)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(569551598271350168)
,p_name=>'P118_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(569521790167350142)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(569551622765350169)
,p_name=>'P118_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(569521790167350142)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(508588584491618306)
,p_name=>'P118_TEMPFOOTERVALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(654125604639489980)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653831549909247447)
,p_name=>'P118_TITLETEXT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(667376419227376111)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653799197680247424)
,p_name=>'P118_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658359450196398159)
,p_name=>'P118_TNO_1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(658273239251398093)
,p_item_source_plug_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(658370481273398180)
,p_name=>'P118_TNO_2'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_item_source_plug_id=>wwv_flow_imp.id(658274824140398109)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653815999752247435)
,p_name=>'P118_TRANCTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'TRANCTIONTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653852385905247460)
,p_name=>'P118_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(667376949381376116)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(653815594056247435)
,p_name=>'P118_UNLOADINGCITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'UNLOADINGCITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653804031058247431)
,p_name=>'P118_WORKORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'WORKORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653814425689247434)
,p_name=>'P118_XPLANT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_item_source_plug_id=>wwv_flow_imp.id(653766931975247397)
,p_source=>'XPLANT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169392014632939435)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(654125604639489980)
,p_triggering_element=>'LEGENDSCODE,FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169392439963939436)
,p_event_id=>wwv_flow_imp.id(169392014632939435)
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
 p_id=>wwv_flow_imp.id(169392997012939436)
,p_event_id=>wwv_flow_imp.id(169392014632939435)
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
 p_id=>wwv_flow_imp.id(169394308720939436)
,p_name=>'Calculate Detail Footer Total Amount value '
,p_static_id=>'calculate-detail-footer-total-amount-value'
,p_event_sequence=>170
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(654125604639489980)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169394744566939436)
,p_event_id=>wwv_flow_imp.id(169394308720939436)
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
 p_id=>wwv_flow_imp.id(169393394402939436)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(654125604639489980)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169393891595939436)
,p_event_id=>wwv_flow_imp.id(169393394402939436)
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
 p_id=>wwv_flow_imp.id(169396998584939438)
,p_name=>'Calculate Footer Total'
,p_static_id=>'calculate-footer-total'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169349453205939414)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169397530625939438)
,p_event_id=>wwv_flow_imp.id(169396998584939438)
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
 p_id=>wwv_flow_imp.id(169422066058939449)
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
 p_id=>wwv_flow_imp.id(169422609736939449)
,p_event_id=>wwv_flow_imp.id(169422066058939449)
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
 p_id=>wwv_flow_imp.id(169441299473939458)
,p_name=>'check balance'
,p_static_id=>'check-balance'
,p_event_sequence=>620
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'QUANTITY1,UNIT2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169441779128939458)
,p_event_id=>wwv_flow_imp.id(169441299473939458)
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
 p_id=>wwv_flow_imp.id(169378282271939430)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169354990970939417)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169379236642939430)
,p_event_id=>wwv_flow_imp.id(169378282271939430)
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
 p_id=>wwv_flow_imp.id(169378742477939430)
,p_event_id=>wwv_flow_imp.id(169378282271939430)
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
 p_id=>wwv_flow_imp.id(169379784717939430)
,p_event_id=>wwv_flow_imp.id(169378282271939430)
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
 p_id=>wwv_flow_imp.id(169417516305939447)
,p_name=>'delete unsaved record from detail table'
,p_static_id=>'delete-unsaved-record-from-detail-table'
,p_event_sequence=>400
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169418022936939447)
,p_event_id=>wwv_flow_imp.id(169417516305939447)
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
 p_id=>wwv_flow_imp.id(169369233105939425)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169370146383939425)
,p_event_id=>wwv_flow_imp.id(169369233105939425)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355383862939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169370714148939427)
,p_event_id=>wwv_flow_imp.id(169369233105939425)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355383862939417)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P118_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169371142747939427)
,p_event_id=>wwv_flow_imp.id(169369233105939425)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355383862939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from loadingadvice aa where aa.purchaseordertno = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169371666442939427)
,p_event_id=>wwv_flow_imp.id(169369233105939425)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355383862939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from paymentadvice aa where aa.moduletno = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169369675265939425)
,p_event_id=>wwv_flow_imp.id(169369233105939425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355383862939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169376887176939428)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169377840083939430)
,p_event_id=>wwv_flow_imp.id(169376887176939428)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169354629812939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169377424838939428)
,p_event_id=>wwv_flow_imp.id(169376887176939428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169354629812939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169372072073939427)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169372602311939427)
,p_event_id=>wwv_flow_imp.id(169372072073939427)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355797611939417)
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
 p_id=>wwv_flow_imp.id(169373536513939427)
,p_event_id=>wwv_flow_imp.id(169372072073939427)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355797611939417)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P118_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169374108796939427)
,p_event_id=>wwv_flow_imp.id(169372072073939427)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355797611939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from loadingadvice aa where aa.purchaseordertno = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169374597998939428)
,p_event_id=>wwv_flow_imp.id(169372072073939427)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355797611939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from paymentadvice aa where aa.moduletno = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169373107494939427)
,p_event_id=>wwv_flow_imp.id(169372072073939427)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355797611939417)
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
 p_id=>wwv_flow_imp.id(169375052703939428)
,p_event_id=>wwv_flow_imp.id(169372072073939427)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-enable-2'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169355797611939417)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P118_ISOPENSPEC'
,p_server_condition_expr2=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169375507365939428)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169376527055939428)
,p_event_id=>wwv_flow_imp.id(169375507365939428)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169354148734939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169376030929939428)
,p_event_id=>wwv_flow_imp.id(169375507365939428)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169354148734939417)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169383957338939432)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169354148734939417)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169387481562939433)
,p_event_id=>wwv_flow_imp.id(169383957338939432)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169354148734939417)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169386948870939433)
,p_event_id=>wwv_flow_imp.id(169383957338939432)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169354148734939417)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P118_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169385007597939433)
,p_event_id=>wwv_flow_imp.id(169383957338939432)
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
 p_id=>wwv_flow_imp.id(169385487008939433)
,p_event_id=>wwv_flow_imp.id(169383957338939432)
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
 p_id=>wwv_flow_imp.id(169385946801939433)
,p_event_id=>wwv_flow_imp.id(169383957338939432)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169354148734939417)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169386520879939433)
,p_event_id=>wwv_flow_imp.id(169383957338939432)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799876457178086657)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169384521071939432)
,p_event_id=>wwv_flow_imp.id(169383957338939432)
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
 p_id=>wwv_flow_imp.id(169437102072939457)
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
 p_id=>wwv_flow_imp.id(169438127121939457)
,p_event_id=>wwv_flow_imp.id(169437102072939457)
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
 p_id=>wwv_flow_imp.id(169437569959939457)
,p_event_id=>wwv_flow_imp.id(169437102072939457)
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
 p_id=>wwv_flow_imp.id(169438581873939457)
,p_event_id=>wwv_flow_imp.id(169437102072939457)
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
 p_id=>wwv_flow_imp.id(53138687385550962)
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
 p_id=>wwv_flow_imp.id(53138866839550964)
,p_event_id=>wwv_flow_imp.id(53138687385550962)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_EMAIL_CC'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53138719349550963)
,p_event_id=>wwv_flow_imp.id(53138687385550962)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_EMAIL_CC'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169367244503939425)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169367762794939425)
,p_event_id=>wwv_flow_imp.id(169367244503939425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169352949528939417)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169368267606939425)
,p_event_id=>wwv_flow_imp.id(169367244503939425)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169353415057939417)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169368802546939425)
,p_event_id=>wwv_flow_imp.id(169367244503939425)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169353796057939417)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P118_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169439016963939457)
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
 p_id=>wwv_flow_imp.id(169440018073939457)
,p_event_id=>wwv_flow_imp.id(169439016963939457)
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
 p_id=>wwv_flow_imp.id(169439481743939457)
,p_event_id=>wwv_flow_imp.id(169439016963939457)
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
 p_id=>wwv_flow_imp.id(169382120876939432)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169353415057939417)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169383129946939432)
,p_event_id=>wwv_flow_imp.id(169382120876939432)
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
 p_id=>wwv_flow_imp.id(169383582496939432)
,p_event_id=>wwv_flow_imp.id(169382120876939432)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169382589701939432)
,p_event_id=>wwv_flow_imp.id(169382120876939432)
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
 p_id=>wwv_flow_imp.id(169409349867939442)
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
 p_id=>wwv_flow_imp.id(169409926135939444)
,p_event_id=>wwv_flow_imp.id(169409349867939442)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169408458886939442)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169354629812939417)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169408958373939442)
,p_event_id=>wwv_flow_imp.id(169408458886939442)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169395189985939436)
,p_name=>'Get DFA_AMT'
,p_static_id=>'get-dfa-amt'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(654125604639489980)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169395692340939436)
,p_event_id=>wwv_flow_imp.id(169395189985939436)
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
 p_id=>wwv_flow_imp.id(169399269582939438)
,p_name=>'Hide'
,p_static_id=>'hide'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169349453205939414)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169399793482939439)
,p_event_id=>wwv_flow_imp.id(169399269582939438)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(654125604639489980)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169412054835939444)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>340
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169412629555939444)
,p_event_id=>wwv_flow_imp.id(169412054835939444)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169387873539939433)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169388387702939433)
,p_event_id=>wwv_flow_imp.id(169387873539939433)
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
 p_id=>wwv_flow_imp.id(169402504822939439)
,p_name=>'Initialize SNO Sequence1'
,p_static_id=>'initialize-sno-sequence-2'
,p_event_sequence=>250
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(658272093638398082)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169402968181939441)
,p_event_id=>wwv_flow_imp.id(169402504822939439)
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
 p_id=>wwv_flow_imp.id(169400139746939439)
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
 p_id=>wwv_flow_imp.id(169400700725939439)
,p_event_id=>wwv_flow_imp.id(169400139746939439)
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
 p_id=>wwv_flow_imp.id(169401138957939439)
,p_event_id=>wwv_flow_imp.id(169400139746939439)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(651062500031082203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169442227170939458)
,p_name=>'insert into detail'
,p_static_id=>'insert-into-detail-2'
,p_event_sequence=>630
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169265134466939355)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169442642248939458)
,p_event_id=>wwv_flow_imp.id(169442227170939458)
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
 p_id=>wwv_flow_imp.id(169443184434939460)
,p_event_id=>wwv_flow_imp.id(169442227170939458)
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
 p_id=>wwv_flow_imp.id(41295236305955065)
,p_event_id=>wwv_flow_imp.id(169442227170939458)
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
 p_id=>wwv_flow_imp.id(33490443437959525)
,p_event_id=>wwv_flow_imp.id(169442227170939458)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(169265134466939355)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'SELECT * FROM purchaseorderdetail WHERE TNO = :P118_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169443683153939460)
,p_event_id=>wwv_flow_imp.id(169442227170939458)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'refresh detail'
,p_static_id=>'refresh-detail'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(651062500031082203)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41295367058955066)
,p_event_id=>wwv_flow_imp.id(169442227170939458)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'refresh footer detail'
,p_static_id=>'refresh-footer-detail'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(654125604639489980)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169420646349939449)
,p_name=>'Insert into tac'
,p_static_id=>'insert-into-tac'
,p_event_sequence=>430
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169315892656939391)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169421165218939449)
,p_event_id=>wwv_flow_imp.id(169420646349939449)
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
 p_id=>wwv_flow_imp.id(169421668454939449)
,p_event_id=>wwv_flow_imp.id(169420646349939449)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(654000419029289318)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169423852073939450)
,p_name=>'make discount rate read only'
,p_static_id=>'make-discount-rate-read-only'
,p_event_sequence=>460
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'DISCOUNTPERCENTAGE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169424380033939450)
,p_event_id=>wwv_flow_imp.id(169423852073939450)
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
 p_id=>wwv_flow_imp.id(169424789633939450)
,p_name=>'make readonly based on LSA and LSD'
,p_static_id=>'make-readonly-based-on-lsa-and-lsd'
,p_event_sequence=>470
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(654125604639489980)
,p_triggering_element=>'LEGENDSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169425274191939450)
,p_event_id=>wwv_flow_imp.id(169424789633939450)
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
 p_id=>wwv_flow_imp.id(169432470227939453)
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
 p_id=>wwv_flow_imp.id(169432968677939453)
,p_event_id=>wwv_flow_imp.id(169432470227939453)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Detail"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169426572448939452)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>490
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169427056936939452)
,p_event_id=>wwv_flow_imp.id(169426572448939452)
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
 p_id=>wwv_flow_imp.id(169427588648939452)
,p_event_id=>wwv_flow_imp.id(169426572448939452)
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
 p_id=>wwv_flow_imp.id(169427978745939452)
,p_name=>'move tab1'
,p_static_id=>'move-tab-2'
,p_event_sequence=>500
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(654000419029289318)
,p_triggering_element=>'TERMSANDCONDITION'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'TERMSANDCONDITIONHEADCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169428508892939452)
,p_event_id=>wwv_flow_imp.id(169427978745939452)
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
 p_id=>wwv_flow_imp.id(169428923763939452)
,p_name=>'move tab2'
,p_static_id=>'move-tab-3'
,p_event_sequence=>510
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(658272093638398082)
,p_triggering_element=>'FOOTERNOTE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'FOOTERNOTE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169429341040939452)
,p_event_id=>wwv_flow_imp.id(169428923763939452)
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
 p_id=>wwv_flow_imp.id(169429743940939452)
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
 p_id=>wwv_flow_imp.id(169430275133939453)
,p_event_id=>wwv_flow_imp.id(169429743940939452)
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
 p_id=>wwv_flow_imp.id(169430686316939453)
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
 p_id=>wwv_flow_imp.id(169431156475939453)
,p_event_id=>wwv_flow_imp.id(169430686316939453)
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
 p_id=>wwv_flow_imp.id(169431617517939453)
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
 p_id=>wwv_flow_imp.id(169432043354939453)
,p_event_id=>wwv_flow_imp.id(169431617517939453)
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
 p_id=>wwv_flow_imp.id(169433373737939453)
,p_name=>'move tab next'
,p_static_id=>'move-tab-next'
,p_event_sequence=>560
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'DESCRIPTION'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'ITEMCODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169433842676939453)
,p_event_id=>wwv_flow_imp.id(169433373737939453)
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
 p_id=>wwv_flow_imp.id(169425690289939450)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>480
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169426147966939450)
,p_event_id=>wwv_flow_imp.id(169425690289939450)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-remove-class'
,p_action=>'NATIVE_REMOVE_CLASS'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(654125604639489980)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'css_class', 'ui-dialog-titlebar-close .ui-icon')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(169414773681939446)
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
 p_id=>wwv_flow_imp.id(169415238376939446)
,p_event_id=>wwv_flow_imp.id(169414773681939446)
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
 p_id=>wwv_flow_imp.id(169413932326939446)
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
 p_id=>wwv_flow_imp.id(169414431666939446)
,p_event_id=>wwv_flow_imp.id(169413932326939446)
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
 p_id=>wwv_flow_imp.id(169413024021939446)
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
 p_id=>wwv_flow_imp.id(169413503861939446)
,p_event_id=>wwv_flow_imp.id(169413024021939446)
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
 p_id=>wwv_flow_imp.id(169404305604939441)
,p_name=>'P.O. Signed Copy Attached'
,p_static_id=>'p-o-signed-copy-attached'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169332191196939402)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169404769942939441)
,p_event_id=>wwv_flow_imp.id(169404305604939441)
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
 p_id=>wwv_flow_imp.id(169380141340939430)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169352949528939417)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169381183098939430)
,p_event_id=>wwv_flow_imp.id(169380141340939430)
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
 p_id=>wwv_flow_imp.id(169381670624939432)
,p_event_id=>wwv_flow_imp.id(169380141340939430)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169380727575939430)
,p_event_id=>wwv_flow_imp.id(169380141340939430)
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
 p_id=>wwv_flow_imp.id(169401568949939439)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>240
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169343554678939410)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169402077721939439)
,p_event_id=>wwv_flow_imp.id(169401568949939439)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1243898235897710871)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(53136318910550939)
,p_name=>'Send Email to Party'
,p_static_id=>'send-email-to-party'
,p_event_sequence=>670
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169333381931939402)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(53136417247550940)
,p_event_id=>wwv_flow_imp.id(53136318910550939)
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
 p_id=>wwv_flow_imp.id(169436151234939455)
,p_name=>'SET'
,p_static_id=>'set'
,p_event_sequence=>580
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'DESCRIPTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169436726327939455)
,p_event_id=>wwv_flow_imp.id(169436151234939455)
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
 p_id=>wwv_flow_imp.id(169434279699939455)
,p_name=>'set amount'
,p_static_id=>'set-amount'
,p_event_sequence=>570
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'QUANTITY1,QUANTITY2,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,DISCOUNTRATE,RATEAFTERDISCOUNT,RATE,AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169434784590939455)
,p_event_id=>wwv_flow_imp.id(169434279699939455)
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
 p_id=>wwv_flow_imp.id(169435787963939455)
,p_event_id=>wwv_flow_imp.id(169434279699939455)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(654125604639489980)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169435321455939455)
,p_event_id=>wwv_flow_imp.id(169434279699939455)
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
 p_id=>wwv_flow_imp.id(169440356733939458)
,p_name=>'set balance qty'
,p_static_id=>'set-balance-qty'
,p_event_sequence=>610
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'ITEMCODE,ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169440930441939458)
,p_event_id=>wwv_flow_imp.id(169440356733939458)
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
 p_id=>wwv_flow_imp.id(169405152012939441)
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
 p_id=>wwv_flow_imp.id(169405706070939441)
,p_event_id=>wwv_flow_imp.id(169405152012939441)
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
 p_id=>wwv_flow_imp.id(169415679438939446)
,p_name=>'set decimal on qty2'
,p_static_id=>'set-decimal-on-qty'
,p_event_sequence=>380
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169416155065939447)
,p_event_id=>wwv_flow_imp.id(169415679438939446)
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
 p_id=>wwv_flow_imp.id(169397888882939438)
,p_name=>'Set Footer Total'
,p_static_id=>'set-footer-total'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(169349453205939414)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169398865920939438)
,p_event_id=>wwv_flow_imp.id(169397888882939438)
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
 p_id=>wwv_flow_imp.id(169398402878939438)
,p_event_id=>wwv_flow_imp.id(169397888882939438)
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
 p_id=>wwv_flow_imp.id(169418342416939447)
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
 p_id=>wwv_flow_imp.id(169418891421939447)
,p_event_id=>wwv_flow_imp.id(169418342416939447)
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
 p_id=>wwv_flow_imp.id(169389664213939435)
,p_name=>'set hsn code'
,p_static_id=>'set-hsn-code'
,p_event_sequence=>130
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169390195507939435)
,p_event_id=>wwv_flow_imp.id(169389664213939435)
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
 p_id=>wwv_flow_imp.id(169390725633939435)
,p_event_id=>wwv_flow_imp.id(169389664213939435)
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
 p_id=>wwv_flow_imp.id(169444039452939460)
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
 p_id=>wwv_flow_imp.id(169444626621939460)
,p_event_id=>wwv_flow_imp.id(169444039452939460)
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
 p_id=>wwv_flow_imp.id(53137343641550949)
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
 p_id=>wwv_flow_imp.id(53137457363550950)
,p_event_id=>wwv_flow_imp.id(53137343641550949)
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
 p_id=>wwv_flow_imp.id(169403402485939441)
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
 p_id=>wwv_flow_imp.id(169403884070939441)
,p_event_id=>wwv_flow_imp.id(169403402485939441)
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
 p_id=>wwv_flow_imp.id(169388821816939435)
,p_name=>'Set page item sno'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>120
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169389259226939435)
,p_event_id=>wwv_flow_imp.id(169388821816939435)
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
 p_id=>wwv_flow_imp.id(169406068986939441)
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
 p_id=>wwv_flow_imp.id(169407590842939442)
,p_event_id=>wwv_flow_imp.id(169406068986939441)
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
 p_id=>wwv_flow_imp.id(169408076373939442)
,p_event_id=>wwv_flow_imp.id(169406068986939441)
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
 p_id=>wwv_flow_imp.id(169406609164939442)
,p_event_id=>wwv_flow_imp.id(169406068986939441)
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
 p_id=>wwv_flow_imp.id(169407123110939442)
,p_event_id=>wwv_flow_imp.id(169406068986939441)
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
 p_id=>wwv_flow_imp.id(169416552831939447)
,p_name=>'Set Qty1'
,p_static_id=>'set-qty'
,p_event_sequence=>390
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
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
 p_id=>wwv_flow_imp.id(169417084266939447)
,p_event_id=>wwv_flow_imp.id(169416552831939447)
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
 p_id=>wwv_flow_imp.id(169410243168939444)
,p_name=>'Set Quantity2'
,p_static_id=>'set-quantity'
,p_event_sequence=>320
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169410782383939444)
,p_event_id=>wwv_flow_imp.id(169410243168939444)
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
 p_id=>wwv_flow_imp.id(174130000474657811)
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
 p_id=>wwv_flow_imp.id(174130111251657812)
,p_event_id=>wwv_flow_imp.id(174130000474657811)
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
 p_id=>wwv_flow_imp.id(169391129088939435)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(654125604639489980)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169391616565939435)
,p_event_id=>wwv_flow_imp.id(169391129088939435)
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
 p_id=>wwv_flow_imp.id(61637791754220517)
,p_name=>'Set the Default Party Email'
,p_static_id=>'set-the-default-party-email'
,p_event_sequence=>700
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(60209783104689966)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(61637935200220519)
,p_event_id=>wwv_flow_imp.id(61637791754220517)
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
 p_id=>wwv_flow_imp.id(61637833866220518)
,p_event_id=>wwv_flow_imp.id(61637791754220517)
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
 p_id=>wwv_flow_imp.id(169411170001939444)
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
 p_id=>wwv_flow_imp.id(169411722242939444)
,p_event_id=>wwv_flow_imp.id(169411170001939444)
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
 p_id=>wwv_flow_imp.id(169419301331939447)
,p_name=>'Set Unit'
,p_static_id=>'set-unit'
,p_event_sequence=>420
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(651062500031082203)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169419752722939447)
,p_event_id=>wwv_flow_imp.id(169419301331939447)
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
 p_id=>wwv_flow_imp.id(169420247394939449)
,p_event_id=>wwv_flow_imp.id(169419301331939447)
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
 p_id=>wwv_flow_imp.id(169396132215939438)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>190
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(654125604639489980)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(169396617695939438)
,p_event_id=>wwv_flow_imp.id(169396132215939438)
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
 p_id=>wwv_flow_imp.id(169423012284939449)
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
 p_id=>wwv_flow_imp.id(169423490287939450)
,p_event_id=>wwv_flow_imp.id(169423012284939449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P118_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(52076745400721862)
,p_name=>'Upload File'
,p_static_id=>'upload-file'
,p_event_sequence=>660
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(53134147830550917)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'PLUGIN_DE.DANIELH.DROPZONE2|REGION TYPE|dropzone-upload-success'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(52076951737721864)
,p_event_id=>wwv_flow_imp.id(52076745400721862)
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
 p_id=>wwv_flow_imp.id(52077068589721865)
,p_event_id=>wwv_flow_imp.id(52076745400721862)
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
 p_id=>wwv_flow_imp.id(53138454523550960)
,p_event_id=>wwv_flow_imp.id(52076745400721862)
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
 p_id=>wwv_flow_imp.id(61638352164220523)
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
 p_id=>wwv_flow_imp.id(61638561667220525)
,p_event_id=>wwv_flow_imp.id(61638352164220523)
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
 p_id=>wwv_flow_imp.id(61638462220220524)
,p_event_id=>wwv_flow_imp.id(61638352164220523)
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
,p_build_option_id=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(61638034344220520)
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
 p_id=>wwv_flow_imp.id(61638279478220522)
,p_event_id=>wwv_flow_imp.id(61638034344220520)
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
 p_id=>wwv_flow_imp.id(61638168125220521)
,p_event_id=>wwv_flow_imp.id(61638034344220520)
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
,p_build_option_id=>wwv_flow_imp.id(573771056156959416)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169363244305939422)
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
 p_id=>wwv_flow_imp.id(169360504593939421)
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
 p_id=>wwv_flow_imp.id(169364888434939424)
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
,p_process_when_button_id=>wwv_flow_imp.id(169355383862939417)
,p_internal_uid=>61083354634557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169362836235939422)
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
 p_id=>wwv_flow_imp.id(169266902503939357)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(651062500031082203)
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
 p_id=>wwv_flow_imp.id(53135964671550935)
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
 p_id=>wwv_flow_imp.id(61638909191220528)
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
 p_id=>wwv_flow_imp.id(169351162515939416)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(654125604639489980)
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
 p_id=>wwv_flow_imp.id(169364530510939424)
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
 p_id=>wwv_flow_imp.id(169363697135939422)
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
 p_id=>wwv_flow_imp.id(169364048982939422)
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
 p_id=>wwv_flow_imp.id(169339911992939405)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(658274824140398109)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form E-Mail'
,p_static_id=>'initialize-form-e-mail'
,p_internal_uid=>61058378192557098
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169289204406939371)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(653766931975247397)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Purchase Order'
,p_static_id=>'initialize-form-purchase-order'
,p_internal_uid=>61007670606557064
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169331097495939400)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(658273239251398093)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Vendor Accptance'
,p_static_id=>'initialize-form-vendor-accptance'
,p_internal_uid=>61049563695557093
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(33489919864959520)
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
 p_id=>wwv_flow_imp.id(169366453457939424)
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
 p_id=>wwv_flow_imp.id(169366893621939424)
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
 p_id=>wwv_flow_imp.id(169362083658939422)
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
 p_id=>wwv_flow_imp.id(169365728939939424)
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
 p_id=>wwv_flow_imp.id(169289567119939371)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(653766931975247397)
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
 p_id=>wwv_flow_imp.id(169331454443939400)
,p_process_sequence=>180
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(658273239251398093)
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
 p_id=>wwv_flow_imp.id(169366119939939424)
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
 p_id=>wwv_flow_imp.id(53136966872550945)
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
,p_process_when_button_id=>wwv_flow_imp.id(169333381931939402)
,p_process_when_type=>'NEVER'
,p_internal_uid=>35669954747321629
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(53137022575550946)
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
,p_process_when_button_id=>wwv_flow_imp.id(169333381931939402)
,p_internal_uid=>35670010450321630
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169365256303939424)
,p_process_sequence=>220
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P118_TNO, :P118_PURCHASEORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(169356170265939417)
,p_internal_uid=>61083722503557117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169362448850939422)
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
 p_id=>wwv_flow_imp.id(169323705833939397)
,p_process_sequence=>170
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(658272093638398082)
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
 p_id=>wwv_flow_imp.id(169316357105939391)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(654000419029289318)
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
 p_id=>wwv_flow_imp.id(169361700193939422)
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
,p_process_when_button_id=>wwv_flow_imp.id(169355797611939417)
,p_internal_uid=>61080166393557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169360846231939421)
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
,p_process_when_button_id=>wwv_flow_imp.id(169356170265939417)
,p_internal_uid=>61079312431557114
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169361309041939422)
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
,p_process_when_button_id=>wwv_flow_imp.id(169355797611939417)
,p_internal_uid=>61079775241557115
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(169267273101939357)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(651062500031082203)
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
