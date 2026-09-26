prompt --application/pages/page_00161
begin
--   Manifest
--     PAGE: 00161
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
 p_id=>161
,p_name=>'Despatch Advice'
,p_alias=>'DESPATCH-ADVICE'
,p_step_title=>'Despatch Advice'
,p_autocomplete_on_off=>'OFF'
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
'   var bireporturl = $(''#P161_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/DespatchAdvice.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P161_TNO'').val() ',
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
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P161_BIREPORTURL'').val()',
'  var reportName =  ''DespatchAdvice.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P161_TNO'').val() ',
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
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.ui-dialog.ui-dialog--notification{',
'    border-radius: 10px;',
'    background-color: var(--a-palette-warning);',
'}',
'.a-AlertMessage-icon{',
'    color: white;',
'}',
'',
'/* WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1 */',
'/* A track appears only when the grid columns exceed the available width. */',
'.a-IG .a-GV-bdy {',
'  overflow-x: auto !important;',
'}',
'',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: auto !important;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(765197363081957702)
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
 p_id=>wwv_flow_imp.id(1132580341380026759)
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
 p_id=>wwv_flow_imp.id(619097203493061559)
,p_plug_name=>'Despatch Advice'
,p_static_id=>'despatch-advice'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.LOCATIONCODE,',
'       a.DOCTYPECODE,',
'       a.COMPANYCODE,',
'       a.FINANCIALYEARCODE,',
'       a.DESPATCHADVICENO,',
'       a.DESPATCHADVICEDATE,',
'       a.PARTYCODE,',
'       a.TRANSPORTERCODE,',
'       a.DRIVERNAME,',
'       a.VEHICLETYPECODE,',
'       a.VEHICLENO,',
'       a.REFDOCTYPECODE,',
'       a.REFDOCUMENTNO,',
'       a.REFDOCUMENTDATE,',
'       a.REFDOCUMENTAMOUNT,',
'       a.REMARK,',
'       a.SALESORDERTNO,',
'       a.AGENTCODE,',
'       a.CONSIGNEECODE,',
'       a.REFERENCETNO,',
'       a.EMPLOYEECODE,',
'       a.WEIGHMENTTNO,',
'       a.CREATOR,',
'       a.MODULETNO,',
'       a.MODULECODE,',
'       a.CREATIONTIME,',
'       a.TRANSPORTALLOCATIONTNO,',
'       a.OLDVEHICLENO,',
'       NVL(getdocumentstatuscode(getmodulecodeforpageno(:APP_PAGE_ID), A.TNO),''STATUS'') AS Status',
'  from DESPATCHADVICE a'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(616379574752199431)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(616379737119199432)
,p_plug_name=>'Item Detail'
,p_static_id=>'item-detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.rowid , A.TNO,',
'       A.SNO,',
'       A.ITEMCODE,',
'       A.ITEMSPECIFICATIONCODE,',
'       A.PACKINGTYPECODE,',
'       A.DESCRIPTION,',
'       A.RATE,',
'       A.QUANTITY1,',
'       --c.MEASURINGUNITCODE UOM1,',
'       A.QUANTITY2,',
'       --D.MEASURINGUNITCODE UOM2,',
'       A.REASONFORRETURN,',
'       A.REMARK,',
'       A.SERIALNO,',
'       A.ISWEIGHTTAKEN,',
'       A.WEIGHMENTTNO,',
'       A.PACKINGNOS,',
'       A.CANCELEDQUANTITY1,',
'       A.CANCELEDBY,',
'       GetMeasuringUnitNameFromItem(A.ITEMCODE) as UNIT1,',
'       GetMeasuringUnit2NameFromItem(A.ITEMCODE) as UNIT2,',
'       NULL AS Balance',
'  from DESPATCHADVICEDETAIL A',
'  where  A.TNO = :P161_TNO',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P161_TNO,P161_DOCTYPECODE,P161_REFERENCETNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Item Detail'
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
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(619209539016471802)
,p_heading=>'ITEM'
,p_static_id=>'item'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(619209779949471805)
,p_heading=>'PACKING'
,p_static_id=>'packing'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(619209614428471803)
,p_heading=>'PRIMARY'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(619209664119471804)
,p_heading=>'SECONDARY'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(619209948937471806)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(619209998424471807)
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
 p_id=>wwv_flow_imp.id(307758847067957415)
,p_name=>'BALANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Balance'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(619209192532471799)
,p_name=>'CANCELEDBY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCELEDBY'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Canceledby'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
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
 p_id=>wwv_flow_imp.id(619209134863471798)
,p_name=>'CANCELEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CANCELEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Canceledquantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
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
 p_id=>wwv_flow_imp.id(619208200605471789)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(619208789746471795)
,p_name=>'ISWEIGHTTAKEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISWEIGHTTAKEN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Isweighttaken'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
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
 p_id=>wwv_flow_imp.id(457553090660198260)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(619244290173590471)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'ROWID'
,p_ajax_items_to_submit=>'P161_DOCTYPECODE,P161_REFERENCETNO'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(616380182770199437)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(619244497556616387)
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P161_DOCTYPECODE,ITEMSPECIFICATIONCODE,P161_REFERENCETNO,ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(619209048268471797)
,p_name=>'PACKINGNOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGNOS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Qty'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(619209779949471805)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(616380286496199438)
,p_name=>'PACKINGTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Packing Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(619209779949471805)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PACKINGTYPENAME, PACKINGTYPECODE ',
'FROM PACKINGTYPE ORDER BY 1'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
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
 p_id=>wwv_flow_imp.id(619208267278471790)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(619209614428471803)
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(619208394225471791)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(619209664119471804)
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(37389283421785695)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>240
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(619208528670471792)
,p_name=>'REASONFORRETURN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REASONFORRETURN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Reasonforreturn'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(619208572473471793)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
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
 p_id=>wwv_flow_imp.id(623144404650080451)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>220
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(619208685698471794)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sl.No.'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'SERIALNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(616380041983199435)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
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
 p_id=>wwv_flow_imp.id(616379948451199434)
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
,p_default_expression=>'P161_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618734720891218520)
,p_name=>'UNIT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(619209614428471803)
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(618734809762218521)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(619209664119471804)
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(619208855603471796)
,p_name=>'WEIGHMENTTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WEIGHMENTTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Weighment No'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(616379795834199433)
,p_internal_uid=>166513246751806545
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
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
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function( options ) {',
'    //Tab and Shift-Tab will skip over cells that are read-only',
'    options.defaultGridViewOptions = {  ',
'        skipReadonlyCells: true  ',
'    };',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(619213794923478603)
,p_interactive_grid_id=>wwv_flow_imp.id(616379795834199433)
,p_static_id=>'1693473'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(619213957609478606)
,p_report_id=>wwv_flow_imp.id(619213794923478603)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(51572036598619372)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(37389283421785695)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76.0312
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(309348085837100531)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(307758847067957415)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>72
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449894425783600897)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(618734720891218520)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>58
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449895389662600904)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(618734809762218521)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>60
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(451107513501763150)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(623144404650080451)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(458043290729140907)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(457553090660198260)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>186
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619214459659478617)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(616379948451199434)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619215391621478621)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(616380041983199435)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619217119077478625)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(616380182770199437)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>454
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619218008357478627)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(616380286496199438)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619218885112478631)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(619208200605471789)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619219789226478634)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(619208267278471790)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619220662422478637)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(619208394225471791)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619221565519478639)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(619208528670471792)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619222464634478642)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(619208572473471793)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>151
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619223415400478644)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(619208685698471794)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>56
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619224346825478648)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(619208789746471795)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619225169747478650)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(619208855603471796)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619226143253478652)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(619209048268471797)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619227010614478654)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(619209134863471798)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619227885479478656)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(619209192532471799)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(619252168612654158)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(619209948937471806)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(448465225298164353)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_static_id=>'sum'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(619208267278471790)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(448465309242164353)
,p_view_id=>wwv_flow_imp.id(619213957609478606)
,p_static_id=>'sum-2'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(619208394225471791)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(311626151470576471)
,p_button_sequence=>340
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
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
 p_id=>wwv_flow_imp.id(619135378361161086)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
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
 p_id=>wwv_flow_imp.id(619136970512161087)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P161_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619136159209161087)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
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
,p_button_condition=>'P161_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619137799991161087)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P161_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619138214858161087)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P161_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(457005302435356750)
,p_button_sequence=>330
,p_button_plug_id=>wwv_flow_imp.id(616379737119199432)
,p_button_name=>'GetItem'
,p_static_id=>'getitem'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619137447409161087)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
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
,p_button_condition=>'P161_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619136566970161087)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P161_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619135847251161086)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P161_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(619138558336161087)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(765197363081957702)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P161_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P161_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(619119498438061588)
,p_branch_name=>'Go To Page 160'
,p_branch_action=>'f?p=&APP_ID.:160:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(619136159209161087)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619104660611061576)
,p_name=>'P161_AGENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Agent'
,p_source=>'AGENTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname,partycode ',
'from party a',
'where getdocumentstatuscode(''PARTY'',a.tno)=''ACTIVE''',
'AND A.PARTYTYPECODE=''AGENT'' ',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cSize=>40
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(462599123257531988)
,p_name=>'P161_ALLOWEDBACK'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(462599470033535509)
,p_name=>'P161_ALLOWEDFORWARD'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1218972790203268733)
,p_name=>'P161_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160354444987000341)
,p_name=>'P161_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_item_default=>'160'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(456838884997709498)
,p_name=>'P161_CALLEDFROMTNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619098720918061569)
,p_name=>'P161_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619105096568061576)
,p_name=>'P161_CONSIGNEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Consignee'
,p_source=>'CONSIGNEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT partyname, partycode',
'FROM party a',
'WHERE getdocumentstatuscode(''PARTY'', a.tno) = ''ACTIVE''',
'  AND (',
'        (:P161_DOCTYPECODE = ''SALE''AND a.partytypecode IN (''CUSTOMER'', ''AGENT''))',
'     OR (:P161_DOCTYPECODE = ''CONVERSIONJOBOUTOFPREMISES'' AND a.partytypecode IN (''CONTRACTOR'', ''SUPPLIER''))',
'     OR (:P161_DOCTYPECODE = ''PURCHASERETURN'' AND a.partytypecode IN (''SUPPLIER''))',
'      )',
'ORDER BY partyname;'))
,p_lov_display_null=>'YES'
,p_cSize=>40
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(619106653926061577)
,p_name=>'P161_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619099921223061570)
,p_name=>'P161_DESPATCHADVICEDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Despatch Advice Date'
,p_source=>'DESPATCHADVICEDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>40
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P161_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P161_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619099532419061569)
,p_name=>'P161_DESPATCHADVICENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Despatch Advice No'
,p_source=>'DESPATCHADVICENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
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
 p_id=>wwv_flow_imp.id(619098331438061569)
,p_name=>'P161_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOCTYPE'
,p_lov_display_null=>'YES'
,p_cSize=>40
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(619101132067061570)
,p_name=>'P161_DRIVERNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Driver Name'
,p_source=>'DRIVERNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
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
 p_id=>wwv_flow_imp.id(619105909810061577)
,p_name=>'P161_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Undersigned'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select employeename,employeecode from employee a',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_cSize=>40
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(619099135923061569)
,p_name=>'P161_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160354358508000340)
,p_name=>'P161_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P161_TNO is null then',
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
 p_id=>wwv_flow_imp.id(619097874335061569)
,p_name=>'P161_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_default=>'RC'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOCATION'
,p_lov_display_null=>'YES'
,p_cSize=>40
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(619107471284061577)
,p_name=>'P161_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160350641191000303)
,p_name=>'P161_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619107055912061577)
,p_name=>'P161_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619264728784011351)
,p_name=>'P161_NEXT_SERIALNO'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(616379737119199432)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57506238342321303)
,p_name=>'P161_NOTIFICATION'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619108747118061578)
,p_name=>'P161_OLDVEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'OLDVEHICLENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1159758862086729037)
,p_name=>'P161_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619100344797061570)
,p_name=>'P161_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Party '
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P161_PARTY'
,p_lov_cascade_parent_items=>'P161_DOCTYPECODE,P161_REFERENCETNO,P161_PARTYTYPECODE'
,p_ajax_items_to_submit=>'P161_DOCTYPECODE,P161_REFERENCETNO,P161_PARTYTYPECODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>40
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450269775079757626)
,p_name=>'P161_PARTYTYPECODE'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1134407379951375501)
,p_name=>'P161_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619102334949061571)
,p_name=>'P161_REFDOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'REFDOCTYPECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619103535722061572)
,p_name=>'P161_REFDOCUMENTAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'REFDOCUMENTAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619103072821061572)
,p_name=>'P161_REFDOCUMENTDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'REFDOCUMENTDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619102670244061571)
,p_name=>'P161_REFDOCUMENTNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'REFDOCUMENTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619105544918061577)
,p_name=>'P161_REFERENCETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Reference No'
,p_source=>'REFERENCETNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P161_REFERENCENO'
,p_lov_cascade_parent_items=>'P161_DOCTYPECODE,P161_LOCATIONCODE,P161_TNO'
,p_ajax_items_to_submit=>'P161_DESPATCHADVICEDATE,P161_DOCTYPECODE,P161_LOCATIONCODE,P161_TNO,P161_REFERENCETNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>40
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '900')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619103929378061572)
,p_name=>'P161_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(619104265120061573)
,p_name=>'P161_SALESORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'SALESORDERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(616379260208199428)
,p_name=>'P161_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P161_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1134407216306375500)
,p_name=>'P161_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1132580341380026759)
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
 p_id=>wwv_flow_imp.id(619097517678061563)
,p_name=>'P161_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619108254002061578)
,p_name=>'P161_TRANSPORTALLOCATIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'TRANSPORTALLOCATIONTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619100709732061570)
,p_name=>'P161_TRANSPORTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Transporter'
,p_source=>'TRANSPORTERCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname,partycode from party a',
'where a.partytypecode=''TRANSPORTER''',
'and getdocumentstatuscode(''PARTY'',A.TNO)=''ACTIVE''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>40
,p_cMaxlength=>30
,p_colspan=>6
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(619101934269061571)
,p_name=>'P161_VEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Vehicle No'
,p_source=>'VEHICLENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(619101461262061570)
,p_name=>'P161_VEHICLETYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(616379574752199431)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_prompt=>'Vehicle Type'
,p_source=>'VEHICLETYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select vehicletypename,vehicletypecode from vehicletype a',
'order by 1'))
,p_cSize=>40
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(619106301404061577)
,p_name=>'P161_WEIGHMENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_item_source_plug_id=>wwv_flow_imp.id(619097203493061559)
,p_source=>'WEIGHMENTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(618735146802218524)
,p_name=>'Check Pending Son Qty'
,p_static_id=>'check-pending-son-qty'
,p_event_sequence=>180
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457006297497356760)
,p_event_id=>wwv_flow_imp.id(618735146802218524)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Against JO'
,p_static_id=>'against-jo'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'QUANTITY1,ITEMCODE,ITEMSPECIFICATIONCODE,P161_SALESORDERTNO,P161_REFERENCETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp float;',
    '    tmp1 float;',
    'begin',
    '    if :P161_FORMSTATUS in  (''NEWRECORD'',''EDITRECORD'') then',
    '        tmp := GETPENDINGJOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P161_REFERENCETNO);',
    '        ',
    '        if :QUANTITY1 > tmp then',
    '            :QUANTITY1 := 0;',
    '            --raise_application_error(-20000,''Entered Quantity cannot be greater than JOB ORDER Quantity1.'');',
    '        end if;',
    '    else',
    '         tmp := GETPENDINGJOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P161_REFERENCETNO);',
    '',
    '         select sum(b.quantity1) into tmp1 from despatchadvice a , despatchadvicedetail b',
    '        where a.tno = b.tno',
    '        and a.REFERENCETNO = :P161_REFERENCETNO',
    '        and b.itemcode = :ITEMCODE',
    '        and b.ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '        ',
    '        if :QUANTITY1 > tmp+tmp1 then',
    '            :QUANTITY1 := 0;',
    '            --raise_application_error(-20000,''Entered Quantity cannot be greater than JOB ORDER Quantity1.'');',
    '        end if;',
    '',
    '    end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P161_DOCTYPECODE'
,p_client_condition_expression=>'CONVERSIONJOBOUTOFPREMISES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(618735206199218525)
,p_event_id=>wwv_flow_imp.id(618735146802218524)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Against SO'
,p_static_id=>'against-so'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'QUANTITY1,ITEMCODE,ITEMSPECIFICATIONCODE,P161_SALESORDERTNO,P161_REFERENCETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp float;',
    '    tmp1 float;',
    'begin',
    '    if :P161_FORMSTATUS in  (''NEWRECORD'',''EDITRECORD'') then',
    '        tmp := GETPENDINGSOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P161_REFERENCETNO);',
    '        ',
    '        if :QUANTITY1 > tmp then',
    '            :QUANTITY1 := 0.000;',
    '            --raise_application_error(-20000,''Entered Quantity cannot be greater than SALES ORDER Quantity1.'');',
    '        end if;',
    '    else',
    '         tmp := GETPENDINGSOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P161_REFERENCETNO);',
    '',
    '         select sum(b.quantity1) into tmp1 from despatchadvice a , despatchadvicedetail b',
    '        where a.tno = b.tno',
    '        and a.REFERENCETNO = :P161_REFERENCETNO',
    '        and b.itemcode = :ITEMCODE',
    '        and b.ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '        ',
    '        if :QUANTITY1 > tmp+tmp1 then',
    '            :QUANTITY1 := 0.000;',
    '            --raise_application_error(-20000,''Entered Quantity cannot be greater than SALES ORDER Quantity1.'');',
    '        end if;',
    '',
    '    end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P161_DOCTYPECODE'
,p_client_condition_expression=>'SALE'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(307759373790957420)
,p_event_id=>wwv_flow_imp.id(618735146802218524)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Against SO'
,p_static_id=>'against-so-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'QUANTITY1,BALANCE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp float;',
    '    tmp1 float;',
    'begin',
    '--RAISE_APPLICATION_ERROR(-20000,''Q ''||:QUANTITY1||'' B ''||:BALANCE);',
    '    if :P161_FORMSTATUS in  (''NEWRECORD'',''EDITRECORD'') then',
    ' ',
    '        if TO_NUMBER(:QUANTITY1) > TO_NUMBER(:balance) then',
    '            :QUANTITY1 := 0.000;',
    '            --raise_application_error(-20000,''Entered Quantity cannot be greater than SALES ORDER Quantity1.'');',
    '        end if;',
    '',
    '    end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P161_DOCTYPECODE'
,p_client_condition_expression=>'SALE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(507155227754339757)
,p_event_id=>wwv_flow_imp.id(618735146802218524)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '',
    '',
    'raise_application_error(-20000,''Quantity mismatch.'');')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'QUANTITY1'
,p_client_condition_expression=>'.000'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(512889455464843283)
,p_event_id=>wwv_flow_imp.id(618735146802218524)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(456998122601344905)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(619135378361161086)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(466578386426892092)
,p_event_id=>wwv_flow_imp.id(456998122601344905)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P161_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P161_TNO);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(456998538308344922)
,p_event_id=>wwv_flow_imp.id(456998122601344905)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P161_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from DESPATCHADVICEDETAIL  a',
    '    where not exists (',
    '        select 1 from DESPATCHADVICE   aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P161_TNO;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(456999345800346031)
,p_event_id=>wwv_flow_imp.id(456998122601344905)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P161_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P161_CALLEDFROMTNO'').getValue();',
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
 p_id=>wwv_flow_imp.id(619154134411185691)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619154531947185691)
,p_event_id=>wwv_flow_imp.id(619154134411185691)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619136159209161087)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619154980485185691)
,p_event_id=>wwv_flow_imp.id(619154134411185691)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619136159209161087)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P161_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457907569353749068)
,p_event_id=>wwv_flow_imp.id(619154134411185691)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619136159209161087)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from materialout where REFERENCETNO  = :P161_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619155536027185691)
,p_event_id=>wwv_flow_imp.id(619154134411185691)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619136159209161087)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619159038337188183)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619159927060188184)
,p_event_id=>wwv_flow_imp.id(619159038337188183)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619136566970161087)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619159352947188184)
,p_event_id=>wwv_flow_imp.id(619159038337188183)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619136566970161087)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619155851084186620)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619156808233186622)
,p_event_id=>wwv_flow_imp.id(619155851084186620)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619135847251161086)
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
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.UPDATEPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619156324531186622)
,p_event_id=>wwv_flow_imp.id(619155851084186620)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619135847251161086)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P161_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457907625751749069)
,p_event_id=>wwv_flow_imp.id(619155851084186620)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619135847251161086)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from materialout where REFERENCETNO  = :P161_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619157348353186623)
,p_event_id=>wwv_flow_imp.id(619155851084186620)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619135847251161086)
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
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.UPDATEPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619157656366187488)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619158648717187488)
,p_event_id=>wwv_flow_imp.id(619157656366187488)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619138558336161087)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619158131221187488)
,p_event_id=>wwv_flow_imp.id(619157656366187488)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619138558336161087)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619146141937166638)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(619138558336161087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619149491422166639)
,p_event_id=>wwv_flow_imp.id(619146141937166638)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619138558336161087)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P161_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619149024959166639)
,p_event_id=>wwv_flow_imp.id(619146141937166638)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619138558336161087)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619147038591166638)
,p_event_id=>wwv_flow_imp.id(619146141937166638)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P161_TNO,P161_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--SetDocumentStatusCode(''PURCHASEORDER'',13604,:P161_STATUS);',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P161_TNO,:P161_STATUS);')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619147482966166638)
,p_event_id=>wwv_flow_imp.id(619146141937166638)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619138558336161087)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text($v(''P161_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(467241077715253961)
,p_event_id=>wwv_flow_imp.id(619146141937166638)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619138558336161087)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'location.reload()',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619148543689166639)
,p_event_id=>wwv_flow_imp.id(619146141937166638)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(765197363081957702)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619146510918166638)
,p_event_id=>wwv_flow_imp.id(619146141937166638)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P161_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619152311490184896)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619152663324184896)
,p_event_id=>wwv_flow_imp.id(619152311490184896)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619137447409161087)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P161_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619153239729184896)
,p_event_id=>wwv_flow_imp.id(619152311490184896)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619137799991161087)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P161_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619153730850184896)
,p_event_id=>wwv_flow_imp.id(619152311490184896)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(619138214858161087)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P161_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619143788011165469)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(619137799991161087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619144698881165469)
,p_event_id=>wwv_flow_imp.id(619143788011165469)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P161_TNO,P161_COMPANYCODE,P161_PURCHASEORDERNO,P161_PASSFAILREMARK',
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
    '						--and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '                        AND A.ModuleTno = :P161_TNO',
    '						--and d.LoginName = User',
    '						AND d.BossuserName = :APP_USER',
    '                        and a.isPass is null',
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
    '						a.remark = :P161_PASSFAILREMARK',
    '				where a.TNo = vPassFail.TNo;',
    '				COMMIT;',
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
 p_id=>wwv_flow_imp.id(619145201154165469)
,p_event_id=>wwv_flow_imp.id(619143788011165469)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619145708182165470)
,p_event_id=>wwv_flow_imp.id(619143788011165469)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619144210643165469)
,p_event_id=>wwv_flow_imp.id(619143788011165469)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P161_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619150709240169181)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(619136566970161087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619151100701169182)
,p_event_id=>wwv_flow_imp.id(619150709240169181)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(616379367785199429)
,p_name=>'go to party'
,p_static_id=>'go-to-party'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P161_DESPATCHADVICEDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(616379533153199430)
,p_event_id=>wwv_flow_imp.id(616379367785199429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P161_REFERENCETNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453638506185019568)
,p_name=>'Hide Nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>190
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453638620630019569)
,p_event_id=>wwv_flow_imp.id(453638506185019568)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(623144512739080452)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>128
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(623144655018080453)
,p_event_id=>wwv_flow_imp.id(623144512739080452)
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
 p_id=>wwv_flow_imp.id(457005381274356751)
,p_name=>'Insert from sales order'
,p_static_id=>'insert-from-sales-order'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(457005302435356750)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457005666209356753)
,p_event_id=>wwv_flow_imp.id(457005381274356751)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'by joborder'
,p_static_id=>'by-joborder'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P161_TNO,P161_REFERENCETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_referencetno despatchadvice.referencetno%TYPE     := :P161_REFERENCETNO;',
    '    v_tno          despatchadvicedetail.tno%TYPE        := :P161_TNO;',
    'BEGIN',
    '    INSERT INTO despatchadvicedetail (',
    '        tno,',
    '        sno,',
    '        itemcode,',
    '        itemspecificationcode,',
    '        description,',
    '        rate,',
    '        quantity1,',
    '        quantity2',
    '    )',
    '    WITH DespatchAgg AS (',
    '        SELECT',
    '            da.referencetno,',
    '            dad.itemcode,',
    '            dad.itemspecificationcode,',
    '            SUM(NVL(dad.quantity1, 0)) AS quantity1,',
    '            SUM(NVL(dad.quantity2, 0)) AS quantity2',
    '        FROM despatchadvice       da',
    '        JOIN despatchadvicedetail dad ON dad.tno = da.tno',
    '        WHERE da.referencetno = v_referencetno ',
    '          AND NOT EXISTS (',
    '                  SELECT 1',
    '                  FROM gatepass gp',
    '                  WHERE gp.referencetno = da.tno',
    '              )',
    '          AND NOT EXISTS (',
    '                  SELECT 1',
    '                  FROM documentstatusdetail ds',
    '                  WHERE ds.moduletno          = da.tno',
    '                    AND ds.documentstatuscode = ''CLOSED''',
    '              )',
    '        GROUP BY',
    '            da.referencetno,',
    '            dad.itemcode,',
    '            dad.itemspecificationcode',
    '    ),',
    '    GatepassAgg AS (',
    '        SELECT',
    '            da.referencetno          AS jobordertno,',
    '            gpd.itemcode,',
    '            gpd.itemspecificationcode,',
    '            SUM(NVL(gpd.quantity1, 0)) AS quantity1,',
    '            SUM(NVL(gpd.quantity2, 0)) AS quantity2',
    '        FROM gatepass       gp',
    '        JOIN gatepassdetail gpd ON gpd.tno= gp.tno',
    '        JOIN despatchadvice da  ON da.tno= gp.referencetno',
    '        WHERE da.referencetno = v_referencetno',
    '        GROUP BY',
    '            da.referencetno,',
    '            gpd.itemcode,',
    '            gpd.itemspecificationcode',
    '    ),',
    '    BalanceQty AS (',
    '        SELECT',
    '            jod.itemcode,',
    '            jod.itemspecificationcode,',
    '            jod.description,',
    '            jod.WITHOUTDISCOUNTRATE as rate,',
    '            NVL(jod.quantity1, 0) - NVL(ga.quantity1,  0) - NVL(daa.quantity1, 0) AS quantity1,',
    '            NVL(jod.quantity2, 0) - NVL(ga.quantity2,  0) - NVL(daa.quantity2, 0) AS quantity2',
    '        FROM joborder          jo',
    '        JOIN joborderdetail    jod ON jod.tno = jo.tno',
    '        LEFT JOIN GatepassAgg  ga  ON ga.jobordertno          = jo.tno',
    '                                   AND ga.itemcode              = jod.itemcode',
    '                                   AND ga.itemspecificationcode = jod.itemspecificationcode',
    '        LEFT JOIN DespatchAgg  daa ON daa.referencetno          = jo.tno',
    '                                   AND daa.itemcode              = jod.itemcode',
    '                                   AND daa.itemspecificationcode = jod.itemspecificationcode',
    '        WHERE jo.tno = v_referencetno',
    '    )',
    '    SELECT',
    '        v_tno,',
    '        globaltno.nextval,      ',
    '        itemcode,',
    '        itemspecificationcode,',
    '        description,',
    '        rate,',
    '        quantity1,',
    '        quantity2',
    '    FROM BalanceQty',
    '    WHERE quantity1 > 0         ',
    '       OR quantity2 > 0;',
    '',
    '    IF SQL%ROWCOUNT = 0 THEN',
    '        raise_application_error(-20001, ''No balance quantity found for JobOrder: '' || v_referencetno);',
    '    END IF;',
    '',
    'EXCEPTION',
    '    WHEN OTHERS THEN',
    '        ROLLBACK;',
    '        RAISE;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P161_DOCTYPECODE'
,p_client_condition_expression=>'CONVERSIONJOBOUTOFPREMISES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457005509907356752)
,p_event_id=>wwv_flow_imp.id(457005381274356751)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'by salesorder'
,p_static_id=>'by-salesorder'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P161_TNO,P161_REFERENCETNO,P161_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    --delete from Despatchadvicedetail where tno = :P161_TNO;',
    '    for vso in (',
    '            select',
    '            a.ITEMCODE,',
    '            a.ITEMSPECIFICATIONCODE,',
    '            DESCRIPTION,',
    '            A.RATE,',
    '            Nvl(a.quantity1, 0) - Nvl(b.quantity1, 0) - Nvl(c.quantity1, 0) - Nvl(d.quantity1, 0) quantity1,',
    '            Nvl(a.quantity2, 0) - Nvl(b.quantity2, 0) - Nvl(c.quantity2, 0) - Nvl(d.quantity2, 0) quantity2',
    '        from salesorderdetail a,',
    '       (Select BB.SALESORDERTNO,',
    '               CC.ITEMCODE,',
    '               CC.ITEMSPECIFICATIONCODE,',
    '               Sum(CC.QUANTITY1) QUANTITY1,',
    '               Sum(CC.QUANTITY2) QUANTITY2',
    '          From loadingadvice Bb, loadingadvicedetail Cc',
    '         Where BB.TNO = CC.TNO',
    '           And Not Exists',
    '         (Select 1 From ccinvoice xx Where xx.loadingadvicetno = bb.tno)',
    '         Group By BB.SALESORDERTNO, CC.ITEMCODE, CC.ITEMSPECIFICATIONCODE) b,',
    '       (Select BB.SALESORDERTNO,',
    '               CC.ITEMCODE,',
    '               CC.ITEMSPECIFICATIONCODE,',
    '               Sum(CC.QUANTITY1) QUANTITY1,',
    '               Sum(CC.QUANTITY2) QUANTITY2',
    '          From despatchadvice Bb, despatchadvicedetail Cc',
    '         Where BB.TNO = CC.TNO',
    '           And Not Exists (Select 1',
    '                  From ccinvoice xx',
    '                 Where xx.despatchadvicetno = bb.tno)',
    '         Group By BB.SALESORDERTNO, CC.ITEMCODE, CC.ITEMSPECIFICATIONCODE) c,',
    '       (Select BB.SALESORDERTNO,',
    '               CC.ITEMCODE,',
    '               CC.ITEMSPECIFICATIONCODE,',
    '               Sum(CC.QUANTITY1) QUANTITY1,',
    '               Sum(CC.QUANTITY2) QUANTITY2',
    '          From ccinvoice Bb, ccinvoicedetail Cc',
    '         Where BB.TNO = CC.TNO',
    '         Group By BB.SALESORDERTNO, CC.ITEMCODE, CC.ITEMSPECIFICATIONCODE) d',
    '         Where a.tno = b.salesordertno(+)',
    '           And a.itemcode = b.itemcode(+)',
    '           And a.itemspecificationcode = b.itemspecificationcode(+)',
    '           And a.tno = c.salesordertno(+)',
    '           And a.itemcode = c.itemcode(+)',
    '           And a.itemspecificationcode = c.itemspecificationcode(+)',
    '           And a.tno = d.salesordertno(+)',
    '           And a.itemcode = d.itemcode(+)',
    '           And a.itemspecificationcode = d.itemspecificationcode(+)',
    '           and a.tno = :P161_SALESORDERTNO',
    '           and Nvl(a.quantity1, 0) - Nvl(b.quantity1, 0) - Nvl(c.quantity1, 0) - Nvl(d.quantity1, 0) > 0',
    '        order by a.sno',
    '    ) loop',
    '        insert into Despatchadvicedetail',
    '            (',
    '                TNO,',
    '                SNO,',
    '                ITEMCODE,',
    '                ITEMSPECIFICATIONCODE,',
    '                DESCRIPTION,',
    '                RATE,',
    '                QUANTITY1,',
    '                QUANTITY2',
    '            )',
    '            values (',
    '                :P161_TNO,',
    '                globaltno.nextval,',
    '                vso.itemcode,',
    '                vso.itemspecificationcode,',
    '                vso.description,',
    '                vso.rate,',
    '                vso.quantity1,',
    '                vso.quantity2',
    '            );',
    '    end loop;',
    '  ',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(57506154821321302)
,p_event_id=>wwv_flow_imp.id(457005381274356751)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'by salesorder -- modified with notification'
,p_static_id=>'by-salesorder-modified-with-notification'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P161_NOTIFICATION',
  'items_to_submit', 'P161_TNO,P161_REFERENCETNO,P161_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    l_msg VARCHAR2(4000);',
    'BEGIN',
    '    -- Check the Available stock for the Items',
    '    SELECT LISTAGG(e.ITEMNAME || '' ~ '' || ee.ITEMSPECIFICATIONNAME, '', '') WITHIN GROUP (ORDER BY s.SNO)',
    '    INTO l_msg',
    '    FROM SALESORDERDETAIL s',
    '    JOIN ITEM e ON e.ITEMCODE = s.ITEMCODE',
    '    JOIN ITEMSPECIFICATION ee ON ee.TNO = e.TNO AND ee.ITEMSPECIFICATIONCODE = s.ITEMSPECIFICATIONCODE',
    '    LEFT JOIN (',
    '        SELECT st.ITEMCODE, st.ITEMSPECIFICATIONCODE, ',
    '               (SUM(NVL(st.STOCKQUANTITY1, 0)) - SUM(NVL(us.USEDSTOCKQUANTITY1, 0))) as AVAILABLE_QTY',
    '        FROM STOCK st',
    '        LEFT JOIN USEDSTOCK us ON us.STOCKTNO = st.TNO',
    '        GROUP BY st.ITEMCODE, st.ITEMSPECIFICATIONCODE',
    '    ) stock_check ON s.ITEMCODE = stock_check.ITEMCODE AND s.ITEMSPECIFICATIONCODE = stock_check.ITEMSPECIFICATIONCODE',
    '    WHERE s.TNO = :P161_SALESORDERTNO',
    '      AND NVL(stock_check.AVAILABLE_QTY, 0) <= 0;',
    '    ',
    '    -- Notification message set',
    '    IF l_msg IS NOT NULL THEN',
    '        :P161_NOTIFICATION := ''Warning: Stock not available for: '' || l_msg;',
    '    END IF;',
    '',
    '    -- Fixed Insert Statement',
    '    INSERT INTO DESPATCHADVICEDETAIL (',
    '        TNO, SNO, ITEMCODE, ITEMSPECIFICATIONCODE, DESCRIPTION, RATE, QUANTITY1, QUANTITY2',
    '    )',
    '    SELECT ',
    '        :P161_TNO, ',
    '        GLOBALTNO.NEXTVAL,',
    '        src.ITEMCODE, ',
    '        src.ITEMSPECIFICATIONCODE, ',
    '        src.DESCRIPTION, ',
    '        src.RATE, ',
    '        src.FINAL_Q1, ',
    '        src.FINAL_Q2',
    '    FROM (',
    '        WITH PendingAgg AS (',
    '            SELECT SALESORDERTNO, ITEMCODE, ITEMSPECIFICATIONCODE, SUM(Q1) AS SUM_Q1, SUM(Q2) AS SUM_Q2',
    '            FROM (',
    '                SELECT BB.SALESORDERTNO, CC.ITEMCODE, CC.ITEMSPECIFICATIONCODE, CC.QUANTITY1 Q1, CC.QUANTITY2 Q2',
    '                FROM LOADINGADVICE BB ',
    '                JOIN LOADINGADVICEDETAIL CC ON BB.TNO = CC.TNO',
    '                WHERE NOT EXISTS (SELECT 1 FROM CCINVOICE XX WHERE XX.LOADINGADVICETNO = BB.TNO)',
    '                ',
    '                UNION ALL',
    '                ',
    '                SELECT BB.SALESORDERTNO, CC.ITEMCODE, CC.ITEMSPECIFICATIONCODE, CC.QUANTITY1 Q1, CC.QUANTITY2 Q2',
    '                FROM DESPATCHADVICE BB ',
    '                JOIN DESPATCHADVICEDETAIL CC ON BB.TNO = CC.TNO',
    '                WHERE NOT EXISTS (SELECT 1 FROM CCINVOICE XX WHERE XX.DESPATCHADVICETNO = BB.TNO)',
    '                ',
    '                UNION ALL',
    '                ',
    '                SELECT BB.SALESORDERTNO, CC.ITEMCODE, CC.ITEMSPECIFICATIONCODE, CC.QUANTITY1 Q1, CC.QUANTITY2 Q2',
    '                FROM CCINVOICE BB ',
    '                JOIN CCINVOICEDETAIL CC ON BB.TNO = CC.TNO',
    '            )',
    '            GROUP BY SALESORDERTNO, ITEMCODE, ITEMSPECIFICATIONCODE',
    '        )',
    '        SELECT ',
    '            A.ITEMCODE, ',
    '            A.ITEMSPECIFICATIONCODE, ',
    '            A.DESCRIPTION, ',
    '            A.RATE, ',
    '            (NVL(A.QUANTITY1,0) - NVL(P.SUM_Q1,0)) AS FINAL_Q1, ',
    '            (NVL(A.QUANTITY2,0) - NVL(P.SUM_Q2,0)) AS FINAL_Q2',
    '        FROM SALESORDERDETAIL A',
    '        LEFT JOIN PendingAgg P ',
    '            ON A.TNO = P.SALESORDERTNO ',
    '            AND A.ITEMCODE = P.ITEMCODE ',
    '            AND A.ITEMSPECIFICATIONCODE = P.ITEMSPECIFICATIONCODE',
    '        WHERE A.TNO = :P161_SALESORDERTNO',
    '          AND (NVL(A.QUANTITY1,0) - NVL(P.SUM_Q1,0)) > 0',
    '        ORDER BY A.SNO',
    '    ) src;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457005788200356755)
,p_event_id=>wwv_flow_imp.id(457005381274356751)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Delete detail'
,p_static_id=>'delete-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P161_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    delete from Despatchadvicedetail where tno = :P161_TNO;',
    '    ',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457005698801356754)
,p_event_id=>wwv_flow_imp.id(457005381274356751)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(616379737119199432)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(57506376930321304)
,p_event_id=>wwv_flow_imp.id(457005381274356751)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Popup Notification'
,p_static_id=>'popup-notification'
,p_action=>'NATIVE_ALERT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'message', '&P161_NOTIFICATION.',
  'style', 'warning',
  'title', 'Stock Not Available')).to_clob
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P161_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(503121891181712373)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P161_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(503122072653712374)
,p_event_id=>wwv_flow_imp.id(503121891181712373)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '//apex.region( "Detail" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450269876078757627)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>270
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P161_REFERENCETNO'
,p_condition_element=>'P161_PARTYTYPECODE'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'AGENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450269990018757628)
,p_event_id=>wwv_flow_imp.id(450269876078757627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''#P161_PARTYCODE'').attr(''readonly'', true);')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619141450701164127)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(619137447409161087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619142357693164130)
,p_event_id=>wwv_flow_imp.id(619141450701164127)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P161_TNO,P161_COMPANYCODE,P161_PURCHASEORDERNO,P161_PASSFAILREMARK',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) := :P161_PURCHASEORDERNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P161_TNO --'':P''||:APP_PAGE_ID||''_TNo''',
    '				--and d.LoginName = User',
    '                AND D.BOSSUSERNAME = :APP_USER',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    /*select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '    */',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = :P161_PASSFAILREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(getModuleCodeForPageNo(:APP_PAGE_ID), :P161_TNO , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619142893486164130)
,p_event_id=>wwv_flow_imp.id(619141450701164127)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619143381904164131)
,p_event_id=>wwv_flow_imp.id(619141450701164127)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619141873817164128)
,p_event_id=>wwv_flow_imp.id(619141450701164127)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P161_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619149931259167804)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(619138558336161087)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619150333926167804)
,p_event_id=>wwv_flow_imp.id(619149931259167804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(512889343219843282)
,p_name=>'set decimal qty1'
,p_static_id=>'set-decimal-qty'
,p_event_sequence=>250
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(512889566208843284)
,p_name=>'set decimal qty2'
,p_static_id=>'set-decimal-qty-2'
,p_event_sequence=>260
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(512889638392843285)
,p_event_id=>wwv_flow_imp.id(512889566208843284)
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
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(503121633381712370)
,p_name=>'set focus'
,p_static_id=>'set-focus'
,p_event_sequence=>230
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P161_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(503121709787712371)
,p_event_id=>wwv_flow_imp.id(503121633381712370)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// Get the page item and tab container elements',
    'var pageItem = apex.item("P161_REMARK");',
    '//var tabContainer = apex.region("TAB_CONTAINER");',
    'var tabContainer = apex.region(''TAB_CONTAINER'').widget();',
    '// Set the focus to the tab container',
    'tabContainer.focus();',
    'tabContainer.setActiveTab(1);',
    '',
    '',
    '// Move the cursor to the beginning of the tab container',
    '//var range = document.createRange();',
    '//range.setStart(tabContainer, 0);',
    '//range.setEnd(tabContainer, 0);',
    '//window.getSelection().addRange(range);')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(503121871972712372)
,p_event_id=>wwv_flow_imp.id(503121633381712370)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// Get the page item',
    'var pageItem = apex.item("P161_REMARK");',
    '',
    '// Get the tab container',
    'var tabContainer = apex.region("TAB_CONTAINER");',
    '',
    '// Move the cursor to the tab container',
    'tabContainer.focus();',
    '',
    '// Activate the first tab',
    'tabContainer.widget().aTabs("activate", 1);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(618734471433218518)
,p_name=>'Set qty1'
,p_static_id=>'set-qty'
,p_event_sequence=>160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(618734596238218519)
,p_event_id=>wwv_flow_imp.id(618734471433218518)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,P161_SALESORDERTNO',
  'plsql_expression', 'getpendingsoquantity1(:itemcode , :itemspecificationcode , :P161_SALESORDERTNO)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54299035902565193)
,p_event_id=>wwv_flow_imp.id(618734471433218518)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set value for JobOrder Routine'
,p_static_id=>'set-value-for-joborder-routine'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1,QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,P161_REFERENCETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'WITH DespatchAgg AS (',
    '    SELECT',
    '        da.referencetno,',
    '        dad.itemcode,',
    '        dad.itemspecificationcode,',
    '        SUM(NVL(dad.quantity1, 0)) AS quantity1,',
    '        SUM(NVL(dad.quantity2, 0)) AS quantity2',
    '    FROM despatchadvice       da',
    '    JOIN despatchadvicedetail dad ON dad.tno = da.tno',
    '    WHERE NOT EXISTS (',
    '              SELECT 1',
    '              FROM gatepass gp',
    '              WHERE gp.referencetno = da.tno',
    '          )',
    '      AND NOT EXISTS (',
    '              SELECT 1',
    '              FROM documentstatusdetail ds',
    '              WHERE ds.moduletno          = da.tno',
    '                AND ds.documentstatuscode = ''CLOSED''',
    '          )',
    '    GROUP BY',
    '        da.referencetno,',
    '        dad.itemcode,',
    '        dad.itemspecificationcode',
    '),',
    'GatepassAgg AS (',
    '    SELECT',
    '        gp.referencetno        AS jobordertno,',
    '        gpd.itemcode,',
    '        gpd.itemspecificationcode,',
    '        SUM(NVL(gpd.quantity1, 0)) AS quantity1,',
    '        SUM(NVL(gpd.quantity2, 0)) AS quantity2',
    '    FROM gatepass       gp',
    '    JOIN gatepassdetail gpd ON gpd.tno = gp.tno',
    '    JOIN despatchadvice da  ON da.tno = gp.referencetno',
    '    WHERE da.referencetno = :P161_REFERENCETNO',
    '    GROUP BY',
    '        gp.referencetno,',
    '        gpd.itemcode,',
    '        gpd.itemspecificationcode',
    ')',
    'SELECT',
    '    NVL(jod.quantity1, 0)',
    '        - NVL(ga.quantity1, 0)   ',
    '        - NVL(daa.quantity1, 0)  ',
    '        AS quantity1,',
    '    NVL(jod.quantity2, 0)',
    '        - NVL(ga.quantity2, 0)',
    '        - NVL(daa.quantity2, 0)',
    '        AS quantity2',
    'FROM joborder          jo',
    'JOIN joborderdetail    jod ON jod.tno = jo.tno',
    'LEFT JOIN GatepassAgg  ga  ON ga.jobordertno          = jo.tno',
    '                           AND ga.itemcode              = jod.itemcode',
    '                           AND ga.itemspecificationcode = jod.itemspecificationcode',
    'LEFT JOIN DespatchAgg  daa ON daa.referencetno          = jo.tno',
    '                           AND daa.itemcode              = jod.itemcode',
    '                           AND daa.itemspecificationcode = jod.itemspecificationcode',
    'WHERE jo.tno = :P161_REFERENCETNO',
    '  and jod.itemcode = :ITEMCODE ',
    '  and jod.itemspecificationcode = :ITEMSPECIFICATIONCODE',
    'ORDER BY jod.itemcode, jod.itemspecificationcode;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P161_DOCTYPECODE'
,p_client_condition_expression=>'CONVERSIONJOBOUTOFPREMISES'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P161_FORMSTATUS'
,p_server_condition_expr2=>'NEWRECORD'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(307759206662957419)
,p_event_id=>wwv_flow_imp.id(618734471433218518)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'set value for Sales Routine'
,p_static_id=>'set-value-for-sales-routine'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1,QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P161_SALESORDERTNO,ITEMCODE,ITEMSPECIFICATIONCODE,P161_REFERENCETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'WITH FilteredItem AS (',
    '    SELECT 1',
    '    FROM   item',
    '    WHERE  itemcode       = :ITEMCODE',
    '      AND  itemnaturecode = ''SERVICES''',
    '),',
    'SalesLine AS (',
    '    SELECT quantity1,quantity2',
    '    FROM   salesorderdetail',
    '    WHERE  tno                   = :P161_SALESORDERTNO',
    '      AND  itemcode              = :ITEMCODE',
    '      AND  itemspecificationcode = :ITEMSPECIFICATIONCODE',
    '      AND  NOT EXISTS (SELECT 1 FROM FilteredItem)',
    '),',
    'LoadingAgg AS (',
    '    SELECT SUM(cd.quantity1) AS quantity1,SUM(cd.quantity2) AS quantity2',
    '    FROM   loadingadvice       la',
    '    JOIN   loadingadvicedetail cd ON cd.tno = la.tno',
    '    WHERE  la.salesordertno        = :P161_SALESORDERTNO',
    '      AND  cd.itemcode              = :ITEMCODE',
    '      AND  cd.itemspecificationcode = :ITEMSPECIFICATIONCODE',
    '      AND  NOT EXISTS (',
    '               SELECT 1',
    '               FROM   ccinvoice xx',
    '               WHERE  xx.loadingadvicetno = la.tno',
    '           )',
    '),',
    'DespatchAgg AS (',
    '    SELECT SUM(cd.quantity1) AS quantity1,SUM(cd.quantity2) AS quantity2',
    '    FROM   despatchadvice       da',
    '    JOIN   despatchadvicedetail cd ON cd.tno = da.tno',
    '    WHERE  da.salesordertno        = :P161_SALESORDERTNO',
    '      AND  cd.itemcode              = :ITEMCODE',
    '      AND  cd.itemspecificationcode = :ITEMSPECIFICATIONCODE',
    '      AND  NOT EXISTS (',
    '               SELECT 1',
    '               FROM   ccinvoice xx',
    '               WHERE  xx.despatchadvicetno = da.tno',
    '           )',
    '),',
    'InvoiceAgg AS (',
    '    SELECT SUM(cd.quantity1) AS quantity1,SUM(cd.quantity2) AS quantity2',
    '    FROM   ccinvoice       inv',
    '    JOIN   ccinvoicedetail cd ON cd.tno = inv.tno',
    '    WHERE  inv.salesordertno       = :P161_SALESORDERTNO',
    '      AND  cd.itemcode              = :ITEMCODE',
    '      AND  cd.itemspecificationcode = :ITEMSPECIFICATIONCODE',
    ')',
    'SELECT',
    '    NVL((SELECT quantity1 FROM SalesLine),   0)',
    '  - NVL((SELECT quantity1 FROM LoadingAgg),  0)',
    '  - NVL((SELECT quantity1 FROM DespatchAgg), 0)',
    '  - NVL((SELECT quantity1 FROM InvoiceAgg),  0)',
    '    AS q1,',
    '    NVL((SELECT quantity2 FROM SalesLine),   0)',
    '  - NVL((SELECT quantity2 FROM LoadingAgg),  0)',
    '  - NVL((SELECT quantity2 FROM DespatchAgg), 0)',
    '  - NVL((SELECT quantity2 FROM InvoiceAgg),  0)',
    '    AS q2',
    'FROM DUAL;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P161_FORMSTATUS'
,p_server_condition_expr2=>'NEWRECORD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(620189753117665413)
,p_name=>'set quantity2'
,p_static_id=>'set-quantity'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(620189931289665414)
,p_event_id=>wwv_flow_imp.id(620189753117665413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'set quantity2'
,p_static_id=>'set-quantity'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return :QUANTITY1*mfactor;',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(457906740166749060)
,p_name=>'set quantity2_1'
,p_static_id=>'set-quantity-2'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_triggering_element=>'QUANTITY2'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'QUANTITY2'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457906803065749061)
,p_event_id=>wwv_flow_imp.id(457906740166749060)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'set quantity2'
,p_static_id=>'set-quantity'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY2',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    'begin',
    '    select MULTIPLYINGFACTOR into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '    return :QUANTITY2/mfactor;',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619264948825014992)
,p_name=>'set SerialNo'
,p_static_id=>'set-serialno'
,p_event_sequence=>130
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619265294656014999)
,p_event_id=>wwv_flow_imp.id(619264948825014992)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var index;',
    '',
    'var model = this.data.model;',
    '',
    'var meta = model.getRecordMetadata(this.data.recordId);',
    '',
    'if ( meta.inserted && !meta.updated ) {',
    '',
    '',
    '    index =  $v("P161_NEXT_SERIALNO");',
    '',
    '    index +++ 1;',
    '',
    '    $s("P161_NEXT_SERIALNO", index);',
    '',
    '    $s("SERIALNO",index );',
    '',
    '',
    '}',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(618734891850218522)
,p_name=>'Set Unit'
,p_static_id=>'set-unit'
,p_event_sequence=>170
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(616379737119199432)
,p_triggering_element=>'ITEMCODE,ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(618735034049218523)
,p_event_id=>wwv_flow_imp.id(618734891850218522)
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
  'sql_query', 'select GetMeasuringUnitNameFromItem(:itemcode) as unit1, GetMeasuringUnit2NameFromItem(:itemcode) as unit2 from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(619210240633471809)
,p_name=>'set value from Sales Order'
,p_static_id=>'set-value-from-sales-order'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P161_REFERENCETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(619210293182471810)
,p_event_id=>wwv_flow_imp.id(619210240633471809)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P161_SALESORDERTNO,P161_AGENTCODE,P161_CONSIGNEECODE,P161_PARTYCODE,P161_PARTYTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P161_REFERENCETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT ',
    '    tno,',
    '    agentcode,',
    '    consigneecode,',
    '    partycode,',
    '    partytypecode',
    'FROM (',
    '    -- Sales Order',
    '    SELECT ',
    '        a.tno,',
    '        a.agentcode,',
    '        a.consigneecode,',
    '        a.partycode,',
    '        b.partytypecode',
    '    FROM SalesOrder a',
    '    LEFT JOIN Party b ',
    '        ON a.partycode = b.partycode',
    '    WHERE a.tno = :P161_REFERENCETNO',
    '',
    '    UNION ALL',
    '',
    '    -- Job Order',
    '    SELECT',
    '        jo.tno,',
    '        NULL AS agentcode,',
    '        NULL AS consigneecode,',
    '        jo.partycode,',
    '        p.partytypecode',
    '    FROM JobOrder jo',
    '    LEFT JOIN Party p ',
    '        ON jo.partycode = p.partycode',
    '    WHERE jo.tno = :P161_REFERENCETNO',
    ');')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54298967277565192)
,p_event_id=>wwv_flow_imp.id(619210240633471809)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P161_SALESORDERTNO,P161_AGENTCODE,P161_CONSIGNEECODE,P161_PARTYCODE,P161_PARTYTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P161_REFERENCETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    '-- Sales Order',
    'SELECT',
    '    a.tno,',
    '    a.agentcode,',
    '    a.consigneecode,',
    '    a.partycode,',
    '    b.partytypecode',
    'FROM SalesOrder a',
    'LEFT JOIN Party b ON a.partycode = b.partycode',
    'WHERE a.tno = :P161_REFERENCETNO',
    '',
    'UNION ALL',
    '',
    '-- Job Order',
    'SELECT',
    '    jo.tno,',
    '    CAST(NULL AS VARCHAR2(30)) AS agentcode,',
    '    jo.partycode AS consigneecode,',
    '    jo.partycode,',
    '    p.partytypecode',
    'FROM JobOrder jo',
    'LEFT JOIN Party p ON jo.partycode = p.partycode',
    'WHERE jo.tno = :P161_REFERENCETNO;')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_da_action_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--TO check the column data length',
'----------------------------------',
'SELECT column_name, data_type, data_length',
'FROM all_tab_columns',
'WHERE table_name = ''SALESORDER''',
'AND column_name IN (''AGENTCODE'', ''CONSIGNEECODE'');'))
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(619161330049199982)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from DESPATCHADVICEDETAIL where tno = :P161_TNO;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(619136159209161087)
,p_internal_uid=>169294780966807094
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(462604677018560353)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P161_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>14139603987396005
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(619161038567198699)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No'
,p_static_id=>'get-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P161_Tno is null then',
'        Select GlobalTno.NextVal into :P161_Tno From Dual;',
'     end if;',
'    ----',
'    if :P161_DESPATCHADVICENO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P161_LocationCode,',
'					:P161_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P161_DESPATCHADVICEDATE, ''DD-MM-RRRR'')',
'				);',
'        :P161_DESPATCHADVICENO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P161_LocationCode,',
'                    :P161_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P161_DESPATCHADVICEDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>169294489484805811
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(619160369468195395)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P161_TNO is null then',
'    :P161_TNO := GlobalTNo.nextval;',
'    :P161_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P161_FORMSTATUS := ''EDITRECORD'';',
'End if;',
':P161_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P161_TNO), ''Status'');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>169293820385802507
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(619160665136197516)
,p_process_sequence=>30
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
'       :P161_MODULEFLOW := ''YES'';',
'   else',
'       :P161_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P161_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P161_ONTHETABLE := ''YES'' ;',
'   else',
'       :P161_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>169294116053804628
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(619119969506061601)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(619097203493061559)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Despatch Advice'
,p_static_id=>'initialize-form-despatch-advice'
,p_internal_uid=>169253420423668713
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(619210054850471808)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(616379737119199432)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Item Detail - Save Interactive Grid Data'
,p_static_id=>'item-detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tsno number;',
'Begin',
'    IF :ITEMCODE IS NOT NULL THEN',
'',
'        ',
'',
'',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'      ',
'        if :QUANTITY1 = 0 then',
'            raise_application_error(-20000 , ''Quantity cannot be 0.'');',
'        end if;',
'',
'            select globaltno.nextval into tsno from dual;',
'       ',
'',
'            Insert Into despatchadvicedetail (                 ',
'                    tno                  ,',
'                    sno                  ,',
'                    itemcode             ,',
'                    itemspecificationcode,',
'                    packingtypecode      ,',
'                    description          ,',
'                    quantity1            ,',
'                    quantity2            ,',
'                    reasonforreturn      ,',
'                    remark               ,',
'                    serialno             ,',
'                    isweighttaken        ,',
'                    weighmenttno         ,',
'                    packingnos           ,',
'                    canceledquantity1    ,',
'                    canceledby           ',
'',
'            )',
'            Values (',
'                    :tno                  ,',
'                    :sno                  ,',
'                    :itemcode             ,',
'                    :itemspecificationcode,',
'                    :packingtypecode      ,',
'                    :description          ,',
'                    :quantity1            ,',
'                    :quantity2            ,',
'                    :reasonforreturn      ,',
'                    :remark               ,',
'                    :serialno             ,',
'                    :isweighttaken        ,',
'                    :weighmenttno         ,',
'                    :packingnos           ,',
'                    :canceledquantity1    ,',
'                    :canceledby           ',
'            );',
'        ',
'        when ''U'' then',
'            update despatchadvicedetail Set',
'                      tno                    = :tno                   ,',
'                      sno                    = :sno                   ,',
'                      itemcode               = :itemcode              ,',
'                      itemspecificationcode  = :itemspecificationcode ,',
'                      packingtypecode        = :packingtypecode       ,',
'                      description            = :description           ,',
'                      quantity1              = :quantity1             ,',
'                      quantity2              = :quantity2             ,',
'                      reasonforreturn        = :reasonforreturn       ,',
'                      remark                 = :remark                ,',
'                      serialno               = :serialno              ,',
'                      isweighttaken          = :isweighttaken         ,',
'                      weighmenttno           = :weighmenttno          ,',
'                      packingnos             = :packingnos            ,',
'                      canceledquantity1      = :canceledquantity1     ,',
'                      canceledby             = :canceledby            ',
'            WHERE TNO = :P161_TNO',
'              and SNO = :SNO;',
'',
'        when ''D'' then',
'            Delete From despatchadvicedetail',
'            Where TNo = :P161_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'    END IF;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>169343505768078920
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(619120381322061605)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(619097203493061559)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Despatch Advice'
,p_static_id=>'process-form-despatch-advice'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>169253832239668717
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(462600617877543102)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P161_FORMSTATUS = ''NEWRECORD'' THEN ',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P161_ALLOWEDBACK,:P161_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'else',
'     :P161_ALLOWEDBACK       := :P161_DESPATCHADVICEDATE ; ',
'    :P161_ALLOWEDFORWARD    := :P161_DESPATCHADVICEDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14135544846378754
);
wwv_flow_imp.component_end;
end;
/
