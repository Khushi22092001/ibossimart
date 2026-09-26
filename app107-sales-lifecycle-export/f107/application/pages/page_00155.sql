prompt --application/pages/page_00155
begin
--   Manifest
--     PAGE: 00155
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
 p_id=>155
,p_name=>'Loading Advice'
,p_alias=>'LOADING-ADVICE'
,p_step_title=>'Loading Advice'
,p_warn_on_unsaved_changes=>'N'
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
'  var bireporturl = $(''#P155_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/LoadingAdvice1.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P155_TNO'').val() ',
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
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P155_BIREPORTURL'').val()',
'  var reportName =  ''LoadingAdvice1.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P155_TNO'').val() ',
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
'/* WORKFLOW_LAYOUT_HORIZONTAL_HEADER_SYNC_V1 */',
'(function () {',
'  function bindGrid(grid) {',
'    var body = grid.querySelector(''.a-GV-bdy'');',
'    var header = grid.querySelector(''.a-GV-w-hdr'');',
'    if (!body || !header || body.dataset.workflowHorizontalSync === ''Y'') { return; }',
'',
'    body.dataset.workflowHorizontalSync = ''Y'';',
'    header.scrollLeft = body.scrollLeft;',
'    body.addEventListener(''scroll'', function () {',
'      header.scrollLeft = body.scrollLeft;',
'    }, { passive: true });',
'  }',
'',
'  function bindAll() {',
'    Array.prototype.forEach.call(document.querySelectorAll(''.a-IG''), bindGrid);',
'  }',
'',
'  function scheduleBinding() { window.setTimeout(bindAll, 0); }',
'  if (document.readyState === ''loading'') {',
'    document.addEventListener(''DOMContentLoaded'', scheduleBinding, { once: true });',
'  } else {',
'    scheduleBinding();',
'  }',
'  document.addEventListener(''click'', scheduleBinding);',
'  new MutationObserver(scheduleBinding).observe(document.documentElement, {',
'    childList: true,',
'    subtree: true',
'  });',
'}());',
''))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(".only-numeric").bind("keypress", function (e) {',
'    var keyCode = e.which ? e.which : e.keyCode',
'',
'    if (!(keyCode >= 48 && keyCode <= 57)) {',
'        return false;',
'    }else{',
'        return true;',
'    }',
'});',
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important;',
'  ',
'}',
'',
'/* WORKFLOW_LAYOUT_STANDARD_GAP_V1 */',
'/* Keep a clear separation between the title card and tabs/report content. */',
'#tabcontainer,',
'#MYID {',
'  margin-top: 16px !important;',
'}',
'',
'',
'/* WORKFLOW_LAYOUT_HORIZONTAL_GRID_SCROLL_V1 */',
'/* Wide entry grids retain their horizontal track and do not show an inner',
'   vertical scrollbar. */',
'.a-IG .a-GV-bdy,',
'.a-IG .a-GV-scrollBody,',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: scroll !important;',
'  overflow-y: hidden !important;',
'}',
'',
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
 p_id=>wwv_flow_imp.id(613137644965359408)
,p_plug_name=>'Against Job Order'
,p_static_id=>'against-job-order'
,p_parent_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(613137492265359407)
,p_plug_name=>'Against Sales Order'
,p_static_id=>'against-sales-order'
,p_parent_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(908332155257388901)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1275712413072456407)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(613138033587359412)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_parent_plug_id=>wwv_flow_imp.id(613137092829359403)
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
 p_id=>wwv_flow_imp.id(613138090496359413)
,p_plug_name=>'Detail'
,p_static_id=>'detail-2'
,p_parent_plug_id=>wwv_flow_imp.id(613138033587359412)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       DESCRIPTION,',
'       QUANTITY1,',
'       QUANTITY2,',
'       REMARK,',
'       GetMeasuringUnitNameFromItem(ITEMCODE)AS UNIT1 ,',
'       GetMeasuringUnit2NameFromItem(ITEMCODE) AS UNIT2',
'  from LOADINGADVICEDETAIL',
'  where tno = :P155_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P155_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Detail'
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
 p_id=>wwv_flow_imp.id(613647620870100895)
,p_heading=>'Item Specification'
,p_static_id=>'item-specification'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(613647728413100896)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(613647826076100897)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(613139212205359424)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(613139256909359425)
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
 p_id=>wwv_flow_imp.id(613138825853359420)
,p_name=>'DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESCRIPTION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Description'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(613647620870100895)
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
 p_id=>wwv_flow_imp.id(613138588445359418)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(613647620870100895)
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
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.itemname , a.itemcode ',
'from item a',
'/*, purchaseorderdetail b',
'where a.itemcode = b.itemcode',
'and b.tno = :P155_PURCHASEORDERTNO/*',
'union all',
'select A.itemname,A.itemcode',
'from ITEM A, grndetail B',
'where B.tno = :P155_TNO*/',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'P155_PURCHASEORDERTNO'
,p_ajax_items_to_submit=>'P155_PURCHASEORDERTNO'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(613138689604359419)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(613647620870100895)
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
 p_id=>wwv_flow_imp.id(613138933825359421)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(613647728413100896)
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
 p_id=>wwv_flow_imp.id(613139006075359422)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(613647826076100897)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_item_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(613139137578359423)
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
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(613138320264359415)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>30
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(613138494551359417)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(613138362393359416)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'tno'
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
,p_default_type=>'ITEM'
,p_default_expression=>'P155_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(615688512073714230)
,p_name=>'UNIT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(613647728413100896)
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
 p_id=>wwv_flow_imp.id(615688558705714231)
,p_name=>'UNIT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UNIT2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(613647826076100897)
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(613138153123359414)
,p_internal_uid=>163271604040966526
,p_is_editable=>true
,p_edit_operations=>'u:d'
,p_lost_update_check_type=>'VALUES'
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
 p_id=>wwv_flow_imp.id(613605511268998749)
,p_interactive_grid_id=>wwv_flow_imp.id(613138153123359414)
,p_static_id=>'1637390'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(613605653033998752)
,p_report_id=>wwv_flow_imp.id(613605511268998749)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613606248647998765)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(613138320264359415)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613607143979998769)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(613138362393359416)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613607956923998782)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(613138494551359417)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613608906414998784)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(613138588445359418)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>205.861
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613609848515998786)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(613138689604359419)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>310.865
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613610683416998808)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(613138825853359420)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>137.882
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613611578779998810)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(613138933825359421)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95.01
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613612531033998812)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(613139006075359422)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87.997
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613613442091998814)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(613139137578359423)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(613615524861003929)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(613139212205359424)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(616522220836615293)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(615688512073714230)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>68.7465
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(616523108567615295)
,p_view_id=>wwv_flow_imp.id(613605653033998752)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(615688558705714231)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>71.76
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(613137155290359404)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(613415320330511296)
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
 p_id=>wwv_flow_imp.id(613415320330511296)
,p_plug_name=>'Loading Advice'
,p_static_id=>'loading-advice'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(613137092829359403)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
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
'       LOADINGADVICEDATE,',
'       LOADINGADVICENO,',
'       ISSUEDBYPARTYCODE,',
'       ISSUEDTOPARTYCODE,',
'       SOURCEPLACECODE,',
'       SUPPLIERCODE,',
'       PURCHASEORDERTNO,',
'       DESTINATIONPLACECODE,',
'       ISWAREHOUSE,',
'       ISPARTYLOCATION,',
'       SALESORDERTNO,',
'       JOBORDERTNO,',
'       FREIGHTTYPECODE,',
'       FREIGHTRATE,',
'       FREIGHTADVANCE,',
'       VEHICLENO,',
'       DRIVERMOBILENO,',
'       EWAYBILLNO,',
'       CREATOR,',
'       CREATIONTIME,',
'       freightunitcode,',
'       ewaybilldate,',
'       vehicletype,',
'       salesgrntno,',
'       DRIVERNAME,',
'       ISSUEDBYEMPLOYEECODE,',
'       SODELIVERYADDRESS,',
'       JODELIVERYADDRESS,',
'       freightchargedat,',
'       outwardfratno',
'  from LOADINGADVICE'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(613137303470359405)
,p_plug_name=>'Loading Location'
,p_static_id=>'loading-location'
,p_parent_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
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
 p_id=>wwv_flow_imp.id(613137092829359403)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(613137690052359409)
,p_plug_name=>'Transporting Info'
,p_static_id=>'transporting-info'
,p_parent_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(613137386088359406)
,p_plug_name=>'Unloading Location'
,p_static_id=>'unloading-location'
,p_parent_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(311617976202523304)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
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
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613455165193587820)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
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
 p_id=>wwv_flow_imp.id(613456292810587824)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P155_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613455563765587824)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
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
,p_button_condition=>'P155_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613457515519587825)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P155_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613457884079587825)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P155_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613647889157100898)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(613138090496359413)
,p_button_name=>'GetItem'
,p_static_id=>'getitem'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_button_position=>'PREVIOUS'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613457112375587825)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
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
,p_button_condition=>'P155_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613456740701587824)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P155_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(507103890429420697)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(613137303470359405)
,p_button_name=>'S'
,p_static_id=>'s'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'S'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613455942381587824)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P155_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(613458318975587825)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(908332155257388901)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P155_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P155_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(613434773015511363)
,p_branch_name=>'Go To Page 154'
,p_branch_action=>'f?p=&APP_ID.:154:&APP_SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(613455563765587824)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613137907466359411)
,p_name=>'P155_AGAINSTJOBORDER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(613137644965359408)
,p_item_default=>'NO'
,p_prompt=>'Against Job Order'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613137779490359410)
,p_name=>'P155_AGAINSTSALESORDER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(613137492265359407)
,p_item_default=>'NO'
,p_prompt=>'Against Sales Order'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(462745721032923809)
,p_name=>'P155_ALLOWEDBACK'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(462745995731928139)
,p_name=>'P155_ALLOWEDFORWARD'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1362105103639698391)
,p_name=>'P155_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1303486758423429999)
,p_name=>'P155_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_item_default=>'154'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(456535320315327956)
,p_name=>'P155_CALLEDFROMTNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613416117316511328)
,p_name=>'P155_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613425241872511348)
,p_name=>'P155_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613424755520511348)
,p_name=>'P155_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613648415798100903)
,p_name=>'P155_DELIVERYADDRESS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(613137492265359407)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Delivery Address'
,p_source=>'SODELIVERYADDRESS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>500
,p_grid_label_column_span=>4
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
 p_id=>wwv_flow_imp.id(613648555729100905)
,p_name=>'P155_DELIVERYADDRESS1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(613137644965359408)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Delivery Address'
,p_source=>'JODELIVERYADDRESS'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>500
,p_grid_label_column_span=>4
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
 p_id=>wwv_flow_imp.id(613420358108511346)
,p_name=>'P155_DESTINATIONPLACECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(613137386088359406)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Destination Place'
,p_source=>'DESTINATIONPLACECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT CITYNAME, CITYCODE FROM CITY ',
'WHERE getdocumentstatuscode(''CITY'',TNO) = ''ACTIVE''',
'ORDER BY 1',
'/*select LOCATIONNAME , LOCATIONCODE from LOCATION   ',
'where getdocumentstatuscode(''LOCATION'',TNO) = ''ACTIVE''',
'*/'))
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_label_column_span=>4
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
 p_id=>wwv_flow_imp.id(613417186691511344)
,p_name=>'P155_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(613137155290359404)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
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
'	and c.CompanyCode = :global_CompanyCode',
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
 p_id=>wwv_flow_imp.id(613423961198511347)
,p_name=>'P155_DRIVERMOBILENO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Driver Mobile No'
,p_source=>'DRIVERMOBILENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>43
,p_cMaxlength=>10
,p_tag_css_classes=>'only-numeric'
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEL',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469967932965257698)
,p_name=>'P155_DRIVERNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Driver Name'
,p_source=>'DRIVERNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(455397947098083588)
,p_name=>'P155_EWAYBILLDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'E Way Bill Date'
,p_source=>'EWAYBILLDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P155_LOADINGADVICEDATE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613424443230511348)
,p_name=>'P155_EWAYBILLNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'E Way Bill No'
,p_source=>'EWAYBILLNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(613416428742511344)
,p_name=>'P155_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1303486671944429998)
,p_name=>'P155_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P155_TNO is null then',
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
 p_id=>wwv_flow_imp.id(613423246828511347)
,p_name=>'P155_FREIGHTADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Freight Advance'
,p_source=>'FREIGHTADVANCE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
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
 p_id=>wwv_flow_imp.id(300823435414004439)
,p_name=>'P155_FREIGHTCHARGEDAT'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Freight Charged At'
,p_source=>'FREIGHTCHARGEDAT'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC:INBOUND;INBOUND,OUTBOUND;OUTBOUND'
,p_cSize=>32
,p_cMaxlength=>32
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
 p_id=>wwv_flow_imp.id(613422790885511347)
,p_name=>'P155_FREIGHTRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Freight Rate'
,p_source=>'FREIGHTRATE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>37
,p_cMaxlength=>255
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613422410913511347)
,p_name=>'P155_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Freight Type'
,p_source=>'FREIGHTTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select freighttypename , freighttypecode from freighttype    ',
'where getdocumentstatuscode(''FREIGHTTYPE'',TNO) = ''ACTIVE''',
''))
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
 p_id=>wwv_flow_imp.id(615687405288714219)
,p_name=>'P155_FREIGHTUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Freight Unit'
,p_source=>'FREIGHTUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select measuringunitname , measuringunitcode from measuringunit'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>32
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(613421227435511346)
,p_name=>'P155_ISPARTYLOCATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(613137386088359406)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_default=>'NO'
,p_prompt=>'Is Party Location'
,p_source=>'ISPARTYLOCATION'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(508643616234986650)
,p_name=>'P155_ISSUEDBYEMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(613137155290359404)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Issued By'
,p_source=>'ISSUEDBYEMPLOYEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select employeename, employeecode from employee order by 1'
,p_lov_display_null=>'YES'
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
 p_id=>wwv_flow_imp.id(613418379403511346)
,p_name=>'P155_ISSUEDBYPARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(613137155290359404)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_source=>'ISSUEDBYPARTYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613418846721511346)
,p_name=>'P155_ISSUEDTOPARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(613137155290359404)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Issued To'
,p_source=>'ISSUEDTOPARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P155_ISSUEDTO'
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
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613420755610511346)
,p_name=>'P155_ISWAREHOUSE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(613137386088359406)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_default=>'NO'
,p_prompt=>'Is Warehouse'
,p_source=>'ISWAREHOUSE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613422031297511347)
,p_name=>'P155_JOBORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(613137644965359408)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Job Order No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:179:&SESSION.::NO:RP,179:P179_TNO,P179_CALLEDFROMPAGE,P179_FORMSTATUS,P179_CALLEDFROMTNO:&P155_JOBORDERTNO.,155,CALLED,&P155_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'JOBORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P155_JOBORDER'
,p_lov_cascade_parent_items=>'P155_NAMEOFVENDOR'
,p_ajax_items_to_submit=>'P155_NAMEOFVENDOR,P155_JOBORDERTNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(613417642999511345)
,p_name=>'P155_LOADINGADVICEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(613137155290359404)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Loading Advice Date'
,p_source=>'LOADINGADVICEDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P155_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P155_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613417970518511345)
,p_name=>'P155_LOADINGADVICENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(613137155290359404)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Loading Advice No'
,p_source=>'LOADINGADVICENO'
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
 p_id=>wwv_flow_imp.id(613416813655511344)
,p_name=>'P155_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(613137155290359404)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
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
'	and c.ModuleCode = d.ModuleCode ',
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
 p_id=>wwv_flow_imp.id(1303482954627429961)
,p_name=>'P155_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613648270316100902)
,p_name=>'P155_NAMEOFCUSTOMER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(613137492265359407)
,p_item_default=>'select partycode from salesorder where tno = :P155_SALESORDERTNO'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Name Of Customer'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P155_NAMEOFCUSTOMER'
,p_cSize=>32
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613648525238100904)
,p_name=>'P155_NAMEOFVENDOR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(613137644965359408)
,p_item_default=>'select partycode from joborder where tno = :P155_JOBORDERTNO'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Name Of Vendor'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'155_NAMEOFVENDOR'
,p_cSize=>32
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(1302891175523158695)
,p_name=>'P155_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(222230364387236773)
,p_name=>'P155_OUTWARDFRATNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Freight Rate Approval No'
,p_source=>'OUTWARDFRATNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select outwardfrano , tno from outwardfra a',
'where a.salesordertno = :P155_SALESORDERTNO;',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P155_SALESORDERTNO'
,p_ajax_items_to_submit=>'P155_SALESORDERTNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(1277539693387805159)
,p_name=>'P155_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613419996030511346)
,p_name=>'P155_PURCHASEORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(613137303470359405)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Purchase Order No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:118:&SESSION.::NO:RP,118:P118_TNO,P118_CALLEDFROMPAGE,P118_FORMSTATUS,P118_CALLEDFROMTNO:&P155_PURCHASEORDERTNO.,155,CALLED,&P155_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'PURCHASEORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P155_PURCHASEORDER'
,p_lov_cascade_parent_items=>'P155_SUPPLIERCODE,P155_LOCATIONCODE,P155_DOCTYPECODE'
,p_ajax_items_to_submit=>'P155_LOCATIONCODE,P155_DOCTYPECODE,P155_PURCHASEORDERTNO,P155_ISSUEDBYPARTYCODE,P155_SUPPLIERCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
,p_grid_label_column_span=>4
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
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(465874142376470966)
,p_name=>'P155_SALESGRNTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(613137303470359405)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Sales GRN No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:184:&SESSION.::NO:RP,184:P184_TNO,P184_CALLEDFROMPAGE,P184_FORMSTATUS,P184_CALLEDFROMTNO:&P155_SALESGRNTNO.,155,CALLED,&P155_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'SALESGRNTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P118_SALESGRN'
,p_lov_cascade_parent_items=>'P155_LOCATIONCODE,P155_DOCTYPECODE,P155_ISSUEDBYPARTYCODE'
,p_ajax_items_to_submit=>'P155_LOCATIONCODE,P155_DOCTYPECODE,P155_SALESGRNTNO,P155_ISSUEDBYPARTYCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
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
 p_id=>wwv_flow_imp.id(613421555623511347)
,p_name=>'P155_SALESORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(613137492265359407)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Sales Order No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:171:&SESSION.::NO:RP,171:P171_TNO,P171_CALLEDFROMPAGE,P171_FORMSTATUS,P171_CALLEDFROMTNO:&P155_SALESORDERTNO.,155,CALLED,&P155_TNO."><span class="fa fa-magic"></span></a>',
'',
''))
,p_source=>'SALESORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P155_SALESORDER_1'
,p_lov_cascade_parent_items=>'P155_LOCATIONCODE,P155_DOCTYPECODE,P155_NAMEOFCUSTOMER'
,p_ajax_items_to_submit=>'P155_LOCATIONCODE,P155_DOCTYPECODE,P155_SALESORDERTNO,P155_NAMEOFCUSTOMER'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
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
  'width', '800')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613419223594511346)
,p_name=>'P155_SOURCEPLACECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(613137303470359405)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Source Place'
,p_source=>'SOURCEPLACECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CITYNAME , CITYCODE from CITY   ',
'where getdocumentstatuscode(''CITY'',TNO) = ''ACTIVE''',
''))
,p_cSize=>32
,p_cMaxlength=>30
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
 p_id=>wwv_flow_imp.id(767469463789877930)
,p_name=>'P155_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P155_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1277539529742805158)
,p_name=>'P155_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1275712413072456407)
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
 p_id=>wwv_flow_imp.id(613419581273511346)
,p_name=>'P155_SUPPLIERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(613137303470359405)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Supplier Name'
,p_source=>'SUPPLIERCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'155_SUPPLIER'
,p_lov_cascade_parent_items=>'P155_DOCTYPECODE'
,p_ajax_items_to_submit=>'P155_DOCTYPECODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'OFFICECITYCODE:P155_SOURCEPLACECODE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '700')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613415690428511314)
,p_name=>'P155_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(613423598915511347)
,p_name=>'P155_VEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Vehicle No'
,p_source=>'VEHICLENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_cMaxlength=>10
,p_begin_on_new_line=>'N'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'text_case', 'UPPER',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(463886152374407154)
,p_name=>'P155_VEHICLETYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(613137690052359409)
,p_item_source_plug_id=>wwv_flow_imp.id(613415320330511296)
,p_prompt=>'Vehicle Type'
,p_source=>'VEHICLETYPE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select VEHICLETYPENAME , VEHICLETYPECODE from vehicletype'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(511548683013868656)
,p_name=>'check mobile number'
,p_static_id=>'check-mobile-number'
,p_event_sequence=>349
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_DRIVERMOBILENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(511550147866868657)
,p_event_id=>wwv_flow_imp.id(511548683013868656)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_DRIVERMOBILENO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    IF LENGTH(:P155_DRIVERMOBILENO) = 10 AND TRANSLATE(:P155_DRIVERMOBILENO, ''0123456789'', ''XXXXXXXXXX'') IS NULL THEN',
    '        null;',
    '    ELSE',
    '         ',
    '',
    '        raise_application_error(-20000,''Incorrect Number'');',
    '    END IF;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(511549154703868657)
,p_event_id=>wwv_flow_imp.id(511548683013868656)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P155_DRIVERMOBILENO',
  'items_to_submit', 'P155_DRIVERMOBILENO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_item_value VARCHAR2(100); -- Change the size according to your item''s data type and size',
    'BEGIN',
    '    -- Get the value of the page item',
    '    SELECT :P155_DRIVERMOBILENO -- Replace P1_ITEM with the actual name of your page item',
    '    INTO v_item_value',
    '    FROM DUAL;',
    '',
    '    -- Check if the value contains any alphabet characters',
    '    IF REGEXP_LIKE(v_item_value, ''[[:alpha:]]'')  OR LENGTH(v_item_value) != 10 THEN',
    '        -- Raise an error',
    '        :P155_DRIVERMOBILENO := 0;',
    '        --RAISE_APPLICATION_ERROR(-20000, ''The value should not contain any alphabet characters or length should be 10.'');',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(511549631083868657)
,p_event_id=>wwv_flow_imp.id(511548683013868656)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-3'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '',
    '        RAISE_APPLICATION_ERROR(-20000, ''The value should not contain any alphabet characters or length should be 10.'');',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P155_DRIVERMOBILENO'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613651522749100934)
,p_name=>'Check Pending Qty'
,p_static_id=>'check-pending-qty'
,p_event_sequence=>118
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(613138090496359413)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513732358473077866)
,p_event_id=>wwv_flow_imp.id(613651522749100934)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Against JO'
,p_static_id=>'against-jo'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,P155_TNO,P155_JOBORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number;',
    '    tmp1 number;',
    'begin',
    '    if :P155_JOBORDERTNO is not null then',
    '',
    '    if :P155_FORMSTATUS = ''NEWRECORD'' then',
    '        tmp := GETPENDINGJOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P155_JOBORDERTNO);',
    '        ',
    '        if :QUANTITY1 > tmp then',
    '        :QUANTITY1 := 0;',
    '            --raise_application_error(-20000,''Quantity1 cannot be greater than Job Order Quantity1.'');',
    '        end if;',
    '    else',
    '         tmp := GETPENDINGJOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P155_JOBORDERTNO);',
    '',
    '        select sum(quantity1) into tmp1 from loadingadvice a , loadingadvicedetail b ',
    '        where a.tno = b.tno ',
    '        and a.jobordertno = :P155_JOBORDERTNO',
    '        and b.itemcode = :ITEMCODE',
    '        and b.ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '        ',
    '        if :QUANTITY1 > tmp-tmp1 then',
    '            :QUANTITY1 := 0;',
    '            --raise_application_error(-20000,''Quantity1 cannot be greater than Job Order Quantity1.'');',
    '        end if;',
    '',
    '    end if;',
    '    end if;',
    '    exception when others then',
    '        null;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513731317454077856)
,p_event_id=>wwv_flow_imp.id(613651522749100934)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Against PO'
,p_static_id=>'against-po'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,P155_PURCHASEORDERTNO,QUANTITY1,P155_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number;',
    '    tmp1 number;',
    '    tmp2 number;',
    'begin',
    '    if :P155_FORMSTATUS in (''NEWRECORD'') then',
    '        tmp := GETPENDINGPOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P155_PURCHASEORDERTNO);',
    '        ',
    '        if :QUANTITY1 > tmp then',
    '           -- raise_application_error(-20000,''Quantity1 cannot be greater than Purchase Order Quantity1.'');',
    '           :QUANTITY1 :=0;',
    '        end if;',
    '    else',
    '         tmp := GETPENDINGPOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P155_PURCHASEORDERTNO);',
    '',
    '         select sum(quantity1) into tmp1 from loadingadvice a , loadingadvicedetail b ',
    '        where a.tno = b.tno ',
    '        and a.PURCHASEORDERTNO = :P155_PURCHASEORDERTNO',
    '        and b.itemcode = :ITEMCODE',
    '        and b.ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '',
    '        select sum(quantity1) into tmp2 from materialin a , materialindetail b ',
    '        where a.tno = b.tno ',
    '        and a.PURCHASEORDERTNO = :P155_PURCHASEORDERTNO',
    '        and b.itemcode = :ITEMCODE',
    '        and b.ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
    '        ',
    '        if :QUANTITY1 > tmp-tmp1-tmp2 then',
    '           -- raise_application_error(-20000,''Quantity1 cannot be greater than Purchase Order Quantity1.'');',
    '           :QUANTITY1 :=0;',
    '        end if;',
    '',
    '    end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(308390386505642012)
,p_event_id=>wwv_flow_imp.id(613651522749100934)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Against PO'
,p_static_id=>'against-po-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'P155_PURCHASEORDERTNO,ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'tmp number;',
    '',
    'begin',
    '',
    'select ',
    '               ',
    '                GETPENDINGPOQUANTITY1(a.itemcode,a.ITEMSPECIFICATIONCODE,:P155_PURCHASEORDERTNO) ',
    '                 + ( GETPENDINGPOQUANTITY1(a.itemcode,a.ITEMSPECIFICATIONCODE,:P155_PURCHASEORDERTNO)*(a.HIGHERTOLERANCEPERCENT/100))',
    '                -  nvl(d.quantity1,0)  - NVL(c.quantity1,0) into tmp',
    '            from PurchaseOrderDetail a ',
    '            ,',
    '             ( SELECT BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE,',
    '                      SUM(CC.QUANTITY1) QUANTITY1, ',
    '                      SUM(CC.QUANTITY2) QUANTITY2',
    '             FROM loadingadvice Bb , loadingadvicedetail Cc',
    '             WHERE BB.TNO = CC.TNO',
    '             And Not Exists',
    '                  (Select 1',
    '                     From materialin xx',
    '                    Where xx.loadingadvicetno = bb.tno) AND Not Exists',
    '                  (Select 1 From grn xx Where xx.loadingadvicetno = bb.tno)',
    '             GROUP BY BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE',
    '             ) C ,',
    '              ( SELECT BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE,',
    '                      SUM(CC.QUANTITY1) QUANTITY1, ',
    '                      SUM(CC.QUANTITY2) QUANTITY2',
    '             FROM materialin Bb , materialindetail Cc',
    '             WHERE BB.TNO = CC.TNO',
    '             And Not Exists',
    '           (Select 1 From grn xx Where xx.materialintno = bb.tno)',
    '             GROUP BY BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE',
    '             ) D',
    '            where a.tno = :P155_PURCHASEORDERTNO',
    '            and a.tno = C.purchaseordertno(+)',
    '            and a.itemcode = c.itemcode(+)',
    '            and a.itemspecificationcode = c.itemspecificationcode(+)',
    '            and a.tno = D.purchaseordertno(+)',
    '            and a.itemcode = D.itemcode(+)',
    '            and a.itemspecificationcode = D.itemspecificationcode(+)',
    '            --and a.quantity1 - nvl(c.quantity1,0)- nvl(d.quantity1,0) > 0',
    '            and GETPENDINGPOQUANTITY1(a.itemcode,a.ITEMSPECIFICATIONCODE,:P155_PURCHASEORDERTNO) -  nvl(d.quantity1,0)  - NVL(c.quantity1,0) > 0',
    '            and a.itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '          ',
    '            and a.itemcode = :itemcode',
    '            and a.itemspecificationcode = :itemspecificationcode;',
    '            ',
    '    if :quantity1 > tmp then',
    '      :QUANTITY1 := 0;',
    '    end if;',
    '    exception when others then',
    '        null;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513732179259077865)
,p_event_id=>wwv_flow_imp.id(613651522749100934)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Against SO'
,p_static_id=>'against-so'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1,P155_TNO,P155_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number;',
    '    tmp1 number;',
    'begin',
    '    if :P155_SALESORDERTNO is not null then',
    '',
    '    if :P155_FORMSTATUS in (''NEWRECORD'') then',
    '        tmp := GETPENDINGSOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P155_SALESORDERTNO);',
    '        ',
    '        if :QUANTITY1 > tmp then',
    '            :QUANTITY1 := 0;',
    '            --raise_application_error(-20000,''Quantity1 cannot be greater than Sales Order Quantity1.'');',
    '        end if;',
    '    else',
    '         tmp := GETPENDINGSOQUANTITY1(:ITEMCODE,:ITEMSPECIFICATIONCODE,:P155_SALESORDERTNO);',
    '',
    '        select sum(quantity1) into tmp1 from loadingadvice a , loadingadvicedetail b ',
    '        where a.tno = b.tno ',
    '        and a.SALESORDERTNO = :P155_SALESORDERTNO',
    '        and b.itemcode = :ITEMCODE',
    '        and b.ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE',
    '        ;',
    '        ',
    '        if :QUANTITY1 > tmp-tmp1  then',
    '        :QUANTITY1 := 0;',
    '            --raise_application_error(-20000,''Quantity1 cannot be greater than sales Order Quantity1.'');',
    '        end if;',
    '',
    '    end if;',
    '    end if;',
    '    exception when others then',
    '        null;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513731469026077857)
,p_event_id=>wwv_flow_imp.id(613651522749100934)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', 'raise_application_error(-20000 , ''Quantity Mismatch With Reference.'');',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'QUANTITY1'
,p_client_condition_expression=>'.000'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(513731483871077858)
,p_name=>'check vehicle number'
,p_static_id=>'check-vehicle-number'
,p_event_sequence=>359
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_VEHICLENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513731754262077860)
,p_event_id=>wwv_flow_imp.id(513731483871077858)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P155_VEHICLENO',
  'items_to_submit', 'P155_VEHICLENO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_item_value VARCHAR2(100); -- Change the size according to your item''s data type and size',
    'BEGIN',
    '    -- Get the value of the page item',
    '    SELECT :P155_VEHICLENO -- Replace P1_ITEM with the actual name of your page item',
    '    INTO v_item_value',
    '    FROM DUAL;',
    '',
    '    -- Check if the value contains any alphabet characters',
    '    IF  LENGTH(v_item_value) != 10 THEN',
    '        -- Raise an error',
    '        :P155_VEHICLENO := 0;',
    '        --RAISE_APPLICATION_ERROR(-20000, ''The value should not contain any alphabet characters or length should be more than 10.'');',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(513731847335077861)
,p_event_id=>wwv_flow_imp.id(513731483871077858)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '',
    '        RAISE_APPLICATION_ERROR(-20000, ''The value should not contain any alphabet characters or length should be 10.'');',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P155_VEHICLENO'
,p_client_condition_expression=>'0'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(503120051760712354)
,p_name=>'delete unsave data'
,p_static_id=>'delete-unsave-data'
,p_event_sequence=>319
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(503120138881712355)
,p_event_id=>wwv_flow_imp.id(503120051760712354)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from loadingadvicedetail a',
    '    where not exists (',
    '        select 1 from loadingadvice  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P155_TNO;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613467226151599135)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613455165193587820)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(466578902291892097)
,p_event_id=>wwv_flow_imp.id(613467226151599135)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P155_TNO);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613467640178599135)
,p_event_id=>wwv_flow_imp.id(613467226151599135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from loadingadvicedetail a',
    '    where not exists (',
    '        select 1 from loadingadvice  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P155_TNO;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613468382700601355)
,p_event_id=>wwv_flow_imp.id(613467226151599135)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P155_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P155_CALLEDFROMTNO'').getValue();',
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
 p_id=>wwv_flow_imp.id(613470645150608935)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613471467444608935)
,p_event_id=>wwv_flow_imp.id(613470645150608935)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455563765587824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613472022048608936)
,p_event_id=>wwv_flow_imp.id(613470645150608935)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455563765587824)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P155_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(614018064540146291)
,p_event_id=>wwv_flow_imp.id(613470645150608935)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455563765587824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from materialin a',
'where a.loadingadvicetno = :P155_TNO;',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460053738393653355)
,p_event_id=>wwv_flow_imp.id(613470645150608935)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455563765587824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from grn a',
'where a.loadingadvicetno = :P155_TNO;',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613470986213608935)
,p_event_id=>wwv_flow_imp.id(613470645150608935)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455563765587824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(465874446092470969)
,p_name=>'Disable/Enable Sales Grn Field'
,p_static_id=>'disable-enable-sales-grn-field'
,p_event_sequence=>299
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_DOCTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(465874541908470970)
,p_event_id=>wwv_flow_imp.id(465874446092470969)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_SALESGRNTNO'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P155_DOCTYPECODE'
,p_client_condition_expression=>'SALERETURN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(465874598439470971)
,p_event_id=>wwv_flow_imp.id(465874446092470969)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_SALESGRNTNO'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P155_DOCTYPECODE'
,p_client_condition_expression=>'SALERETURN'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(509303156256059566)
,p_name=>'disable getitem button'
,p_static_id=>'disable-getitem-button'
,p_event_sequence=>339
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(509303221756059567)
,p_event_id=>wwv_flow_imp.id(509303156256059566)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613647889157100898)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from materialin',
'where LOADINGADVICETNO = :P155_TNO'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613139857578359431)
,p_name=>'Disable Job Order No'
,p_static_id=>'disable-job-order-no'
,p_event_sequence=>149
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_AGAINSTSALESORDER'
,p_condition_element=>'P155_AGAINSTSALESORDER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'YES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613140011322359432)
,p_event_id=>wwv_flow_imp.id(613139857578359431)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_JOBORDERTNO,P155_NAMEOFVENDOR,P155_DELIVERYADDRESS1'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613475517279611913)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613476437428611916)
,p_event_id=>wwv_flow_imp.id(613475517279611913)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613456740701587824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613475909021611915)
,p_event_id=>wwv_flow_imp.id(613475517279611913)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613456740701587824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613648934534100908)
,p_name=>'Disable Sales and Job Order Fields'
,p_static_id=>'disable-sales-and-job-order-fields'
,p_event_sequence=>219
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_ISWAREHOUSE'
,p_condition_element=>'P155_ISWAREHOUSE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'YES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613649244322100911)
,p_event_id=>wwv_flow_imp.id(613648934534100908)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Disable Is Party'
,p_static_id=>'disable-is-party'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_ISPARTYLOCATION'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613648985073100909)
,p_event_id=>wwv_flow_imp.id(613648934534100908)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Disable Job Order'
,p_static_id=>'disable-job-order'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_JOBORDERTNO,P155_NAMEOFVENDOR,P155_DELIVERYADDRESS1'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613649118886100910)
,p_event_id=>wwv_flow_imp.id(613648934534100908)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Disable Sales Order'
,p_static_id=>'disable-sales-order'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_SALESORDERTNO,P155_NAMEOFCUSTOMER,P155_DELIVERYADDRESS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613649873001100918)
,p_event_id=>wwv_flow_imp.id(613648934534100908)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.item(''P155_ISPARTYLOCATION'').disable(true);')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613140304547359435)
,p_name=>'Disable sales order no'
,p_static_id=>'disable-sales-order-no'
,p_event_sequence=>179
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_AGAINSTJOBORDER'
,p_condition_element=>'P155_AGAINSTJOBORDER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'YES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613140418932359436)
,p_event_id=>wwv_flow_imp.id(613140304547359435)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_SALESORDERTNO,P155_NAMEOFCUSTOMER,P155_DELIVERYADDRESS'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613472421130609886)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613473302572609886)
,p_event_id=>wwv_flow_imp.id(613472421130609886)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455942381587824)
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
 p_id=>wwv_flow_imp.id(613472843366609886)
,p_event_id=>wwv_flow_imp.id(613472421130609886)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455942381587824)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P155_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(614018017346146290)
,p_event_id=>wwv_flow_imp.id(613472421130609886)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455942381587824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from materialin a',
'where a.loadingadvicetno = :P155_TNO;',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(460053803013653356)
,p_event_id=>wwv_flow_imp.id(613472421130609886)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455942381587824)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 from grn a',
'where a.loadingadvicetno = :P155_TNO;',
''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613473847630609886)
,p_event_id=>wwv_flow_imp.id(613472421130609886)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613455942381587824)
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
 p_id=>wwv_flow_imp.id(613474153511610990)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613475051799610991)
,p_event_id=>wwv_flow_imp.id(613474153511610990)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613458318975587825)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613474585846610990)
,p_event_id=>wwv_flow_imp.id(613474153511610990)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613458318975587825)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613463389596596702)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613458318975587825)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613466307600596708)
,p_event_id=>wwv_flow_imp.id(613463389596596702)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613458318975587825)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P155_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613465751798596708)
,p_event_id=>wwv_flow_imp.id(613463389596596702)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613458318975587825)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P155_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613464292916596703)
,p_event_id=>wwv_flow_imp.id(613463389596596702)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_TNO,P155_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P155_TNO,:P155_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613464828140596707)
,p_event_id=>wwv_flow_imp.id(613463389596596702)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P155_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613466793670596708)
,p_event_id=>wwv_flow_imp.id(613463389596596702)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613465289257596707)
,p_event_id=>wwv_flow_imp.id(613463389596596702)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(908332155257388901)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613463810464596703)
,p_event_id=>wwv_flow_imp.id(613463389596596702)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613646967053100889)
,p_name=>'Enable Both'
,p_static_id=>'enable-both'
,p_event_sequence=>169
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_AGAINSTSALESORDER'
,p_condition_element=>'P155_AGAINSTSALESORDER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'NO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613647052516100890)
,p_event_id=>wwv_flow_imp.id(613646967053100889)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_SALESORDERTNO,P155_NAMEOFCUSTOMER,P155_DELIVERYADDRESS,P155_AGAINSTSALESORDER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613647198235100891)
,p_event_id=>wwv_flow_imp.id(613646967053100889)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable-2'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_JOBORDERTNO,P155_NAMEOFVENDOR,P155_DELIVERYADDRESS1,P155_AGAINSTJOBORDER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613647298386100892)
,p_name=>'Enable Both1'
,p_static_id=>'enable-both-2'
,p_event_sequence=>199
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_AGAINSTJOBORDER'
,p_condition_element=>'P155_AGAINSTJOBORDER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'NO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613647448702100893)
,p_event_id=>wwv_flow_imp.id(613647298386100892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_JOBORDERTNO,P155_NAMEOFVENDOR,P155_DELIVERYADDRESS1,P155_AGAINSTJOBORDER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613647507285100894)
,p_event_id=>wwv_flow_imp.id(613647298386100892)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable-2'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_SALESORDERTNO,P155_NAMEOFCUSTOMER,P155_DELIVERYADDRESS,P155_AGAINSTSALESORDER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613468809894603837)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613469208948603837)
,p_event_id=>wwv_flow_imp.id(613468809894603837)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613457112375587825)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P155_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613469669614603837)
,p_event_id=>wwv_flow_imp.id(613468809894603837)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613457515519587825)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P155_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613470230862603837)
,p_event_id=>wwv_flow_imp.id(613468809894603837)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613457884079587825)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P155_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(42970970397425892)
,p_name=>'Enable Get Item when PO Change'
,p_static_id=>'enable-get-item-when-po-change'
,p_event_sequence=>409
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_PURCHASEORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42971018321425893)
,p_event_id=>wwv_flow_imp.id(42970970397425892)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613647889157100898)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613140542354359437)
,p_name=>'Enable Job order no_1'
,p_static_id=>'enable-job-order-no'
,p_event_sequence=>189
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_AGAINSTJOBORDER'
,p_condition_element=>'P155_AGAINSTJOBORDER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'YES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613140587058359438)
,p_event_id=>wwv_flow_imp.id(613140542354359437)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_JOBORDERTNO,P155_NAMEOFVENDOR,P155_DELIVERYADDRESS1,P155_AGAINSTJOBORDER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613649290001100912)
,p_name=>'Enable Sales and Job Order Fields'
,p_static_id=>'enable-sales-and-job-order-fields'
,p_event_sequence=>229
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_ISWAREHOUSE'
,p_condition_element=>'P155_ISWAREHOUSE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'NO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613649562225100915)
,p_event_id=>wwv_flow_imp.id(613649290001100912)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'Enable Is Party'
,p_static_id=>'enable-is-party'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_ISPARTYLOCATION'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613649378248100913)
,p_event_id=>wwv_flow_imp.id(613649290001100912)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Enable Job Order'
,p_static_id=>'enable-job-order'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_JOBORDERTNO,P155_NAMEOFVENDOR,P155_DELIVERYADDRESS1,P155_AGAINSTJOBORDER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613649481210100914)
,p_event_id=>wwv_flow_imp.id(613649290001100912)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Enable Sales Order'
,p_static_id=>'enable-sales-order'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_SALESORDERTNO,P155_NAMEOFCUSTOMER,P155_DELIVERYADDRESS,P155_AGAINSTSALESORDER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613140088212359433)
,p_name=>'Enable Sales Order No'
,p_static_id=>'enable-sales-order-no'
,p_event_sequence=>159
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_AGAINSTSALESORDER'
,p_condition_element=>'P155_AGAINSTSALESORDER'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'YES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613140219098359434)
,p_event_id=>wwv_flow_imp.id(613140088212359433)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_SALESORDERTNO,P155_NAMEOFCUSTOMER,P155_DELIVERYADDRESS,P155_AGAINSTSALESORDER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613461557681595207)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613457515519587825)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613462477497595211)
,p_event_id=>wwv_flow_imp.id(613461557681595207)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_TNO,P155_COMPANYCODE,P155_PURCHASEORDERNO',
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
 p_id=>wwv_flow_imp.id(613462953570595211)
,p_event_id=>wwv_flow_imp.id(613461557681595207)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(908332155257388901)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613462026078595209)
,p_event_id=>wwv_flow_imp.id(613461557681595207)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(587434898314685429)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>239
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613456740701587824)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(587435014385685430)
,p_event_id=>wwv_flow_imp.id(587434898314685429)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(456546469137366120)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>289
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(456546870352366120)
,p_event_id=>wwv_flow_imp.id(456546469137366120)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613139467715359427)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>110
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(613138090496359413)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613139639301359428)
,p_event_id=>wwv_flow_imp.id(613139467715359427)
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
 p_id=>wwv_flow_imp.id(613647979194100899)
,p_name=>'Insert Detail against PO'
,p_static_id=>'insert-detail-against-po'
,p_event_sequence=>209
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613647889157100898)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(69140873136651281)
,p_event_id=>wwv_flow_imp.id(613647979194100899)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Insert With Order by SNO Clause'
,p_static_id=>'insert-with-order-by-sno-clause'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_TNO,P155_PURCHASEORDERTNO,P155_SALESORDERTNO,P155_LOADINGADVICEDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    IF :P155_PURCHASEORDERTNO IS NOT NULL AND :P155_SALESORDERTNO IS NULL THEN',
    '        DELETE FROM loadingadvicedetail WHERE tno = :P155_TNO;',
    '        ',
    '        INSERT INTO loadingadvicedetail (',
    '            TNO,',
    '            SNO,',
    '            ITEMCODE,',
    '            ITEMSPECIFICATIONCODE,',
    '            DESCRIPTION,',
    '            QUANTITY1,',
    '            QUANTITY2',
    '        )',
    '        SELECT ',
    '            :P155_TNO,',
    '            globaltno.nextval, ',
    '            src.ITEMCODE,',
    '            src.ITEMSPECIFICATIONCODE,',
    '            src.DESCRIPTION,',
    '            src.PENDING_QTY1,',
    '            src.PENDING_QTY2',
    '        FROM (',
    '            SELECT ',
    '                a.itemcode,',
    '                a.ITEMSPECIFICATIONCODE,',
    '                a.DESCRIPTION,',
    '                (GETPENDINGPOQUANTITY1(a.itemcode, a.ITEMSPECIFICATIONCODE, :P155_PURCHASEORDERTNO, :P155_LOADINGADVICEDATE) - NVL(d.quantity1, 0) - NVL(c.quantity1, 0)) AS PENDING_QTY1,',
    '                (GETPENDINGPOQUANTITY2(a.itemcode, a.ITEMSPECIFICATIONCODE, :P155_PURCHASEORDERTNO) - NVL(d.quantity2, 0) - NVL(c.quantity2, 0)) AS PENDING_QTY2',
    '            FROM PurchaseOrderDetail a',
    '            LEFT JOIN (',
    '                SELECT ',
    '                    BB.PURCHASEORDERTNO,',
    '                    CC.ITEMCODE,',
    '                    CC.ITEMSPECIFICATIONCODE,',
    '                    SUM(CC.QUANTITY1) AS QUANTITY1, ',
    '                    SUM(CC.QUANTITY2) AS QUANTITY2',
    '                FROM loadingadvice Bb',
    '                JOIN loadingadvicedetail Cc ON BB.TNO = CC.TNO',
    '                WHERE NOT EXISTS (SELECT 1 FROM materialin xx WHERE xx.loadingadvicetno = bb.tno)',
    '                  AND NOT EXISTS (SELECT 1 FROM grn xx WHERE xx.loadingadvicetno = bb.tno)',
    '                GROUP BY BB.PURCHASEORDERTNO, CC.ITEMCODE, CC.ITEMSPECIFICATIONCODE',
    '            ) C ON a.tno = C.purchaseordertno AND a.itemcode = c.itemcode AND a.itemspecificationcode = c.itemspecificationcode',
    '            LEFT JOIN (',
    '                SELECT ',
    '                    BB.PURCHASEORDERTNO,',
    '                    CC.ITEMCODE,',
    '                    CC.ITEMSPECIFICATIONCODE,',
    '                    SUM(CC.QUANTITY1) AS QUANTITY1, ',
    '                    SUM(CC.QUANTITY2) AS QUANTITY2',
    '                FROM materialin Bb',
    '                JOIN materialindetail Cc ON BB.TNO = CC.TNO',
    '                WHERE NOT EXISTS (SELECT 1 FROM grn xx WHERE xx.materialintno = bb.tno)',
    '                GROUP BY BB.PURCHASEORDERTNO, CC.ITEMCODE, CC.ITEMSPECIFICATIONCODE',
    '            ) D ON a.tno = D.purchaseordertno AND a.itemcode = D.itemcode AND a.itemspecificationcode = D.itemspecificationcode',
    '            WHERE a.tno = :P155_PURCHASEORDERTNO',
    '              AND (GETPENDINGPOQUANTITY1(a.itemcode, a.ITEMSPECIFICATIONCODE, :P155_PURCHASEORDERTNO, :P155_LOADINGADVICEDATE) - NVL(d.quantity1, 0) - NVL(c.quantity1, 0)) > 0',
    '              AND a.itemcode NOT IN (SELECT itemcode FROM item WHERE itemnaturecode = ''SERVICES'')',
    '            ORDER BY a.SNO ',
    '        ) src;',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P155_FORMSTATUS'
,p_server_condition_expr2=>'NEWRECORD'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(42970746891425890)
,p_event_id=>wwv_flow_imp.id(613647979194100899)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(613647889157100898)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613648075502100900)
,p_event_id=>wwv_flow_imp.id(613647979194100899)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_TNO,P155_PURCHASEORDERTNO,P155_SALESORDERTNO,P155_LOADINGADVICEDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    if :P155_PURCHASEORDERTNO is not null and :P155_SALESORDERTNO is null then',
    '    delete from loadingadvicedetail where tno = :P155_TNO;',
    '        insert into loadingadvicedetail',
    '        (',
    '            TNO,',
    '            SNO,',
    '            ITEMCODE,',
    '            ITEMSPECIFICATIONCODE,',
    '            DESCRIPTION,',
    '            QUANTITY1,',
    '            QUANTITY2',
    '            ',
    '        )',
    '        (',
    '            select ',
    '                :P155_TNO,',
    '                globaltno.nextval,',
    '                a.itemcode,',
    '                a.ITEMSPECIFICATIONCODE,',
    '                a.DESCRIPTION,',
    '                GETPENDINGPOQUANTITY1(a.itemcode,a.ITEMSPECIFICATIONCODE,:P155_PURCHASEORDERTNO,:P155_LOADINGADVICEDATE) -  nvl(d.quantity1,0)  - NVL(c.quantity1,0),',
    '                GETPENDINGPOQUANTITY2(a.itemcode,a.ITEMSPECIFICATIONCODE,:P155_PURCHASEORDERTNO) - nvl(d.quantity2,0)  - NVL(c.quantity2,0)',
    '                -- below code running',
    '                --a.quantity1 -  nvl(e.quantity1,0)  - nvl(d.quantity1,0)  - NVL(c.quantity1,0),',
    '                --a.QUANTITY2 - nvl(e.quantity2,0)  - nvl(d.quantity2,0)  - NVL(c.quantity2,0)',
    '            from PurchaseOrderDetail a ',
    '            ,',
    '             ( SELECT BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE,',
    '                      SUM(CC.QUANTITY1) QUANTITY1, ',
    '                      SUM(CC.QUANTITY2) QUANTITY2',
    '             FROM loadingadvice Bb , loadingadvicedetail Cc',
    '             WHERE BB.TNO = CC.TNO',
    '             And Not Exists',
    '                  (Select 1',
    '                     From materialin xx',
    '                    Where xx.loadingadvicetno = bb.tno) AND Not Exists',
    '                  (Select 1 From grn xx Where xx.loadingadvicetno = bb.tno)',
    '             GROUP BY BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE',
    '             ) C ,',
    '              ( SELECT BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE,',
    '                      SUM(CC.QUANTITY1) QUANTITY1, ',
    '                      SUM(CC.QUANTITY2) QUANTITY2',
    '             FROM materialin Bb , materialindetail Cc',
    '             WHERE BB.TNO = CC.TNO',
    '             And Not Exists',
    '           (Select 1 From grn xx Where xx.materialintno = bb.tno)',
    '             GROUP BY BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE',
    '             ) D /*,',
    '              ( SELECT BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE,',
    '                      SUM(CC.receivedQUANTITY1) QUANTITY1, ',
    '                      SUM(CC.receivedQUANTITY2) QUANTITY2',
    '             FROM grn Bb , grndetail Cc',
    '             WHERE BB.TNO = CC.TNO',
    '             GROUP BY BB.PURCHASEORDERTNO,',
    '                      CC.ITEMCODE,',
    '                      CC.ITEMSPECIFICATIONCODE',
    '             ) e',
    '            */',
    '            where a.tno = :P155_PURCHASEORDERTNO',
    '            and a.tno = C.purchaseordertno(+)',
    '            and a.itemcode = c.itemcode(+)',
    '            and a.itemspecificationcode = c.itemspecificationcode(+)',
    '            and a.tno = D.purchaseordertno(+)',
    '            and a.itemcode = D.itemcode(+)',
    '            and a.itemspecificationcode = D.itemspecificationcode(+)',
    '            --and a.quantity1 - nvl(c.quantity1,0)- nvl(d.quantity1,0) > 0',
    '            and GETPENDINGPOQUANTITY1(a.itemcode,a.ITEMSPECIFICATIONCODE,:P155_PURCHASEORDERTNO , :P155_LOADINGADVICEDATE) -  nvl(d.quantity1,0)  - NVL(c.quantity1,0) > 0',
    '            and a.itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '           /* and a.tno = e.purchaseordertno(+)',
    '            and a.itemcode = e.itemcode(+)',
    '            and a.itemspecificationcode = e.itemspecificationcode(+)',
    '            */',
    '        );',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613648246172100901)
,p_event_id=>wwv_flow_imp.id(613647979194100899)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(613138090496359413)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(465874243057470967)
,p_name=>'Insert detail against Sales GRN'
,p_static_id=>'insert-detail-against-sales-grn'
,p_event_sequence=>279
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613647889157100898)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(465874337008470968)
,p_event_id=>wwv_flow_imp.id(465874243057470967)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_SALESORDERTNO,P155_TNO,P155_SALESGRNTNO,P155_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    if :P155_SALESGRNTNO is not null and :P155_DOCTYPECODE = ''SALERETURN'' then',
    '    delete from loadingadvicedetail where tno = :P155_TNO;',
    '        insert into loadingadvicedetail',
    '        (',
    '            TNO,',
    '            SNO,',
    '            ITEMCODE,',
    '            ITEMSPECIFICATIONCODE,',
    '            DESCRIPTION,',
    '            QUANTITY1,',
    '            QUANTITY2',
    '            ',
    '        )',
    '        (',
    '            select ',
    '                :P155_TNO,',
    '                globaltno.nextval,',
    '                itemcode,',
    '                ITEMSPECIFICATIONCODE,',
    '                DESCRIPTION,',
    '                REJECTEDQUANTITY1,',
    '                REJECTEDQUANTITY2',
    '            from salesgrndetail',
    '            where tno = :P155_SALESGRNTNO',
    '            and REJECTEDQUANTITY1 > 0',
    '            and itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '        );',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P155_FORMSTATUS'
,p_server_condition_expr2=>'NEWRECORD'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(467242752777253977)
,p_event_id=>wwv_flow_imp.id(465874243057470967)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(613138090496359413)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(618735995537218533)
,p_name=>'Insert detail against SO'
,p_static_id=>'insert-detail-against-so'
,p_event_sequence=>259
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613647889157100898)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(618736137930218534)
,p_event_id=>wwv_flow_imp.id(618735995537218533)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_SALESORDERTNO,P155_TNO,P155_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    if :P155_SALESORDERTNO is not null and :P155_DOCTYPECODE != ''SALERETURN'' then',
    '    delete from loadingadvicedetail where tno = :P155_TNO;',
    '    for i in (select ',
    '                itemcode ,',
    '                ITEMSPECIFICATIONCODE ,',
    '                DESCRIPTION ,  ',
    '                GETPENDINGSOQUANTITY1(itemcode,ITEMSPECIFICATIONCODE,:P155_SALESORDERTNO) as q1,',
    '                QUANTITY2',
    '               from salesorderdetail',
    '                where tno = :P155_SALESORDERTNO',
    '                and itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '                 )',
    '        loop ',
    '        ',
    '            insert into loadingadvicedetail',
    '            (',
    '                TNO,',
    '                SNO,',
    '                ITEMCODE,',
    '                ITEMSPECIFICATIONCODE,',
    '                DESCRIPTION,',
    '                QUANTITY1,',
    '                QUANTITY2',
    '                ',
    '            )',
    '            values',
    '            (',
    '                 ',
    '                    :P155_TNO,',
    '                    globaltno.nextval,',
    '                    i.itemcode,',
    '                    i.ITEMSPECIFICATIONCODE,',
    '                    i.DESCRIPTION,',
    '                    i.q1,',
    '                    i.QUANTITY2',
    '            );',
    '        end loop;',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P155_FORMSTATUS'
,p_server_condition_expr2=>'NEWRECORD'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(467242648232253976)
,p_event_id=>wwv_flow_imp.id(618735995537218533)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(613138090496359413)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(307758911411957416)
,p_name=>'Insert detail against SO_1'
,p_static_id=>'insert-detail-against-so-2'
,p_event_sequence=>269
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613647889157100898)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(28767447265866034)
,p_event_id=>wwv_flow_imp.id(307758911411957416)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Insert Into Loading Advice Detail (while checking PO Item)'
,p_static_id=>'insert-into-loading-advice-detail-while-checking-po-item'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_SALESORDERTNO,P155_DOCTYPECODE,P155_TNO,P155_PURCHASEORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_item_exists NUMBER := 0;',
    'BEGIN',
    '    IF :P155_SALESORDERTNO IS NOT NULL AND :P155_DOCTYPECODE != ''SALERETURN'' THEN',
    '        ',
    '        DELETE FROM loadingadvicedetail WHERE tno = :P155_TNO;',
    '        ',
    '        FOR i IN (',
    '            SELECT ',
    '                a.itemcode,',
    '                a.itemspecificationcode,',
    '                a.description,  ',
    '                NVL(a.quantity1, 0) - NVL(b.quantity1, 0) - NVL(c.quantity1, 0) - NVL(d.quantity1, 0) AS q1,',
    '                NVL(a.quantity2, 0) - NVL(b.quantity2, 0) - NVL(c.quantity2, 0) - NVL(d.quantity2, 0) AS q2',
    '            FROM salesorderdetail a,',
    '            (',
    '                SELECT bb.salesordertno, cc.itemcode, cc.itemspecificationcode,',
    '                       SUM(cc.quantity1) quantity1, SUM(cc.quantity2) quantity2',
    '                FROM loadingadvice bb, loadingadvicedetail cc',
    '                WHERE bb.tno = cc.tno',
    '                  AND NOT EXISTS (SELECT 1 FROM ccinvoice xx WHERE xx.loadingadvicetno = bb.tno)',
    '                GROUP BY bb.salesordertno, cc.itemcode, cc.itemspecificationcode',
    '            ) b,',
    '            (',
    '                SELECT bb.salesordertno, cc.itemcode, cc.itemspecificationcode,',
    '                       SUM(cc.quantity1) quantity1, SUM(cc.quantity2) quantity2',
    '                FROM despatchadvice bb, despatchadvicedetail cc',
    '                WHERE bb.tno = cc.tno',
    '                  AND NOT EXISTS (SELECT 1 FROM ccinvoice xx WHERE xx.despatchadvicetno = bb.tno)',
    '                GROUP BY bb.salesordertno, cc.itemcode, cc.itemspecificationcode',
    '            ) c,',
    '            (',
    '                SELECT bb.salesordertno, cc.itemcode, cc.itemspecificationcode,',
    '                       SUM(cc.quantity1) quantity1, SUM(cc.quantity2) quantity2',
    '                FROM ccinvoice bb, ccinvoicedetail cc',
    '                WHERE bb.tno = cc.tno',
    '                GROUP BY bb.salesordertno, cc.itemcode, cc.itemspecificationcode',
    '            ) d',
    '            WHERE a.tno = b.salesordertno(+)',
    '              AND a.itemcode = b.itemcode(+)',
    '              AND a.itemspecificationcode = b.itemspecificationcode(+)',
    '              AND a.tno = c.salesordertno(+)',
    '              AND a.itemcode = c.itemcode(+)',
    '              AND a.itemspecificationcode = c.itemspecificationcode(+)',
    '              AND a.tno = d.salesordertno(+)',
    '              AND a.itemcode = d.itemcode(+)',
    '              AND a.itemspecificationcode = d.itemspecificationcode(+)',
    '              AND a.tno = :P155_SALESORDERTNO',
    '              AND a.documentstatuscode = ''ACTIVE''',
    '              AND a.itemcode NOT IN (SELECT itemcode FROM item WHERE itemnaturecode = ''SERVICES'')',
    '        ) ',
    '        LOOP ',
    '            --VALIDATION CLAUSE',
    '            IF :P155_DOCTYPECODE = ''PURCHASE'' THEN',
    '                SELECT COUNT(1)',
    '                INTO v_item_exists',
    '                FROM purchaseorderdetail xx ',
    '                WHERE xx.tno = :P155_PURCHASEORDERTNO',
    '                  AND xx.itemcode = i.itemcode ',
    '                  AND xx.itemspecificationcode = i.itemspecificationcode;',
    '',
    '                IF v_item_exists = 0 THEN',
    '                    RAISE_APPLICATION_ERROR(-20001, ''Transaction Aborted! Item Code: '' || i.itemcode || '' with Specification: '' || i.itemspecificationcode || '' does not exist in the selected Purchase Order.'');',
    '                END IF;',
    '            END IF;',
    '            --INSERT RECORD (ONLY RUNS IF VALIDATION PASSES)',
    '            INSERT INTO loadingadvicedetail (',
    '                tno,',
    '                sno,',
    '                itemcode,',
    '                itemspecificationcode,',
    '                description,',
    '                quantity1,',
    '                quantity2',
    '            )',
    '            VALUES (',
    '                :P155_TNO,',
    '                globaltno.nextval,',
    '                i.itemcode,',
    '                i.itemspecificationcode,',
    '                i.description,',
    '                i.q1,',
    '                i.q2',
    '            );',
    '            ',
    '        END LOOP;',
    '    END IF;',
    'EXCEPTION',
    '    WHEN OTHERS THEN',
    '        -- FAILSFE: ROLLS BACK',
    '        ROLLBACK;',
    '        RAISE;',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
,p_da_action_comment=>'Commeted because user dont need this validation anymore. commented on 23-06-2026 by vibhor (on demand of Pushpak)'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(307759006948957417)
,p_event_id=>wwv_flow_imp.id(307758911411957416)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_SALESORDERTNO,P155_TNO,P155_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    if :P155_SALESORDERTNO is not null and :P155_DOCTYPECODE != ''SALERETURN'' then',
    '    delete from loadingadvicedetail where tno = :P155_TNO;',
    '    for i in (select ',
    '                a.itemcode ,',
    '                a.ITEMSPECIFICATIONCODE ,',
    '                DESCRIPTION ,  ',
    '                Nvl(a.quantity1, 0) - Nvl(b.quantity1, 0) - Nvl(c.quantity1, 0) - Nvl(d.quantity1, 0) as q1,',
    '                Nvl(a.quantity2, 0) - Nvl(b.quantity2, 0) - Nvl(c.quantity2, 0) - Nvl(d.quantity2, 0) as q2',
    '               from salesorderdetail a,',
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
    ' Where a.tno = b.salesordertno(+)',
    '   And a.itemcode = b.itemcode(+)',
    '   And a.itemspecificationcode = b.itemspecificationcode(+)',
    '   And a.tno = c.salesordertno(+)',
    '   And a.itemcode = c.itemcode(+)',
    '   And a.itemspecificationcode = c.itemspecificationcode(+)',
    '   And a.tno = d.salesordertno(+)',
    '   And a.itemcode = d.itemcode(+)',
    '   And a.itemspecificationcode = d.itemspecificationcode(+)',
    '   and a.tno = :P155_SALESORDERTNO',
    '   -- DT-20-NOV-2024',
    '   AND A.DOCUMENTSTATUSCODE=''ACTIVE''',
    '   --',
    '   and a.itemcode not in (Select itemcode from item where itemnaturecode = ''SERVICES'')',
    '   -- 26-OCT-2024',
    '   --and exists ( select 1 from purchaseorderdetail xx where xx.tno = :P155_PURCHASEORDERTNO',
    '    --            AND :P155_DOCTYPECODE=''PURCHASE'' AND XX.ITEMCODE = A.ITEMCODE AND XX.ITEMSPECIFICATIONCODE = XX.ITEMSPECIFICATIONCODE',
    '   -- )',
    '                 )',
    '        loop ',
    '        ',
    '            insert into loadingadvicedetail',
    '            (',
    '                TNO,',
    '                SNO,',
    '                ITEMCODE,',
    '                ITEMSPECIFICATIONCODE,',
    '                DESCRIPTION,',
    '                QUANTITY1,',
    '                QUANTITY2',
    '                ',
    '            )',
    '            values',
    '            (',
    '                 ',
    '                    :P155_TNO,',
    '                    globaltno.nextval,',
    '                    i.itemcode,',
    '                    i.ITEMSPECIFICATIONCODE,',
    '                    i.DESCRIPTION,',
    '                    i.q1,',
    '                    i.Q2',
    '            );',
    '        end loop;',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P155_FORMSTATUS'
,p_server_condition_expr2=>'NEWRECORD'
,p_da_action_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Commeted because need to add a validation check the PO (Item and Specificaiton) on 15-05-2026 by vibhor (on Demand of Pushpak).',
'',
'Uncommented by vibhor on 23-06-2026 (on Demand of Pushpak). as user is not wanted to validate with PO item .'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(307759103478957418)
,p_event_id=>wwv_flow_imp.id(307758911411957416)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(613138090496359413)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(507158438254339789)
,p_name=>'next tab'
,p_static_id=>'next-tab'
,p_event_sequence=>329
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_EWAYBILLDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(507158572716339790)
,p_event_id=>wwv_flow_imp.id(507158438254339789)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613459845370592867)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(613457112375587825)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613460704987592872)
,p_event_id=>wwv_flow_imp.id(613459845370592867)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P155_TNO,P155_COMPANYCODE,P155_STATUS',
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
    '             if :P155_STATUS = ''ACTIVE'' then',
    '        ',
    '                CREATEPAYMENTADVICEFORPO(:P155_TNO);',
    '',
    '              end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613461240459592872)
,p_event_id=>wwv_flow_imp.id(613459845370592867)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(908332155257388901)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613460198329592870)
,p_event_id=>wwv_flow_imp.id(613459845370592867)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(222230481281236774)
,p_name=>'Set'
,p_static_id=>'set'
,p_event_sequence=>399
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_OUTWARDFRATNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(222230538525236775)
,p_event_id=>wwv_flow_imp.id(222230481281236774)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_FREIGHTRATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P155_OUTWARDFRATNO',
  'sql_query', 'SELECT APPROVEDFREIGHTRATE FROM OUTWARDFRA WHERE TNO = :P155_OUTWARDFRATNO',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(220858497264808879)
,p_name=>'set customer and SO'
,p_static_id=>'set-customer-and-so'
,p_event_sequence=>389
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_PURCHASEORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(220858536411808880)
,p_event_id=>wwv_flow_imp.id(220858497264808879)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_NAMEOFCUSTOMER,P155_SALESORDERTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P155_PURCHASEORDERTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select customercode , pendingsotno from purchaseorder     ',
    'where tno = :P155_PURCHASEORDERTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(512202409073133749)
,p_name=>'set decimal qty1'
,p_static_id=>'set-decimal-qty'
,p_event_sequence=>119
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(613138090496359413)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(512202537290133750)
,p_event_id=>wwv_flow_imp.id(512202409073133749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
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
 p_id=>wwv_flow_imp.id(512202615250133751)
,p_name=>'set decimal qty1_1'
,p_static_id=>'set-decimal-qty-2'
,p_event_sequence=>129
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(613138090496359413)
,p_triggering_element=>'QUANTITY2'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(512202768636133752)
,p_event_id=>wwv_flow_imp.id(512202615250133751)
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
    '  round(:QUANTITY2 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(465874726172470972)
,p_name=>'set details'
,p_static_id=>'set-details'
,p_event_sequence=>309
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_SALESGRNTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(465874825079470973)
,p_event_id=>wwv_flow_imp.id(465874726172470972)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_VEHICLETYPE,P155_VEHICLENO,P155_FREIGHTADVANCE,P155_FREIGHTRATE,P155_FREIGHTTYPECODE,P155_FREIGHTUNITCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P155_SALESGRNTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' SELECT',
    '    vehicletypecode,',
    '    vehicleno,',
    '    freightadvance,',
    '    freightrate,',
    '    freighttypecode,',
    '    freightunitcode',
    'FROM',
    '    ccinvoice',
    '    where tno in (select CCINVOICETNO from salesgrn where tno = :P155_SALESGRNTNO)')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(450284941076859732)
,p_name=>'set JO Address'
,p_static_id=>'set-jo-address'
,p_event_sequence=>379
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_NAMEOFVENDOR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450285025973859733)
,p_event_id=>wwv_flow_imp.id(450284941076859732)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_DELIVERYADDRESS1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P155_NAMEOFVENDOR',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select OFFICEADDRESS1||'', ''||OFFICEADDRESS2||'', ''||OFFICEADDRESS3||'', ''||OFFICEADDRESS4||'', ''||OFFICECITYCODE||'', ''||',
    'OFFICESTATECODE||'', ''||OFFICEPINCODE||'', ''||OFFICEFAXNO||'', ''||OFFICEEMAIL||'', ''||OFFICEPHONENO as address from party',
    'where partycode = :P155_NAMEOFVENDOR')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(613139650740359429)
,p_name=>'Set Quantity2'
,p_static_id=>'set-quantity'
,p_event_sequence=>117
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(613138090496359413)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(613139769013359430)
,p_event_id=>wwv_flow_imp.id(613139650740359429)
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
 p_id=>wwv_flow_imp.id(450284734027859730)
,p_name=>'set SO Address'
,p_static_id=>'set-so-address'
,p_event_sequence=>369
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_NAMEOFCUSTOMER'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(450284774135859731)
,p_event_id=>wwv_flow_imp.id(450284734027859730)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_DELIVERYADDRESS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P155_NAMEOFCUSTOMER',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select OFFICEADDRESS1||'', ''||OFFICEADDRESS2||'', ''||OFFICEADDRESS3||'', ''||OFFICEADDRESS4||'', ''||OFFICECITYCODE||'', ''||',
    'OFFICESTATECODE||'', ''||OFFICEPINCODE||'', ''||OFFICEFAXNO||'', ''||OFFICEEMAIL||'', ''||OFFICEPHONENO as address from party',
    'where partycode = :P155_NAMEOFCUSTOMER')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(615686822103714213)
,p_name=>'Skip focus to loading advice no'
,p_static_id=>'skip-focus-to-loading-advice-no'
,p_event_sequence=>249
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P155_LOADINGADVICEDATE'
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
 p_id=>wwv_flow_imp.id(615686914257714214)
,p_event_id=>wwv_flow_imp.id(615686822103714213)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P155_ISSUEDBYEMPLOYEECODE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613532447165973339)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from loadingadvicedetail where tno = :P155_TNO;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(613455563765587824)
,p_internal_uid=>163665898083580451
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(462746186329929770)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P155_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>14281113298765422
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613139444832359426)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(613138090496359413)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            if :quantity1 = 0 or :quantity1 is null   then',
'                raise_application_error(-20000 , ''Quantity cannot be 0.'');',
'            end if;',
'            Insert Into LOADINGADVICEDETAIL (                 ',
'                                        TNO,',
'                    SNO,',
'                    ITEMCODE,',
'                    ITEMSPECIFICATIONCODE,',
'                    DESCRIPTION,',
'                    QUANTITY1,',
'                    QUANTITY2,',
'                    REMARK',
'            )',
'            Values (',
'               :TNO,',
'                :SNO,',
'                :ITEMCODE,',
'                :ITEMSPECIFICATIONCODE,',
'                :DESCRIPTION,',
'                :QUANTITY1,',
'                :QUANTITY2,',
'                :REMARK ',
'',
'            );',
'        ',
'        when ''U'' then',
'',
'         if :quantity1 = 0 or :quantity1 is null then',
'                raise_application_error(-20000 , ''Quantity cannot be 0.'');',
'            end if;',
'            ',
'            update LOADINGADVICEDETAIL Set',
'                 TNO=:TNO,',
'                SNO=:SNO,',
'                ITEMCODE=:ITEMCODE,',
'                ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE,',
'                DESCRIPTION=:DESCRIPTION,',
'                QUANTITY1=:QUANTITY1,',
'                QUANTITY2=:QUANTITY2,',
'                REMARK=:REMARK          ',
'            WHERE TNO = :P155_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From LOADINGADVICEDETAIL',
'            Where TNo = :P155_TNO',
'              and SNO = :SNO',
'              ;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>163272895749966538
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613532073434971652)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No'
,p_static_id=>'get-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'    len         number;',
'begin',
'    select length(:P155_DRIVERMOBILENO) into len from dual;',
'    if len >10 then',
'        raise_application_error(-20000,''Check Mobile Number.'');',
'    end if;',
'     if :P155_Tno is null then',
'        Select GlobalTno.NextVal into :P155_Tno From Dual;',
'     end if;',
'    ----',
'    if :P155_LOADINGADVICENO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P155_LocationCode,',
'					:P155_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P155_LOADINGADVICEDATE, ''DD-MM-RRRR'')',
'				);',
'        :P155_LOADINGADVICENO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P155_LocationCode,',
'                    :P155_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P155_LOADINGADVICEDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>163665524352578764
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613451541651583396)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P155_TNO is null then',
'    :P155_TNO := GlobalTNo.nextval;',
'    :P155_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P155_FORMSTATUS := ''EDITRECORD'';',
'End if;',
'',
':P155_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P155_TNO), ''Status'');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>163584992569190508
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613451830988584476)
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
'       :P155_MODULEFLOW := ''YES'';',
'   else',
'       :P155_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P155_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P155_ONTHETABLE := ''YES'' ;',
'   else',
'       :P155_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>163585281906191588
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613435301775511376)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(613415320330511296)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Loading Advice'
,p_static_id=>'initialize-form-loading-advice'
,p_internal_uid=>163568752693118488
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613533272655979601)
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
,p_internal_uid=>163666723573586713
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613435666090511379)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(613415320330511296)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Loading Advice'
,p_static_id=>'process-form-loading-advice'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>163569117008118491
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613532732998975664)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P155_TNO, :P155_PURCHASEORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(613456292810587824)
,p_internal_uid=>163666183916582776
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(462744826352915734)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P155_FORMSTATUS = ''NEWRECORD'' THEN',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P155_ALLOWEDBACK,:P155_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'        else',
'     :P155_ALLOWEDBACK       := :P155_LOADINGADVICEDATE ; ',
'    :P155_ALLOWEDFORWARD    := :P155_LOADINGADVICEDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14279753321751386
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613649740323100916)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Checkbox'
,p_static_id=>'set-checkbox'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :P155_FORMSTATUS = ''NEWRECORD'' then',
'        :P155_ISWAREHOUSE := ''NO'';',
'        :P155_ISPARTYLOCATION := ''NO'';',
'        :P155_AGAINSTSALESORDER := ''NO'';',
'        :P155_AGAINSTJOBORDER := ''NO'';',
'    else',
'        if :P155_SALESORDERTNO is not null then',
'            :P155_AGAINSTSALESORDER := ''YES'';',
'        else ',
'            :P155_AGAINSTSALESORDER := ''NO'';',
'        end if;',
'',
'        if :P155_JOBORDERTNO is not null then',
'            :P155_AGAINSTJOBORDER := ''YES'';',
'        else ',
'            :P155_AGAINSTJOBORDER := ''NO'';',
'        end if;',
'',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>163783191240708028
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(613624778137006468)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(613138090496359413)
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
'                    and a.tno = :P155_PURCHASEORDERTNO )',
'    loop',
'        select count(*) into tmp from loadingadvicedetail',
'        where tno = :P155_TNO',
'        and itemcode = vloop.itemcode;',
'',
'        if nvl(tmp,0) = 0 then',
'            raise_application_error(-20000,''Item details not matching with Selected Indent No'');',
'        end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>163758229054613580
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(42971171173425894)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(613138090496359413)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validations Quantity From P.O.'
,p_static_id=>'validations-quantity-from-p-o'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number;',
'    tmp1 number;',
'begin',
'    select           ',
'        sum(a.Quantity1) into tmp          ',
'     from purchaseorderdetail a , item b',
'    where a.itemcode = b.itemcode',
'      and a.tno = :P155_PURCHASEORDERTNO',
'    ;',
'    ',
'    select           ',
'        sum(a.Quantity1) into tmp1         ',
'     from LoadingAdvicedetail a , item b',
'    where a.itemcode = b.itemcode',
'      and a.tno = :P155_TNO',
'    ;',
'',
'',
'        if nvl(tmp1,0) > nvl(tmp,0)  then',
'            raise_application_error(-20000,''Quantity Should Not Greater Than P.O.Quantity'');',
'        end if;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>16023955216730214
);
wwv_flow_imp.component_end;
end;
/
