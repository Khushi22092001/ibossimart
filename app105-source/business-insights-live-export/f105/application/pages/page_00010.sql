prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Item Ledger'
,p_alias=>'ITEM-LEDGER'
,p_step_title=>'Item Ledger'
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
'  var bireporturl = $(''#P103_BIREPORTURL'').val()',
'  var reportName = ''EECG/REPORT/ItemLedger.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P103_FROMDATE'').val());',
'  var toDate = new Date($(''#P103_TODATE'').val());',
'',
'var reportParams = ',
'      ''&P103_ITEMCODE='' +$(''#P103_ITEMCODE'').val() +',
'      ''&P103_FROMDATE=''+ $(''#P103_FROMDATE'').val() +  ',
'      ''&P103_TODATE='' + $(''#P103_TODATE'').val()  ',
'    ;',
' ',
'      ',
'  var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*.a-GV-table tr:hover td{background-color:#FFFACD}',
'',
'.a-GV-table-headerLink{',
'    color: white;',
'}',
'',
'#my_ig  .a-GV-headerGroup[data-idx="0"] {',
'    color: white !important;',
'    background-color: #10779f;',
'}',
'',
'#my_ig  .a-GV-headerGroup[data-idx="1"] {',
'    color: white !important;',
'    background-color: #10779f;',
'}',
'',
'',
'#my_ig  .a-GV-headerGroup[data-idx="2"] {',
'    color: white !important;',
'    background-color: #9f3910;',
'}',
'',
'#my_ig  .a-GV-headerGroup[data-idx="3"] {',
'    color: white !important;',
'    background-color: #749f10;',
'}',
'',
'#my_ig .TransactionDate {',
'    color: white !important;',
'   background-color: #10779f;',
'}',
'',
'#my_ig .ModuleCode {',
'    color: white !important;',
'    background-color: #10779f;',
'}',
'',
'#my_ig .TransactionNo {',
'    color: white !important;',
'    background-color: #10779f;',
'}',
'',
'#my_ig .Inward {',
'    color: white !important;',
'    background-color: #10779f;',
'}',
'',
'#my_ig .Outward {',
'    color: white !important;',
'    background-color: #9f3910;',
'}',
'',
'',
'#my_ig .Balance {',
'    color: white !important;',
'    background-color: #749f10;',
'}',
'',
'#my_ig .TransactionNo {',
'    color: white !important;',
'    background-color: #10779f;',
'}',
'',
'.a-GV-table .a-GV-cell, th.a-GV-header {',
'',
'    border-color: black !important;',
'',
'}',
'',
'*/',
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
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(785601475346570776)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(781918885732158092)
,p_plug_name=>'Item Ledger'
,p_static_id=>'item-ledger'
,p_region_name=>'my_ig'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select x. mytno,',
'       x.TRANSACTIONDATE,',
'       x.modulecode,',
'       case when x.modulecode = ''Opening'' then',
'                  X.TRANSACTIONNO',
'            when x.modulecode = ''CCINVOICE'' then',
'           ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||175||'':''||:APP_SESSION||''::::''||''P175_TNO,P175_FORMSTATUS,P175_CALLEDFROMPAGE''||'':''||x.MODULETNO||'',CALLED''||'',10''||'':NO'')||''">''||X.TRANSACTIONNO||''</a>''',
'           when x.modulecode = ''INSPECTION'' then',
'          ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||146||'':''||:APP_SESSION||''::::''||''P146_TNO,P146_FORMSTATUS,P146_CALLEDFROMPAGE''||'':''||x.MODULETNO||'',CALLED''||'',10''||'':NO'')||''">''||X.TRANSACTIONNO||''</a>''',
'          when x.modulecode = ''KITTINGUNKITTING'' then',
'          ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||97||'':''||:APP_SESSION||''::::''||''P97_TNO,P97_FORMSTATUS,P97_CALLEDFROMPAGE''||'':''||x.MODULETNO||'',CALLED''||'',10''||'':NO'')||''">''||X.TRANSACTIONNO||''</a>''',
'          else X.TRANSACTIONNO',
'          end TransactionNo,',
'          x.Sku,',
'     ',
'       --x.TransactionNo,',
'       x.STOCKINQUANTITY1,',
'       x.STOCKINAMOUNT,',
'       x.STOCKOUTQUANTITY1,',
'       x.STOCKOUTAMOUNT,',
'       --      x.BalanceQuantity,',
'       --      x.balanceamount,',
'       Sum(x.BalanceQuantity) over(Order By mytno rows unbounded preceding) BalanceQuantity,',
'       Sum(x.BalanceAmount) over(Order By mytno rows unbounded preceding) BalanceAmount,',
'       x.ITEMNAME,',
'       x.ITEMSPECIFICATION',
'  From (Select 1 As mytno,',
'               Null As TRANSACTIONDATE,',
'              ''Opening'' As modulecode,',
'               null as Moduletno,',
'               ''Opening'' As TransactionNo,',
'               Null As STOCKINQUANTITY1,',
'               --     Null As MEASURINGUNITCODE,',
'               Null As STOCKINAMOUNT,',
'               Null As STOCKOUTQUANTITY1,',
'               Null As STOCKOUTAMOUNT,',
'               Nvl(GetSLItemOpeningQuantity1(Null, :P10_ITEMCODE,:P10_ITEMSPECIFICATIONCODE, :GLOBAL_COMPANYCODE, :P10_FROMDATE),',
'                   0) As BalanceQuantity,',
'               Nvl(GetSLItemOpeningValue(Null, :P10_ITEMCODE,:P10_ITEMSPECIFICATIONCODE, :GLOBAL_COMPANYCODE, :P10_FROMDATE), 0) As balanceamount,',
'               NULL AS SKU,',
'               GETITEMNAME(:P10_ITEMCODE) AS ITEMNAME,',
'               GETITEMSPECIFICATIONNAME(:P10_ITEMCODE,:P10_ITEMSPECIFICATIONCODE) AS ITEMSPECIFICATION',
'        ',
'    ',
'          From dual',
'        Union All',
'        ',
'        Select a.MyTNo,',
'               a.TRANSACTIONDATE,',
'               a.modulecode,',
'               a.moduletno,',
'               a.transactionno,',
'               a.STOCKINQUANTITY1,',
'               --E.MEASURINGUNITCODE,',
'               a.STOCKINAMOUNT,',
'               a.STOCKOUTQUANTITY1,',
'               a.STOCKOUTAMOUNT,',
'               Nvl(a.STOCKINQUANTITY1, 0) - Nvl(a.STOCKOUTQUANTITY1, 0) As balanceQuantity,',
'               Nvl(a.STOCKINAMOUNT, 0) - Nvl(a.STOCKOUTAMOUNT, 0) As balanceAmount,',
'                B.SKU,',
'                b.ITEMNAME,',
'                b.ITEMSPECIFICATIONNAME',
'          From Stockcard a, v_item_details b',
'         Where a.ModuleCode != ''ITEMOPENING''',
'           and a.ItemSpecificationCode = b.ItemSpecificationCode(+)',
'           and a.Itemcode             = b.ItemCode',
'              --   And a.StockTNo = c.TNO',
'              --   And c.StockModuleTNO = d.TNo(+)',
'              --   And A.MODULETNO = F.TNO(+)',
'           And a.CompanyCode = :GLOBAL_COMPANYCODE',
'        --    And A.ITEMCODE = :P10_ITEMCODE',
'        --    and a.ITEMSPECIFICATIONCODE = :P10_ITEMSPECIFICATIONCODE',
'           AND ( :P10_SKU IS NULL OR INSTR('':''||:P10_SKU||'':'','':''||B.SKU||'':'') > 0 )',
'           And a.TransactionDate Between :P10_FROMDATE And :P10_TODATE',
'           and ( :P10_TRANSACTION_NO IS NULL OR instr('':''||:P10_TRANSACTION_NO||'':'','':''||a.transactionno||'':'') > 0 ) ',
'           and ( :P10_ITEMCODE IS NULL OR instr('':''||:P10_ITEMCODE||'':'','':''||a.ITEMCODE||'':'') > 0 )',
'           and ( :P10_ITEMSPECIFICATIONCODE IS NULL OR instr('':''||:P10_ITEMSPECIFICATIONCODE||'':'','':''||a.ITEMSPECIFICATIONCODE||'':'') > 0 )',
'           ) x',
'',
'  ',
'',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P10_ITEMCODE,P10_FROMDATE,P10_TODATE,P10_BIREPORTURL,P10_ITEMSPECIFICATIONCODE,P10_SKU,P10_TRANSACTION_NO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'MILLIMETERS'
,p_prn_paper_size=>'A4'
,p_prn_width=>297
,p_prn_height=>210
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  EECG INDUSTRIAL SOLUTIONS PVT.LTD.',
'         Item Ledger Report',
'Item Name : &P103_ITEMCODE.'))
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Times'
,p_prn_page_header_font_weight=>'bold'
,p_prn_page_header_font_size=>'18'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#10779f'
,p_prn_header_font_color=>'#f4f4f4'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'12'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'11'
,p_prn_border_width=>1
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#b5b0b0'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(785602328479570785)
,p_heading=>'Balance'
,p_static_id=>'balance'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(785602170794570783)
,p_heading=>'Inward'
,p_static_id=>'inward'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(785602201475570784)
,p_heading=>'Outward'
,p_static_id=>'outward'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(217728204882617079)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(217728297281617080)
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
 p_id=>wwv_flow_imp.id(785601901365570781)
,p_name=>'BALANCEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(785602328479570785)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.defaultGridColumnOptions = {',
'        headingCssClasses: "Balance"',
'    }',
'    return config;',
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
 p_id=>wwv_flow_imp.id(785601838773570780)
,p_name=>'BALANCEQUANTITY'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BALANCEQUANTITY'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(785602328479570785)
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
'function(config) {',
'    config.defaultGridColumnOptions = {',
'        headingCssClasses: "Balance"',
'    }',
'    return config;',
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
 p_id=>wwv_flow_imp.id(54349865299196431)
,p_name=>'ITEMNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Itemname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(54349995610196432)
,p_name=>'ITEMSPECIFICATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Itemspecification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(781922271247158099)
,p_name=>'MODULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Module'
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.defaultGridColumnOptions = {',
'        headingCssClasses: "ModuleCode"',
'    }',
'    return config;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(781920260242158093)
,p_name=>'MYTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MYTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Mytno'
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
 p_id=>wwv_flow_imp.id(42483850137499756)
,p_name=>'SKU'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SKU'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SKU'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
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
 p_id=>wwv_flow_imp.id(781926220368158104)
,p_name=>'STOCKINAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCKINAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(785602170794570783)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
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
 p_id=>wwv_flow_imp.id(781924257842158102)
,p_name=>'STOCKINQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCKINQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(785602170794570783)
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
 p_id=>wwv_flow_imp.id(781928280541158105)
,p_name=>'STOCKOUTAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCKOUTAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(785602201475570784)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
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
 p_id=>wwv_flow_imp.id(781927200430158105)
,p_name=>'STOCKOUTQUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCKOUTQUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(785602201475570784)
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
 p_id=>wwv_flow_imp.id(781921216312158097)
,p_name=>'TRANSACTIONDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSACTIONDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Date'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.defaultGridColumnOptions = {',
'        headingCssClasses: "TransactionDate"',
'    }',
'    return config;',
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(606896600310733039)
,p_name=>'TRANSACTIONNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TRANSACTIONNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Transactionno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(config) {',
'    config.defaultGridColumnOptions = {',
'        headingCssClasses: "TransactionNo"',
'    }',
'    return config;',
'}'))
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(781919429319158093)
,p_internal_uid=>341533084068231569
,p_is_editable=>true
,p_lost_update_check_type=>'VALUES'
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
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
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
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(781919841465158093)
,p_interactive_grid_id=>wwv_flow_imp.id(781919429319158093)
,p_static_id=>'203751'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(781920050781158093)
,p_report_id=>wwv_flow_imp.id(781919841465158093)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(42501969024625972)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(42483850137499756)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54590359184969394)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(54349865299196431)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(54591250443969396)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(54349995610196432)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>209
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(217784049094004506)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(217728204882617079)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(608186767895382325)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(606896600310733039)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>230
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781920645923158093)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(781920260242158093)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781921611669158099)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(781921216312158097)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781922619039158099)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(781922271247158099)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>116
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781924597422158102)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(781924257842158102)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>128
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781926587879158105)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(781926220368158104)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>127
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781927669512158105)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(781927200430158105)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>132
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781928604254158105)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(781928280541158105)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>139
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781932460282256786)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(785601838773570780)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(781933261573256795)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(785601901365570781)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(761544897271844746)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_static_id=>'sum'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(781924257842158102)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(761546058647856856)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_static_id=>'sum-2'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(781926220368158104)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(761546078696856856)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_static_id=>'sum-3'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(781927200430158105)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(761546260595856856)
,p_view_id=>wwv_flow_imp.id(781920050781158093)
,p_static_id=>'sum-4'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(781928280541158105)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(607622936393509292)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(785601475346570776)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861166914881256026)
,p_name=>'P10_BIREPORTURL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(785601475346570776)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(785609308640570811)
,p_name=>'P10_FROMDATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(785601475346570776)
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(785609231161570810)
,p_name=>'P10_ITEMCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(785601475346570776)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select itemname d, itemcode r',
'from item ',
'where itemtype not in (''2'')',
'order by 1'))
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(606896500424733038)
,p_name=>'P10_ITEMSPECIFICATIONCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(785601475346570776)
,p_prompt=>'Items Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT B.ITEMSPECIFICATIONNAME D, B.ITEMSPECIFICATIONCODE R',
'FROM ITEM A, ITEMSPECIFICATION B',
'WHERE A.TNO = B.TNO',
'AND A.ITEMCODE=:P10_ITEMCODE'))
,p_lov_cascade_parent_items=>'P10_ITEMCODE'
,p_ajax_items_to_submit=>'P10_ITEMCODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(42483748512499755)
,p_name=>'P10_SKU'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(785601475346570776)
,p_prompt=>'SKU'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SKU d, SKU r',
'from ITEMSPECIFICATION'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(785609437602570812)
,p_name=>'P10_TODATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(785601475346570776)
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(54349785874196430)
,p_name=>'P10_TRANSACTION_NO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(785601475346570776)
,p_prompt=>'Transaction No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189782691589098336)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189783055407098337)
,p_event_id=>wwv_flow_imp.id(189782691589098336)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(33494007496959560)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(607622936393509292)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33494206066959562)
,p_event_id=>wwv_flow_imp.id(33494007496959560)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P10_ITEMCODE,P10_FROMDATE,P10_TODATE,P10_BIREPORTURL,P10_ITEMSPECIFICATIONCODE,P10_SKU',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    'raise_application_error(-20000,:P10_ITEMCODE||'',''||:P10_FROMDATE||'',''||:P10_TODATE||'',''||:P10_BIREPORTURL||'',''||:P10_ITEMSPECIFICATIONCODE||'',''||:P10_SKU);',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33494035454959561)
,p_event_id=>wwv_flow_imp.id(33494007496959560)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(781918885732158092)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(217728415984617081)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(781918885732158092)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Item Ledger - Save Interactive Grid Data'
,p_static_id=>'item-ledger-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>8188039784246712
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(607624742435509296)
,p_process_sequence=>10
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
,p_internal_uid=>167238397184582772
);
wwv_flow_imp.component_end;
end;
/
