prompt --application/pages/page_00181
begin
--   Manifest
--     PAGE: 00181
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
 p_id=>181
,p_name=>'Kitting Unkitting'
,p_alias=>'KITTING-UNKITTING'
,p_step_title=>'Kitting Unkitting'
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
'  var bireporturl = $(''#P181_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/KittingUnkitting.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P181_TNO'').val() ',
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
'  var bireporturl = $(''#P181_BIREPORTURL'').val()',
'  var reportName =  ''KittingUnkitting.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P181_TNO'').val() ',
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
'let region, grid, model, viewId;',
'function calculateTotalQty(){',
'    let total_qty    = 0;',
'',
'    model.forEach(function(record, index, id){',
'        let total = parseFloat(model.getValue(record, ''QUANTITY1''))',
'        let meta = model.getRecordMetadata(id);',
'',
'        if (!isNaN(total) && !meta.deleted && !meta.agg){',
'            ',
'            total_qty += total;',
'            console.log(''Trigged'', total_qty);',
'        }',
'    });',
'',
'    $s(''P181_TOTAL_RAW_QTY'',total_qty);',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'region = apex.region(''Raw_Stock'');',
'grid = region.call("getViews").grid;',
'model = grid.model;',
'',
'viewId = model.subscribe(',
'    {',
'        onChange: function(changeType, change){',
'            if(changeType == ''set'' && change.field == ''QUANTITY1''){',
'                calculateTotalQty();',
'            }',
'        }',
'    }',
');'))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important; ',
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
 p_id=>wwv_flow_imp.id(683422884185762707)
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
 p_id=>wwv_flow_imp.id(1319531193549927758)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>60
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(683423499117762713)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
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
 p_id=>wwv_flow_imp.id(877474331562886052)
,p_plug_name=>'Kitting Unkitting'
,p_static_id=>'kitting-unkitting'
,p_region_name=>'Stock_Journal'
,p_parent_plug_id=>wwv_flow_imp.id(683423261189762711)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.COMPANYCODE,',
'       a.FINANCIALYEARCODE,',
'       a.LOCATIONCODE,',
'       a.DOCTYPECODE,',
'       a.STOCKJOURNALNO,',
'       a.STOCKJOURNALDATE,',
'       a.RAWQUANTITY1,',
'       a.LOSSQUANTITY1,',
'       a.FINISHEDQUANTITY1,',
'       a.SUBSIDERYQUANTITY1,',
'       a.REMARK,',
'       a.PRODUCTIONCENTRECODE,',
'       a.SHIFTCODE,',
'       a.HITNO,',
'       a.CREATOR,',
'       a.CREATIONTIME,',
'       a.SHIFTINCHARGECODE,',
'       a.MELTORCODE,',
'       a.ITEMGRADECODE,',
'       a.STOCKJOURNALPLANTNO,',
'       a.MODULECODE,',
'       a.MODULETNO,',
'       a.MFRTNO,',
'       a.PRODUCTIONTNO,',
'       a.ISLEAKAGE,',
'       NVL(GetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), :P181_TNO),''Status'') as Status',
'        ',
'  from STOCKJOURNAL a',
' '))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P181_TNO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(683423261189762711)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(583359980538425923)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P181_ISREADONLY'
,p_plug_read_only_when2=>'1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(877477252839886081)
,p_plug_name=>'Raw Stock'
,p_static_id=>'raw-stock'
,p_region_name=>'Raw_Stock'
,p_parent_plug_id=>wwv_flow_imp.id(683423261189762711)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO AS RAW_SNO,',
'       SERIALNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       DESCRIPTION,',
'       QUANTITY1,',
'       LOSSPERCENT,',
'       LOSSQUANTITY1,',
'       REMARK,',
'       STORAGELOCATIONCODE,',
'       FEEDTOKILN,',
'       CREATOR,',
'       DATEOFENTRY,',
'       ''SD'' as SD,',
'       GetMeasuringUnitNameFromItem(ITEMCODE) as UNIT',
'  from STOCKJOURNALRAW',
'where tno = :P181_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P181_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Raw Stock'
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
 p_id=>wwv_flow_imp.id(683423041576762708)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(683423145164762709)
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
 p_id=>wwv_flow_imp.id(877478544175886094)
,p_name=>'CREATOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Creator'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
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
 p_id=>wwv_flow_imp.id(877478609537886095)
,p_name=>'DATEOFENTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATEOFENTRY'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Dateofentry'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
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
 p_id=>wwv_flow_imp.id(877477788161886087)
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
 p_id=>wwv_flow_imp.id(877478449614886093)
,p_name=>'FEEDTOKILN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FEEDTOKILN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Feedtokiln'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(877477776940886086)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item To Decrease Stock'
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'SELECT ITEMNAME D,ITEMCODE R FROM ITEM'
,p_lov_display_extra=>false
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
 p_id=>wwv_flow_imp.id(523663497352778268)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(877478025156886089)
,p_name=>'LOSSPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOSSPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Losspercent'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(877478115978886090)
,p_name=>'LOSSQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOSSQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Lossquantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(877477946769886088)
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
 p_id=>wwv_flow_imp.id(26604183612119169)
,p_name=>'RAW_SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RAW_SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'RAW_SNO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877478258766886091)
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
 p_id=>wwv_flow_imp.id(879410371971835592)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877479005128886099)
,p_name=>'SD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'SD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript: openModal(''Raw_Stock_Detail'');'
,p_link_text=>'&SD.'
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
,p_default_expression=>'<a href="javascript:openModal(''Raw_Stock_Detail'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">SD</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877477646770886085)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877478352816886092)
,p_name=>'STORAGELOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STORAGELOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Storagelocationcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(877477462964886083)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P181_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(936446483550700354)
,p_name=>'UNIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    mu.measuringunitname,',
'    mu.measuringunitcode',
'FROM measuringunit mu',
'JOIN (',
'    SELECT measuringunitcode1 AS unitcode',
'    FROM item',
'    WHERE itemcode = :ITEMCODE',
'',
'    UNION',
'',
'    SELECT measuringunitcode2',
'    FROM item',
'    WHERE itemcode = :ITEMCODE',
') x',
'ON mu.measuringunitcode = x.unitcode;'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(877477289891886082)
,p_internal_uid=>850530073935190402
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_imp.id(877509231575269669)
,p_interactive_grid_id=>wwv_flow_imp.id(877477289891886082)
,p_static_id=>'398585'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(877509437545269670)
,p_report_id=>wwv_flow_imp.id(877509231575269669)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(26762003815924682)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(26604183612119169)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(524362557183542846)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(523663497352778268)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>556
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(683862330443748538)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(683423041576762708)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877509935852269673)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(877477462964886083)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877511748843269677)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(877477646770886085)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877512673473269679)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(877477776940886086)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>226
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877513546556269681)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(877477788161886087)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>192
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877514278574269683)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(877477946769886088)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877515204837269687)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(877478025156886089)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877516097964269689)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(877478115978886090)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877517058210269691)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(877478258766886091)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877517910284269693)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(877478352816886092)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877518805530269695)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(877478449614886093)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877519739644269697)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(877478544175886094)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877520618689269699)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(877478609537886095)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877530034656290891)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(877479005128886099)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(936462675803823104)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(936446483550700354)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(936472782724944627)
,p_view_id=>wwv_flow_imp.id(877509437545269670)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(879410371971835592)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(877531625338355550)
,p_plug_name=>'Raw Stock Detail'
,p_static_id=>'raw-stock-detail'
,p_region_name=>'Raw_Stock_Detail'
,p_region_css_classes=>'js-dialog-size900x500'
,p_region_template_options=>'#DEFAULT#:t-DialogRegion--noPadding:js-dialog-nosize:t-Form--slimPadding'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       SN,',
'       STOCKTNO,',
'       STORAGELOCATIONCODE,',
'       QUANTITY1,',
'       AMOUNT,',
'       REMARK,',
'       APEX_SESSION_ID',
'       ',
'  from STOCKJOURNALRAWSTOCKDETAIL',
'  where tno =   :P181_TNO',
'    and sno =   :P181_RAW_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(877477252839886081)
,p_ajax_items_to_submit=>'P181_TNO,P181_RAW_SNO'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(89309717122488815)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(877532286903355557)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877532461133355558)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'N',
  'hide_control', 'N')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(63830605950662800)
,p_name=>'APEX_SESSION_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APEX_SESSION_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>120
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(89312296728488841)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(877532219843355556)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(63830425651662799)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877532654511355560)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SN'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GlobalTNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877531884232355553)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(26604183612119169)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877532075362355554)
,p_name=>'STOCKTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCKTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Stock'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '800')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(58645784426942504)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'STORAGELOCATIONCODE'
,p_ajax_items_to_submit=>'P181_COMPANYCODE,P181_LOCATIONCODE,P181_STOCKJOURNALDATE,P181_DETAILITEM,P181_STORAGELOCATIONCODE,P181_DETAILITEMSPECIFICATION'
,p_ajax_optimize_refresh=>false
,p_static_id=>'STOCKTNO'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(89309647235488814)
,p_name=>'STORAGELOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STORAGELOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Storage Location'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>true
,p_max_length=>4000
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'    a.STORAGELOCATIONNAME , a.STORAGELOCATIONCODE',
'FROM STORAGELOCATION a',
'JOIN STOCK s ON a.STORAGELOCATIONCODE = s.STORAGELOCATIONCODE'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877531800461355552)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'TNO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(877477462964886083)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(877531762437355551)
,p_internal_uid=>850584546480659871
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>false
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(877537506844381365)
,p_interactive_grid_id=>wwv_flow_imp.id(877531762437355551)
,p_static_id=>'398868'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(877537679598381365)
,p_report_id=>wwv_flow_imp.id(877537506844381365)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(64085999648667016)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(63830425651662799)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(64097261239783709)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(63830605950662800)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89314688351503908)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(89309647235488814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89318624619521920)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(89309717122488815)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(89791577099180574)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(89312296728488841)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877538275714381366)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(877531800461355552)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877539084886381368)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(877531884232355553)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877539981071381371)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(877532075362355554)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877541840887381375)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(877532219843355556)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>184
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877542696358381379)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(877532286903355557)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877771978445043298)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(877532654511355560)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(58524597381942406)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_static_id=>'sum'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(89312296728488841)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(58525718157965760)
,p_view_id=>wwv_flow_imp.id(877537679598381365)
,p_static_id=>'sum-2'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(89309717122488815)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(877532973776355563)
,p_plug_name=>'Stock Finished'
,p_static_id=>'stock-finished'
,p_region_name=>'Stock_Finished'
,p_parent_plug_id=>wwv_flow_imp.id(683423261189762711)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'TNO,',
'       SNO AS FIN_SNO,',
'       SERIALNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       DESCRIPTION,',
'       QUANTITY1,',
'       REMARK,',
'       STORAGELOCATIONCODE,',
'       CREATOR,',
'       DATEOFENTRY,',
'       MODULECODE,',
'       MODULETNO,',
'       RATE,',
'       AMOUNT,',
'       ''SD'' as SD,',
'       GetMeasuringUnitNameFromItem(ITEMCODE) as UNIT',
'  from STOCKJOURNALFINISHED',
'where tno = :P181_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P181_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Stock Finished'
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
 p_id=>wwv_flow_imp.id(877534472674355578)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'AMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877534526226355579)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877534632697355580)
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
 p_id=>wwv_flow_imp.id(877533891416355573)
,p_name=>'CREATOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREATOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Creator'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>50
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'CREATOR'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877534072675355574)
,p_name=>'DATEOFENTRY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DATEOFENTRY'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Dateofentry'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_date_ranges=>'ALL'
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'DATEOFENTRY'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877533520443355569)
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
,p_static_id=>'DESCRIPTION'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(26755818888923620)
,p_name=>'FIN_SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FIN_SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'FIN_SNO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877533448839355568)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item To Increase Stock'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
,p_lov_source=>'select itemname , itemcode from item'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'FGITEMCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(523663573256778269)
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
 p_id=>wwv_flow_imp.id(877534148504355575)
,p_name=>'MODULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Modulecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
,p_static_id=>'MODULECODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877534184277355576)
,p_name=>'MODULETNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULETNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Moduletno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'MODULETNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877533586359355570)
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
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'QUANTITY1'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877534334960355577)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'RATE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P181_CONSOLIDATED_RATE_FOR_FINISH'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877533685626355571)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'REMARK'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(879410537348835594)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>210
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877534845160355582)
,p_name=>'SD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'SD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''Stock_Finished_Details'')'
,p_link_text=>'&SD.'
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
,p_default_expression=>'<a href="javascript:openModal(''Stock_Finished_Details'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">SD</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877533287919355567)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_static_id=>'SERIALNO'
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877533781481355572)
,p_name=>'STORAGELOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STORAGELOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Storagelocationcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_static_id=>'STORAGELOCATIONCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877533152656355565)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P181_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(936446598411700355)
,p_name=>'UNIT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select measuringunitname , measuringunitcode from measuringunit',
'    where measuringunitcode in (',
'                                    select measuringunitcode1 from item where itemcode = :itemcode',
'                                )',
'union all                                ',
'select measuringunitname , measuringunitcode from measuringunit',
'    where measuringunitcode in (',
'                                    select measuringunitcode2 from item where itemcode = :itemcode',
'                                )'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCODE'
,p_ajax_items_to_submit=>'ITEMCODE'
,p_ajax_optimize_refresh=>false
,p_static_id=>'UNIT'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(877533015849355564)
,p_internal_uid=>850585799892659884
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
,p_toolbar_buttons=>'SEARCH_COLUMN:SEARCH_FIELD:ACTIONS_MENU'
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
 p_id=>wwv_flow_imp.id(877775801907100533)
,p_interactive_grid_id=>wwv_flow_imp.id(877533015849355564)
,p_static_id=>'401251'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(877776072337100533)
,p_report_id=>wwv_flow_imp.id(877775801907100533)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(28485509767286866)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(26755818888923620)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(524364012254547163)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(523663573256778269)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>344
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877776556129100535)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(877533152656355565)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877778296169100540)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(877533287919355567)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877779228036100541)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(877533448839355568)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>222
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877780151106100543)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(877533520443355569)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>187
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877781017473100545)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(877533586359355570)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877781878755100547)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(877533685626355571)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877782863573100549)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(877533781481355572)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877783683037100551)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(877533891416355573)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877784660683100553)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(877534072675355574)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877785571393100555)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(877534148504355575)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877786422308100557)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(877534184277355576)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877787296399100559)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(877534334960355577)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877788213872100562)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(877534472674355578)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877790056419101190)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(877534526226355579)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877797868050119643)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(877534845160355582)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>69
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(936467061907861235)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(936446598411700355)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(936474761766961243)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(879410537348835594)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(26947366049695680)
,p_view_id=>wwv_flow_imp.id(877776072337100533)
,p_static_id=>'sum'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(877533586359355570)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(877534916164355583)
,p_plug_name=>'Stock Finished Details'
,p_static_id=>'stock-finished-details'
,p_region_name=>'Stock_Finished_Details'
,p_region_css_classes=>'js-dialog-size900x500'
,p_region_template_options=>'#DEFAULT#:t-DialogRegion--noPadding:js-dialog-nosize:t-Form--slimPadding'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       SNO,',
'       SN,',
'       SERIALNO,',
'       STORAGELOCATIONCODE,',
'       QUANTITY1,',
'       REMARK,',
'       AMOUNT',
'  from STOCKJOURNALFINISHEDDETAIL',
'  where tno = :P181_TNO',
'     and sno = :P181_FIN_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(877532973776355563)
,p_ajax_items_to_submit=>'P181_TNO,P181_FIN_SNO'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877535847359355592)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
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
 p_id=>wwv_flow_imp.id(877535887686355593)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877536064502355594)
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
 p_id=>wwv_flow_imp.id(877535676144355590)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(877533586359355570)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877535714943355591)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877535477549355588)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serialno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(877535317730355587)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GlobalTNo'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877535237827355586)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_imp.id(26755818888923620)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(877535482672355589)
,p_name=>'STORAGELOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STORAGELOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Storage Location'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
'SELECT DISTINCT',
'    a.STORAGELOCATIONNAME , a.STORAGELOCATIONCODE',
'FROM STORAGELOCATION a',
'--JOIN STOCK s ON a.STORAGELOCATIONCODE = s.STORAGELOCATIONCODE'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_null_text=>'-Select-'
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
 p_id=>wwv_flow_imp.id(877535083811355585)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_parent_column_id=>wwv_flow_imp.id(877533152656355565)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(877534995824355584)
,p_internal_uid=>850587779867659904
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
,p_toolbar_buttons=>null
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(877802262441184527)
,p_interactive_grid_id=>wwv_flow_imp.id(877534995824355584)
,p_static_id=>'401515'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(877802422760184527)
,p_report_id=>wwv_flow_imp.id(877802262441184527)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877802945488184529)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(877535083811355585)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877803793047184532)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(877535237827355586)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877804761152184534)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(877535317730355587)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877805638663184536)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(877535477549355588)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877806575193184538)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(877535482672355589)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877807433217184540)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(877535676144355590)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>203.75
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877808311066184543)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(877535714943355591)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877809191011184545)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(877535847359355592)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(877811523816215370)
,p_view_id=>wwv_flow_imp.id(877802422760184527)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(877535887686355593)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58544510650942452)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(877534916164355583)
,p_button_name=>'BACK1'
,p_static_id=>'back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58561268954942462)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_button_name=>'BACK'
,p_static_id=>'back-2'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58527461681942433)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58528713321942433)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_condition=>'P181_STOCKJOURNALNO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58527818947942433)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_confirm_message=>'Are you sure?'
,p_confirm_style=>'danger'
,p_button_condition=>'P181_STOCKJOURNALNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58525884259942432)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P181_STOCKJOURNALNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58526233087942432)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P181_STOCKJOURNALNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58561712773942462)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_button_name=>'P181_AUTO_STOCK_ALLOCATE_RAW'
,p_static_id=>'p181-auto-stock-allocate-raw'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Auto Stock Allocate for Raw'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    v_check number;',
'begin',
'    select count(v.tno)',
'      into v_check',
'      from Voucher v',
'     where v.ModuleTNo = :P181_TNO;',
'',
'    if v_check > 0 then',
'        return false;',
'    else',
'        return true;',
'    end if;',
'end;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_grid_column_attributes=>'style="padding-left:10px; padding-bottom:10px;"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58525448223942432)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P181_STOCKJOURNALNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58525069612942432)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Are you want to post this transaction?'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-location-arrow fa'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58527109959942433)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P181_STOCKJOURNALNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58528282993942433)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_condition=>'P181_STOCKJOURNALNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(58526704398942433)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(683422884185762707)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P181_STATUS.'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P181_STOCKJOURNALNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(58644648590942500)
,p_branch_name=>'Go To Page 181'
,p_branch_action=>'f?p=&APP_ID.:181:&SESSION.::&DEBUG.:181:P181_TNO,P181_FORMSTATUS:&P181_TNO.,EDITRECORD&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE, SAVE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(58645046653942500)
,p_branch_name=>'Go To Page 181'
,p_branch_action=>'f?p=&APP_ID.:181:&SESSION.::&DEBUG.:181:P181_TNO,P181_ISREADONLY:&P181_TNO.,1&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(58526704398942433)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(58645442531942500)
,p_branch_name=>'Go To Page 180'
,p_branch_action=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:180::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(58527818947942433)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524544470856872369)
,p_name=>'P181_ALLOWEDBACK'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(524544864907874616)
,p_name=>'P181_ALLOWEDFORWARD'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878377081232177489)
,p_name=>'P181_AMT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(877532973776355563)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878390683061177503)
,p_name=>'P181_AMT1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(877534916164355583)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(516068306002094730)
,p_name=>'P181_BIREPORTURL'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(879502935495835822)
,p_name=>'P181_CALLEDFROMPAGE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_item_default=>'180'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877519944077886159)
,p_name=>'P181_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(27016656980537222)
,p_name=>'P181_CONSOLIDATED_RATE_FOR_FINISH'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(877477252839886081)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877521468075886174)
,p_name=>'P181_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877521325582886173)
,p_name=>'P181_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878009411644357918)
,p_name=>'P181_DETAILITEM'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(877477252839886081)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(523859266390628028)
,p_name=>'P181_DETAILITEMSPECIFICATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(877477252839886081)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877536149949886170)
,p_name=>'P181_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(683423499117762713)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.DocTypeCode as r',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c, Module d',
'where a.DocTypeCode = b.DocTypeCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode',
'    and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID',
'    Fetch First Row only'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_SELECT_LIST'
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
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877520059528886160)
,p_name=>'P181_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877520807903886167)
,p_name=>'P181_FINISHEDQUANTITY1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'FINISHEDQUANTITY1'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89326429317488888)
,p_name=>'P181_FIN_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(877532973776355563)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89901878495986383)
,p_name=>'P181_FIN_STOCK_DETAIL_QTY_TEMP'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89901726860986382)
,p_name=>'P181_FIN_STOCK_QTY_TEMP'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(879502806581835821)
,p_name=>'P181_FORMSTATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P181_TNO is null then',
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
 p_id=>wwv_flow_imp.id(877521212479886172)
,p_name=>'P181_HITNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'HITNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877522341225886183)
,p_name=>'P181_ISLEAKAGE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'ISLEAKAGE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89351043370488878)
,p_name=>'P181_ISREADONLY'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877521740512886177)
,p_name=>'P181_ITEMGRADECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'ITEMGRADECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877536053526886169)
,p_name=>'P181_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(683423499117762713)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.LocationCode as r',
'from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
'where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode ',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID',
'    fetch first row only'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.LocationName as d,',
'	a.LocationCode as r',
'from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
'where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode ',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cHeight=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877520616133886166)
,p_name=>'P181_LOSSQUANTITY1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'LOSSQUANTITY1'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877521709426886176)
,p_name=>'P181_MELTORCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'MELTORCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877522194885886181)
,p_name=>'P181_MFRTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'MFRTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877522005441886179)
,p_name=>'P181_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(880063560871643781)
,p_name=>'P181_MODULEFLOW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877522095673886180)
,p_name=>'P181_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(880063403461643780)
,p_name=>'P181_ONTHETABLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(975388961901936583)
,p_name=>'P181_PASSFAILREMARK'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877521031366886170)
,p_name=>'P181_PRODUCTIONCENTRECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'PRODUCTIONCENTRECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877522304843886182)
,p_name=>'P181_PRODUCTIONTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'PRODUCTIONTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878388915755177449)
,p_name=>'P181_QTY1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878375681287177475)
,p_name=>'P181_QTY2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(877532973776355563)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878389079838177487)
,p_name=>'P181_QTY3'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(877534916164355583)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878024008258357937)
,p_name=>'P181_RATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877520577687886165)
,p_name=>'P181_RAWQUANTITY1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'RAWQUANTITY1'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878373442749177422)
,p_name=>'P181_RAW_QTY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(877477252839886081)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878010168869357926)
,p_name=>'P181_RAW_SNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(877477252839886081)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89901595488986381)
,p_name=>'P181_RAW_STOCK_DETAIL_QTY_TEMP'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89893485964986367)
,p_name=>'P181_RAW_STOCK_QTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89901499879986380)
,p_name=>'P181_RAW_STOCK_QTY_TEMP'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877536868102886177)
,p_name=>'P181_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(683423499117762713)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>1000
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
 p_id=>wwv_flow_imp.id(877521132532886171)
,p_name=>'P181_SHIFTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'SHIFTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877521533928886175)
,p_name=>'P181_SHIFTINCHARGECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'SHIFTINCHARGECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877997647868357854)
,p_name=>'P181_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>'STATUS'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(975388597563936576)
,p_name=>'P181_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1319531193549927758)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.STATUSPRIVILEGE',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.ENTRYPAGENO = :APP_PAGE_ID',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE',
''))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877536381478886172)
,p_name=>'P181_STOCKJOURNALDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(683423499117762713)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>'select trunc(sysdate) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Stock Journal Date'
,p_source=>'STOCKJOURNALDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P181_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P181_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877536208715886171)
,p_name=>'P181_STOCKJOURNALNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(683423499117762713)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_prompt=>'Stock Journal No'
,p_source=>'STOCKJOURNALNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(877521833399886178)
,p_name=>'P181_STOCKJOURNALPLANTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'STOCKJOURNALPLANTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(683461524029762774)
,p_name=>'P181_STOCKTNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(683461629405762775)
,p_name=>'P181_STORAGELOCATIONCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877520894456886168)
,p_name=>'P181_SUBSIDERYQUANTITY1'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'SUBSIDERYQUANTITY1'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(877519833503886158)
,p_name=>'P181_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_source_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26760555863923667)
,p_name=>'P181_TOTAL_RAW_AMOUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(877477252839886081)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(26760416437923666)
,p_name=>'P181_TOTAL_RAW_QTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(877477252839886081)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(89349698307488895)
,p_name=>'P181_TOTAL_STOCK_AVAILABLE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(878712544608922931)
,p_name=>'P181_VALIDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(877531625338355550)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(879472154249835710)
,p_name=>'P181_VOUCHERNO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(683423499117762713)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select voucherno from voucher ',
'where moduletno = :P181_TNO',
'--and modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID); '))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Voucher No'
,p_post_element_text=>'<a href="f?p=&APP_ID.:156:&SESSION.::NO:RP,156:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS,P156_CALLEDFROMTNO:&P181_VOUCHERTNO.,181,CALLED,&P181_TNO."><span class="fa fa-magic"></span></a>'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(879456331325835703)
,p_name=>'P181_VOUCHERTNO'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(877474331562886052)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno from voucher ',
'where moduletno = :P181_TNO',
'--and modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID); '))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(58564385101942463)
,p_tabular_form_region_id=>wwv_flow_imp.id(877531625338355550)
,p_validation_name=>'New'
,p_static_id=>'new'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P181_RAW_QTY <> :P181_QTY1 then',
'   return FALSE;',
'ELSE',
'   RETURN TRUE;',
'END IF;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_BOOLEAN'
,p_error_message=>'sTOCK dETAIL QUANTITY SHOUD EQUAL TO DETAIL QUANTITY'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58603315102942488)
,p_name=>'Allocation the Raw Material Stock'
,p_static_id=>'allocation-the-raw-material-stock'
,p_event_sequence=>410
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58561712773942462)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(63830352170662798)
,p_event_id=>wwv_flow_imp.id(58603315102942488)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Insert Data into Grid Via AJAX'
,p_static_id=>'insert-data-into-grid-via-ajax'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.server.process("FETCH_DATA_FOR_RAW_STOCK_GRID", ',
    '    { pageItems: "#P181_TNO,#P181_RAW_SNO,#P181_RAW_QTY,#P181_DETAILITEM,#P181_DETAILITEMSPECIFICATION,#P181_LOCATIONCODE" }, ',
    '    {',
    '        success: function(pData) {',
    '            if (pData.status === ''ERROR'') {',
    '                apex.message.showErrors([{ type: "error", location: "page", message: pData.message }]);',
    '                return;',
    '            }',
    '            setTimeout(function() {',
    '                var region = apex.region(''Raw_Stock_Detail'');',
    '                var ig$ = region.widget();',
    '                var igActions = ig$.interactiveGrid("getActions");',
    '                var $model = region.call(''getViews'', ''grid'').model;',
    '',
    '                $model.allowInsert = true;',
    '                ',
    '                igActions.enable("selection-add-row");',
    '',
    '                // Delete old entered Data',
    '                var toDelete = [];',
    '                $model.forEach(function(record, index, id){',
    '                    var meta = $model.getRecordMetadata(id);',
    '                    if (meta && (meta.inserted || meta.created)) { toDelete.push(record); }',
    '                });',
    '                if (toDelete.length > 0) { $model.deleteRecords(toDelete); }',
    '',
    '                pData.stockQty.forEach(function(sQty) {',
    '',
    '                    var newRecordId = $model.insertNewRecord();',
    '                    var newRecord   = $model.getRecord(newRecordId);',
    '',
    '                    // Helper function to handle null/undefined',
    '                    function clean(val) { return (val === undefined || val === null) ? "" : String(val); }',
    '',
    '                    $model.setValue(newRecord, ''TNO''                    , clean(sQty.TNO));',
    '                    $model.setValue(newRecord, ''SNO''                    , clean(sQty.SNO));',
    '                    $model.setValue(newRecord, ''SN''                     , clean(sQty.SN));',
    '                    ',
    '                    // LOV Columns handling',
    '                    if (sQty.STORAGELOCATIONCODE) {',
    '                        $model.setValue(newRecord, ''STORAGELOCATIONCODE'', {d: clean(sQty.STORAGELOCATIONNAME), v: clean(sQty.STORAGELOCATIONCODE)});',
    '                    } else {',
    '                        $model.setValue(newRecord, ''STORAGELOCATIONCODE'', null);',
    '                    }',
    '',
    '                    if (sQty.STOCKTNO) {',
    '                        $model.setValue(newRecord, ''STOCKTNO'', {d: clean(sQty.TRANSACTIONNO), v: clean(sQty.STOCKTNO)});',
    '                    } else {',
    '                        $model.setValue(newRecord, ''STOCKTNO'', null);',
    '                    }',
    '                    $model.setValue(newRecord, ''QUANTITY1''              , clean(sQty.QUANTITY1));',
    '                    $model.setValue(newRecord, ''AMOUNT''                 , clean(sQty.AMOUNT));',
    '                    $model.setValue(newRecord, ''REMARK''                 , clean(sQty.REMARK));',
    '                    $model.setValue(newRecord, ''APEX_SESSION_ID''        , clean(sQty.APEX_SESSION_ID));',
    '                });',
    '            },300);',
    '            // igActions.disable("selection-add-row");',
    '            // igActions.disable("row-add-row");',
    '        }',
    '    }',
    ');')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58603778298942488)
,p_event_id=>wwv_flow_imp.id(58603315102942488)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P181_TNO,P181_RAW_SNO,P181_DETAILITEM,P181_DETAILITEMSPECIFICATION,P181_RAW_QTY,GLOBAL_COMPANYCODE,P181_LOCATIONCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_required_qty  NUMBER := :P181_RAW_QTY;',
    'BEGIN',
    '    --Delete the Old Data',
    '    DELETE FROM STOCKJOURNALRAWSTOCKDETAIL ',
    '    WHERE TNO = :P181_TNO ',
    '      AND SNO = :P181_RAW_SNO;',
    '',
    '    -- FIFO Allocation Loop',
    '    FOR rec IN (',
    '        SELECT s.tno AS stocktno, ',
    '               s.rate, ',
    '               (NVL(s.STOCKQUANTITY1, 0) - NVL(u.used_qty, 0)) AS available_qty, ',
    '               s.storagelocationcode',
    '          FROM stock s',
    '          LEFT JOIN (',
    '               SELECT stocktno, SUM(USEDSTOCKQUANTITY1) used_qty ',
    '                 FROM usedstock ',
    '                GROUP BY stocktno',
    '          ) u ON s.tno = u.stocktno',
    '         WHERE s.itemcode = :P181_DETAILITEM',
    '           AND s.itemspecificationcode = :P181_DETAILITEMSPECIFICATION',
    '           AND s.CompanyCode = :GLOBAL_COMPANYCODE',
    '           AND s.LOCATIONCODE = :P181_LOCATIONCODE',
    '           AND (NVL(s.STOCKQUANTITY1, 0) - NVL(u.used_qty, 0)) > 0',
    '         ORDER BY s.stockdate ASC, s.tno ASC ',
    '    ) LOOP',
    '        EXIT WHEN v_required_qty <= 0;',
    '',
    '        DECLARE',
    '            v_issue_qty NUMBER := LEAST(v_required_qty, rec.available_qty);',
    '        BEGIN',
    '            ',
    '            Insert Into STOCKJOURNALRAWSTOCKDETAIL (TNO, SNO, SN, STOCKTNO, STORAGELOCATIONCODE, QUANTITY1, AMOUNT, REMARK, APEX_SESSION_ID)',
    '            Values (:P181_TNO, :P181_RAW_SNO, GlobalTNo.Nextval, rec.stocktno, rec.storagelocationcode,v_issue_qty,v_issue_qty * rec.rate, ''AUTO ALLOCATED'',:APP_SESSION);',
    '            ',
    '            v_required_qty := v_required_qty - v_issue_qty;',
    '        END;',
    '    END LOOP;',
    '',
    '    -- Final Validation',
    '    IF v_required_qty > 0 THEN',
    '        RAISE_APPLICATION_ERROR(-20001, ''Insufficient stock. Shortfall: '' || v_required_qty);',
    '    END IF;',
    '',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58604237562942489)
,p_event_id=>wwv_flow_imp.id(58603315102942488)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Refresh the Region (stock allocation Raw)'
,p_static_id=>'refresh-the-region-stock-allocation-raw'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(877531625338355550)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58604765688942489)
,p_event_id=>wwv_flow_imp.id(58603315102942488)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Set Necessary Values  '
,p_static_id=>'set-necessary-values'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'function getIGValue(model, record, columnName) {',
    '    var val = model.getValue(record, columnName);',
    '    if (val && typeof val === ''object'') {',
    '        return val.v;  ',
    '    }',
    '    return val;       ',
    '}',
    '',
    '',
    'var ig    = apex.region("Raw_Stock").call("getViews","grid");',
    'var rec   = ig.getSelectedRecords()[0];',
    'var model = ig.model;',
    '',
    'if(!rec){',
    '    apex.message.alert("select the row first");',
    '    return;',
    '}',
    '',
    '$s("P181_RAW_SNO",                  getIGValue(model, rec, "RAW_SNO"));',
    '$s("P181_DETAILITEM",               getIGValue(model, rec, "ITEMCODE"));',
    '$s("P181_DETAILITEMSPECIFICATION",  getIGValue(model, rec, "ITEMSPECIFICATIONCODE"));',
    '$s("P181_RAW_QTY",                  getIGValue(model, rec, "QUANTITY1"));')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58615507690942492)
,p_name=>'Back'
,p_static_id=>'back'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58561268954942462)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58616006908942492)
,p_event_id=>wwv_flow_imp.id(58615507690942492)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(877531625338355550)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26760700195923669)
,p_event_id=>wwv_flow_imp.id(58615507690942492)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Set Total Amount'
,p_static_id=>'set-total-amount'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P181_TOTAL_RAW_AMOUNT',
  'items_to_submit', 'P181_TNO,P181_TOTAL_RAW_AMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    V_FRESH_TOTAL NUMBER := 0;',
    'BEGIN',
    '    SELECT COALESCE(SUM(A."AMOUNT"), 0)',
    '      INTO V_FRESH_TOTAL',
    '      FROM "STOCKJOURNALRAWSTOCKDETAIL" A',
    '     WHERE A."TNO" = :P181_TNO;',
    '',
    '    :P181_TOTAL_RAW_AMOUNT := V_FRESH_TOTAL;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58619059527942493)
,p_name=>'Back1'
,p_static_id=>'back-2'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58544510650942452)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58619541916942493)
,p_event_id=>wwv_flow_imp.id(58619059527942493)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(877534916164355583)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27016776708537223)
,p_name=>'Calculate the Rate for Finish Section'
,p_static_id=>'calculate-the-rate-for-finish-section'
,p_event_sequence=>520
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P181_TOTAL_RAW_AMOUNT,P181_TOTAL_RAW_QTY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27016907222537224)
,p_event_id=>wwv_flow_imp.id(27016776708537223)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_CONSOLIDATED_RATE_FOR_FINISH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P181_TOTAL_RAW_QTY,P181_TOTAL_RAW_AMOUNT',
  'plsql_expression', wwv_flow_string.join(wwv_flow_t_varchar2(
    'round(NVL(NVL(:P181_TOTAL_RAW_AMOUNT, 0) / NULLIF(NVL(:P181_TOTAL_RAW_QTY, 0), 0), 0),2)',
    '')),
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58609593872942490)
,p_name=>'Cancel dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58527461681942433)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58610044992942491)
,p_event_id=>wwv_flow_imp.id(58609593872942490)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P181_CALLEDFROMPAGE'').getValue();',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
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
 p_id=>wwv_flow_imp.id(58618207060942493)
,p_name=>'Check Qty2'
,p_static_id=>'check-qty'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58544510650942452)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58618707279942493)
,p_event_id=>wwv_flow_imp.id(58618207060942493)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P181_QTY2,P181_QTY3,P181_AMT,P181_AMT1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin ',
    '',
    '    if :P181_QTY2 <> :P181_QTY3 then',
    '        raise_application_error(-20000,''Quantity Not matching!'');',
    '    end if;',
    '',
    '     if :P181_AMT <> :P181_AMT1 then',
    '        raise_application_error(-20000,''Amount is not matching!'');',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58614036628942492)
,p_name=>'CheckQty'
,p_static_id=>'checkqty'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58561268954942462)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58614555602942492)
,p_event_id=>wwv_flow_imp.id(58614036628942492)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P181_VALIDATE',
  'items_to_submit', 'P181_RAW_QTY,P181_QTY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin ',
    '',
    '    if :P181_Raw_QTY <> :P181_QTY1 then',
    'NULL;',
    '        --:P181_VALIDATE := ''NO'';',
    '        --raise_application_error(-20000,''Quantity Not matching!'');',
    '    ELSE',
    '        :P181_VALIDATE := ''YES'';',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58615060641942492)
,p_event_id=>wwv_flow_imp.id(58614036628942492)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_VALIDATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58635205610942497)
,p_name=>'Disable All Button if Called From Another Form'
,p_static_id=>'disable-all-button-if-called-from-another-form'
,p_event_sequence=>320
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58635684117942497)
,p_event_id=>wwv_flow_imp.id(58635205610942497)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528713321942433)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P181_FORMSTATUS'
,p_client_condition_expression=>'CALLED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58636164516942497)
,p_event_id=>wwv_flow_imp.id(58635205610942497)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527818947942433)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P181_FORMSTATUS'
,p_client_condition_expression=>'CALLED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58636684408942497)
,p_event_id=>wwv_flow_imp.id(58635205610942497)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528282993942433)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P181_FORMSTATUS'
,p_client_condition_expression=>'CALLED'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58637058088942497)
,p_name=>'Disable All Button if Voucher is Exists'
,p_static_id=>'disable-all-button-if-voucher-is-exists'
,p_event_sequence=>330
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58637567163942498)
,p_event_id=>wwv_flow_imp.id(58637058088942497)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528713321942433)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P181_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58638046117942498)
,p_event_id=>wwv_flow_imp.id(58637058088942497)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527818947942433)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P181_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58638520706942498)
,p_event_id=>wwv_flow_imp.id(58637058088942497)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528282993942433)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P181_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29062583078959869)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>530
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29065483732959873)
,p_event_id=>wwv_flow_imp.id(29062583078959869)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled But not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527818947942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29064014724959873)
,p_event_id=>wwv_flow_imp.id(29062583078959869)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527818947942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29064499491959873)
,p_event_id=>wwv_flow_imp.id(29062583078959869)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527818947942433)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P181_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29062989226959872)
,p_event_id=>wwv_flow_imp.id(29062583078959869)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527818947942433)
,p_server_condition_type=>'FUNCTION_BODY'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  TMP NUMBER;',
'  TMP1 NUMBER;',
'BEGIN',
'   SELECT COUNT(*) INTO TMP FROM VOUCHER WHERE MODULETNO = :P181_TNO;',
'   IF NVL(TMP,0) > 0 then',
'        return true;',
'   end if;',
'   ',
'END;'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29063534208959872)
,p_event_id=>wwv_flow_imp.id(29062583078959869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527818947942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29070600656962324)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>560
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29071981181962325)
,p_event_id=>wwv_flow_imp.id(29070600656962324)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled But not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527109959942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29071510725962325)
,p_event_id=>wwv_flow_imp.id(29070600656962324)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527109959942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29071046518962324)
,p_event_id=>wwv_flow_imp.id(29070600656962324)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527109959942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29066037077960904)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>540
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29068386238960905)
,p_event_id=>wwv_flow_imp.id(29066037077960904)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_name=>'Disabled But not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528282993942433)
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
 p_id=>wwv_flow_imp.id(29066413608960905)
,p_event_id=>wwv_flow_imp.id(29066037077960904)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528282993942433)
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
 p_id=>wwv_flow_imp.id(29067443897960905)
,p_event_id=>wwv_flow_imp.id(29066037077960904)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528282993942433)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P181_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29066930750960905)
,p_event_id=>wwv_flow_imp.id(29066037077960904)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528282993942433)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(29068810329961623)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>550
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29070175633961623)
,p_event_id=>wwv_flow_imp.id(29068810329961623)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled But not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29069711416961623)
,p_event_id=>wwv_flow_imp.id(29068810329961623)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(29069209791961623)
,p_event_id=>wwv_flow_imp.id(29068810329961623)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58627418560942495)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>290
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58526704398942433)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58631503869942496)
,p_event_id=>wwv_flow_imp.id(58627418560942495)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P181_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58630998279942496)
,p_event_id=>wwv_flow_imp.id(58627418560942495)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58628434076942495)
,p_event_id=>wwv_flow_imp.id(58627418560942495)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P181_TNO,P181_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--SetDocumentStatusCode(''PURCHASEORDER'',13604,:P181_STATUS);',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P181_TNO,:P181_STATUS);',
    '--if :P181_STATUS = ''ACTIVE'' then',
    '--    PostStockJournal(:P181_TNo);',
    '--end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58629488273942496)
,p_event_id=>wwv_flow_imp.id(58627418560942495)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text($v(''P181_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58629971775942496)
,p_event_id=>wwv_flow_imp.id(58627418560942495)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'location.reload()',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58630509102942496)
,p_event_id=>wwv_flow_imp.id(58627418560942495)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(683422884185762707)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58627988510942495)
,p_event_id=>wwv_flow_imp.id(58627418560942495)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58628919055942495)
,p_event_id=>wwv_flow_imp.id(58627418560942495)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Voucher Posting'
,p_static_id=>'voucher-posting'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P181_ISREADONLY',
  'items_to_submit', 'P181_TNO,P181_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tmp number;',
    '  tgrnno varchar2(1000);',
    'begin',
    '    if :P181_STATUS = ''ACTIVE'' then',
    '        for vGrn in (',
    '          select',
    '           c.grnno, count(*)',
    '        from stockjournalrawstockdetail a, stock b, grn c',
    '        where A.TNO=:P181_TNO',
    '          AND a.stocktno = b.tno',
    '          and b.grntno = c.tno',
    '          and not exists ( select 1 from pbpassdetailgrn aa, pbpass bb, voucher cc',
    '                           where aa.tno = bb.tno',
    '                             and bb.tno = cc.moduletno',
    '                             and aa.grntno = b.grntno',
    '                         )',
    '         group by c.grnno',
    '         having count(*) > 0',
    '        ) loop',
    '           tgrnno := tgrnno||'' ,''||vGrn.grnno;',
    '        end loop;',
    '        if tgrnno is null then',
    '            SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P181_TNO,:P181_STATUS);',
    '            POSTSTOCKJOURNAL_TEMP(:P181_TNO);',
    '        else',
    '            raise_application_error(-20025,''Purchase Bill Not Passed/Posted for Grn No ''||tgrnno||'' first Post then Try'');',
    '        end if;',
    '    else',
    '            SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P181_TNO,:P181_STATUS);',
    '    end if;',
    '',
    '--if :P181_STATUS = ''ACTIVE'' then',
    '    --  PostStockJournal(:P181_TNo);',
    '--     POSTSTOCKJOURNAL_TEMP(:P181_TNO); -- Created by Vibhor on 27-05-2026 (to handle the both scenario (Normal and Single side case))',
    '--     :P181_ISREADONLY := 1;',
    '--end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58632746158942496)
,p_name=>'Enable Disable Buttons Based On Module Flow'
,p_static_id=>'enable-disable-buttons-based-on-module-flow'
,p_event_sequence=>310
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58633288534942496)
,p_event_id=>wwv_flow_imp.id(58632746158942496)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58525448223942432)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P181_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58633729773942497)
,p_event_id=>wwv_flow_imp.id(58632746158942496)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58525884259942432)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P181_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58634234128942497)
,p_event_id=>wwv_flow_imp.id(58632746158942496)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P181_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58634771463942497)
,p_event_id=>wwv_flow_imp.id(58632746158942496)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526233087942432)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P181_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58625022874942494)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>280
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58525884259942432)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58626020208942495)
,p_event_id=>wwv_flow_imp.id(58625022874942494)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P181_TNO,P181_COMPANYCODE,P181_PURCHASEORDERNO,P181_PASSFAILREMARK',
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
    '                        AND A.ModuleTno = :P181_TNO',
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
    '						a.remark = :P181_PASSFAILREMARK',
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
 p_id=>wwv_flow_imp.id(58626608185942495)
,p_event_id=>wwv_flow_imp.id(58625022874942494)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58627073421942495)
,p_event_id=>wwv_flow_imp.id(58625022874942494)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58625592161942495)
,p_event_id=>wwv_flow_imp.id(58625022874942494)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58601511059942487)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>390
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58527109959942433)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58601941823942488)
,p_event_id=>wwv_flow_imp.id(58601511059942487)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58596959401942486)
,p_name=>'Get SN on Row Initialization for Finish Stock Detail'
,p_static_id=>'get-sn-on-row-initialization-for-finish-stock-detail'
,p_event_sequence=>470
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(877534916164355583)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58597479686942486)
,p_event_id=>wwv_flow_imp.id(58596959401942486)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SN',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    MYSN NUMBER;',
    'BEGIN',
    '    IF :SN IS NULL THEN',
    '        SELECT GLOBALTNO.NEXTVAL INTO MYSN FROM DUAL;',
    '    ELSE ',
    '        MYSN := :SN;',
    '    END IF;',
    '    ',
    '    RETURN MYSN;',
    'END;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58596018940942486)
,p_name=>'Get SN on Row Initialization for Raw Stock Detail'
,p_static_id=>'get-sn-on-row-initialization-for-raw-stock-detail'
,p_event_sequence=>460
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(877531625338355550)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58596553615942486)
,p_event_id=>wwv_flow_imp.id(58596018940942486)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SN',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    MYSN NUMBER;',
    'BEGIN',
    '    IF :SN IS NULL THEN',
    '        SELECT GLOBALTNO.NEXTVAL INTO MYSN FROM DUAL;',
    '    ELSE ',
    '        MYSN := :SN;',
    '    END IF;',
    '    ',
    '    RETURN MYSN;',
    'END;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58599655353942487)
,p_name=>'Hide Nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>370
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58600147022942487)
,p_event_id=>wwv_flow_imp.id(58599655353942487)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(27016470686537220)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>510
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#SR_Raw_Stock'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27016637615537221)
,p_event_id=>wwv_flow_imp.id(27016470686537220)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'console.log(''1'');',
    'calculateTotalQty();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58598779104942487)
,p_name=>'Open Voucher'
,p_static_id=>'open-voucher'
,p_event_sequence=>360
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P181_VOUCHERNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58599243449942487)
,p_event_id=>wwv_flow_imp.id(58598779104942487)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P181_VOUCHERTNO'').getValue();',
    'var y = ''181'';',
    'var z = ''CALLED'';',
    '',
    'var url = "f?p=#APP_ID#:156:#SESSION#::NO:RP,156:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P156_TNO#", x);',
    'url = url.replace("#P156_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P156_FORMSTATUS#", z);',
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
 p_id=>wwv_flow_imp.id(58622681388942494)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>270
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58525448223942432)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58623640325942494)
,p_event_id=>wwv_flow_imp.id(58622681388942494)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P181_TNO,P181_COMPANYCODE,P181_PURCHASEORDERNO,P181_PASSFAILREMARK',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) := :P181_PURCHASEORDERNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P181_TNO --'':P''||:APP_PAGE_ID||''_TNo''',
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
    '				a.remark = :P181_PASSFAILREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(getModuleCodeForPageNo(:APP_PAGE_ID), :P181_TNO , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58624195791942494)
,p_event_id=>wwv_flow_imp.id(58622681388942494)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58624616673942494)
,p_event_id=>wwv_flow_imp.id(58622681388942494)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58623179213942494)
,p_event_id=>wwv_flow_imp.id(58622681388942494)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58605181664942489)
,p_name=>'Post'
,p_static_id=>'post'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58525069612942432)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58607647562942490)
,p_event_id=>wwv_flow_imp.id(58605181664942489)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58525069612942432)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P181_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58608137033942490)
,p_event_id=>wwv_flow_imp.id(58605181664942489)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58528282993942433)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P181_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58608711837942490)
,p_event_id=>wwv_flow_imp.id(58605181664942489)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58526704398942433)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P181_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58609204911942490)
,p_event_id=>wwv_flow_imp.id(58605181664942489)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(58527818947942433)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P181_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58605674697942489)
,p_event_id=>wwv_flow_imp.id(58605181664942489)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P181_TNO,P181_STOCKJOURNALDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare ',
    '	tVoucherDate Date := nvl(to_date(:P181_STOCKJOURNALEDATE, ''DD-MM-RRRR''), to_date(trunc(sysdate), ''DD-MM-RRRR''));',
    '    temp number;',
    '    tVouherNo Varchar2(100);',
    '    ttno number := :P181_TNO;',
    'Begin',
    '    temp := 0;',
    '	select',
    '			count(a.tno) into temp',
    '	from Voucher a',
    '	where a.ModuleCode = GetModuleCodeForPageNo(:APP_PAGE_ID) ',
    '			and a.ModuleTNo = ttno',
    '	;',
    '   ',
    '   if GetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), ttno) = ''ACTIVE'' then',
    '    	if nvl(temp, 0) = 0 then		',
    '    		Begin',
    '    			PostStockJournal(:P181_TNO);',
    '            Exception',
    '    			when others then',
    '    					rollback;',
    '                        raise_application_error(-20000, ''Voucher not posting. '' || sqlerrm);',
    '    		End;',
    '    	end if;',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58607150732942490)
,p_event_id=>wwv_flow_imp.id(58605181664942489)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_VOUCHERNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58606213468942489)
,p_event_id=>wwv_flow_imp.id(58605181664942489)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_VOUCHERTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P181_TNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    rtvalue number;',
    'begin',
    '    for vVoucher in',
    '        (',
    '        Select',
    '            a.Tno',
    '        From Voucher a',
    '        where a.ModuleTno = :P181_TNO',
    '        )',
    '    loop',
    '        rtvalue := vVoucher.Tno;',
    '        exit;',
    '    end loop;',
    '    return rtvalue;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58606673156942490)
,p_event_id=>wwv_flow_imp.id(58605181664942489)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_VOUCHERNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P181_TNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    rtvalue varchar2(100);',
    'begin',
    '    for vVoucher in',
    '        (',
    '        Select',
    '            a.VoucherNo',
    '        From Voucher a',
    '        where a.ModuleTno = :P181_TNO',
    '        )',
    '    loop',
    '        rtvalue := vVoucher.VoucherNo;',
    '        exit;',
    '    end loop;',
    '    return rtvalue;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58631838653942496)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>300
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58526704398942433)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58632362263942496)
,p_event_id=>wwv_flow_imp.id(58631838653942496)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58621786741942494)
,p_name=>'set '
,p_static_id=>'set'
,p_event_sequence=>260
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877532973776355563)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58622302791942494)
,p_event_id=>wwv_flow_imp.id(58621786741942494)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_AMT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT',
  'sql_query', 'select :AMOUNT from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58611409649942491)
,p_name=>'Set amount'
,p_static_id=>'set-amount'
,p_event_sequence=>80
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877531625338355550)
,p_triggering_element=>'STOCKTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58611865841942491)
,p_event_id=>wwv_flow_imp.id(58611409649942491)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1,AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,STOCKTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:QUANTITY1,0), nvl(rate,0)*nvl(:QUANTITY1,0) as amount ',
    'from stock    ',
    'where tno = :stocktno   ',
    '',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58619960387942493)
,p_name=>'SET AMOUNT'
,p_static_id=>'set-amount-2'
,p_event_sequence=>240
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877532973776355563)
,p_triggering_element=>'RATE,QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58620425774942493)
,p_event_id=>wwv_flow_imp.id(58619960387942493)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE',
  'sql_query', 'select nvl(:QUANTITY1,0)*NVL(:RATE,0) FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58610474763942491)
,p_name=>'Set Detail Item Code'
,p_static_id=>'set-detail-item-code'
,p_event_sequence=>60
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877477252839886081)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58610922952942491)
,p_event_id=>wwv_flow_imp.id(58610474763942491)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_DETAILITEM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', 'select :itemcode from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58620819601942493)
,p_name=>'SET P181_AMT'
,p_static_id=>'set-p181-amt'
,p_event_sequence=>250
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877532973776355563)
,p_triggering_element=>'RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58621400790942493)
,p_event_id=>wwv_flow_imp.id(58620819601942493)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_AMT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT',
  'sql_query', 'SELECT :AMOUNT FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58612259410942491)
,p_name=>'Set P181_QTY'
,p_static_id=>'set-p181-qty'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877477252839886081)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58612782684942491)
,p_event_id=>wwv_flow_imp.id(58612259410942491)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_RAW_QTY,P181_RAW_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1, RAW_SNO',
  'sql_query', 'select :QUANTITY1, :RAW_SNO from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58600592019942487)
,p_name=>'set page item P181_STORAGELOCATIONCODE'
,p_static_id=>'set-page-item-p181-storagelocationcode'
,p_event_sequence=>380
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877531625338355550)
,p_triggering_element=>'STORAGELOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58601031079942487)
,p_event_id=>wwv_flow_imp.id(58600592019942487)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_STORAGELOCATIONCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'STORAGELOCATIONCODE',
  'sql_query', 'select :STORAGELOCATIONCODE from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58616377556942492)
,p_name=>'Set QTY2'
,p_static_id=>'set-qty'
,p_event_sequence=>190
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877532973776355563)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58616877658942492)
,p_event_id=>wwv_flow_imp.id(58616377556942492)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_QTY2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1',
  'sql_query', 'Select :QUANTITY1 from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(27017008626537225)
,p_event_id=>wwv_flow_imp.id(58616377556942492)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P181_CONSOLIDATED_RATE_FOR_FINISH',
  'plsql_expression', ':P181_CONSOLIDATED_RATE_FOR_FINISH',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58602410401942488)
,p_name=>'Set Specification'
,p_static_id=>'set-specification'
,p_event_sequence=>400
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877477252839886081)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58602896687942488)
,p_event_id=>wwv_flow_imp.id(58602410401942488)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P181_DETAILITEMSPECIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'plsql_expression', ':ITEMSPECIFICATIONCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58594233575942485)
,p_name=>'Set the Detail on Selection Change'
,p_static_id=>'set-the-detail-on-selection-change'
,p_event_sequence=>440
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(877477252839886081)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58594718711942486)
,p_event_id=>wwv_flow_imp.id(58594233575942485)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pRaw_Sno, ',
    '    p_Raw_Item, ',
    '    p_Raw_Item_specification,',
    '    p_Raw_Qty,',
    '    model = this.data.model;',
    '',
    'pRaw_Sno                    = model.getValue( this.data.selectedRecords[0], "RAW_SNO");',
    'p_Raw_Item                  = model.getValue( this.data.selectedRecords[0], "ITEMCODE");',
    'p_Raw_Item_specification    = model.getValue( this.data.selectedRecords[0], "ITEMSPECIFICATIONCODE");',
    'p_Raw_Qty                   = model.getValue( this.data.selectedRecords[0], "QUANTITY1");',
    '',
    'apex.item( "P181_RAW_SNO" ).setValue (pRaw_Sno);',
    'apex.item( "P181_DETAILITEM" ).setValue (p_Raw_Item);',
    'apex.item( "P181_DETAILITEMSPECIFICATION" ).setValue (p_Raw_Item_specification);',
    'apex.item( "P181_RAW_QTY" ).setValue (p_Raw_Qty);',
    '',
    '',
    '',
    '',
    '// var grid = apex.region(''Raw_Stock'').call(''getViews'',''grid''), ',
    '//     model = grid.model, ',
    '//     rec = grid.getSelectedRecords()[0];',
    '',
    '// if(!rec){',
    '//     apex.message.alert("change the selection first");',
    '//     return;',
    '// }',
    '',
    '// $s("P181_RAW_SNO", grid.model.getValue(rec, "SNO"));')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58595190279942486)
,p_name=>'Set the Finish item on selection change'
,p_static_id=>'set-the-finish-item-on-selection-change'
,p_event_sequence=>450
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(877532973776355563)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58595657072942486)
,p_event_id=>wwv_flow_imp.id(58595190279942486)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pRaw_Sno, ',
    '    model = this.data.model;',
    '',
    'pRaw_Sno = model.getValue( this.data.selectedRecords[0], "FIN_SNO");',
    '',
    'apex.item( "P181_FIN_SNO" ).setValue (pRaw_Sno);',
    '',
    '',
    '',
    '',
    '',
    '// var grid = apex.region(''Stock_Finished'').call(''getViews'',''grid''), model = grid.model, rec = grid.getSelectedRecords()[0];',
    '',
    '// if(!rec){',
    '//     apex.message.alert("change the selection first");',
    '//     return;',
    '// }',
    '',
    '// $s("P181_FIN_SNO", grid.model.getValue(rec, "SNO"));')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58593355996942484)
,p_name=>'Set the  SNO on Row Initialization (FS)'
,p_static_id=>'set-the-sno-on-row-initialization-fs'
,p_event_sequence=>465
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(877532973776355563)
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'FIN_SNO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26603850950119165)
,p_event_id=>wwv_flow_imp.id(58593355996942484)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-alert'
,p_action=>'NATIVE_ALERT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'message', 'Finished Row Start',
  'title', 'Finished Row Start')).to_clob
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26756032965923622)
,p_event_id=>wwv_flow_imp.id(58593355996942484)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FIN_SNO',
  'items_to_submit', 'FIN_SNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    IF :FIN_SNO IS NULL THEN',
    '        SELECT GLOBALTNO.NEXTVAL INTO :FIN_SNO FROM DUAL;',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26604049803119167)
,p_event_id=>wwv_flow_imp.id(58593355996942484)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// Current Context se Model aur Record uthate hain',
    'var model = this.data.model;',
    'var record = this.data.record;',
    '',
    '// Check karein agar FIN_SNO khali hai (Nayi Row)',
    'if ( !model.getValue(record, "FIN_SNO") ) {',
    '    ',
    '    // Server se value layein',
    '    apex.server.process("GET_SEQUENCE_VAL", {}, {',
    '        success: function(pData) {',
    '            // model.setValue UI ko turant refresh karta hai',
    '            // Closure issue ab nahi aayega kyunki naam unique hai "FIN_SNO"',
    '            model.setValue(record, "FIN_SNO", pData.sno.toString());',
    '        }',
    '    });',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58593834046942485)
,p_event_id=>wwv_flow_imp.id(58593355996942484)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    MYSNO NUMBER;',
    'BEGIN',
    '    IF :SNO IS NULL THEN',
    '        SELECT GLOBALTNO.NEXTVAL INTO MYSNO FROM DUAL;',
    '    ELSE ',
    '        MYSNO := :SNO;',
    '    END IF;',
    '    ',
    '    RETURN MYSNO;',
    'END;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58640333307942498)
,p_name=>'Set the SNO on Row Initialization (RS)'
,p_static_id=>'set-the-sno-on-row-initialization-rs'
,p_event_sequence=>420
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(877477252839886081)
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'RAW_SNO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26603750047119164)
,p_event_id=>wwv_flow_imp.id(58640333307942498)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-alert'
,p_action=>'NATIVE_ALERT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'message', 'Raw Row Start',
  'title', 'Raw Row Start')).to_clob
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26755939196923621)
,p_event_id=>wwv_flow_imp.id(58640333307942498)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'RAW_SNO',
  'items_to_submit', 'RAW_SNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    IF :RAW_SNO IS NULL THEN',
    '        SELECT GLOBALTNO.NEXTVAL INTO :RAW_SNO FROM DUAL;',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(26604147147119168)
,p_event_id=>wwv_flow_imp.id(58640333307942498)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = this.data.model;',
    'var record = this.data.record;',
    '',
    'if ( !model.getValue(record, "RAW_SNO") ) {',
    '    apex.server.process("GET_SEQUENCE_VAL", {}, {',
    '        success: function(pData) {',
    '            model.setValue(record, "RAW_SNO", pData.sno.toString());',
    '        }',
    '    });',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58640899638942498)
,p_event_id=>wwv_flow_imp.id(58640333307942498)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    MYSNO NUMBER;',
    'BEGIN',
    '    IF :SNO IS NULL THEN',
    '        SELECT GLOBALTNO.NEXTVAL INTO MYSNO FROM DUAL;',
    '    ELSE ',
    '        MYSNO := :SNO;',
    '    END IF;',
    '    ',
    '    RETURN MYSNO;',
    'END;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(583251259988425780)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58638948005942498)
,p_name=>'Set unit'
,p_static_id=>'set-unit'
,p_event_sequence=>340
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877477252839886081)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58639515088942498)
,p_event_id=>wwv_flow_imp.id(58638948005942498)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var grid = apex.region("Raw_Stock").widget().interactiveGrid("getViews", "grid");',
    'var model = grid.model;',
    'var record = grid.getSelectedRecords()[0];',
    '',
    'if (record) {',
    '    var itemcode = model.getValue(record, "ITEMCODE");',
    '    ',
    '    apex.server.process(',
    '        "GET_UNIT", ',
    '        { x01: itemcode }, ',
    '        {',
    '            success: function(pData) {',
    '                model.setValue(record, "UNIT", pData.unit);',
    '            },',
    '            error: function(jqXHR, textStatus, errorThrown) {',
    '                console.error("AJAX Error: " + textStatus);',
    '            }',
    '        }',
    '    );',
    '}',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58639933066942498)
,p_event_id=>wwv_flow_imp.id(58638948005942498)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNIT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select MEASURINGUNITCODE1 from item',
    'where ITEMCODE = :ITEMCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58597848586942486)
,p_name=>'Set unit of finished raw'
,p_static_id=>'set-unit-of-finished-raw'
,p_event_sequence=>350
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877532973776355563)
,p_triggering_element=>'ITEMCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58598330298942487)
,p_event_id=>wwv_flow_imp.id(58597848586942486)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'UNIT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select MEASURINGUNITCODE1 from item',
    'where ITEMCODE = :ITEMCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58641224602942498)
,p_name=>'Validate Stock and fetch Balance Qty'
,p_static_id=>'validate-stock-and-fetch-balance-qty'
,p_event_sequence=>480
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877531625338355550)
,p_triggering_element=>'STOCKTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58642300464942499)
,p_event_id=>wwv_flow_imp.id(58641224602942498)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58641719929942499)
,p_event_id=>wwv_flow_imp.id(58641224602942498)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P181_RAW_QTY,P181_RAW_STOCK_QTY',
  'plsql_expression', 'nvl(:P181_RAW_QTY,0)-nvl(:P181_RAW_STOCK_QTY,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58642662434942499)
,p_name=>'Validate Stock on Qty'
,p_static_id=>'validate-stock-on-qty'
,p_event_sequence=>490
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(877531625338355550)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58643184410942499)
,p_event_id=>wwv_flow_imp.id(58642662434942499)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'QUANTITY1,STOCKTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  v_Stock_qty      NUMBER;',
    '  v_allocate_qty   NUMBER;',
    'BEGIN',
    '    v_allocate_qty := NVL(:QUANTITY1,0);',
    '    ',
    '    SELECT SUM(STOCKQUANTITY1) - SUM(NVL(USEDSTOCKQUANTITY1,0)) INTO v_Stock_qty ',
    '    FROM STOCK ',
    '    WHERE TNO = :STOCKTNO;',
    '',
    '    IF NVL(v_Stock_qty,0) > v_allocate_qty THEN',
    '          :QUANTITY1 := v_allocate_qty ;',
    '    ELSE',
    '          :QUANTITY1 := v_Stock_qty ;',
    '     END IF;',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58644194906942499)
,p_event_id=>wwv_flow_imp.id(58642662434942499)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Raw_Stock_Detail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("QUANTITY1");',
    '',
    'var totalAmt = 0;',
    '',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '',
    '  ',
    '});',
    '',
    '$s("P181_RAW_STOCK_QTY", totalAmt.toFixed(3));',
    '',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58643640167942499)
,p_event_id=>wwv_flow_imp.id(58642662434942499)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58613180166942491)
,p_name=>'Validation'
,p_static_id=>'validation'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58561268954942462)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58613669157942492)
,p_event_id=>wwv_flow_imp.id(58613180166942491)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Raw_Stock_Detail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("QUANTITY1");',
    '',
    'var totalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '  ',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    ' ',
    '});',
    '',
    'apex.item("P181_QTY1").setValue(totalAmt);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(58617250693942492)
,p_name=>'Validation stock finished'
,p_static_id=>'validation-stock-finished'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(58544510650942452)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(58617811756942493)
,p_event_id=>wwv_flow_imp.id(58617250693942492)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Stock_Finished_Details").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("QUANTITY1");',
    'var totalAmount = model.getFieldKey("AMOUNT");',
    'var totalAmt = 0;',
    'var totalAmount1 = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '  var amount = parseFloat(r[totalAmount], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '',
    '  if (!isNaN(amount)) {',
    '    totalAmount1 += amount;',
    '  }',
    ' ',
    '});',
    '',
    'apex.item("P181_QTY3").setValue(totalAmt);',
    'apex.item("P181_AMT1").setValue(totalAmount1);')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58589359035942483)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P181_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>31642143079246803
,p_process_comment=>'Not Need in this case (Because they will save the Finish Item without entering the Raw Items)'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58588612407942483)
,p_process_sequence=>120
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete old Data from StockJournalRawStockDetail'
,p_static_id=>'delete-old-data-from-stockjournalrawstockdetail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    DELETE FROM STOCKJOURNALRAWSTOCKDETAIL ',
'    WHERE APEX_SESSION_ID = :APP_SESSION ',
'      AND TNO NOT IN (SELECT TNO FROM STOCKJOURNALRAW);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>31641396451246803
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58591747301942484)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detete from tables'
,p_static_id=>'detete-from-tables'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from STOCKJOURNALFINISHEDDETAIL where tno=:P181_TNO;',
'delete from STOCKJOURNALRAWSTOCKDETAIL where tno=:P181_TNO;',
'delete from STOCKJOURNALFINISHED where tno=:P181_TNO;',
'delete from STOCKJOURNALRAW where tno=:P181_TNO;',
'delete from STOCKJOURNAL where tno=:P181_TNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(58527818947942433)
,p_internal_uid=>31644531345246804
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(63830285168662797)
,p_process_sequence=>110
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FETCH_DATA_FOR_RAW_STOCK_GRID'
,p_static_id=>'fetch-data-for-raw-stock-grid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_required_qty NUMBER := NVL(:P181_RAW_QTY, 0);',
'    v_shortfall    NUMBER := 0;',
'    l_row_count    NUMBER := 0;',
'',
'    CURSOR c_stock_qty is ',
'        SELECT ',
'               S.TNO AS STOCKTNO,',
'               s.RATE,',
'               (NVL(S.STOCKQUANTITY1, 0) - NVL(U.USED_QTY, 0)) AS AVAILABLE_QTY,',
'               S.STORAGELOCATIONCODE,',
'               GETSTORAGELOCATIONNAME(S.STORAGELOCATIONCODE) AS STORAGELOCATIONNAME,',
'               GETMODULENO(S.STOCKMODULECODE,S.STOCKMODULETNO) AS TRANSACTIONNO,',
'               ''AUTO ALLOCATED'' AS REMARK',
'        FROM STOCK S',
'        LEFT JOIN (SELECT STOCKTNO, SUM(USEDSTOCKQUANTITY1) USED_QTY ',
'                   FROM USEDSTOCK GROUP BY STOCKTNO) U ON S.TNO = U.STOCKTNO',
'        WHERE S.ITEMCODE = :P181_DETAILITEM',
'          AND S.ITEMSPECIFICATIONCODE = :P181_DETAILITEMSPECIFICATION',
'          AND S.COMPANYCODE = :GLOBAL_COMPANYCODE',
'          AND S.LOCATIONCODE = :P181_LOCATIONCODE',
'          AND (NVL(S.STOCKQUANTITY1, 0) - NVL(U.USED_QTY, 0)) > 0',
'        ORDER BY S.STOCKDATE ASC, S.TNO ASC;',
'',
'BEGIN',
'    -- 1. Initial validation & Row Count Check',
'    FOR rec IN c_stock_qty LOOP',
'        l_row_count := l_row_count + 1;',
'        v_required_qty := v_required_qty - LEAST(v_required_qty, rec.available_qty);',
'        EXIT WHEN v_required_qty <= 0;',
'    END LOOP;',
'',
'    -- 2. Error Handling (If no stock found at all or not enough)',
'    IF l_row_count = 0 THEN',
'         apex_json.open_object;',
'         apex_json.write(''status'', ''ERROR'');',
'         apex_json.write(''message'', ''No stock found in database for Item: '' || :P181_DETAILITEM || '' at Location: '' || :P181_LOCATIONCODE);',
'         apex_json.close_object;',
'         RETURN;',
'    ELSIF v_required_qty > 0 THEN',
'        apex_json.open_object;',
'        apex_json.write(''status'', ''ERROR'');',
'        apex_json.write(''message'', ''Insufficient stock. Shortfall: '' || v_required_qty);',
'        apex_json.close_object;',
'        RETURN;',
'    END IF;',
'',
'',
'    v_required_qty := NVL(:P181_RAW_QTY, 0); -- Reset Qty for 2nd loop',
'',
'    apex_json.open_object;',
'    apex_json.open_array(''stockQty'');',
'',
'    for r in c_stock_qty LOOP',
'        EXIT WHEN v_required_qty <= 0;',
'        ',
'        DECLARE',
'            v_issue_qty NUMBER := LEAST(v_required_qty, r.available_qty);',
'            v_sn_seq    NUMBER := GlobalTNo.Nextval;',
'        BEGIN',
'            apex_json.open_object;',
'            apex_json.write(''TNO''                 , :P181_TNO);',
'            apex_json.write(''SNO''                 , :P181_RAW_SNO);',
'            apex_json.write(''SN''                  , v_sn_seq);',
'            apex_json.write(''STORAGELOCATIONCODE'' , r.STORAGELOCATIONCODE);',
'            apex_json.write(''STORAGELOCATIONNAME'' , r.STORAGELOCATIONNAME);',
'            apex_json.write(''STOCKTNO''            , r.STOCKTNO);',
'            apex_json.write(''TRANSACTIONNO''       , r.TRANSACTIONNO);',
'            apex_json.write(''QUANTITY1''           , v_issue_qty);',
'            apex_json.write(''AMOUNT''              , ROUND(v_issue_qty * r.RATE,2));',
'            apex_json.write(''REMARK''              , r.REMARK);',
'            apex_json.write(''APEX_SESSION_ID''     , :APP_SESSION);',
'            apex_json.close_object;',
'            ',
'            v_required_qty := v_required_qty - v_issue_qty;',
'        END;',
'    END LOOP;',
'    apex_json.close_array;',
'    apex_json.close_object;',
'',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>36883069211967117
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58590984034942483)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Doc No'
,p_static_id=>'get-doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P181_Tno is null then',
'        Select GlobalTno.NextVal into :P181_Tno From Dual;',
'     end if;',
'    ----',
'    if :P181_STOCKJOURNALNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P181_LocationCode,',
'					:P181_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P181_STOCKJOURNALDATE, ''DD-MM-RRRR'')',
'				);',
'        :P181_STOCKJOURNALNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P181_LocationCode,',
'                    :P181_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P181_STOCKJOURNALDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>31643768078246803
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58591406887942484)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get on the table'
,p_static_id=>'get-on-the-table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P181_MODULEFLOW := ''YES'';',
'   else',
'       :P181_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P71_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P181_ONTHETABLE := ''YES'' ;',
'   else',
'       :P181_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>31644190931246804
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(26603894720119166)
,p_process_sequence=>120
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_SEQUENCE_VAL'
,p_static_id=>'get-sequence-val'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''sno'', GLOBALTNO.NEXTVAL);',
'    apex_json.close_object;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>4287238135214547
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58588932256942483)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_UNIT'
,p_static_id=>'get-unit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_unit item.measuringunitcode1%TYPE;',
'BEGIN',
'    SELECT measuringunitcode1 INTO v_unit FROM item WHERE itemcode = APEX_APPLICATION.G_X01;',
'    ',
'    apex_json.open_object;',
'    apex_json.write(''unit'', v_unit);',
'    apex_json.close_object;',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        apex_json.open_object;',
'        apex_json.write(''unit'', '''');',
'        apex_json.close_object;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>31641716300246803
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58592948703942484)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get  Voucher No'
,p_static_id=>'get-voucher-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
'',
'   select count(*) into tmp from voucher ',
'    where modulecode = ''STOCKJOURNAL''',
'      and ModuleTno = :P181_TNO;',
'',
'   if nvl(tmp,0) > 0 then',
'       SELECT TNO,VOUCHERNO INTO :P181_VOUCHERTNO,:P181_VOUCHERNO ',
'         FROM VOUCHER ',
'       where modulecode = ''STOCKJOURNAL''',
'      and ModuleTno = :P181_TNO;',
'',
'        :P181_ISREADONLY := 1;',
'    Else',
'        :P181_ISREADONLY := 0;',
'   end if;',
'  ',
' ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>31645732747246804
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58590525580942483)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetDocStatusActive'
,p_static_id=>'getdocstatusactive'
,p_process_sql_clob=>'setdocumentstatuscode(''STOCKJOURNAL'',:P181_TNO,''ACTIVE'');'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>31643309624246803
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58583996635942473)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(877474331562886052)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Kitting Unkitting'
,p_static_id=>'initialize-form-kitting-unkitting'
,p_internal_uid=>31636780679246793
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58590125509942483)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Pre Rendering Tno'
,p_static_id=>'pre-rendering-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    tTNo Number;',
'BEGIN',
'    IF :P181_TNO IS NULL THEN ',
'        SELECT GLOBALTNO.NEXTVAL INTO tTNo FROM DUAL;',
'        :P181_TNO := tTNo;',
'    END IF;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>31642909553246803
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58592515970942484)
,p_process_sequence=>90
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
,p_internal_uid=>31645300014246804
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58584373561942473)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(877474331562886052)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form kitting unkitting'
,p_static_id=>'process-form-kitting-unkitting'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'table_name', 'STOCKJOURNAL',
  'target_type', 'TABLE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>31637157605246793
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58564647263942464)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(877531625338355550)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Raw Stock Detail - Save Interactive Grid Data'
,p_static_id=>'raw-stock-detail-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'dml_plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    ',
    '    CASE :APEX$ROW_STATUS',
    '        WHEN ''C'' THEN -- Create (Insert) logic',
    '            INSERT INTO STOCKJOURNALRAWSTOCKDETAIL (',
    '                TNO, SNO, SN, STORAGELOCATIONCODE, STOCKTNO, ',
    '                QUANTITY1, REMARK, APEX_SESSION_ID',
    '            ) VALUES (',
    '                :TNO, :SNO, GlobalTNo.Nextval, :STORAGELOCATIONCODE, :STOCKTNO, ',
    '                :QUANTITY1,  :REMARK , :APEX_SESSION_ID',
    '            ) RETURNING ROWID INTO :ROWID; -- Rowid return',
    '',
    '        WHEN ''U'' THEN -- Update logic',
    '            UPDATE STOCKJOURNALRAWSTOCKDETAIL',
    '            SET STORAGELOCATIONCODE = :STORAGELOCATIONCODE,',
    '                STOCKTNO = :STOCKTNO,',
    '                QUANTITY1 = :QUANTITY1,',
    '                REMARK = :REMARK',
    '            WHERE ROWID = :ROWID; -- Update based on ROWID',
    '',
    '        WHEN ''D'' THEN -- Delete logic',
    '            DELETE FROM STOCKJOURNALRAWSTOCKDETAIL',
    '            WHERE ROWID = :ROWID;',
    '    END CASE;',
    'END;',
    '')),
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'target_type', 'PLSQL_CODE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>31617431307246784
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58555818007942459)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(877477252839886081)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Raw Stock - Save Interactive Grid Data'
,p_static_id=>'raw-stock-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into STOCKJOURNALRAW   (                 ',
'                    TNO,',
'                   SNO,',
'                   SERIALNO,',
'                   ITEMCODE,',
'                   DESCRIPTION,',
'                   QUANTITY1,',
'                   LOSSPERCENT,',
'                   LOSSQUANTITY1,',
'                   REMARK,',
'                   STORAGELOCATIONCODE,',
'                   FEEDTOKILN,',
'                   CREATOR,',
'                   DATEOFENTRY,',
'                   ITEMSPECIFICATIONCODE          ',
'            )',
'            Values (',
'                :P181_TNO                   ,',
'                :RAW_SNO                   ,',
'                :SERIALNO              ,',
'                :ITEMCODE           ,',
'                :DESCRIPTION             ,',
'                :QUANTITY1                  ,',
'                :LOSSPERCENT                ,',
'                :LOSSQUANTITY1          ,',
'                :REMARK           ,',
'                :STORAGELOCATIONCODE,',
'               :FEEDTOKILN,',
'               :CREATOR,',
'               :DATEOFENTRY ,',
'               :ITEMSPECIFICATIONCODE',
'',
'            );',
'        ',
'        when ''U'' then',
'            update STOCKJOURNALRAW  Set',
'                TNO = :P181_TNO,',
'                   SNO = :RAW_SNO,',
'                   SERIALNO = :SERIALNO,',
'                   ITEMCODE = :ITEMCODE,',
'                   DESCRIPTION   =:DESCRIPTION,',
'                   QUANTITY1  = :QUANTITY1,',
'                   LOSSPERCENT = :LOSSPERCENT,',
'                   LOSSQUANTITY1 = :LOSSQUANTITY1,',
'                   REMARK  = :REMARK,',
'                   STORAGELOCATIONCODE  = :STORAGELOCATIONCODE ,',
'                   FEEDTOKILN  = :FEEDTOKILN  ,',
'                   CREATOR  = :CREATOR  ,',
'                   DATEOFENTRY = :DATEOFENTRY     ,',
'                   ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE            ',
'            WHERE TNO = :P181_TNO;',
'',
'        when ''D'' then',
'            Delete From STOCKJOURNALRAW ',
'            Where TNo = :P181_TNO;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>31608602051246779
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58592156233942484)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P181_TNO, :P181_STOCKJOURNALNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(58528713321942433)
,p_internal_uid=>31644940277246804
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58589797374942483)
,p_process_sequence=>110
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P181_FORMSTATUS = ''NEWRECORD'' THEN',
'--raise_application_error(-20000,:GLOBAL_LOGINNAME||''-''||:GLOBAL_CompanyCode||''-''||GetModuleCodeForpageNo(:APP_PAGE_ID));',
'    select',
'    		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'    		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'    		--a.FreezeDate',
'            INTO :P181_ALLOWEDBACK,:P181_ALLOWEDFORWARD',
'    from Module a, ModulePrivilege b, BossUser c',
'    where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'    		and a.ModuleCode = b.ModuleCode',
'    		and b.BossUsercode = c.BossUserCode',
'    		and c.LoginName = :GLOBAL_LOGINNAME',
'    		and b.CompanyCode = :GLOBAL_CompanyCode',
'            ;',
'    :P181_ISREADONLY := 0;',
'else',
'    :P181_ALLOWEDBACK       := :P181_STOCKJOURNALDATE ; ',
'    :P181_ALLOWEDFORWARD    := :P181_STOCKJOURNALDATE ;',
'    ',
'    -- :P181_ISREADONLY := 0;',
' end if;',
'',
' '))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>31642581418246803
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58545607853942453)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(877534916164355583)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Stock Finished Details - Save Interactive Grid Data'
,p_static_id=>'stock-finished-details-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>31598391897246773
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(58539112605942449)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(877532973776355563)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Stock Finished - Save Interactive Grid Data'
,p_static_id=>'stock-finished-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into STOCKJOURNALFINISHED   (                 ',
'                    TNO,',
'                   SNO,',
'                   SERIALNO,',
'                   ITEMCODE,',
'                   DESCRIPTION,',
'                   QUANTITY1,',
'                   REMARK,',
'                   STORAGELOCATIONCODE,',
'                   CREATOR,',
'                   DATEOFENTRY,',
'                   MODULECODE,',
'                   MODULETNO,',
'                   RATE,',
'                   AMOUNT ,',
'                   ITEMSPECIFICATIONCODE',
'            )',
'            Values (',
'                :P181_TNO,',
'                :FIN_SNO,',
'                :SERIALNO,',
'                :ITEMCODE,',
'                :DESCRIPTION,',
'                :QUANTITY1,',
'                :REMARK,',
'                :STORAGELOCATIONCODE,',
'                :CREATOR,',
'                :DATEOFENTRY,',
'                :MODULECODE,',
'               :MODULETNO,',
'               :RATE,',
'               :AMOUNT ,',
'               :ITEMSPECIFICATIONCODE',
'',
'            );',
'        ',
'        when ''U'' then',
'            update STOCKJOURNALFINISHED  Set',
'                    TNO = :P181_TNO,',
'                   SNO = :FIN_SNO,',
'                   SERIALNO = :SERIALNO,',
'                   ITEMCODE = :ITEMCODE,',
'                   DESCRIPTION   =:DESCRIPTION,',
'                   QUANTITY1  = :QUANTITY1,                  ',
'                   REMARK  = :REMARK,',
'                   STORAGELOCATIONCODE  = :STORAGELOCATIONCODE , ',
'                   CREATOR  = :CREATOR  ,',
'                   DATEOFENTRY = :DATEOFENTRY  ,',
'                   MODULECODE = :MODULECODE ,',
'                   MODULETNO = :MODULETNO , ',
'                   RATE = :RATE ,',
'                   AMOUNT = :AMOUNT,',
'                   ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE',
'            WHERE TNO = :P181_TNO;',
'',
'        when ''D'' then',
'            Delete From STOCKJOURNALFINISHED ',
'            Where TNo = :P181_TNO;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>31591896649246769
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(63831885895662813)
,p_process_sequence=>130
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update the UsedStockStorageDetail Date on after submit'
,p_static_id=>'update-the-usedstockstoragedetail-date-on-after-submit'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Update UsedStockStorageDetail',
'Set UsedStockDate = :P181_STOCKJOURNALDATE',
'Where ModuleCode = ''STOCKJOURNAL''',
'  and ModuleTNo = :P181_TNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>36884669938967133
);
wwv_flow_imp.component_end;
end;
/
