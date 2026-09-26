prompt --application/pages/page_00199
begin
--   Manifest
--     PAGE: 00199
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
 p_id=>199
,p_name=>'Freight Advice'
,p_alias=>'FREIGHT-ADVICE'
,p_step_title=>'Freight Advice'
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
'  var bireporturl = $(''#P199_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/FreightAdvice1.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P199_TNO'').val() ',
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
'  var bireporturl = $(''#P199_BIREPORTURL'').val()',
'  var reportName =  ''FreightAdvice1.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P199_TNO'').val() ',
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
'',
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
'',
'/* Freight Advice is a form, so remove any register filter action after rendering. */',
'(function () {',
'  function removeFormFilters() {',
'    document.querySelectorAll(''.t-Body-title button, .t-Body-title a, .t-HeroRegion button, .t-HeroRegion a'').forEach(function (control) {',
'      if ((control.textContent || '''').replace(/\s+/g, '' '').trim().toLowerCase() === ''filters'') control.remove();',
'    });',
'  }',
'  [0, 150, 700, 1500].forEach(function (delay) { window.setTimeout(removeFormFilters, delay); });',
'}());',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'/* Freight Advice uses the same 12px hero-to-step gap as GRN. */',
'#tabcontainer { margin-top: 12px !important; }',
'.t-Body-title .hspl-filter-trigger { display: none !important; }',
'',
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
 p_id=>wwv_flow_imp.id(515186685300209059)
,p_plug_name=>'Amount Summary'
,p_static_id=>'amount-summary'
,p_parent_plug_id=>wwv_flow_imp.id(469669266628009784)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>810
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
 p_id=>wwv_flow_imp.id(766294441246666139)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>840
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1133677741279736666)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>850
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469669266628009784)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_name=>'Detail_Region'
,p_parent_plug_id=>wwv_flow_imp.id(469669145383009783)
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
'       MODULECODE,',
'       MODULETNO,',
'       QUANTITY1,',
'       NOS,',
'       RATE,',
'       RATEMEASURINGUNITCODE,',
'       AMOUNT,',
'       FOOTERAMOUNT,',
'       TOTALAMOUNT,',
'       TDSALREADYDEDUCTEDON,',
'       TDSDEDUCTABLEAMOUNT,',
'       TDSAMOUNT,',
'       DEDUCTIONBASISCODE,',
'       TOLERANCEMETHODCODE,',
'       TOLERANCE,',
'       SHORTAGEQUANTITY1,',
'       SHORTAGENOS,',
'       DEDUCTIONRATE,',
'       DEDUCTIONAMOUNT,',
'       NETFREIGHTAMOUNT,',
'       ADVANCEAMOUNT,',
'       PAYMENTCOMMISSION,',
'       NETPAYABLEAMOUNT,',
'       REMARK,',
'       REACHEDQUANTITY1,',
'       REACHEDDATE,',
'       MINIMUMQUANTITY1,',
'       ISDEDUCTIONONFULL,',
'       GPSDEDUCTIONAMOUNT,',
'       RECEIVEDQUANTITY1,',
'       FREIGHTRATE,',
'       CHALANQUANTITY1,',
'       LOANAMOUNT,',
'       OLDLANDINGRATE,',
'       NEWLANDINGRATE,',
'       BALANCEQUANTITY1,',
'       BALANCEQUANTITY2,',
'       BILLEDQUANTITY1,',
'       BILLEDAMOUNT,',
'       FREIGHTDEDUCTIONAMOUNT,',
'       BILLEDTOTALAMOUNT,',
'       BILLEDFOOTERAMOUNT,',
'       VEHICLENO,',
'       ''FD'' as FD,',
'       null as doctype,',
'       null as freighttype',
'  from FREIGHTADVICEDETAIL',
'  where tno = :P199_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P199_TNO'
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
 p_id=>wwv_flow_imp.id(470191992531070178)
,p_heading=>'Quantity'
,p_static_id=>'quantity'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(470192097896070179)
,p_heading=>'Shortage'
,p_static_id=>'shortage'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469671712967009809)
,p_name=>'ADVANCEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADVANCEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Advance Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>330
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'ADVANCEAMOUNT'
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
 p_id=>wwv_flow_imp.id(469670345761009795)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Freight Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470087614887758582)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470087734664758583)
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
 p_id=>wwv_flow_imp.id(470086844685758574)
,p_name=>'BALANCEQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCEQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Balancequantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>460
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'BALANCEQUANTITY1'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470086924208758575)
,p_name=>'BALANCEQUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCEQUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Balancequantity2'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>470
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'BALANCEQUANTITY2'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470087166306758577)
,p_name=>'BILLEDAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLEDAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Billedamount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>490
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'BILLEDAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470087490700758580)
,p_name=>'BILLEDFOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLEDFOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Billedfooteramount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>500
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'BILLEDFOOTERAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470087060498758576)
,p_name=>'BILLEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Billedquantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>480
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'BILLEDQUANTITY1'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470087333043758579)
,p_name=>'BILLEDTOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLEDTOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'BILLEDTOTALAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470086502721758570)
,p_name=>'CHALANQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Chalan'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(470191992531070178)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'CHALANQUANTITY1'
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
 p_id=>wwv_flow_imp.id(469671523480009807)
,p_name=>'DEDUCTIONAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEDUCTIONAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Deduction Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>310
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'DEDUCTIONAMOUNT'
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
 p_id=>wwv_flow_imp.id(469671007705009801)
,p_name=>'DEDUCTIONBASISCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEDUCTIONBASISCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Deductionbasiscode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'DEDUCTIONBASISCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469671480383009806)
,p_name=>'DEDUCTIONRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEDUCTIONRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Ded. Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>300
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(470192097896070179)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'DEDUCTIONRATE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(479889099189870994)
,p_name=>'DOCTYPE'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Doctype'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>520
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470192806858070186)
,p_name=>'FD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Fd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>510
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''Detail_Footer'')'
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
'<a href="javascript:openModal(''Detail_Footer'')">',
'<span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">FD</span></a>'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469670509815009796)
,p_name=>'FOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>200
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470087287420758578)
,p_name=>'FREIGHTDEDUCTIONAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FREIGHTDEDUCTIONAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Other Ded./Add. Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'FREIGHTDEDUCTIONAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470086383879758569)
,p_name=>'FREIGHTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FREIGHTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Freightrate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>420
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'FREIGHTRATE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(479889198294870995)
,p_name=>'FREIGHTTYPE'
,p_source_type=>'NONE'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Freighttype'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>530
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470086171095758567)
,p_name=>'GPSDEDUCTIONAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GPSDEDUCTIONAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Gpsdeductionamount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>400
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'GPSDEDUCTIONAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469672460734009816)
,p_name=>'ISDEDUCTIONONFULL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISDEDUCTIONONFULL'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Isdeductiononfull'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
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
,p_static_id=>'ISDEDUCTIONONFULL'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470086541843758571)
,p_name=>'LOANAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOANAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Loanamount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>430
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'LOANAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469672354812009815)
,p_name=>'MINIMUMQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MINIMUMQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Minimumquantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>380
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'MINIMUMQUANTITY1'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469669762722009789)
,p_name=>'MODULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Modulecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(469669850842009790)
,p_name=>'MODULETNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULETNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Module No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '300',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '1000')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'       b.RefNo,',
'			 a.TNo',
'',
'  From FreightGRNCCInvoiceQty a,',
'       FreightGRNCCInvoice    b,',
'       GRNforFreight          c,',
'       --companyvehicle d,',
'       (Select CC.REFERENCEMODULETNO As MODULETNO,',
'               Sum(CC.TDSDEDUCTABLEAMOUNT) As TDSDEDUCTABLEAMOUNT,',
'               Sum(CC.AMOUNT) As ADVANCEAMOUNT',
'        ',
'          From paymentadvice          aa,',
'               paymentadvicedetail    bb,',
'               paymentadvicereference cc',
'         Where aa.tno = bb.tno(+)',
'           And aa.tno = cc.tno(+)',
'           And bb.footerheadcode = ''.TDS.''',
'        -- And CC.REFERENCEMODULETNO = 26390',
'         Group By CC.REFERENCEMODULETNO) e',
' Where 1 = 1',
'   And a.TNO = b.TNO',
'   and b.companycode = :global_companycode',
'   And a.tno = c.TNo(+)',
'   And a.tno = e.moduletno(+)',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P199_DOCTYPECODE,P199_FREIGHTTYPECODE,P199_FORMSTATUS,P199_TRANSPORTERCODE,P199_TNO'
,p_ajax_optimize_refresh=>false
,p_static_id=>'MODULETNO'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469671633388009808)
,p_name=>'NETFREIGHTAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NETFREIGHTAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Net Freight Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>320
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'NETFREIGHTAMOUNT'
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
 p_id=>wwv_flow_imp.id(469672006896009811)
,p_name=>'NETPAYABLEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NETPAYABLEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Net Payable Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>350
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'NETPAYABLEAMOUNT'
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
 p_id=>wwv_flow_imp.id(470086724827758573)
,p_name=>'NEWLANDINGRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NEWLANDINGRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Newlandingrate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>450
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'NEWLANDINGRATE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469670074360009792)
,p_name=>'NOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NOS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nos'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'NOS'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470086618029758572)
,p_name=>'OLDLANDINGRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OLDLANDINGRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Oldlandingrate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>440
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'OLDLANDINGRATE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469671909225009810)
,p_name=>'PAYMENTCOMMISSION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PAYMENTCOMMISSION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Payment Commission'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>340
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'PAYMENTCOMMISSION'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469669946776009791)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Pass'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(470191992531070178)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_item_attributes=>'readonly=true'
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469670182237009793)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'RATE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469670302877009794)
,p_name=>'RATEMEASURINGUNITCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEMEASURINGUNITCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'RATEMEASURINGUNITCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469672300513009814)
,p_name=>'REACHEDDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REACHEDDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Reached Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
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
,p_static_id=>'REACHEDDATE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469672212303009813)
,p_name=>'REACHEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REACHEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Reached'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(470191992531070178)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'REACHEDQUANTITY1'
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
 p_id=>wwv_flow_imp.id(470086265025758568)
,p_name=>'RECEIVEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Receivedquantity1'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>410
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'RECEIVEDQUANTITY1'
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
 p_id=>wwv_flow_imp.id(469672104065009812)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>360
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
 p_id=>wwv_flow_imp.id(469669449327009786)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469671383403009805)
,p_name=>'SHORTAGENOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHORTAGENOS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Shortagenos'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>290
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'SHORTAGENOS'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469671302493009804)
,p_name=>'SHORTAGEQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHORTAGEQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>280
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(470192097896070179)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'SHORTAGEQUANTITY1'
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
 p_id=>wwv_flow_imp.id(469669664411009788)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'SNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'globaltno'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469670698261009798)
,p_name=>'TDSALREADYDEDUCTEDON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TDSALREADYDEDUCTEDON'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'TDS Already Deducted On'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TDSALREADYDEDUCTEDON'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469670828358009800)
,p_name=>'TDSAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TDSAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'TDS Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>240
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TDSAMOUNT'
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
 p_id=>wwv_flow_imp.id(469670752533009799)
,p_name=>'TDSDEDUCTABLEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TDSDEDUCTABLEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'TDS Deductable Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>230
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TDSDEDUCTABLEAMOUNT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469669552250009787)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'tno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'TNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P199_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469671193308009803)
,p_name=>'TOLERANCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOLERANCE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tolerance'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>270
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TOLERANCE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469671108046009802)
,p_name=>'TOLERANCEMETHODCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOLERANCEMETHODCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tolerancemethodcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_item_attributes=>'readonly=true'
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'TOLERANCEMETHODCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(469670567290009797)
,p_name=>'TOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>210
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_item_attributes=>'readonly=true'
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(470087532415758581)
,p_name=>'VEHICLENO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VEHICLENO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Vehicleno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
,p_static_id=>'VEHICLENO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(469669360028009785)
,p_internal_uid=>426487837244134723
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
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>300
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
 p_id=>wwv_flow_imp.id(470091807312762678)
,p_interactive_grid_id=>wwv_flow_imp.id(469669360028009785)
,p_static_id=>'65769'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(470091987573762678)
,p_report_id=>wwv_flow_imp.id(470091807312762678)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470092440255762683)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(469669449327009786)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470093316161762685)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(469669552250009787)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>88
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470094240796762687)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(469669664411009788)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>108
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470095172883762689)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(469669762722009789)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470096028261762691)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(469669850842009790)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470097004464762693)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(469669946776009791)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>57
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470097906345762695)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(469670074360009792)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470098787706762697)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(469670182237009793)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>64
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470099548905762699)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(469670302877009794)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470100488468762701)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(469670345761009795)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470101368368762703)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(469670509815009796)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>124
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470102297149762705)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(469670567290009797)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470103204368762707)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(469670698261009798)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470104058968762709)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(469670752533009799)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>129
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470104996186762711)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(469670828358009800)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470105852394762713)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(469671007705009801)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470106800286762715)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(469671108046009802)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470107618771762717)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(469671193308009803)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470108594272762719)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(469671302493009804)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470109427547762721)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(469671383403009805)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470110330105762723)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(469671480383009806)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470111272154762726)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(469671523480009807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>172
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470112168781762727)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(469671633388009808)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>157
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470113088937762729)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(469671712967009809)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470113999595762731)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(469671909225009810)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470114824029762733)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(469672006896009811)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470115783556762735)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(469672104065009812)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470116659331762738)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(469672212303009813)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>102
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470117515043762740)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(469672300513009814)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470118496248762741)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(469672354812009815)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470119401141762747)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(469672460734009816)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470120308462762749)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(470086171095758567)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470121131761762752)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(470086265025758568)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470122073485762754)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(470086383879758569)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470122959677762756)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(470086502721758570)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470123844060762758)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(470086541843758571)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470124748494762760)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(470086618029758572)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470125671307762762)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(470086724827758573)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470126550365762764)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(470086844685758574)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470127462792762766)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(470086924208758575)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470128362322762768)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(470087060498758576)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470129266903762770)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(470087166306758577)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470130133280762772)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(470087287420758578)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470131054489762773)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(470087333043758579)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>126
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470131913301762776)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(470087490700758580)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470132896236762777)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(470087532415758581)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470142819919829585)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(470087614887758582)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(470234796997543576)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(470192806858070186)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(480372112043637960)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(479889099189870994)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(480372921787637962)
,p_view_id=>wwv_flow_imp.id(470091987573762678)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(479889198294870995)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(525978891853570222)
,p_plug_name=>'Detail Footer'
,p_static_id=>'detail-footer'
,p_region_name=>'Detail_Footer'
,p_region_css_classes=>'js-dialog-size900x500'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid,',
'        a.TNO,',
'       a.SNO,',
'       a.SN,',
'       a.SERIALNO,',
'       a.FOOTERHEADCODE,',
'       a.FOOTERPERCENT,',
'       a.FOOTERVALUE,',
'       a.LEGENDSCODE,',
'       '' '' as includewithtaxableamount',
'  from FREIGHTADVICEDETAILFOOTER a',
'  Where a.TNo = :P199_TNO',
'  and a.sno = :P199_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(469669266628009784)
,p_ajax_items_to_submit=>'P199_TNO,P199_SNO'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(526371021156313282)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(526371041057313283)
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
 p_id=>wwv_flow_imp.id(526370600484313278)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Footer Head'
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
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(617582978943630800)
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_static_id=>'FOOTERHEADCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(526370717860313279)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer %'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'FOOTERPERCENT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(526370834790313280)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>100
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'STATIC'
,p_default_expression=>'0'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(578197050724567279)
,p_name=>'INCLUDEWITHTAXABLEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLUDEWITHTAXABLEAMOUNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Includewithtaxableamount'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(526370893204313281)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Legends'
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
,p_lov_id=>wwv_flow_imp.id(617583697481630806)
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
 p_id=>wwv_flow_imp.id(234918006840357175)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(526370511657313277)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'SR No'
,p_heading_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(526370410344313276)
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
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(525979156676570225)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
,p_parent_column_id=>wwv_flow_imp.id(469669664411009788)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(525979074759570224)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'tno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
,p_default_expression=>'P199_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(525979021626570223)
,p_internal_uid=>482797498842695161
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(526376290019321333)
,p_interactive_grid_id=>wwv_flow_imp.id(525979021626570223)
,p_static_id=>'103985'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(526376513120321333)
,p_report_id=>wwv_flow_imp.id(526376290019321333)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(235235226620341091)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(234918006840357175)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526376950310321335)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(525979074759570224)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526377859324321338)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(525979156676570225)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526378818029321340)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(526370410344313276)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526379665892321342)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(526370511657313277)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526380556022321344)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(526370600484313278)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526381509567321346)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(526370717860313279)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526382412359321347)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(526370834790313280)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526383287882321349)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(526370893204313281)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(526384167986321351)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(526371021156313282)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(578483758936515515)
,p_view_id=>wwv_flow_imp.id(526376513120321333)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(578197050724567279)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(657349601773527276)
,p_plug_name=>'FASelection'
,p_static_id=>'faselection'
,p_region_name=>'GRNSelection'
,p_region_css_classes=>'js-dialog-size1100x650'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>860
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(657349842695527278)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_parent_plug_id=>wwv_flow_imp.id(657349601773527276)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody:t-Form--slimPadding'
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
 p_id=>wwv_flow_imp.id(515633207600637708)
,p_plug_name=>'Freight Advice'
,p_static_id=>'freight-advice'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(469669145383009783)
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--pill:t-Form--slimPadding'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       FREIGHTADVICENO,',
'       FREIGHTADVICEDATE,',
'       TRANSPORTERCODE,',
'       FREIGHTTYPECODE,',
'       PARTYBILLNO,',
'       PARTYBILLDATE,',
'       MONEYTRANSFERMODECODE,',
'       MONEYTRANSFERREFERENCENO,',
'       DEBITACCOUNTCODE,',
'       CREDITACCOUNTCODE,',
'       TDSMASTERCODE,',
'       ITEMWISEFOOTER,',
'       REMARK,',
'       SUMOFAMOUNT,',
'       SUMOFFOOTERAMOUNT,',
'       FREIGHTADVICEAMOUNT,',
'       SUMOFTDSAMOUNT,',
'       SUMOFDEDUCTIONAMOUNT,',
'       SUMOFADVANCEAMOUNT,',
'       SUMOFPAYMENTCOMMISSION,',
'       SUMOFNETPAYABLEAMOUNT,',
'       AMOUNTAFTERTDS,',
'       TDSDEDUCTABLEAMOUNT,',
'       TDSALREADYDEDUCTEDON,',
'       PAIDTO,',
'       NARRATION,',
'       CREATOR,',
'       CREATIONTIME,',
'       BANKACCOUNTNO,',
'       TRANSACTIONTYPECODE,',
'       REVERSECHARGEIFAPPLICABLE,',
'       NATUREOFSUPPLYCODE,',
'       DUEDATE,',
'       REVERSECHARGEFOOTERNATURECODE,',
'       TDSNATURECODE,',
'       TDSPAYEECATEGORYCODE,',
'       PANNO,',
'       TDSTAXCATEGORYCODE,',
'       TDSTHRESHOLD,',
'       TDSTRANSACTIONTHRESHOLD,',
'       TOTALTDSPERCENT,',
'       ADVANCEORBILL,',
'       THRESHOLDPLUSMINUS,',
'       TDSDEDUCTEDINADVANCE,',
'       PAIDAMOUNT,',
'       PAIDINADVANCE,',
'       TDSCERTIFICATENO,',
'       TDSCERTIFICATEFILENAME,',
'       TDSLOWERRATEAPPLICABLE,',
'       TDSLOWERRATE,',
'       CESSLOWERRATE,',
'       SURCHARGELOWERRATE,',
'       FOOTERNATURECODE,',
'       BANKCODE,',
'       PAIDTOCODE,',
'       CHANGEFREIGHTRATE,',
'       SUMOFGPSDEDUCTIONAMOUNT,',
'       IFSCCODE,',
'       PAYMENTMETHODCODE,',
'       SMSFLAG,',
'       LOANAMOUNT,',
'       LOANTOTRANSPORTERTNO,',
'       NOOFLR,',
'       NETPAYABLEAFTERLOAN,',
'       PASSONQUANTITYCODE,',
'       BILLEDONQUANTITYCODE,',
'       SUMOFBILLEDAMOUNT,',
'       SUMOFBILLEDFOOTERAMOUNT,',
'       BILLEDFREIGHTADVICEAMOUNT,',
'       SUMOFFREIGHTDEDUCTIONAMOUNT,',
'       NVL(getdocumentstatuscode(''FREIGHTADVICE'',TNO),''STATUS'') AS STATUS,',
'       billinroundfigure,',
'       freightamountbeforeround,',
'       roundoff',
'  from FREIGHTADVICE'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(470192705423070185)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(657350730453527287)
,p_plug_name=>'GRNSelection1'
,p_static_id=>'grnselection'
,p_region_name=>'GRNSelection1'
,p_parent_plug_id=>wwv_flow_imp.id(657349601773527276)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , TNO,',
'       REFNO,',
'       PARTYNAME,',
'       REFDATE,',
'       MODULECODE,',
'       COMPANYVEHICLENO,',
'       CHALANQUANTITY1,',
'       RECEIVEDQUANTITY1,',
'       PASSEDQUANTITY1,',
'       REACHEDDATE,',
'       ADVANCEAMOUNT,',
'       TDSDEDUCTABLEAMOUNT',
'  from FASELECTION_APEX',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P199_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GRNSelection1'
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
 p_id=>wwv_flow_imp.id(224470013293746038)
,p_name=>'ADVANCEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADVANCEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Advanceamount'
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
 p_id=>wwv_flow_imp.id(657352007987527300)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(657352112497527301)
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
 p_id=>wwv_flow_imp.id(224469606226746034)
,p_name=>'CHALANQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CHALANQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Chalanquantity1'
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
 p_id=>wwv_flow_imp.id(224469526409746033)
,p_name=>'COMPANYVEHICLENO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPANYVEHICLENO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Companyvehicleno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(224469445726746032)
,p_name=>'MODULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Modulecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>9
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
 p_id=>wwv_flow_imp.id(224469202157746030)
,p_name=>'PARTYNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
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
 p_id=>wwv_flow_imp.id(224469780105746036)
,p_name=>'PASSEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PASSEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Passedquantity1'
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
 p_id=>wwv_flow_imp.id(224469879202746037)
,p_name=>'REACHEDDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REACHEDDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Reacheddate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(224469688760746035)
,p_name=>'RECEIVEDQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RECEIVEDQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Receivedquantity1'
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
 p_id=>wwv_flow_imp.id(224469302683746031)
,p_name=>'REFDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REFDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Refdate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
 p_id=>wwv_flow_imp.id(224469135004746029)
,p_name=>'REFNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REFNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Refno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(224470902461746047)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>150
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(224470137020746039)
,p_name=>'TDSDEDUCTABLEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TDSDEDUCTABLEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tdsdeductableamount'
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
 p_id=>wwv_flow_imp.id(657350954764527289)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(657350824964527288)
,p_internal_uid=>614169302180652226
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
 p_id=>wwv_flow_imp.id(657370332881587837)
,p_interactive_grid_id=>wwv_flow_imp.id(657350824964527288)
,p_static_id=>'1604485'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(657370483075587837)
,p_report_id=>wwv_flow_imp.id(657370332881587837)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224480819647851467)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(224469135004746029)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>156.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224481671914851473)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(224469202157746030)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>297.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224482572362851476)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(224469302683746031)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224483489942851479)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(224469445726746032)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224484337955851482)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(224469526409746033)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224485223865851484)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(224469606226746034)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224486093064851487)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(224469688760746035)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224486969939851490)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(224469780105746036)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224487888639851493)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(224469879202746037)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>114.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224488855167851496)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(224470013293746038)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115.0625
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224489748731851499)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(224470137020746039)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(224503485237971059)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(224470902461746047)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(657370995663587838)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(657350954764527289)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(657380946015587865)
,p_view_id=>wwv_flow_imp.id(657370483075587837)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(657352007987527300)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(515186549897209058)
,p_plug_name=>'Master'
,p_static_id=>'master'
,p_parent_plug_id=>wwv_flow_imp.id(469669266628009784)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>800
,p_plug_grid_column_span=>4
,p_plug_display_column=>1
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(515186786921209060)
,p_plug_name=>'Master Footer '
,p_static_id=>'master-footer'
,p_region_name=>'Master_Footer'
,p_parent_plug_id=>wwv_flow_imp.id(469669145383009783)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select rowid , ',
'TNO,',
'       SNO,',
'       SERIALNO,',
'       LEGENDSCODE,',
'       FOOTERHEADCODE,',
'       FOOTERVALUE,',
'       FOOTERPERCENT,',
'       FOOTERNATURECODE,',
'       BILLEDFOOTERVALUE',
'  from FREIGHTADVICEFOOTER',
'where tno = :P199_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Master Footer '
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
 p_id=>wwv_flow_imp.id(515187791086209070)
,p_name=>'BILLEDFOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BILLEDFOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Billedfootervalue'
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
 p_id=>wwv_flow_imp.id(515187360958209066)
,p_name=>'FOOTERHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Footerhead'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(515187711732209069)
,p_name=>'FOOTERNATURECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERNATURECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Footernaturecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(515187591818209068)
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
 p_id=>wwv_flow_imp.id(515187482622209067)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
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
 p_id=>wwv_flow_imp.id(515187300535209065)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Legends'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
 p_id=>wwv_flow_imp.id(574255132752056789)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>100
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(515187176821209064)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serialno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(515187122952209063)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>20
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(515186954475209062)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P199_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(515186891395209061)
,p_internal_uid=>472005368611333999
,p_is_editable=>false
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(515841206071971647)
,p_interactive_grid_id=>wwv_flow_imp.id(515186891395209061)
,p_static_id=>'403853'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(515841423802971647)
,p_report_id=>wwv_flow_imp.id(515841206071971647)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(475458464392160067)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(574255132752056789)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515841918747971651)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(515186954475209062)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515842732250971654)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(515187122952209063)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515843678341971657)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(515187176821209064)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>114
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515844586035971659)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(515187300535209065)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515845488559971661)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(515187360958209066)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>177
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515846381766971663)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(515187482622209067)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515847239092971665)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(515187591818209068)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>149
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515848168280971667)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(515187711732209069)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(515849034237971669)
,p_view_id=>wwv_flow_imp.id(515841423802971647)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(515187791086209070)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(469669145383009783)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(530040565057815277)
,p_plug_name=>'Total'
,p_static_id=>'total'
,p_parent_plug_id=>wwv_flow_imp.id(525978891853570222)
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118036534775887610)
,p_button_sequence=>300
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
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
 p_id=>wwv_flow_imp.id(118034982044887608)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
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
 p_id=>wwv_flow_imp.id(118031791471887607)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(657350730453527287)
,p_button_name=>'Close'
,p_static_id=>'close'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Close'
,p_button_position=>'NEXT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118036205999887610)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_condition=>'P199_FREIGHTADVICENO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118035401189887608)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P199_FREIGHTADVICENO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118020213701887599)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(525978891853570222)
,p_button_name=>'Detail_Footer_Back'
,p_static_id=>'detail-footer-back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118032980047887608)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P199_FREIGHTADVICENO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118033363054887608)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pillStart'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P199_FREIGHTADVICENO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118023628987887601)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(657349842695527278)
,p_button_name=>'GetRecode'
,p_static_id=>'getrecode'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh Data'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(117945866003887546)
,p_button_sequence=>840
,p_button_plug_id=>wwv_flow_imp.id(469669266628009784)
,p_button_name=>'Getrecord'
,p_static_id=>'getrecord'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Record'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(117950851315887552)
,p_button_sequence=>310
,p_button_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_button_name=>'GetTDS'
,p_static_id=>'gettds'
,p_button_static_id=>'GetTDS'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get TDS'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118032543406887608)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P199_FREIGHTADVICENO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118034185211887608)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Are you want to post this transaction?'
,p_confirm_style=>'warning'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-location-arrow fa-lg'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118034574880887608)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P199_FREIGHTADVICENO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118035821341887610)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_condition=>'P199_FREIGHTADVICENO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(118033738964887608)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(766294441246666139)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P199_STATUS.'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P199_FREIGHTADVICENO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(118159152756887668)
,p_branch_name=>'Go To Page 198'
,p_branch_action=>'f?p=&APP_ID.:198:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(118035401189887608)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515707776155637788)
,p_name=>'P199_ADVANCEORBILL'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'ADVANCEORBILL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477901859121978184)
,p_name=>'P199_ALLOWEDBACK'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477902452444992045)
,p_name=>'P199_ALLOWEDFORWARD'
,p_item_sequence=>840
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515699766544637783)
,p_name=>'P199_AMOUNTAFTERTDS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'AMOUNTAFTERTDS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515702639205637783)
,p_name=>'P199_BANKACCOUNTNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'BANKACCOUNTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515712627198637793)
,p_name=>'P199_BANKCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'BANKCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515718613712637810)
,p_name=>'P199_BILLEDFREIGHTADVICEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>510
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'BILLEDFREIGHTADVICEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515717403822637810)
,p_name=>'P199_BILLEDONQUANTITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'BILLEDONQUANTITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(224497662404226211)
,p_name=>'P199_BILLINROUNDFIGURE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_default=>'YES'
,p_prompt=>'Freight Bill In Round Figure'
,p_source=>'BILLINROUNDFIGURE'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>'STATIC2:NO;NO,YES;YES'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1220184920878978729)
,p_name=>'P199_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1161566575662710337)
,p_name=>'P199_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_item_default=>'198'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515711417293637792)
,p_name=>'P199_CESSLOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'CESSLOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515713407339637793)
,p_name=>'P199_CHANGEFREIGHTRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'CHANGEFREIGHTRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515689831497637767)
,p_name=>'P199_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515702170837637783)
,p_name=>'P199_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515701840534637783)
,p_name=>'P199_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515664730793637760)
,p_name=>'P199_CREDITACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(515186549897209058)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'CREDITACCOUNTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515664341465637760)
,p_name=>'P199_DEBITACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(515186549897209058)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'DEBITACCOUNTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(228986743231320630)
,p_name=>'P199_DEBITNOTENO'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_prompt=>'Debit Note No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_tag_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(228950828401320610)
,p_name=>'P199_DEBITNOTETNO'
,p_item_sequence=>550
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(528481021376080309)
,p_name=>'P199_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(525978891853570222)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(235015981138357253)
,p_name=>'P199_DFAMOUNT_1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(525978891853570222)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(530214010696815409)
,p_name=>'P199_DFTOTALAMOUNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(530040565057815277)
,p_prompt=>'Total Tax Amount'
,p_format_mask=>'999999999.99'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'Style = "text-align: right;"'
,p_grid_column=>8
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515727299051637796)
,p_name=>'P199_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOCTYPE'
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
 p_id=>wwv_flow_imp.id(515704154179637784)
,p_name=>'P199_DUEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'DUEDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515690189846637773)
,p_name=>'P199_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515712207305637792)
,p_name=>'P199_FOOTERNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'FOOTERNATURECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1161566489183710336)
,p_name=>'P199_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515697431423637782)
,p_name=>'P199_FREIGHTADVICEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'FREIGHTADVICEAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515728111613637796)
,p_name=>'P199_FREIGHTADVICEDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_default=>'select trunc(sysdate) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Freight Advice Date'
,p_source=>'FREIGHTADVICEDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P199_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P199_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515727626405637796)
,p_name=>'P199_FREIGHTADVICENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Freight Advice No'
,p_source=>'FREIGHTADVICENO'
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
 p_id=>wwv_flow_imp.id(224444680309226176)
,p_name=>'P199_FREIGHTAMOUNTBEFOREROUND'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Freight Amount Before Round'
,p_source=>'FREIGHTAMOUNTBEFOREROUND'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515728835674637803)
,p_name=>'P199_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Freight Type'
,p_source=>'FREIGHTTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select FREIGHTTYPENAME , FREIGHTTYPECODE from freighttype WHERE MODULECODE=''GRN'' AND :P199_DOCTYPECODE=''GRN''',
'UNION ALL',
'select FREIGHTTYPENAME , FREIGHTTYPECODE from freighttype WHERE MODULECODE=''CCINVOICE'' AND :P199_DOCTYPECODE=''CCINVOICE''',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_lov_cascade_parent_items=>'P199_DOCTYPECODE'
,p_ajax_items_to_submit=>'P199_DOCTYPECODE'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(224573635013746141)
,p_name=>'P199_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(657349842695527278)
,p_item_default=>'sysdate-30'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(528919819238565518)
,p_name=>'P199_FVALUE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(525978891853570222)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515714174673637793)
,p_name=>'P199_IFSCCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'IFSCCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515695834813637781)
,p_name=>'P199_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_default=>'YES'
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515715406132637809)
,p_name=>'P199_LOANAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'LOANAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515715752290637810)
,p_name=>'P199_LOANTOTRANSPORTERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'LOANTOTRANSPORTERTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515726818724637796)
,p_name=>'P199_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOCATION'
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
 p_id=>wwv_flow_imp.id(1161562771866710299)
,p_name=>'P199_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(476450157241371958)
,p_name=>'P199_MODULETNO_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515663528608637760)
,p_name=>'P199_MONEYTRANSFERMODECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(515186549897209058)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'MONEYTRANSFERMODECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515663981378637760)
,p_name=>'P199_MONEYTRANSFERREFERENCENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(515186549897209058)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'MONEYTRANSFERREFERENCENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515727595799637801)
,p_name=>'P199_NARRATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Narration'
,p_source=>'NARRATION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>41
,p_cMaxlength=>2000
,p_cHeight=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515740056533637807)
,p_name=>'P199_NATUREOFSUPPLYCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Nature Of Supply'
,p_source=>'NATUREOFSUPPLYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select NatureofSupplyname d,',
'NatureofSupplyCode r',
' from NatureofSupply;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
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
 p_id=>wwv_flow_imp.id(515716587350637810)
,p_name=>'P199_NETPAYABLEAFTERLOAN'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'NETPAYABLEAFTERLOAN'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515716207901637810)
,p_name=>'P199_NOOFLR'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'NOOFLR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160970992762439033)
,p_name=>'P199_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515708963517637791)
,p_name=>'P199_PAIDAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'PAIDAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515709433469637791)
,p_name=>'P199_PAIDINADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'PAIDINADVANCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515700965575637783)
,p_name=>'P199_PAIDTO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'PAIDTO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515713023046637793)
,p_name=>'P199_PAIDTOCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>370
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'PAIDTOCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515705768901637785)
,p_name=>'P199_PANNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'PANNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515729698635637804)
,p_name=>'P199_PARTYBILLDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Party Bill Date'
,p_source=>'PARTYBILLDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(515729272871637803)
,p_name=>'P199_PARTYBILLNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Party Bill No'
,p_source=>'PARTYBILLNO'
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
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1135619510627085497)
,p_name=>'P199_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515716968027637810)
,p_name=>'P199_PASSONQUANTITYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'PASSONQUANTITYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515714589180637809)
,p_name=>'P199_PAYMENTMETHODCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'PAYMENTMETHODCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515732504957637804)
,p_name=>'P199_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Remark'
,p_source=>'REMARK'
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
 p_id=>wwv_flow_imp.id(515704564722637784)
,p_name=>'P199_REVERSECHARGEFOOTERNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'REVERSECHARGEFOOTERNATURECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515739660718637807)
,p_name=>'P199_REVERSECHARGEIFAPPLICABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Reverse Charge If Applicable'
,p_source=>'REVERSECHARGEIFAPPLICABLE'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(575161152404547653)
,p_name=>'P199_REVERSECHARGENO'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_prompt=>'Reverse Charge No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:208:&SESSION.::NO:RP,208:P208_TNO,P208_CALLEDFROMPAGE,P208_FORMSTATUS,P208_CALLEDFROMTNO:&P199_REVERSECHARGETNO.,199,CALLED,&P199_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
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
 p_id=>wwv_flow_imp.id(575125013543547631)
,p_name=>'P199_REVERSECHARGETNO'
,p_item_sequence=>560
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(224444704292226177)
,p_name=>'P199_ROUNDOFF'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Roundoff'
,p_source=>'ROUNDOFF'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(461179056935970962)
,p_name=>'P199_SACCODE'
,p_item_sequence=>850
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(657450041216527362)
,p_name=>'P199_SELECTEDGRN'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(657349601773527276)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515714955082637809)
,p_name=>'P199_SMSFLAG'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'SMSFLAG'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(470215685318070204)
,p_name=>'P199_SNO'
,p_item_sequence=>820
,p_item_plug_id=>wwv_flow_imp.id(469669266628009784)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515910806704007932)
,p_name=>'P199_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>530
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_default=>'STATUS'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1135619346982085496)
,p_name=>'P199_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1133677741279736666)
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
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515675017349637766)
,p_name=>'P199_SUMOFADVANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Total Advance'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFADVANCEAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515672947697637766)
,p_name=>'P199_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Freight Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515717761646637810)
,p_name=>'P199_SUMOFBILLEDAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>490
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'SUMOFBILLEDAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515718143577637810)
,p_name=>'P199_SUMOFBILLEDFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>500
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'SUMOFBILLEDFOOTERAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515674566364637766)
,p_name=>'P199_SUMOFDEDUCTIONAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Total Deduction Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFDEDUCTIONAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515673376414637766)
,p_name=>'P199_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Total Footer Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFFOOTERAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515719032140637811)
,p_name=>'P199_SUMOFFREIGHTDEDUCTIONAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>520
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'SUMOFFREIGHTDEDUCTIONAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515713841450637793)
,p_name=>'P199_SUMOFGPSDEDUCTIONAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>390
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'SUMOFGPSDEDUCTIONAMOUNT'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515675805409637766)
,p_name=>'P199_SUMOFNETPAYABLEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Net Payble'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFNETPAYABLEAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515698963115637782)
,p_name=>'P199_SUMOFPAYMENTCOMMISSION'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'SUMOFPAYMENTCOMMISSION'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515674191583637766)
,p_name=>'P199_SUMOFTDSAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Total TDS Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFTDSAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515711783225637792)
,p_name=>'P199_SURCHARGELOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'SURCHARGELOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515700627491637783)
,p_name=>'P199_TDSALREADYDEDUCTEDON'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSALREADYDEDUCTEDON'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515710194962637792)
,p_name=>'P199_TDSCERTIFICATEFILENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSCERTIFICATEFILENAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515709798460637791)
,p_name=>'P199_TDSCERTIFICATENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSCERTIFICATENO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515676608483637767)
,p_name=>'P199_TDSDEDUCTABLEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'TDS Deductable Amount'
,p_format_mask=>'999999999.99'
,p_source=>'TDSDEDUCTABLEAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515708614264637791)
,p_name=>'P199_TDSDEDUCTEDINADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSDEDUCTEDINADVANCE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515710988998637792)
,p_name=>'P199_TDSLOWERRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSLOWERRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515710567665637792)
,p_name=>'P199_TDSLOWERRATEAPPLICABLE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSLOWERRATEAPPLICABLE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515695423893637781)
,p_name=>'P199_TDSMASTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSMASTERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515741255460637808)
,p_name=>'P199_TDSNATURECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'TDS Nature'
,p_source=>'TDSNATURECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select TDSNATURENAME , TDSNATURECODE from tdsnature'
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
 p_id=>wwv_flow_imp.id(515705399476637785)
,p_name=>'P199_TDSPAYEECATEGORYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSPAYEECATEGORYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515706208694637785)
,p_name=>'P199_TDSTAXCATEGORYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSTAXCATEGORYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515706613583637785)
,p_name=>'P199_TDSTHRESHOLD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSTHRESHOLD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515707025616637785)
,p_name=>'P199_TDSTRANSACTIONTHRESHOLD'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TDSTRANSACTIONTHRESHOLD'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515708169380637791)
,p_name=>'P199_THRESHOLDPLUSMINUS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'THRESHOLDPLUSMINUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515689430637637755)
,p_name=>'P199_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(224573732339746142)
,p_name=>'P199_TODATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(657349842695527278)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(515683796196637770)
,p_name=>'P199_TOTALTDSPERCENT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(515186685300209059)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'TDS %'
,p_format_mask=>'999999999.99'
,p_source=>'TOTALTDSPERCENT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(234941350944357198)
,p_name=>'P199_TOTVALUE'
,p_item_sequence=>830
,p_item_plug_id=>wwv_flow_imp.id(469669266628009784)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(515739275720637807)
,p_name=>'P199_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Transaction Type'
,p_source=>'TRANSACTIONTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select TransactionTypeName d,',
'TransactionTypeCode r',
' from TransactionType'))
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
 p_id=>wwv_flow_imp.id(515728425057637801)
,p_name=>'P199_TRANSPORTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_item_source_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_prompt=>'Transporter'
,p_source=>'TRANSPORTERCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'199_TRANSPORTER'
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
 p_id=>wwv_flow_imp.id(517305875549192044)
,p_name=>'P199_VOUCHERNO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(470192705423070185)
,p_prompt=>'Voucher No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>37
,p_tag_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(517269645779192022)
,p_name=>'P199_VOUCHERTNO'
,p_item_sequence=>540
,p_item_plug_id=>wwv_flow_imp.id(515633207600637708)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118102435306887643)
,p_name=>'calculate deduction amount'
,p_static_id=>'calculate-deduction-amount'
,p_event_sequence=>497
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'SHORTAGEQUANTITY1,DEDUCTIONRATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118102938345887643)
,p_event_id=>wwv_flow_imp.id(118102435306887643)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DEDUCTIONAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SHORTAGEQUANTITY1,DEDUCTIONRATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:SHORTAGEQUANTITY1,0)*NVL(:DEDUCTIONRATE,0)',
    'FROM DUAL')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118051453683887621)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>30
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(525978891853570222)
,p_triggering_element=>'FOOTERPERCENT,LEGENDSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118051941626887621)
,p_event_id=>wwv_flow_imp.id(118051453683887621)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERVALUE',
  'items_to_submit', 'FOOTERHEADCODE,FOOTERPERCENT,LEGENDSCODE,P199_DFAMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare	',
    '	cursor cFooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a, FooterSchemeList c',
    '		where a.tno = c.tno',
    '			and a.Status = ''ACTIVE''',
    '			and c.FooterHeadCode = :FooterHeadCode',
    '			and a.sno < c.sno ',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '			and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	vFooterSchemeDetail cFooterSchemeDetail%ROWTYPE;',
    '	',
    '	cursor c3FooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a, FooterSchemeList c',
    '		where a.tno = c.tno',
    '			and a.Status = ''ACTIVE''',
    '			and c.FooterHeadCode = :FooterHeadCode',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '			and c.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	v3FooterSchemeDetail c3FooterSchemeDetail%ROWTYPE;',
    '',
    '',
    '	cursor c2FooterSchemeDetail is',
    '		select a.* ',
    '		from FooterSchemeList a',
    '		where a.Status = ''ACTIVE''',
    '			and a.FooterHeadCode = :FooterHeadCode',
    '			and a.companycode = :global_CompanyCode',
    '			and a.financialyearcode = :global_financialyearcode',
    '			and a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
    '		order by a.sno;',
    '	v2FooterSchemeDetail c2FooterSchemeDetail%ROWTYPE;',
    '	',
    '	myFormula varchar2(1000);',
    '	isFound varchar2(10);',
    '	fvalue number;',
    '    tTotalDetailAmount number;',
    '    tmp varchar2(100);',
    '	',
    'BEGIN',
    ' ',
    '    tTotalDetailAmount := :P199_DFAMOUNT;',
    '    --raise_application_error(-20000,:P199_DFAMOUNT);',
    '',
    '  open c2FooterSchemeDetail;',
    '  fetch c2FooterSchemeDetail into v2FooterSchemeDetail;',
    '  if c2FooterSchemeDetail%FOUND then',
    '  		if length(nvl(v2FooterSchemeDetail.Formula,''''))>0 then',
    '  				myFormula := v2FooterSchemeDetail.Formula;',
    '  				myFormula := replace(myFormula, ''.A.'', nvl(tTotalDetailAmount,0) );',
    '  				for vFooterSchemeDetail  in cFooterSchemeDetail ',
    '  				loop',
    '					if :FooterHeadCode = vFooterSchemeDetail.FooterHeadCode then',
    '							isFound := ''YES'';',
    '							myFormula := replace(myFormula, vFooterSchemeDetail.FooterHeadCode, nvl(:FooterValue,0) );',
    '							exit;',
    '					end if;',
    '  				end loop;',
    '  				',
    '  					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0) );',
    '  			',
    '  				for v3FooterSchemeDetail  in c3FooterSchemeDetail ',
    '  				loop',
    '  						myFormula := replace(myFormula, v3FooterSchemeDetail.FooterHeadCode, ''0'' );',
    '  				end loop;',
    '  				if (:legendscode is null and NVL(GetMYparametervalue(''LEGENDS''),''YES'') = ''NO'') then ',
    '					myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '					:footervalue := getvalue(myformula);',
    '			    end if;',
    '',
    '                ',
    '',
    '		  		if (:Legendscode is not null and  NVL(GetMyparametervalue(''LEGENDS''),''NO'')= ''YES'') then ',
    '		  				select getvalue(myFormula) into  fvalue 	from dual;',
    '',
    '                          ',
    '                        --tmp := :legendscode;',
    '		  				if :legendscode = ''PRA'' then ',
    '		  					 	:footervalue := nvl(round(fvalue,0),0);',
    '		  						--message(myformula);',
    '                                  ',
    '',
    '                                 ',
    '                                ',
    '		  				end if;',
    '		  				',
    '		  				if :legendscode = ''PRD'' then ',
    '		  						:footervalue := (-1)* nvl(round(fvalue,0),0);',
    '		  						--message(myformula);',
    '		  				end if;',
    '							if :legendscode is null then ',
    '									myFormula := replace(myFormula, v2FooterSchemeDetail.FooterHeadCode, nvl(:FooterPercent,0));',
    '							end if;',
    '							if :legendscode = ''PAA'' then ',
    '		  						:footervalue := nvl(round(fvalue,2),0);',
    '							end if;',
    '							',
    '							if :legendscode = ''PAD'' then ',
    '		  						:footervalue := (-1)* nvl(round(fvalue,2),0);',
    '							end if;',
    '		  		END IF;',
    '		  		--raise_application_error(-20000,:footervalue);',
    '  			',
    '  		end if;',
    ' end if;',
    ' end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118052448652887622)
,p_event_id=>wwv_flow_imp.id(118051453683887621)
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
 p_id=>wwv_flow_imp.id(118109420904887646)
,p_name=>'Calculate Detail Footer Total Amount value '
,p_static_id=>'calculate-detail-footer-total-amount-value'
,p_event_sequence=>557
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(525978891853570222)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118109835138887646)
,p_event_id=>wwv_flow_imp.id(118109420904887646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Footer").widget().interactiveGrid("getViews", "grid").model;',
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
    '$s("P199_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118108436984887644)
,p_name=>'Calculate Detail Footer Total Amount value on get focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-get-focus'
,p_event_sequence=>547
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(525978891853570222)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118108953382887646)
,p_event_id=>wwv_flow_imp.id(118108436984887644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Footer").widget().interactiveGrid("getViews", "grid").model;',
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
    '$s("P199_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118052889972887622)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>40
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(525978891853570222)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118053340136887622)
,p_event_id=>wwv_flow_imp.id(118052889972887622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Footer").widget().interactiveGrid("getViews", "grid").model;',
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
    '$s("P199_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118058694949887624)
,p_name=>'Calculate Footer Total'
,p_static_id=>'calculate-footer-total'
,p_event_sequence=>225
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118020213701887599)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118059169093887624)
,p_event_id=>wwv_flow_imp.id(118058694949887624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Footer").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P199_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118101555671887643)
,p_name=>'calculate freight amount'
,p_static_id=>'calculate-freight-amount'
,p_event_sequence=>487
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'QUANTITY1,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118102033070887643)
,p_event_id=>wwv_flow_imp.id(118101555671887643)
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
  'sql_query', 'select nvl(:QUANTITY1,0)*nvl(:RATE,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118103326375887643)
,p_name=>'CALCULATE SUM OF ADVANCE AMOUNT'
,p_static_id=>'calculate-sum-of-advance-amount'
,p_event_sequence=>507
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'ADVANCEAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118104372207887643)
,p_event_id=>wwv_flow_imp.id(118103326375887643)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Region").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("ADVANCEAMOUNT");',
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
    ' ',
    '});',
    '',
    '$s("P199_SUMOFADVANCEAMOUNT", totalAmt);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118103873689887643)
,p_event_id=>wwv_flow_imp.id(118103326375887643)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFADVANCEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ADVANCEAMOUNT',
  'plsql_expression', ':ADVANCEAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118105680161887644)
,p_name=>'CALCULATE SUM OF DEDUCTIONAMOUNT'
,p_static_id=>'calculate-sum-of-deductionamount'
,p_event_sequence=>527
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'DEDUCTIONAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118106721701887644)
,p_event_id=>wwv_flow_imp.id(118105680161887644)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Region").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("DEDUCTIONAMOUNT");',
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
    ' ',
    '});',
    '',
    '$s("P199_SUMOFDEDUCTIONAMOUNT", totalAmt);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118106216810887644)
,p_event_id=>wwv_flow_imp.id(118105680161887644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFDEDUCTIONAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'DEDUCTIONAMOUNT',
  'plsql_expression', ':DEDUCTIONAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118104775726887644)
,p_name=>'CALCULATE SUM OF TDS AMOUNT'
,p_static_id=>'calculate-sum-of-tds-amount'
,p_event_sequence=>517
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'TDSAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118105280237887644)
,p_event_id=>wwv_flow_imp.id(118104775726887644)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Region").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("TDSAMOUNT");',
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
    ' ',
    '});',
    '',
    '$s("P199_SUMOFTDSAMOUNT", totalAmt);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118153043388887666)
,p_name=>'close region'
,p_static_id=>'close-region'
,p_event_sequence=>847
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118031791471887607)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118153570015887666)
,p_event_id=>wwv_flow_imp.id(118153043388887666)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(657349601773527276)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118134279955887657)
,p_name=>'delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>717
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118134775696887657)
,p_event_id=>wwv_flow_imp.id(118134279955887657)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from freightadvicedetailtds  a',
    '    where not exists(',
    '        Select',
    '            aa.Tno',
    '        From freightadvice aa',
    '        Where aa.Tno = a.Tno',
    '        ) and a.tno = :P199_TNO;',
    'delete from freightadvicedetailfooter  a',
    '    where not exists(',
    '        Select',
    '            aa.Tno',
    '        From freightadvice aa',
    '        Where aa.Tno = a.Tno',
    '        ) and a.tno = :P199_TNO;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118155758176887666)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data-2'
,p_event_sequence=>857
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118034982044887608)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118156790057887668)
,p_event_id=>wwv_flow_imp.id(118155758176887666)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail entry'
,p_static_id=>'check-detail-entry'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO',
  'language', 'PLSQL',
  'plsql_code', 'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P199_TNO);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118156293326887666)
,p_event_id=>wwv_flow_imp.id(118155758176887666)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from freightadvicedetail a',
    '    where not exists (',
    '        select 1 from freightadvice  aa  ',
    '        where aa.tno = a.tno',
    '    ) and a.tno = :P199_TNO;',
    '',
    'delete from freightadvicedetailfooter a',
    '    where not exists (',
    '        select 1 from freightadvice  aa  ',
    '        where aa.tno = a.tno',
    '    )and a.tno = :P199_TNO;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118157262715887668)
,p_event_id=>wwv_flow_imp.id(118155758176887666)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P199_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P199_CALLEDFROMTNO'').getValue();',
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
 p_id=>wwv_flow_imp.id(118072854947887630)
,p_name=>'Disable All Button if Called From Another Form'
,p_static_id=>'disable-all-button-if-called-from-another-form'
,p_event_sequence=>307
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118073384403887630)
,p_event_id=>wwv_flow_imp.id(118072854947887630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118036205999887610)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_FORMSTATUS'
,p_client_condition_expression=>'CALLED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118073871897887630)
,p_event_id=>wwv_flow_imp.id(118072854947887630)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_FORMSTATUS'
,p_client_condition_expression=>'CALLED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118074395890887630)
,p_event_id=>wwv_flow_imp.id(118072854947887630)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035821341887610)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_FORMSTATUS'
,p_client_condition_expression=>'CALLED'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118083133398887635)
,p_name=>'Disable All Buttons When DEBITNOTE  is exists'
,p_static_id=>'disable-all-buttons-when-debitnote-is-exists'
,p_event_sequence=>377
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118083717519887635)
,p_event_id=>wwv_flow_imp.id(118083133398887635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118036205999887610)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_DEBITNOTENO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118084172866887635)
,p_event_id=>wwv_flow_imp.id(118083133398887635)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_DEBITNOTENO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118084694236887635)
,p_event_id=>wwv_flow_imp.id(118083133398887635)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118034185211887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_DEBITNOTENO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118085166140887635)
,p_event_id=>wwv_flow_imp.id(118083133398887635)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035821341887610)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_DEBITNOTENO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118080818982887633)
,p_name=>'Disable All Buttons When RCM is exists'
,p_static_id=>'disable-all-buttons-when-rcm-is-exists'
,p_event_sequence=>367
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118081301601887633)
,p_event_id=>wwv_flow_imp.id(118080818982887633)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118036205999887610)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_REVERSECHARGENO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118081741904887633)
,p_event_id=>wwv_flow_imp.id(118080818982887633)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_REVERSECHARGENO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118082300123887633)
,p_event_id=>wwv_flow_imp.id(118080818982887633)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118034185211887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_REVERSECHARGENO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118082803382887635)
,p_event_id=>wwv_flow_imp.id(118080818982887633)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035821341887610)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_REVERSECHARGENO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118078349110887632)
,p_name=>'Disable All Buttons When Voucher Exists'
,p_static_id=>'disable-all-buttons-when-voucher-exists'
,p_event_sequence=>357
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118078837837887633)
,p_event_id=>wwv_flow_imp.id(118078349110887632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118036205999887610)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118079407383887633)
,p_event_id=>wwv_flow_imp.id(118078349110887632)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118079844354887633)
,p_event_id=>wwv_flow_imp.id(118078349110887632)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118034185211887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118080378280887633)
,p_event_id=>wwv_flow_imp.id(118078349110887632)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035821341887610)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118091767033887638)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>417
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118092782053887638)
,p_event_id=>wwv_flow_imp.id(118091767033887638)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118093241191887638)
,p_event_id=>wwv_flow_imp.id(118091767033887638)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
' select 1 from voucher where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) ',
'         and ModuleTno = :P199_TNO;'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118093743437887640)
,p_event_id=>wwv_flow_imp.id(118091767033887638)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P199_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118092225816887638)
,p_event_id=>wwv_flow_imp.id(118091767033887638)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118097440190887641)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>447
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118098511338887641)
,p_event_id=>wwv_flow_imp.id(118097440190887641)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118034574880887608)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118098005285887641)
,p_event_id=>wwv_flow_imp.id(118097440190887641)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118034574880887608)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118094172824887640)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>427
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118094632985887640)
,p_event_id=>wwv_flow_imp.id(118094172824887640)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035821341887610)
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
 p_id=>wwv_flow_imp.id(118095667008887640)
,p_event_id=>wwv_flow_imp.id(118094172824887640)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035821341887610)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P199_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118095148320887640)
,p_event_id=>wwv_flow_imp.id(118094172824887640)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035821341887610)
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
 p_id=>wwv_flow_imp.id(118096091275887640)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>437
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118097106240887640)
,p_event_id=>wwv_flow_imp.id(118096091275887640)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118033738964887608)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118096525666887640)
,p_event_id=>wwv_flow_imp.id(118096091275887640)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118033738964887608)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118068085149887629)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>287
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118033738964887608)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118071538320887630)
,p_event_id=>wwv_flow_imp.id(118068085149887629)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118033738964887608)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P199_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118071026195887629)
,p_event_id=>wwv_flow_imp.id(118068085149887629)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118033738964887608)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118069024137887629)
,p_event_id=>wwv_flow_imp.id(118068085149887629)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO,P199_STATUS,P199_FREIGHTADVICEDATE,P199_SUMOFDEDUCTIONAMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--SetDocumentStatusCode(''PURCHASEORDER'',13604,:P199_STATUS);',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P199_TNO,:P199_STATUS);',
    '',
    'if :P199_STATUS = ''ACTIVE'' then  ',
    '    PostFreightAdvice(:P199_TNO,:P199_FREIGHTADVICEDATE);',
    '    if nvl(:P199_SUMOFDEDUCTIONAMOUNT,0) > 0 then',
    '        createdebitnoteforfa(:P199_TNO,:P199_FREIGHTADVICEDATE);',
    '    end if; ',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118069536937887629)
,p_event_id=>wwv_flow_imp.id(118068085149887629)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118033738964887608)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text($v(''P199_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118070075819887629)
,p_event_id=>wwv_flow_imp.id(118068085149887629)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118070576554887629)
,p_event_id=>wwv_flow_imp.id(118068085149887629)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118068528136887629)
,p_event_id=>wwv_flow_imp.id(118068085149887629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118089834363887637)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>407
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118090350453887638)
,p_event_id=>wwv_flow_imp.id(118089834363887637)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118032543406887608)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118090866123887638)
,p_event_id=>wwv_flow_imp.id(118089834363887637)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118032980047887608)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118091330139887638)
,p_event_id=>wwv_flow_imp.id(118089834363887637)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118033363054887608)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118065677293887627)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>277
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118032980047887608)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118066648877887627)
,p_event_id=>wwv_flow_imp.id(118065677293887627)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO,P199_COMPANYCODE,P199_FREIGHTADVICENO',
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
    '                        AND A.ModuleTno = :P199_TNO',
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
    '    TMP VARCHAR2(100) := :P199_TNO;',
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
    '						a.remark = :P199_PASSFAILREMARK',
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
 p_id=>wwv_flow_imp.id(118067130819887627)
,p_event_id=>wwv_flow_imp.id(118065677293887627)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118067683137887629)
,p_event_id=>wwv_flow_imp.id(118065677293887627)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118066125314887627)
,p_event_id=>wwv_flow_imp.id(118065677293887627)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118061461478887626)
,p_name=>'HIDE AND BACK'
,p_static_id=>'hide-and-back'
,p_event_sequence=>247
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118020213701887599)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118061949167887626)
,p_event_id=>wwv_flow_imp.id(118061461478887626)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(525978891853570222)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118115728782887647)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>617
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118116263418887647)
,p_event_id=>wwv_flow_imp.id(118115728782887647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118098878981887641)
,p_name=>'Initialise SNO'
,p_static_id=>'initialise-sno'
,p_event_sequence=>457
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118099385514887641)
,p_event_id=>wwv_flow_imp.id(118098878981887641)
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
    'mysno varchar2(30);',
    'Begin',
    'If :SNO is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else mysno := nv(''SNO'') ;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118144402913887662)
,p_name=>'insert faselection'
,p_static_id=>'insert-faselection'
,p_event_sequence=>817
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118023628987887601)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118144917156887662)
,p_event_id=>wwv_flow_imp.id(118144402913887662)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TRANSPORTERCODE,P199_DOCTYPECODE,P199_FREIGHTTYPECODE,P199_FORMSTATUS,P199_FROMDATE,P199_TODATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from faselection_apex;',
    'insert into faselection_apex',
    '(',
    '    TNO,',
    '       REFNO,',
    '       PARTYNAME,',
    '       REFDATE,',
    '       MODULECODE,',
    '       COMPANYVEHICLENO,',
    '       CHALANQUANTITY1,',
    '       RECEIVEDQUANTITY1,',
    '       PASSEDQUANTITY1,',
    '       REACHEDDATE,',
    '       ADVANCEAMOUNT,',
    '       TDSDEDUCTABLEAMOUNT',
    ')',
    '(',
    '',
    '    Select a.TNo,',
    '       b.RefNo,',
    '       getpartyname(b.partycode) As partyname,',
    '       b.refdate,',
    '       b.ModuleCode,',
    '       b.VEHICLENO as COMPANYVEHICLENO,',
    '       a.ChalanQuantity1,',
    '',
    '       a.ReceivedQuantity1,',
    '       a.ChalanQuantity1 as PassedQuantity1,',
    '       --a.PassedQuantity1,',
    '       (b.RefDate) As ReachedDate,',
    '       ',
    '       nvl(f.AdvanceAmount,e.AdvanceAmount) As ADVANCEAMOUNT,',
    '       nvl(F.tdsdeductableamount,e.tdsdeductableamount) As TDSDeductableAmount',
    '',
    '  From FreightGRNCCInvoiceQty a,',
    '       FreightGRNCCInvoice b,',
    '       GRNforFreight c,',
    '       --companyvehicle d,',
    '       (Select CC.REFERENCEMODULETNO As MODULETNO,',
    '               Sum(CC.TDSDEDUCTABLEAMOUNT) As TDSDEDUCTABLEAMOUNT,',
    '               Sum(CC.Amount) As ADVANCEAMOUNT',
    '        ',
    '          From paymentadvice          aa,',
    '               paymentadvicedetail    bb,',
    '               paymentadvicereference cc',
    '         Where aa.tno = bb.tno(+)',
    '           And aa.tno = cc.tno(+)',
    '           And bb.footerheadcode = ''.TDS.''',
    '        -- And CC.REFERENCEMODULETNO = 26390',
    '         Group By CC.REFERENCEMODULETNO) e,',
    '         (',
    '            Select ee.TNO As MODULETNO,',
    '                   sum(ee.freightadvance) as AdvanceAmount,',
    '                   sum(ee.freightadvance) As TDSDEDUCTABLEAMOUNT',
    '                   --Sum(CC.TDSDEDUCTABLEAMOUNT) As TDSDEDUCTABLEAMOUNT',
    '                   --Sum(CC.AMOUNT) As ADVANCEAMOUNT',
    '',
    '              From paymentadvice          aa,',
    '                   paymentadvicedetail    bb,',
    '                   paymentadvicereference cc,',
    '                   LoadingAdvice          dd,',
    '                   Ccinvoice              ee',
    '             Where aa.tno = bb.tno',
    '               And aa.tno = cc.tno',
    '               And bb.footerheadcode = ''.TDS.''',
    '                  --And ee.TNO = 55383221',
    '               And cc.referencemoduletno = dd.tno',
    '               And dd.tno = ee.loadingadvicetno',
    '             Group By ee.TNO',
    '',
    '         ) f',
    ' Where 1 = 1',
    '   And a.TNO = b.TNO',
    '   and b.companycode = :global_companycode',
    '   And a.tno = c.TNo(+)',
    '   And a.tno = e.moduletno(+)',
    '   and a.tno = f.moduletno(+)',
    '   and b.TRANSPORTERCODE = :P199_TRANSPORTERCODE',
    '   and b.refdate between :P199_FROMDATE and :P199_TODATE',
    '   --And A.TNO = 30356',
    '     -- And b.VehicleNO = to_char(d.tno)',
    '			',
    '   And c.MODULECODE = decode(:P199_DOCTYPECODE,',
    '                             ''PURCHASE'',',
    '                             ''PURCHASEBILL'',',
    '                             ''SALE'',',
    '                             ''CCINVOICE'',',
    '                             :P199_DOCTYPECODE)',
    '',
    '   And b.FREIGHTTYPECODE = :P199_FREIGHTTYPECODE',
    '  -- and :P140_FORMSTATUS=''NEWRECORD''',
    ' And (Not Exists',
    '(Select 1 From freightadvicedetail aa Where aa.moduletno = a.tno and  :P199_FORMSTATUS=''NEWRECORD'' )',
    'or exists (Select 1 From freightadvicedetail aa Where aa.moduletno = a.tno and  :P199_FORMSTATUS=''EDITRECORD'') )',
    ');')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118145407139887662)
,p_event_id=>wwv_flow_imp.id(118144402913887662)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(657350730453527287)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118153957276887666)
,p_name=>'insert into footer'
,p_static_id=>'insert-into-footer'
,p_event_sequence=>737
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'AMOUNT'
,p_condition_element_type=>'ITEM'
,p_condition_element=>'P199_SACCODE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118154435527887666)
,p_event_id=>wwv_flow_imp.id(118153957276887666)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'TNO,SNO,P199_TRANSPORTERCODE,P199_TRANSACTIONTYPECODE,P199_SACCODE,P199_DFAMOUNT,P199_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'tmp    number;',
    'phsn varchar(30);',
    'begin',
    '',
    'select count(*) into tmp',
    'FROM FREIGHTADVICEDETAILFOOTER  WHERE TNO = :P199_TNO AND SNO = :SNO;',
    '',
    'if nvl(tmp,0) = 0 and :P199_FORMSTATUS =''NEWRECORD''  then',
    '--raise_application_error(-20000,''100'');',
    '  --RAISE_APPLICATION_ERROR(-20000,''party ''||:P199_TRANSPORTERCODE||''tr type ''||:P199_TRANSACTIONTYPECODE||'' hsn ''||:P199_SACCODE||'' tno ''||:P199_TNO||'' sno ''||:sno||'' amount ''||:P199_DFAMOUNT);',
    '',
    '       --DELETE FROM FREIGHTADVICEDETAILFOOTER  WHERE TNO = :TNO AND SNO = :SNO;',
    '        for vTaxRule',
    '        				in (',
    '        					select',
    '        						rownum as slno,',
    '        						b.TNo,',
    '        						b.SNO,',
    '        						a.LegendsCode,',
    '        						c.FooterHeadCode,',
    '        						c.FooterHeadName,',
    '        						b.TaxRate as FooterPercent,',
    '                                (:P199_DFAMOUNT * B.TAXrATE) /100 AS FooterValue',
    '        					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleSAC e, party F',
    '        					where a.TNO = b.TNo',
    '        						and a.SNO = b.SNo',
    '        						and b.FooterHeadCode = c.FooterHeadCode',
    '        						and a.TNO = d.TNo',
    '                                and d.tno = e.tno',
    '                                and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                                and f.PartyCode = :P199_TRANSPORTERCODE',
    '                                And d.transactiontypecode = :P199_TRANSACTIONTYPECODE',
    '                                and e.SACCODE = :P199_SACCODE',
    '                                ',
    '        					--order by b.SNo',
    '        				)',
    '        			loop',
    '       -- raise_application_error(-20000,phsn);	',
    '        			    Insert into FREIGHTADVICEDETAILFOOTER ',
    '                        (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '        				values',
    '                        (:P199_TNO,:SNO,globaltno.nextval,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '        			',
    '        			end loop; -- for vTaxRule',
    '                    commit;',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118155343525887666)
,p_event_id=>wwv_flow_imp.id(118153957276887666)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(525978891853570222)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118154876664887666)
,p_event_id=>wwv_flow_imp.id(118153957276887666)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(footervalue) from FREIGHTADVICEDETAILFOOTER',
    'where tno = :tno',
    'and sno = :sno')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118121548912887651)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>637
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_BILLINROUNDFIGURE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118122031496887651)
,p_event_id=>wwv_flow_imp.id(118121548912887651)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();',
    '//apex.region( "Detail_Region" ).widget().interactiveGrid( "getActions" ).set("edit", true);',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118122484482887651)
,p_name=>'move tab1'
,p_static_id=>'move-tab-2'
,p_event_sequence=>647
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'REMARK'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'MODULETNO'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118122973598887651)
,p_event_id=>wwv_flow_imp.id(118122484482887651)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_Detail_Region"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118075632952887632)
,p_name=>'Open DebitNote'
,p_static_id=>'open-debitnote'
,p_event_sequence=>327
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_DEBITNOTENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118076175815887632)
,p_event_id=>wwv_flow_imp.id(118075632952887632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P199_DEBITNOTETNO'').getValue();',
    'var y = ''199'';',
    'var z = ''CALLED'';',
    '',
    'var url = "f?p=#APP_ID#:159:#SESSION#::NO:RP,159:P159_TNO,P159_CALLEDFROMPAGE,P159_FORMSTATUS:#P159_TNO#,#P159_CALLEDFROMPAGE#,#P159_FORMSTATUS#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P159_TNO#", x);',
    'url = url.replace("#P159_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P159_FORMSTATUS#", z);',
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
 p_id=>wwv_flow_imp.id(118142458024887660)
,p_name=>'open faselection'
,p_static_id=>'open-faselection'
,p_event_sequence=>807
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(117945866003887546)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118142974940887660)
,p_event_id=>wwv_flow_imp.id(118142458024887660)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '       DELETE FROM faselection_apex ;',
    '        delete from FREIGHTADVICEDETAIL aa where tno = :P199_TNO;',
    ' ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118143947444887660)
,p_event_id=>wwv_flow_imp.id(118142458024887660)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(657349601773527276)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118143514503887660)
,p_event_id=>wwv_flow_imp.id(118142458024887660)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(657350730453527287)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118076608493887632)
,p_name=>'Open RCM'
,p_static_id=>'open-rcm'
,p_event_sequence=>337
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_REVERSECHARGENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118077113063887632)
,p_event_id=>wwv_flow_imp.id(118076608493887632)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P199_REVERSECHARGETNO'').getValue();',
    'var y = ''199'';',
    'var z = ''CALLED'';',
    '',
    'var url = "f?p=#APP_ID#:208:#SESSION#::NO:RP,208:P208_TNO,P208_CALLEDFROMPAGE,P208_FORMSTATUS:#P208_TNO#,#P208_CALLEDFROMPAGE#,#P208_FORMSTATUS#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P208_TNO#", x);',
    'url = url.replace("#P208_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P208_FORMSTATUS#", z);',
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
 p_id=>wwv_flow_imp.id(118074796429887630)
,p_name=>'Open Voucher'
,p_static_id=>'open-voucher'
,p_event_sequence=>317
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_VOUCHERNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118075271648887632)
,p_event_id=>wwv_flow_imp.id(118074796429887630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P199_VOUCHERTNO'').getValue();',
    'var y = ''199'';',
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
 p_id=>wwv_flow_imp.id(118063303301887626)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>267
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118032543406887608)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118064246157887627)
,p_event_id=>wwv_flow_imp.id(118063303301887626)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO,P199_COMPANYCODE,P199_FREIGHTADVICENO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) := :P199_FREIGHTADVICENO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P199_TNO --'':P''||:APP_PAGE_ID||''_TNo''',
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
    '				a.remark = :P199_PASSFAILREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(getModuleCodeForPageNo(:APP_PAGE_ID), :P199_TNO , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118064794016887627)
,p_event_id=>wwv_flow_imp.id(118063303301887626)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118065239252887627)
,p_event_id=>wwv_flow_imp.id(118063303301887626)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118063723525887626)
,p_event_id=>wwv_flow_imp.id(118063303301887626)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118053758347887622)
,p_name=>'Post'
,p_static_id=>'post'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118034185211887608)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118056802411887624)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118034185211887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118057256780887624)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035821341887610)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118057818876887624)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118033738964887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118058237058887624)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(118035401189887608)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P199_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118054229161887622)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P199_STATUS',
  'items_to_submit', 'P199_PORECEIPTDATE,P199_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Declare ',
    '	tVoucherDate Date := nvl(to_date(:P199_FREIGHTADVICEDATE, ''DD-MM-RRRR''), to_date(trunc(sysdate), ''DD-MM-RRRR''));',
    '    temp number;',
    '    tVouherNo Varchar2(100);',
    '    ttno number;',
    'Begin',
    '    temp := 0;',
    '	select',
    '			count(a.tno) into temp',
    '	from Voucher a',
    '	where a.ModuleCode = GetModuleCodeForPageNo(:APP_PAGE_ID) ',
    '			and a.ModuleTNo = :P199_TNO',
    '	;',
    '    if GetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), :P199_TNO) = ''ACTIVE'' then',
    '    	if nvl(temp, 0) = 0 then		',
    '    		Begin',
    '               ',
    '    			PostFreightAdvice(:P199_TNO,tvoucherdate);',
    '                ',
    '                ----- Reverse Charge Creation ',
    '',
    '                CreateReverseChargeForFA(:P199_TNO,tvoucherdate);',
    '    		Exception',
    '    			when others then',
    '    					rollback;',
    '                        raise_application_error(-20000, ''Voucher not posting. '' || sqlerrm);',
    '',
    '    		End;',
    '    	end if;',
    '    end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118055761574887622)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118056285400887622)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_VOUCHERNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118054768313887622)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_VOUCHERTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    rtvalue number;',
    'begin',
    '    for vVoucher in',
    '        (',
    '        Select',
    '            a.Tno',
    '        From Voucher a',
    '        where a.ModuleTno = :P199_TNO',
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
 p_id=>wwv_flow_imp.id(118055257214887622)
,p_event_id=>wwv_flow_imp.id(118053758347887622)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_VOUCHERNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P199_TNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    rtvalue varchar2(100);',
    'begin',
    '    for vVoucher in',
    '        (',
    '        Select',
    '            a.VoucherNo',
    '        From Voucher a',
    '        where a.ModuleTno = :P199_TNO',
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
 p_id=>wwv_flow_imp.id(118146683937887662)
,p_name=>'prepare data'
,p_static_id=>'prepare-data'
,p_event_sequence=>837
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118031791471887607)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118152664848887665)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_name=>'click tds'
,p_static_id=>'click-tds'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var button = document.getElementById(''GetTDS'');',
    'button.click();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118147213327887662)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'delete from faselection_apex'
,p_static_id=>'delete-from-faselection-apex'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_SELECTEDGRN',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from faselection_apex a',
    'where  ( :P199_SELECTEDGRN IS NULL OR instr('':''||:P199_SELECTEDGRN||'':'','':''||A.TNO||'':'') <= 0 );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118147655918887663)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'insert into detail'
,p_static_id=>'insert-into-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from FREIGHTADVICEDETAIL where tno = :P199_TNO;',
    'insert into FREIGHTADVICEDETAIL',
    '(',
    '    tno , sno , MODULETNO , MODULECODE , TDSALREADYDEDUCTEDON , QUANTITY1 , VEHICLENO , ',
    'CHALANQUANTITY1 , REACHEDQUANTITY1 , REACHEDDATE , ADVANCEAMOUNT',
    ')',
    '(',
    '    select :P199_TNO , globaltno.nextval , TNO , MODULECODE , TDSDEDUCTABLEAMOUNT , PASSEDQUANTITY1 , COMPANYVEHICLENO ,',
    'CHALANQUANTITY1 , RECEIVEDQUANTITY1 , REFDATE , ADVANCEAMOUNT from faselection_apex',
    ');')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118150705542887665)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'insert into footer detail'
,p_static_id=>'insert-into-footer-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO,P199_REVERSECHARGEIFAPPLICABLE,P199_TRANSACTIONTYPECODE,P199_TRANSPORTERCODE,P199_SACCODE,P199_NATUREOFSUPPLYCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tsumoffooteramount number;',
    '    tsumofamount       number;',
    '    tsumoftotalamount  number;',
    '    tfooteramount      number;',
    '    tmp                number;',
    '    tmp1               number;',
    '    tfootervalue       number;',
    'begin',
    'if :P199_NATUREOFSUPPLYCODE = ''1'' then',
    ' for vdet in (',
    '    select tno,sno,rate,quantity1,amount as amount from freightadvicedetail a',
    '    where a.tno = :P199_TNO',
    ' ) loop',
    ' --RAISE_APPLICATION_ERROR(-20001,'' DETAIL LOOP'');',
    '---- INSERT INTO FOOTER DETAIL',
    '    select count(*) into tmp',
    '	  from FREIGHTADVICEDETAILFOOTER',
    '    WHERE TNO = vdet.tno AND sno = vdet.sno;',
    '',
    '--RAISE_APPLICATION_ERROR(-20001,'' AMOUNT ''||TO_CHAR(VDET.AMOUNT)||'' RCM APP ''||:P199_REVERSECHARGEIFAPPLICABLE||'' TMP ''||TO_CHAR(TMP));',
    '',
    '   if nvl( vdet.AMOUNT,0) >= 0 and nvl(:P199_REVERSECHARGEIFAPPLICABLE,''NO'') = ''NO'' and nvl(tmp,0) = 0 then',
    '           DELETE FROM FREIGHTADVICEDETAILFOOTER WHERE TNO = vdet.tno AND sno = vdet.sno;',
    '--RAISE_APPLICATION_ERROR(-20001,'' :P199_TRANSPORTERCODE ''||:P199_TRANSPORTERCODE||'' :P199_TRANSACTIONTYPECODE ''||:P199_TRANSACTIONTYPECODE||'' :P199_SACCODE ''||:P199_SACCODE);',
    '            for vTaxRule',
    '				in (',
    '					select',
    '						rownum as slno,',
    '						b.TNo,',
    '						b.SNO,',
    '						a.LegendsCode,',
    '						c.FooterHeadCode,',
    '						c.FooterHeadName,',
    '						b.TaxRate as FooterPercent,',
    '                        (vdet.AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRulesac e, party F',
    '					where a.TNO = b.TNo',
    '						and a.SNO = b.SNo',
    '						and b.FooterHeadCode = c.FooterHeadCode',
    '						and a.TNO = d.TNo',
    '                        and d.tno = e.tno',
    '                        and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                        and f.PartyCode = :P199_TRANSPORTERCODE',
    '                        And d.transactiontypecode = :P199_TRANSACTIONTYPECODE',
    '                        and e.SACCODE = :P199_SACCODE',
    '				)',
    '			loop      ',
    '             -- RAISE_APPLICATION_ERROR(-20004,'' TAX RULE''||'' val ''||vTaxRule.FooterValue||'' amt ''||vdet.amount);',
    '			    Insert into FREIGHTADVICEDETAILFOOTER',
    '                (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '				values',
    '                (vdet.TNO,vdet.SNO,Globaltno.NextVal,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '			',
    '			end loop; -- for vTaxRule',
    '            commit;',
    '    else',
    '			for vfooter in (',
    '			Select * From FREIGHTADVICEDETAILFOOTER a where tno = vdet.tno and SNO = vdet.SNO',
    '		 ) loop',
    '',
    '			if vfooter.legendscode = ''PRA'' then ',
    '				tfootervalue := round((vdet.amount * vfooter.footerpercent ) /100,0);',
    '			end if;',
    '',
    '			if vfooter.legendscode = ''PRD'' then ',
    '				tfootervalue := (-1)* round((vdet.amount * vfooter.footerpercent ) /100,0);',
    '',
    '			end if;',
    '			if vfooter.legendscode = ''PAA'' then ',
    '				tfootervalue := round((vdet.amount * vfooter.footerpercent ) /100,2);',
    '			end if;',
    '',
    '			if vfooter.legendscode = ''PAD'' then ',
    '				tfootervalue := (-1)* round((vdet.amount * vfooter.footerpercent ) /100,2);',
    '			end if;',
    '',
    '			 DELETE FROM FREIGHTADVICEDETAILFOOTER X',
    '			  where x.tno = vfooter.tno',
    '			    and x.sno = vfooter.sno',
    '			    and x.sn = vfooter.sn',
    '			    and x.footerheadcode = vfooter.Footerheadcode',
    '			   ;',
    '',
    '			  INSERT INTO FREIGHTADVICEDETAILFOOTER ( TNO,SNO,SN,SERIALNO,FOOTERHEADCODE,FOOTERPERCENT,LEGENDSCODE,FOOTERVALUE)',
    '			  VALUES ( VFOOTER.TNO,VFOOTER.SNO,VFOOTER.SN,VFOOTER.SERIALNO,VFOOTER.FOOTERHEADCODE,VFOOTER.FOOTERPERCENT,VFOOTER.LEGENDSCODE,TFOOTERVALUE);',
    ' 	 ',
    '    ',
    '         end loop;',
    '    end if;',
    '    ',
    '    select sum(footervalue) into tfooteramount ',
    '	 from FREIGHTADVICEDETAILFOOTER ',
    '	 where tno = vdet.tno',
    '	   and sno = vdet.sno;',
    '',
    '    update freightadvicedetail ',
    '       set footeramount = tfooteramount,',
    '           totalamount  = amount + nvl(tfooteramount,0)',
    '    where tno = vdet.tno',
    '      and sno = vdet.sno',
    '            ;',
    '',
    'end loop;',
    '',
    ' end if;',
    '   ----',
    'commit;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118148708472887663)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>140
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(469669266628009784)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118150148453887665)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'set all other amounts'
,p_static_id=>'set-all-other-amounts'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO,P199_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    pCHALANQUANTITY1 number;',
    '    pSHORTAGEQUANTITY1 number;',
    '    pREACHEDQUANTITY1 number;',
    '    pQUANTITY1 number;',
    '    pAMOUNT number;',
    '    pTOTALAMOUNT number;',
    '    pDEDUCTIONAMOUNT number;',
    '    pNETFREIGHTAMOUNT number;',
    '    pNETPAYABLEAMOUNT number;',
    '    pTDSDEDUCTABLEAMOUNT number;',
    '    pFooterAmount        number;',
    '    ptolerancepercent number;',
    '    ptoleranceqty number;',
    '    PDeductionRate Number;',
    '    pPassQuantity Number;',
    '    pTDSAmount Number;',
    '    pBilledTotalAmount number;',
    '    pFreightDeductionAmount number;',
    '',
    'begin  ',
    '    if :P199_DOCTYPECODE=''CCINVOICE'' then',
    '        Select Round(Sum(b.totalamount)/Sum(b.quantity1),2) INTO PDeductionRate',
    '            From ccinvoice a, CcinvoiceDetail b',
    '            Where a.tno = b.tno',
    '              And a.tno in ( select moduletno from FreightAdviceDetail where tno = :P199_TNO)',
    '              ;',
    '                ',
    '         UPDATE FreightAdviceDetail ',
    '            set DeductionRate = pDeductionRate',
    '         where tno = :P199_TNO',
    '         ;',
    '     ',
    '    end if;',
    '    for i in (',
    '        select tno , sno , CHALANQUANTITY1 , RATEMEASURINGUNITCODE , REACHEDQUANTITY1 , SHORTAGEQUANTITY1 , QUANTITY1 ,',
    '                AMOUNT , FOOTERAMOUNT  , DEDUCTIONRATE, TOTALAMOUNT , ADVANCEAMOUNT , DEDUCTIONAMOUNT , NETFREIGHTAMOUNT ,',
    '                TDSALREADYDEDUCTEDON , rate, tdsamount, freightdeductionamount ',
    '                from freightadvicedetail',
    '                where tno = :P199_TNO',
    '    )',
    '    loop   ',
    '    Select Round(Sum(b.totalamount)/Sum(b.quantity1),2) INTO PDeductionRate',
    '        From ccinvoice a, CcinvoiceDetail b',
    '        Where a.tno = b.tno',
    '          And a.tno in ( select moduletno from FreightAdviceDetail where tno = i.TNO and sno = i.sno);',
    '          ',
    ' pCHALANQUANTITY1         :=    round(i.CHALANQUANTITY1,getuomdecimal(i.RATEMEASURINGUNITCODE) );',
    ' ptoleranceqty            :=    (i.CHALANQUANTITY1 * getmyparametervalue(''WEIGHTTOLERANCEINPERCENT''))/100 ;',
    '',
    ' pREACHEDQUANTITY1        :=    round(i.REACHEDQUANTITY1,getuomdecimal(i.RATEMEASURINGUNITCODE) );',
    ' pSHORTAGEQUANTITY1        :=	nvl(i.CHALANQUANTITY1,0)-nvl(i.REACHEDQUANTITY1,0) ;',
    '',
    ' if pSHORTAGEQUANTITY1 < ptoleranceqty then',
    '    pSHORTAGEQUANTITY1        := 0;',
    '',
    ' else',
    '    pSHORTAGEQUANTITY1        :=	nvl(i.CHALANQUANTITY1,0)-nvl(i.REACHEDQUANTITY1,0) ;',
    '    pSHORTAGEQUANTITY1        := round(pSHORTAGEQUANTITY1,getuomdecimal(i.RATEMEASURINGUNITCODE) );',
    '',
    ' end if;',
    'pQUANTITY1               :=    nvl(i.QUANTITY1,0);',
    'pQUANTITY1               :=    round(pQUANTITY1 ,getuomdecimal(i.RATEMEASURINGUNITCODE) );',
    'pBilledtotalAmount       :=     nvl(pQUANTITY1,0)*nvl(i.RATE,0);',
    'pAMOUNT				     :=    nvl(pBilledtotalAmount,0) + nvl(i.freightdeductionamount,0);',
    ':P199_DFAMOUNT           :=    pAMOUNT;',
    ':P199_DFAMOUNT_1         :=    pAMOUNT;',
    'pTOTALAMOUNT             :=    nvl(pAMOUNT,0) + nvl(i.FOOTERAMOUNT,0);',
    'pDEDUCTIONAMOUNT         :=  nvl(pSHORTAGEQUANTITY1,0)*NVL(PDeductionRate,0);',
    'pNETFREIGHTAMOUNT        := nvl(pTOTALAMOUNT,0)-nvl(i.ADVANCEAMOUNT,0)-nvl(pDEDUCTIONAMOUNT,0) - nvl(i.tdsamount,0);',
    'pNETPAYABLEAMOUNT        := pNETFREIGHTAMOUNT ;',
    'pTDSDEDUCTABLEAMOUNT     := NVL(pAMOUNT,0) - NVL(i.TDSALREADYDEDUCTEDON,0) -nvl(pDEDUCTIONAMOUNT,0);',
    'pFooterAmount            := nvl(i.footeramount,0);',
    'ptdsamount               := nvl(i.tdsamount,0);',
    '',
    'update freightadvicedetail',
    'set CHALANQUANTITY1             = pCHALANQUANTITY1,',
    '    SHORTAGEQUANTITY1           = pSHORTAGEQUANTITY1,',
    '    REACHEDQUANTITY1            = pREACHEDQUANTITY1,',
    '    QUANTITY1                   = pQUANTITY1,',
    '    AMOUNT                      = pAMOUNT,',
    '    FOOTERAMOUNT                = PFooterAmount,',
    '    TOTALAMOUNT                 = pTOTALAMOUNT,',
    '    DEDUCTIONRATE               = PDeductionRate,',
    '    DEDUCTIONAMOUNT             = pDEDUCTIONAMOUNT,',
    '    NETFREIGHTAMOUNT            = pNETFREIGHTAMOUNT,',
    '    NETPAYABLEAMOUNT            = pNETPAYABLEAMOUNT,',
    '    TDSDEDUCTABLEAMOUNT         = pTDSDEDUCTABLEAMOUNT',
    'where tno = :P199_TNO',
    'and sno = i.sno;',
    '',
    '',
    '    end loop;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118148211866887663)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>130
,p_execute_on_page_init=>'N'
,p_name=>'set all other amounts'
,p_static_id=>'set-all-other-amounts-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO,P199_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    pCHALANQUANTITY1 number;',
    '    pSHORTAGEQUANTITY1 number;',
    '    pREACHEDQUANTITY1 number;',
    '    pQUANTITY1 number;',
    '    pAMOUNT number;',
    '    pTOTALAMOUNT number;',
    '    pDEDUCTIONAMOUNT number;',
    '    pNETFREIGHTAMOUNT number;',
    '    pNETPAYABLEAMOUNT number;',
    '    pTDSDEDUCTABLEAMOUNT number;',
    '    pFooterAmount        number;',
    '    ptolerancepercent number;',
    '    ptoleranceqty number;',
    '    PDeductionRate Number;',
    '    pPassQuantity Number;',
    '    pTDSAmount Number;',
    '    pbilledtotalamount number;',
    '    pfreightdeductionamount number;',
    '',
    'begin  ',
    'if :P199_DOCTYPECODE=''CCINVOICE'' then',
    '    Select Round(Sum(a.ccinvoiceamount)/Sum(b.quantity1),2) INTO PDeductionRate',
    '        From ccinvoice a, CcinvoiceDetail b',
    '        Where a.tno = b.tno',
    '          And a.tno in ( select moduletno from FreightAdviceDetail where tno = :P199_TNO)',
    '          ;',
    ' ',
    'end if;',
    'for i in (',
    'select a.tno , a.sno , a.CHALANQUANTITY1 , a.RATEMEASURINGUNITCODE , a.REACHEDQUANTITY1 , a.SHORTAGEQUANTITY1 , a.QUANTITY1 ,',
    '        a.AMOUNT , a.FOOTERAMOUNT  , a.DEDUCTIONRATE, a.TOTALAMOUNT , a.ADVANCEAMOUNT , a.DEDUCTIONAMOUNT , a.NETFREIGHTAMOUNT ,',
    '        a.TDSALREADYDEDUCTEDON , a.rate, a.tdsamount, a.billedtotalamount,a.freightdeductionamount',
    '        from freightadvicedetail a',
    '        where a.tno = :P199_TNO',
    '    ) loop   ',
    'SELECT SUM(FOOTERVALUE) INTO ptdsamount',
    '  FROM FREIGHTADVICEDETAILTDS',
    ' WHERE TNO = :P199_TNO',
    '   AND SNO = i.SNO;',
    '',
    'Select Round(Sum(b.totalamount)/Sum(b.quantity1),2) INTO PDeductionRate',
    '    From ccinvoice a, CcinvoiceDetail b',
    '    Where a.tno = b.tno',
    '      And a.tno in ( select moduletno from FreightAdviceDetail where tno = i.TNO and sno = i.sno)',
    '      ;',
    '',
    '',
    ' pCHALANQUANTITY1         :=    round(i.CHALANQUANTITY1,getuomdecimal(i.RATEMEASURINGUNITCODE) );',
    ' ptoleranceqty            :=    (i.CHALANQUANTITY1 * getmyparametervalue(''WEIGHTTOLERANCEINPERCENT''))/100 ;',
    '',
    ' pREACHEDQUANTITY1        :=    round(i.REACHEDQUANTITY1,getuomdecimal(i.RATEMEASURINGUNITCODE) );',
    ' pSHORTAGEQUANTITY1        :=	nvl(i.CHALANQUANTITY1,0)-nvl(i.REACHEDQUANTITY1,0) ;',
    '',
    ' if pSHORTAGEQUANTITY1 < ptoleranceqty then',
    '    pSHORTAGEQUANTITY1        := 0;',
    '',
    ' else',
    '    pSHORTAGEQUANTITY1        :=	nvl(i.CHALANQUANTITY1,0)-nvl(i.REACHEDQUANTITY1,0) ;',
    '    pSHORTAGEQUANTITY1        := round(pSHORTAGEQUANTITY1,getuomdecimal(i.RATEMEASURINGUNITCODE) );',
    '',
    ' end if;',
    'pQUANTITY1               :=    nvl(i.QUANTITY1,0);',
    'pQUANTITY1               :=    round(pQUANTITY1 ,getuomdecimal(i.RATEMEASURINGUNITCODE) );',
    'pbilledtotalamount       :=    nvl(pQUANTITY1,0)*nvl(i.RATE,0) ;',
    'pAMOUNT				     :=    nvl(pbilledtotalamount,0) + nvl(i.freightdeductionamount,0);',
    ':P199_DFAMOUNT           :=    pAMOUNT;',
    ':P199_DFAMOUNT_1           :=    pAMOUNT;',
    'pTOTALAMOUNT             :=    nvl(pAMOUNT,0) + nvl(i.FOOTERAMOUNT,0);',
    'pDEDUCTIONAMOUNT      :=  nvl(pSHORTAGEQUANTITY1,0)*NVL(PDeductionRate,0);',
    'pNETFREIGHTAMOUNT     := nvl(pTOTALAMOUNT,0)-nvl(i.ADVANCEAMOUNT,0)-nvl(pDEDUCTIONAMOUNT,0) - nvl(ptdsamount,0);',
    'pNETPAYABLEAMOUNT      := pNETFREIGHTAMOUNT ;',
    'pTDSDEDUCTABLEAMOUNT   := NVL(pAMOUNT,0) - NVL(i.TDSALREADYDEDUCTEDON,0) -nvl(pDEDUCTIONAMOUNT,0);',
    'pFooterAmount          := nvl(i.footeramount,0);',
    '',
    'update freightadvicedetail',
    'set CHALANQUANTITY1             = pCHALANQUANTITY1,',
    '    SHORTAGEQUANTITY1           = pSHORTAGEQUANTITY1,',
    '    REACHEDQUANTITY1            = pREACHEDQUANTITY1,',
    '    QUANTITY1                   = pQUANTITY1,',
    '    BILLEDTOTALAMOUNT           = nvl(pQUANTITY1,0)*nvl(i.RATE,0),',
    '    AMOUNT                      = pAMOUNT,',
    '    FOOTERAMOUNT                = PFooterAmount,',
    '    TOTALAMOUNT                 = pTOTALAMOUNT,',
    '    DEDUCTIONRATE               = PDeductionRate,',
    '    DEDUCTIONAMOUNT             = pDEDUCTIONAMOUNT,',
    '    NETFREIGHTAMOUNT            = pNETFREIGHTAMOUNT,',
    '    NETPAYABLEAMOUNT            = pNETPAYABLEAMOUNT,',
    '    TDSDEDUCTABLEAMOUNT         = pTDSDEDUCTABLEAMOUNT',
    'where tno = :P199_TNO',
    'and sno = i.sno;',
    '',
    '',
    '    end loop;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118149123807887663)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set details'
,p_static_id=>'set-details'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO,P199_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    pfr number;',
    '    pfa number;',
    '    pfaa number;',
    '    pae number;',
    '    ptds number;',
    '    pfu varchar2(30);',
    '    pfrtdeductionamount number;',
    'begin',
    '    for i in (',
    '                select tno , sno , moduletno ',
    '                from freightadvicedetail',
    '                where tno = :P199_TNO',
    '',
    '    )',
    '    loop  ',
    '        select fr , fa , fu , faa into pfr , pfa , pfu , pfaa from ',
    '        (',
    '            select FREIGHTRATE fr, FREIGHTAMOUNT fa , GetMeasuringUnitName(FREIGHTUNITCODE) fu , FREIGHTADVANCEAMOUNT faa from grn',
    '            where tno = i.MODULETNO',
    '            union all',
    '            select FREIGHTRATE fr , null fa  , GetMeasuringUnitName(FREIGHTUNITCODE) fu , FREIGHTADVANCE faa from ccinvoice',
    '            where tno = i.MODULETNO',
    '            union all',
    '            select FREIGHTRATE fr , null fa ,GetMeasuringUnitName(FREIGHTUNITCODE) fu , null faa  from gatepass',
    '            where tno = i.MODULETNO',
    '        );',
    '',
    '        select sum(FRTDEDUCTIONAMOUNT) into pfrtdeductionamount from salesgrn ',
    '        where ccinvoicetno = i.moduletno;',
    '',
    '',
    '        update freightadvicedetail set  RATE = pfr ,',
    '                                        BILLEDTOTALAMOUNT = pfa,',
    '                                        AMOUNT = pfa + nvl(pfrtdeductionamount,0),',
    '                                        RATEMEASURINGUNITCODE = pfu ,',
    '                                        ADVANCEAMOUNT = pfaa,',
    '                                        freightdeductionamount = pfrtdeductionamount',
    '        where tno = :P199_TNO',
    '        and sno = i.sno;',
    '         ',
    '        if :P199_DOCTYPECODE = ''GRN'' then',
    '',
    '            Select Sum(nvl(a.AMOUNTENTERED, 0)) , Sum(b.tdsdeductableamount) into pae , ptds',
    '              From paymentadvicereference a,',
    '                   (Select aa.tno, Sum(aa.tdsdeductableamount) tdsdeductableamount',
    '                      From paymentadvicereference aa, paymentadvicedetail bb',
    '                     Where bb.footervalue > 0',
    '                       And aa.tno = bb.tno',
    '                     Group By aa.tno) b',
    '             Where a.tno = b.tno(+)',
    '               And a.REFERENCEMODULETNO In',
    '                   (Select loadingadvicetno From grn Where tno = :moduletno)',
    '               And getdocumentstatuscode(''PAYMENTADVICE'', a.tno) = ''ACTIVE'';',
    '',
    '',
    '            update freightadvicedetail set ADVANCEAMOUNT = pae ,TDSALREADYDEDUCTEDON = ptds',
    '            where tno = :P199_TNO',
    '            and sno = i.sno;',
    ' ',
    '        end if;',
    '',
    '        commit;',
    '',
    '    end loop;',
    '',
    'end ;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118152156679887665)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_name=>'set P199_SUMOFNETPAYABLEAMOUNT'
,p_static_id=>'set-p199-sumofnetpayableamount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFNETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_SUMOFAMOUNT,P199_SUMOFFOOTERAMOUNT,P199_SUMOFTDSAMOUNT,P199_SUMOFADVANCEAMOUNT,P199_SUMOFDEDUCTIONAMOUNT',
  'sql_query', 'SELECT nvl(:P199_SUMOFAMOUNT,0) + NVL(:P199_SUMOFFOOTERAMOUNT,0) - ( NVL(:P199_SUMOFTDSAMOUNT,0) + NVL(:P199_SUMOFADVANCEAMOUNT,0) + NVL(:P199_SUMOFDEDUCTIONAMOUNT,0)) AS AMT FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118151696786887665)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'set P199_TDSDEDUCTABLEAMOUNT'
,p_static_id=>'set-p199-tdsdeductableamount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TDSDEDUCTABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TNO',
  'sql_query', 'select sum(tdsdeductableamount) from freightadvicedetail where tno = :P199_TNO ',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118149678553887663)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'set sac code'
,p_static_id=>'set-sac-code'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SACCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_REVERSECHARGEIFAPPLICABLE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'rtvalue varchar2(30);',
    'begin',
    'if :P199_REVERSECHARGEIFAPPLICABLE = ''YES'' then',
    '        select saccode into rtvalue from jobtype ',
    '         where JOBTYPECODE in ',
    '         (''TRANSPORTATIONRCM'');',
    '   else',
    '     select saccode into rtvalue from jobtype ',
    '         where JOBTYPECODE in ',
    '         (''TRANSPORTATION'');',
    '   end if;',
    '   return(rtvalue);',
    'end ;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118151198269887665)
,p_event_id=>wwv_flow_imp.id(118146683937887662)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'set summary_'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFAMOUNT,P199_SUMOFFOOTERAMOUNT,P199_SUMOFDEDUCTIONAMOUNT,P199_SUMOFADVANCEAMOUNT,P199_SUMOFNETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(sum(amount),0) , nvl(sum(FOOTERAMOUNT),0) , nvl(sum(DEDUCTIONAMOUNT),0) ,',
    '        nvl(sum(ADVANCEAMOUNT),0) , nvl(sum(NETPAYABLEAMOUNT),0)',
    '        from freightadvicedetail',
    'where tno = :P199_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118062323087887626)
,p_name=>'Print Slip'
,p_static_id=>'print-slip'
,p_event_sequence=>257
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118034574880887608)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118062916361887626)
,p_event_id=>wwv_flow_imp.id(118062323087887626)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118071942304887630)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>297
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118033738964887608)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118072500269887630)
,p_event_id=>wwv_flow_imp.id(118071942304887630)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118157626053887668)
,p_name=>'set amount after change roundoff'
,p_static_id=>'set-amount-after-change-roundoff'
,p_event_sequence=>867
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_FREIGHTAMOUNTBEFOREROUND,P199_BILLINROUNDFIGURE'
,p_condition_element=>'P199_BILLINROUNDFIGURE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'YES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118158176488887668)
,p_event_id=>wwv_flow_imp.id(118157626053887668)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFNETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_FREIGHTAMOUNTBEFOREROUND,P199_ROUNDOFF',
  'plsql_expression', 'NVL(:P199_FREIGHTAMOUNTBEFOREROUND,0) + NVL(:P199_ROUNDOFF,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118158692326887668)
,p_event_id=>wwv_flow_imp.id(118157626053887668)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_SUMOFNETPAYABLEAMOUNT,P199_FREIGHTAMOUNTBEFOREROUND',
  'plsql_expression', 'NVL(:P199_SUMOFNETPAYABLEAMOUNT,0) - NVL(:P199_FREIGHTAMOUNTBEFOREROUND,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118046919345887619)
,p_name=>'set amount after change roundoff_1'
,p_static_id=>'set-amount-after-change-roundoff-2'
,p_event_sequence=>877
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_FREIGHTAMOUNTBEFOREROUND,P199_BILLINROUNDFIGURE'
,p_condition_element=>'P199_BILLINROUNDFIGURE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'NO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118047394790887619)
,p_event_id=>wwv_flow_imp.id(118046919345887619)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFNETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_FREIGHTAMOUNTBEFOREROUND',
  'plsql_expression', 'NVL(:P199_FREIGHTAMOUNTBEFOREROUND,0) ',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118047873670887619)
,p_event_id=>wwv_flow_imp.id(118046919345887619)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_SUMOFNETPAYABLEAMOUNT,P199_FREIGHTAMOUNTBEFOREROUND',
  'plsql_expression', '0',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118136982669887657)
,p_name=>'Set Cr Account'
,p_static_id=>'set-cr-account'
,p_event_sequence=>757
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_TRANSPORTERCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118137455174887658)
,p_event_id=>wwv_flow_imp.id(118136982669887657)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_CREDITACCOUNTCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TRANSPORTERCODE',
  'plsql_expression', ':P199_TRANSPORTERCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118126968993887652)
,p_name=>'set decimal chalan qty1_1'
,p_static_id=>'set-decimal-chalan-qty'
,p_event_sequence=>697
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'CHALANQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118127488982887654)
,p_event_id=>wwv_flow_imp.id(118126968993887652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CHALANQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'CHALANQUANTITY1,RATEMEASURINGUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:CHALANQUANTITY1,getuomdecimal(:RATEMEASURINGUNITCODE) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118123408438887652)
,p_name=>'set decimal qty1'
,p_static_id=>'set-decimal-qty'
,p_event_sequence=>657
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118123886195887652)
,p_event_id=>wwv_flow_imp.id(118123408438887652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATEMEASURINGUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:QUANTITY1 ,getuomdecimal(:RATEMEASURINGUNITCODE) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118125178895887652)
,p_name=>'set decimal reached qty1'
,p_static_id=>'set-decimal-reached-qty'
,p_event_sequence=>677
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'REACHEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118125705002887652)
,p_event_id=>wwv_flow_imp.id(118125178895887652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'REACHEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'REACHEDQUANTITY1,RATEMEASURINGUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:REACHEDQUANTITY1,getuomdecimal(:RATEMEASURINGUNITCODE) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118126037945887652)
,p_name=>'set decimal received qty1'
,p_static_id=>'set-decimal-received-qty'
,p_event_sequence=>687
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'RECEIVEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118126543649887652)
,p_event_id=>wwv_flow_imp.id(118126037945887652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RECEIVEDQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'RECEIVEDQUANTITY1,RATEMEASURINGUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:RECEIVEDQUANTITY1,getuomdecimal(:RATEMEASURINGUNITCODE) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118124296666887652)
,p_name=>'set decimal shortage qty1'
,p_static_id=>'set-decimal-shortage-qty'
,p_event_sequence=>667
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'SHORTAGEQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118124754155887652)
,p_event_id=>wwv_flow_imp.id(118124296666887652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SHORTAGEQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SHORTAGEQUANTITY1,RATEMEASURINGUNITCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  round(:SHORTAGEQUANTITY1,getuomdecimal(:RATEMEASURINGUNITCODE) ) ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118116627145887649)
,p_name=>'Set details'
,p_static_id=>'set-details'
,p_event_sequence=>627
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'MODULETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118118175738887649)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'get tds'
,p_static_id=>'get-tds'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '',
    '    var button = document.getElementById(''GetTDS'');',
    '    button.click();')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118119161073887649)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(525978891853570222)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118119688669887651)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE,AMOUNT,RATEMEASURINGUNITCODE,ADVANCEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'MODULETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select FREIGHTRATE, FREIGHTAMOUNT , GetMeasuringUnitName(FREIGHTUNITCODE) , FREIGHTADVANCEAMOUNT from grn',
    'where tno = :MODULETNO',
    'union all',
    'select FREIGHTRATE , null , GetMeasuringUnitName(FREIGHTUNITCODE) , FREIGHTADVANCE from ccinvoice',
    'where tno = :MODULETNO',
    'union all',
    'select FREIGHTRATE , null ,GetMeasuringUnitName(FREIGHTUNITCODE) , null  from gatepass',
    'where tno = :MODULETNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118120150831887651)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ADVANCEAMOUNT,TDSALREADYDEDUCTEDON'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'MODULETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select Sum(nvl(a.AMOUNTENTERED, 0)), Sum(b.tdsdeductableamount)',
    '  From paymentadvicereference a,',
    '       (Select aa.tno, Sum(aa.tdsdeductableamount) tdsdeductableamount',
    '          From paymentadvicereference aa, paymentadvicedetail bb',
    '         Where bb.footervalue > 0',
    '           And aa.tno = bb.tno',
    '         Group By aa.tno) b',
    ' Where a.tno = b.tno(+)',
    '   And a.REFERENCEMODULETNO In',
    '       (Select loadingadvicetno From grn Where tno = :moduletno)',
    '   And getdocumentstatuscode(''PAYMENTADVICE'', a.tno) = ''ACTIVE''',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P199_DOCTYPECODE'
,p_client_condition_expression=>'GRN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118118683105887649)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFNETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_SUMOFAMOUNT,P199_SUMOFFOOTERAMOUNT,P199_SUMOFTDSAMOUNT,P199_SUMOFADVANCEAMOUNT,P199_SUMOFDEDUCTIONAMOUNT',
  'sql_query', 'SELECT nvl(:P199_SUMOFAMOUNT,0) + NVL(:P199_SUMOFFOOTERAMOUNT,0) - ( NVL(:P199_SUMOFTDSAMOUNT,0) + NVL(:P199_SUMOFADVANCEAMOUNT,0) + NVL(:P199_SUMOFDEDUCTIONAMOUNT,0)) AS AMT FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118117127870887649)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set amounts'
,p_static_id=>'set-amounts'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'SHORTAGEQUANTITY1,CHALANQUANTITY1,QUANTITY1,AMOUNT,P199_DFAMOUNT,TOTALAMOUNT,P199_TDSDEDUCTABLEAMOUNT,FOOTERAMOUNT,DEDUCTIONAMOUNT,NETFREIGHTAMOUNT,NETPAYABLEAMOUNT,TDSDEDUCTABLEAMOUNT',
  'items_to_submit', 'TNO,SNO,MODULECODE,MODULETNO,CHALANQUANTITY1,REACHEDQUANTITY1,RATEMEASURINGUNITCODE,QUANTITY1,RATE,FOOTERAMOUNT,TOTALAMOUNT,P199_SACCODE,P199_REVERSECHARGEIFAPPLICABLE,P199_TRANSPORTERCODE,P199_TRANSACTIONTYPECODE,DEDUCTIONRATE,ADVANCEAMOUNT,DEDUCTIO'
||'NAMOUNT,TDSALREADYDEDUCTEDON',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp           number;',
    '	tfootervalue  number;',
    '	tfooteramount number;',
    'begin',
    '    :CHALANQUANTITY1         :=    round(:CHALANQUANTITY1,getuomdecimal(:RATEMEASURINGUNITCODE) );',
    '	:SHORTAGEQUANTITY1       :=	nvl(:CHALANQUANTITY1,0)-nvl(:REACHEDQUANTITY1,0) ;',
    '    :SHORTAGEQUANTITY1       := round(:SHORTAGEQUANTITY1,getuomdecimal(:RATEMEASURINGUNITCODE) );',
    '	:REACHEDQUANTITY1        :=    round(:REACHEDQUANTITY1,getuomdecimal(:RATEMEASURINGUNITCODE) );',
    '	:QUANTITY1               :=    nvl(:REACHEDQUANTITY1,0);',
    '	:QUANTITY1               :=    round(:QUANTITY1 ,getuomdecimal(:RATEMEASURINGUNITCODE) );',
    '	:AMOUNT				     :=    nvl(:QUANTITY1,0)*nvl(:RATE,0);',
    '	:P199_DFAMOUNT           :=    :AMOUNT;',
    '    :P199_DFAMOUNT_1           :=    :AMOUNT;',
    '	:TOTALAMOUNT             :=    nvl(:AMOUNT,0) + nvl(:FOOTERAMOUNT,0);',
    '	:DEDUCTIONAMOUNT      :=  nvl(:SHORTAGEQUANTITY1,0)*NVL(:DEDUCTIONRATE,0);',
    '    :NETFREIGHTAMOUNT     := nvl(:TOTALAMOUNT,0)-nvl(:ADVANCEAMOUNT,0)-nvl(:DEDUCTIONAMOUNT,0);',
    '    :NETPAYABLEAMOUNT      := :NETFREIGHTAMOUNT ;',
    '    :TDSDEDUCTABLEAMOUNT   := NVL(:AMOUNT,0) - NVL(:TDSALREADYDEDUCTEDON,0);',
    '	---- INSERT INTO FOOTER DETAIL',
    '    select count(*) into tmp',
    '	  from FREIGHTADVICEDETAILFOOTER',
    '    WHERE TNO = :TNO AND SNO = :SNO;',
    '			  ',
    '    if nvl(:AMOUNT,0) > 0 and nvl(:P199_REVERSECHARGEIFAPPLICABLE,''NO'') = ''NO'' and nvl(tmp,0) = 0 then',
    '          /* DELETE FROM FREIGHTADVICEDETAILFOOTER WHERE TNO = :TNO AND SNO = :SNO;',
    '',
    '            for vTaxRule',
    '				in (',
    '					select',
    '						rownum as slno,',
    '						b.TNo,',
    '						b.SNO,',
    '						a.LegendsCode,',
    '						c.FooterHeadCode,',
    '						c.FooterHeadName,',
    '						b.TaxRate as FooterPercent,',
    '                        (:AMOUNT * B.TAXrATE) /100 AS FooterValue',
    '					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRulesac e, party F',
    '					where a.TNO = b.TNo',
    '						and a.SNO = b.SNo',
    '						and b.FooterHeadCode = c.FooterHeadCode',
    '						and a.TNO = d.TNo',
    '                        and d.tno = e.tno',
    '                        and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                        and f.PartyCode = :P199_TRANSPORTERCODE',
    '                        And d.transactiontypecode = :P199_TRANSACTIONTYPECODE',
    '                        and e.SACCODE = :P199_SACCODE',
    '				)',
    '			loop      ',
    '			    Insert into FREIGHTADVICEDETAILFOOTER',
    '                (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '				values',
    '                (:TNO,:SNO,Globaltno.NextVal,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '			',
    '			end loop; -- for vTaxRule',
    '            commit;',
    '    else',
    '			for vfooter in (',
    '			Select * From FREIGHTADVICEDETAILFOOTER a where tno = :TNO and SNO = :SNO',
    '		 ) loop',
    '',
    '			if vfooter.legendscode = ''PRA'' then ',
    '				tfootervalue := round((:amount * vfooter.footerpercent ) /100,0);',
    '			end if;',
    '',
    '			if vfooter.legendscode = ''PRD'' then ',
    '				tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,0);',
    '',
    '			end if;',
    '			if vfooter.legendscode = ''PAA'' then ',
    '				tfootervalue := round((:amount * vfooter.footerpercent ) /100,2);',
    '			end if;',
    '',
    '			if vfooter.legendscode = ''PAD'' then ',
    '				tfootervalue := (-1)* round((:amount * vfooter.footerpercent ) /100,2);',
    '			end if;',
    '			 DELETE FROM FREIGHTADVICEDETAILFOOTER X',
    '			  where x.tno = vfooter.tno',
    '			    and x.sno = vfooter.sno',
    '			    and x.sn = vfooter.sn',
    '			    and x.footerheadcode = vfooter.Footerheadcode',
    '			   ;',
    '',
    '			  INSERT INTO FREIGHTADVICEDETAILFOOTER ( TNO,SNO,SN,SERIALNO,FOOTERHEADCODE,FOOTERPERCENT,LEGENDSCODE,FOOTERVALUE)',
    '			  VALUES ( VFOOTER.TNO,VFOOTER.SNO,VFOOTER.SN,VFOOTER.SERIALNO,VFOOTER.FOOTERHEADCODE,VFOOTER.FOOTERPERCENT,VFOOTER.LEGENDSCODE,TFOOTERVALUE);',
    ' 	 ',
    '     ',
    '     end loop;',
    '     */',
    '     null;',
    '	end if;',
    '   ----',
    '  /* select sum(footervalue) into tfooteramount ',
    '	 from FREIGHTADVICEDETAILFOOTER ',
    '	 where tno = :tno',
    '	   and sno = :sno;',
    '	   ',
    '	   :FooterAmount := nvl(tfooteramount,0);',
    '	   :totalamount  := nvl(:Amount,0) + nvl(:FooterAmount,0);   ',
    '	*/',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118121174281887651)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'set sac for cinvoice'
,p_static_id=>'set-sac-for-cinvoice'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SACCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'MODULETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select saccode from jobtype ',
    ' where JOBTYPECODE in ',
    ' (''TRANSPORTATION'')',
    ' ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P199_DOCTYPECODE'
,p_client_condition_expression=>'CCINVOICE'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118120711955887651)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set sac for grn'
,p_static_id=>'set-sac-for-grn'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SACCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_REVERSECHARGEIFAPPLICABLE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '   rtvalue varchar2(30);',
    'begin',
    '  if :P199_REVERSECHARGEIFAPPLICABLE = ''YES'' then',
    '        select saccode into rtvalue from jobtype ',
    '         where JOBTYPECODE in ',
    '         (''TRANSPORTATIONRCM'');',
    '   else',
    '     select saccode into rtvalue from jobtype ',
    '         where JOBTYPECODE in ',
    '         (''TRANSPORTATION'');',
    '   end if;',
    '',
    '   return rtvalue;',
    ' end ;',
    ' ')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P199_DOCTYPECODE'
,p_client_condition_expression=>'GRN'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118117670440887649)
,p_event_id=>wwv_flow_imp.id(118116627145887649)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'let model = apex.region("Detail_Region").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    'let deductionamount_total = 0;',
    'let advanceamount_total = 0;',
    'let netpaybleamount_total = 0;',
    'let tdsdeductableamount_total  = 0;',
    'model.forEach(function(record, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '    ',
    '    if (model.getValue(record, "AMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        amount_total += Number(model.getValue(record, "AMOUNT"));',
    '    }',
    '   ',
    '    if (model.getValue(record, "FOOTERAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        footeramount_total += Number(model.getValue(record, "FOOTERAMOUNT"));',
    '    }',
    '    if (model.getValue(record, "TOTALAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        totalamount_total += Number(model.getValue(record, "TOTALAMOUNT"));',
    '    }',
    '	',
    '	if (model.getValue(record, "DEDUCTIONAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        deductionamount_total += Number(model.getValue(record, "DEDUCTIONAMOUNT"));',
    '    }',
    '	',
    '	if (model.getValue(record, "ADVANCEAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        advanceamount_total += Number(model.getValue(record, "ADVANCEAMOUNT"));',
    '    }',
    '	',
    '	if (model.getValue(record, "NETPAYABLEAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        netpaybleamount_total += Number(model.getValue(record, "NETPAYABLEAMOUNT"));',
    '    }',
    '',
    '    if (model.getValue(record, "TDSDEDUCTABLEAMOUNT") !== "" && !meta.deleted && !meta.agg) {',
    '        tdsdeductableamount_total += Number(model.getValue(record, "TDSDEDUCTABLEAMOUNT"));',
    '    }',
    '',
    '}',
    ');',
    '',
    '',
    '$s(''P199_SUMOFAMOUNT'',amount_total);',
    '$s(''P199_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '',
    '$s(''P199_SUMOFDEDUCTIONAMOUNT'',deductionamount_total);',
    '$s(''P199_SUMOFADVANCEAMOUNT'',advanceamount_total);',
    '//$s(''P199_TDSDEDUCTABLEAMOUNT'',tdsdeductableamount_total);',
    '',
    '$s(''P199_SUMOFNETPAYABLEAMOUNT'',netpaybleamount_total);',
    '',
    '$s(''P199_freightamountbeforeround'',netpaybleamount_total);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118138809263887658)
,p_name=>'set df amount if INCLUDEWITHTAXABLEAMOUNT is yes'
,p_static_id=>'set-df-amount-if-includewithtaxableamount-is-yes'
,p_event_sequence=>777
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(525978891853570222)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118139254773887658)
,p_event_id=>wwv_flow_imp.id(118138809263887658)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_DFAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_DFAMOUNT,FOOTERVALUE',
  'plsql_expression', ':P199_DFAMOUNT + :footervalue',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'INCLUDEWITHTAXABLEAMOUNT'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118110296986887646)
,p_name=>'Set DFAMOUNT'
,p_static_id=>'set-dfamount'
,p_event_sequence=>567
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118110816632887646)
,p_event_id=>wwv_flow_imp.id(118110296986887646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_DFAMOUNT_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT',
  'sql_query', 'select :AMOUNT from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118077442233887632)
,p_name=>'Set doctype column'
,p_static_id=>'set-doctype-column'
,p_event_sequence=>347
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_DOCTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118077939821887632)
,p_event_id=>wwv_flow_imp.id(118077442233887632)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var grid = apex.region("Detail_Region").widget().interactiveGrid("getViews", "grid");',
    'var model = grid.model;',
    'var record = model.getSelectedRecords();',
    '',
    'record[0].set("DOCTYPE", $v("P199_DOCTYPECODE"));',
    'model.save();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118137907926887658)
,p_name=>'set focus'
,p_static_id=>'set-focus'
,p_event_sequence=>767
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_FREIGHTADVICEDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118138397499887658)
,p_event_id=>wwv_flow_imp.id(118137907926887658)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TRANSPORTERCODE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 FROM CODESCHEME A',
'WHERE A.MODULECODE = getmodulecodeforpageno(:APP_PAGE_ID)',
'AND CODESCHEME=''AUTO'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118113935006887647)
,p_name=>'Set Footer and Total Amount'
,p_static_id=>'set-footer-and-total-amount'
,p_event_sequence=>597
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'AMOUNT,FD,FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118114482693887647)
,p_event_id=>wwv_flow_imp.id(118113935006887647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_FVALUE,P199_DFAMOUNT',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:P199_FVALUE,0)+nvl(:P199_DFAMOUNT,0) as A',
    'from dual  ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118059613554887624)
,p_name=>'Set Footer Total'
,p_static_id=>'set-footer-total'
,p_event_sequence=>227
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(118020213701887599)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118060063140887624)
,p_event_id=>wwv_flow_imp.id(118059613554887624)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget = apex.region(''Detail_Region'').widget();',
    'var grid = widget.interactiveGrid("getViews", "grid");',
    'var model = grid.model;',
    '',
    '',
    '// Get the selected records',
    'var selectedRecords = grid.getSelectedRecords();',
    '',
    '// Iterate over the selected records and set a value in a specific column',
    'for (var i = 0; i < selectedRecords.length; i++) {',
    '  var record = selectedRecords[i];',
    '  var columnAlias1 = "FOOTERAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value1 = $v("P199_FVALUE"); // Replace with the new value you want to set',
    '  var columnAlias2 = "TOTALAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value2 =  (parseFloat($v("P199_FVALUE"), 10)+ parseFloat($v("P199_DFAMOUNT_1"), 10)).toString(); // Replace with the new value you want to set',
    '  ',
    '',
    '  model.setValue(record, columnAlias1, value1);',
    '  model.setValue(record, columnAlias2, value2);',
    '',
    '',
    '',
    '',
    '  if (isNaN(value2)) {',
    '         var value3 = $v("P199_TOTVALUE");',
    '         model.setValue(record, columnAlias2, value3);',
    '    }',
    '}',
    '',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118061051679887626)
,p_event_id=>wwv_flow_imp.id(118059613554887624)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' var button = document.getElementById(''GetTDS'');',
    '    button.click();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118060531448887626)
,p_event_id=>wwv_flow_imp.id(118059613554887624)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TDSDEDUCTABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_DFAMOUNT,P199_TDSDEDUCTABLEAMOUNT',
  'plsql_expression', 'nvl(:P199_DFAMOUNT,:P199_TDSDEDUCTABLEAMOUNT)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118111221124887646)
,p_name=>'Set Footer Total_1'
,p_static_id=>'set-footer-total-2'
,p_event_sequence=>577
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118111628685887646)
,p_event_id=>wwv_flow_imp.id(118111221124887646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget = apex.region(''Detail_Region'').widget();',
    'var grid = widget.interactiveGrid("getViews", "grid");',
    'var model = grid.model;',
    '',
    '',
    '// Get the selected records',
    'var selectedRecords = grid.getSelectedRecords();',
    '',
    '// Iterate over the selected records and set a value in a specific column',
    'for (var i = 0; i < selectedRecords.length; i++) {',
    '  var record = selectedRecords[i];',
    '  var columnAlias1 = "FOOTERAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value1 = $v("P199_FVALUE"); // Replace with the new value you want to set',
    '  var columnAlias2 = "TOTALAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value2 =  (parseFloat($v("P199_FVALUE"), 10)+ parseFloat($v("P199_DFAMOUNT_1"), 10)).toString(); // Replace with the new value you want to set',
    '  ',
    '',
    '  model.setValue(record, columnAlias1, value1);',
    '  model.setValue(record, columnAlias2, value2);',
    '',
    '',
    '',
    '',
    '  if (isNaN(value2)) {',
    '         var value3 = $v("P199_TOTVALUE");',
    '         model.setValue(record, columnAlias2, value3);',
    '    }',
    '}',
    '',
    '',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118112672386887647)
,p_event_id=>wwv_flow_imp.id(118111221124887646)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' var button = document.getElementById(''GetTDS'');',
    '    button.click();')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118112161553887646)
,p_event_id=>wwv_flow_imp.id(118111221124887646)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TDSDEDUCTABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_DFAMOUNT,P199_TDSDEDUCTABLEAMOUNT',
  'plsql_expression', 'nvl(:P199_DFAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118088481596887637)
,p_name=>'Set Include With Taxable Amount'
,p_static_id=>'set-include-with-taxable-amount'
,p_event_sequence=>397
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(525978891853570222)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118088948334887637)
,p_event_id=>wwv_flow_imp.id(118088481596887637)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INCLUDEWITHTAXABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERHEADCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '      IncludewithtaxableAmount',
    'From  FOOTERhead',
    'Where FooterHeadCode = :FOOTERHEADCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118089428385887637)
,p_event_id=>wwv_flow_imp.id(118088481596887637)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'INCLUDEWITHTAXABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERHEADCODE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin ',
    '    if :footerheadcode in (''.IGST.'',''.CGST.'',''.SGST.'') then ',
    '        return ''NO'';',
    '    else',
    '        return ''YES'';',
    '    end if;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118141616318887660)
,p_name=>'set net pay column'
,p_static_id=>'set-net-pay-column'
,p_event_sequence=>797
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118142065349887660)
,p_event_id=>wwv_flow_imp.id(118141616318887660)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'NETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_DFAMOUNT,P199_TOTALTDSPERCENT,TOTALAMOUNT',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select   ',
    ':TOTALAMOUNT - ((:P199_DFAMOUNT*:P199_TOTALTDSPERCENT)/100)',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118114897866887647)
,p_name=>'Set Net Payable'
,p_static_id=>'set-net-payable'
,p_event_sequence=>607
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'NETFREIGHTAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118115328606887647)
,p_event_id=>wwv_flow_imp.id(118114897866887647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'NETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'NETFREIGHTAMOUNT',
  'plsql_expression', ':NETFREIGHTAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118107080586887644)
,p_name=>'set page item sno'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>537
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118107573566887644)
,p_event_id=>wwv_flow_imp.id(118107080586887644)
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
    'apex.item( "P199_SNO" ).setValue (pSNO);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118108067233887644)
,p_event_id=>wwv_flow_imp.id(118107080586887644)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno,',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "TOTALAMOUNT");',
    '',
    'apex.item( "P199_TOTVALUE" ).setValue (pSNO);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118100680746887641)
,p_name=>'set pass'
,p_static_id=>'set-pass'
,p_event_sequence=>477
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'REACHEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118101180370887643)
,p_event_id=>wwv_flow_imp.id(118100680746887641)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'REACHEDQUANTITY1',
  'sql_query', 'select nvl(:REACHEDQUANTITY1,0) FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118048226684887619)
,p_name=>'set payble after lose focus of round off'
,p_static_id=>'set-payble-after-lose-focus-of-round-off'
,p_event_sequence=>887
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_FREIGHTAMOUNTBEFOREROUND,P199_ROUNDOFF'
,p_condition_element=>'P199_BILLINROUNDFIGURE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'YES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118048775916887619)
,p_event_id=>wwv_flow_imp.id(118048226684887619)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFNETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_FREIGHTAMOUNTBEFOREROUND,P199_ROUNDOFF',
  'plsql_expression', 'NVL(:P199_FREIGHTAMOUNTBEFOREROUND,0) + NVL(:P199_ROUNDOFF,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118049234748887621)
,p_event_id=>wwv_flow_imp.id(118048226684887619)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_SUMOFNETPAYABLEAMOUNT,P199_FREIGHTAMOUNTBEFOREROUND',
  'plsql_expression', 'NVL(:P199_SUMOFNETPAYABLEAMOUNT,0) - NVL(:P199_FREIGHTAMOUNTBEFOREROUND,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118145780372887662)
,p_name=>'set selected tno'
,p_static_id=>'set-selected-tno'
,p_event_sequence=>827
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(657350730453527287)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118146265479887662)
,p_event_id=>wwv_flow_imp.id(118145780372887662)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model =apex.region("GRNSelection1").widget().interactiveGrid("getViews", "grid").model.getSelectedRecords()',
    '',
    'var extractedValues = model.map(function(record) {',
    '    return record[0];',
    '}).join('':'');',
    '',
    '$s("P199_SELECTEDGRN",extractedValues);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118050619736887621)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>20
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(525978891853570222)
,p_triggering_element=>'FOOTERPERCENT,LEGENDSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118051106096887621)
,p_event_id=>wwv_flow_imp.id(118050619736887621)
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
 p_id=>wwv_flow_imp.id(118136091027887657)
,p_name=>'set sno'
,p_static_id=>'set-sno'
,p_event_sequence=>747
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'SNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118136605778887657)
,p_event_id=>wwv_flow_imp.id(118136091027887657)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'SNO',
  'plsql_expression', ':sno',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118139670822887658)
,p_name=>'set tds'
,p_static_id=>'set-tds'
,p_event_sequence=>787
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118140706913887658)
,p_event_id=>wwv_flow_imp.id(118139670822887658)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Region").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("AMOUNT");',
    'var footerKey = model.getFieldKey("FOOTERAMOUNT");',
    'var grandtotalKey = model.getFieldKey("TDSDEDUCTABLEAMOUNT");',
    'var totalAmt = 0;',
    'var footerAmt = 0;',
    'var grandtotalAmt = 0;',
    '',
    'model.forEach(function(r, index, id) {',
    '    meta = model.getRecordMetadata(id);',
    '  var total = parseFloat(r[totalKey], 10);',
    '  var footer = parseFloat(r[footerKey], 10);',
    '  var grandtotal = parseFloat(r[grandtotalKey], 10);',
    '',
    '  if (!isNaN(total) && !meta.deleted && !meta.agg) {',
    '    totalAmt += total;',
    '  }',
    '',
    '  if (!isNaN(footer) && !meta.deleted && !meta.agg) {',
    '    footerAmt += footer;',
    '  }',
    '',
    '  if (!isNaN(grandtotal) && !meta.deleted && !meta.agg) {',
    '    grandtotalAmt += grandtotal;',
    '  }',
    '});',
    '',
    '',
    '$s("P199_TDSDEDUCTABLEAMOUNT", grandtotalAmt);',
    '',
    '',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118141137928887660)
,p_event_id=>wwv_flow_imp.id(118139670822887658)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' var button = document.getElementById(''GetTDS'');',
    '    button.click();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118140188155887658)
,p_event_id=>wwv_flow_imp.id(118139670822887658)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TDSDEDUCTABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_DFAMOUNT',
  'plsql_expression', ':P199_DFAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118085621769887635)
,p_name=>'Set TDS Payee Category Code'
,p_static_id=>'set-tds-payee-category-code'
,p_event_sequence=>387
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P199_TRANSPORTERCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118086097517887635)
,p_event_id=>wwv_flow_imp.id(118085621769887635)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TDSPAYEECATEGORYCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TRANSPORTERCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    '            a.TDSPayeeCategoryCode',
    '        from Party a',
    '        where a.PartyCode = :P199_TRANSPORTERCODE ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118086556672887637)
,p_event_id=>wwv_flow_imp.id(118085621769887635)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_PANNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TRANSPORTERCODE',
  'sql_query', 'select GetPartyAttributeValue(:P199_TRANSPORTERCODE, ''PANNO'') from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118087072115887637)
,p_event_id=>wwv_flow_imp.id(118085621769887635)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TRANSACTIONTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TRANSPORTERCODE,P199_LOCATIONCODE,P199_DOCTYPECODE,P199_COMPANYCODE,P199_FREIGHTADVICEDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    'GetTransactionTypeCodeFor(:P199_TRANSPORTERCODE , :P199_LOCATIONCODE , :P199_DOCTYPECODE , ',
    '    :P199_COMPANYCODE , :P199_FREIGHTADVICEDATE) as A   ',
    'from dual ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118087575540887637)
,p_event_id=>wwv_flow_imp.id(118085621769887635)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-4'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TDSNATURECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TRANSPORTERCODE,P199_LOCATIONCODE,P199_DOCTYPECODE,P199_COMPANYCODE,P199_FREIGHTADVICEDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select tdsnaturecode from party',
    'where partycode = :P199_TRANSPORTERCODE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118088110377887637)
,p_event_id=>wwv_flow_imp.id(118085621769887635)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-5'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TDSTAXCATEGORYCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TDSPAYEECATEGORYCODE,P199_TDSNATURECODE,P199_FREIGHTADVICEDATE',
  'sql_query', 'select GetTDSTaxCategoryCode(:P199_TDSPayeeCategoryCode, :P199_TDSNatureCode, :P199_FREIGHTADVICEDATE) from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118135171373887657)
,p_name=>'set total'
,p_static_id=>'set-total'
,p_event_sequence=>727
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'FOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118135697932887657)
,p_event_id=>wwv_flow_imp.id(118135171373887657)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'FOOTERAMOUNT,AMOUNT',
  'plsql_expression', ':FOOTERAMOUNT + :AMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118113027095887647)
,p_name=>'Set Total Amount'
,p_static_id=>'set-total-amount'
,p_event_sequence=>587
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118113607078887647)
,p_event_id=>wwv_flow_imp.id(118113027095887647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT,FOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT,FOOTERAMOUNT',
  'sql_query', 'select nvl(:AMOUNT,0) , nvl(:FOOTERAMOUNT,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118049631691887621)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(525978891853570222)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118050153820887621)
,p_event_id=>wwv_flow_imp.id(118049631691887621)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Footer").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("FOOTERVALUE");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseInt(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P199_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118099811325887641)
,p_name=>'shortage qty'
,p_static_id=>'shortage-qty'
,p_event_sequence=>467
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(469669266628009784)
,p_triggering_element=>'QUANTITY1,CHALANQUANTITY1,REACHEDQUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118100276690887641)
,p_event_id=>wwv_flow_imp.id(118099811325887641)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SHORTAGEQUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'CHALANQUANTITY1,REACHEDQUANTITY1',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:CHALANQUANTITY1,0)-nvl(:REACHEDQUANTITY1,0)',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(118127886384887654)
,p_name=>'TDS'
,p_static_id=>'tds'
,p_event_sequence=>707
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(117950851315887552)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118128365537887654)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P199_TDSPAYEECATEGORYCODE,P199_TDSTAXCATEGORYCODE,P199_PANNO,P199_TDSTHRESHOLD,P199_TDSTRANSACTIONTHRESHOLD,P199_TOTALTDSPERCENT,P199_THRESHOLDPLUSMINUS,P199_ADVANCEORBILL,P199_TDSDEDUCTABLEAMOUNT',
  'items_to_submit', 'P199_TRANSPORTERCODE,P199_TDSPAYEECATEGORYCODE,P199_TDSNATURECODE,P199_TDSTAXCATEGORYCODE,P199_PANNO,P199_COMPANYCODE,P199_FINANCIALYEARCODE,P199_THRESHOLDPLUSMINUS,P199_SUMOFAMOUNT,P199_TDSDEDUCTABLEAMOUNT,P199_TDSDEDUCTEDINADVANCE,P199_FREIGHTADVIC'
||'EDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tExpenseAmount Number;',
    '    tThisExpenseAmount Number;',
    '    tTDSAmount Number;',
    '    tTotalExpenseAmount Number;',
    'begin',
    '    for vParty in ',
    '        (',
    '        select ',
    '            a.TDSPayeeCategoryCode',
    '        from Party a',
    '        where a.PartyCode = :P199_TRANSPORTERCODE  ',
    '        )',
    '    loop ',
    '    :P199_TDSPayeeCategoryCode := vParty.TDSPayeeCategoryCode;',
    '    end loop;',
    '    --',
    '    :P199_TDSTaxCategoryCode := GetTDSTaxCategoryCode(:P199_TDSPayeeCategoryCode, :P199_TDSNatureCode, :P199_FREIGHTADVICEDATE);',
    '    :P199_PANNo := GetPartyAttributeValue(:P199_TRANSPORTERCODE , ''PANNO'');',
    '    ----',
    ' --   raise_application_error(-20000,GetTDSTaxCategoryCode(:P199_TDSPayeeCategoryCode, :P199_TDSNatureCode, :P199_FREIGHTADVICEDATE));',
    '--raise_application_error(-20000, ''TDSTaxCategoryCode : '' || :P199_TDSTaxCategoryCode || '' Panno : '' || :P199_PANNo );',
    '    ----',
    '    for vTDSTaxCategory in',
    '        (',
    '        select',
    '            b.TotalTDSPercentWithPAN,',
    '            b.TotalTDSPercentWithoutPAN,',
    '            b.Threshold,',
    '            b.TransactionThreshold',
    '        from TDSTaxCategory a, TDSTaxCategoryDetail b',
    '        where a.TNo = b.TNo ',
    '            and a.TDSTaxCategoryCode = :P199_TDSTaxCategoryCode',
    '            and b.TDSPayeeCategoryCode = :P199_TDSPayeeCategoryCode',
    '        )',
    '    loop',
    '        --',
    '        :P199_TDSThreshold := vTDSTaxCategory.Threshold;',
    '        :P199_TDSTransactionThreshold := vTDSTaxCategory.TransactionThreshold;',
    '        --',
    '        if :P199_PANNo is null then ',
    '        :P199_TotalTDSPercent := vTDSTaxCategory.TotalTDSPercentWithoutPAN;',
    '        else ',
    '        :P199_TotalTDSPercent := vTDSTaxCategory.TotalTDSPercentWithPAN;',
    '        end if;',
    '        exit;',
    '    end loop;',
    '    ----',
    '    if nvl(:P199_TDSThreshold, 0) > 0 then ',
    '        select ',
    '            sum(b.TDSAmount)',
    '            into  tTDSAmount',
    '        from Voucher a, VoucherTDSDeducted b ',
    '        where a.TNo = b.TNo ',
    '            and b.PartyCode = :P199_TRANSPORTERCODE ',
    '            and a.FinancialYearCode = :P199_FinancialYearCode',
    '            and b.TDSNatureCode = :P199_TDSNatureCode',
    '        ;',
    '    --',
    '    if nvl(tTDSAmount, 0) > 0 then ',
    '         :P199_ThresholdPlusMinus := 0;',
    '    else ',
    '        --',
    '        select ',
    '            sum(-1 * b.ThresholdPlusMinus )',
    '            into  tExpenseAmount',
    '        from Voucher a, VoucherTDSDeducted b ',
    '        where a.TNo = b.TNo ',
    '            and b.PartyCode = :P199_TRANSPORTERCODE ',
    '            and a.FinancialYearCode = :P199_FinancialYearCode',
    '            and b.ThresholdPlusMinus < 0',
    '            and b.AdvanceOrBill = ''BILL''',
    '            and b.TDSNatureCode = :P199_TDSNatureCode',
    '             and a.VoucherNo != ''OPENING''',
    '            ---------------------------',
    '        ;',
    '',
    '        tThisExpenseAmount := nvl(:P199_SumOfAmount, 0);',
    '        --',
    '        tTotalExpenseAmount := nvl(tExpenseAmount, 0) + nvl(tThisExpenseAmount, 0);',
    '        --',
    '        if nvl(tTotalExpenseAmount, 0) > nvl(:P199_TDSThreshold, 0) or  nvl(tThisExpenseAmount, 0) > nvl(:P199_TDSTransactionThreshold, 0) then ',
    '        :P199_ThresholdPlusMinus := tExpenseAmount;',
    '        else ',
    '        :P199_ThresholdPlusMinus := -1 * tThisExpenseAmount;',
    '        end if;',
    '        --',
    '        end if;  -- if nv(tTDSAmount, 0) > 0 then',
    '        --',
    '    end if; -- if nvl(:P199_TDSThreshold, 0) > 0 then ',
    '',
    '',
    '    :P199_AdvanceOrBill := ''BILL'';',
    '',
    '      ',
    '    --if :P199_TotalTDSPercent > 0 then ',
    '	--	:P199_TDSDeductableAmount := nvl(:P199_SumOfAmount, 0) + nvl(:P199_ThresholdPlusMinus, 0) - nvl(:P199_TDSDeductedInAdvance, 0) ;',
    '        --raise_application_error(-20000, ''sumofamount : '' || to_char(:P199_SumOfAmount) || '' ThresholdPlusMinus : '' || :P199_ThresholdPlusMinus || '' TDSDeductedInAdvance : '' ||:P199_TDSDeductedInAdvance );',
    '	--else ',
    '	--	:P199_TDSDeductableAmount := 0;',
    '    --end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118128887025887654)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P199_TNO,P199_TDSPAYEECATEGORYCODE,P199_COMPANYCODE,P199_FINANCIALYEARCODE,P199_TDSLOWERRATEAPPLICABLE,P199_PANNO,P199_TDSDEDUCTABLEAMOUNT,P199_TDSTAXCATEGORYCODE,P199_SUMOFTDSAMOUNT,P199_SNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '	tFooterPercent number;',
    'begin',
    '    delete freightadvicedetailtds  a',
    '    where not exists(',
    '        Select',
    '            aa.Tno',
    '        From freightadvice aa',
    '        Where aa.Tno = a.Tno',
    '        )',
    '    ;',
    '    ----',
    '	delete freightadvicedetailtds  where tno = :P199_TNO;',
    '	for vTDSMaster in',
    '    (',
    '	select',
    '		a.SNo,',
    '		a.FooterHeadCode,',
    '		b.FooterHeadName,',
    '		b.FooterPostFix,',
    '		to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithPAN, ''.CESSONTDS.'', d.CessPercentWithPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithPAN, 0)) as FooterPercentWithPAN,',
    '		to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutPAN, ''.CESSONTDS.'', d.CessPercentWithoutPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutPAN, 0)) as FooterPercentWithoutPAN',
    '	from FooterSchemeList a, FooterHead b, TDSTaxCategory c, TDSTaxCategoryDetail d',
    '	where a.FooterHeadCode = b.FooterHeadCode',
    '		and c.TNo = d.TNo',
    '		and c.TDSTaxCategoryCode = :P199_TDSTaxCategoryCode',
    '		and d.TDSPayeeCategoryCode = :P199_TDSPayeeCategoryCode',
    '		and a.FooterHeadCode in (',
    '				''.TDS.'',',
    '				''.CESSONTDS.'',',
    '				''.SURCHARGEONTDS.''',
    '		)',
    '		and a.CompanyCode = :P199_CompanyCode ',
    '		and a.FinancialYearCode = :P199_FinancialYearCode',
    '		and a.ModuleCode = ''FREIGHTADVICE''',
    '		and nvl(:P199_TDSLowerRateApplicable, ''NO'') != ''YES''',
    '	union all',
    '	select',
    '		a.SNo,',
    '		a.FooterHeadCode,',
    '		b.FooterHeadName,',
    '		b.FooterPostFix,',
    '		to_number(decode(a.FooterHeadCode, ''.TDS.'', :P199_TDSLowerRate, ''.CESSONTDS.'', :P199_CessLowerRate, ''.SURCHARGEONTDS.'', :P199_SurchargeLowerRate, 0)) as FooterPercentWithPAN,',
    '		to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutPAN, ''.CESSONTDS.'', d.CessPercentWithoutPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutPAN, 0)) as FooterPercentWithoutPAN',
    '	from FooterSchemeList a, FooterHead b, TDSTaxCategory c, TDSTaxCategoryDetail d',
    '	where a.FooterHeadCode = b.FooterHeadCode',
    '		and c.TNo = d.TNo',
    '		and c.TDSTaxCategoryCode = :P199_TDSTaxCategoryCode',
    '		and d.TDSPayeeCategoryCode = :P199_TDSPayeeCategoryCode',
    '		and a.FooterHeadCode in (',
    '				''.TDS.'',',
    '				''.CESSONTDS.'',',
    '				''.SURCHARGEONTDS.''',
    '		)',
    '		and a.CompanyCode = :P199_CompanyCode ',
    '		and a.FinancialYearCode = :P199_FinancialYearCode',
    '		and a.ModuleCode = ''FREIGHTADVICE''',
    '		and nvl(:P199_TDSLowerRateApplicable, ''NO'') = ''YES''',
    '	order by 1 ',
    '	)',
    'loop',
    '	if :P199_PANNo is null then ',
    '		tFooterPercent := vTDSMaster.FooterPercentWithoutPAN;',
    '	else',
    '		tFooterPercent := vTDSMaster.FooterPercentWithPAN;',
    '	end if;',
    '',
    'for vdet in (',
    '    select tno,sno,tdsdeductableamount',
    '    from freightadvicedetail ',
    '    where tno = :p199_tno',
    '    order by sno',
    ') loop',
    'if nvl(GetApexTDSValue(:P199_CompanyCode, :P199_financialyearcode, ''FREIGHTADVICE'', vTDSMaster.FooterHeadCode, tFooterPercent, vdet.TDSDeductableAmount),0) > 0 then',
    '--raise_application_error(-20000 , ''101'');',
    'insert into freightadvicedetailtds  a',
    '	(',
    '	a.Tno,',
    '	a.Sno,',
    '	a.SerialNo,',
    '	a.FooterHeadCode,',
    '	a.FooterPercent,',
    '	a.FooterValue',
    '	)',
    'values',
    '	(',
    '	vdet.TNO,',
    '	vdet.SNO,',
    '	vTDSMaster.SNo,',
    '	vTDSMaster.FooterHeadCode,',
    '    tFooterPercent,',
    '	GetApexTDSValue(:P199_CompanyCode, :P199_financialyearcode, ''FREIGHTADVICE'', vTDSMaster.FooterHeadCode, tFooterPercent, vdet.TDSDeductableAmount)',
    '	) ',
    '    ;',
    '    update freightadvicedetail ',
    '    set tdsamount = GetApexTDSValue(:P199_CompanyCode, :P199_financialyearcode, ''FREIGHTADVICE'', vTDSMaster.FooterHeadCode, tFooterPercent, vdet.TDSDeductableAmount),',
    '         netpayableamount = netfreightamount - nvl(GetApexTDSValue(:P199_CompanyCode, :P199_financialyearcode, ''FREIGHTADVICE'', vTDSMaster.FooterHeadCode, tFooterPercent, vdet.TDSDeductableAmount),0) ',
    '',
    '    where tno = vdet.TNO',
    '      AND SNO = vdet.SNO;',
    '      commit;',
    'End if;',
    '   end loop;',
    '   select sum(tdsamount) into :P199_SUMOFTDSAMOUNT',
    '   from freightadvicedetail ',
    '   where tno = :P199_TNO;',
    'end loop;  	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118133389688887655)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// Find the Interactive Grid',
    'var ig$ = apex.region("Detail_Region").widget();',
    '',
    '// Save the Interactive Grid Data',
    'ig$.interactiveGrid("getActions").invoke("save");',
    '',
    'apex.region("Detail_Region").widget().off("apexbeforerefresh");',
    'apex.region("Detail_Region").widget().off("apexafterrefresh");',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118133921794887657)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(469669266628009784)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118129412481887654)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFTDSAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(footervalue) from freightadviceDetailtds',
    'where tno = :P199_TNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118129854181887655)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TOTALTDSPERCENT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select FOOTERPERCENT from freightadviceDetailtds',
    'where tno = :P199_TNO and rownum = 1')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118130405928887655)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-3'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_TDSDEDUCTABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select SUM(TDSDEDUCTABLEAMOUNT) from freightadviceDetail',
    'where tno = :P199_TNO ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118130864319887655)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set net payable'
,p_static_id=>'set-net-payable'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFNETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_SUMOFAMOUNT,P199_SUMOFFOOTERAMOUNT,P199_SUMOFTDSAMOUNT,P199_SUMOFADVANCEAMOUNT,P199_SUMOFDEDUCTIONAMOUNT',
  'plsql_expression', 'NVL(:P199_SUMOFAMOUNT,0)+NVL(:P199_SUMOFFOOTERAMOUNT,0)-NVL(:P199_SUMOFTDSAMOUNT,0)-NVL(:P199_SUMOFADVANCEAMOUNT,0)-NVL(:P199_SUMOFDEDUCTIONAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118131328262887655)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'set net payable before round'
,p_static_id=>'set-net-payable-before-round'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_FREIGHTAMOUNTBEFOREROUND'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_SUMOFAMOUNT,P199_SUMOFFOOTERAMOUNT,P199_SUMOFTDSAMOUNT,P199_SUMOFADVANCEAMOUNT,P199_SUMOFDEDUCTIONAMOUNT',
  'plsql_expression', 'NVL(:P199_SUMOFAMOUNT,0)+NVL(:P199_SUMOFFOOTERAMOUNT,0)-NVL(:P199_SUMOFTDSAMOUNT,0)-NVL(:P199_SUMOFADVANCEAMOUNT,0)-NVL(:P199_SUMOFDEDUCTIONAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118131856422887655)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'set round off'
,p_static_id=>'set-round-off'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_ROUNDOFF'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_FREIGHTAMOUNTBEFOREROUND,P199_SUMOFNETPAYABLEAMOUNT',
  'plsql_expression', 'round(:P199_SUMOFNETPAYABLEAMOUNT,0) - NVL(:P199_FREIGHTAMOUNTBEFOREROUND,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118132905867887655)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_name=>'set round off freight amount'
,p_static_id=>'set-round-off-freight-amount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_FREIGHTADVICEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_FREIGHTADVICEAMOUNT,P199_ROUNDOFF',
  'plsql_expression', 'nvl(:P199_FREIGHTADVICEAMOUNT,0) + nvl(:P199_ROUNDOFF,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(118132346707887655)
,p_event_id=>wwv_flow_imp.id(118127886384887654)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'set round off net payble'
,p_static_id=>'set-round-off-net-payble'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P199_SUMOFNETPAYABLEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P199_FREIGHTAMOUNTBEFOREROUND,P199_SUMOFNETPAYABLEAMOUNT',
  'plsql_expression', 'round(:P199_SUMOFNETPAYABLEAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P199_BILLINROUNDFIGURE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118043639687887615)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'calculate footer'
,p_static_id=>'calculate-footer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tTotalDetailAmount number;',
'begin',
'    for vPoReceiptDetail in',
'        (',
'        Select',
'            sum(a.Amount) as TotalAmount',
'        From FREIGHTADVICEdetail a',
'        Where a.Tno = :P199_Tno',
'        )',
'    loop',
'        tTotalDetailAmount := vPoReceiptDetail.TotalAmount;',
'    end loop;',
'    ----',
'    if nvl(:P199_ITEMWISEFOOTER, ''NO'') = ''YES'' then',
'        delete from FREIGHTADVICEfooter a',
'        where a.TNO = :P199_TNO',
'        ;',
'        insert into FREIGHTADVICEfooter',
'        	(',
'        	TNo, ',
'            SNO,',
'        	SerialNo, ',
'        	FooterHeadCode, ',
'        	FooterValue',
'        	) ',
'        Select',
'        	a.TNo,',
'            b.sno,',
'        	a.serialno,',
'        	a.FooterHeadCode,',
'        	sum(a.FooterValue) as FooterValue',
'        From FREIGHTADVICEdetailfooter a, FooterSchemeList b',
'        Where a.FooterHeadCode = b.FooterHeadCode',
'        	and b.CompanyCode = :global_CompanyCode',
'        	and b.FinancialYearCode = :global_FinancialYearCode',
'        	and b.ModuleCode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'        	and a.TNo = :P199_TNo',
'        Group by a.TNO, b.SNO, a.FooterHeadCode,a.serialno',
'        ;',
'    else',
'        Delete From FREIGHTADVICEdetailfooter a Where a.Tno = :P199_Tno;',
'        for vFooter in',
'    		(',
'    		Select',
'    			distinct',
'    			c.SNo as SerialNo,',
'    			b.FooterHeadCode',
'    		From  FooterHead b, FooterSchemeList c',
'    		Where  b.FooterHeadCode = c.FooterHeadCode',
'    			',
'    		)',
'    	loop',
'    		Update FREIGHTADVICEfooter a',
'            Set a.SerialNo = vFooter.SerialNo',
'            Where a.FooterHeadCode = vFooter.FooterHeadCode',
'            and a.Tno = :P199_Tno',
'            ;',
'    	end loop;',
'        ----',
'        if nvl(tTotalDetailAmount, 0) > 0 then',
'            insert into FREIGHTADVICEdetailfooter',
'                (',
'                TNo, ',
'                SNo, ',
'                Sn,',
'                SerialNo, ',
'                FooterHeadCode, ',
'                FooterPercent, ',
'                FooterValue',
'                ) ',
'            Select',
'                a.TNo,',
'                a.SNo,',
'                b.SerialNo,',
'                b.SerialNo,',
'                b.FooterHeadCode,',
'                b.FooterPercent,',
'                round(a.Amount * b.FooterValue / nvl(tTotalDetailAmount, 1), 2) as FooterValue',
'            From FREIGHTADVICEdetail a, FREIGHTADVICEfooter b',
'            Where a.TNo = b.TNo',
'                and a.TNo = :P199_TNo',
'            ;',
'        end if;',
'    end if;',
'    --------------------',
'    for vPoReceiptDetail in',
'    	(',
'    	Select',
'    		a.Tno,',
'    		a.Sno,',
'    		a.Amount,',
'    		a.FooterAmount,',
'    		a.TotalAmount',
'    	From FREIGHTADVICEdetail a',
'    	Where a.Tno = :P199_Tno',
'    	)',
'    loop',
'    	declare',
'    		cursor cFooter is',
'    			select',
'    				round(sum(a.Amount * b.FooterValue / tTotalDetailAmount), 2) as Footeramount',
'    			from FREIGHTADVICEdetail a, FREIGHTADVICEfooter b',
'    			where a.TNo = b.TNo',
'    				and a.TNo = vPoReceiptDetail.TNo',
'    				and a.SNo = vPoReceiptDetail.SNo',
'    		;',
'    		vFooter cFooter%rowtype;',
'    	begin',
'    		open cFooter;',
'    		fetch cFooter into vFooter;',
'    		if cFooter%FOUND then',
'',
'                --raise_application_error(-20000, vFooter.FooterAmount);',
'',
'    			Update FREIGHTADVICEdetail a',
'    				Set a.FooterAmount = vFooter.FooterAmount,',
'    				a.Totalamount = vPoReceiptDetail.Amount + NVL(vFooter.FooterAmount, 0)',
'    			where a.tno = vPoReceiptDetail.Tno',
'    				and a.sno = vPoReceiptDetail.Sno',
'    			;',
'    		else',
'    			Update FREIGHTADVICEdetail a',
'    				Set a.FooterAmount = null,',
'    				a.Totalamount = vPoReceiptDetail.amount ',
'    			where a.tno = vPoReceiptDetail.Tno',
'    				and a.sno = vPoReceiptDetail.Sno',
'    			;',
'    		end if;',
'    		close cFooter;',
'    	end;	  								  							',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74862116904012553
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118044918802887618)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculate TDS Amount'
,p_static_id=>'calculate-tds-amount'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tTDSAmount number;',
'    tWCTAmount number;',
'begin',
'    for vPurchaseBillTDSDetail in',
'        (',
'        Select',
'            sum(a.TDSAMOUNT) as TDSAmount, SUM(TDSDEDUCTABLEAMOUNT) AS TDSDEDUCTABLEAMOUNT',
'        From freightadvicedetail a',
'        Where a.Tno = :P199_TNO',
'        )',
'    loop',
'        Update freightadvice a',
'        Set a.SumOfTDSAmount = vPurchaseBillTDSDetail.TDSAmount,',
'            A.TDSDEDUCTABLEAMOUNT = vPurchaseBillTDSDetail.TDSDEDUCTABLEAMOUNT',
'        Where a.Tno = :P199_TNO',
'        ;',
'        tTDSAmount := vPurchaseBillTDSDetail.TDSAmount;',
'    end loop;',
' ',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74863396019012556
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(117946961282887547)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(469669266628009784)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CALCULATE TDS DETAIL'
,p_static_id=>'calculate-tds-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	tFooterPercent number;',
'begin',
'    delete freightadvicedetailtds a',
'    where not exists(',
'        Select',
'            aa.Tno',
'        From freightadvicedetail aa',
'        Where aa.Tno = a.Tno',
'          and aa.sno = a.sno',
'        )',
'    ;',
'',
'	delete freightadvicedetailtds where tno = :P199_TNO ;',
'',
'    --raise_application_error(-20000, ''Tax Category Code : '' || :P199_TDSTaxCategoryCode || '' Payee Category Code : '' || :P199_TDSPayeeCategoryCode || '' Company Code : '' ||:P199_CompanyCode );',
'',
'	for vTDSMaster in',
'        (',
'		select',
'			a.SNo,',
'			a.FooterHeadCode,',
'			b.FooterHeadName,',
'			b.FooterPostFix,',
'			to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithPAN, ''.CESSONTDS.'', d.CessPercentWithPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithPAN, 0)) as FooterPercentWithPAN,',
'			to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutPAN, ''.CESSONTDS.'', d.CessPercentWithoutPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutPAN, 0)) as FooterPercentWithoutPAN',
'		from FooterSchemeList a, FooterHead b, TDSTaxCategory c, TDSTaxCategoryDetail d',
'		where a.FooterHeadCode = b.FooterHeadCode',
'			and c.TNo = d.TNo',
'			and c.TDSTaxCategoryCode = :P199_TDSTaxCategoryCode',
'			and d.TDSPayeeCategoryCode = :P199_TDSPayeeCategoryCode',
'			and a.FooterHeadCode in (',
'					''.TDS.'',',
'					''.CESSONTDS.'',',
'					''.SURCHARGEONTDS.''',
'			)',
'			and a.CompanyCode = :P199_CompanyCode ',
'			and a.FinancialYearCode = :P199_FinancialYearCode',
'			and a.ModuleCode = ''FREIGHTADVICE''',
'			and nvl(:P199_TDSLowerRateApplicable, ''NO'') != ''YES''',
'		union all',
'		select',
'			a.SNo,',
'			a.FooterHeadCode,',
'			b.FooterHeadName,',
'			b.FooterPostFix,',
'			to_number(decode(a.FooterHeadCode, ''.TDS.'', :P199_TDSLowerRate, ''.CESSONTDS.'', :P199_CessLowerRate, ''.SURCHARGEONTDS.'', :P199_SurchargeLowerRate, 0)) as FooterPercentWithPAN,',
'			to_number(decode(a.FooterHeadCode, ''.TDS.'', d.TDSPercentWithoutPAN, ''.CESSONTDS.'', d.CessPercentWithoutPAN, ''.SURCHARGEONTDS.'', d.SurchargePercentWithoutPAN, 0)) as FooterPercentWithoutPAN',
'		from FooterSchemeList a, FooterHead b, TDSTaxCategory c, TDSTaxCategoryDetail d',
'		where a.FooterHeadCode = b.FooterHeadCode',
'			and c.TNo = d.TNo',
'			and c.TDSTaxCategoryCode = :P199_TDSTaxCategoryCode',
'			and d.TDSPayeeCategoryCode = :P199_TDSPayeeCategoryCode',
'			and a.FooterHeadCode in (',
'					''.TDS.'',',
'					''.CESSONTDS.'',',
'					''.SURCHARGEONTDS.''',
'			)',
'			and a.CompanyCode = :P199_CompanyCode ',
'			and a.FinancialYearCode = :P199_FinancialYearCode',
'			and a.ModuleCode = ''FREIGHTADVICE''',
'			and nvl(:P199_TDSLowerRateApplicable, ''NO'') = ''YES''',
'		order by 1 ',
'		)',
'	loop',
'		if :P199_PANNo is null then ',
'			tFooterPercent := vTDSMaster.FooterPercentWithoutPAN;',
'		else',
'			tFooterPercent := vTDSMaster.FooterPercentWithPAN;',
'		end if;',
'',
'        --raise_application_error(-20000,''Before insert freightadvicedetailtds'' );',
'            ',
'        --if nvl(GetApexTDSValue(:P199_CompanyCode, :P199_financialyearcode, ''FREIGHTADVICE'', vTDSMaster.FooterHeadCode, tFooterPercent, nvl(:P199_TDSDEDUCTABLEAMOUNT,:P199_SUMOFAMOUNT)-nvl(:TDSALREADYDEDUCTEDON,0)),0) > 0 then',
'         IF nvl(:P199_SUMOFTDSAMOUNT,0) > 0 then',
'            --raise_application_error(-20000,''inside if insert freightadvicedetailtds'' );',
'',
'        		insert into freightadvicedetailtds a',
'        			(',
'        			a.Tno,',
'        			a.Sno,',
'                    sn,',
'        			a.SerialNo,',
'        			a.FooterHeadCode,',
'        			a.FooterPercent,',
'        			a.FooterValue',
'        			)',
'        		values',
'        			(',
'        			:P199_TNO,',
'        			globaltno.nextval,',
'                    globaltno.nextval,',
'        			vTDSMaster.SNo,',
'        			vTDSMaster.FooterHeadCode,',
'                    tFooterPercent,',
'                    :P199_SUMOFTDSAMOUNT',
'        			--GetApexTDSValue(:P199_CompanyCode, :P199_financialyearcode, ''FREIGHTADVICE'', vTDSMaster.FooterHeadCode, tFooterPercent, nvl(:P199_TDSDEDUCTABLEAMOUNT,:P199_SUMOFAMOUNT)-nvl(:TDSALREADYDEDUCTEDON,0))',
'        			) ',
'                    ;',
'               ',
'          /* update freightadvicedetail set TDSDEDUCTABLEAMOUNT = nvl(:TDSDeductableAmount,:P199_TDSDeductableAmount)-nvl(:TDSALREADYDEDUCTEDON,0)',
'            , TDSAMOUNT = GetApexTDSValue(:P199_CompanyCode, :P199_financialyearcode, ''FREIGHTADVICE'', vTDSMaster.FooterHeadCode, tFooterPercent, nvl(:P199_TDSDEDUCTABLEAMOUNT,:P199_SUMOFAMOUNT)-nvl(:TDSALREADYDEDUCTEDON,0))',
'            where tno = :P199_TNO and sno = :SNO;',
'               -- raise_application_error(-20000,''After insert freightadvicedetailtds'' );',
'        */',
'        End if;',
'	end loop;  	',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74765438499012485
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118042086057887615)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete from freightadvicedetail',
'where TNO = :P199_tno ;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(118035401189887608)
,p_internal_uid=>74860563274012553
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118042428423887615)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail Footer'
,p_static_id=>'delete-detail-footer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete from freightadvicedetailfooter ',
'where tno = :P199_TNO;',
'Delete from freightadvicefooter ',
'where tno = :P199_TNO;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(118035401189887608)
,p_internal_uid=>74860905640012553
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118046098649887619)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>'checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P199_TNO);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>74864575866012557
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118021584457887599)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(525978891853570222)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail Footer Save'
,p_static_id=>'detail-footer-save'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into freightadvicedetailfooter  (                 ',
'                    TNO,',
'       SNO,',
'       SN,',
'       SERIALNO,',
'       FOOTERHEADCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE,',
'       LEGENDSCODE  ',
'            )',
'            Values (',
'                :P199_TNO,',
'       :SNO,',
'       GLOBALTNO.NEXTVAL,',
'       1,',
'       :FOOTERHEADCODE,',
'       :FOOTERPERCENT,',
'       :FOOTERVALUE,',
'       :LEGENDSCODE',
'',
'            );',
'        ',
'        when ''U'' then',
'            update freightadvicedetailfooter  Set',
'                TNO=:P199_TNO,',
'       SNO=:SNO,',
'       SN=GLOBALTNO.NEXTVAL,',
'       SERIALNO=1,',
'       FOOTERHEADCODE=:FOOTERHEADCODE,',
'       FOOTERPERCENT= :FOOTERPERCENT,',
'       FOOTERVALUE = :FOOTERVALUE,',
'       LEGENDSCODE = :LEGENDSCODE',
'     ',
'            WHERE TNO = :P199_TNO;',
'',
'        when ''D'' then',
'            Delete From freightadvicedetailfooter ',
'            Where TNo = :P199_TNO;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74840061674012537
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(117947367434887547)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(469669266628009784)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'TTDSAMOUNT NUMBER;',
'Begin',
'   SELECT SUM(FOOTERVALUE) INTO TTDSAMOUNT',
'   FROM FREIGHTADVICEDETAILTDS',
'   WHERE TNO = :P199_TNO',
'     AND SNO = :SNO;',
'',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into freightadvicedetail  (                 ',
'                    TNO,',
'					SNO,',
'					MODULECODE,',
'					MODULETNO,',
'					QUANTITY1,',
'					NOS,',
'					RATE,',
'					RATEMEASURINGUNITCODE,',
'					AMOUNT,',
'					FOOTERAMOUNT,',
'					TOTALAMOUNT,',
'					TDSALREADYDEDUCTEDON,',
'					TDSDEDUCTABLEAMOUNT,',
'					TDSAMOUNT,',
'					DEDUCTIONBASISCODE,',
'					TOLERANCEMETHODCODE,',
'					TOLERANCE,',
'					SHORTAGEQUANTITY1,',
'					SHORTAGENOS,',
'					DEDUCTIONRATE,',
'					DEDUCTIONAMOUNT,',
'					NETFREIGHTAMOUNT,',
'					ADVANCEAMOUNT,',
'					PAYMENTCOMMISSION,',
'					NETPAYABLEAMOUNT,',
'					REMARK,',
'					REACHEDQUANTITY1,',
'					REACHEDDATE,',
'					MINIMUMQUANTITY1,',
'					ISDEDUCTIONONFULL,',
'					GPSDEDUCTIONAMOUNT,',
'					RECEIVEDQUANTITY1,',
'					FREIGHTRATE,',
'					CHALANQUANTITY1,',
'					LOANAMOUNT,',
'					OLDLANDINGRATE,',
'					NEWLANDINGRATE,',
'					BALANCEQUANTITY1,',
'					BALANCEQUANTITY2,',
'					BILLEDQUANTITY1,',
'					BILLEDAMOUNT,',
'					FREIGHTDEDUCTIONAMOUNT,',
'					BILLEDTOTALAMOUNT,',
'					BILLEDFOOTERAMOUNT   ,',
'                    VEHICLENO',
'            )',
'            Values (',
'                :P199_TNO,',
'					:SNO,',
'					:MODULECODE,',
'					:MODULETNO,',
'					:QUANTITY1,',
'					:NOS,',
'					:RATE,',
'					:RATEMEASURINGUNITCODE,',
'					:AMOUNT,',
'					:FOOTERAMOUNT,',
'					:TOTALAMOUNT,',
'					:TDSALREADYDEDUCTEDON,',
'					:TDSDEDUCTABLEAMOUNT,',
'					TTDSAMOUNT,',
'					:DEDUCTIONBASISCODE,',
'					:TOLERANCEMETHODCODE,',
'					:TOLERANCE,',
'					:SHORTAGEQUANTITY1,',
'					:SHORTAGENOS,',
'					:DEDUCTIONRATE,',
'					:DEDUCTIONAMOUNT,',
'					:NETFREIGHTAMOUNT,',
'					:ADVANCEAMOUNT,',
'					:PAYMENTCOMMISSION,',
'					:NETPAYBLE,',
'					:REMARK,',
'					:REACHEDQUANTITY1,',
'					:REACHEDDATE,',
'					:MINIMUMQUANTITY1,',
'					:ISDEDUCTIONONFULL,',
'					:GPSDEDUCTIONAMOUNT,',
'					:RECEIVEDQUANTITY1,',
'					:FREIGHTRATE,',
'					:CHALANQUANTITY1,',
'					:LOANAMOUNT,',
'					:OLDLANDINGRATE,',
'					:NEWLANDINGRATE,',
'					:BALANCEQUANTITY1,',
'					:BALANCEQUANTITY2,',
'					:BILLEDQUANTITY1,',
'					:BILLEDAMOUNT,',
'					:FREIGHTDEDUCTIONAMOUNT,',
'					:BILLEDTOTALAMOUNT,',
'					:BILLEDFOOTERAMOUNT   ,',
'                    :VEHICLENO',
'',
'            );',
'        ',
'        when ''U'' then',
'            update freightadvicedetail  Set',
'                TNO=:TNO,',
'					SNO=:SNO,',
'					MODULECODE=:MODULECODE,',
'					MODULETNO=:MODULETNO,',
'					QUANTITY1=:QUANTITY1,',
'					NOS=:NOS,',
'					RATE=:RATE,',
'					RATEMEASURINGUNITCODE=:RATEMEASURINGUNITCODE,',
'					AMOUNT=:AMOUNT,',
'					FOOTERAMOUNT=:FOOTERAMOUNT,',
'					TOTALAMOUNT=:TOTALAMOUNT,',
'					TDSALREADYDEDUCTEDON=:TDSALREADYDEDUCTEDON,',
'					TDSDEDUCTABLEAMOUNT=:TDSDEDUCTABLEAMOUNT,',
'					TDSAMOUNT=TTDSAMOUNT,',
'					DEDUCTIONBASISCODE=:DEDUCTIONBASISCODE,',
'					TOLERANCEMETHODCODE=:TOLERANCEMETHODCODE,',
'					TOLERANCE=:TOLERANCE,',
'					SHORTAGEQUANTITY1=:SHORTAGEQUANTITY1,',
'					SHORTAGENOS=:SHORTAGENOS,',
'					DEDUCTIONRATE=:DEDUCTIONRATE,',
'					DEDUCTIONAMOUNT=:DEDUCTIONAMOUNT,',
'					NETFREIGHTAMOUNT=:NETFREIGHTAMOUNT,',
'					ADVANCEAMOUNT=:ADVANCEAMOUNT,',
'					PAYMENTCOMMISSION=:PAYMENTCOMMISSION,',
'					NETPAYABLEAMOUNT=:NETPAYABLEAMOUNT,',
'					REMARK=:REMARK,',
'					REACHEDQUANTITY1=:REACHEDQUANTITY1,',
'					REACHEDDATE=:REACHEDDATE,',
'					MINIMUMQUANTITY1=:MINIMUMQUANTITY1,',
'					ISDEDUCTIONONFULL=:ISDEDUCTIONONFULL,',
'					GPSDEDUCTIONAMOUNT=:GPSDEDUCTIONAMOUNT,',
'					RECEIVEDQUANTITY1=:RECEIVEDQUANTITY1,',
'					FREIGHTRATE=:FREIGHTRATE,',
'					CHALANQUANTITY1=:CHALANQUANTITY1,',
'					LOANAMOUNT=:LOANAMOUNT,',
'					OLDLANDINGRATE=:OLDLANDINGRATE,',
'					NEWLANDINGRATE=:NEWLANDINGRATE,',
'					BALANCEQUANTITY1=:BALANCEQUANTITY1,',
'					BALANCEQUANTITY2=:BALANCEQUANTITY2,',
'					BILLEDQUANTITY1=:BILLEDQUANTITY1,',
'					BILLEDAMOUNT=:BILLEDAMOUNT,',
'					FREIGHTDEDUCTIONAMOUNT=:FREIGHTDEDUCTIONAMOUNT,',
'					BILLEDTOTALAMOUNT=:BILLEDTOTALAMOUNT,',
'					BILLEDFOOTERAMOUNT=:BILLEDFOOTERAMOUNT , ',
'                    VEHICLENO = :VEHICLENO',
'     ',
'            WHERE TNO = :P199_TNO',
'            and sno = :SNO;',
'',
'        when ''D'' then',
'            Delete From freightadvicedetail ',
'            Where TNo = :P199_TNO',
'            and sno = :SNO;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74765844651012485
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118040918160887613)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FormNarration'
,p_static_id=>'formnarration'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'        tModuleNo  varchar2(30);',
'		tVehicleNo Varchar2(30);',
'		tChequeNo Varchar2(100);',
'BEGIN',
'  	if :P199_FormStatus in (''NEWRECORD'', ''EDITRECORD'')  then',
'  			',
'  			IF :P199_MoneyTransferModeCode = ''CREDIT'' then',
'		  			:P199_Narration ',
'		  					:= ''Being amount credited towards Freight. ''',
'		  					|| :P199_DocTypeCode || '' No.) / (Vehicle No.) : '' ',
'		  			;  					',
'  			else',
'		  			:P199_Narration ',
'		  					:= ''Being '' || :P199_MoneyTransferModeName ',
'		  					|| '' paid to '' || :P199_PaidTo ',
'		  					|| '' towards Freight. ('' ',
'		  					|| getdoctypename(:P199_DocTypeCode) || '' No.) / (Vehicle No.) : '' ',
'		  			;',
'  			end if;',
'  			',
'  			for vloop in (',
'                  select * from FreightAdviceDetail ',
'                  where tno = :P199_TNO',
'                  order by tno',
'              )',
'  			loop',
'  									',
'  					if vloop.VehicleNo is not null then',
'  							:P199_Narration := :P199_Narration || ''(''|| getmoduleno(vloop.modulecode,vloop.moduletno) || '') / ('' ||  vloop.VehicleNo || ''), '';',
'  					end if;  					',
'		  	end loop;',
'  	',
'  			if :P199_MoneyTransferModeCode in (''CH'', ''CHEQUE'') and :P199_MONEYTRANSFERREFERENCENO is not null then',
'  					:P199_Narration := :P199_Narration || '' by Cheque No '' || :P199_MONEYTRANSFERREFERENCENO;',
'  			end if;  			',
'  			update FreightAdvice set narration = :p199_narration where tno = :p199_tno;		',
'  	end if;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74859395377012551
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118041658740887613)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get document no'
,p_static_id=>'get-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'',
'     if :P199_Tno is null then',
'        Select GlobalTno.NextVal into :P199_Tno From Dual;',
'     end if;',
'    ----',
'    if :P199_FREIGHTADVICENO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P199_LocationCode,',
'					:P199_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P199_FREIGHTADVICEDATE, ''DD-MM-RRRR'')',
'				);',
'        :P199_FREIGHTADVICENO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P199_LocationCode,',
'                    :P199_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P199_FREIGHTADVICEDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74860135957012551
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118045287010887618)
,p_process_sequence=>120
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P199_TNO is null then',
'    :P199_TNO := GlobalTNo.nextval;',
'    :P199_FORMSTATUS := ''NEWRECORD'';',
'else',
'    :P199_FORMSTATUS := ''EDITRECORD'';',
'End if;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>74863764227012556
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118044096496887616)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Voucher No'
,p_static_id=>'get-voucher-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'tmp2 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp from voucher where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) ',
'         and ModuleTno = :P199_TNO;',
'   if nvl(tmp,0) > 0 then',
'       select tno,voucherno into :P199_VOUCHERTNO,:P199_VOUCHERNO from voucher where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) ',
'         and ModuleTno = :P199_TNO;',
'   end if;',
'  -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from ReverseCharge where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) ',
'         and ModuleTno = :P199_TNO;',
'',
'   if nvl(tmp1,0) > 0 then',
'       select tno,reversechargeno into :P199_REVERSECHARGETNO,:P199_REVERSECHARGENO from REVERSECHARGE where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) ',
'         and ModuleTno = :P199_TNO;',
'   end if;  ',
'---- Debit Note',
'select count(*) into tmp2 from DebitNote where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) ',
'         and ModuleTno = :P199_TNO;',
'         ',
'   if nvl(tmp2,0) > 0 then',
'       select tno,DebitNoteNo into :P199_DEBITNOTETNO,:P199_DEBITNOTENO from DEBITNOTE where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) ',
'         and ModuleTno = :P199_TNO;',
'   end if;  ',
'   exception when others then ',
'    null;',
'  ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>74862573713012554
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118045669685887618)
,p_process_sequence=>130
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
'       :P199_MODULEFLOW := ''YES'';',
'   else',
'       :P199_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P199_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P199_ONTHETABLE := ''YES'' ;',
'   else',
'       :P199_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>74864146902012556
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118003289109887588)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(515633207600637708)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Freight Advice'
,p_static_id=>'initialize-form-freight-advice'
,p_internal_uid=>74821766326012526
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118043296313887615)
,p_process_sequence=>80
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
,p_internal_uid=>74861773530012553
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118003678148887588)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(515633207600637708)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Freight Advice'
,p_static_id=>'process-form-freight-advice'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74822155365012526
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118042862392887615)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P199_TNO, :P199_FREIGHTADVICENO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(118036205999887610)
,p_internal_uid=>74861339609012553
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118046437142887619)
,p_process_sequence=>150
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P199_FORMSTATUS = ''NEWRECORD'' THEN',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P199_ALLOWEDBACK,:P199_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'        else',
'     :P199_ALLOWEDBACK       := :P199_FREIGHTADVICEDATE ; ',
'    :P199_ALLOWEDFORWARD    := :P199_FREIGHTADVICEDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>74864914359012557
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118044475046887618)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SetTDSAndThreshold'
,p_static_id=>'settdsandthreshold'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tExpenseAmount Number;',
'    tThisExpenseAmount Number;',
'    tTDSAmount Number;',
'    tTotalExpenseAmount Number;',
'begin',
'   for vParty in ',
'        (',
'        select ',
'            a.TDSPayeeCategoryCode',
'        from Party a',
'        where a.PartyCode = :P199_TRANSPORTERCODE ',
'        )',
'    loop ',
'        update freightadvice a',
'        set a.TDSPayeeCategoryCode = vParty.TDSPayeeCategoryCode',
'        where a.Tno = :P199_TNO',
'        ;',
'        :P199_TDSPayeeCategoryCode := vParty.TDSPayeeCategoryCode;',
'    end loop;',
'    --',
'    update freightadvice a',
'    set a.TDSTaxCategoryCode = GetTDSTaxCategoryCode(:P199_TDSPayeeCategoryCode, :P199_TDSNatureCode, :P199_FREIGHTADVICEDATE),',
'        a.PANNo = GetPartyAttributeValue(:P199_TRANSPORTERCODE, ''PANNO'')',
'    where a.Tno = :P199_TNO',
'    ;',
'   ',
'    :P199_PANNo := GetPartyAttributeValue(:P199_TRANSPORTERCODE, ''PANNO'');',
'    :P199_TDSTaxCategoryCode := GetTDSTaxCategoryCode(:P199_TDSPayeeCategoryCode, :P199_TDSNatureCode, :P199_FREIGHTADVICEDATE);',
'    ----',
'   ',
'    for vTDSTaxCategory in',
'        (',
'        select',
'            b.TotalTDSPercentWithPAN,',
'            b.TotalTDSPercentWithoutPAN,',
'            b.Threshold,',
'            b.TransactionThreshold',
'        from TDSTaxCategory a, TDSTaxCategoryDetail b',
'        where a.TNo = b.TNo ',
'            and a.TDSTaxCategoryCode = :P199_TDSTaxCategoryCode',
'            and b.TDSPayeeCategoryCode = :P199_TDSPayeeCategoryCode',
'        )',
'    loop',
'        --',
'        update freightadvice a',
'        set a.TDSThreshold = vTDSTaxCategory.Threshold,',
'            a.TDSTransactionThreshold = vTDSTaxCategory.TransactionThreshold',
'        where a.Tno = :P199_TNO',
'        ;',
'        --',
'        if :P199_PANNo is null then ',
'            update freightadvice a',
'            set a.TotalTDSPercent = vTDSTaxCategory.TotalTDSPercentWithoutPAN',
'            where a.Tno = :P199_TNO',
'            ;',
'        else ',
'            update freightadvice a',
'            set a.TotalTDSPercent = vTDSTaxCategory.TotalTDSPercentWithPAN',
'            where a.Tno = :P199_TNO',
'            ;',
'        end if;',
'        exit;',
'    end loop;',
'    ----',
'    if nvl(:P199_TDSThreshold, 0) > 0 then ',
'        select ',
'            sum(b.TDSAmount)',
'            into  tTDSAmount',
'        from Voucher a, VoucherTDSDeducted b ',
'        where a.TNo = b.TNo ',
'            and b.PartyCode = :P199_TRANSPORTERCODE',
'            and a.FinancialYearCode = :P199_FinancialYearCode',
'            and b.TDSNatureCode = :P199_TDSNatureCode',
'        ;',
'    if nvl(tTDSAmount, 0) > 0 then ',
'        update freightadvice a',
'        set a.ThresholdPlusMinus = 0',
'        where a.Tno = :P199_TNO',
'        ;',
'    else ',
'        --',
'        select ',
'            sum(-1 * b.ThresholdPlusMinus )',
'            into  tExpenseAmount',
'        from Voucher a, VoucherTDSDeducted b ',
'        where a.TNo = b.TNo ',
'            and b.PartyCode = :P199_TRANSPORTERCODE',
'            and a.FinancialYearCode = :P199_FinancialYearCode',
'            and b.ThresholdPlusMinus < 0',
'            and b.AdvanceOrBill = ''BILL''',
'            and b.TDSNatureCode = :P199_TDSNatureCode',
'            and a.VoucherNo != ''OPENING''',
'        ;',
'',
'        tThisExpenseAmount := nvl(:P199_SumOfAmount, 0);',
'        --',
'        tTotalExpenseAmount := nvl(tExpenseAmount, 0) + nvl(tThisExpenseAmount, 0);',
'        --',
'        if nvl(tTotalExpenseAmount, 0) > nvl(:P199_TDSThreshold, 0) or  nvl(tThisExpenseAmount, 0) > nvl(:P199_TDSTransactionThreshold, 0) then ',
'            update freightadvice a',
'            set a.ThresholdPlusMinus = tExpenseAmount',
'            where a.Tno = :P199_TNO',
'            ;',
'        else ',
'            update freightadvice a',
'            set a.ThresholdPlusMinus = -1 * tThisExpenseAmount',
'            where a.Tno = :P199_TNO',
'            ;',
'        end if;',
'        --',
'        end if;',
'        --',
'    end if;',
'',
'    update freightadvice a',
'    set a.AdvanceOrBill = ''BILL''',
'    where a.Tno = :P199_TNO',
'    ;',
'     ',
'    for vPurchaseBill in',
'        (',
'        Select',
'            a.AdvanceOrBill,',
'            a.TotalTDSPercent,',
'            a.SumOfAmount,',
'            a.ThresholdPlusMinus,',
'            a.TDSDeductedInAdvance',
'        From freightadvice a',
'        Where a.Tno = :P199_TNO',
'        )',
'    loop',
'        if vPurchaseBill.AdvanceOrBill = ''BILL'' and vPurchaseBill.TotalTDSPercent > 0 then ',
'            update freightadvice a',
'            set a.TDSDeductableAmount = nvl(vPurchaseBill.SumOfAmount, 0) + nvl(vPurchaseBill.ThresholdPlusMinus, 0) - nvl(vPurchaseBill.TDSDeductedInAdvance, 0)',
'            where a.Tno = :P199_TNO',
'            ;',
'            :P199_TDSDEDUCTABLEAMOUNT := nvl(vPurchaseBill.SumOfAmount, 0) + nvl(vPurchaseBill.ThresholdPlusMinus, 0) - nvl(vPurchaseBill.TDSDeductedInAdvance, 0);',
'    	else',
'            update freightadvice a',
'            set a.TDSDeductableAmount = 0',
'            where a.Tno = :P199_TNO',
'            ;',
'    		:P199_TDSDeductableAmount := 0;',
'        end if;',
'        exit;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74862952263012556
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(118041270524887613)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update freight advice amount in master'
,p_static_id=>'update-freight-advice-amount-in-master'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' tfrtAdviceAmount Number;',
'begin',
'  select sum(totalamount) into tfrtAdviceAmount',
'  from freightadvicedetail',
'  where tno = :P199_TNO;',
'',
'   update freightadvice',
'      set freightadviceamount = tfrtAdviceAmount + roundoff',
'    where tno = :P199_TNO;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>74859747741012551
);
wwv_flow_imp.component_end;
end;
/
