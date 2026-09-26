prompt --application/pages/page_00641
begin
--   Manifest
--     PAGE: 00641
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
 p_id=>641
,p_name=>'SALARY'
,p_alias=>'SALARY1'
,p_step_title=>'SALARY'
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
'  var bireporturl = $(''#P641_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/SALARYSLIP.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P641_SALARYFROMDATE'').val());',
'  var toDate = new Date($(''#P641_SALARYTODATE'').val());',
'',
'  var reportParams = ',
'      ''&P_COMPANY=''+ $(''#P641_COMPANYCODE'').val() +  ',
'      ''&P_LOCATION=''+  $(''#P641_LOCATIONCODE'').val() +',
'      ''&P_FROMDATE='' +$(''#P641_SALARYFROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P641_SALARYTODATE'').val() +',
'      ''&P_EMPLOYEE='' +$(''#P641_EMPLOYEECODE'').val() +',
'      ''&P_DESIGNATION='' +$(''#P641_EMPLOYEEDESIGNATION'').val() +',
'      ''&P_DEPARTMENT='' +$(''#P641_EMPLOYEEDEPARTMENT'').val() ',
'       ',
'      ;',
'  ',
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
'  var bireporturl = $(''#P641_BIREPORTURL'').val()',
'  var reportName =  ''SALARYSLIP.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"'' +$(''#P641_COMPANYCODE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P641_LOCATIONCODE'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P641_SALARYFROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P641_SALARYTODATE'').val() + ''",'' + ',
'	  ''"_paramsP_EMPLOYEE":"'' + $(''#P641_EMPLOYEECODE'').val() + ''",'' + ',
'	  ''"_paramsP_DESIGNATION":"'' +$(''#P641_EMPLOYEEDESIGNATION'').val() + ''",'' +',
'	  ''"_paramsP_DEPARTMENT":"'' +$(''#P641_EMPLOYEEDEPARTMENT'').val() ;',
'     ',
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
''))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 0.90rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(493445519966908594)
,p_plug_name=>'Arrear'
,p_static_id=>'arrear'
,p_parent_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_display_column=>9
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(860756263198323838)
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
 p_id=>wwv_flow_imp.id(1228386480904961868)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>40
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(487063026779390379)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>3223171818405608528
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(493445598654908595)
,p_plug_name=>'New'
,p_static_id=>'new-2'
,p_parent_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(471437251447529746)
,p_plug_name=>'Salary'
,p_static_id=>'salary'
,p_region_name=>'SALARY'
,p_parent_plug_id=>wwv_flow_imp.id(487063026779390379)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       LOCATIONCODE,',
'       DOCTYPECODE,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       SALARYNO,',
'       SALARYDATE,',
'       SALARYFROMDATE,',
'       SALARYTODATE,',
'       EMPLOYEECODE,',
'       EMPLOYEESALARYTNO,',
'       REMARK,',
'       ARREARDATE,',
'       ARREARMODULECODE,',
'       ARREARMODULETNO,',
'       EMPLOYEESALARYTNOFROMDATE,',
'       CREATOR,',
'       DATEOFENTERY,',
'       EMPLOYEECOMPANYCODE,',
'       MODULECODE,',
'       MODULETNO,',
'       MODULESNO,',
'       CREATIONTIME,',
'       DEPARTMENTCODE',
'  from SALARY',
'  '))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(471462889694530561)
,p_plug_name=>'SalaryDetail'
,p_static_id=>'salarydetail'
,p_parent_plug_id=>wwv_flow_imp.id(487063026779390379)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       SNO,',
'       SERIALNO,',
'       SALARYHEADCODE,',
'       SALARYHEADFORMULA,',
'       SALARYHEADAMOUNT,',
'       REVISEDFORMULA,',
'       REVISEDVALUE,',
'       ARREARFORMULA,',
'       ARREARAMOUNT,',
'       ARREARGIVEN',
'  from SALARYDETAIL',
'  where tno = :P641_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P641_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'SalaryDetail'
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
 p_id=>wwv_flow_imp.id(471464218984530574)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471464275064530575)
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
 p_id=>wwv_flow_imp.id(471463977304530572)
,p_name=>'ARREARAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ARREARAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Arrear Amount'
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471463949297530571)
,p_name=>'ARREARFORMULA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ARREARFORMULA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Arrear Formula'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(471464080365530573)
,p_name=>'ARREARGIVEN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ARREARGIVEN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Arrear Given'
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471463731043530569)
,p_name=>'REVISEDFORMULA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REVISEDFORMULA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Revised Formula'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(471463796482530570)
,p_name=>'REVISEDVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REVISEDVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Revised Value'
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
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471463641859530568)
,p_name=>'SALARYHEADAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALARYHEADAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Salary Head Amount'
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
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471463411301530566)
,p_name=>'SALARYHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALARYHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Salary Head'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SALARYHEADNAME , SALARYHEADCODE from salaryhead',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
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
 p_id=>wwv_flow_imp.id(471463541065530567)
,p_name=>'SALARYHEADFORMULA'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SALARYHEADFORMULA'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Salary Head Formula'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(471463308842530565)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Serial No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471463189285530564)
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
,p_enable_sort_group=>true
,p_enable_control_break=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(471463128517530563)
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
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(471463018408530562)
,p_internal_uid=>261922642208160193
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
 p_id=>wwv_flow_imp.id(471552488967005980)
,p_interactive_grid_id=>wwv_flow_imp.id(471463018408530562)
,p_static_id=>'221694'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(471552724566005982)
,p_report_id=>wwv_flow_imp.id(471552488967005980)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471553199074005988)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(471463128517530563)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471553986920005991)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(471463189285530564)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471554952311005993)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(471463308842530565)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>96
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471555777324005995)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(471463411301530566)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>276
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471556693575005997)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(471463541065530567)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>287
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471557592341005999)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(471463641859530568)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>166
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471558503962006001)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(471463731043530569)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471559461965006003)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(471463796482530570)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>122
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471560298466006005)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(471463949297530571)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>118
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471561265815006008)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(471463977304530572)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>123
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471562155039006011)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(471464080365530573)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(471915893757758882)
,p_view_id=>wwv_flow_imp.id(471552724566005982)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(471464218984530574)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219053819141667574)
,p_button_sequence=>340
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record?'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219051380608667573)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(471462889694530561)
,p_button_name=>'Calculate'
,p_static_id=>'calculate'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Calculate'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219056240234667575)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
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
 p_id=>wwv_flow_imp.id(219057431506667575)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P641_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219056654043667575)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
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
,p_button_condition=>'P641_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219027416302667559)
,p_button_sequence=>320
,p_button_plug_id=>wwv_flow_imp.id(493445519966908594)
,p_button_name=>'DeleteArrear'
,p_static_id=>'deletearrear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete Arrear'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219052606520667573)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(471462889694530561)
,p_button_name=>'Deletearrearforgivenmonth'
,p_static_id=>'deletearrearforgivenmonth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete Arrear For Given Month'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219052203750667573)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(471462889694530561)
,p_button_name=>'Deletesalaryforgivenmonth'
,p_static_id=>'deletesalaryforgivenmonth'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete Salary For Given Month'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219054671013667574)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P641_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219055059716667574)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P641_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219054241410667574)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
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
,p_button_condition=>'P641_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219027821204667560)
,p_button_sequence=>330
,p_button_plug_id=>wwv_flow_imp.id(493445519966908594)
,p_button_name=>'PrepareArrear'
,p_static_id=>'preparearrear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Prepare Arrear'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219051859984667573)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(471462889694530561)
,p_button_name=>'Prepareforall'
,p_static_id=>'prepareforall'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Prepare For All'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219055796053667575)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P641_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219057003561667575)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P641_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(219055400986667575)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(860756263198323838)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P118_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P641_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(219094108902667590)
,p_branch_name=>'Go To Page 640'
,p_branch_action=>'f?p=&APP_ID.:640:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471022773753805298)
,p_name=>'P641_ARREARDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(493445519966908594)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_prompt=>'Arrear Date'
,p_source=>'ARREARDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(489108698849521573)
,p_name=>'P641_ARREARFROMMONTH'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(493445519966908594)
,p_prompt=>'Arrear From Month'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471025046235805300)
,p_name=>'P641_ARREARMODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'ARREARMODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471025153437805301)
,p_name=>'P641_ARREARMODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'ARREARMODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(489108814690521574)
,p_name=>'P641_ARREARTOMONTH'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(493445519966908594)
,p_prompt=>'Arrear To Month'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1314814064402203869)
,p_name=>'P641_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1256195719185935477)
,p_name=>'P641_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_item_default=>'640'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(572829636852026533)
,p_name=>'P641_CALLEDFROMTNO'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471024008304805290)
,p_name=>'P641_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471467670775530559)
,p_name=>'P641_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471025342795805303)
,p_name=>'P641_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471023233254805303)
,p_name=>'P641_DATEOFENTERY'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(493445519966908594)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_prompt=>'Date of Entry'
,p_source=>'DATEOFENTERY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_grid_label_column_span=>4
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(471467758791530560)
,p_name=>'P641_DEPARTMENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_prompt=>'Department'
,p_source=>'DEPARTMENTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select departmentname , departmentcode from department'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(471023914167805289)
,p_name=>'P641_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
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
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(471024641973805296)
,p_name=>'P641_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_prompt=>'Employee'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'SELECT EMPLOYEENAME D, EMPLOYEECODE R FROM EMPLOYEE '
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(471025587830805305)
,p_name=>'P641_EMPLOYEECOMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'EMPLOYEECOMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(495039233821263706)
,p_name=>'P641_EMPLOYEEDEPARTMENT'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(495039320304263707)
,p_name=>'P641_EMPLOYEEDESIGNATION'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471024722995805297)
,p_name=>'P641_EMPLOYEESALARYTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'EMPLOYEESALARYTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471025293111805302)
,p_name=>'P641_EMPLOYEESALARYTNOFROMDATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'EMPLOYEESALARYTNOFROMDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471024187408805291)
,p_name=>'P641_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471467847004530561)
,p_name=>'P641_FORMONTH'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_prompt=>'For Month'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FORMONTH'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'TOTAL_DAYS:P641_TOTALDAYS,FROMDATE:P641_SALARYFROMDATE,TODATE:P641_SALARYTODATE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1256195632706935476)
,p_name=>'P641_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471023835895805288)
,p_name=>'P641_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
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
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_cMaxlength=>30
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(471025647242805306)
,p_name=>'P641_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1256191915389935439)
,p_name=>'P641_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471025809917805308)
,p_name=>'P641_MODULESNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'MODULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471025752825805307)
,p_name=>'P641_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(490916344010568624)
,p_name=>'P641_MONTH'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_item_default=>'635'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1255600136285664173)
,p_name=>'P641_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1230248654150310637)
,p_name=>'P641_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471024815069805298)
,p_name=>'P641_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_prompt=>'Remark'
,p_source=>'REMARK'
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
 p_id=>wwv_flow_imp.id(471024317157805293)
,p_name=>'P641_SALARYDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Salary Date'
,p_source=>'SALARYDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(471024411602805294)
,p_name=>'P641_SALARYFROMDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_prompt=>'Salary from date'
,p_source=>'SALARYFROMDATE'
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
 p_id=>wwv_flow_imp.id(471024240505805292)
,p_name=>'P641_SALARYNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_prompt=>'Salary No.'
,p_source=>'SALARYNO'
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
 p_id=>wwv_flow_imp.id(471024592715805295)
,p_name=>'P641_SALARYTODATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_prompt=>'salary to date'
,p_format_mask=>'DD-MM-RRRR'
,p_source=>'SALARYTODATE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(471468065930530563)
,p_name=>'P641_STAFFTYPE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_prompt=>'Staff Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select stafftypename , stafftypecode from stafftype'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(720178424552383408)
,p_name=>'P641_STATUS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P641_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1230248490505310636)
,p_name=>'P641_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1228386480904961868)
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
 p_id=>wwv_flow_imp.id(471023758274805287)
,p_name=>'P641_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_item_source_plug_id=>wwv_flow_imp.id(471437251447529746)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(471467983812530562)
,p_name=>'P641_TOTALDAYS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(493445598654908595)
,p_prompt=>'Total Days'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_css_classes=>'apex_disabled'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219087531647667588)
,p_name=>'Calculate'
,p_static_id=>'calculate'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219051380608667573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219087981877667588)
,p_event_id=>wwv_flow_imp.id(219087531647667588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin		',
    '		for vSalary ',
    '			in (',
    '					select',
    '							b.TNo',
    '					from AttendenceRevision a, Salary b',
    '					where a.EmployeeCode = b.EmployeeCode',
    '							and a.RevisionForFromDate = b.SalaryFromDate',
    '							and a.RevisionForToDate = b.SalaryToDate									',
    '							and a.EmployeeCode = :P641_EmployeeCode',
    '							and a.SalaryFromDate = :P641_SalaryFromDate',
    '							and a.SalaryToDate = :P641_SalaryToDate',
    '							and getemployeedepartmentcode(a.employeecode,:P641_SalaryFromDate) = :P641_DepartmentCode',
    '							',
    '			)',
    '		loop',
    '				--SalaryForRevisedAttendence(vSalary.TNo);',
    '                null;',
    '		end loop;',
    '				',
    '		IF NVL(GetMyParameterValue(''ATTENDENCEBASIS''),''DAILY'')=''DAILY'' THEN',
    '				PrepareAttendencePeriodical(:P641_locationcode, :P641_doctypecode, :P641_SalaryDate, :P641_employeecode, :P641_SalaryFromDate, :P641_SalaryToDate, :global_companycode, :global_financialyearcode );',
    '		end if;',
    '		',
    '		SetSalaryHeadAmount(:P641_EMPLOYEESALARYTNO,:P641_EMPLOYEESALARYTNOFROMDATE, ',
    '                            :P641_EMPLOYEECODE , :P641_SALARYFROMDATE,:P641_SALARYTODATE,',
    '                        null,null,:P641_TOTALDAYS,:P641_SALARYDATE,null);',
    '',
    'end;',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219088543860667588)
,p_event_id=>wwv_flow_imp.id(219087531647667588)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(471462889694530561)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219084223123667586)
,p_name=>'Delete Arrear'
,p_static_id=>'delete-arrear'
,p_event_sequence=>150
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219027416302667559)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219084689826667586)
,p_event_id=>wwv_flow_imp.id(219084223123667586)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P641_SALARYFROMDATE,P641_LOCATIONCODE,P641_EMPLOYEECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '',
    '    tmp number;',
    '',
    'begin',
    '',
    '    select',
    '    		count(a.tno) into tmp',
    '    from ModulePrivilege a, Bossuser b',
    '    where a.ModuleCode = getModuleCodeForPageNo(:APP_PAGE_ID)',
    '    		and a.BossUserCode = a.BossUserCode',
    '    		and b.LoginName = :global_loginname',
    '    		and a.OtherPrivilege = ''YES''',
    '    		and a.CompanyCode = :global_CompanyCode',
    '    ;',
    '',
    '    if nvl(tmp, 0) = 0 then',
    '    		',
    '            raise_application_error(-20000,''Please ask administrator for Other privilege'');',
    '    end if;  ',
    '',
    '    select',
    '    		count(a.TNo) into tmp',
    '    from Salary a, SalaryVoucherDetail b, salaryvoucher c',
    '    where a.SalaryFromDate = :P641_SalaryFromDate',
    '    		and a.CompanyCode = :global_CompanyCode',
    '    		and a.Locationcode = :P641_LocationCode',
    '    		and a.TNO = b.SalaryTNo',
    '    		and b.tno = c.tno',
    '    		and c.doctypecode = ''ARREAR''',
    '    ;',
    '    if nvl(tmp, 0) > 0 then',
    '    		',
    '            raise_application_error(-20000,''Arrear Voucher already prepared'');',
    '    end if;',
    '    	',
    '    	',
    '',
    '    declare',
    '    		tSalaryFromDate Date := :P641_SalaryFromDate;	',
    '    		tLocationCode Varchar2(30) := :P641_LocationCode;',
    '    		--tLocationName Varchar2(100) := :P641_LocationName;',
    '    		tEmployeeCode	Varchar2(30) := :P641_EmployeeCode;',
    '    		--tEmployeeName Varchar2(100) := :P641_EmployeeName;',
    '    begin',
    '    		',
    '    			',
    '    				update SalaryDetail a ',
    '    					SET a.ARREARFORMULA = NULL,',
    '    							a.ARREARAMOUNT=NULL,',
    '    							a.ARREARGIVEN=NULL',
    '    						where exists(',
    '    								select',
    '    										aa.TNo',
    '    								from Salary aa',
    '    								where aa.TNo = a.TNo',
    '    										and aa.SalaryFromDate = tSalaryFromDate						',
    '    										and aa.CompanyCode = :global_CompanyCode',
    '    										and aa.LocationCode = tLocationCode',
    '    										and aa.employeecode = tEmployeeCode',
    '    						)',
    '    				;',
    '    				update Salary aa set aa.arreardate = null',
    '    						where aa.SalaryFromDate = tSalaryFromDate		',
    '    								and aa.CompanyCode = :global_CompanyCode				',
    '    								and aa.LocationCode = tLocationCode',
    '    								and aa.employeecode = tEmployeeCode',
    '    				;',
    '    				',
    '    			',
    '    				--RefreshLoanDeductedCommit(:global_CompanyCode);',
    '    				',
    '    			',
    '    End;',
    'end;',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219085751945667587)
,p_event_id=>wwv_flow_imp.id(219084223123667586)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(471462889694530561)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219085202546667587)
,p_event_id=>wwv_flow_imp.id(219084223123667586)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'JAVASCRIPT_EXPRESSION'
,p_affected_elements=>'apex.message.showPageSuccess("Successfully Deleted.");'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219091702335667589)
,p_name=>'Delete Arrear for given month'
,p_static_id=>'delete-arrear-for-given-month'
,p_event_sequence=>200
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219052606520667573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219092244955667590)
,p_event_id=>wwv_flow_imp.id(219091702335667589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P641_SALARYFROMDATE,P641_LOCATIONCODE,P641_DEPARTMENTCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '',
    '    tmp number;',
    '',
    'Begin',
    '',
    'select',
    '		count(a.tno) into tmp',
    'from ModulePrivilege a, BossUser b',
    'where a.ModuleCode = getModuleCodeForPageNo(:APP_PAGE_ID)',
    '		and a.BossUserCode = b.BossUserCode',
    '		and b.LoginName = User',
    '		and a.OtherPrivilege = ''YES''',
    '		and a.CompanyCode = :global_CompanyCode',
    ';',
    '',
    '    if nvl(tmp, 0) = 0 then',
    '    		raise_application_error(-20000,''Please ask administrator for Other privilege'');',
    '    end if;',
    '',
    '    select',
    '    		count(a.TNo) into tmp',
    '    from Salary a, SalaryVoucherDetail b, salaryvoucher c',
    '    where a.SalaryFromDate = :p641_SalaryFromDate',
    '    		and a.CompanyCode = :global_CompanyCode',
    '    		and a.Locationcode = :p641_LocationCode',
    '    		and a.TNO = b.SalaryTNo',
    '    		and b.tno = c.tno',
    '    		and c.doctypecode = ''ARREAR''',
    '    ;',
    '    if nvl(tmp, 0) > 0 then',
    '    		',
    '            raise_application_error(-20000,''Arrear Voucher already prepared'');',
    '    end if;',
    '    	',
    '    	',
    '',
    '    declare',
    '    		tSalaryFromDate Date := :p641_SalaryFromDate;	',
    '    		tLocationCode Varchar2(30) := :p641_LocationCode;',
    '    		tLocationName Varchar2(100) := :p641_LocationName;',
    '    		tEmployeeCode	Varchar2(30) := :p641_EmployeeCode;',
    '    		tEmployeeName Varchar2(100) := :p641_EmployeeName;',
    '    		tDepartmentCode Varchar2(30) := :p641_DepartmentCode;',
    '    		tDepartmentName Varchar2(100) := :p641_DepartmentName;',
    '    		tWorkCentreCode Varchar2(30)  := :p641_WorkCentreCode;',
    '    		tWorkCentreName Varchar2(100) := :p641_WorkCentreName;',
    '    		',
    '    begin',
    '    		if tSalaryFromDate is null then',
    '    				',
    '                     raise_application_error(-20000,''Please enter Month'');',
    '    		end if;',
    '    		',
    '    		',
    '    				',
    '    				update SalaryDetail a ',
    '    					SET a.ARREARFORMULA = NULL,',
    '    							a.ARREARAMOUNT=NULL,',
    '    							a.ARREARGIVEN=NULL',
    '    						where exists(',
    '    								select',
    '    										aa.TNo',
    '    								from Salary aa',
    '    								where aa.TNo = a.TNo',
    '    										and aa.SalaryFromDate = tSalaryFromDate						',
    '    										and aa.CompanyCode = :global_CompanyCode',
    '    										and aa.LocationCode = tLocationCode',
    '    										and aa.DepartmentCode = tDepartmentCode',
    '    									  --and aa.WorkCentreCode = tWorkCentreCode',
    '    						)',
    '    				;',
    '    				update Salary aa set aa.arreardate = null',
    '    						where aa.SalaryFromDate = tSalaryFromDate		',
    '    								and aa.CompanyCode = :global_CompanyCode				',
    '    								and aa.LocationCode = tLocationCode',
    '    								and aa.DepartmentCode = tDepartmentCode',
    '    								--and aa.WorkCentreCode = tWorkCentreCode',
    '    				;',
    '    				',
    '    			',
    '    				--RefreshLoanDeductedCommit(:global.CompanyCode);',
    '    				',
    '    				',
    '            ',
    '    End;',
    '',
    'end;',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219092685515667590)
,p_event_id=>wwv_flow_imp.id(219091702335667589)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(471462889694530561)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219090280593667589)
,p_name=>'Delete salary for given month'
,p_static_id=>'delete-salary-for-given-month'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219052203750667573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219090837262667589)
,p_event_id=>wwv_flow_imp.id(219090280593667589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P641_SALARYFROMDATE,P641_LOCATIONCODE,P641_DEPARTMENTCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number;',
    'begin',
    '',
    '    select',
    '    		count(a.tno) into tmp',
    '    from ModulePrivilege a, BossUser b',
    '    where a.ModuleCode =getModuleCodeForPageNo(:APP_PAGE_ID)',
    '    		and a.BossUserCode = b.BossUserCode',
    '    		and b.LoginName = :global_loginname',
    '    		and a.OtherPrivilege = ''YES''',
    '    		and a.CompanyCode = :global_CompanyCode',
    '    ;',
    '',
    '    if nvl(tmp, 0) = 0 then',
    '    		raise_application_error(-20000,''Please ask administrator for other privilege'');',
    '    end if;',
    '',
    '    select',
    '    		count(a.TNo) into tmp',
    '    from Salary a, SalaryVoucherDetail b',
    '    where a.SalaryFromDate = :P641_SalaryFromDate',
    '    		and a.CompanyCode = :global_CompanyCode',
    '    		and a.Locationcode = :P641_LocationCode',
    '    		--------------------------------- --',
    '    		-- 09-nov-2023 ',
    '    		-- and a.DepartmentCode = :P641_DepartmentCode',
    '    		--and a.EmployeeDepartmentCode like nvl(:P641_DepartmentCode, ''%'')',
    '    		--and a.EmployeeWorkCentrecode like nvl(:P641_WorkCentreCode, ''%'')',
    '    		--------------------------------- --',
    '    		and a.TNO = b.SalaryTNo',
    '    ;',
    '    if nvl(tmp, 0) > 0 then',
    '    		raise_application_error(-20000,''Salary already posted'');',
    '    end if;',
    '    	',
    '    	',
    '',
    '    declare',
    '    		tSalaryFromDate Date := :P641_SalaryFromDate;	',
    '    		tLocationCode Varchar2(30) := :P641_LocationCode;',
    '    		tLocationName Varchar2(100) := :P641_LocationName;',
    '    		tDepartmentCode Varchar2(30) := :P641_DepartmentCode;',
    '    		tDepartmentName Varchar2(100) := :P641_DepartmentName;',
    '    		tWorkCentreCode Varchar2(30)  := :P641_WorkCentreCode;',
    '    		tWorkCentreName Varchar2(100) := :P641_WorkCentreName;',
    '    begin',
    '    		if tSalaryFromDate is null then',
    '    				raise_application_error(-20000,''Please enter Month'');',
    '    		end if;',
    '    		--raise_application_error(-20005,'' tSalaryFromDate ''||tSalaryFromDate||'' company ''||:global_CompanyCode||'' Location ''||tLocationCode);',
    '    				Delete',
    '    						from SalaryDetail a',
    '    						where exists(',
    '    										select',
    '    												aa.TNo',
    '    										from Salary aa',
    '    										where aa.TNo = a.TNo',
    '    												and aa.SalaryFromDate = tSalaryFromDate						',
    '    												and aa.CompanyCode = :global_CompanyCode',
    '    												and aa.LocationCode = tLocationCode',
    '    												---------------------------------- --',
    '    												-- 09-nov-2023 ',
    '    												-- and aa.DepartmentCode = tDepartmentCode',
    '    												-- and aa.WorkCentrecode = tWorkCentreCode',
    '    												--and aa.EmployeeDepartmentCode like nvl(tDepartmentCode, ''%'')',
    '    												--and aa.EmployeeWorkCentrecode like nvl(tWorkCentreCode, ''%'')',
    '    												---------------------------------- --',
    '    								)',
    '    								--------------------------------- --',
    '    								-- 09-nov-2023 ',
    '    								and not exists(',
    '    										select ',
    '    												aa.TNo',
    '    										from SalaryVoucherDetail aa ',
    '    										where aa.SalaryTNo = a.TNo',
    '    								)',
    '    								--------------------------------- --',
    '    				;',
    '    				Delete',
    '    						from Salary aa',
    '    						where aa.SalaryFromDate = tSalaryFromDate		',
    '    								and aa.CompanyCode = :global_CompanyCode				',
    '    								and aa.LocationCode = tLocationCode',
    '    								--------------------------------- --',
    '    								-- 09-nov-2023',
    '    								-- and aa.DepartmentCode = tDepartmentCode',
    '    								-- and aa.WorkCentrecode = tWorkCentreCode',
    '    								--and aa.EmployeeDepartmentCode like nvl(tDepartmentCode, ''%'')',
    '    								--and aa.EmployeeWorkCentreCode like nvl(tWorkCentreCode, ''%'')',
    '    								and not exists(',
    '    										select ',
    '    												aaa.TNo',
    '    										from SalaryVoucherDetail aaa ',
    '    										where aaa.SalaryTNo = aa.TNo',
    '    								)',
    '    								--------------------------------- --',
    '    				;',
    '    ',
    '    		',
    '    				--RefreshLoanDeductedCommit(:global.CompanyCode);',
    '    				',
    '    			',
    '    End;',
    'end;',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219091359681667589)
,p_event_id=>wwv_flow_imp.id(219090280593667589)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(471462889694530561)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219071265721667581)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219056240234667575)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219071718568667582)
,p_event_id=>wwv_flow_imp.id(219071265721667581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from ATTENDENCEDETAIL a',
    '    where not exists (',
    '        select 1 from ATTENDENCE  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219093141852667590)
,p_name=>'delete unsaved data'
,p_static_id=>'delete-unsaved-data-2'
,p_event_sequence=>210
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219093629852667590)
,p_event_id=>wwv_flow_imp.id(219093141852667590)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from SALARYDETAIL a',
    '    where not exists (',
    '        select 1 from SALARY  aa  ',
    '        where aa.tno = a.tno',
    '    );')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219076766801667583)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219077708950667584)
,p_event_id=>wwv_flow_imp.id(219076766801667583)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219078183311667584)
,p_event_id=>wwv_flow_imp.id(219076766801667583)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P641_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219077255427667584)
,p_event_id=>wwv_flow_imp.id(219076766801667583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219081956660667585)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>130
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219082928296667586)
,p_event_id=>wwv_flow_imp.id(219081956660667585)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219082426175667585)
,p_event_id=>wwv_flow_imp.id(219081956660667585)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219078642469667584)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>110
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219079143535667584)
,p_event_id=>wwv_flow_imp.id(219078642469667584)
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
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.UPDATEPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219080132406667585)
,p_event_id=>wwv_flow_imp.id(219078642469667584)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P641_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219079633679667584)
,p_event_id=>wwv_flow_imp.id(219078642469667584)
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
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.UPDATEPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219080496896667585)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>120
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219081539490667585)
,p_event_id=>wwv_flow_imp.id(219080496896667585)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219081010560667585)
,p_event_id=>wwv_flow_imp.id(219080496896667585)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219066431511667580)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219055400986667575)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219069905168667581)
,p_event_id=>wwv_flow_imp.id(219066431511667580)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P641_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219069416284667581)
,p_event_id=>wwv_flow_imp.id(219066431511667580)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P641_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219067459059667580)
,p_event_id=>wwv_flow_imp.id(219066431511667580)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P641_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P641_TNO,:P641_STATUS);',
    '',
    'declare',
    '    tpaymentadvice number;',
    '',
    'begin',
    '    SELECT COUNT(A.TNO) INTO tpaymentadvice',
    '	FROM PAYMENTADVICE A',
    '	WHERE A.MODULETNO = :P641_TNO ;',
    '',
    '    if nvl(tpaymentadvice, 0) = 0 then',
    '        if :P641_STATUS = ''ACTIVE'' then',
    '        ',
    '            CREATEPAYMENTADVICEFORPO(:P641_TNO);',
    '',
    '        end if;',
    '',
    '    end if;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219067915457667580)
,p_event_id=>wwv_flow_imp.id(219066431511667580)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P641_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219068422419667580)
,p_event_id=>wwv_flow_imp.id(219066431511667580)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219068892011667581)
,p_event_id=>wwv_flow_imp.id(219066431511667580)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219066883096667580)
,p_event_id=>wwv_flow_imp.id(219066431511667580)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P641_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219074863677667583)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219075330341667583)
,p_event_id=>wwv_flow_imp.id(219074863677667583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P641_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219075781829667583)
,p_event_id=>wwv_flow_imp.id(219074863677667583)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P641_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219076354739667583)
,p_event_id=>wwv_flow_imp.id(219074863677667583)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P641_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219064565569667579)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219054671013667574)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219065486363667579)
,p_event_id=>wwv_flow_imp.id(219064565569667579)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P641_PURCHASEORDERNO',
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
 p_id=>wwv_flow_imp.id(219066051813667580)
,p_event_id=>wwv_flow_imp.id(219064565569667579)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219065065424667579)
,p_event_id=>wwv_flow_imp.id(219064565569667579)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P641_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219070336092667581)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219055796053667575)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219070820352667581)
,p_event_id=>wwv_flow_imp.id(219070336092667581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219072993986667582)
,p_name=>'GET_EMPLOYEESALARYTNO'
,p_static_id=>'get-employeesalarytno'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P641_EMPLOYEECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219073479249667582)
,p_event_id=>wwv_flow_imp.id(219072993986667582)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'GET_EMPLOYEESALARYTNO'
,p_static_id=>'get-employeesalarytno'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P641_EMPLOYEESALARYTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P641_EMPLOYEECODE',
  'sql_query', 'SELECT TNO FROM EMPLOYEE WHERE EMPLOYEECODE = :P641_EMPLOYEECODE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219073948189667582)
,p_name=>'GET_MONTH'
,p_static_id=>'get-month'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P641_FORMONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219074449968667583)
,p_event_id=>wwv_flow_imp.id(219073948189667582)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P641_SALARYFROMDATE,P641_SALARYTODATE',
  'items_to_submit', 'P641_SALARYFROMDATE,P641_SALARYTODATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    SELECT ',
    '       TO_CHAR(TO_DATE(:P641_SALARYFROMDATE,''DD-MM-RRRR''),''Mon-YYYY''),',
    '       LAST_DAY(TO_DATE(:P641_SALARYFROMDATE,''DD-MM-RRRR''))-TRUNC(TO_DATE(:P641_SALARYTODATE,''DD-MM-RRRR''),''MM'')+1',
    '    INTO :P641_FORMONTH,:P641_TOTALDAYS',
    '    --,:P641_TOTALDAYS',
    '    FROM DUAL;',
    '',
    'END;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219072175501667582)
,p_name=>'Go Back To Called Form'
,p_static_id=>'go-back-to-called-form'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219056240234667575)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219072639642667582)
,p_event_id=>wwv_flow_imp.id(219072175501667582)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P641_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P641_CALLEDFROMTNO'').getValue();',
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
 p_id=>wwv_flow_imp.id(219083373292667586)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>140
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219083830535667586)
,p_event_id=>wwv_flow_imp.id(219083373292667586)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(214733982479718698)
,p_name=>'move to detail tab'
,p_static_id=>'move-to-detail-tab'
,p_event_sequence=>220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P641_REMARK'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(214734074377718699)
,p_event_id=>wwv_flow_imp.id(214733982479718698)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_SALARY"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219062633507667578)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219054241410667574)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219063645755667579)
,p_event_id=>wwv_flow_imp.id(219062633507667578)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P641_STATUS',
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
    '             if :P641_STATUS = ''ACTIVE'' then',
    '        ',
    '                CREATEPAYMENTADVICEFORPO(:P641_TNO);',
    '',
    '              end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219064082068667579)
,p_event_id=>wwv_flow_imp.id(219062633507667578)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219063127518667578)
,p_event_id=>wwv_flow_imp.id(219062633507667578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P641_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219086078487667587)
,p_name=>'Prepare Arrear'
,p_static_id=>'prepare-arrear'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219027821204667560)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219086631516667587)
,p_event_id=>wwv_flow_imp.id(219086078487667587)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P641_EMPLOYEECODE,P641_ARREARDATE,P641_LOCATIONCODE,P641_SALARYFROMDATE,P641_SALARYTODATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare			',
    '		tFromDate Date := to_date(:P641_ARREARFROMMONTH, ''MON, RRRR'');',
    '		tToDate Date := to_date(:P641_ARREARTOMONTH, ''MON, RRRR'');',
    '		tStaffTypeCode Varchar2(30) := :P641_StaffType;',
    '		tEmployeeCode Varchar2(30) := :P641_EmployeeCode;		',
    '		---------------------------------------',
    '		-- date 26-oct-2020 Tiwar Sir		',
    '		-- tDate Date := trunc(sysdate);          ',
    '		tDate Date := nvl(:P641_ArrearDate, trunc(sysdate) );          ',
    '		---------------------------------------',
    '		tLocationCode Varchar2(30) := :P641_LocationCode;',
    '		cursor cEmployee is',
    '				select',
    '						a.TNo,',
    '						a.EmployeeCode',
    '				from Salary a',
    '				where a.SalaryFromDate between tFromDate and tToDate',
    '						and a.LocationCode = tLocationCode ',
    '						and (',
    '								getEmployeeStaffTypeCode(a.EmployeeCode, tDate ) = tStaffTypeCode',
    '								or',
    '								tStaffTypeCode is null',
    '						)  ',
    '						and (',
    '								a.EmployeeCode = tEmployeeCode',
    '								or ',
    '								tEmployeeCode is null',
    '						)',
    '						and getEmployeeSalaryTNo(a.EmployeeCode, a.SalaryToDate) is not null				',
    '						and getEmployeeSalaryTNo(a.EmployeeCode, a.SalaryToDate) != GetEmployeeSalaryTNoForArrear(a.EmployeeCode, a.SalaryToDate)',
    '		;				',
    '		tTotalRecord Number;',
    '		i Number := 0;		',
    'begin',
    '				',
    '		select',
    '				count(a.TNo) into tTotalRecord',
    '		from Salary a',
    '		where a.SalaryFromDate between tFromDate and tToDate',
    '				and a.LocationCode = tLocationCode ',
    '				and (',
    '						getEmployeeStaffTypeCode(a.EmployeeCode, tDate ) = tStaffTypeCode',
    '						or',
    '						tStaffTypeCode is null',
    '				)  ',
    '				and (',
    '						a.EmployeeCode = tEmployeeCode',
    '						or ',
    '						tEmployeeCode is null',
    '				)',
    '				and getEmployeeSalaryTNo(a.EmployeeCode, a.SalaryToDate) is not null				',
    '				and getEmployeeSalaryTNo(a.EmployeeCode, a.SalaryToDate) != GetEmployeeSalaryTNoForArrear(a.EmployeeCode, a.SalaryToDate)',
    '		;			',
    '',
    '		for vSalary',
    '				in (',
    '						select',
    '								a.TNo,',
    '								a.SalaryDate,',
    '								a.EmployeeCode',
    '						from Salary a',
    '						where a.SalaryFromDate between tFromDate and tToDate',
    '								and (',
    '										getEmployeeStaffTypeCode(a.EmployeeCode, tDate ) = tStaffTypeCode',
    '										or',
    '										tStaffTypeCode is null',
    '								)  ',
    '								and (',
    '										a.EmployeeCode = tEmployeeCode',
    '										or ',
    '										tEmployeeCode is null',
    '								)',
    '								and getEmployeeSalaryTNo(a.EmployeeCode, a.SalaryToDate) is not null				',
    '								and getEmployeeSalaryTNo(a.EmployeeCode, a.SalaryToDate) != GetEmployeeSalaryTNoForArrear(a.EmployeeCode, a.SalaryToDate)',
    '						order by a.SalaryDate, a.TNo',
    '				)',
    '		loop				',
    '				i := i + 1;',
    '                raise_application_error(-20000,''inside loop'');',
    '			',
    '				PrepareArrear(vSalary.TNo, tDate, null, null);',
    '				commit;',
    '		end loop;				',
    '		--',
    '		/* set_item_property(''MASTERBLOCK.PREPAREARREAR'', LABEL, ''Prepare Arrear'');				',
    '		:P641_ARREARFROMMONTH := TO_CHAR(tfromdate, ''MON, RRRR'');',
    '		:P641_ARREARTOMONTH := TO_CHAR(ttodate, ''MON, RRRR'');				',
    '		message( to_char(tTotalRecord) || '' Arrear Prepared'');',
    '		message( to_char(tTotalRecord) || '' Arrear Prepared''); */',
    'end;						',
    '',
    '',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219087078102667587)
,p_event_id=>wwv_flow_imp.id(219086078487667587)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(471462889694530561)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(219088903756667588)
,p_name=>'Prepare salary'
,p_static_id=>'prepare-salary'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(219051859984667573)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219089445733667588)
,p_event_id=>wwv_flow_imp.id(219088903756667588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P641_EMPLOYEECODE,P641_SALARYDATE,P641_SALARYFROMDATE,P641_SALARYTODATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'PrepareSalary(	',
    '				:P641_EmployeeCode,',
    '                :P641_SalaryDate,',
    '				:P641_SalaryFromDate,',
    '				:P641_SalaryToDate',
    '		);')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(219089931984667588)
,p_event_id=>wwv_flow_imp.id(219088903756667588)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P641_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P641_SALARYFROMDATE'').getValue();',
    'var z = apex.item(''P641_SALARYTODATE'').getValue();',
    '',
    'var url = "f?p=#APP_ID#:640:#SESSION#::NO:RP,640:P640_FROMDATE,P640_TODATE:#P641_SALARYFROMDATE#,#P641_SALARYTODATE#";',
    '',
    '',
    '//var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#:P#2002#_TNO:#P2002_TNO#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P641_SALARYFROMDATE#", y);',
    'url = url.replace("#P641_SALARYTODATE#", z);',
    '//url = url.replace("#2002#", x);',
    '',
    '//url = url.replace("#P2002_TNO#", y);',
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(219062266875667578)
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
'     if :P641_Tno is null then',
'        Select GlobalTno.NextVal into :P641_Tno From Dual;',
'     end if;',
'    ----',
'    if :P641_SALARYNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P641_LocationCode,',
'					:P641_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P641_SALARYDATE, ''DD-MM-RRRR'')',
'				);',
'        :P641_SALARYNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P641_LocationCode,',
'                    :P641_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P641_SALARYDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9521890675297209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(219061385701667578)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P641_TNO is null then',
'    :P641_TNO := GlobalTNo.nextval;',
'    :P641_FORMSTATUS := ''NEWRECORD'';',
'  ',
'else',
'    :P641_FORMSTATUS := ''EDITRECORD'';',
'   ',
'End if;',
'',
':P641_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P641_TNO), ''Status'');',
'',
'FOR VLOOP IN (',
'   SELECT B.EMPLOYEECODE,GETEMPLOYEEDEPARTMENTCODE(B.EMPLOYEECODE,TO_DATE(:P641_SALARYFROMDATE,''DD-MM-YYYY'')) AS DEPTCODE,',
'   GETEMPLOYEEDESIGNATIONCODE(B.EMPLOYEECODE,TO_DATE(:P641_SALARYFROMDATE,''DD-MM-YYYY'')) AS DESIGNATION',
'   FROM SALARY A, EMPLOYEE B',
'   WHERE A.EMPLOYEECODE = B.EMPLOYEECODE',
'     AND A.TNO = :P641_TNO',
'',
')LOOP',
'    :P641_EMPLOYEEDEPARTMENT := VLOOP.DEPTCODE;',
'    :P641_EMPLOYEEDESIGNATION := VLOOP.DESIGNATION;',
'   -- :P641_EMPLOYEECODE := VLOOP.EMPLOYEECODE;',
'END LOOP;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9521009501297209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(219061776625667578)
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
'       :P641_MODULEFLOW := ''YES'';',
'   else',
'       :P641_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P641_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P641_ONTHETABLE := ''YES'' ;',
'   else',
'       :P641_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9521400425297209
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(219026354758667559)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(471437251447529746)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form SALARY'
,p_static_id=>'initialize-form-salary'
,p_internal_uid=>9485978558297190
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(219026706307667559)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(471437251447529746)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form SALARY'
,p_static_id=>'process-form-salary'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9486330107297190
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(219053169723667573)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(471462889694530561)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SalaryDetail - Save Interactive Grid Data'
,p_static_id=>'salarydetail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'           IF :SNO IS NULL then',
'                select globaltno.nextval into :SNO from dual;',
'           end if;',
'            Insert Into SALARYDETAIL ( ',
'                        TNO,                  ',
'                        SNO, ',
'                        SERIALNO, ',
'                        SALARYHEADCODE, ',
'                        SALARYHEADFORMULA,',
'                        SALARYHEADAMOUNT, ',
'                        REVISEDFORMULA, ',
'                        REVISEDVALUE,        ',
'                        ARREARFORMULA,          ',
'                        ARREARAMOUNT,           ',
'                        ARREARGIVEN',
'            )',
'            Values (',
'                        :TNO,                  ',
'                        :SNO, ',
'                        :SERIALNO, ',
'                        :SALARYHEADCODE, ',
'                        :SALARYHEADFORMULA,',
'                        :SALARYHEADAMOUNT, ',
'                        :REVISEDFORMULA, ',
'                        :REVISEDVALUE,        ',
'                        :ARREARFORMULA,          ',
'                        :ARREARAMOUNT,           ',
'                        :ARREARGIVEN',
'             );',
'  ',
'        when ''U'' then',
'            update SALARYDETAIL Set',
'                        TNO =    :TNO,              ',
'                        SNO =    :SNO, ',
'                        SERIALNO    =   :SERIALNO, ',
'                        SALARYHEADCODE  =    :SALARYHEADCODE, ',
'                        SALARYHEADFORMULA   =   :SALARYHEADFORMULA,',
'                        SALARYHEADAMOUNT    =    :SALARYHEADAMOUNT, ',
'                        REVISEDFORMULA  =   :REVISEDFORMULA, ',
'                        REVISEDVALUE    =    :REVISEDFORMULA,    ',
'                        ARREARFORMULA   =   :ARREARFORMULA,        ',
'                        ARREARAMOUNT    =    :ARREARAMOUNT,       ',
'                        ARREARGIVEN     =     :ARREARGIVEN',
'            WHERE TNO = :P639_TNO',
'              and SNO = :SNO;',
'',
'        when ''D'' then',
'            Delete From SALARYDETAIL',
'            Where TNo = :P639_TNO',
'              and SNO = :SNO',
'              ;',
'    ',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>9512793523297204
);
wwv_flow_imp.component_end;
end;
/
