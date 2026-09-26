prompt --application/pages/page_00156
begin
--   Manifest
--     PAGE: 00156
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
 p_id=>156
,p_name=>'Voucher'
,p_alias=>'VOUCHER'
,p_step_title=>'Voucher'
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
'  var bireporturl = $(''#P156_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/Voucher.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P156_TNO'').val() ',
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
'  var bireporturl = $(''#P156_BIREPORTURL'').val()',
'  var reportName =  ''Voucher.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P156_TNO'').val() ',
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
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(599547823958080800)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>30
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(789405885502627563)
,p_plug_name=>'Cost Centre'
,p_static_id=>'cost-centre'
,p_region_name=>'CC'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       AMOUNT,',
'       COSTCENTRECODE,',
'       SERIALNO,',
'       SNO,',
'       TNO,',
'       OLDCOSTCENTRECODE',
'  from VOUCHERCOSTCENTREDETAIL',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(599547929294080801)
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Cost Centre'
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
 p_id=>wwv_flow_imp.id(789406176114627566)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
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
 p_id=>wwv_flow_imp.id(791500537480226122)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791500614196226123)
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
 p_id=>wwv_flow_imp.id(789406219823627567)
,p_name=>'COSTCENTRECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COSTCENTRECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Cost Centre'
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
'SELECT COSTCENTRENAME, COSTCENTRECODE FROM COSTCENTRE',
'ORDER BY 1'))
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
 p_id=>wwv_flow_imp.id(791500483638226121)
,p_name=>'OLDCOSTCENTRECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OLDCOSTCENTRECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Oldcostcentrecode'
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
 p_id=>wwv_flow_imp.id(791501259592226129)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>90
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791500135040226118)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sl.No.'
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
 p_id=>wwv_flow_imp.id(791500286771226119)
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
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(599548322308080805)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791500380324226120)
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
,p_parent_column_id=>wwv_flow_imp.id(599548185449080804)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(789406039973627565)
,p_internal_uid=>356561184531403791
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(791506034024233192)
,p_interactive_grid_id=>wwv_flow_imp.id(789406039973627565)
,p_static_id=>'374525'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(791506260493233192)
,p_report_id=>wwv_flow_imp.id(791506034024233192)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791506759493233194)
,p_view_id=>wwv_flow_imp.id(791506260493233192)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(789406176114627566)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791507686162233197)
,p_view_id=>wwv_flow_imp.id(791506260493233192)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(789406219823627567)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>316
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791508593967233199)
,p_view_id=>wwv_flow_imp.id(791506260493233192)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(791500135040226118)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>53
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791509502093233201)
,p_view_id=>wwv_flow_imp.id(791506260493233192)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(791500286771226119)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791510355595233203)
,p_view_id=>wwv_flow_imp.id(791506260493233192)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(791500380324226120)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791511252450233205)
,p_view_id=>wwv_flow_imp.id(791506260493233192)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(791500483638226121)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791515234497244452)
,p_view_id=>wwv_flow_imp.id(791506260493233192)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(791500537480226122)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791521552570287749)
,p_view_id=>wwv_flow_imp.id(791506260493233192)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(791501259592226129)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(599547584042080798)
,p_plug_name=>'Flow Buttons'
,p_static_id=>'flow-buttons'
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
 p_id=>wwv_flow_imp.id(789405934159627564)
,p_plug_name=>'Reference'
,p_static_id=>'reference'
,p_region_name=>'REF'
,p_region_template_options=>'#DEFAULT#:t-DialogRegion--noPadding:js-dialog-size720x480:t-Form--slimPadding'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select  ROWID,',
'TNO,',
'       SNO,',
'       SERIALNO,',
'       VOUCHERREFERENCETYPECODE,',
'       MODULECODE,',
'       REFERENCETNO,',
'       AMOUNT,',
'       ACCOUNTCODE,',
'       REFERENCESNO',
'  from VOUCHERREFERENCEDETAIL'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(599547929294080801)
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Reference'
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
 p_id=>wwv_flow_imp.id(791502112579226138)
,p_name=>'ACCOUNTCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCOUNTCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Accountcode'
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
,p_static_id=>'ACCOUNTCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791502073055226137)
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
 p_id=>wwv_flow_imp.id(791502712741226144)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791502862403226145)
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
 p_id=>wwv_flow_imp.id(791501897711226135)
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
 p_id=>wwv_flow_imp.id(791502261299226139)
,p_name=>'REFERENCESNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REFERENCESNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Referencesno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'REFERENCESNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791501950288226136)
,p_name=>'REFERENCETNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REFERENCETNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Reference No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'AMOUNT:AMOUNT,SNO:REFERENCESNO,MODULECODE:MODULECODE,ACCOUNTCODE:ACCOUNTCODE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '700')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(600200409011585921)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P156_TNO,P156_FORMSTATUS,P156_CRDR'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791503020359226147)
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
 p_id=>wwv_flow_imp.id(791501676255226133)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sl.No.'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(791501587630226132)
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
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(599548322308080805)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791501419339226131)
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
,p_parent_column_id=>wwv_flow_imp.id(599548185449080804)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(791501726844226134)
,p_name=>'VOUCHERREFERENCETYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERREFERENCETYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Ref. Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Allocate Reference;ALLOCATEREFERENCE,On Account;ONACCOUNT'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(791501320417226130)
,p_internal_uid=>358656464975002356
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(791532255118358042)
,p_interactive_grid_id=>wwv_flow_imp.id(791501320417226130)
,p_static_id=>'374787'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(791532442081358042)
,p_report_id=>wwv_flow_imp.id(791532255118358042)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791532934681358043)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(791501419339226131)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791533868433358045)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(791501587630226132)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791534805767358047)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(791501676255226133)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791535654415358049)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(791501726844226134)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>111
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791536506008358051)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(791501897711226135)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791537375702358053)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(791501950288226136)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>334
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791538299449358055)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(791502073055226137)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791539117997358057)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(791502112579226138)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791540015760358059)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(791502261299226139)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791543651084374668)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(791502712741226144)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(791544974033374671)
,p_view_id=>wwv_flow_imp.id(791532442081358042)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(791503020359226147)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(834299980758128521)
,p_plug_name=>'Voucher'
,p_static_id=>'voucher'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    a.TNO,',
'    a.COMPANYCODE,',
'    a.FINANCIALYEARCODE,',
'    a.LOCATIONCODE,',
'    a.DOCTYPECODE,',
'    a.VOUCHERNO,',
'    a.VOUCHERDATE,',
'    a.NARRATION,',
'    a.REMARK,',
'    a.MODULECODE,',
'    a.MODULETNO,',
'    a.OTHERCODE,',
'    a.REFERENCEMODULECODE,',
'    a.REFERENCETNO,',
'    a.CREATOR,',
'    a.ACCOUNTCODE,',
'    a.MONEYTRANSFERMODECODE,',
'    a.MONEYTRANSFERREFERENCENO,',
'    a.CREATIONTIME,',
'    a.MODULESNO,',
'    a.BILLNO,',
'    getModuleNo(a.ModuleCode, a.ModuleTNo ) as ModuleNo,',
'    getModuleEntryPageNo(a.ModuleCode) as ModuleEntryPageNo,',
'    nvl(getDocumentStatusCode(''VOUCHER'', A.TNO), ''Status'') as Status',
'from VOUCHER a',
' where a.COMPANYCODE = :GLOBAL_COMPANYCODE',
' /*',
' AND A.LOCATIONCODE IN (',
'    SELECT',
'        AA.LOCATIONCODE',
'    FROM APEXLOCATIONPRIVILEGE AA ',
'    WHERE AA.ENTRYPAGENO = V(''APP_PAGE_ID'')',
'        AND AA.COMPANYCODE = :GLOBAL_COMPANYCODE',
')',
'AND A.DOCTYPECODE IN (',
'    SELECT',
'        AA.DOCTYPECODE',
'    FROM APEXDOCTYPEPRIVILEGE AA ',
'    WHERE AA.ENTRYPAGENO = V(''APP_PAGE_ID'')',
'        AND AA.COMPANYCODE = :GLOBAL_COMPANYCODE',
')',
'*/'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(795810968496976938)
,p_plug_name=>'Voucher Created Automatically'
,p_static_id=>'voucher-created-automatically'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>4
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select rowid , TNO,VOUCHERNO',
'  From VOUCHER',
' Where MODULECODE = ''VOUCHER''',
'   And MODULETNO = :P156_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P156_TNO'
,p_plug_column_width=>'readonly=true'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Voucher Created Automatically'
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
 p_id=>wwv_flow_imp.id(855219635978603156)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(855219731831603157)
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
 p_id=>wwv_flow_imp.id(855218962545603149)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>50
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(855218312945603143)
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
,p_static_id=>'VTNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(855218452463603144)
,p_name=>'VOUCHERNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Voucher No'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(855218260750603142)
,p_internal_uid=>422373405308379368
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(855233742481770800)
,p_interactive_grid_id=>wwv_flow_imp.id(855218260750603142)
,p_static_id=>'1011802'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(855233978543770800)
,p_report_id=>wwv_flow_imp.id(855233742481770800)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(855234421953770801)
,p_view_id=>wwv_flow_imp.id(855233978543770800)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(855218312945603143)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(855235370404770805)
,p_view_id=>wwv_flow_imp.id(855233978543770800)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(855218452463603144)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(855242347849789575)
,p_view_id=>wwv_flow_imp.id(855233978543770800)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(855218962545603149)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(855248274064845418)
,p_view_id=>wwv_flow_imp.id(855233978543770800)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(855219635978603156)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(599547929294080801)
,p_plug_name=>'Voucher Detail'
,p_static_id=>'voucher-detail'
,p_region_name=>'VOUCHERDETAIL'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ROWID,',
'       a.tno,',
'       a.sno,',
'       a.serialno,',
'       a.accountcode,',
'       a.locationcode,',
'       a.companycode,',
'       Case',
'         When a.amount < 0 Then',
'          ''D''',
'         Else',
'          ''C''',
'       End DRCR,',
'       Case',
'         When a.amount < 0 Then',
'          a.amount * -1',
'       End dramount,',
'       Case',
'         When a.amount > 0 Then',
'          a.amount',
'       End cramount,',
'       a.narration,',
'       ''CC'' As CC,',
'       ''Ref'' As Ref,',
'       a.amount ,',
'       a.voucherdate',
'  From voucherdetail a',
' Where tno = :P156_TNO',
' ',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P156_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Voucher Detail'
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
 p_id=>wwv_flow_imp.id(599548460524080807)
,p_name=>'ACCOUNTCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ACCOUNTCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Account'
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
'select partyname, partycode from party a',
'where getdocumentstatuscode(''PARTY'',A.TNO)=''ACTIVE''',
'and a.partytypecode != ''ACCOUNTGROUP''',
'ORDER BY 1'))
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
 p_id=>wwv_flow_imp.id(599549192414080814)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
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
 p_id=>wwv_flow_imp.id(600249917823936975)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(600250015006936976)
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
 p_id=>wwv_flow_imp.id(599548959450080812)
,p_name=>'CC'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CC'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Cc'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''CC'')'
,p_link_text=>'&CC.'
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
'<a href="javascript:openModal(''CC'')">',
'<span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">CC</span></a>'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(288691047136547625)
,p_name=>'COMPANYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COMPANYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P156_COMPANYCODE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(599548779958080810)
,p_name=>'CRAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CRAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cramount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
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
 p_id=>wwv_flow_imp.id(599548745285080809)
,p_name=>'DRAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Dramount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
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
 p_id=>wwv_flow_imp.id(599548569844080808)
,p_name=>'DRCR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DRCR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Dr/Cr'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:Dr;D,Cr;C'
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
 p_id=>wwv_flow_imp.id(288690959278547624)
,p_name=>'LOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>160
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P156_LOCATIONCODE'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(599548888969080811)
,p_name=>'NARRATION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NARRATION'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Narration'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>2000
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
 p_id=>wwv_flow_imp.id(599549136347080813)
,p_name=>'REF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REF'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Ref'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>130
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:openModal(''REF'')'
,p_link_text=>'&REF.'
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
'<a href="javascript:openModal(''REF'')">',
'<span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">REF</span></a>'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(599548105667080803)
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
 p_id=>wwv_flow_imp.id(599548391474080806)
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
 p_id=>wwv_flow_imp.id(599548322308080805)
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
 p_id=>wwv_flow_imp.id(599548185449080804)
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
,p_default_expression=>'P156_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(479672616769041140)
,p_name=>'VOUCHERDATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERDATE'
,p_data_type=>'DATE'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_DATE_PICKER_APEX'
,p_heading=>'Voucherdate'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
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
,p_default_type=>'ITEM'
,p_default_expression=>'GLOBAL_SYSDATE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(599548032806080802)
,p_internal_uid=>166703177363857028
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
 p_id=>wwv_flow_imp.id(600219882815656074)
,p_interactive_grid_id=>wwv_flow_imp.id(599548032806080802)
,p_static_id=>'1673751'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(600220083196656074)
,p_report_id=>wwv_flow_imp.id(600219882815656074)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(289584775515204598)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(288690959278547624)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(289585634266204603)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(288691047136547625)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(479748104329169820)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(479672616769041140)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600220650705656075)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(599548105667080803)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600221525890656077)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(599548185449080804)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600222449738656079)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(599548322308080805)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>2
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600223286471656081)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(599548391474080806)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>3
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600224165634656084)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(599548460524080807)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>221
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600225150240656086)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(599548569844080808)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600225980959656088)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(599548745285080809)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600226871111656090)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(599548779958080810)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600227833873656092)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(599548888969080811)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>280
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600228655546656094)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(599548959450080812)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600229621766656096)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(599549136347080813)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600230526536656100)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(599549192414080814)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(600255863471937663)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(600249917823936975)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(431444502138022379)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_static_id=>'sum'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(599548745285080809)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(431444603776022379)
,p_view_id=>wwv_flow_imp.id(600220083196656074)
,p_static_id=>'sum-2'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(599548779958080810)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(496711494460908761)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(789405885502627563)
,p_button_name=>'Back'
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
 p_id=>wwv_flow_imp.id(496711829158908764)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(789405934159627564)
,p_button_name=>'Back_1'
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
 p_id=>wwv_flow_imp.id(600155830370585864)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600157412609585866)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'CreateRecord'
,p_static_id=>'createrecord'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600156602092585865)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'DeleteRecord'
,p_static_id=>'deleterecord'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Are sure you want to DELETE Record ?'
,p_confirm_style=>'danger'
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600158204448585866)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600158602705585866)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Flow'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:RP,162:P162_TNO:&P156_TNO.'
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600157845661585866)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600159389543585866)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-location-arrow fa'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600156990417585865)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600158972250585866)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_static_id=>'STATUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P156_STATUS.'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_button_css_classes=>'js-menuButton'
,p_icon_css_classes=>'fa-comments'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(600156208177585864)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(599547584042080798)
,p_button_name=>'UpdateRecord'
,p_static_id=>'updaterecord'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_confirm_message=>'Update Voucher ?'
,p_button_condition=>'P156_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(600198977783585889)
,p_branch_name=>'Go To Page 153'
,p_branch_action=>'f?p=&APP_ID.:153:&SESSION.::&DEBUG.:153::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834320446616128610)
,p_name=>'P156_ACCOUNTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Bank'
,p_source=>'ACCOUNTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select partyname , partycode from party where partytypecode = ''BANK'''
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(844938016324106517)
,p_name=>'P156_BILLNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_source=>'BILLNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(856769703466115492)
,p_name=>'P156_BIREPORTURL'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(787815141458033883)
,p_name=>'P156_CALLEDFROMPAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_item_default=>'153'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(854292236539228798)
,p_name=>'P156_CALLEDFROMTNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(791505692086226136)
,p_name=>'P156_CCSERIALNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(789405885502627563)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834319055799128596)
,p_name=>'P156_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_default=>':GLOBAL_COMPANYCODE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(599549366552080816)
,p_name=>'P156_CRDR'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(599547929294080801)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834320757205128613)
,p_name=>'P156_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_format_mask=>'DD-MM-YYYY HH24:MI:SS'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834320342878128609)
,p_name=>'P156_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(599549486744080817)
,p_name=>'P156_DETACCOUNTCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(599547929294080801)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(293910939600524217)
,p_name=>'P156_DOCTYPE'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834319263074128599)
,p_name=>'P156_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Doc Type'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select doctypename , doctypecode from doctype'
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
 p_id=>wwv_flow_imp.id(834319149948128597)
,p_name=>'P156_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_default=>':GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(787815099791033882)
,p_name=>'P156_FORMSTATUS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_item_default=>'NEW'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(293911088018524218)
,p_name=>'P156_FROMAMOUNT'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(293910450700524212)
,p_name=>'P156_FROMDATE'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(293910750945524215)
,p_name=>'P156_LOCATION'
,p_item_sequence=>310
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834319189986128598)
,p_name=>'P156_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select locationname , locationcode from location'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(293910631363524214)
,p_name=>'P156_MODULE'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834319838958128604)
,p_name=>'P156_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(845618670717120205)
,p_name=>'P156_MODULEENTRYPAGENO'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'getModuleEntryPageNo(:P156_MODULECODE)',
'from dual'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796412284584784985)
,p_name=>'P156_MODULEFLOW'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(844938153629106518)
,p_name=>'P156_MODULENO'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Module No'
,p_source=>'MODULENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>4000
,p_tag_attributes=>'readonly=true'
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(834320871472128615)
,p_name=>'P156_MODULESNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_source=>'MODULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834319908467128605)
,p_name=>'P156_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834320472753128611)
,p_name=>'P156_MONEYTRANSFERMODECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Mode'
,p_source=>'MONEYTRANSFERMODECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select MONEYTRANSFERMODENAME , MONEYTRANSFERMODEcode from moneytransfermode'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(834320648780128612)
,p_name=>'P156_MONEYTRANSFERREFERENCENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'DD/Ch No'
,p_source=>'MONEYTRANSFERREFERENCENO'
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
 p_id=>wwv_flow_imp.id(834319592525128602)
,p_name=>'P156_NARRATION'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Narration'
,p_source=>'NARRATION'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796412145688784984)
,p_name=>'P156_ONTHETABLE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834320051118128606)
,p_name=>'P156_OTHERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_source=>'OTHERCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(293909476561524202)
,p_name=>'P156_PARTYCODE'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(850030584958225974)
,p_name=>'P156_PASSFAILREMARK'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(795847080058976980)
,p_name=>'P156_REFERENCE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834320146597128607)
,p_name=>'P156_REFERENCEMODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_source=>'REFERENCEMODULECODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834320238170128608)
,p_name=>'P156_REFERENCETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Auto Ref'
,p_source=>'REFERENCETNO'
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
 p_id=>wwv_flow_imp.id(791514165232226159)
,p_name=>'P156_REFSERIALNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(789405934159627564)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834319671935128603)
,p_name=>'P156_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(599549280917080815)
,p_name=>'P156_SERIALNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(599547929294080801)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(845619547729120213)
,p_name=>'P156_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_default=>'Status'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(850030217352225974)
,p_name=>'P156_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
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
 p_id=>wwv_flow_imp.id(834318934895128595)
,p_name=>'P156_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(293911122689524219)
,p_name=>'P156_TOAMOUNT'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(293910508396524213)
,p_name=>'P156_TODATE'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(293910860735524216)
,p_name=>'P156_TRANSACTION'
,p_item_sequence=>320
,p_item_plug_id=>wwv_flow_imp.id(599547823958080800)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(834319470365128601)
,p_name=>'P156_VOUCHERDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Voucher Date'
,p_source=>'VOUCHERDATE'
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
 p_id=>wwv_flow_imp.id(834319441900128600)
,p_name=>'P156_VOUCHERNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_item_source_plug_id=>wwv_flow_imp.id(834299980758128521)
,p_prompt=>'Voucher No'
,p_source=>'VOUCHERNO'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(496711640774908762)
,p_name=>'close cost center'
,p_static_id=>'close-cost-center'
,p_event_sequence=>550
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(496711494460908761)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(496711753544908763)
,p_event_id=>wwv_flow_imp.id(496711640774908762)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(789405885502627563)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(496711931492908765)
,p_name=>'close reference'
,p_static_id=>'close-reference'
,p_event_sequence=>560
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(496711829158908764)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(496712019412908766)
,p_event_id=>wwv_flow_imp.id(496711931492908765)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(789405934159627564)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600178546963585881)
,p_name=>'CrValue'
,p_static_id=>'crvalue'
,p_event_sequence=>260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_D_DRCR'
,p_condition_element=>'P156_D_DRCR'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600180017026585882)
,p_event_id=>wwv_flow_imp.id(600178546963585881)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_D_DRAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_D_DRCR'
,p_client_condition_expression=>'CR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600178958142585881)
,p_event_id=>wwv_flow_imp.id(600178546963585881)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_D_CRAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_D_DRCR'
,p_client_condition_expression=>'CR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600179539169585882)
,p_event_id=>wwv_flow_imp.id(600178546963585881)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_D_DRAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'plsql_expression', 'null',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_D_DRCR'
,p_client_condition_expression=>'CR'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600195675977585887)
,p_name=>'Delete Record;'
,p_static_id=>'delete-record'
,p_event_sequence=>450
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600156602092585865)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600196225466585887)
,p_event_id=>wwv_flow_imp.id(600195675977585887)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P156_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Delete ',
    '    from VoucherReferenceDetail a ',
    '    where a.TNo = :P156_TNO   ',
    ';',
    'Delete ',
    '    from VoucherCostCentreDetail a ',
    '    where a.TNo = :P156_TNO   ',
    ';',
    'Delete ',
    '    from VoucherDetail a ',
    '    where a.TNo = :P156_TNO   ',
    ';',
    '',
    'Delete ',
    '    from Voucher a ',
    '    where a.TNo = :P156_TNO   ',
    ';',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600196742474585888)
,p_event_id=>wwv_flow_imp.id(600195675977585887)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P156_CALLEDFROMPAGE'').getValue();',
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
 p_id=>wwv_flow_imp.id(600172440074585878)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>180
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600158972250585866)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600173428848585879)
,p_event_id=>wwv_flow_imp.id(600172440074585878)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P156_TNO,P156_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetApexDocumentStatusCode;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600173907151585880)
,p_event_id=>wwv_flow_imp.id(600172440074585878)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600158972250585866)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text($v(''P156_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600174373480585880)
,p_event_id=>wwv_flow_imp.id(600172440074585878)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600172902191585879)
,p_event_id=>wwv_flow_imp.id(600172440074585878)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600176627950585881)
,p_name=>'DrValue'
,p_static_id=>'drvalue'
,p_event_sequence=>250
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_D_DRCR'
,p_condition_element=>'P156_D_DRCR'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600178114428585881)
,p_event_id=>wwv_flow_imp.id(600176627950585881)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_D_CRAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_D_DRCR'
,p_client_condition_expression=>'DR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600177144121585881)
,p_event_id=>wwv_flow_imp.id(600176627950585881)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_D_DRAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_D_DRCR'
,p_client_condition_expression=>'DR'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600177629633585881)
,p_event_id=>wwv_flow_imp.id(600176627950585881)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_D_CRAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'plsql_expression', 'NULL',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_D_DRCR'
,p_client_condition_expression=>'DR'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600250194447936978)
,p_name=>'Enable Disable'
,p_static_id=>'enable-disable'
,p_event_sequence=>500
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599547929294080801)
,p_triggering_element=>'DRCR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600250377214936980)
,p_event_id=>wwv_flow_imp.id(600250194447936978)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CRAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'DRCR'
,p_client_condition_expression=>'D'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600250653524936982)
,p_event_id=>wwv_flow_imp.id(600250194447936978)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DRAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'DRCR'
,p_client_condition_expression=>'C'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600250320953936979)
,p_event_id=>wwv_flow_imp.id(600250194447936978)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'DRAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'DRCR'
,p_client_condition_expression=>'D'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600250470746936981)
,p_event_id=>wwv_flow_imp.id(600250194447936978)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-enable-2'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'CRAMOUNT'
,p_client_condition_type=>'EQUALS'
,p_client_condition_elem_type=>'COLUMN'
,p_client_condition_element=>'DRCR'
,p_client_condition_expression=>'C'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600189443765585885)
,p_name=>'Enable Disable Buttons Based On Module Flow'
,p_static_id=>'enable-disable-buttons-based-on-module-flow'
,p_event_sequence=>430
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600190388344585885)
,p_event_id=>wwv_flow_imp.id(600189443765585885)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600157845661585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600190859486585886)
,p_event_id=>wwv_flow_imp.id(600189443765585885)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600158204448585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600191431553585886)
,p_event_id=>wwv_flow_imp.id(600189443765585885)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600158972250585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600189862412585885)
,p_event_id=>wwv_flow_imp.id(600189443765585885)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600158602705585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600191759550585886)
,p_name=>'Enable Disable Buttons Based On Reference'
,p_static_id=>'enable-disable-buttons-based-on-reference'
,p_event_sequence=>440
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600192272377585886)
,p_event_id=>wwv_flow_imp.id(600191759550585886)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600157845661585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_REFERENCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600192830346585886)
,p_event_id=>wwv_flow_imp.id(600191759550585886)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600158204448585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_REFERENCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600193263752585886)
,p_event_id=>wwv_flow_imp.id(600191759550585886)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600158972250585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_REFERENCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600193795025585887)
,p_event_id=>wwv_flow_imp.id(600191759550585886)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600158972250585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_REFERENCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600194320311585887)
,p_event_id=>wwv_flow_imp.id(600191759550585886)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-5'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600156602092585865)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_REFERENCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600194852924585887)
,p_event_id=>wwv_flow_imp.id(600191759550585886)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_static_id=>'native-disable-6'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600157412609585866)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_REFERENCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600195335249585887)
,p_event_id=>wwv_flow_imp.id(600191759550585886)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_static_id=>'native-disable-7'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600156208177585864)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P156_REFERENCE'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(54180954975313822)
,p_event_id=>wwv_flow_imp.id(600191759550585886)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_static_id=>'native-disable-8'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600156208177585864)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P156_REFERENCEMODULECODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600170548080585878)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600158204448585866)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600171530431585878)
,p_event_id=>wwv_flow_imp.id(600170548080585878)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P156_TNO,P156_COMPANYCODE,P156_VOUCHERNO',
  'language', 'PLSQL',
  'plsql_code', 'DoApexModuleFlowFail;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600172019139585878)
,p_event_id=>wwv_flow_imp.id(600170548080585878)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600170968124585878)
,p_event_id=>wwv_flow_imp.id(600170548080585878)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600197974440585888)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>470
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600156990417585865)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600198550270585888)
,p_event_id=>wwv_flow_imp.id(600197974440585888)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600167741216585874)
,p_name=>'GoModule'
,p_static_id=>'gomodule'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_MODULENO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600168177172585874)
,p_event_id=>wwv_flow_imp.id(600167741216585874)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var tModuleTNo = apex.item(''P156_MODULETNO'').getValue();',
    'var tModuleEntryPageNo = apex.item(''P156_MODULEENTRYPAGENO'').getValue();',
    'var tModuleEntryPageNo1 = ''P''+apex.item(''P156_MODULEENTRYPAGENO'').getValue()+''_TNO'';',
    'var x = ''P''+apex.item(''P156_MODULEENTRYPAGENO'').getValue()+''_CALLEDFROMPAGE'';',
    'var z = ''P''+apex.item(''P156_MODULEENTRYPAGENO'').getValue()+''_CALLEDFROMTNO'';',
    'var y = ''156'';',
    'var a = apex.item(''P156_TNO'').getValue();',
    '',
    'var call = apex.item(''P156_CALLEDFROMPAGE'').getValue();',
    '',
    'if (tModuleEntryPageNo = call )',
    '',
    '{',
    '    var button = document.getElementById(''cancel'');',
    '',
    '  // Click the button',
    '  button.click();',
    '}',
    '',
    'else ',
    '',
    '{',
    '',
    '',
    'var url = "f?p=#APP_ID#:#PAGENO#:#SESSION#::NO:RP,#PAGENO#:#PAGENOO#,#CALLED#,#TNO#:#MODULE_TNO#,#PAGE#,#CALLEDTNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#PAGENO#", tModuleEntryPageNo);',
    'url = url.replace("#PAGENO#", tModuleEntryPageNo);',
    'url = url.replace("#PAGENOO#", tModuleEntryPageNo1);',
    'url = url.replace("#CALLED#", x);',
    'url = url.replace("#TNO#", z);',
    'url = url.replace("#PAGE#", y);',
    'url = url.replace("#CALLEDTNO#", a);',
    'url = url.replace("#MODULE_TNO#", tModuleTNo);',
    '',
    'alert(url);',
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
    '});',
    '',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(290726907534177808)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>570
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(290727332535177808)
,p_event_id=>wwv_flow_imp.id(290726907534177808)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600181289123585882)
,p_name=>'Initialize SNO Sequence_1'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>340
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(789405885502627563)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600181763175585882)
,p_event_id=>wwv_flow_imp.id(600181289123585882)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P156_CCSERIALNO',
  'sql_query', 'SELECT NVL(:P156_CCSERIALNO,0) + 1 FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600182274915585883)
,p_event_id=>wwv_flow_imp.id(600181289123585882)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P156_CCSERIALNO',
  'sql_query', 'SELECT :P156_CCSERIALNO FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600182715045585883)
,p_name=>'Initialize SNO Sequence_2'
,p_static_id=>'initialize-sno-sequence-2'
,p_event_sequence=>350
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(789405934159627564)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600183181397585883)
,p_event_id=>wwv_flow_imp.id(600182715045585883)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_REFSERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P156_REFSERIALNO',
  'sql_query', 'SELECT NVL(:P156_REFSERIALNO,0) + 1 FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600183715259585883)
,p_event_id=>wwv_flow_imp.id(600182715045585883)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', ':P156_REFSERIALNO',
  'sql_query', 'SELECT :P156_REFSERIALNO FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(599549653705080818)
,p_name=>'Initialize SNO Sequence'
,p_static_id=>'initialize-sno-sequence-3'
,p_event_sequence=>480
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(599547929294080801)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(599549661193080819)
,p_event_id=>wwv_flow_imp.id(599549653705080818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P156_SERIALNO',
  'sql_query', 'SELECT NVL(:P153_SERIALNO,0) + 1 FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(599549771744080820)
,p_event_id=>wwv_flow_imp.id(599549653705080818)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SERIALNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P156_SERIALNO',
  'sql_query', 'SELECT :P156_SERIALNO FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600174837527585880)
,p_name=>'New_3'
,p_static_id=>'new'
,p_event_sequence=>200
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_NARRATION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600175293480585880)
,p_event_id=>wwv_flow_imp.id(600174837527585880)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("VOUCHERDETAIL").widget().interactiveGrid("getViews", "grid").model;',
    '',
    '	var v_DRAMOUNT = 0; var v_tot_doc = 0;',
    '	col_DRAMOUNT = model.getFieldKey("DRAMOUNT");',
    '',
    '	model.forEach(function(igrow) {',
    '		v_DRAMOUNT = parseInt(igrow[col_DRAMOUNT], 10);',
    '        ',
    '        alert(v_DRAMOUNT);',
    '',
    '		if (!isNaN(v_DRAMOUNT)) {',
    '			v_tot_doc += v_DRAMOUNT;',
    '		}',
    '',
    '	});',
    '',
    '	$s(''P14_NARRATION'', v_tot_doc);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600184074256585883)
,p_name=>'New_4'
,p_static_id=>'new-2'
,p_event_sequence=>400
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600155830370585864)
,p_condition_element=>'P156_CALLEDFROMPAGE'
,p_triggering_condition_type=>'NOT_EQUALS'
,p_triggering_expression=>'673'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600185112309585884)
,p_event_id=>wwv_flow_imp.id(600184074256585883)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P156_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P156_CALLEDFROMTNO'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
    '',
    '',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:,#2002#:P#2002#_TNO:#P2002_TNO#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    '//url = url.replace("#SESSION#", $v(''APP_SESSION''));',
    '',
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
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600184633951585883)
,p_event_id=>wwv_flow_imp.id(600184074256585883)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_CALLEDFROMTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P156_MODULETNO',
  'plsql_expression', ':P156_MODULETNO',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P156_CALLEDFROMTNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(201858603353982933)
,p_name=>'New_4_1'
,p_static_id=>'new-3'
,p_event_sequence=>410
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600155830370585864)
,p_condition_element=>'P156_CALLEDFROMPAGE'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'673'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201858784041982935)
,p_event_id=>wwv_flow_imp.id(201858603353982933)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P156_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P156_CALLEDFROMTNO'').getValue();',
    'var z = apex.item(''P156_PARTYCODE'').getValue();',
    'var f = apex.item(''P156_FROMDATE'').getValue();',
    'var t = apex.item(''P156_TODATE'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
    '',
    '',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:,#2002#:P#2002#_TNO,P#2002#_BANKCODE,P#2002#_VOUCHERFROMDATE,P#2002#_VOUCHERTODATE:#P2002_TNO#,#P2002_PARTYCODE#,#P2002_FROMDATE#,#P2002_TODATE#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    '//url = url.replace("#SESSION#", $v(''APP_SESSION''));',
    '',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    '',
    'url = url.replace("#P2002_TNO#", y);',
    'url = url.replace("#P2002_PARTYCODE#", z);',
    'url = url.replace("#P2002_FROMDATE#", f);',
    'url = url.replace("#P2002_TODATE#", t);',
    '',
    '',
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
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201858701907982934)
,p_event_id=>wwv_flow_imp.id(201858603353982933)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_CALLEDFROMTNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P156_MODULETNO',
  'plsql_expression', ':P156_MODULETNO',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'ITEM_IS_NULL'
,p_server_condition_expr1=>'P156_CALLEDFROMTNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600197143182585888)
,p_name=>'New_5'
,p_static_id=>'new-4'
,p_event_sequence=>460
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(795810968496976938)
,p_triggering_element=>'VOUCHERNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600197605557585888)
,p_event_id=>wwv_flow_imp.id(600197143182585888)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''VTNO'').getValue();',
    'var y = ''156'';',
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
 p_id=>wwv_flow_imp.id(600251079654936987)
,p_name=>'New'
,p_static_id=>'new-5'
,p_event_sequence=>530
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599547929294080801)
,p_triggering_element=>'DRAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600251163810936988)
,p_event_id=>wwv_flow_imp.id(600251079654936987)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'DRAMOUNT',
  'sql_query', 'SELECT :DRAMOUNT * -1 FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600251296969936989)
,p_name=>'New_1'
,p_static_id=>'new-6'
,p_event_sequence=>540
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599547929294080801)
,p_triggering_element=>'CRAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600251420251936990)
,p_event_id=>wwv_flow_imp.id(600251296969936989)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'CRAMOUNT',
  'sql_query', 'SELECT :CRAMOUNT FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600180367590585882)
,p_name=>'NullValue'
,p_static_id=>'nullvalue'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_D_DRCR'
,p_condition_element=>'P156_D_DRCR'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keyup'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600180910995585882)
,p_event_id=>wwv_flow_imp.id(600180367590585882)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600157412609585866)
,p_client_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_client_condition_expression=>'this.browserEvent.which == 13 || this.browserEvent.which == 9'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600168613297585874)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600157845661585866)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600169560441585874)
,p_event_id=>wwv_flow_imp.id(600168613297585874)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P156_TNO,P156_PASSFAILREMARK',
  'language', 'PLSQL',
  'plsql_code', 'DoApexModuleFlowPass;',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600170134855585878)
,p_event_id=>wwv_flow_imp.id(600168613297585874)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600169110117585874)
,p_event_id=>wwv_flow_imp.id(600168613297585874)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600250927149936985)
,p_name=>'Set Det Account Code'
,p_static_id=>'set-det-account-code'
,p_event_sequence=>520
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599547929294080801)
,p_triggering_element=>'ACCOUNTCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600251049912936986)
,p_event_id=>wwv_flow_imp.id(600250927149936985)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_DETACCOUNTCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ACCOUNTCODE',
  'sql_query', 'select :ACCOUNTCODE from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(599549898911080821)
,p_name=>'Set Page Item crdr'
,p_static_id=>'set-page-item-crdr'
,p_event_sequence=>490
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(599547929294080801)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(599550007914080822)
,p_event_id=>wwv_flow_imp.id(599549898911080821)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pCRDR;',
    'var paccountcode;',
    'model = this.data.model;',
    '',
    'pCRDR = model.getValue( this.data.selectedRecords[0], "DRCR");',
    'paccountcode = model.getValue( this.data.selectedRecords[0], "ACCOUNTCODE");',
    '',
    'apex.item( "P156_CRDR" ).setValue (pCRDR);',
    'apex.item( "P156_DETACCOUNTCODE" ).setValue (paccountcode);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600250743312936983)
,p_name=>'Set Serialno'
,p_static_id=>'set-serialno'
,p_event_sequence=>510
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(599547929294080801)
,p_triggering_element=>'SERIALNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600250845265936984)
,p_event_id=>wwv_flow_imp.id(600250743312936983)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'SNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', 'SELECT GLOBALTNO.NEXTVAL FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600165879631585872)
,p_name=>'SetDateOnGetFocus'
,p_static_id=>'setdateongetfocus'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_VOUCHERDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600166446450585873)
,p_event_id=>wwv_flow_imp.id(600165879631585872)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P156_VOUCHERDATE',
  'items_to_submit', 'P156_VOUCHERDATE,P156_LOCATIONCODE,P156_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'for vModule ',
    '    in (',
    '        select ',
    '            ''P'' || :APP_PAGE_ID || ''_'' || A.TRANSACTIONDATECOLUMN as DateColumnName',
    '        from Module a ',
    '        where a.EntryPageNo = :APP_PAGE_ID',
    '    )',
    'loop ',
    '    if v(vModule.DateColumnName) is  null and V(''P'' || :APP_PAGE_ID || ''_LOCATIONCODE'') is not null and V(''P''|| :APP_PAGE_ID || ''_DOCTYPECODE'') is not null  then ',
    '        APEX_UTIL.SET_SESSION_STATE(vModule.DateColumnName,to_char(sysdate, ''DD-MM-RRRR''));',
    '    end if;',
    'end loop;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600175747578585880)
,p_name=>'Validate'
,p_static_id=>'validate'
,p_event_sequence=>240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_D_DRCR'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600176219016585880)
,p_event_id=>wwv_flow_imp.id(600175747578585880)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P156_D_DRCR',
  'items_to_submit', 'P156_D_DRCR',
  'language', 'PLSQL',
  'plsql_code', ':P156_D_DRCR :=  case when substr(trim(upper(:P156_D_DRCR)), 1, 1) = ''D'' then   ''DR'' else  ''CR'' end;',
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P156_D_DRCR'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600166795301585873)
,p_name=>'ValidateDateOnLoseFocus'
,p_static_id=>'validatedateonlosefocus'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P156_VOUCHERDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600167260680585874)
,p_event_id=>wwv_flow_imp.id(600166795301585873)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P156_VOUCHERDATE',
  'items_to_submit', 'P156_VOUCHERDATE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'for vModule ',
    '    in (',
    '        select ',
    '            ''P'' || to_char(a.EntryPageNo) || ''_'' || A.TRANSACTIONDATECOLUMN as DateColumn',
    '        from Module a ',
    '        where a.EntryPageNo = :APP_PAGE_ID',
    '    )',
    'loop ',
    '    declare   ',
    '        tDate Date;',
    '    begin ',
    '        if v(vModule.DateColumn) is not null then ',
    '            tDate := to_date(v(vModule.DateColumn), ''DD-MM-RRRR'');',
    '            APEX_UTIL.SET_SESSION_STATE(vModule.DateColumn, to_char(tDate, ''DD-MM-RRRR''));',
    '        end if;',
    '    exception ',
    '        when others then ',
    '            raise_application_error(',
    '                -20000,',
    '                ''Invalid Date format. Please enter date in DD-MM-YYYY format.''',
    '            );',
    '    end;',
    '',
    '    declare',
    '    	tmp number;	',
    '    	cursor cModule is',
    '    		select',
    '    			a.AllowBackDateEntry,',
    '    			a.FreezeDate,',
    '    			''P'' || a.EntryPageNo || ''_'' || a.Transactiondatecolumn as DateColumnName',
    '    		from Module a',
    '    		where a.EntryPageNo = :APP_PAGE_ID',
    '    	;',
    '    	vModule cModule%ROWTYPE;',
    '    	tMessage Varchar2(1000);',
    '    begin	',
    '        ',
    '    	open cModule;',
    '    	fetch cModule into vModule;',
    '    	if cModule%FOUND then',
    '        	if  nvl(vModule.AllowBackDateEntry, ''NO'') = ''NO'' and  to_date(v(vModule.DateColumnName), ''DD-MM-RRRR'') < trunc(sysdate) then',
    '    			tMessage := ''Date must NOT be less than '' || to_char(sysdate, ''dd-mm-rrrr'' );',
    '    		elsif vModule.FreezeDate is not null and to_date(v(vModule.DateColumnName), ''DD-MM-RRRR'') <= vModule.FreezeDate then',
    '    			tMessage := ''Date must NOT be less than freeze date '' || to_char(vModule.FreezeDate, ''dd-mm-rrrr'' );',
    '    		end if;				',
    '    	end if;',
    '    	close cModule;',
    '    	',
    '    	if tMessage is null then ',
    '    		--',
    '    		if not to_date(v(vModule.DateColumnName), ''DD-MM-RRRR'')  between getFinancialYearBegin(:global_FinancialYearCode) and getFinancialYearEnd(:global_FinancialYearCode) then',
    '    			tMessage := ''Date must be between '' || to_char(getFinancialYearBegin(:global_FinancialYearCode) ) || '' and '' || to_char(getFinancialYearEnd(:global_FinancialYearCode) );',
    '    		end if;',
    '    		--',
    '    	end if;',
    '    	--',
    '    	if tMessage is null then ',
    '    		if to_date(v(vModule.DateColumnName), ''DD-MM-RRRR'') < trunc(sysdate) then',
    '    			if nvl(GetMyParameterValue(''ALLOWBACKDATEENTRY''), ''YES'') = ''NO'' then',
    '    				tMessage := ''Date must NOT be less than '' || to_char(sysdate, ''dd-mm-rrrr'' );',
    '    			end if;',
    '    		end if;',
    '    	end if;',
    '    	--',
    '    	if tMessage is null then ',
    '    		if to_date(v(vModule.DateColumnName), ''DD-MM-RRRR'') > trunc(sysdate) then',
    '    			if nvl(GetMyParameterValue(''ALLOWFORWARDDATEENTRY''), ''YES'') = ''NO'' then',
    '    				tMessage := ''Date must NOT be greater than '' || to_char(sysdate, ''dd-mm-rrrr'' );					',
    '    			end if;',
    '    		end if;',
    '    	end if;',
    '    	--',
    '        if tMessage is not null then',
    '            raise_application_error(',
    '                -20000,',
    '                tMessage ',
    '            );',
    '        end if;',
    '    end;',
    'end loop; --vModule')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(600185495147585884)
,p_name=>'Vr Posting'
,p_static_id=>'vr-posting'
,p_event_sequence=>420
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(600159389543585866)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600187512771585884)
,p_event_id=>wwv_flow_imp.id(600185495147585884)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600159389543585866)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P156_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600187999267585885)
,p_event_id=>wwv_flow_imp.id(600185495147585884)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600158972250585866)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P156_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600188484130585885)
,p_event_id=>wwv_flow_imp.id(600185495147585884)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600157412609585866)
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P156_VOUCHERNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600188979107585885)
,p_event_id=>wwv_flow_imp.id(600185495147585884)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(600156602092585865)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600185977151585884)
,p_event_id=>wwv_flow_imp.id(600185495147585884)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P156_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  temp number;',
    'begin',
    '    SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), :P156_TNO,''ACTIVE'');',
    '    if GetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), :P156_TNO) = ''ACTIVE'' then',
    '    	if nvl(temp, 0) = 0 then		',
    '    		Begin',
    '    			PostVoucher(:P156_TNO);	',
    '    		Exception',
    '    			when others then',
    '    					rollback;',
    '                        raise_application_error(-20000, ''Voucher not posting. '' || sqlerrm);',
    '',
    '    		End;',
    '    	end if;',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600186488656585884)
,p_event_id=>wwv_flow_imp.id(600185495147585884)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_VOUCHERTNO,P156_VOUCHERNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P156_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '         a.tno, a.VoucherNo',
    '        From Voucher a',
    '        where a.ModuleTno = :P156_TNO',
    '          and a.DocTypeCode = ''PURCHASE''')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(600187034148585884)
,p_event_id=>wwv_flow_imp.id(600185495147585884)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P156_DEBITVRTNO,P156_DEBITVRNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P156_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    '         a.tno, a.VoucherNo',
    '        From Voucher a',
    '        where a.ModuleTno = :P156_TNO',
    '          and a.DocTypeCode = ''DEBITNOTE''')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600165087290585872)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check Is On The Table'
,p_static_id=>'check-is-on-the-table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'        for vModuleFlow in (',
'            select * from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID)',
'        ) loop',
'             :P156_MODULEFLOW := ''YES'' ;',
'             exit;',
'        end loop;',
'',
'        for vOntheTable in (',
'                Select a.TNo,',
'                       e.SerialNo,',
'                       c.CompanyCode,',
'                       --d.LocationCode,',
'                       a.ModuleTNo,',
'                       a.TokenNo,',
'                       a.QueueDate,',
'                       c.ModuleCode,',
'                       a.MenuLabel,',
'                       e.ModuleName',
'                  From PassFail a, BossUser b, ModuleFlow c, Module e',
'                 Where a.BossUserCode = b.BossUserCode',
'                   And b.LoginName = User',
'                   And a.IsForwarded Is Null',
'                   And a.IsRebounded Is Null',
'                   And a.IsPass Is Null',
'                   And a.IsFail Is Null',
'                   And a.ModuleFlowTNo = c.TNo',
'                   And c.ModuleCode = e.ModuleCode',
'                	 And B.LOGINNAME = :GLOBAL_LOGINNAME',
'                   AND A.MODULETNO = :P60_TNO',
'                   ',
'                ) ',
'        loop',
'          :P156_ONTHETABLE := ''YES'' ;',
'        end loop;',
'',
'        exception when others then',
'    null;',
'end ;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>167320231848362098
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600164723002585872)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check Reference'
,p_static_id=>'check-reference'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  tmp number;',
'BEGIN',
'      select count(*) into tmp from voucher  a where a.ModuleTno = :P156_TNO;',
'      if nvl(tmp,0) > 0 then',
'          :P156_REFERENCE := ''YES'';',
'      ELSE',
'          :P156_REFERENCE := ''NO'';',
'      END IF;',
'',
'      exception when others then',
'    null;',
'end ;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>167319867560362098
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600129662659585842)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(789405885502627563)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Cost Centre - Save Interactive Grid Data'
,p_static_id=>'cost-centre-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>167284807217362068
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600163510552585871)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'DeleteVoucherDetailRecord'
,p_static_id=>'deletevoucherdetailrecord'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete ',
'    from VoucherReferenceDetail a ',
'    where a.TNo = :P156_TNO   ',
';',
'Delete ',
'    from VoucherCostCentreDetail a ',
'    where a.TNo = :P156_TNO   ',
';',
'Delete ',
'    from VoucherDetail a ',
'    where a.TNo = :P156_TNO   ',
';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(600156602092585865)
,p_internal_uid=>167318655110362097
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600154999499585864)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(834299980758128521)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Voucher'
,p_static_id=>'initialize-form-voucher'
,p_internal_uid=>167310144057362090
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600163868890585871)
,p_process_sequence=>110
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
,p_internal_uid=>167319013448362097
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600155386126585864)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(834299980758128521)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Voucher'
,p_static_id=>'process-form-voucher'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>167310530684362090
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600136262152585848)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(789405934159627564)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Reference - Save Interactive Grid Data'
,p_static_id=>'reference-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>167291406710362074
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600165480718585872)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P60_TNO, :P60_CUSTOMERORDERNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(600157412609585866)
,p_internal_uid=>167320625276362098
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600162681733585869)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SET_TNO_FOR_NEW_RECORD'
,p_static_id=>'set-tno-for-new-record'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE ',
'    tTNo Number;',
'    tmp  Number;',
'BEGIN',
'    IF :P156_TNO IS NULL THEN ',
'        SELECT GLOBALTNO.NEXTVAL INTO tTNo FROM DUAL;',
'        :P156_TNO := tTNo;',
'        :P156_FORMSTATUS := ''NEWRECORD'';',
'      else',
'        :P156_FORMSTATUS := ''EDITRECORD'';',
'    END IF;',
'    SELECT COUNT(*) into tmp FROM VOUCHERDETAIL A WHERE A.TNO = :P156_tno;',
'    if nvl(tmp,0) = 0 then',
'       :P156_SERIALNO := 0;',
'    END IF;',
'',
'    SELECT COUNT(*) into tmp FROM VOUCHERCOSTCENTREDETAIL A WHERE A.TNO = :P156_tno;',
'    if nvl(tmp,0) = 0 then',
'       :P156_CCSERIALNO := 0;',
'    END IF;',
'',
'    SELECT COUNT(*) into tmp FROM VOUCHERREFERENCEDETAIL A WHERE A.TNO = :P156_tno;',
'    if nvl(tmp,0) = 0 then',
'       :P156_REFSERIALNO := 0;',
'    END IF;',
'',
'    ----------',
'',
'    if :P125_ACCOUNT is not null then',
'        :P156_PARTYCODE := :P125_ACCOUNT;',
'    end if;',
'    if :P125_MODULE is not null then',
'        :P156_MODULE := :P125_MODULE;',
'    end if;',
'    if :P125_FROMDATE is not null then',
'        :P156_FROMDATE := :P125_FROMDATE;',
'    end if;',
'    if :P125_TODATE is not null then',
'        :P156_TODATE := :P125_TODATE;',
'    end if;',
'    if :P125_LOCATION is not null then',
'        :P156_LOCATION := :P125_LOCATION;',
'    end if;',
'    if :P125_VOUCHERNO is not null then',
'        :P156_TRANSACTION := :P125_VOUCHERNO;',
'    end if;',
'    if :P125_DOCTYPE is not null then',
'        :P156_DOCTYPE := :P125_DOCTYPE;',
'    end if;',
'    if :P125_FROMAMOUNT is not null then',
'        :P156_FROMAMOUNT := :P125_FROMAMOUNT;',
'    end if;',
'    if :P125_TOAMOUNT is not null then',
'        :P156_TOAMOUNT := :P125_TOAMOUNT;',
'    end if;',
'',
'    ----------',
'',
'exception when others then',
'    null;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>167317826291362095
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600163063471585869)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validation'
,p_static_id=>'validation'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare   ',
'    tDate Date := to_date(:P156_VOUCHERDATE, ''DD-MM-RRRR'');',
'    tModuleCode Varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'begin ',
'',
'    if :P156_COMPANYCODE is NULL then',
'        :P156_COMPANYCODE := :GLOBAL_COMPANYCODE;',
'        APEX_UTIL.SET_SESSION_STATE(''P156_COMPANYCODE'',''GLOBAL_COMPANYCODE'');',
'    end if;',
'    --',
'    if :P156_FINANCIALYEARCODE is NULL then ',
'        :P156_FINANCIALYEARCODE := :GLOBAL_FINANCIALYEARCODE;',
'        APEX_UTIL.SET_SESSION_STATE(''P156_FINANCIALYEARCODE'',''GLOBAL_FINANCIALYEARCODE'');',
'    end if;',
'    --',
'',
'    --',
'    if :P156_LOCATIONCODE is null then ',
'        raise_application_error(',
'            -20000,',
'            ''Please Enter Location''',
'        );',
'    end if;',
'    --',
'    if :P156_DOCTYPECODE is null then ',
'        raise_application_error(',
'            -20000,',
'            ''Please Enter DocType''',
'        );',
'    end if;',
'    --',
'    if :P156_VoucherDate is null then ',
'        raise_application_error(',
'            -20000,',
'            ''Please Enter Voucher Date''',
'        );',
'    end if;',
'    --',
' ',
'',
'    -------------------------------------- --',
'',
'',
'    -------------------------------------- --',
'',
'',
'    --',
'    if :P156_VOUCHERNO is null then ',
'        --',
'        setDocNoNext(',
'        	tModuleCode,',
'        	:global_CompanyCode,',
'        	:global_FinancialYearCode,',
'        	:P156_LocationCode,',
'        	:P156_DocTypeCode,',
'        	null ,',
'        	tDate',
'        );	  							',
'        --',
'        :P156_VOUCHERNO := getDocNo(	  									',
'        	tModuleCode,',
'        	:global_CompanyCode,',
'        	:global_FinancialYearCode,',
'        	:P156_LocationCode,',
'        	:P156_DocTypeCode,',
'        	null ,',
'        	tDate',
'        );',
'        --',
'        --',
'    end if;',
'    --',
'    if :P156_VoucherNo is null then ',
'         raise_application_error(',
'             -20000,',
'             ''Please Enter Voucher No''',
'         );',
'    end if;',
'    ',
'    if :P156_CREATIONTIME is null then ',
'        :P156_CREATIONTIME := to_char(sysdate, ''DD-MM-RRRR HH24:MI:SS'');',
'    end if;',
'    if :P156_CREATOR is null then ',
'        :P156_CREATOR := :GLOBAL_LOGINNAME;',
'    end if;',
'end;',
'',
'',
'null;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>167318208029362095
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600164269619585871)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validation dr cr'
,p_static_id=>'validation-dr-cr'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare   ',
'    tDate Date := to_date(:P156_VOUCHERDATE, ''DD-MM-RRRR'');',
'    tModuleCode Varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tSumdrcr number;',
'begin ',
'    select sum(amount) into tSumdrcr from VoucherDetail a',
'    where a.tno = :P156_TNO;',
'    --',
'    if nvl(tSumdrcr,0) != 0 then ',
'         Delete from VoucherDetail where tno = :P156_TNO;',
'         Delete from Voucher where tno = :P156_tno;',
'        raise_application_error(',
'            -20000,',
'            ''Dr / Cr. Is Not Equal Please Check ''',
'        );',
'    end if;',
'    --',
'    ',
'    if :P156_CREATIONTIME is null then ',
'        :P156_CREATIONTIME := to_char(sysdate, ''DD-MM-RRRR HH24:MI:SS'');',
'    end if;',
'    if :P156_CREATOR is null then ',
'        :P156_CREATOR := :GLOBAL_LOGINNAME;',
'    end if;',
'end;',
'',
'',
'null;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CreateRecord,UpdateRecord'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>167319414177362097
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600139787262585849)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(795810968496976938)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Voucher Created Automaticaly - Save Interactive Grid Data'
,p_static_id=>'voucher-created-automaticaly-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>167294931820362075
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(600250059538936977)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(599547929294080801)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Voucher Detail - Save Interactive Grid Data'
,p_static_id=>'voucher-detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'        if :locationcode is null then',
'           :LOCATIONCODE := :P156_LOCATIONCODE;',
'        end if;',
'         if :companycode is null then',
'           :COMPANYCODE := :156_COMPANYCODE;',
'        end if;',
'            Insert Into voucherdetail (                 ',
'                    TNO,',
'SNO,',
'SERIALNO,',
'ACCOUNTCODE,',
'NARRATION,',
'AMOUNT,',
'VOUCHERDATE,',
'MONEYTRANSFERMODECODE,',
'MONEYTRANSFERREFERENCENO,',
'RECONSILATIONDATE,',
'RECONSILATIONREMARK,',
'LOCATIONCODE,',
'COMPANYCODE,',
'MODULETNO,',
'MODULECODE,',
'BILLNO,',
'ISRECONCILED,',
'QUANTITY1',
'            )',
'            Values (',
'                :TNO,',
':SNO,',
':SERIALNO,',
':ACCOUNTCODE,',
':NARRATION,',
':AMOUNT,',
':VOUCHERDATE,',
':MONEYTRANSFERMODECODE,',
':MONEYTRANSFERREFERENCENO,',
':RECONSILATIONDATE,',
':RECONSILATIONREMARK,',
':LOCATIONCODE,',
':COMPANYCODE,',
':MODULETNO,',
':MODULECODE,',
':BILLNO,',
':ISRECONCILED,',
':QUANTITY1',
'            );',
'        ',
'        when ''U'' then',
'            update voucherdetail Set',
'                  TNO=:TNO,',
'SNO=:SNO,',
'SERIALNO=:SERIALNO,',
'ACCOUNTCODE=:ACCOUNTCODE,',
'NARRATION=:NARRATION,',
'AMOUNT=:AMOUNT,',
'VOUCHERDATE=:VOUCHERDATE,',
'MONEYTRANSFERMODECODE=:MONEYTRANSFERMODECODE,',
'MONEYTRANSFERREFERENCENO=:MONEYTRANSFERREFERENCENO,',
'RECONSILATIONDATE=:RECONSILATIONDATE,',
'RECONSILATIONREMARK=:RECONSILATIONREMARK,',
'LOCATIONCODE=:LOCATIONCODE,',
'COMPANYCODE=:COMPANYCODE,',
'MODULETNO=:MODULETNO,',
'MODULECODE=:MODULECODE,',
'BILLNO=:BILLNO,',
'ISRECONCILED=:ISRECONCILED,',
'QUANTITY1=:QUANTITY1',
'            WHERE TNO = :P156_TNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From PBPASSDETAILGRN',
'            Where TNo = :P156_TNO',
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
,p_internal_uid=>167405204096713203
);
wwv_flow_imp.component_end;
end;
/
