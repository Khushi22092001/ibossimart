prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- Oracle APEX export file
--
-- You should run this script using a SQL client connected to the database as
-- the owner (parsing schema) of the application or as a database user with the
-- APEX_ADMINISTRATOR_ROLE role.
--
-- This export file has been automatically generated. Modifying this file is not
-- supported by Oracle and can lead to unexpected application and/or instance
-- behavior now or in the future.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_imp.import_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
end;
/
 
prompt APPLICATION 105 - Imart
--
-- Application Export:
--   Application:     105
--   Name:            Imart
--   Exported By:     IMART
--   Flashback:       0
--   Export Type:     Page Export
--   Manifest
--     PAGE: 712
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00712
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>712);
end;
/
prompt --application/pages/page_00712
begin
wwv_flow_imp_page.create_page(
 p_id=>712
,p_name=>'Comparative Statement'
,p_alias=>'COMPARATIVE-STATEMENT'
,p_step_title=>'Comparative Statement'
,p_autocomplete_on_off=>'OFF'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>'))
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
'  var reportName = ''MKRL/REPORT/ComparativeStatement.xdo'';',
'  var outputFormat = ''pdf'';',
'  ',
'',
'var reportParams = ',
'      ''&P_TNO=''+ $(''#P181_TNO'').val() ',
'      ;',
' ',
'  ',
'  var reportURL = ''http://192.168.0.151:7001/xmlpserver/''+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
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
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_imp.id(911488341579704959)
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
 p_id=>wwv_flow_imp.id(364920311325722292)
,p_plug_name=>'Comparative Statement'
,p_static_id=>'comparative-statement'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(336064959016339192)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'COMPARATIVESTATEMENT'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(362776634055306387)
,p_plug_name=>'CS Detail'
,p_static_id=>'cs-detail'
,p_parent_plug_id=>wwv_flow_imp.id(336064959016339192)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select seq_id As Seq_id,',
'       N001   As TNO,',
'       N002   As SNO,',
'       N003   As Quantity1,',
'       C004   As Measuringunitcode1,',
'       c005   As UOM,',
'       C006   As Itemcode,',
'       c007   As Itemspecificationcode,',
'       C008   As ItemName,',
'       C009   As ItemSpecification,',
'       ',
'       C010 As quotationtno1,',
'       C011 As PARTYCODE1,',
'       C012 As PARTYNAME1,',
'       C013 As QuotationNo1,',
'       c014 As rate1,',
'       TO_NUMBER(c015) As amount1,',
'       c016 As Approved1,',
'       C017 As c017,',
'       ',
'       C018 As quotationtno2,',
'       C019 As PARTYCODE2,',
'       C020 As PARTYNAME2,',
'       C021 As QuotationNo2,',
'       c022 As rate2,',
'       TO_NUMBER(c023) As amount2,',
'       c024 As Approved2,',
'       C025 As c025,',
'       ',
'       C026 As quotationtno3,',
'       C027 As PARTYCODE3,',
'       C028 As PARTYNAME3,',
'       C029 As QuotationNo3,',
'       c030 As rate3,',
'       TO_NUMBER(c031) As amount3,',
'       c032 As Approved3,',
'       C033 As c033,',
'       C034 As quotationtno4,',
'       C035 As PARTYCODE4,',
'       C036 As PARTYNAME4,',
'       C037 As QuotationNo4,',
'       c038 As rate4,',
'       TO_NUMBER(c039) As amount4,',
'       c040 As Approved4,',
'       C041 As c041,',
'       C042 As quotationtno5,',
'       C043 As PARTYCODE5,',
'       C044 As PARTYNAME5,',
'       C045 As QuotationNo5,',
'       c046 As rate5,',
'       TO_NUMBER(c047) As amount5,',
'       c048 As Approved5,',
'       C049 As c049',
'  From APEX_COLLECTIONS A',
' Where A.COLLECTION_NAME = ''CSCOLLECTION''',
'  AND A.N001 = :P712_TNO',
';'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P712_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'CUSTOM'
,p_prn_width=>35
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Comparative Statement',
'#P181_COMPARATIVESTATEMENTNO#',
'&P181_COMPARATIVESTATEMENTDATE.'))
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
 p_id=>wwv_flow_imp.id(364969795267395188)
,p_heading=>'Material'
,p_static_id=>'material'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364969684650395187)
,p_heading=>'Quotation - 1'
,p_static_id=>'quotation'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364969874857395189)
,p_heading=>'Quotation - 2'
,p_static_id=>'quotation-2'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364969958398395190)
,p_heading=>'Quotation - 3'
,p_static_id=>'quotation-3'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364970095828395191)
,p_heading=>'Quotation - 4'
,p_static_id=>'quotation-4'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364970232263395192)
,p_heading=>'Quotation - 5'
,p_static_id=>'quotation-5'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(364970355335395193)
,p_heading=>'Quotation - 6'
,p_static_id=>'quotation-6'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365207612089812922)
,p_name=>'AMOUNT1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>180
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364969684650395187)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'99999999999.99'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365350147850928480)
,p_name=>'AMOUNT2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>260
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364969874857395189)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'99999999999.99'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365350895610928488)
,p_name=>'AMOUNT3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT3'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>340
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364969958398395190)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'99999999999.99'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365351665322928496)
,p_name=>'AMOUNT4'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT4'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>420
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364970095828395191)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'99999999999.99'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365352479922928504)
,p_name=>'AMOUNT5'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT5'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>500
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364970232263395192)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'99999999999.99'
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365207657898812923)
,p_name=>'APPROVED1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPROVED1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Approved'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>190
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(364969684650395187)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(365350197502928481)
,p_name=>'APPROVED2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPROVED2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Approved'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>270
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(364969874857395189)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(365351010087928489)
,p_name=>'APPROVED3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPROVED3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Approved'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>350
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(364969958398395190)
,p_use_group_for=>'BOTH'
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
,p_static_id=>'APPROVED3'
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
 p_id=>wwv_flow_imp.id(365351852551928497)
,p_name=>'APPROVED4'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPROVED4'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Approved'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>430
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(364970095828395191)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(365352612127928505)
,p_name=>'APPROVED5'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'APPROVED5'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Approved'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>510
,p_value_alignment=>'CENTER'
,p_group_id=>wwv_flow_imp.id(364970232263395192)
,p_use_group_for=>'BOTH'
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
 p_id=>wwv_flow_imp.id(365207759381812924)
,p_name=>'C017'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C017'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'C017'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969684650395187)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365350326741928482)
,p_name=>'C025'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C025'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'C025'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>280
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969874857395189)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365351114525928490)
,p_name=>'C033'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C033'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'C033'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>360
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969958398395190)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365351901747928498)
,p_name=>'C041'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C041'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'C041'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>440
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970095828395191)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365352719836928506)
,p_name=>'C049'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'C049'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'C049'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>520
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970232263395192)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365206699464812913)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969795267395188)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365206954128812915)
,p_name=>'ITEMNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969795267395188)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365207002369812916)
,p_name=>'ITEMSPECIFICATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item Specification'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969795267395188)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365206838418812914)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Item Specification Code'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969795267395188)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365206528786812911)
,p_name=>'MEASURINGUNITCODE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MEASURINGUNITCODE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Measuring Unit Code1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969795267395188)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365207211722812918)
,p_name=>'PARTYCODE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Code1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>140
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969684650395187)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365208022113812926)
,p_name=>'PARTYCODE2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Code2'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>220
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969874857395189)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365350555896928484)
,p_name=>'PARTYCODE3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Code3'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>300
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969958398395190)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365351265457928492)
,p_name=>'PARTYCODE4'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE4'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Code4'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>380
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970095828395191)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365352076199928500)
,p_name=>'PARTYCODE5'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE5'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Code5'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>460
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970232263395192)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365207284717812919)
,p_name=>'PARTYNAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969684650395187)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365208082908812927)
,p_name=>'PARTYNAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969874857395189)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365350572328928485)
,p_name=>'PARTYNAME3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>310
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969958398395190)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365351380153928493)
,p_name=>'PARTYNAME4'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME4'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>390
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970095828395191)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365352187764928501)
,p_name=>'PARTYNAME5'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME5'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>470
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970232263395192)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365206357343812910)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364969795267395188)
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
 p_id=>wwv_flow_imp.id(365207437151812920)
,p_name=>'QUOTATIONNO1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONNO1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotation No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969684650395187)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365349934437928478)
,p_name=>'QUOTATIONNO2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONNO2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotation No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>240
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969874857395189)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365350744700928486)
,p_name=>'QUOTATIONNO3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONNO3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotation No3'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>320
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969958398395190)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365351460504928494)
,p_name=>'QUOTATIONNO4'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONNO4'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotation No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>400
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970095828395191)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365352267206928502)
,p_name=>'QUOTATIONNO5'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONNO5'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotation No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>480
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970232263395192)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365207110485812917)
,p_name=>'QUOTATIONTNO1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONTNO1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotation Tno1'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969684650395187)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365207882857812925)
,p_name=>'QUOTATIONTNO2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONTNO2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotationt No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969874857395189)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365350393093928483)
,p_name=>'QUOTATIONTNO3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONTNO3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotation No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>290
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969958398395190)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365351178479928491)
,p_name=>'QUOTATIONTNO4'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONTNO4'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotationt No4'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>370
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970095828395191)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365352051199928499)
,p_name=>'QUOTATIONTNO5'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUOTATIONTNO5'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Quotation Tno5'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>450
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364970232263395192)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365207482105812921)
,p_name=>'RATE1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>170
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364969684650395187)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365349957614928479)
,p_name=>'RATE2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>250
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364969874857395189)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365350793136928487)
,p_name=>'RATE3'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE3'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>330
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364969958398395190)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365351629089928495)
,p_name=>'RATE4'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE4'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>410
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364970095828395191)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365352386458928503)
,p_name=>'RATE5'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE5'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>490
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(364970232263395192)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
 p_id=>wwv_flow_imp.id(365206103066812907)
,p_name=>'SEQ_ID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SEQ_ID'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Seq Id'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365206275923812909)
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
 p_id=>wwv_flow_imp.id(365206176248812908)
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(365206605739812912)
,p_name=>'UOM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UOM'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Uom'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(364969795267395188)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(362776745837306388)
,p_internal_uid=>330734229302896640
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(364974685439395539)
,p_interactive_grid_id=>wwv_flow_imp.id(362776745837306388)
,p_static_id=>'160181'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(364974924931395541)
,p_report_id=>wwv_flow_imp.id(364974685439395539)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349147075371981608)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(365206103066812907)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349148012079981620)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(365206176248812908)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349149054830981632)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(365206275923812909)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349150032992981647)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(365206357343812910)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>84
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349151072764981657)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(365206528786812911)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349151990572981666)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(365206605739812912)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349152983161981672)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(365206699464812913)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349154023713981677)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(365206838418812914)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349154976682981683)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(365206954128812915)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>246
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349156048736981690)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(365207002369812916)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>162
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349156958169981696)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(365207110485812917)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349157876487981703)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(365207211722812918)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>82
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349158919252981709)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(365207284717812919)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>119
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349159970758981716)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(365207437151812920)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>182
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349160955480981722)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(365207482105812921)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349161950730981730)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(365207612089812922)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>115
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349162878240981737)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(365207657898812923)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349163904586981744)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(365207759381812924)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349164942415981751)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(365207882857812925)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349165960280981758)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(365208022113812926)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349166962057981765)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(365208082908812927)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>190
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349167881186981772)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(365349934437928478)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>181
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349168942912981777)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(365349957614928479)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349169943768981782)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(365350147850928480)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349171239287981789)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>25
,p_column_id=>wwv_flow_imp.id(365350197502928481)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>87
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349172137220981795)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>26
,p_column_id=>wwv_flow_imp.id(365350326741928482)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349173142179981800)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>27
,p_column_id=>wwv_flow_imp.id(365350393093928483)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349174110203981806)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>28
,p_column_id=>wwv_flow_imp.id(365350555896928484)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349175148590981811)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>29
,p_column_id=>wwv_flow_imp.id(365350572328928485)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349176120765981817)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>30
,p_column_id=>wwv_flow_imp.id(365350744700928486)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>184
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349177129619981822)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>31
,p_column_id=>wwv_flow_imp.id(365350793136928487)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349178175209981828)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>32
,p_column_id=>wwv_flow_imp.id(365350895610928488)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>110
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349179149381981836)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>33
,p_column_id=>wwv_flow_imp.id(365351010087928489)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349180107587981843)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>34
,p_column_id=>wwv_flow_imp.id(365351114525928490)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349181092188981849)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>35
,p_column_id=>wwv_flow_imp.id(365351178479928491)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349182095791981856)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>36
,p_column_id=>wwv_flow_imp.id(365351265457928492)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349183131035981865)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>37
,p_column_id=>wwv_flow_imp.id(365351380153928493)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>228
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349184103468981874)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>38
,p_column_id=>wwv_flow_imp.id(365351460504928494)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>182
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349185093584981882)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>39
,p_column_id=>wwv_flow_imp.id(365351629089928495)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>63
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349186127631981890)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>40
,p_column_id=>wwv_flow_imp.id(365351665322928496)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>94
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349187031830981900)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>41
,p_column_id=>wwv_flow_imp.id(365351852551928497)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349188065275981908)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>42
,p_column_id=>wwv_flow_imp.id(365351901747928498)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349189049823981916)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>43
,p_column_id=>wwv_flow_imp.id(365352051199928499)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349190059774981922)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>44
,p_column_id=>wwv_flow_imp.id(365352076199928500)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349191065005981927)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>45
,p_column_id=>wwv_flow_imp.id(365352187764928501)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>175
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349191977096981934)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>46
,p_column_id=>wwv_flow_imp.id(365352267206928502)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>180
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349192996222981940)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>47
,p_column_id=>wwv_flow_imp.id(365352386458928503)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>78
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349194008582981947)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>48
,p_column_id=>wwv_flow_imp.id(365352479922928504)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>76
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349194980435981953)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>49
,p_column_id=>wwv_flow_imp.id(365352612127928505)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(349196003233981960)
,p_view_id=>wwv_flow_imp.id(364974924931395541)
,p_display_seq=>50
,p_column_id=>wwv_flow_imp.id(365352719836928506)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(336064959016339192)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(573879776706959559)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41250137533930955)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
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
 p_id=>wwv_flow_imp.id(41251400706930955)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_condition=>'P712_COMPARATIVESTATEMENTNO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41250555230930955)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
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
,p_button_condition=>'P712_COMPARATIVESTATEMENTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41248548280930955)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P712_COMPARATIVESTATEMENTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41248967704930955)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P712_COMPARATIVESTATEMENTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41248124031930955)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P712_COMPARATIVESTATEMENTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41249787938930955)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
,p_button_name=>'PRINT'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P712_COMPARATIVESTATEMENTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41250923014930955)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_condition=>'P712_COMPARATIVESTATEMENTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(41249354459930955)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(911488341579704959)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P712_STATUS.'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P712_COMPARATIVESTATEMENTNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(41289449874930966)
,p_branch_name=>'Go To Page 711'
,p_branch_action=>'f?p=&APP_ID.:711:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(41250555230930955)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375402452699172881)
,p_name=>'P712_CALLEDFROMPAGE'
,p_item_sequence=>50
,p_item_default=>'711'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364998903768722360)
,p_name=>'P712_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365000920717722362)
,p_name=>'P712_COMPARATIVESTATEMENTDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Comparative Statement Date'
,p_source=>'COMPARATIVESTATEMENTDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(365000540225722362)
,p_name=>'P712_COMPARATIVESTATEMENTNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_prompt=>'Comparative Statement No'
,p_source=>'COMPARATIVESTATEMENTNO'
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
 p_id=>wwv_flow_imp.id(365004160305722368)
,p_name=>'P712_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365003694331722368)
,p_name=>'P712_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365003366337722367)
,p_name=>'P712_DEPARTMENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_source=>'DEPARTMENTCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365000135632722362)
,p_name=>'P712_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
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
 p_id=>wwv_flow_imp.id(365001313751722366)
,p_name=>'P712_ENQUIRYTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_prompt=>'Enquiry No'
,p_source=>'ENQUIRYTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P315_ENQUIRY'
,p_lov_cascade_parent_items=>'P712_LOCATIONCODE'
,p_ajax_items_to_submit=>'P712_ENQUIRYTNO,P712_FORMSTATUS,P712_LOCATIONCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>32
,p_cMaxlength=>255
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
 p_id=>wwv_flow_imp.id(364999310088722361)
,p_name=>'P712_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375402895308172886)
,p_name=>'P712_FORMSTATUS'
,p_item_sequence=>100
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365002082274722366)
,p_name=>'P712_INDENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_source=>'INDENTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365004568890722369)
,p_name=>'P712_INTERESTRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_source=>'INTERESTRATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365002554722722366)
,p_name=>'P712_ITEMCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_source=>'ITEMCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365002957187722367)
,p_name=>'P712_ITEMSPECIFICATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_source=>'ITEMSPECIFICATIONCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364999692740722361)
,p_name=>'P712_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_default=>'RC'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'SELECT LOCATIONNAME,LOCATIONCODE FROM LOCATION'
,p_lov_display_null=>'YES'
,p_cSize=>32
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
 p_id=>wwv_flow_imp.id(365004904459722369)
,p_name=>'P712_MAXCREDITDAYS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_source=>'MAXCREDITDAYS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375402815458172885)
,p_name=>'P712_MODULEFLOW'
,p_item_sequence=>90
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375402752708172884)
,p_name=>'P712_ONTHETABLE'
,p_item_sequence=>80
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375402619828172883)
,p_name=>'P712_PASSFAILREMARK'
,p_item_sequence=>70
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(365001717388722366)
,p_name=>'P712_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
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
 p_id=>wwv_flow_imp.id(375403026393172887)
,p_name=>'P712_STATUS'
,p_item_sequence=>110
,p_item_default=>'NVL(getdocumentstatuscode(''ENQUIRY'',:P712_TNO),''STATUS'') '
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(375402578733172882)
,p_name=>'P712_STATUSRIGHT'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(364998593748722350)
,p_name=>'P712_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_item_source_plug_id=>wwv_flow_imp.id(364920311325722292)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41256473709930957)
,p_name=>'Create Collections - csCollection'
,p_static_id=>'create-collections-cscollection'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P712_ENQUIRYTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NOT_EXISTS'
,p_display_when_cond=>'SELECT 1 FROM COMPARATIVESTATEMENT A WHERE A.TNO = :P712_TNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41256980924930958)
,p_event_id=>wwv_flow_imp.id(41256473709930957)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P712_TNO,P712_ENQUIRYTNO,P712_COMPARATIVESTATEMENTDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    'csCollection(to_number(:P712_TNO),to_number(:P712_ENQUIRYTNO),:P712_COMPARATIVESTATEMENTDATE);',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41257484012930958)
,p_event_id=>wwv_flow_imp.id(41256473709930957)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(362776634055306387)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41257882786930958)
,p_name=>'Create Collections - csCollection_For Edit Mode'
,p_static_id=>'create-collections-cscollection-for-edit-mode'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'EXISTS'
,p_display_when_cond=>'SELECT 1 FROM COMPARATIVESTATEMENT WHERE TNO = :P712_TNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41258322911930958)
,p_event_id=>wwv_flow_imp.id(41257882786930958)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P712_TNO,P712_ENQUIRYTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    'createcsCollection(to_number(:P712_TNO),to_number(:P712_ENQUIRYTNO));',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41258879620930958)
,p_event_id=>wwv_flow_imp.id(41257882786930958)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(362776634055306387)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41262862980930959)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41263396591930959)
,p_event_id=>wwv_flow_imp.id(41262862980930959)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from COMPARATIVESTATEMENTDETAIL a',
    '    where not exists (',
    '        select 1 from COMPARATIVESTATEMENT  aa  ',
    '        where aa.tno = a.tno',
    '    );',
    '',
    'delete from comparativestatementitem a',
    '    where not exists (',
    '        select 1 from COMPARATIVESTATEMENT  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41287517881930965)
,p_name=>'delete unsaved record from detail table'
,p_static_id=>'delete-unsaved-record-from-detail-table'
,p_event_sequence=>200
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41288053017930965)
,p_event_id=>wwv_flow_imp.id(41287517881930965)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from COMPARATIVESTATEMENTDETAIL a',
    '    where not exists (',
    '        select 1 from COMPARATIVESTATEMENT  aa  ',
    '        where aa.tno = a.tno',
    '    );',
    '',
    'delete from comparativestatementitem a',
    '    where not exists (',
    '        select 1 from COMPARATIVESTATEMENT  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41276714475930963)
,p_name=>'Delete unsaved records'
,p_static_id=>'delete-unsaved-records'
,p_event_sequence=>140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41250137533930955)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41277126880930963)
,p_event_id=>wwv_flow_imp.id(41276714475930963)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from COMPARATIVESTATEMENTDETAIL a',
    '    where not exists (',
    '        select 1 from COMPARATIVESTATEMENT  aa  ',
    '        where aa.tno = a.tno',
    '    );',
    '',
    'delete from comparativestatementitem a',
    '    where not exists (',
    '        select 1 from COMPARATIVESTATEMENT  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41277575114930963)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>150
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41278537628930963)
,p_event_id=>wwv_flow_imp.id(41277575114930963)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41279101573930963)
,p_event_id=>wwv_flow_imp.id(41277575114930963)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P712_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41279608830930963)
,p_event_id=>wwv_flow_imp.id(41277575114930963)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from loadingadvice aa where aa.purchaseordertno = :P712_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41280019092930964)
,p_event_id=>wwv_flow_imp.id(41277575114930963)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from paymentadvice aa where aa.moduletno = :P712_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41278108081930963)
,p_event_id=>wwv_flow_imp.id(41277575114930963)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'   and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41285218962930965)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>180
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41286219268930965)
,p_event_id=>wwv_flow_imp.id(41285218962930965)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41285723026930965)
,p_event_id=>wwv_flow_imp.id(41285218962930965)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41280455624930964)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>160
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41280934967930964)
,p_event_id=>wwv_flow_imp.id(41280455624930964)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
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
 p_id=>wwv_flow_imp.id(41282012538930964)
,p_event_id=>wwv_flow_imp.id(41280455624930964)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P712_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41282465770930964)
,p_event_id=>wwv_flow_imp.id(41280455624930964)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from loadingadvice aa where aa.purchaseordertno = :P712_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41282990667930964)
,p_event_id=>wwv_flow_imp.id(41280455624930964)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>'select 1 from paymentadvice aa where aa.moduletno = :P712_TNO;'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41281426439930964)
,p_event_id=>wwv_flow_imp.id(41280455624930964)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
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
 p_id=>wwv_flow_imp.id(41283503276930964)
,p_event_id=>wwv_flow_imp.id(41280455624930964)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-enable-2'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P712_ISOPENSPEC'
,p_server_condition_expr2=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41283906157930964)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>170
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41284891996930965)
,p_event_id=>wwv_flow_imp.id(41283906157930964)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41284382768930965)
,p_event_id=>wwv_flow_imp.id(41283906157930964)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41268608588930961)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41249354459930955)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41272094130930962)
,p_event_id=>wwv_flow_imp.id(41268608588930961)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P712_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41271532395930961)
,p_event_id=>wwv_flow_imp.id(41268608588930961)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41269529525930961)
,p_event_id=>wwv_flow_imp.id(41268608588930961)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P712_TNO,P712_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '--SetDocumentStatusCode(''PURCHASEORDER'',13604,:P712_STATUS);',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P712_TNO,:P712_STATUS);')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41270056437930961)
,p_event_id=>wwv_flow_imp.id(41268608588930961)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text($v(''P712_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41270605175930961)
,p_event_id=>wwv_flow_imp.id(41268608588930961)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41271034779930961)
,p_event_id=>wwv_flow_imp.id(41268608588930961)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41269081691930961)
,p_event_id=>wwv_flow_imp.id(41268608588930961)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P712_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41273380344930962)
,p_name=>'Enable Disable Buttons Based On Module Flow'
,p_static_id=>'enable-disable-buttons-based-on-module-flow'
,p_event_sequence=>120
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41273836341930962)
,p_event_id=>wwv_flow_imp.id(41273380344930962)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41248124031930955)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P712_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41274395484930962)
,p_event_id=>wwv_flow_imp.id(41273380344930962)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41248548280930955)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P712_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41274884535930962)
,p_event_id=>wwv_flow_imp.id(41273380344930962)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41249354459930955)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P712_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41275372056930962)
,p_event_id=>wwv_flow_imp.id(41273380344930962)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(41248967704930955)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P712_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41266126820930960)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>90
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41248548280930955)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41267126273930960)
,p_event_id=>wwv_flow_imp.id(41266126820930960)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P712_TNO,P712_COMPANYCODE,P712_PORECEIPTNO,P712_PASSFAILREMARK',
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
    '                        AND A.ModuleTno = :P712_TNO',
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
    '    TMP VARCHAR2(100) := :P712_TNO;',
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
    '						a.remark = :P712_PASSFAILREMARK',
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
 p_id=>wwv_flow_imp.id(41267659694930961)
,p_event_id=>wwv_flow_imp.id(41266126820930960)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41268203495930961)
,p_event_id=>wwv_flow_imp.id(41266126820930960)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41266687319930960)
,p_event_id=>wwv_flow_imp.id(41266126820930960)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P712_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41286653597930965)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>190
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41287126935930965)
,p_event_id=>wwv_flow_imp.id(41286653597930965)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41288423574930966)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P712_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41288928225930966)
,p_event_id=>wwv_flow_imp.id(41288423574930966)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41275772003930962)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41250137533930955)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41276246457930963)
,p_event_id=>wwv_flow_imp.id(41275772003930962)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P712_CALLEDFROMPAGE'').getValue();',
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
 p_id=>wwv_flow_imp.id(41263736313930960)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41248124031930955)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41264720126930960)
,p_event_id=>wwv_flow_imp.id(41263736313930960)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P712_TNO,P712_COMPANYCODE,P712_PASSFAILREMARK,P712_PORECEIPTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) := :P712_PORECEIPTNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P712_TNO --'':P''||:APP_PAGE_ID||''_TNo''',
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
    '				a.remark = :P712_PASSFAILREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(getModuleCodeForPageNo(:APP_PAGE_ID), :P712_TNO , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41265222864930960)
,p_event_id=>wwv_flow_imp.id(41263736313930960)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41265787322930960)
,p_event_id=>wwv_flow_imp.id(41263736313930960)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41264263678930960)
,p_event_id=>wwv_flow_imp.id(41263736313930960)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P712_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41272425078930962)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>110
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(41249354459930955)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41272950489930962)
,p_event_id=>wwv_flow_imp.id(41272425078930962)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41259281692930958)
,p_name=>'Row Initialization'
,p_static_id=>'row-initialization'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(362776634055306387)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41259802416930959)
,p_event_id=>wwv_flow_imp.id(41259281692930958)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'APPROVED1,APPROVED2,APPROVED3,APPROVED4,APPROVED5'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'NO')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41260189236930959)
,p_name=>'Selection Change'
,p_static_id=>'selection-change'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(362776634055306387)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41260685274930959)
,p_event_id=>wwv_flow_imp.id(41260189236930959)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'APPROVED1,APPROVED2,APPROVED3,APPROVED4,APPROVED5'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'NO')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41261040277930959)
,p_name=>'set detail table'
,p_static_id=>'set-detail-table'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P712_ENQUIRYTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41261599507930959)
,p_event_id=>wwv_flow_imp.id(41261040277930959)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P712_TNO,P712_ENQUIRYTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '',
    '    insert into COMPARATIVESTATEMENTDETAIL',
    '    (',
    '        TNO,',
    '        SNO,',
    '        SERIALNO,',
    '        QUOTATIONTNO,',
    '        AMOUNT,',
    '        CREDITCOST,',
    '        LANDINGCOST,',
    '        COSTRANK',
    '    )',
    '    select :P712_TNO , GLOBALTNO.NEXTVAL ,GLOBALTNO.NEXTVAL,  TNO , AMOUNT , null,null,null ',
    '    from quotationdetail',
    '    where tno in (select tno from quotation',
    '                  where ENQUIRYTNO = :P712_ENQUIRYTNO);',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(41261954176930959)
,p_name=>'set item table'
,p_static_id=>'set-item-table'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P712_ENQUIRYTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(41262508116930959)
,p_event_id=>wwv_flow_imp.id(41261954176930959)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P712_TNO,P712_ENQUIRYTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '',
    '    insert into comparativestatementitem',
    '    (TNO,',
    '    SNO,',
    '    SERIALNO,',
    '    ITEMCODE,',
    '    ITEMSPECIFICATIONCODE,',
    '    QUOTATIONTNO,',
    '    QUANTITY1,',
    '    QUANTITY2)',
    '    select :P712_TNO , GLOBALTNO.NEXTVAL ,null,ITEMCODE ,ITEMSPECIFICATIONCODE , null, QUANTITY1 , QUANTITY2 ',
    '    from enquiryitemdetail',
    '    where tno = :P712_ENQUIRYTNO;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41235313968930949)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(362776634055306387)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CS Detail - Save Interactive Grid Data_1'
,p_static_id=>'cs-detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
' --raise_application_error(-20000,:P712_TNO);',
'  --raise_application_error(-20000,:quotationtno1);',
'if :quotationtno1 is not null then',
'  DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  --raise_application_error(-20000,:ITEMCODE);',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,1,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO1,:QUANTITY1)',
'  ;',
'end if;',
'',
'if :quotationtno2 is not null  then',
' DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,2,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO2,:QUANTITY1)',
'  ;',
'end if;',
'',
'',
'if :QUOTATIONTNO3 is not null  then',
'DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,3,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO3,:QUANTITY3)',
'  ;',
'end if;',
'',
'',
'',
'if :quotationtno4 is not null  then',
' DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,4,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO4,:QUANTITY4)',
'  ;',
'end if;',
'',
'',
'if :quotationtno5 is not null  then',
' DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,5,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO5,:QUANTITY5)',
'  ;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(286317773439116613)
,p_process_when_type=>'NEVER'
,p_internal_uid=>9192797434521201
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41235628031930949)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(362776634055306387)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CS Detail - Save Interactive Grid Data'
,p_static_id=>'cs-detail-save-interactive-grid-data-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'declare',
'	tmp number:=0;',
'',
'begin',
'',
'if :QUOTATIONTNO1 IS NOT NULL THEN',
' INSERT INTO COMPARATIVESTATEMENTDETAIL( TNO,SNO,SERIALNO,QUOTATIONTNO,AMOUNT)',
'   VALUES (:P712_TNO,GLOBALTNO.NEXTVAL,1,:QUOTATIONTNO1,:AMOUNT1);',
'End if;',
'',
'if :quotationtno1 is not null and NVL(:approved1,''NO'') = ''YES'' then',
'  DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  ',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,1,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO1,:QUANTITY1);',
'  ',
'  tmp:=1;',
'  ',
'  else',
'  ',
'  if tmp = 0 then',
'  ',
'  DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  ',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,1,:ITEMCODE,:ITEMSPECIFICATIONCODE,null ,:QUANTITY1);',
'  ',
'  tmp:=1;',
'  ',
'  end if;',
'  ',
'end if;',
'',
'if :QUOTATIONTNO2 IS NOT NULL THEN',
'   INSERT INTO COMPARATIVESTATEMENTDETAIL( TNO,SNO,SERIALNO,QUOTATIONTNO,AMOUNT)',
'   VALUES (:P712_TNO,GLOBALTNO.NEXTVAL,2,:QUOTATIONTNO2,:AMOUNT2);',
'End if;',
'',
'if :quotationtno2 is not null and NVL(:approved2,''NO'') = ''YES'' then',
' DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
' ',
' insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,2,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO2,:QUANTITY1);',
'  ',
'   tmp:=1;',
'  ',
'  else',
'  ',
'  if tmp = 0 then',
'  ',
'  DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  ',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,2,:ITEMCODE,:ITEMSPECIFICATIONCODE,null ,:QUANTITY1);',
'  ',
'  tmp:=1;',
'  ',
'  end if;',
'end if;',
'',
'if :QUOTATIONTNO3 IS NOT NULL THEN',
' ',
'  INSERT INTO COMPARATIVESTATEMENTDETAIL( TNO,SNO,SERIALNO,QUOTATIONTNO,AMOUNT)',
'   VALUES (:P712_TNO,GLOBALTNO.NEXTVAL,3,:QUOTATIONTNO3,:AMOUNT3);',
'End if;',
'',
'if :QUOTATIONTNO3 is not null and NVL(:approved3,''NO'') = ''YES'' then',
' DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'',
'',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,3,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO3,:QUANTITY3);',
'  ',
'   tmp:=1;',
'  ',
'  else',
'  ',
'  if tmp = 0 then',
'  ',
'  DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  ',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,3,:ITEMCODE,:ITEMSPECIFICATIONCODE,null ,:QUANTITY1);',
'  ',
'  tmp:=1;',
'  ',
'  end if;',
'  ',
'end if;',
'',
'if :QUOTATIONTNO4 IS NOT NULL THEN',
'   INSERT INTO COMPARATIVESTATEMENTDETAIL( TNO,SNO,SERIALNO,QUOTATIONTNO,AMOUNT)',
'   VALUES (:P712_TNO,GLOBALTNO.NEXTVAL,4,:QUOTATIONTNO4,:AMOUNT4);',
'End if;',
'',
'if :quotationtno4 is not null and NVL(:approved4,''NO'') = ''YES'' then',
' DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'',
'',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,4,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO4,:QUANTITY4);',
'  ',
'   tmp:=1;',
'  ',
'  else',
'  ',
'  if tmp = 0 then',
'  ',
'  DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  ',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,4,:ITEMCODE,:ITEMSPECIFICATIONCODE,null ,:QUANTITY1);',
'  ',
'  tmp:=1;',
'  ',
'  end if;',
'  ',
'end if;',
'',
'if :QUOTATIONTNO5 IS NOT NULL THEN',
'  INSERT INTO COMPARATIVESTATEMENTDETAIL( TNO,SNO,SERIALNO,QUOTATIONTNO,AMOUNT)',
'   VALUES (:P712_TNO,GLOBALTNO.NEXTVAL,5,:QUOTATIONTNO5,:AMOUNT5);',
'End if;',
'',
'if :quotationtno5 is not null and NVL(:approved5,''NO'') = ''YES'' then',
' DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'',
'',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,5,:ITEMCODE,:ITEMSPECIFICATIONCODE,:QUOTATIONTNO5,:QUANTITY5);',
'  ',
'   tmp:=1;',
'  ',
'  else',
'  ',
'  if tmp = 0 then',
'  ',
'  DELETE FROM comparativestatementitem WHERE TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  ',
'  insert into comparativestatementitem ( tno,sno,serialno,itemcode,itemspecificationcode,quotationtno,quantity1)',
'  values ( :P712_TNO,GLOBALTNO.NEXTVAL,5,:ITEMCODE,:ITEMSPECIFICATIONCODE,null ,:QUANTITY1);',
'  ',
'  tmp:=1;  ',
'  end if;  ',
'end if;',
'',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(286317773439116613)
,p_process_when_type=>'NEVER'
,p_internal_uid=>9193111497521201
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41236081953930950)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(362776634055306387)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'CS Detail - Save Interactive Grid Data_2'
,p_static_id=>'cs-detail-save-interactive-grid-data-3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'if :quotationtno1 is not null and NVL(:approved1,''NO'') = ''YES'' then',
'  ',
'  update comparativestatementitem',
'  set quotationtno = :QUOTATIONTNO1',
'  where TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'   ',
'end if;',
'',
'if :quotationtno2 is not null and NVL(:approved2,''NO'') = ''YES'' then',
'',
'  update comparativestatementitem',
'  set quotationtno = :QUOTATIONTNO2',
'  where TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'',
'end if;',
'',
'if :QUOTATIONTNO3 is not null and NVL(:approved3,''NO'') = ''YES'' then',
'',
'  update comparativestatementitem',
'  set quotationtno = :QUOTATIONTNO3',
'  where TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  ',
'end if;',
'',
'if :quotationtno4 is not null and NVL(:approved4,''NO'') = ''YES'' then',
'  update comparativestatementitem',
'  set quotationtno = :QUOTATIONTNO4',
'  where TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'  ',
'end if;',
'',
'',
'if :quotationtno5 is not null and NVL(:approved5,''NO'') = ''YES'' then',
'',
'  update comparativestatementitem',
'  set quotationtno = :QUOTATIONTNO5',
'  where TNO = :P712_TNO AND ITEMCODE = :ITEMCODE AND ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;',
'end if;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9193565419521202
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41254460901930957)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Details'
,p_static_id=>'delete-details'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DELETE FROM COMPARATIVESTATEMENTDETAIL WHERE TNO = :P712_TNO;',
'DELETE FROM comparativestatementitem WHERE TNO = :P712_tno;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(41250555230930955)
,p_internal_uid=>9211944367521209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41254861771930957)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Det Doc No'
,p_static_id=>'det-doc-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P712_TNO is null then',
'        Select GlobalTno.NextVal into :P712_TNO From Dual;',
'     end if;',
'    ----',
'    if :P712_COMPARATIVESTATEMENTNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P712_LOCATIONCODE,',
'					:P712_DOCTYPECODE,',
'					NULL,',
'					TO_DATE(:P712_COMPARATIVESTATEMENTDATE, ''DD-MM-RRRR'')',
'				);',
'        :P712_COMPARATIVESTATEMENTNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P712_LOCATIONCODE,',
'                    :P712_DOCTYPECODE,',
'                    NULL,',
'                    TO_DATE(:P712_COMPARATIVESTATEMENTDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9212345237521209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41255234331930957)
,p_process_sequence=>70
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
'       :P712_MODULEFLOW := ''YES'';',
'   else',
'       :P712_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P71_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P712_ONTHETABLE := ''YES'' ;',
'   else',
'       :P712_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9212717797521209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41254087474930957)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getTNO'
,p_static_id=>'gettno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P712_TNO is null then',
'   select globaltno.nextval into :P712_TNO from dual;',
'   :P712_FORMSTATUS := ''NEWRECORD'';',
'',
'   else',
'',
'    :P712_FORMSTATUS := ''EDITRECORD'';',
'',
'end if;',
'',
':P712_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P712_TNO), ''Status'');'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9211570940521209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41247072759930954)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(364920311325722292)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Comparative Statement'
,p_static_id=>'initialize-form-comparative-statement'
,p_internal_uid=>9204556225521206
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41256104636930957)
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
,p_internal_uid=>9213588102521209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41247441263930954)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(364920311325722292)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Comparative Statement'
,p_static_id=>'process-form-comparative-statement'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9204924729521206
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(41255631243930957)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P712_TNO, :P712_CUSTOMERORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(41251400706930955)
,p_internal_uid=>9213114709521209
);
end;
/
prompt --application/end_environment
begin
wwv_flow_imp.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false)
);
commit;
end;
/
set verify on feedback on define on
prompt  ...done
