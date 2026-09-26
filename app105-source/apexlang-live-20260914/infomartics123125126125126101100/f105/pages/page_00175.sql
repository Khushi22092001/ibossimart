prompt --application/pages/page_00175
begin
--   Manifest
--     PAGE: 00175
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
 p_id=>175
,p_name=>'CCInvoice'
,p_alias=>'CCINVOICE'
,p_step_title=>'CCInvoice'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function ud() {',
'        // Get the modal element by ID',
'        if (apex.item(''P175_STOCKREQUIRED'').getValue()==''YES'' ) {',
'                openModal(''DetailStorage'');',
'        }',
'}',
'',
'function sd() {',
'        // Get the modal element by ID',
'        if (apex.item(''P175_STOCKREQUIRED'').getValue()==''YES'' ) {',
'                openModal(''Stock_Detail'');',
'        }',
'}',
'',
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
'  var bireporturl = $(''#P175_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/CCInvoice11.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''&P_TNO='' + $(''#P175_TNO'').val() ',
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
'  var bireporturl = $(''#P175_BIREPORTURL'').val()',
'  var reportName =  ''CCInvoice11.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'  var reportParams = ',
'    ''"_paramsP_TNO":"'' + $(''#P175_TNO'').val() ',
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
 p_id=>wwv_flow_imp.id(498408659754989526)
,p_plug_name=>'Advancereceipt'
,p_static_id=>'advancereceipt'
,p_region_name=>'ADV'
,p_region_css_classes=>'js-dialog-size1000x500'
,p_region_template_options=>'#DEFAULT#:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       VOUCHERTNO,',
'       VOUCHERSNO,',
'       ADVANCERECEIPTTNO,',
'       ADVANCERECEIPTSNO,',
'       GSTRATE,',
'       ADJUSTEDADVANCEAMOUNT,',
'       CGSTRATE,',
'       SGSTRATE,',
'       IGSTRATE,',
'       CGSTAMOUNT,',
'       SGSTAMOUNT,',
'       IGSTAMOUNT',
'  from CCINVOICEADJUSTEDADVANCE',
'  where tno = :P175_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P175_TNO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P175_IS_READONLY'
,p_plug_read_only_when2=>'1'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Advancereceipt'
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
 p_id=>wwv_flow_imp.id(502002407972955196)
,p_name=>'ADJUSTEDADVANCEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADJUSTEDADVANCEAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Adjusted advance amount'
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
 p_id=>wwv_flow_imp.id(502002217735955194)
,p_name=>'ADVANCERECEIPTSNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADVANCERECEIPTSNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Advancereceiptsno'
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
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(502002138175955193)
,p_name=>'ADVANCERECEIPTTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ADVANCERECEIPTTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Advance receipt no'
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ADVANCERECEIPTNO , tno from ADVANCERECEIPT',
'where tno = :ADVANCERECEIPTTNO',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ADVANCERECEIPTTNO'
,p_ajax_items_to_submit=>'ADVANCERECEIPTTNO'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(502003187364955204)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(502003375954955205)
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
 p_id=>wwv_flow_imp.id(502002818608955200)
,p_name=>'CGSTAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CGSTAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'CGST amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
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
 p_id=>wwv_flow_imp.id(502002503874955197)
,p_name=>'CGSTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CGSTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Cgstrate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
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
 p_id=>wwv_flow_imp.id(502002375453955195)
,p_name=>'GSTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GSTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Gst rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
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
 p_id=>wwv_flow_imp.id(502003045015955202)
,p_name=>'IGSTAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IGSTAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'IGST amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(502002685806955199)
,p_name=>'IGSTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'IGSTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Igstrate'
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
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(502003132790955203)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>170
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(502002972343955201)
,p_name=>'SGSTAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGSTAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'SGST amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
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
 p_id=>wwv_flow_imp.id(502002596914955198)
,p_name=>'SGSTRATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SGSTRATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sgstrate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(502001821729955190)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sno'
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
 p_id=>wwv_flow_imp.id(502001692736955189)
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(502002061237955192)
,p_name=>'VOUCHERSNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERSNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vouchersno'
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
 p_id=>wwv_flow_imp.id(502001938313955191)
,p_name=>'VOUCHERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VOUCHERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Vouchertno'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(498408715327989527)
,p_internal_uid=>488483193011462961
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
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(501996309851941835)
,p_interactive_grid_id=>wwv_flow_imp.id(498408715327989527)
,p_static_id=>'738338'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(501996493775941836)
,p_report_id=>wwv_flow_imp.id(501996309851941835)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502042205037752985)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(502001692736955189)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502043150480752989)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(502001821729955190)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502044006435752991)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(502001938313955191)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502044978246752993)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(502002061237955192)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502045792366752995)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(502002138175955193)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>233.438
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502046688476752997)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(502002217735955194)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502047618495752999)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(502002375453955195)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>62.6875
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502048539802753004)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(502002407972955196)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>178.4375
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502049421736753006)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(502002503874955197)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502050350138753008)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(502002596914955198)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502051183461753010)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(502002685806955199)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502052152774753012)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(502002818608955200)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502053012077753014)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(502002972343955201)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502053851220753017)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(502003045015955202)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502054731770753020)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(502003132790955203)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(502055677892753023)
,p_view_id=>wwv_flow_imp.id(501996493775941836)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(502003187364955204)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(855423893654571314)
,p_plug_name=>'Amount Summary'
,p_static_id=>'amount-summary'
,p_parent_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>60
,p_plug_grid_column_span=>6
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(963126389747298838)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>410
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(507613493385104937)
,p_plug_name=>'CCInvoice Job'
,p_static_id=>'ccinvoice-job'
,p_region_name=>'ccjob'
,p_parent_plug_id=>wwv_flow_imp.id(667916835877150297)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       JOBTYPECODE,',
'       PARTYCODE,',
'       JOBORDERTNO,',
'       REMARK,',
'       QUANTITY1,',
'       QUANTITY2',
'  from CCINVOICEJOB',
'  where tno = :P175_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P175_TNO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P175_IS_READONLY'
,p_plug_read_only_when2=>'1'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'CCInvoice Job'
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
 p_id=>wwv_flow_imp.id(507614501772104947)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(507614521310104948)
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
 p_id=>wwv_flow_imp.id(507614019042104943)
,p_name=>'JOBORDERTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBORDERTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Job Order No'
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select joborderno , tno from joborder',
'where partycode = :PARTYCODE',
'and getdocumentstatuscode(''JOBORDER'',TNO) = ''ACTIVE'''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'PARTYCODE'
,p_ajax_items_to_submit=>'PARTYCODE'
,p_ajax_optimize_refresh=>false
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(507613825336104941)
,p_name=>'JOBTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'JOBTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Job Type'
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
,p_lov_source=>'select jobtypename , jobtypecode from jobtype'
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
 p_id=>wwv_flow_imp.id(507613951341104942)
,p_name=>'PARTYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Party'
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
'select partyname , partycode from party     ',
'where partycode in (select distinct partycode from joborder)'))
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
 p_id=>wwv_flow_imp.id(507614257056104945)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity1'
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
 p_id=>wwv_flow_imp.id(507614310402104946)
,p_name=>'QUANTITY2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY2'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity2'
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
 p_id=>wwv_flow_imp.id(507614113765104944)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(507613614637104939)
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
 p_id=>wwv_flow_imp.id(507613749599104940)
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
,p_default_expression=>'P175_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(507613593787104938)
,p_internal_uid=>497688071470578372
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
 p_id=>wwv_flow_imp.id(507740016725284674)
,p_interactive_grid_id=>wwv_flow_imp.id(507613593787104938)
,p_static_id=>'111539'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(507740248560284674)
,p_report_id=>wwv_flow_imp.id(507740016725284674)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507740755875284675)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(507613614637104939)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507741657773284679)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(507613749599104940)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507742585739284681)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(507613825336104941)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507743498137284683)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(507613951341104942)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507744310934284685)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(507614019042104943)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146.997
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507745287613284687)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(507614113765104944)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507746190437284689)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(507614257056104945)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170.816
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507747017993284691)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(507614310402104946)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>161.812
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507747919066284693)
,p_view_id=>wwv_flow_imp.id(507740248560284674)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(507614501772104947)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1330513319050369342)
,p_plug_name=>'Common Fields'
,p_static_id=>'common-fields'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>420
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(878940955181035895)
,p_plug_name=>'Detail Footer'
,p_static_id=>'detail-footer'
,p_region_name=>'Detail_Footer'
,p_region_css_classes=>'js-dialog-size900x400'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-dialog-nosize'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.SNO,',
'       a.SN,',
'       a.SERIALNO,',
'       a.FOOTERHEADCODE,',
'       a.FOOTERPERCENT,',
'       a.FOOTERVALUE,',
'       a.LEGENDSCODE,',
'       b.includewithtaxableamount',
'  from CCINVOICEDETAILFOOTER a , footerhead b',
'  Where a.TNo = :P175_TNO',
'    and a.sno = :P175_SNO',
'    and a.footerheadcode = b.footerheadcode'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(499336145146944843)
,p_ajax_items_to_submit=>'P175_TNO,P175_SNO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P175_IS_READONLY'
,p_plug_read_only_when2=>'1'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(838031616688434817)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(838031653228434818)
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
 p_id=>wwv_flow_imp.id(879332663811778951)
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
,p_lov_id=>wwv_flow_imp.id(600561285303461686)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(879332781187778952)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer %'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(879332898117778953)
,p_name=>'FOOTERVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERVALUE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Value'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.99'
,p_is_required=>false
,p_enable_filter=>false
,p_static_id=>'FOOTERVALUE'
,p_use_as_row_header=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    options.defaultGridColumnOptions = {',
'        aggregates: ["SUM"] //or : "COUNT", "COUNT_DISTINCT", "AVG", "MIN", "MAX", "MEDIAN"',
'    };',
'    return options;',
'}',
''))
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(924439846921889723)
,p_name=>'INCLUDEWITHTAXABLEAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'INCLUDEWITHTAXABLEAMOUNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Includewithtaxableamount'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>3
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(879332956531778954)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Legends'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
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
,p_lov_id=>wwv_flow_imp.id(600562003841461692)
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(879332574984778950)
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
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(879332473671778949)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SN'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GlobalTNo'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(878941220004035898)
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
,p_static_id=>'SNO'
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(499336691854944848)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(878941138087035897)
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
,p_parent_column_id=>wwv_flow_imp.id(499336603437944847)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(878941084954035896)
,p_internal_uid=>869015562637509330
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
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
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
 p_id=>wwv_flow_imp.id(879338353346787006)
,p_interactive_grid_id=>wwv_flow_imp.id(878941084954035896)
,p_static_id=>'103985'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(879338576447787006)
,p_report_id=>wwv_flow_imp.id(879338353346787006)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(838537011671582836)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(838031616688434817)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>41
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(879339013637787008)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(878941138087035897)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(879339922651787011)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(878941220004035898)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(879340881356787013)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(879332473671778949)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(879341729219787015)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(879332574984778950)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(879342619349787017)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(879332663811778951)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>200
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(879343572894787019)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(879332781187778952)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(879344475686787020)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(879332898117778953)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(879345351209787022)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(879332956531778954)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(924731220306018121)
,p_view_id=>wwv_flow_imp.id(879338576447787006)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(924439846921889723)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(242780065526223382)
,p_plug_name=>'E-WayBill Entry form'
,p_static_id=>'e-waybill-entry-form'
,p_parent_plug_id=>wwv_flow_imp.id(667916835877150297)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       MODULETNO,',
'       MODULECODE,',
'       SUPPLYTYPE,',
'       DOCNO,',
'       DOCDATE,',
'       OTHERPARTYGSTIN,',
'       SUPPLYSTATE,',
'       VEHICLENO,',
'       NOOFITEMS,',
'       EWBNO,',
'       EWBDATE,',
'       VALIDTILLDATE,',
'       ERRORS,',
'       REMARK,',
'       CREATOR,',
'       CREATIONTIME',
'  from EWAYBILL',
' '))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P175_IS_READONLY'
,p_plug_read_only_when2=>'1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(864474186306965588)
,p_plug_name=>'Footer'
,p_static_id=>'footer'
,p_region_name=>'Footer'
,p_parent_plug_id=>wwv_flow_imp.id(667916835877150297)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       SNO,',
'       SERIALNO,',
'       FOOTERHEADCODE,',
'       FOOTERPERCENT,',
'       FOOTERVALUE,',
'       LEGENDSCODE',
'  from CCINVOICEFOOTER',
'  Where TNo = :P175_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P175_TNO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P175_ITEMWISEFOOTER'
,p_plug_read_only_when2=>'YES'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Footer'
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
 p_id=>wwv_flow_imp.id(864474675212965593)
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
,p_lov_id=>wwv_flow_imp.id(602724702980824507)
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
 p_id=>wwv_flow_imp.id(864474720100965594)
,p_name=>'FOOTERPERCENT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERPERCENT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer %'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>80
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
 p_id=>wwv_flow_imp.id(864474887188965595)
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
 p_id=>wwv_flow_imp.id(864474962621965596)
,p_name=>'LEGENDSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEGENDSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Legends'
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
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(602725843735824509)
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
 p_id=>wwv_flow_imp.id(864474593720965592)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
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
,p_default_type=>'STATIC'
,p_default_expression=>'1'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(864474436806965591)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SNO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(864474369687965590)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P175_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(864474279273965589)
,p_internal_uid=>854548756957439023
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
 p_id=>wwv_flow_imp.id(864491434282001260)
,p_interactive_grid_id=>wwv_flow_imp.id(864474279273965589)
,p_static_id=>'104108'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(864491676178001260)
,p_report_id=>wwv_flow_imp.id(864491434282001260)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(864492836963001262)
,p_view_id=>wwv_flow_imp.id(864491676178001260)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(864474369687965590)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(864493791774001264)
,p_view_id=>wwv_flow_imp.id(864491676178001260)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(864474436806965591)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(864494624704001266)
,p_view_id=>wwv_flow_imp.id(864491676178001260)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(864474593720965592)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>50
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(864495560764001268)
,p_view_id=>wwv_flow_imp.id(864491676178001260)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(864474675212965593)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>448
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(864496441953001272)
,p_view_id=>wwv_flow_imp.id(864491676178001260)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(864474720100965594)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(864497331134001274)
,p_view_id=>wwv_flow_imp.id(864491676178001260)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(864474887188965595)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>100
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(864498214414001277)
,p_view_id=>wwv_flow_imp.id(864491676178001260)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(864474962621965596)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>278
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(838405705639067145)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_region_name=>'General'
,p_parent_plug_id=>wwv_flow_imp.id(667916835877150297)
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
'       EMPLOYEECODE,',
'       CCINVOICENO,',
'       CCINVOICEDATE,',
'       CURRENCYUNITCODE,',
'       CURRENCYVALUE,',
'       PARTYCODE,',
'       CONSIGNEECODE,',
'       SUMOFAMOUNT,',
'       SUMOFFOOTERAMOUNT,',
'       CCINVOICEAMOUNT,',
'       despatchadvicetno, ',
'       salesordertno, ',
'       loadingadvicetno,',
'       AGENTCODE,',
'       ITEMWISEFOOTER,',
'       TRANSACTIONTYPECODE,',
'       NATUREOFSUPPLYCODE,',
'       REMARK,',
'       TRANSPORTERCODE,',
'       VEHICLETYPECODE,',
'       VEHICLENO,',
'       FREIGHTTYPECODE,',
'       FREIGHTRATE,',
'       FREIGHTUNITCODE,',
'       FREIGHTADVANCE,',
'       DRIVERNAME,',
'       LORRYNO,',
'       LORRYDATE,',
'       CREATOR,',
'       CREATIONTIME,',
'       FREIGHTCONTRACTTNO,',
'       nvl(GetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), a.Tno), ''Status'') AS Status,',
'       ADJUSTEDADVANCEAMOUNT,',
'       addbusinessplace,',
'       roundingamount,',
'       ADDBUSINESSPLACEBUYER,',
'       DISTANCE',
'  from CCINVOICE a'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P175_TNO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P175_IS_READONLY'
,p_plug_read_only_when2=>'1'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(667917072869150299)
,p_plug_name=>'General'
,p_static_id=>'general-2'
,p_parent_plug_id=>wwv_flow_imp.id(838405705639067145)
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
 p_id=>wwv_flow_imp.id(667917465895150303)
,p_plug_name=>'GST Nature'
,p_static_id=>'gst-nature'
,p_parent_plug_id=>wwv_flow_imp.id(838405705639067145)
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
 p_id=>wwv_flow_imp.id(499336145146944843)
,p_plug_name=>'Item Detail'
,p_static_id=>'item-detail'
,p_region_name=>'Detail'
,p_parent_plug_id=>wwv_flow_imp.id(667916835877150297)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select rowid,',
'       TNO,',
'       SNO,',
'       ITEMCODE,',
'       ITEMSPECIFICATIONCODE,',
'       getitemspecificationname(itemcode,itemspecificationcode) as ItemSpecificationName,',
'       DESCRIPTION,',
'       QUANTITY1,',
'       GetMeasuringUnitNameFromItem(ITEMCODE) AS MEASURINGUNITNAME1,',
'       QUANTITY2,',
'       GetMeasuringUnit2NameFromItem(ITEMCODE) AS MEASURINGUNITNAME2,',
'       ''SD'' As SD,',
'       RATE,',
'       AMOUNT,',
'       ''FD'' As FD,',
'       FOOTERAMOUNT,',
'       TOTALAMOUNT,',
'       REMARK,',
'       TAXRULECODE,',
'       PACKINGTYPECODE,',
'       PACKINGNOS ,',
'       RATEMEASURINGUNITCODE,',
'       DESPATCHCATEGORYCODE',
'  From CCINVOICEDETAIL ',
'  WHERE TNO = :P175_TNO',
'    '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P175_TNO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P175_IS_READONLY'
,p_plug_read_only_when2=>'1'
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
 p_id=>wwv_flow_imp.id(505128249338486536)
,p_heading=>'Item Specification'
,p_static_id=>'item-specification'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(249952361401444083)
,p_heading=>'Packing'
,p_static_id=>'packing'
,p_label=>'Packing'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(505128310316486537)
,p_heading=>'Primary'
,p_static_id=>'primary'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(505128495424486538)
,p_heading=>'Secondary'
,p_static_id=>'secondary'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499337385786944855)
,p_name=>'AMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'AMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499336429436944846)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499336336645944845)
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
 p_id=>wwv_flow_imp.id(499336931093944851)
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
,p_group_id=>wwv_flow_imp.id(505128249338486536)
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
,p_static_id=>'DESCRIPTION'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(256564839881226299)
,p_name=>'DESPATCHCATEGORYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DESPATCHCATEGORYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Despatchcategorycode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>260
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
,p_default_type=>'ITEM'
,p_default_expression=>'P175_TRANSACTIONTYPECODE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499338277737944864)
,p_name=>'FD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Fd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>210
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
' <span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">FD</span></a>'))
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499337478032944856)
,p_name=>'FOOTERAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FOOTERAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Footer Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(501236297456599945)
,p_name=>'ITEMCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Itemcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(505128249338486536)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_static_id=>'ITEMCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499336857982944850)
,p_name=>'ITEMSPECIFICATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(505128249338486536)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'ITEMSPECIFICATIONNAME:ITEMSPECIFICATIONNAME,ITEMCODE:ITEMCODE,ITEMCODE:P175_DETAILITEMCODE,ITEMSPECIFICATIONCODE:P175_DETAILITEMSPECIFICATIONCODE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '300',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '800')).to_clob
,p_is_required=>false
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(603208701975898688)
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P175_SALESORDERTNO,P175_DESPATCHADVICETNO'
,p_ajax_optimize_refresh=>false
,p_static_id=>'ITEMSPECIFICATIONCODE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(500813277603209743)
,p_name=>'ITEMSPECIFICATIONNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMSPECIFICATIONNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Specification Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(505128249338486536)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'ITEMSPECIFICATIONNAME'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499337933771944861)
,p_name=>'MEASURINGUNITNAME1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MEASURINGUNITNAME1'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(505128310316486537)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'MEASURINGUNITNAME1'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499338037101944862)
,p_name=>'MEASURINGUNITNAME2'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MEASURINGUNITNAME2'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Unit'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>190
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(505128495424486538)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>4000
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_lov_type=>'NONE'
,p_static_id=>'MEASURINGUNITNAME2'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(249952353557444082)
,p_name=>'PACKINGNOS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGNOS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Nos'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>240
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(249952361401444083)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
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
 p_id=>wwv_flow_imp.id(249952239750444081)
,p_name=>'PACKINGTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PACKINGTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>230
,p_value_alignment=>'LEFT'
,p_group_id=>wwv_flow_imp.id(249952361401444083)
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
,p_lov_source=>'SELECT PACKINGTYPENAME,PACKINGTYPECODE FROM PACKINGTYPE ORDER BY 1'
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
 p_id=>wwv_flow_imp.id(499337029255944852)
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
,p_group_id=>wwv_flow_imp.id(505128310316486537)
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499337190819944853)
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
,p_group_id=>wwv_flow_imp.id(505128495424486538)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999999999.999'
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'QUANTITY2'
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
 p_id=>wwv_flow_imp.id(499337234574944854)
,p_name=>'RATE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Rate'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
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
 p_id=>wwv_flow_imp.id(256564684668226298)
,p_name=>'RATEMEASURINGUNITCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'RATEMEASURINGUNITCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ratemeasuringunitcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>250
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
 p_id=>wwv_flow_imp.id(499337608070944858)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>160
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
 p_id=>wwv_flow_imp.id(85510336023915462)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>270
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499338199824944863)
,p_name=>'SD'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SD'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_LINK'
,p_heading=>'Sd'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>200
,p_value_alignment=>'LEFT'
,p_link_target=>'javascript:sd(''Stock_Detail'')'
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
,p_default_expression=>'<a href="javascript:sd(''Stock_Detail'')"><span class="t-Button t-Button--simple t-Button--hot t-Button--stretch">SD</span></a>'
,p_duplicate_value=>true
,p_include_in_export=>true
,p_escape_on_http_output=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499336691854944848)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
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
 p_id=>wwv_flow_imp.id(499337785570944859)
,p_name=>'TAXRULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TAXRULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Taxrulecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
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
 p_id=>wwv_flow_imp.id(499336603437944847)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Tno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_static_id=>'TNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P175_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(499337563242944857)
,p_name=>'TOTALAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TOTALAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Total Amount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>150
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
'}'))
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(499336227247944844)
,p_internal_uid=>489410704931418278
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
,p_toolbar_buttons=>'ACTIONS_MENU'
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
'        ',
'    }',
'    return options;',
'}',
''))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(499428344780061971)
,p_interactive_grid_id=>wwv_flow_imp.id(499336227247944844)
,p_static_id=>'28422'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(499428543804061972)
,p_report_id=>wwv_flow_imp.id(499428344780061971)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(99446502786586592)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>24
,p_column_id=>wwv_flow_imp.id(85510336023915462)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(250757988977496482)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(249952239750444081)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(250758920869496488)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(249952353557444082)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>59
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(256918402724244006)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>22
,p_column_id=>wwv_flow_imp.id(256564684668226298)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(256926845337328452)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>23
,p_column_id=>wwv_flow_imp.id(256564839881226299)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(496600314634538608)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(501236297456599945)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>104
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499429500781061975)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(499336429436944846)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499430383101061977)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(499336603437944847)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499431240631061979)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(499336691854944848)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>79
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'FIRST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499433040578061983)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(499336857982944850)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>184
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499433980528061985)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(499336931093944851)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>105
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499434890560061987)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(499337029255944852)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>81
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499435787362061989)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(499337190819944853)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499436644797061991)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(499337234574944854)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>83
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499437595106061993)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>16
,p_column_id=>wwv_flow_imp.id(499337385786944855)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>93
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499438454958061995)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>18
,p_column_id=>wwv_flow_imp.id(499337478032944856)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>103
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499439363597061997)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>19
,p_column_id=>wwv_flow_imp.id(499337563242944857)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>117
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499440304388061999)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>20
,p_column_id=>wwv_flow_imp.id(499337608070944858)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>101
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499441182191062001)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>21
,p_column_id=>wwv_flow_imp.id(499337785570944859)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>109
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499442985297062006)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(499337933771944861)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499443844303062008)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(499338037101944862)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>73
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499444765539062010)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(499338199824944863)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(499445692677062012)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>17
,p_column_id=>wwv_flow_imp.id(499338277737944864)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>90
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(500848374749653179)
,p_view_id=>wwv_flow_imp.id(499428543804061972)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(500813277603209743)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>282
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(667916835877150297)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'tabcontainer'
,p_region_template_options=>'#DEFAULT#:t-TabsRegion-mod--simple'
,p_plug_template=>wwv_flow_imp.id(566338286898256809)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(667917133827150300)
,p_plug_name=>'Party  &  Reference Detail'
,p_static_id=>'party-reference-detail'
,p_parent_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_region_template_options=>'#DEFAULT#:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(853779799753102156)
,p_plug_name=>'Stock  Detail'
,p_static_id=>'stock-detail'
,p_region_name=>'Stock_Detail'
,p_region_css_classes=>'js-dialog-size900x400'
,p_region_template_options=>'#DEFAULT#:t-DialogRegion--noPadding:js-dialog-nosize:t-Form--slimPadding'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>50
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       SN,',
'       STORAGELOCATIONCODE,',
'       STOCKTNO,',
'       QUANTITY1,',
'       partybillno,',
'       purchasebilltno,',
'       REMARK',
'  from CCINVOICESTOCKSTORAGEDETAIL',
'  Where TNo = :P175_TNO',
'    and SNO = :P175_SNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_master_region_id=>wwv_flow_imp.id(499336145146944843)
,p_ajax_items_to_submit=>'P175_TNO,P175_SNO'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P175_IS_READONLY'
,p_plug_read_only_when2=>'1'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Stock Type Detail'
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
 p_id=>wwv_flow_imp.id(500813391549209744)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(500813449510209745)
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
 p_id=>wwv_flow_imp.id(353614011043984801)
,p_name=>'PARTYBILLNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYBILLNO'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Bill No'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_static_id=>'PARTYBILLNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(361484013293912268)
,p_name=>'PURCHASEBILLTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PURCHASEBILLTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Purchasebilltno'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>false
,p_static_id=>'PURCHASEBILLTNO'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(853780410866102162)
,p_name=>'QUANTITY1'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'QUANTITY1'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Quantity'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(44534765331019107)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXTAREA'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(501271614187755344)
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
 p_id=>wwv_flow_imp.id(853780272275102160)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SN'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(853780126246102159)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'SNO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(499336691854944848)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(838032863757434830)
,p_name=>'STOCKTNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STOCKTNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Stock'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'PARTYBILLNO:PARTYBILLNO,PURCHASEBILLTNO:PURCHASEBILLTNO',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Stock for Allocation',
  'width', '900')).to_clob
,p_is_required=>true
,p_lov_type=>'SHARED'
,p_lov_id=>wwv_flow_imp.id(603267673401415465)
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'STORAGELOCATIONCODE'
,p_ajax_items_to_submit=>'P175_COMPANYCODE,P175_CCINVOICEDATE,P175_DETAILITEMCODE,P175_DETAILITEMSPECIFICATIONCODE,P175_STORAGELOCATIONCODE,P175_LOCATIONCODE,P175_STKTNO'
,p_ajax_optimize_refresh=>false
,p_static_id=>'STOCKTNO'
,p_use_as_row_header=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(838032764546434829)
,p_name=>'STORAGELOCATIONCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'STORAGELOCATIONCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Storage Location'
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
,p_is_required=>true
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>'Select StorageLocationName , StorageLocationCode from StorageLocation order by 1'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>false
,p_static_id=>'STORAGELOCATIONCODE'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(853780054084102158)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'TNO'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_enable_filter=>false
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>false
,p_is_primary_key=>false
,p_parent_column_id=>wwv_flow_imp.id(499336603437944847)
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(853779900130102157)
,p_internal_uid=>843854377813575591
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
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options){',
'',
'    var toolbar = apex.util.getNestedObject(options,''toolbar'');',
'',
'    toolbar.actionMenu      =   false;',
'    toolbar.columnSelection =   false;',
'    toolbar.searchField     =   false;',
'    toolbar.editing         =   false;',
'    toolbar.reset           =   false;',
'    toolbar.save            =   false;',
'',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(854037112802357483)
,p_interactive_grid_id=>wwv_flow_imp.id(853779900130102157)
,p_static_id=>'154516'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(854037368727357483)
,p_report_id=>wwv_flow_imp.id(854037112802357483)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(45215749723554827)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(44534765331019107)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(355713485128424457)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(353614011043984801)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(361752258576786634)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(361484013293912268)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(500852621634687461)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(500813391549209744)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(501440159306804778)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(501271614187755344)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(838626357536147702)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(838032764546434829)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>244
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(838627303425147704)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(838032863757434830)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>245
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(854037862663357485)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(853780054084102158)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(854038719988357487)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(853780126246102159)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>86
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(854039646545357489)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(853780272275102160)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>97
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(854041415382357493)
,p_view_id=>wwv_flow_imp.id(854037368727357483)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(853780410866102162)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>70
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(507080149136152917)
,p_plug_name=>'Terms And Conditions'
,p_static_id=>'terms-and-conditions'
,p_region_name=>'S_TAC'
,p_parent_plug_id=>wwv_flow_imp.id(667916835877150297)
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       TERMSANDCONDITIONHEADCODE,',
'       TERMSANDCONDITION',
'  from CCINVOICETAC',
'  where tno = :P175_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P175_TNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Terms And Conditions'
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
 p_id=>wwv_flow_imp.id(507080864847152924)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(507080982489152925)
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
 p_id=>wwv_flow_imp.id(507080321988152919)
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
 p_id=>wwv_flow_imp.id(507080523538152921)
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
 p_id=>wwv_flow_imp.id(507080710641152923)
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
 p_id=>wwv_flow_imp.id(507080616108152922)
,p_name=>'TERMSANDCONDITIONHEADCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TERMSANDCONDITIONHEADCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Terms And Condition Head'
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
,p_lov_source=>'select TERMSANDCONDITIONHEADNAME , tno from TERMSANDCONDITIONHEAD'
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
 p_id=>wwv_flow_imp.id(507080498577152920)
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
,p_default_expression=>'P175_TNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(507080297630152918)
,p_internal_uid=>497154775313626352
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
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function(options) {',
'    ',
'    var v_status = $v(''P175_STATUS'');',
'    var v_record = $v(''P175_FORMSTATUS'');',
'    var v_access = $v(''P175_HAS_SPECIAL_ACCESS'');',
'    ',
'    var v_toolbar = apex.util.getNestedObject(options, ''toolbar'');',
'    if (v_toolbar) {',
'        v_toolbar.actionMenu      = false;',
'        v_toolbar.columnSelection = false;',
'        v_toolbar.searchField     = false;',
'        v_toolbar.editing         = false;',
'        v_toolbar.reset           = false;',
'',
'        if(v_status === ''ACTIVE'' && v_access === ''Y'' || v_record === ''NEWRECORD''){',
'            v_toolbar.save            = true;',
'        }else{',
'            v_toolbar.save            = false;',
'        }',
'    }',
'',
'    return options;',
'}'))
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(507086056693158546)
,p_interactive_grid_id=>wwv_flow_imp.id(507080297630152918)
,p_static_id=>'104999'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(507086214960158546)
,p_report_id=>wwv_flow_imp.id(507086056693158546)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507086717344158548)
,p_view_id=>wwv_flow_imp.id(507086214960158546)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(507080321988152919)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507087589607158550)
,p_view_id=>wwv_flow_imp.id(507086214960158546)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(507080498577152920)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507088482192158552)
,p_view_id=>wwv_flow_imp.id(507086214960158546)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(507080523538152921)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507089406143158555)
,p_view_id=>wwv_flow_imp.id(507086214960158546)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(507080616108152922)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507090298300158557)
,p_view_id=>wwv_flow_imp.id(507086214960158546)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(507080710641152923)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(507091193673158559)
,p_view_id=>wwv_flow_imp.id(507086214960158546)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(507080864847152924)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(883002628385280950)
,p_plug_name=>'Total'
,p_static_id=>'total'
,p_parent_plug_id=>wwv_flow_imp.id(878940955181035895)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(868155574012761884)
,p_plug_name=>'Total Amount'
,p_static_id=>'total-amount'
,p_parent_plug_id=>wwv_flow_imp.id(864474186306965588)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(838029302421434794)
,p_plug_name=>'Transportation'
,p_static_id=>'transportation'
,p_parent_plug_id=>wwv_flow_imp.id(838405705639067145)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44990273549077551)
,p_button_sequence=>250
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
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
 p_id=>wwv_flow_imp.id(44989093690077550)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(498408659754989526)
,p_button_name=>'back'
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
 p_id=>wwv_flow_imp.id(44992649096077551)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
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
 p_id=>wwv_flow_imp.id(44964835266077540)
,p_button_sequence=>320
,p_button_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_button_name=>'ChangeFreight'
,p_static_id=>'changefreight'
,p_button_static_id=>'S_CHANGE_FREIGHT_BTN'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change'
,p_button_redirect_url=>'f?p=&APP_ID.:297:&SESSION.::&DEBUG.::P297_CCINVOICETNO,P297_FREIGHTRATE:&P175_TNO.,&P175_FREIGHTRATE.'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44993850666077552)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P175_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44993051484077551)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
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
,p_button_condition=>'P175_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44972226232077543)
,p_button_sequence=>270
,p_button_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_button_name=>'Detail'
,p_static_id=>'detail'
,p_button_static_id=>'S_ACC_SUM_DTL_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Detail'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P175_IS_READONLY'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44919677779077519)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(878940955181035895)
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
 p_id=>wwv_flow_imp.id(44991070001077551)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P175_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44991445866077551)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition=>'P175_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44939545841077529)
,p_button_sequence=>260
,p_button_plug_id=>wwv_flow_imp.id(507080149136152917)
,p_button_name=>'GetDefault'
,p_static_id=>'getdefault'
,p_button_static_id=>'S_TAC_GETDEFAULT_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Default'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P175_IS_READONLY'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44902801091077511)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(499336145146944843)
,p_button_name=>'GETITEM_1'
,p_static_id=>'getitem'
,p_button_static_id=>'S_GETITEM_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Get Item'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P175_IS_READONLY'
,p_button_condition2=>'0'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44911571157077516)
,p_button_sequence=>440
,p_button_plug_id=>wwv_flow_imp.id(853779799753102156)
,p_button_name=>'P175_AUTO_STOCK_ALLOCATE'
,p_static_id=>'p175-auto-stock-allocate'
,p_button_static_id=>'S_STOCKALLOCATE_BTN'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--tiny'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Auto Stock Allocate'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>':P175_IS_READONLY = 0 AND :P175_LOADINGADVICETNO IS NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_grid_column_attributes=>'style="padding-left: 10px; padding-bottom:10px;"'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44990623179077551)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
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
,p_button_condition=>'P175_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44992316853077551)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P175_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44993443341077552)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P175_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44991893502077551)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(963126389747298838)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P175_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P175_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(44911187311077515)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(853779799753102156)
,p_button_name=>'StockDetailback'
,p_static_id=>'stockdetailback'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(45127900381077592)
,p_branch_name=>'Go To Page 174'
,p_branch_action=>'f?p=&APP_ID.:174:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(44993051484077551)
,p_branch_sequence=>1
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(353685748086984852)
,p_name=>'P175_ADDBUSINESSPLACE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(667917133827150300)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Additional Business Place'
,p_source=>'ADDBUSINESSPLACE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name||'', ''||address1||'', ''||address2||'', ''||address3 as address , CUSTOMERADDRESSCODE from customeraddress',
'where tno in (select tno from party where partycode =  :P175_CONSIGNEECODE)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_lov_cascade_parent_items=>'P175_CONSIGNEECODE'
,p_ajax_items_to_submit=>'P175_CONSIGNEECODE'
,p_ajax_optimize_refresh=>'N'
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
  'min_chars', '0',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(256636307609226347)
,p_name=>'P175_ADDBUSINESSPLACEBUYER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(667917133827150300)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Buyer Address'
,p_source=>'ADDBUSINESSPLACEBUYER'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name||'', ''||address1||'', ''||address2||'', ''||address3 as address , CUSTOMERADDRESSCODE from customeraddress',
'where tno in (select tno from party where partycode =  :P175_PARTYCODE)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_lov_cascade_parent_items=>'P175_PARTYCODE'
,p_ajax_items_to_submit=>'P175_PARTYCODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_cMaxlength=>500
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
 p_id=>wwv_flow_imp.id(502089163610955246)
,p_name=>'P175_ADJUSTEDADVANCEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Advance amount'
,p_format_mask=>'999999999.99'
,p_source=>'ADJUSTEDADVANCEAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838484923954067207)
,p_name=>'P175_AGENTCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(667917133827150300)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Agent&nbsp&nbsp'
,p_source=>'AGENTCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PARTYNAME , PARTYCODE from party',
'where PARTYTYPECODE=''AGENT'''))
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
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
  'min_chars', '0',
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(510694658671586040)
,p_name=>'P175_ALLOWEDBACK'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(510697020066595202)
,p_name=>'P175_ALLOWEDFORWARD'
,p_item_sequence=>440
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498495709015989579)
,p_name=>'P175_BALANCEAMOUNT'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_prompt=>'Balance Amount'
,p_format_mask=>'999999999.99'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1416906655855611328)
,p_name=>'P175_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1358288310639342936)
,p_name=>'P175_CALLEDFROMPAGE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_item_default=>'174'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(505564836111098449)
,p_name=>'P175_CALLEDFROMTNO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838534143310067239)
,p_name=>'P175_CCINVOICEAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Ccinvoice Amount'
,p_format_mask=>'999999999.99'
,p_source=>'CCINVOICEAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838477355385067202)
,p_name=>'P175_CCINVOICEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(667917072869150299)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'select trunc(sysdate) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Ccinvoice Date&nbsp&nbsp'
,p_source=>'CCINVOICEDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P175_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P175_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838476970460067202)
,p_name=>'P175_CCINVOICENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(667917072869150299)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Ccinvoice No&nbsp&nbsp'
,p_source=>'CCINVOICENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
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
 p_id=>wwv_flow_imp.id(838468953737067199)
,p_name=>'P175_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838482978350067207)
,p_name=>'P175_CONSIGNEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(667917133827150300)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Consignee ( Ship To )'
,p_source=>'CONSIGNEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode from party    ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and :P175_DOCTYPECODE = ''PURCHASERETURN''',
'and partytypecode = ''SUPPLIER''',
'',
'union all    ',
'select partyname , partycode from party    ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and :P175_DOCTYPECODE != ''PURCHASERETURN''',
'and partytypecode = ''CUSTOMER''',
'and :P175_FORMSTATUS = ''NEWRECORD''',
'union all    ',
'select partyname , partycode from party    ',
'where getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'and :P175_DOCTYPECODE != ''PURCHASERETURN''',
'and partytypecode = ''CUSTOMER''',
'and :P175_FORMSTATUS = ''EDITRECORD''',
'and partycode = :P175_CONSIGNEECODE',
''))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P175_DOCTYPECODE'
,p_ajax_items_to_submit=>'P175_DOCTYPECODE'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(838481376499067206)
,p_name=>'P175_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'SELECT SYSDATE FROM DUAL'
,p_item_default_type=>'SQL_QUERY'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242821264902223438)
,p_name=>'P175_CREATIONTIME_1'
,p_source_data_type=>'DATE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838480926664067206)
,p_name=>'P175_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242821223380223437)
,p_name=>'P175_CREATOR_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838486947827067208)
,p_name=>'P175_CURRENCYUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(667917465895150303)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'select currencyunitcode from currencyunit where currencyunitcode = ''1'''
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Currency Unit&nbsp&nbsp'
,p_source=>'CURRENCYUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'CURRENCY UNIT'
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
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838487321348067208)
,p_name=>'P175_CURRENCYVALUE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(667917465895150303)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'select currencyvalue from currencyunit where currencyunitcode = ''1'''
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Currency Value&nbsp&nbsp'
,p_source=>'CURRENCYVALUE'
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
 p_id=>wwv_flow_imp.id(667989424919150356)
,p_name=>'P175_DESPATCHADVICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(667917133827150300)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Despatch Advice No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:161:&SESSION.::NO:RP,161:P161_TNO,P161_CALLEDFROMPAGE,P161_FORMSTATUS,P161_CALLEDFROMTNO:&P175_DESPATCHADVICETNO.,175,CALLED,&P175_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'DESPATCHADVICETNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P175_DESPATCHADVICE'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select - '
,p_lov_cascade_parent_items=>'P175_TNO'
,p_ajax_items_to_submit=>'P175_PARTYCODE,P175_LOCATIONCODE,P175_DOCTYPECODE,P175_SALESORDERTNO'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'height', '500',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Select Despatch Advice',
  'width', '1000')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(667934454932150318)
,p_name=>'P175_DETAILITEMCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(499336145146944843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(668328703133795204)
,p_name=>'P175_DETAILITEMSPECIFICATIONCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(499336145146944843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(501254806826599976)
,p_name=>'P175_DETAILQTY1'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(499336145146944843)
,p_format_mask=>'999999999.999'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(667934325811150317)
,p_name=>'P175_DETAILQUANTITY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(499336145146944843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(881368119942545962)
,p_name=>'P175_DFAMOUNT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(878940955181035895)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(923508540693420987)
,p_name=>'P175_DFAMOUNT_TEMP'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(878940955181035895)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(881370254377545983)
,p_name=>'P175_DFSUMOFFOOTERVALUE_TEMP'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(878940955181035895)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(883104631654281068)
,p_name=>'P175_DFTOTALAMOUNT'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(883002628385280950)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(104076548425459108)
,p_name=>'P175_DISTANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>360
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Distance'
,p_source=>'DISTANCE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242820156454223427)
,p_name=>'P175_DOCDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'DOC Date'
,p_source=>'DOCDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(242820040894223426)
,p_name=>'P175_DOCNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'DOC No'
,p_source=>'DOCNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
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
 p_id=>wwv_flow_imp.id(838476163867067202)
,p_name=>'P175_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(667917072869150299)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Doc Type&nbsp&nbsp'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'DOCTYPE1'
,p_lov_display_null=>'YES'
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
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838513099594067223)
,p_name=>'P175_DRIVERNAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>350
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Driver Name'
,p_source=>'DRIVERNAME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
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
 p_id=>wwv_flow_imp.id(838476534704067202)
,p_name=>'P175_EMPLOYEECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(667917072869150299)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Authorized Signatory'
,p_source=>'EMPLOYEECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'EMPLOYEE'
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
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242820957198223435)
,p_name=>'P175_ERRORS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Errors'
,p_source=>'ERRORS'
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
 p_id=>wwv_flow_imp.id(242820824776223433)
,p_name=>'P175_EWBDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_default=>'GLOBAL_SYSDATE'
,p_item_default_type=>'ITEM'
,p_prompt=>'EWB Date'
,p_source=>'EWBDATE'
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
 p_id=>wwv_flow_imp.id(242820722120223432)
,p_name=>'P175_EWBNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'EWB No'
,p_source=>'EWBNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
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
 p_id=>wwv_flow_imp.id(838469317578067199)
,p_name=>'P175_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(868286238541761979)
,p_name=>'P175_FOOTERTOTALAMOUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(868155574012761884)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      sum(footervalue)',
'From  CCINVOICEDETAILFOOTER',
'Where TNo = :P175_TNO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Total Tax Amount'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_tag_attributes=>'Style = "text-align: right;"'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1358288224160342935)
,p_name=>'P175_FORMSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P175_TNO is null then',
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
 p_id=>wwv_flow_imp.id(838512767741067222)
,p_name=>'P175_FREIGHTADVANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>380
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Freight Advance'
,p_source=>'FREIGHTADVANCE'
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
 p_id=>wwv_flow_imp.id(839184707278410680)
,p_name=>'P175_FREIGHTCONTRACTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_source=>'FREIGHTCONTRACTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838511962967067222)
,p_name=>'P175_FREIGHTRATE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>300
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Freight Rate'
,p_source=>'FREIGHTRATE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>7
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838511557762067222)
,p_name=>'P175_FREIGHTTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Freight Type'
,p_source=>'FREIGHTTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'Select FreightTypename d, freighttypecode r from FreightType WHERE MODULECODE=''CCINVOICE'' order by 1'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(838512284938067222)
,p_name=>'P175_FREIGHTUNITCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>290
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Freight Unit'
,p_source=>'FREIGHTUNITCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select measuringunitname , measuringunitcode from measuringunit order by 1'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(881806917805031171)
,p_name=>'P175_FVALUE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(878940955181035895)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(45597502524848215)
,p_name=>'P175_HAS_SPECIAL_ACCESS'
,p_item_sequence=>480
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(551259542947842151)
,p_name=>'P175_HSNCODE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(499336145146944843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(79491042300569997)
,p_name=>'P175_IS_READONLY'
,p_item_sequence=>470
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838475308002067203)
,p_name=>'P175_ITEMWISEFOOTER'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'YES'
,p_source=>'ITEMWISEFOOTER'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(667989636060150358)
,p_name=>'P175_LOADINGADVICETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(667917133827150300)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Loading Advice No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:155:&SESSION.::NO:RP,155:P155_TNO,P155_CALLEDFROMPAGE,P155_FORMSTATUS,P155_CALLEDFROMTNO:&P175_LOADINGADVICETNO.,175,CALLED,&P175_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'LOADINGADVICETNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P175_LOADINGADVICE'
,p_lov_cascade_parent_items=>'P175_PARTYCODE'
,p_ajax_items_to_submit=>'P175_PARTYCODE,P175_LOADINGADVICETNO,P175_LOCATIONCODE'
,p_ajax_optimize_refresh=>'N'
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
  'min_chars', '0',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838475754036067202)
,p_name=>'P175_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(667917072869150299)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'RC'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'LOCATION2'
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
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838513950033067223)
,p_name=>'P175_LORRYDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>340
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'L.R.Date'
,p_source=>'LORRYDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P175_CCINVOICEDATE',
  'min_date', 'ITEM',
  'min_item', 'P175_CCINVOICEDATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838513553751067223)
,p_name=>'P175_LORRYNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>330
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'L.R.No.'
,p_source=>'LORRYNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
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
 p_id=>wwv_flow_imp.id(242819901581223424)
,p_name=>'P175_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Module'
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.ModuleName,',
'a.ModuleCode',
'from Module a',
'where a.ModuleCode in (''CCINVOICE'')',
'order by 1'))
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
 p_id=>wwv_flow_imp.id(1358284506843342898)
,p_name=>'P175_MODULEFLOW'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242819804583223423)
,p_name=>'P175_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Module No'
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.InvoiceNo,',
'a.tno    ',
'from InvoiceForEWayBill a, Party b',
'where a.PartyCode = b.PartyCode',
'and a.LocationCode like nvl(:P175_LOCATIONCODE, ''%'')',
'and a.ModuleCode = :P175_MODULECODE',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_lov_cascade_parent_items=>'P175_LOCATIONCODE,P175_MODULECODE'
,p_ajax_items_to_submit=>'P175_LOCATIONCODE,P175_MODULECODE'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(838491348390067211)
,p_name=>'P175_NATUREOFSUPPLYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(667917465895150303)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'1'
,p_prompt=>'Nature Of Supply&nbsp&nbsp'
,p_source=>'NATUREOFSUPPLYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'NATURE OF SUPPLY'
,p_lov_display_null=>'YES'
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
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242820556508223431)
,p_name=>'P175_NOOFITEMS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'No Of Items'
,p_source=>'NOOFITEMS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1357692727739071632)
,p_name=>'P175_ONTHETABLE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242820273112223428)
,p_name=>'P175_OTHERPARTYGSTIN'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Other Party GSTIN'
,p_source=>'OTHERPARTYGSTIN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
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
 p_id=>wwv_flow_imp.id(838482523593067206)
,p_name=>'P175_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(667917133827150300)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Buyer'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P175_PARTY'
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P175_DOCTYPECODE'
,p_ajax_items_to_submit=>'P175_DOCTYPECODE'
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
  'min_chars', '0',
  'width', '600')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1332341245603718096)
,p_name=>'P175_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(839178425369410648)
,p_name=>'P175_QUANTITYTOALLOCATE'
,p_item_sequence=>400
,p_item_plug_id=>wwv_flow_imp.id(853779799753102156)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838482501032067206)
,p_name=>'P175_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(667917072869150299)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Payment Terms'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>1000
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
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
 p_id=>wwv_flow_imp.id(242821086853223436)
,p_name=>'P175_REMARK_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(276016337486441890)
,p_name=>'P175_ROUNDINGAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Rounding +/-'
,p_format_mask=>'999999999.99'
,p_source=>'ROUNDINGAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(667989487927150357)
,p_name=>'P175_SALESORDERTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(667917133827150300)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Sales Order No'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:171:&SESSION.::NO:RP,171:P171_TNO,P171_CALLEDFROMPAGE,P171_FORMSTATUS,P171_CALLEDFROMTNO:&P175_SALESORDERTNO.,175,CALLED,&P175_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source=>'SALESORDERTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P175_SALESORDER'
,p_lov_cascade_parent_items=>'P175_TNO'
,p_ajax_items_to_submit=>'P175_DESPATCHADVICETNO,P175_LOCATIONCODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
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
  'min_chars', '0',
  'width', '400')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(667934168146150316)
,p_name=>'P175_SNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(499336145146944843)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(667917550381150308)
,p_name=>'P175_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P175_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1332341081958718095)
,p_name=>'P175_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
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
 p_id=>wwv_flow_imp.id(359081908089823143)
,p_name=>'P175_STKTNO'
,p_item_sequence=>430
,p_item_plug_id=>wwv_flow_imp.id(853779799753102156)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(501263886707599984)
,p_name=>'P175_STOCKQTY1'
,p_item_sequence=>420
,p_item_plug_id=>wwv_flow_imp.id(853779799753102156)
,p_format_mask=>'999999999.999'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(243106773390343394)
,p_name=>'P175_STOCKREQUIRED'
,p_item_sequence=>450
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(666883387803348326)
,p_name=>'P175_STORAGELOCATIONCODE'
,p_item_sequence=>410
,p_item_plug_id=>wwv_flow_imp.id(853779799753102156)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838533315375067239)
,p_name=>'P175_SUMOFAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Sum Of Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838533726802067239)
,p_name=>'P175_SUMOFFOOTERAMOUNT'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Sum Of Footer Amount'
,p_format_mask=>'999999999.99'
,p_source=>'SUMOFFOOTERAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>3
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838093268518434891)
,p_name=>'P175_SUMOFSTOCKQUANTITY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(853779799753102156)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242820394278223429)
,p_name=>'P175_SUPPLYSTATE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Supply State'
,p_source=>'SUPPLYSTATE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select statename , statecode from state   ',
'order by statename'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_cMaxlength=>100
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
 p_id=>wwv_flow_imp.id(242820038899223425)
,p_name=>'P175_SUPPLYTYPE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Supply Type'
,p_source=>'SUPPLYTYPE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC:Outward;OUTWARD,Inward;INWARD'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(102506678687695008)
,p_name=>'P175_TEMP_CCINVOICEAMOUNT_HIDDEN'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838468578941067196)
,p_name=>'P175_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(242819719108223422)
,p_name=>'P175_TNO_1'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_default=>'P175_TNO'
,p_item_default_type=>'ITEM'
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(924517807487889803)
,p_name=>'P175_TOTALFOOTERVALUE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(878940955181035895)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(246912063382921822)
,p_name=>'P175_TOTALQUANTITY'
,p_item_sequence=>460
,p_item_plug_id=>wwv_flow_imp.id(1330513319050369342)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(838490941747067210)
,p_name=>'P175_TRANSACTIONTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(667917465895150303)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Transaction Type&nbsp&nbsp'
,p_source=>'TRANSACTIONTYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'TRANSACTION TYPE'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_css_classes=>'is-readonly'
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
 p_id=>wwv_flow_imp.id(838510323593067222)
,p_name=>'P175_TRANSPORTERCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Transporter'
,p_source=>'TRANSPORTERCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'PARTY'
,p_lov_display_null=>'YES'
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(242820853813223434)
,p_name=>'P175_VALIDTILLDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Valid Till Date'
,p_source=>'VALIDTILLDATE'
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
 p_id=>wwv_flow_imp.id(838511100308067222)
,p_name=>'P175_VEHICLENO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Vehicle No'
,p_source=>'VEHICLENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
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
 p_id=>wwv_flow_imp.id(242820509566223430)
,p_name=>'P175_VEHICLENO_1'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_item_source_plug_id=>wwv_flow_imp.id(242780065526223382)
,p_prompt=>'Vehicle No'
,p_source=>'VEHICLENO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>30
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
 p_id=>wwv_flow_imp.id(838510715026067222)
,p_name=>'P175_VEHICLETYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(838029302421434794)
,p_item_source_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_prompt=>'Vehicle Type'
,p_source=>'VEHICLETYPECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'Select VEHICLETYPENAME D, VEHICLETYPECODE R FROM VEHICLETYPE ORDER BY 1'
,p_lov_display_null=>'YES'
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
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(839210860872410694)
,p_name=>'P175_VOUCHERNO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(855423893654571314)
,p_prompt=>'Voucher No&nbsp&nbsp'
,p_post_element_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<a href="f?p=&APP_ID.:156:&SESSION.::NO:RP,156:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS,P156_CALLEDFROMTNO:&P175_VOUCHERTNO.,175,CALLED,&P175_TNO."><span class="fa fa-magic"></span></a>',
''))
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(839184977247410682)
,p_name=>'P175_VOUCHERTNO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(838405705639067145)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(52668120299987214)
,p_validation_name=>'Check Validation on CCInvoiceStockStorageDetail'
,p_static_id=>'check-validation-on-ccinvoicestockstoragedetail'
,p_validation_sequence=>10
,p_validation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_detail_qty NUMBER := 0;',
'    v_stock_qty  NUMBER := 0;',
'BEGIN',
'    IF :P175_TNO IS NOT NULL THEN',
'        ',
'        SELECT NVL(SUM(Quantity1), 0)',
'          INTO v_detail_qty',
'          FROM CCInvoiceDetail',
'         WHERE TNo = :P175_TNO;',
'',
'        SELECT NVL(SUM(Quantity1), 0)',
'          INTO v_stock_qty',
'          FROM CCInvoiceStockStorageDetail',
'         WHERE TNo = :P175_TNO;',
'',
'        IF v_detail_qty <> v_stock_qty THEN',
'            RETURN ''Validation Failed: Total Detail Quantity ('' || v_detail_qty || ',
'                   '') does not match with Total Allocated Stock Quantity ('' || v_stock_qty || ''). '' ||',
'                   ''Please make sure they are equal before saving.'';',
'        END IF;',
'',
'    END IF;',
'',
'    RETURN NULL; ',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        RETURN ''Error during quantity validation check: '' || SQLERRM;',
'END;'))
,p_validation2=>'PLSQL'
,p_validation_type=>'FUNC_BODY_RETURNING_ERR_TEXT'
,p_validation_condition_type=>'NEVER'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45087573797077581)
,p_name=>'Allocate the Material Stock'
,p_static_id=>'allocate-the-material-stock'
,p_event_sequence=>1250
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44911571157077516)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45088104887077581)
,p_event_id=>wwv_flow_imp.id(45087573797077581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'apex.server.process("FETCH_DATA_FOR_STOCK_GRID", ',
    '    { pageItems: "#P175_TNO,#P175_SNO,#P175_DETAILQTY1,#P175_DETAILITEMCODE,#P175_DETAILITEMSPECIFICATIONCODE,#P175_LOCATIONCODE, #P175_LOADINGADVICETNO" }, ',
    '    {',
    '        success: function(pData) {',
    '            if (pData.status === ''ERROR'') {',
    '                apex.message.showErrors([{ type: "error", location: "page", message: pData.message }]);',
    '                return;',
    '            }',
    '',
    '            var region = apex.region(''Stock_Detail'');',
    '            var $grid  = region.call(''getViews'', ''grid'');',
    '            var $model = $grid.model;',
    '',
    '            // Disable Add Row action',
    '            apex.region("Stock_Detail").widget().interactiveGrid("getActions").disable("selection-add-row");',
    '            ',
    '            var ig$ = apex.region("Stock_Detail").widget();',
    '            var igActions = ig$.interactiveGrid("getActions");',
    '            // Disable Toolbar and Row Actions ',
    '            igActions.disable("selection-add-row"); // Toolbar button',
    '            igActions.disable("row-add-row");       // Row menu option',
    '            igActions.disable("row-duplicate");     // Duplicate option',
    '',
    '            //Delete old entered Data',
    '            var toDelete = [];',
    '            $model.forEach(function(record, index, id){',
    '                var meta = $model.getRecordMetadata(id);',
    '                if (meta && (meta.inserted || meta.created)){',
    '                    toDelete.push(record);',
    '                }',
    '            });',
    '            if (toDelete.length > 0){',
    '                $model.deleteRecords(toDelete);',
    '            };',
    '',
    '            pData.stockQty.forEach(function(sQty) {',
    '',
    '                var newRecordId = $model.insertNewRecord();',
    '                var newRecord   = $model.getRecord(newRecordId);',
    '',
    '                // Helper function to handle null/undefined',
    '                function clean(val) { return (val === undefined || val === null) ? "" : String(val); }',
    '',
    '                $model.setValue(newRecord, ''TNO''                    , clean(sQty.TNO));',
    '                $model.setValue(newRecord, ''SNO''                    , clean(sQty.SNO));',
    '                $model.setValue(newRecord, ''SN''                     , clean(sQty.SN));',
    '                ',
    '                // LOV Columns handling',
    '                if (sQty.STORAGELOCATIONCODE) {',
    '                    $model.setValue(newRecord, ''STORAGELOCATIONCODE'', {d: clean(sQty.STORAGELOCATIONNAME), v: clean(sQty.STORAGELOCATIONCODE)});',
    '                } else {',
    '                    $model.setValue(newRecord, ''STORAGELOCATIONCODE'', null);',
    '                }',
    '',
    '                if (sQty.STOCKTNO) {',
    '                    $model.setValue(newRecord, ''STOCKTNO'', {d: clean(sQty.TRANSACTIONNO), v: clean(sQty.STOCKTNO)});',
    '                } else {',
    '                    $model.setValue(newRecord, ''STOCKTNO'', null);',
    '                }',
    '                // $model.setValue(newRecord, ''STORAGELOCATIONCODE''    , {d:String(sQty.STORAGELOCATIONNAME),v:String(sQty.STORAGELOCATIONCODE)});',
    '                // $model.setValue(newRecord, ''STOCKTNO''               , {d:String(sQty.TRANSACTIONNO),v:String(sQty.STOCKTNO)});',
    '                $model.setValue(newRecord, ''QUANTITY1''              , clean(sQty.QUANTITY1));',
    '                $model.setValue(newRecord, ''PARTYBILLNO''            , clean(sQty.PARTYBILLNO));',
    '                $model.setValue(newRecord, ''PURCHASEBILLTNO''        , clean(sQty.PURCHASEBILLTNO));',
    '                $model.setValue(newRecord, ''REMARK''                 , clean(sQty.REMARK));',
    '            });',
    '        }',
    '    }',
    ');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(46806943794493667)
,p_name=>'Allow Add Row in TAC for Special Access user'
,p_static_id=>'allow-add-row-in-tac-for-special-access-user'
,p_event_sequence=>1270
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(46807068742493668)
,p_event_id=>wwv_flow_imp.id(46806943794493667)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var v_status = $v(''P175_STATUS'');               //check the status to active',
    'var v_record = $v(''P175_FORMSTATUS'');           // check the form status',
    'var v_access = $v(''P175_HAS_SPECIAL_ACCESS'');   // check for the module privilege otheraccess',
    '',
    'setTimeout(function() {',
    '    var actions = apex.region("S_TAC")',
    '                      .widget()',
    '                      .interactiveGrid("getActions");',
    '',
    '    if (v_status === ''ACTIVE'' && v_access === ''Y'' || v_record === ''NEWRECORD'') {',
    '        actions.enable("selection-add-row");',
    '    } else {',
    '        actions.disable("selection-add-row");',
    '    }',
    '}, 100);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45005738618077559)
,p_name=>'Calculate Detail Footer Amount'
,p_static_id=>'calculate-detail-footer-amount'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_triggering_element=>'FOOTERPERCENT,LEGENDSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45006254222077560)
,p_event_id=>wwv_flow_imp.id(45005738618077559)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERVALUE',
  'items_to_submit', 'FOOTERHEADCODE,FOOTERPERCENT,LEGENDSCODE,P175_DFAMOUNT,P175_DFAMOUNT_TEMP',
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
    '  /*for vBookingDetail in',
    '        (',
    '        Select',
    '            sum(a.Amount) as TotalAmount',
    '        From BookingDetail a',
    '        Where a.Tno = :P93_Tno',
    '        )',
    '    loop',
    '        tTotalDetailAmount := vBookingDetail.TotalAmount;',
    '    end loop;*/',
    '    tTotalDetailAmount := :P175_DFAMOUNT_TEMP;',
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
 p_id=>wwv_flow_imp.id(45006760535077560)
,p_event_id=>wwv_flow_imp.id(45005738618077559)
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
 p_id=>wwv_flow_imp.id(45012815459077561)
,p_name=>'Calculate Detail Footer Total Amount value on get focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-get-focus'
,p_event_sequence=>190
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusin'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45013292188077561)
,p_event_id=>wwv_flow_imp.id(45012815459077561)
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
    '$s("P175_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45007189797077560)
,p_name=>'Calculate Detail Footer Total Amount value on loose focus'
,p_static_id=>'calculate-detail-footer-total-amount-value-on-loose-focus'
,p_event_sequence=>160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_triggering_element=>'FOOTERPERCENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45007693714077560)
,p_event_id=>wwv_flow_imp.id(45007189797077560)
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
    '$s("P175_DFTOTALAMOUNT", totalAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45017265127077562)
,p_name=>'Calculate df amount temp'
,p_static_id=>'calculate-df-amount-temp'
,p_event_sequence=>420
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_triggering_element=>'FOOTERVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45017748645077563)
,p_event_id=>wwv_flow_imp.id(45017265127077562)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P175_DFAMOUNT_TEMP',
  'items_to_submit', 'FOOTERHEADCODE,FOOTERVALUE,P175_DFAMOUNT,P175_DFAMOUNT_TEMP',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'tIncludeWithTaxableAmount VARCHAR2(30);',
    'BEGIN',
    'IF NVL(:FOOTERVALUE,0) > 0 then',
    '     for vFooterHead in',
    '            (',
    '            Select',
    '                IncludeWithTaxableAmount ',
    '            From FooterHead a',
    '            Where a.FooterHeadCode = :FOOTERHEADCODE',
    '            )',
    '        loop',
    '            tIncludeWithTaxableAmount := vFooterHead.IncludeWithTaxableAmount;',
    '        end loop;',
    '        		  		--raise_application_error(-20000,tIncludeWithTaxableAmount);',
    '',
    '        if nvl(tIncludeWithTaxableAmount,''NO'') = ''YES'' then',
    '            :P175_DFAMOUNT_TEMP := nvl(:P175_DFAMOUNT,0) + nvl(:FOOTERVALUE,0) ;',
    '        end if;',
    'end if;',
    'END ;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45053654384077572)
,p_name=>'Calculate Sum of Amount Value on Loose focus'
,p_static_id=>'calculate-sum-of-amount-value-on-loose-focus'
,p_event_sequence=>720
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'AMOUNT,FD,FOOTERAMOUNT,TOTALAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45054651524077572)
,p_event_id=>wwv_flow_imp.id(45053654384077572)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model;',
    'var totalKey = model.getFieldKey("AMOUNT");',
    'var footerKey = model.getFieldKey("FOOTERAMOUNT");',
    'var grandtotalKey = model.getFieldKey("TOTALAMOUNT");',
    'var totalAmt = 0;',
    'var footerAmt = 0;',
    'var grandtotalAmt = 0;',
    '',
    'model.forEach(function(r) {',
    '  var total = parseFloat(r[totalKey], 10);',
    '  var footer = parseFloat(r[footerKey], 10);',
    '  var grandtotal = parseFloat(r[grandtotalKey], 10);',
    '',
    '  if (!isNaN(total)) {',
    '    totalAmt += total;',
    '  }',
    '',
    '  if (!isNaN(footer)) {',
    '    footerAmt += footer;',
    '  }',
    '',
    '  if (!isNaN(grandtotal)) {',
    '    grandtotalAmt += grandtotal;',
    '  }',
    '});',
    '',
    '$s("P175_SUMOFAMOUNT", totalAmt);',
    '$s("P175_SUMOFFOOTERAMOUNT", footerAmt);',
    '$s("P175_CCINVOICEAMOUNT", grandtotalAmt);',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45054125469077572)
,p_event_id=>wwv_flow_imp.id(45053654384077572)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_CCINVOICEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TOTALAMOUNT',
  'plsql_expression', ':TOTALAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45008938402077560)
,p_name=>'Calculate SumofDetailFooterAmount Value'
,p_static_id=>'calculate-sumofdetailfooteramount-value'
,p_event_sequence=>180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45009970261077561)
,p_event_id=>wwv_flow_imp.id(45008938402077560)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' ',
    'var model = apex.region("Detail_Footer").widget().interactiveGrid("getViews", "grid").model;',
    'var amtKey = model.getFieldKey("FOOTERVALUE");',
    'var totAmt = 0;',
    '$s(''P175_DFSUMOFFOOTERVALUE_TEMP'',totAmt);',
    'model.forEach(function(r) {',
    'var n_amount = parseInt(r[amtKey], 10);',
    'if (!isNaN(n_amount)) {',
    'totAmt += n_amount;',
    '}',
    '});',
    '',
    '$s(''P175_DFSUMOFFOOTERVALUE_TEMP'',totAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45009496843077560)
,p_event_id=>wwv_flow_imp.id(45008938402077560)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DFSUMOFFOOTERVALUE_TEMP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DFSUMOFFOOTERVALUE_TEMP',
  'sql_query', 'select 0 from dual;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45010462809077561)
,p_event_id=>wwv_flow_imp.id(45008938402077560)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DFSUMOFFOOTERVALUE_TEMP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DFSUMOFFOOTERVALUE_TEMP',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select nvl(:P175_DFSUMOFFOOTERVALUE_TEMP,0) ',
    'from dual')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45019077503077563)
,p_name=>'Calculate SumofDetailFooterAmount Value For Including Rate'
,p_static_id=>'calculate-sumofdetailfooteramount-value-for-including-rate'
,p_event_sequence=>440
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_triggering_element=>'FOOTERVALUE,LEGENDSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45020050704077563)
,p_event_id=>wwv_flow_imp.id(45019077503077563)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Detail_Footer").widget().interactiveGrid("getViews", "grid").model;',
    'var ratekey = model.getFieldKey("INCLUDEWITHTAXABLEAMOUNT");',
    'var amtKey = model.getFieldKey("FOOTERVALUE");',
    'var totAmt = 0;',
    '$s(''P175_TOTALFOOTERVALUE'',totAmt);',
    'model.forEach(function(r) {',
    '',
    'var n_amount = parseInt(r[amtKey], 10);',
    'var n_key = model.getValue(r,''INCLUDEWITHTAXABLEAMOUNT'');',
    '//String(ratekey);',
    '//alert(n_key);',
    'if (n_key === "YES") {',
    '        if (!isNaN(n_amount)) {',
    '        totAmt += n_amount;',
    '        }',
    '}',
    '}',
    '',
    '',
    ')',
    ';',
    '',
    '$s(''P175_TOTALFOOTERVALUE'',totAmt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45019590059077563)
,p_event_id=>wwv_flow_imp.id(45019077503077563)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_TOTALFOOTERVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DFSUMOFFOOTERVALUE_TEMP',
  'sql_query', 'select 0 from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45020533448077563)
,p_event_id=>wwv_flow_imp.id(45019077503077563)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DFAMOUNT_TEMP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DFAMOUNT,P175_TOTALFOOTERVALUE',
  'plsql_expression', 'nvl(:P175_DFAMOUNT,0) + nvl(:P175_TOTALFOOTERVALUE,0) ',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45125450535077591)
,p_name=>'Calculate Total Amount inc. roundoff'
,p_static_id=>'calculate-total-amount-inc-roundoff'
,p_event_sequence=>1220
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_SUMOFAMOUNT,P175_SUMOFFOOTERAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45125952079077591)
,p_event_id=>wwv_flow_imp.id(45125450535077591)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// 1. Fetch values and remove commas to prevent NaN errors',
    'var num1 = parseFloat($v("P175_SUMOFAMOUNT").replace(/,/g, '''')) || 0;',
    'var num2 = parseFloat($v("P175_SUMOFFOOTERAMOUNT").replace(/,/g, '''')) || 0;',
    '',
    '// 2. Calculate the raw sum',
    'var rawTotal = num1 + num2;',
    '$s("P175_TEMP_CCINVOICEAMOUNT_HIDDEN", rawTotal.toFixed(2));',
    '',
    '// 3. Calculate the rounded figure (Nearest Integer)',
    'var roundedTotal = Math.round(rawTotal);',
    '',
    '// 4. Calculate the adjustment (Round Off) amount',
    'var roundOffAmount = roundedTotal - rawTotal;',
    '',
    '// 5. Set the values to the Page Items',
    '$s("P175_ROUNDINGAMOUNT", roundOffAmount.toFixed(2));',
    '$s("P175_CCINVOICEAMOUNT", roundedTotal.toFixed(2));',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45010834752077561)
,p_name=>'check detail qty1 and stock qty1'
,p_static_id=>'check-detail-qty1-and-stock-qty'
,p_event_sequence=>190
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44911187311077515)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45012347205077561)
,p_event_id=>wwv_flow_imp.id(45010834752077561)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(853779799753102156)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45011356161077561)
,p_event_id=>wwv_flow_imp.id(45010834752077561)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_DETAILQTY1 ,P175_STOCKQTY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P175_DETAILQTY1 <> :P175_STOCKQTY1 then',
    '    raise_application_error(-20000,''Entered Stock Qty is Not Matching With Detail Quantity.'');',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(52668136791987215)
,p_event_id=>wwv_flow_imp.id(45010834752077561)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var regDetail = apex.region(''Detail'');       ',
    'var regStock  = apex.region(''Stock_Detail''); ',
    '',
    'if (regDetail && regStock) {',
    '    var modelDetail = regDetail.call(''getViews'', ''grid'').model;',
    '    var modelStock  = regStock.call(''getViews'', ''grid'').model;',
    '    ',
    '    var totalDetail = 0;',
    '    var totalStock  = 0;',
    '',
    '    modelDetail.forEach(function(record, index, id) {',
    '        var meta = modelDetail.getRecordMetadata(id);',
    '        if (meta && (meta.deleted || meta.agg)) {',
    '            return; ',
    '        }',
    '        var val = parseFloat(modelDetail.getValue(record, "QUANTITY1"));',
    '        if (!isNaN(val)) totalDetail += val;',
    '    });',
    '',
    '    modelStock.forEach(function(record, index, id) {',
    '        var meta = modelStock.getRecordMetadata(id);',
    '        if (meta && (meta.deleted || meta.agg)) {',
    '            return; ',
    '        }',
    '        var val = parseFloat(modelStock.getValue(record, "QUANTITY1"));',
    '        if (!isNaN(val)) totalStock += val;',
    '    });',
    '',
    '    // 3. Floating-point precision validation check',
    '    if (totalDetail.toFixed(3) !== totalStock.toFixed(3)) {',
    '        apex.message.clearErrors();',
    '        apex.message.showErrors([{',
    '            type: "error",',
    '            location: "page",',
    '            message: "Validation Failed: Total Detail Quantity (" + totalDetail.toFixed(3) + ',
    '                     ") does not match with Allocated Stock Quantity (" + totalStock.toFixed(3) + ")."',
    '        }]);',
    '    } ',
    '    // else {',
    '    //     apex.page.submit({ request: ''SAVE'', validate: true });',
    '    // }',
    '}',
    '')))).to_clob
,p_build_option_id=>wwv_flow_imp.id(566229566348256666)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45011912010077561)
,p_event_id=>wwv_flow_imp.id(45010834752077561)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_STOCKQTY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', '0')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45094912983077583)
,p_name=>'close advance receipt'
,p_static_id=>'close-advance-receipt'
,p_event_sequence=>1030
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44989093690077550)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45095891926077583)
,p_event_id=>wwv_flow_imp.id(45094912983077583)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(498408659754989526)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45095408189077583)
,p_event_id=>wwv_flow_imp.id(45094912983077583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("ADV").widget().interactiveGrid("getViews", "grid").model;',
    'var n_amt, n_totamt = 0;',
    'col_amt = model.getFieldKey("ADJUSTEDADVANCEAMOUNT");',
    'model.forEach(function(igrow) {',
    '    n_amt = parseFloat(igrow[col_amt], 10);',
    '    if (!isNaN(n_amt)) {',
    '        n_totamt += n_amt;',
    '    }',
    '});',
    'apex.item("P175_ADJUSTEDADVANCEAMOUNT").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45032327326077566)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>530
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44992649096077551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45033864751077567)
,p_event_id=>wwv_flow_imp.id(45032327326077566)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'check detail'
,p_static_id=>'check-detail'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_status VARCHAR2(100) := :P175_STATUS;',
    'BEGIN',
    '    IF v_status = ''CANCELED'' THEN',
    '        BEGIN',
    '            checkdetail(getmodulecodeforpageno(:APP_PAGE_ID), :P175_TNO);',
    '        EXCEPTION',
    '            WHEN OTHERS THEN NULL;',
    '        END;',
    '    ELSE',
    '        checkdetail(getmodulecodeforpageno(:APP_PAGE_ID), :P175_TNO);',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45033332297077567)
,p_event_id=>wwv_flow_imp.id(45032327326077566)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_status VARCHAR2(100) := :P175_STATUS;',
    'BEGIN',
    '    IF UPPER(v_status) = ''CANCELED'' THEN',
    '        BEGIN',
    '            DELETE FROM ccinvoiceDETAIL a ',
    '            WHERE a.tno = :P175_TNO ',
    '              AND NOT EXISTS (SELECT 1 FROM ccinvoice aa WHERE aa.tno = a.tno);',
    '        EXCEPTION ',
    '            WHEN OTHERS THEN NULL;',
    '        END;',
    '    ELSE',
    '        DELETE FROM ccinvoiceDETAIL a ',
    '        WHERE a.tno = :P175_TNO ',
    '          AND NOT EXISTS (SELECT 1 FROM ccinvoice aa WHERE aa.tno = a.tno);',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45032888018077566)
,p_event_id=>wwv_flow_imp.id(45032327326077566)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P175_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P175_CALLEDFROMTNO'').getValue();',
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
 p_id=>wwv_flow_imp.id(45084321719077580)
,p_name=>'delete unsaved data'
,p_static_id=>'delete-unsaved-data-2'
,p_event_sequence=>950
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45084813657077580)
,p_event_id=>wwv_flow_imp.id(45084321719077580)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    IF :P175_TNO is NOT NULL THEN',
    '        -- 1. Mass Clean Up Section (Orphan Cleanup Optimization)',
    '        DELETE FROM ccinvoiceDETAIL a',
    '        WHERE a.tno = :P175_TNO',
    '          AND NOT EXISTS (',
    '              SELECT 1 FROM ccinvoice aa WHERE aa.tno = a.tno',
    '          );',
    '',
    '        DELETE FROM CCINVOICESTOCKSTORAGEDETAIL a',
    '        WHERE a.tno = :P175_TNO',
    '          AND NOT EXISTS (',
    '              SELECT 1 FROM ccinvoice aa WHERE aa.tno = a.tno',
    '          );',
    '',
    '        DELETE FROM CCINVOICEDETAILFOOTER a',
    '        WHERE a.tno = :P175_TNO',
    '          AND NOT EXISTS (',
    '              SELECT 1 FROM ccinvoicedetail aa ',
    '              WHERE aa.tno = a.tno AND aa.sno = a.sno',
    '          );',
    '',
    '        DELETE FROM CCINVOICEADJUSTEDADVANCE a',
    '        WHERE a.tno = :P175_TNO',
    '          AND NOT EXISTS (',
    '              SELECT 1 FROM ccinvoice aa WHERE aa.tno = a.tno',
    '          );',
    '',
    '',
    '        -- 2. Quantity Synchronization Block',
    '        MERGE INTO CCInvoiceStockStorageDetail target',
    '        USING (',
    '            SELECT d.TNO, d.SNO, d.QUANTITY1',
    '            FROM CCInvoiceDetail d',
    '            -- Inline sum checking step: Ensures the merge only processes if a total volume mismatch occurs',
    '            CROSS JOIN (',
    '                SELECT SUM(Quantity1) AS detail_tot FROM CCInvoiceDetail WHERE TNo = :P175_TNO',
    '            ) tot_d',
    '            CROSS JOIN (',
    '                SELECT SUM(Quantity1) AS stock_tot FROM CCInvoiceStockStorageDetail WHERE TNo = :P175_TNO',
    '            ) tot_s',
    '            WHERE d.TNO = :P175_TNO',
    '              AND NVL(tot_d.detail_tot, 0) <> NVL(tot_s.stock_tot, 0)',
    '        ) source',
    '        ON (target.TNO = source.TNO AND target.SNO = source.SNO)',
    '        WHEN MATCHED THEN',
    '            UPDATE SET target.Quantity1 = source.QUANTITY1;',
    '',
    '        COMMIT;',
    '    ',
    '    END IF;',
    '',
    'EXCEPTION',
    '    WHEN OTHERS THEN',
    '        ROLLBACK;',
    '        RAISE_APPLICATION_ERROR(-20001, ''Error during data synchronization cleanup process: '' || SQLERRM);',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45122211669077590)
,p_name=>'disable delete after E-Invoice'
,p_static_id=>'disable-delete-after-e-invoice'
,p_event_sequence=>1200
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45122705725077590)
,p_event_id=>wwv_flow_imp.id(45122211669077590)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993051484077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'1 from einvoice aa, Invoice bb',
' where aa.moduletno = bb.tno',
'   and bb.moduletno = :P175_TNO AND AA.IRN IS NOT NULL AND AA.CANCELDATE IS NULL'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45123202424077590)
,p_event_id=>wwv_flow_imp.id(45122211669077590)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993443341077552)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'1 from einvoice aa, Invoice bb',
' where aa.moduletno = bb.tno',
'   and bb.moduletno = :P175_TNO AND AA.IRN IS NOT NULL AND AA.CANCELDATE IS NULL'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45123710573077591)
,p_event_id=>wwv_flow_imp.id(45122211669077590)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993850666077552)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'1 from einvoice aa, Invoice bb',
' where aa.moduletno = bb.tno',
'   and bb.moduletno = :P175_TNO AND AA.IRN IS NOT NULL AND AA.CANCELDATE IS NULL'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45124192346077591)
,p_event_id=>wwv_flow_imp.id(45122211669077590)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991893502077551)
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45066167951077575)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>840
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45068631420077576)
,p_event_id=>wwv_flow_imp.id(45066167951077575)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disable based on Voucher and Status check'
,p_static_id=>'disable-based-on-voucher-and-status-check'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993051484077551)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'GET_TRANSACTION_STATUS(:P175_TNO,''INVOICE'') = 1'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45067136069077576)
,p_event_id=>wwv_flow_imp.id(45066167951077575)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993051484077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45066691989077575)
,p_event_id=>wwv_flow_imp.id(45066167951077575)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993051484077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45038381135077568)
,p_name=>'disable despatchadvice no'
,p_static_id=>'disable-despatchadvice-no'
,p_event_sequence=>590
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45038830010077568)
,p_event_id=>wwv_flow_imp.id(45038381135077568)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DESPATCHADVICETNO'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P175_LOADINGADVICETNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45039353937077568)
,p_event_id=>wwv_flow_imp.id(45038381135077568)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DESPATCHADVICETNO'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P175_LOADINGADVICETNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45119795138077590)
,p_name=>'disable get item after active'
,p_static_id=>'disable-get-item-after-active'
,p_event_sequence=>1190
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45120756414077590)
,p_event_id=>wwv_flow_imp.id(45119795138077590)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disable Detail Button'
,p_static_id=>'disable-detail-button'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44972226232077543)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45120282053077590)
,p_event_id=>wwv_flow_imp.id(45119795138077590)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_name=>'Disable GetItem button'
,p_static_id=>'disable-getitem-button'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44902801091077511)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45121291330077590)
,p_event_id=>wwv_flow_imp.id(45119795138077590)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44902801091077511)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45121815659077590)
,p_event_id=>wwv_flow_imp.id(45119795138077590)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '// var v_changeFreightBtn      = $(''#S_CHANGE_FREIGHT_BTN'');   // Change Freight Rate Button // removed as requested by Pushpak',
    'var v_accSumDtlBtn          = $(''#S_ACC_SUM_DTL_BTN'');      // Account Summary Detail Button',
    'var v_getItemBtn            = $(''#S_GETITEM_BTN'');          // Get Item Button',
    'var v_tacGetDefaultBtn      = $(''#S_TAC_GETDEFAULT_BTN'');   // TAC Get Default Button',
    'var v_autoStockAllocateBtn  = $(''#S_STOCKALLOCATE_BTN'');    // Auto Stock Allocation Button',
    '',
    '// v_changeFreightBtn.prop(''disabled'', true)',
    'v_accSumDtlBtn.prop(''disabled'', true)',
    'v_getItemBtn.prop(''disabled'', true)',
    'v_tacGetDefaultBtn.prop(''disabled'', true)',
    'v_autoStockAllocateBtn.prop(''disabled'', true)',
    '')))).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45036962400077568)
,p_name=>'disable loadingadviceno'
,p_static_id=>'disable-loadingadviceno'
,p_event_sequence=>580
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_DESPATCHADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45037482618077568)
,p_event_id=>wwv_flow_imp.id(45036962400077568)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_LOADINGADVICETNO'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P175_DESPATCHADVICETNO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45037953091077568)
,p_event_id=>wwv_flow_imp.id(45036962400077568)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_LOADINGADVICETNO'
,p_client_condition_type=>'NULL'
,p_client_condition_element=>'P175_DESPATCHADVICETNO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45073396112077577)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>890
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45074333986077578)
,p_event_id=>wwv_flow_imp.id(45073396112077577)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44992316853077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45073863997077577)
,p_event_id=>wwv_flow_imp.id(45073396112077577)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44992316853077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45069110152077576)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>860
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45071601185077577)
,p_event_id=>wwv_flow_imp.id(45069110152077576)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disable based on Voucher and Status check'
,p_static_id=>'disable-based-on-voucher-and-status-check'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993443341077552)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'GET_TRANSACTION_STATUS(:P175_TNO,''INVOICE'') = 1'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45069566131077576)
,p_event_id=>wwv_flow_imp.id(45069110152077576)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993443341077552)
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
 p_id=>wwv_flow_imp.id(45070100789077576)
,p_event_id=>wwv_flow_imp.id(45069110152077576)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44993443341077552)
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
'   AND NOT EXISTS ( SELECT 1 FROM VOUCHER AA WHERE MODULETNO = :P175_TNO)',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45071968503077577)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>870
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45072957169077577)
,p_event_id=>wwv_flow_imp.id(45071968503077577)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991893502077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45072436410077577)
,p_event_id=>wwv_flow_imp.id(45071968503077577)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991893502077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45783800486176209)
,p_name=>'Disable Status when voucher prepared'
,p_static_id=>'disable-status-when-voucher-prepared'
,p_event_sequence=>880
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45784062757176211)
,p_event_id=>wwv_flow_imp.id(45783800486176209)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991893502077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From voucher A',
' Where voucherno=:P175_CCINVOICENO;'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45783906783176210)
,p_event_id=>wwv_flow_imp.id(45783800486176209)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991893502077551)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES''',
'and a.CompanyCode = :global_CompanyCode'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(52667182860987205)
,p_name=>'Disable the Auto Stock Allocation button for OTO Case'
,p_static_id=>'disable-the-auto-stock-allocation-button-for-oto-case'
,p_event_sequence=>1290
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(52667235082987206)
,p_event_id=>wwv_flow_imp.id(52667182860987205)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Disable the Auto Stock Allocation Button'
,p_static_id=>'disable-the-auto-stock-allocation-button'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.item("S_STOCKALLOCATE_BTN").disable();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45026549788077565)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>510
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44991893502077551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45028571017077565)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'Cancel Invoice'
,p_static_id=>'cancel-invoice'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'tmp number;',
    'BEGIN',
    'select count(*) into tmp',
    'from einvoice a, Invoice b, Ccinvoice c',
    'where a.Moduletno = b.tno',
    '  and b.moduletno = c.tno',
    '  and c.tno = :P175_TNO',
    '  and a.canceldate is not null ',
    '  ;',
    '--raise_application_error(-20031 ,getDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO));',
    '  if nvl(tmp,0) > 0 then',
    '        if getDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO)= ''CANCELED''  then',
    '',
    '        --    CancelCCInvoice(:P175_TNO);',
    '           CancelCCInvoice_temp(:P175_TNO); -- Added by Vibhor',
    '           update ccinvoice x set x.DESPATCHADVICETNO = null where x.tno = :P175_TNO;',
    '',
    '        end if;',
    '   else',
    '        select count(*) into tmp',
    '            from einvoice a, Invoice b, Ccinvoice c',
    '            where a.Moduletno = b.tno',
    '              and b.moduletno = c.tno',
    '              and c.tno = :P175_TNO ',
    '              ;',
    '              if nvl(tmp,0) > 0 then',
    '                    raise_application_error(-20025,''First Cancel IRN , then Retry'');',
    '              else',
    '                CancelCCInvoice_temp(:P175_TNO); -- Added by Vibhor',
    '                update ccinvoice x set x.DESPATCHADVICETNO = null where x.tno = :P175_TNO;',
    '              end if;',
    '      ',
    '   end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'CANCELED'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44534640494019106)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'Execute Procedures'
,p_static_id=>'execute-procedures'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_STATUS,P175_DOCTYPECODE,P175_STOCKREQUIRED',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tInvTno  NUMBER;',
    'BEGIN',
    '  -- ============================================================',
    '  -- STEP 1: CHALANCUMINVOICE Processing',
    '  -- ============================================================',
    '  IF  getDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), :P175_TNO) = ''ACTIVE'' AND :P175_DOCTYPECODE  = ''CHALANCUMINVOICE'' THEN --IN (''CHALANCUMINVOICE'',''PURCHASERETURN'') THEN',
    '',
    '    -- Invoice Creation',
    '    IF :P175_TNO IS NOT NULL THEN',
    '    --   CREATEINVOICE(:P175_TNO);',
    '      CREATEINVOICE_TEMP(:P175_TNO); -- Added New Procedure by Vibhor on 02-05-2026',
    '      apex_debug.message(',
    '        p_message => ''STEP 1: Invoice created for TNO: %s'', ',
    '        p0        => :P175_TNO',
    '      );',
    '    END IF;',
    '',
    '    -- Fetch Created Invoice TNO',
    '    BEGIN',
    '      SELECT TNO',
    '        INTO tInvTno',
    '        FROM INVOICE',
    '       WHERE MODULETNO = :P175_TNO;',
    '    EXCEPTION',
    '      WHEN NO_DATA_FOUND THEN',
    '        RAISE_APPLICATION_ERROR(-20300,',
    '          ''Invoice not found for Module TNO: '' || :P175_TNO);',
    '      WHEN TOO_MANY_ROWS THEN',
    '        RAISE_APPLICATION_ERROR(-20301,',
    '          ''Multiple invoices found for Module TNO: '' || :P175_TNO);',
    '    END;',
    '',
    '    apex_debug.message(',
    '      p_message => ''STEP 2: Invoice TNO fetched: %s'', ',
    '      p0        => tInvTno',
    '    );',
    '',
    '    -- Post Invoice DN',
    '    -- postinvoicedn(tInvTno);',
    '        POSTINVOICEDN_TEMP(tInvTno);',
    '',
    '    apex_debug.message(',
    '      p_message => ''STEP 3: PostInvoiceDN completed for Invoice TNO: %s'', ',
    '      p0        => tInvTno',
    '    );',
    '',
    '  END IF;',
    '',
    '  -- ============================================================',
    '  -- STEP 2: Stock Posting',
    '  -- ============================================================',
    '  IF :P175_STOCKREQUIRED = ''YES'' THEN',
    '',
    '    -- postccinvoicestock(:P175_TNO);',
    '    PostCCInvoiceStock_Temp(:P175_TNO);',
    '',
    '',
    '    apex_debug.message(',
    '      p_message => ''STEP 4: PostCCInvoiceStock completed for TNO: %s'', ',
    '      p0        => :P175_TNO',
    '    );',
    '',
    '  ELSE',
    '',
    '    -- postccinvoicestock_frompo(:P175_TNO);',
    '    postccinvoicestock_frompo_temp(:P175_TNO);',
    '',
    '    apex_debug.message(',
    '      p_message => ''STEP 4: PostCCInvoiceStock_FromPO completed for TNO: %s'', ',
    '      p0        => :P175_TNO',
    '    );',
    '',
    '  END IF;',
    '',
    'EXCEPTION',
    '  WHEN OTHERS THEN',
    '    apex_debug.message(',
    '      p_message => ''ERROR in PostCCInvoice Block - TNO: %s | Error: %s'',',
    '      p0        => :P175_TNO,',
    '      p1        => SQLERRM',
    '    );',
    '    RAISE;',
    '',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45031091306077566)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>120
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991893502077551)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45030563934077566)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>110
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991893502077551)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45028101495077565)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_STATUS,P175_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    'tInvTno Number;',
    'BEGIN',
    '--raise_application_error(-20000,''101'');',
    'if getDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO)= ''ACTIVE'' AND :P175_DOCTYPECODE =''CHALANCUMINVOICE'' then',
    '    ',
    '    IF :P175_TNO is NOT  NULL THEN',
    '    createinvoice(:p175_tno);',
    '    apex_debug.message(''Invoice Created'');',
    '    END IF;',
    '--raise_application_error(-20000,''101'');',
    '',
    '    --commit;',
    '    SELECT TNO into tInvTno FROM INVOICE WHERE MODULETNO = :P175_TNO ;',
    '    postinvoicedn(tInvTno);',
    '',
    'end if;',
    '-- if getDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO)= ''ACTIVE'' AND :P175_DOCTYPECODE !=''CHALANCUMINVOICE''  then',
    '--     postccinvoicedn(:p175_tno);',
    ' ',
    '-- end if;',
    'if :P175_STOCKREQUIRED = ''YES'' then',
    '  postccinvoicestock(:P175_TNO);',
    'else',
    '--   postccinvoicestock_frompo(:P175_TNO);',
    '    POSTCCINVOICESTOCK_FROMPO_TEMP(:P175_TNO); --Added by Vibhor on 23-04-2026',
    'end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_STATUS'
,p_client_condition_expression=>'ACTIVE'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45029100436077566)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P175_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45029575410077566)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'location.reload()',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45030030998077566)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>100
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(963126389747298838)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45027076045077565)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45027587233077565)
,p_event_id=>wwv_flow_imp.id(45026549788077565)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Set Document Status'
,p_static_id=>'set-document-status'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_STATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tmp number;',
    '  tgrnno varchar2(1000);',
    'begin',
    '    if :P175_STATUS = ''ACTIVE'' then',
    '        for vGrn in (',
    '          select',
    '           c.grnno, count(*)',
    '        from ccinvoicestockstoragedetail a, stock b, grn c',
    '        where A.TNO=:P175_TNO',
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
    '            SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO,:P175_STATUS);',
    '        else',
    '            raise_application_error(-20025,''Purchase Bill Not Passed/Posted for Grn No ''||tgrnno||'' first Post then Try'');',
    '        end if;',
    '    else',
    '       --raise_application_error(-20026,''pstatus ''||:P175_STATUS||'' ''||getDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO));',
    '       if getDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO) = ''ONHOLD''  and :P175_STATUS = ''CANCELED'' then',
    '             SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO,:P175_STATUS);',
    '',
    '        elsif getDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO)  != ''ONHOLD''  and :P175_STATUS = ''CANCELED'' then',
    '           ',
    '             raise_application_error(-20026,''Cannot Canceled'');',
    '       else',
    '           --raise_application_error(-20026,''Cannot Canceled'');',
    '            SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P175_TNO,:P175_STATUS);',
    '             --SetDocumentStatusCode(''CCINVOICE'',:P175_TNO,:P175_STATUS);',
    '       end if;',
    '     ',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45126389680077591)
,p_name=>'Enable and Disable the Freight Rate field'
,p_static_id=>'enable-and-disable-the-freight-rate-field'
,p_event_sequence=>1230
,p_condition_element=>'P175_DESPATCHADVICETNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45127334974077591)
,p_event_id=>wwv_flow_imp.id(45126389680077591)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_name=>'enable readonly'
,p_static_id=>'enable-readonly'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var freightRate = $(''#P175_FREIGHTRATE'');',
    '',
    'freightRate.prop(''readonly'', true);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45126905083077591)
,p_event_id=>wwv_flow_imp.id(45126389680077591)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'remove readonly'
,p_static_id=>'remove-readonly'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var freightRate = $(''#P175_FREIGHTRATE'');',
    '',
    'freightRate.prop(''readonly'', false);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(44534148644019101)
,p_name=>'Enable and Disable the Freight Rate field on change'
,p_static_id=>'enable-and-disable-the-freight-rate-field-on-change'
,p_event_sequence=>1240
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_DESPATCHADVICETNO'
,p_condition_element=>'P175_DESPATCHADVICETNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44534381709019103)
,p_event_id=>wwv_flow_imp.id(44534148644019101)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'enable readonly'
,p_static_id=>'enable-readonly'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var freightRate = $(''#P175_FREIGHTRATE'');',
    '',
    'freightRate.prop(''readonly'', true);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44534268558019102)
,p_event_id=>wwv_flow_imp.id(44534148644019101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'remove readonly'
,p_static_id=>'remove-readonly'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var freightRate = $(''#P175_FREIGHTRATE'');',
    '',
    'freightRate.prop(''readonly'', false);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45064279883077575)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>820
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45064814058077575)
,p_event_id=>wwv_flow_imp.id(45064279883077575)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44990623179077551)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45065269036077575)
,p_event_id=>wwv_flow_imp.id(45064279883077575)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991070001077551)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45065804241077575)
,p_event_id=>wwv_flow_imp.id(45064279883077575)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44991445866077551)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P175_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45109682470077587)
,p_name=>'enable freight advance'
,p_static_id=>'enable-freight-advance'
,p_event_sequence=>1100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_DESPATCHADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45110191824077587)
,p_event_id=>wwv_flow_imp.id(45109682470077587)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FREIGHTADVANCE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45024717336077564)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>500
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44991070001077551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45025672500077565)
,p_event_id=>wwv_flow_imp.id(45024717336077564)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_COMPANYCODE,P175_PURCHASEORDERNO',
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
 p_id=>wwv_flow_imp.id(45026145449077565)
,p_event_id=>wwv_flow_imp.id(45024717336077564)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45025148760077565)
,p_event_id=>wwv_flow_imp.id(45024717336077564)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45031470564077566)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>520
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44992316853077551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45031951397077566)
,p_event_id=>wwv_flow_imp.id(45031470564077566)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45002923370077558)
,p_name=>'Hide and Return on Detail on Click Detail Footer Back Button'
,p_static_id=>'hide-and-return-on-detail-on-click-detail-footer-back-button'
,p_event_sequence=>100
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44919677779077519)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45004500757077559)
,p_event_id=>wwv_flow_imp.id(45002923370077558)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(878940955181035895)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45003491335077558)
,p_event_id=>wwv_flow_imp.id(45002923370077558)
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
    'apex.item("P175_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45003979992077558)
,p_event_id=>wwv_flow_imp.id(45002923370077558)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget = apex.region(''Detail'').widget();',
    'var grid = widget.interactiveGrid("getViews", "grid");',
    'var model = grid.model;',
    '',
    '// Get the selected records',
    'var selectedRecords = grid.getSelectedRecords();',
    '',
    '// Iterate over the selected records and set a value in a specific column',
    'for (var i = 0; i < selectedRecords.length; i++) {',
    '  var record = selectedRecords[i];',
    '  var columnAlias1 = "FOOTERAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value1 = $v("P175_FVALUE"); // Replace with the new value you want to set',
    '  var columnAlias2 = "TOTALAMOUNT"; // Replace with the alias of the column you want to set a value for',
    '  var value2 =  (parseFloat($v("P175_FVALUE"), 10)+ parseFloat($v("P175_DFAMOUNT"), 10)).toString(); // Replace with the new value you want to set',
    '  ',
    '',
    '  model.setValue(record, columnAlias1, value1);',
    '  model.setValue(record, columnAlias2, value2);',
    '}',
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
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45061613852077574)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>790
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45062028962077574)
,p_event_id=>wwv_flow_imp.id(45061613852077574)
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
 p_id=>wwv_flow_imp.id(45055099332077573)
,p_name=>'Initialise SN'
,p_static_id=>'initialise-sn'
,p_event_sequence=>730
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(853779799753102156)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45055564918077573)
,p_event_id=>wwv_flow_imp.id(45055099332077573)
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
    'Declare',
    'mysno number;',
    'Begin',
    'If :SN is null then',
    '    Select GlobalTNo.nextval into mysno from dual;',
    'else MYSNO := :SN;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45039793434077568)
,p_name=>'Initialize SNO Sequence_1'
,p_static_id=>'initialize-sno-sequence'
,p_event_sequence=>600
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45040305003077569)
,p_event_id=>wwv_flow_imp.id(45039793434077568)
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
    '    Select to_char(GlobalTNo.nextval) into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45080349714077579)
,p_name=>'INSERT INTO DETAIL FOOTER'
,p_static_id=>'insert-into-detail-footer'
,p_event_sequence=>940
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45081872943077579)
,p_event_id=>wwv_flow_imp.id(45080349714077579)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Insert footer detail as per tax rule'
,p_static_id=>'insert-footer-detail-as-per-tax-rule'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'TNO,SNO,P175_HSNCODE,P175_TRANSACTIONTYPECODE,P175_DFAMOUNT,P175_PARTYCODE,P175_FORMSTATUS',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'tmp    number;',
    'begin',
    'select count(*) into tmp',
    'FROM CCINVOICEDETAILFOOTER  WHERE TNO = :TNO AND SNO = :SNO;',
    '',
    'if :P175_FORMSTATUS =''NEWRECORD''  then',
    '--raise_application_error(-20000,''100'');',
    '   -- RAISE_APPLICATION_ERROR(-20000,''party ''||:P175_PARTYCODE||''tr type ''||:P175_TRANSACTIONTYPECODE||'' hsn ''||:P175_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P175_DFAMOUNT);',
    '',
    '        DELETE FROM CCINVOICEDETAILFOOTER  WHERE TNO = :TNO AND SNO = :SNO;',
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
    '                                (:P175_DFAMOUNT * B.TAXrATE) /100 AS FooterValue',
    '        					from TaxRuleDetail a, TaxRuleDetailFooter b, FooterHead c, TaxRule d, TaxRuleHSN e, party F',
    '        					where a.TNO = b.TNo',
    '        						and a.SNO = b.SNo',
    '        						and b.FooterHeadCode = c.FooterHeadCode',
    '        						and a.TNO = d.TNo',
    '                                and d.tno = e.tno',
    '                                and d.TaxRegistrationTypeCode = f.TaxRegistrationTypeCode',
    '                                and f.PartyCode = :P175_PARTYCODE',
    '                                And d.transactiontypecode = :P175_TRANSACTIONTYPECODE',
    '                                and e.HSNCODE =  :P175_HSNCODE',
    '        					--order by b.SNo',
    '        				)',
    '        			loop',
    '         --raise_application_error(-20000,''100'');	',
    '        			    Insert into CCINVOICEDETAILFOOTER ',
    '                        (sn,tno,sno,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '        				values',
    '                        (globaltno.nextval,:TNO,:SNO,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,vTaxRule.FooterValue,vTaxRule.Slno,vTaxRule.LegendsCode);',
    '        			',
    '        			end loop; -- for vTaxRule',
    '                    commit;',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45082331318077580)
,p_event_id=>wwv_flow_imp.id(45080349714077579)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(878940955181035895)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45080855748077579)
,p_event_id=>wwv_flow_imp.id(45080349714077579)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'set df amount'
,p_static_id=>'set-df-amount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DFAMOUNT,P175_FVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT,FOOTERAMOUNT',
  'sql_query', 'select :AMOUNT , :FOOTERAMOUNT from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45082841095077580)
,p_event_id=>wwv_flow_imp.id(45080349714077579)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set footer and total'
,p_static_id=>'set-footer-and-total'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERAMOUNT,TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO,AMOUNT',
  'sql_query', 'SELECT SUM(FOOTERVALUE),SUM(FOOTERVALUE) + NVL(:AMOUNT,0) FROM CCINVOICEDETAILFOOTER WHERE TNO = :TNO AND SNO=:SNO',
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45083918492077580)
,p_event_id=>wwv_flow_imp.id(45080349714077579)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_name=>'set footer value '
,p_static_id=>'set-footer-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'FOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_FVALUE',
  'sql_query', 'SELECT nvl(:P175_FVALUE,0) from dual',
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_client_condition_type=>'GREATER_THAN'
,p_client_condition_elem_type=>'ITEM'
,p_client_condition_element=>'P175_FVALUE'
,p_client_condition_expression=>'0'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45083419878077580)
,p_event_id=>wwv_flow_imp.id(45080349714077579)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'set fvalue'
,p_static_id=>'set-fvalue'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO,AMOUNT',
  'sql_query', 'SELECT SUM(FOOTERVALUE) FROM PURCHASEORDERDETAILFOOTER WHERE TNO = :TNO AND SNO=:SNO',
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45081396053077579)
,p_event_id=>wwv_flow_imp.id(45080349714077579)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set hsn '
,p_static_id=>'set-hsn'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_HSNCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', 'select hsncode from itemspecification where itemspecificationcode = :itemspecificationcode;',
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45047188789077570)
,p_name=>'Insert into detail with Despatch no'
,p_static_id=>'insert-into-detail-with-despatch-no'
,p_event_sequence=>660
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44902801091077511)
,p_condition_element=>'P175_DESPATCHADVICETNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45047647155077571)
,p_event_id=>wwv_flow_imp.id(45047188789077570)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_DESPATCHADVICETNO,P175_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '',
    '',
    '    delete from ccinvoicedetail where tno = :P175_TNO;',
    '    delete from ccinvoicedetailfooter where tno = :P175_TNO;',
    '',
    '    insert into ccinvoicedetail',
    '    (',
    '        tno , ',
    '        sno ,',
    '        ITEMCODE , ',
    '        ITEMSPECIFICATIONCODE , ',
    '        QUANTITY1 , ',
    '        QUANTITY2 , ',
    '        rate , ',
    '        amount , ',
    '        footeramount , ',
    '        totalamount,',
    '        DESCRIPTION',
    '',
    '    )',
    '    (',
    '        ',
    '        select ',
    '            :P175_TNO,',
    '            globaltno.nextval,',
    '            ITEMCODE , ',
    '            ITEMSPECIFICATIONCODE , ',
    '            QUANTITY1 , ',
    '            QUANTITY2 , ',
    '            rate , ',
    '            amount , ',
    '            footeramount , ',
    '            totalamount,',
    '            DESCRIPTION',
    '    from (',
    '        select ',
    '           ',
    '            a.ITEMCODE , ',
    '            a.ITEMSPECIFICATIONCODE , ',
    '            a.QUANTITY1 , ',
    '            a.QUANTITY2 , ',
    '            c.rate , ',
    '            --c.amount , ',
    '            round(c.rate * a.quantity1,2) as amount,',
    '            c.footeramount , ',
    '            c.totalamount,',
    '            C.DESCRIPTION',
    '        from despatchadvicedetail a , despatchadvice b , salesorderdetail c',
    '        where a.tno = b.tno',
    '        and b.SALESORDERTNO = c.tno',
    '        and a.ITEMCODE = c.ITEMCODE',
    '        and a.ITEMSPECIFICATIONCODE = c.ITEMSPECIFICATIONCODE',
    '        and b.tno = :P175_DESPATCHADVICETNO',
    '        union all',
    '        select ',
    '            ',
    '            c.ITEMCODE , ',
    '            c.ITEMSPECIFICATIONCODE , ',
    '            c.QUANTITY1 , ',
    '            c.QUANTITY2 , ',
    '            c.rate , ',
    '            c.amount , ',
    '            c.footeramount , ',
    '            c.totalamount,',
    '            C.DESCRIPTION',
    '        from salesorderdetail c',
    '        where c.tno = :P175_SALESORDERTNO',
    '        and c.itemcode in (select itemcode from item where ITEMNATURECODE = ''SERVICES''))',
    '    );',
    '',
    '',
    '        insert into ccinvoicedetailfooter',
    '        (',
    '            TNO,',
    '            SNO,',
    '            SN,',
    '            SERIALNO,',
    '            FOOTERHEADCODE,',
    '            FOOTERPERCENT,',
    '            FOOTERVALUE,',
    '            LEGENDSCODE',
    '        )',
    '            select :P175_TNO,',
    '                c.SNO,',
    '                globaltno.nextval,',
    '                serialno,',
    '                b.FOOTERHEADCODE,',
    '                b.FOOTERPERCENT,',
    '                --b.FOOTERVALUE ,',
    '                round((c.amount * b.FOOTERPERCENT) / 100 , 2) as footervalue,',
    '                b.LEGENDSCODE      ',
    '        from salesorderdetail a , salesorderdetailfooter b , ccinvoicedetail c ',
    '        where a.tno = :P175_SALESORDERTNO',
    '        and a.tno = b.tno',
    '        and a.itemcode = c.itemcode',
    '        and a.itemspecificationcode = c.itemspecificationcode',
    '        and a.sno = b.sno',
    '        ;',
    '',
    'end ;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45048185308077571)
,p_event_id=>wwv_flow_imp.id(45047188789077570)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_PARTYCODE,P175_TNO,P175_FINANCIALYEARCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tTotalBillingforFY number;',
    '  tAmount            Number;',
    '  ttcspercent        number := to_number(GETMYPARAMETERVALUE(''TCSPERCENT''), ''99.999'') ;',
    '  ttcsvalue          Number;',
    '  ttotalamount       Number;',
    '  tapplicablefromfirstbill varchar2(30);',
    '  fvalue             Number;',
    '  pCCINVOICEAMOUNT   Number;',
    'begin',
    '',
    '   for vloop in (    select',
    '       	nvl(b.eligiblefortdsunder194q,''NO'') as EligibleFromFirstBill, sum(a.invoiceamount) TransactionAmt',
    '	 into tapplicablefromfirstbill,tTotalBillingforFY',
    '	from  invoice a, party b',
    '	where a.partycode=b.partycode',
    '	  and a.partycode= :P175_PARTYCODE',
    '	  and a.moduletno != :P175_TNO',
    '	  and a.Financialyearcode = :P175_FINANCIALYEARCODE',
    '	  and nvl(b.tdsapplicable,''NO'') = ''YES''',
    '      group by nvl(b.eligiblefortdsunder194q,''NO'')',
    '	 -- AND nvl(b.eligiblefortdsunder194q,''NO'') = ''YES''',
    '   ) loop',
    '     tapplicablefromfirstbill := vloop.EligibleFromFirstBill;',
    '     tTotalBillingforFY       := vloop.TransactionAmt;',
    '   end loop;',
    '',
    '   select sum(totalamount) into pCCINVOICEAMOUNT from ccinvoicedetail where tno = :P175_TNO;',
    '   ',
    '   for i in  (select a.amount , a.sno from ccinvoicedetail a ',
    '                    where a.tno = :P175_tno ',
    '                     )',
    '   loop',
    '    ',
    '        if nvl(tTotalBillingforFY,0) + nvl(pCCINVOICEAMOUNT,0) >= 5000000 or tapplicablefromfirstbill = ''YES''  then',
    '                 ttcsvalue  := nvl(i.AMOUNT,0) * (nvl(ttcspercent,0)/100) ;',
    '               if nvl(ttcsvalue,0) > 0 then',
    '                   delete from ccinvoicedetailfooter',
    '                   where tno = :P175_tno',
    '                     and sno = i.SNO',
    '                     and footerheadcode = ''.TCS.''',
    '                     ;',
    '                   insert into CcinvoiceDetailFooter ( tno,sno,sn,footerheadcode,legendscode,footerpercent,footervalue)',
    '                   values ( :P175_TNO,i.SNO,globaltno.nextval,''.TCS.'',''PRA'',ttcspercent,ttcsvalue)',
    '                   ;',
    '    ',
    '                    ',
    '               end if;',
    '       ',
    '        end if;',
    '        ',
    '        select sum(footervalue) into fvalue from CcinvoiceDetailFooter',
    '        where tno = :P175_tno',
    '        and sno = i.SNO;',
    '        ',
    '        update ccinvoicedetail set footeramount = fvalue , totalamount = fvalue + i.amount',
    '        where tno = :P175_tno',
    '        and sno = i.SNO;',
    '        ',
    '    end loop;',
    '  ',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45049221781077571)
,p_event_id=>wwv_flow_imp.id(45047188789077570)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(499336145146944843)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45049706123077571)
,p_event_id=>wwv_flow_imp.id(45047188789077570)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh-2'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(878940955181035895)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45048699790077571)
,p_event_id=>wwv_flow_imp.id(45047188789077570)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_SUMOFAMOUNT,P175_SUMOFFOOTERAMOUNT,P175_CCINVOICEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(amount) , sum(footeramount) , sum(totalamount) ',
    'from ccinvoicedetail where tno = :P175_TNO;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(51648028152790516)
,p_event_id=>wwv_flow_imp.id(45047188789077570)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'With Order by SNO Clause'
,p_static_id=>'with-order-by-sno-clause'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_DESPATCHADVICETNO,P175_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    DELETE FROM ccinvoicedetail WHERE tno = :P175_TNO;',
    '    DELETE FROM ccinvoicedetailfooter WHERE tno = :P175_TNO;',
    '',
    '    INSERT INTO ccinvoicedetail (',
    '        tno, sno, ITEMCODE, ITEMSPECIFICATIONCODE, QUANTITY1, QUANTITY2, ',
    '        rate, amount, footeramount, totalamount, DESCRIPTION',
    '    )',
    '    SELECT ',
    '        :P175_TNO,',
    '        globaltno.nextval, ',
    '        src.ITEMCODE, ',
    '        src.ITEMSPECIFICATIONCODE, ',
    '        src.QUANTITY1, ',
    '        src.QUANTITY2, ',
    '        src.rate, ',
    '        src.amount, ',
    '        src.footeramount, ',
    '        src.totalamount,',
    '        src.DESCRIPTION',
    '    FROM (',
    '        SELECT * FROM (',
    '            SELECT ',
    '                a.ITEMCODE, ',
    '                a.ITEMSPECIFICATIONCODE, ',
    '                a.QUANTITY1, ',
    '                a.QUANTITY2, ',
    '                c.rate, ',
    '                ROUND(c.rate * a.quantity1, 2) AS amount,',
    '                c.footeramount, ',
    '                c.totalamount,',
    '                c.DESCRIPTION,',
    '                a.SNO AS ORDER_SNO ',
    '            FROM despatchadvicedetail a',
    '            JOIN despatchadvice b ON a.tno = b.tno',
    '            JOIN salesorderdetail c ON b.SALESORDERTNO = c.tno ',
    '                AND a.ITEMCODE = c.ITEMCODE ',
    '                AND a.ITEMSPECIFICATIONCODE = c.ITEMSPECIFICATIONCODE',
    '            WHERE b.tno = :P175_DESPATCHADVICETNO',
    '',
    '            UNION ALL',
    '',
    '            SELECT ',
    '                c.ITEMCODE, ',
    '                c.ITEMSPECIFICATIONCODE, ',
    '                c.QUANTITY1, ',
    '                c.QUANTITY2, ',
    '                c.rate, ',
    '                c.amount, ',
    '                c.footeramount, ',
    '                c.totalamount,',
    '                c.DESCRIPTION,',
    '                c.SNO AS ORDER_SNO ',
    '            FROM salesorderdetail c',
    '            WHERE c.tno = :P175_SALESORDERTNO',
    '              AND c.itemcode IN (SELECT itemcode FROM item WHERE ITEMNATURECODE = ''SERVICES'')',
    '        )',
    '        ORDER BY ORDER_SNO ',
    '    ) src;',
    '',
    '',
    '    INSERT INTO ccinvoicedetailfooter (',
    '        TNO, SNO, SN, SERIALNO, FOOTERHEADCODE, FOOTERPERCENT, FOOTERVALUE, LEGENDSCODE',
    '    )',
    '    SELECT ',
    '        :P175_TNO,',
    '        src_footer.SNO,',
    '        globaltno.nextval, ',
    '        src_footer.serialno,',
    '        src_footer.FOOTERHEADCODE,',
    '        src_footer.FOOTERPERCENT,',
    '        src_footer.footervalue,',
    '        src_footer.LEGENDSCODE      ',
    '    FROM (',
    '        SELECT ',
    '            c.SNO,',
    '            b.serialno,',
    '            b.FOOTERHEADCODE,',
    '            b.FOOTERPERCENT,',
    '            ROUND((c.amount * b.FOOTERPERCENT) / 100, 2) AS footervalue,',
    '            b.LEGENDSCODE,',
    '            a.SNO AS ORDER_SNO ',
    '        FROM salesorderdetail a',
    '        JOIN salesorderdetailfooter b ON a.tno = b.tno AND a.sno = b.sno',
    '        JOIN ccinvoicedetail c ON a.itemcode = c.itemcode AND a.itemspecificationcode = c.itemspecificationcode',
    '        WHERE a.tno = :P175_SALESORDERTNO',
    '          AND c.tno = :P175_TNO ',
    '        ORDER BY a.SNO ',
    '    ) src_footer;',
    '',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45044814160077570)
,p_name=>'Insert into detail with Loading Advice No'
,p_static_id=>'insert-into-detail-with-loading-advice-no'
,p_event_sequence=>650
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44902801091077511)
,p_condition_element=>'P175_LOADINGADVICETNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45045240956077570)
,p_event_id=>wwv_flow_imp.id(45044814160077570)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_LOADINGADVICETNO,P175_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    delete from ccinvoicedetail where tno = :P175_TNO;',
    '    delete from ccinvoicedetailfooter where tno = :P175_TNO;',
    '    ',
    '    insert into ccinvoicedetail',
    '    (',
    '        tno , ',
    '        sno ,',
    '        ITEMCODE , ',
    '        ITEMSPECIFICATIONCODE , ',
    '        QUANTITY1 , ',
    '        QUANTITY2 , ',
    '        rate , ',
    '        amount , ',
    '        footeramount , ',
    '        totalamount',
    '',
    '    )',
    '    (',
    '        select ',
    '            :P175_TNO,',
    '            globaltno.nextval,',
    '            ITEMCODE , ',
    '            ITEMSPECIFICATIONCODE , ',
    '            QUANTITY1 , ',
    '            QUANTITY2 , ',
    '            rate , ',
    '            amount , ',
    '            footeramount , ',
    '            totalamount',
    '    from (',
    '        select ',
    '           ',
    '            a.ITEMCODE , ',
    '            a.ITEMSPECIFICATIONCODE , ',
    '            a.QUANTITY1 , ',
    '            a.QUANTITY2 , ',
    '            c.rate , ',
    '            --c.amount , ',
    '            round(nvl(c.rate,0) * nvl(a.Quantity1,0),2) as Amount,',
    '            c.footeramount , ',
    '            c.totalamount',
    '        from loadingadvicedetail a , loadingadvice b , salesorderdetail c',
    '        where a.tno = b.tno',
    '        and b.salesORDERTNO = c.tno',
    '        and a.ITEMCODE = c.ITEMCODE',
    '        and a.ITEMSPECIFICATIONCODE = c.ITEMSPECIFICATIONCODE',
    '        and b.tno = :P175_LOADINGADVICETNO',
    '        ',
    '        union all',
    '        select ',
    '            ',
    '            c.ITEMCODE , ',
    '            c.ITEMSPECIFICATIONCODE , ',
    '            c.QUANTITY1 , ',
    '            c.QUANTITY2 , ',
    '            c.rate , ',
    '            c.amount , ',
    '            c.footeramount , ',
    '            c.totalamount',
    '        from salesorderdetail c',
    '        where c.tno = :P175_SALESORDERTNO',
    '        and c.itemcode in (select itemcode from item where ITEMNATURECODE = ''SERVICES''))',
    '    );',
    '',
    '      insert into ccinvoicedetailfooter',
    '        (',
    '            TNO,',
    '            SNO,',
    '            SN,',
    '            SERIALNO,',
    '            FOOTERHEADCODE,',
    '            FOOTERPERCENT,',
    '            FOOTERVALUE,',
    '            LEGENDSCODE',
    '        )',
    '            select :P175_TNO,',
    '                c.SNO,',
    '                globaltno.nextval,',
    '                serialno,',
    '                b.FOOTERHEADCODE,',
    '                b.FOOTERPERCENT,',
    '                (c.amount) * b.footerpercent / 100 as footervalue , --b.FOOTERVALUE ,',
    '                b.LEGENDSCODE      ',
    '        from salesorderdetail a , salesorderdetailfooter b , ccinvoicedetail c ',
    '        where a.tno = :P175_SALESORDERTNO',
    '        and a.tno = b.tno',
    '        and a.itemcode = c.itemcode',
    '        and a.itemspecificationcode = c.itemspecificationcode',
    '        and a.sno = b.sno',
    '        ;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45045776524077570)
,p_event_id=>wwv_flow_imp.id(45044814160077570)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_PARTYCODE,P175_TNO,P175_FINANCIALYEARCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tTotalBillingforFY number;',
    '  tAmount            Number;',
    '  ttcspercent        number := to_number(GETMYPARAMETERVALUE(''TCSPERCENT''), ''99.999'') ;',
    '  ttcsvalue          Number;',
    '  ttotalamount       Number;',
    '  tapplicablefromfirstbill varchar2(30);',
    '  fvalue             Number;',
    '  pCCINVOICEAMOUNT   Number;',
    'begin',
    '   for vloop in (    select',
    '       	nvl(b.eligiblefortdsunder194q,''NO'') as EligibleFromFirstBill, sum(a.invoiceamount) TransactionAmt',
    '	 into tapplicablefromfirstbill,tTotalBillingforFY',
    '	from  invoice a, party b',
    '	where a.partycode=b.partycode',
    '	  and a.partycode= :P175_PARTYCODE',
    '	  and a.moduletno != :P175_TNO',
    '	  and a.Financialyearcode = :P175_FINANCIALYEARCODE',
    '	  and nvl(b.tdsapplicable,''NO'') = ''YES''',
    '      group by nvl(b.eligiblefortdsunder194q,''NO'')',
    '	 -- AND nvl(b.eligiblefortdsunder194q,''NO'') = ''YES''',
    '     -- 04-NOV-2024',
    '     union all',
    '     select ',
    '     nvl(b.eligiblefortdsunder194q,''NO'') as EligibleFromFirstBill, 0 TransactionAmt',
    '     from party b',
    '     where b.partycode= :P175_PARTYCODE',
    '       and nvl(b.tdsapplicable,''NO'') = ''YES''',
    '',
    '',
    '   ) loop',
    '',
    '     tapplicablefromfirstbill := vloop.EligibleFromFirstBill;',
    '     tTotalBillingforFY       := vloop.TransactionAmt;',
    '     exit;',
    '   end loop;',
    '',
    '   select sum(totalamount) into pCCINVOICEAMOUNT from ccinvoicedetail where tno = :P175_TNO;',
    '   ',
    '   for i in  (select a.totalamount as amount , a.sno ',
    '                from ccinvoicedetail a ',
    '               where a.tno = :P175_tno ',
    '                     )',
    '   loop',
    '    --RAISE_APPLICATION_ERROR(-20001,''RAISED ''||tapplicablefromfirstbill);',
    '        if nvl(tTotalBillingforFY,0) + nvl(pCCINVOICEAMOUNT,0) >= 5000000 or tapplicablefromfirstbill = ''YES''  then',
    '                 ttcsvalue  := nvl(i.AMOUNT,0) * (nvl(ttcspercent,0)/100) ;',
    '               if nvl(ttcsvalue,0) > 0 then',
    '                   delete from ccinvoicedetailfooter',
    '                   where tno = :P175_tno',
    '                     and sno = i.SNO',
    '                     and footerheadcode = ''.TCS.''',
    '                     ;',
    '            ',
    '                   insert into CcinvoiceDetailFooter ( tno,sno,sn,footerheadcode,legendscode,footerpercent,footervalue)',
    '                   values ( :P175_TNO,i.SNO,globaltno.nextval,''.TCS.'',''PRA'',ttcspercent,ttcsvalue)',
    '                   ;',
    '    ',
    '                    ',
    '               end if;',
    '       ',
    '        end if;',
    '        ',
    '        select sum(footervalue) into fvalue from CcinvoiceDetailFooter',
    '        where tno = :P175_tno',
    '        and sno = i.SNO;',
    '        ',
    '        update ccinvoicedetail set footeramount = fvalue , totalamount = fvalue + i.amount',
    '        where tno = :P175_tno',
    '        and sno = i.SNO;',
    '        ',
    '    end loop;',
    '  ',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45046760707077570)
,p_event_id=>wwv_flow_imp.id(45044814160077570)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(499336145146944843)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45046259071077570)
,p_event_id=>wwv_flow_imp.id(45044814160077570)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_SUMOFAMOUNT,P175_SUMOFFOOTERAMOUNT,P175_CCINVOICEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(amount) , sum(footeramount) , sum(totalamount) ',
    'from ccinvoicedetail where tno = :P175_TNO;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45112410039077588)
,p_name=>'Insert into tac'
,p_static_id=>'insert-into-tac'
,p_event_sequence=>1130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44939545841077529)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45112858485077588)
,p_event_id=>wwv_flow_imp.id(45112410039077588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_DOCTYPECODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from CCINVOICETAC where tno = :P175_TNO;',
    'insert into CCINVOICETAC',
    '(',
    '    TNO, ',
    '    SNO, ',
    '    TERMSANDCONDITIONHEADCODE, ',
    '    TERMSANDCONDITION',
    ')',
    '(',
    '    SELECT',
    '        :P175_TNO,',
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
    '                AND doctypecode = :P175_DOCTYPECODE',
    '        )',
    ');',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45113364482077588)
,p_event_id=>wwv_flow_imp.id(45112410039077588)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(507080149136152917)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45089382192077582)
,p_name=>'move tab'
,p_static_id=>'move-tab'
,p_event_sequence=>980
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_FREIGHTADVANCE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45089879659077582)
,p_event_id=>wwv_flow_imp.id(45089382192077582)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_General"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45090226801077582)
,p_name=>'move tab1'
,p_static_id=>'move-tab-2'
,p_event_sequence=>990
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(507613493385104937)
,p_triggering_element=>'REMARK'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'JOBTYPECODE'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45090778806077582)
,p_event_id=>wwv_flow_imp.id(45090226801077582)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'apex.region("tabcontainer").widget().aTabs("getTabs")["#SR_ccjob"].moveNext();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45116129858077589)
,p_name=>'New_2'
,p_static_id=>'new'
,p_event_sequence=>1150
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45116696916077589)
,p_event_id=>wwv_flow_imp.id(45116129858077589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_name=>'disable changefreight button'
,p_static_id=>'disable-changefreight-button'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(44964835266077540)
,p_server_condition_type=>'NOT_EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1',
'  From MODULEPRIVILEGE A, BOSSUSER B',
' Where A.BOSSUSERCODE = B.BOSSUSERCODE',
'   And A.MODULECODE = ''CCINVOICE''',
'   And A.OTHERPRIVILEGE = ''YES''',
'   And B.LOGINNAME = :Global_Loginname'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45093501457077583)
,p_name=>'open advance receipt'
,p_static_id=>'open-advance-receipt'
,p_event_sequence=>1020
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44972226232077543)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45094425178077583)
,p_event_id=>wwv_flow_imp.id(45093501457077583)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-open-region'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(498408659754989526)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45093963237077583)
,p_event_id=>wwv_flow_imp.id(45093501457077583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(498408659754989526)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45013721528077561)
,p_name=>'Open Voucher'
,p_static_id=>'open-voucher'
,p_event_sequence=>280
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_VOUCHERNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'dblclick'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45014213505077562)
,p_event_id=>wwv_flow_imp.id(45013721528077561)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P175_VOUCHERTNO'').getValue();',
    'var y = ''175'';',
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
 p_id=>wwv_flow_imp.id(45022732704077564)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>490
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44990623179077551)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45023728830077564)
,p_event_id=>wwv_flow_imp.id(45022732704077564)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_COMPANYCODE',
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
    '             if :P175_STATUS = ''ACTIVE'' then',
    '        ',
    '                CREATEPAYMENTADVICEFORPO(:P175_TNO);',
    '',
    '              end if;',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45024321684077564)
,p_event_id=>wwv_flow_imp.id(45022732704077564)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45023237399077564)
,p_event_id=>wwv_flow_imp.id(45022732704077564)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45085154587077580)
,p_name=>'Recalculate Amounts'
,p_static_id=>'recalculate-amounts'
,p_event_sequence=>960
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'QUANTITY1,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45087193736077581)
,p_event_id=>wwv_flow_imp.id(45085154587077580)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'recalculate amount- javascript'
,p_static_id=>'recalculate-amount-javascript'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget      = apex.region(''Detail'').widget();',
    'var grid        = widget.interactiveGrid(''getViews'',''grid'');  ',
    'var model       = grid.model; ',
    'var gtotal = 0;',
    'var sumoffooteramount = 0;',
    'var sumofamount       = 0;',
    'var sumoftotalamount  = 0;',
    'var detailsno         = 0;',
    'var amount            = 0;',
    'var totalfooter       = 0;',
    '',
    'model.forEach(function(r,index) {',
    '    try{',
    '    var record = r;',
    '    rec = record[index];',
    '',
    '    var quantity1           = model.getValue(record,''QUANTITY1'');',
    '    var rate           = model.getValue(record,''RATE'');',
    '',
    '    //var withoutdiscountrate = model.getValue(record,''WITHOUTDISCOUNTRATE'');',
    '    //var discountpercentage  = model.getValue(record,''DISCOUNTPERCENTAGE'');',
    '    //var discountrate        = model.getValue(record,''DISCOUNTRATE'');',
    '    //var rateafterdiscount   = model.getValue(record,''RATEAFTERDISCOUNT'');',
    '    var footeramount        = model.getValue(record,''FOOTERAMOUNT'');',
    '    var detailsno           = model.getValue(record,''SNO'');',
    '    var totalamount         = 0;',
    '    //rate                    = parseFloat(withoutdiscountrate) - parseFloat(discountrate) ;',
    '    amount                  = quantity1 * rate ;',
    '// loop for footer',
    'var footerwidget      = apex.region(''Detail_Footer'').widget();',
    'var footergrid        = footerwidget.interactiveGrid(''getViews'',''grid'');  ',
    'var footermodel       = footergrid.model; ',
    'var totalfooter = 0;',
    'try{',
    'apex.region(''Detail_Footer'').call(''getActions'').set(''edit'', true);',
    'footermodel.forEach(function(f,findex) {',
    '    var footerrecord = f;',
    '     footerrec = footerrecord[findex];',
    'var legends           = footermodel.getValue(footerrecord,''LEGENDSCODE'');',
    'var legendscode       = legends.v;',
    '',
    '    var footerheadcode        = footermodel.getValue(footerrecord,''FOOTERHEADCODE'');',
    '    var footerpercentage         = footermodel.getValue(footerrecord,''FOOTERPERCENT'');',
    '    var footervalue           = footermodel.getValue(footerrecord,''FOOTERVALUE'');',
    '    var footersno             = footermodel.getValue(footerrecord,''SNO'');',
    '',
    'if (footersno == detailsno){',
    '',
    '//alert('' old footer value ''+footervalue);  ',
    '   // var footervalue = 0;',
    '   var footerpercent =0;',
    '     if (footerpercentage !='''' || footerpercentage !=null)',
    '       footerpercent = parseFloat(footerpercentage);',
    '',
    '    if (legendscode == ''PRA''){',
    '        footervalue = Math.round((parseFloat(amount) * parseFloat(footerpercent)) / 100) ;',
    '    } else ',
    '        if (legendscode == ''PAA''){',
    '    ',
    '            footervalue = ((parseFloat(amount) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '        } else ',
    '            if (legendscode == ''OQA''){',
    '                footervalue = ((parseFloat(quantity1) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '            } else',
    '                if (legendscode == ''OQD''){',
    '                footervalue = (-1) * ((parseFloat(quantity1) * parseFloat(footerpercent)) / 100).toFixed(2) ;',
    '                }  else footervalue = footervalue;',
    '',
    '   totalfooter += footervalue;',
    ' //  alert(''total footer value ''+footervalue);',
    '   footermodel.setValue(footerrecord,''FOOTERVALUE'',footervalue)',
    '  //  alert(totalamount);',
    ' // apex.item(''P175_FVALUE'').setValue(totalfooter);',
    '} else totalfooter = footeramount;',
    '} ',
    '// checked sno end;',
    ')',
    '} catch (ex){}',
    '// close footer loop',
    '//totalfooter = apex.item(''P175_FVALUE'').getValue();',
    '//alert(totalfooter);',
    'if (totalfooter == 0)',
    '{',
    '    totalfooter = footeramount;',
    '}',
    '',
    'totalamount = parsefloat(amount) + totalfooter;',
    '',
    'model.setValue(record,''FOOTERAMOUNT'',totalfooter);',
    '//alert(totalamount); ',
    '',
    'model.setValue(record,''RATE'',rate)  ; ',
    'model.setValue(record,''AMOUNT'',amount)  ; ',
    'model.setValue(record,''TOTALAMOUNT'',totalamount)  ; ',
    '',
    '   sumoffooteramount +=   totalfooter;',
    '   sumofamount       +=   amount;',
    '   sumoftotalamount  +=   totalamount;',
    '',
    '   alert(sumoffooteramount);',
    '',
    'apex.item(''P175_SUMOFFOOTERAMOUNT'').setValue(sumoffooteramount);',
    'apex.item(''P175_SUMOFAMOUNT'').setValue(sumofamount);',
    'apex.item(''P175_CCINVOICEAMOUNT'').setValue(sumoftotalamount);',
    '    } catch(ex){}',
    '})',
    '',
    '')))).to_clob
);
end;
/
begin
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45086188091077580)
,p_event_id=>wwv_flow_imp.id(45085154587077580)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set amount'
,p_static_id=>'set-amount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'AMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE',
  'plsql_expression', ':quantity1 * :rate',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45085629790077580)
,p_event_id=>wwv_flow_imp.id(45085154587077580)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'set rate'
,p_static_id=>'set-rate'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'RATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE,AMOUNT,WITHOUTDISCOUNTRATE,DISCOUNTPERCENTAGE,DISCOUNTRATE,RATEAFTERDISCOUNT',
  'plsql_expression', ':WITHOUTDISCOUNTRATE - :DISCOUNTRATE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45086642049077581)
,p_event_id=>wwv_flow_imp.id(45085154587077580)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set total amount'
,p_static_id=>'set-total-amount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1,RATE,FOOTERAMOUNT',
  'plsql_expression', '(:quantity1 * :rate) + :FOOTERAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45113800107077588)
,p_name=>'refresh freight rate'
,p_static_id=>'refresh-freight-rate'
,p_event_sequence=>1140
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(44964835266077540)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45115723475077589)
,p_event_id=>wwv_flow_imp.id(45113800107077588)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FREIGHTRATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45114251404077588)
,p_event_id=>wwv_flow_imp.id(45113800107077588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FREIGHTRATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P297_FREIGHTRATE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45114819375077588)
,p_event_id=>wwv_flow_imp.id(45113800107077588)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'update freight advance '
,p_static_id=>'update-freight-advance'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FREIGHTADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_FREIGHTRATE,P175_TOTALQUANTITY',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tfrtadvancepercent number := to_number(getmyparametervalue(''FREIGHTADVANCEPERCENT''));',
    '  tfreightadvance number;',
    '',
    'begin',
    '    tfreightadvance := ((nvl(:P175_FREIGHTRATE,0) * NVL(:P175_TOTALQUANTITY,0)) * tfrtadvancepercent) / 100 ;',
    '    tfreightadvance := floor(tfreightadvance/100) * 100;',
    '    return (tfreightadvance);',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(566229566348256666)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45115277915077588)
,p_event_id=>wwv_flow_imp.id(45113800107077588)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'update freight advance in loading advice'
,p_static_id=>'update-freight-advance-in-loading-advice'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_FREIGHTADVANCE,P175_LOADINGADVICETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    update loadingadvice a',
    '       set a.freightadvance = :P175_FREIGHTADVANCE',
    '    where a.tno = :P175_LOADINGADVICETNO',
    '    ;',
    '    COMMIT;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45091178185077582)
,p_name=>'set advance amount'
,p_static_id=>'set-advance-amount'
,p_event_sequence=>1000
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_SALESORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45091652057077582)
,p_event_id=>wwv_flow_imp.id(45091178185077582)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_SALESORDERTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number := 0;',
    'begin',
    '    select count(*) into tmp from CCINVOICEADJUSTEDADVANCE where tno = :P175_TNO;',
    '    if tmp = 0 then',
    '        delete from CCINVOICEADJUSTEDADVANCE where tno = :P175_TNO;',
    '        insert into CCINVOICEADJUSTEDADVANCE',
    '        (',
    '            TNO,',
    '            SNO,',
    '            VOUCHERTNO,',
    '            VOUCHERSNO,',
    '            ADVANCERECEIPTTNO,',
    '            ADVANCERECEIPTSNO,',
    '            GSTRATE,',
    '            ADJUSTEDADVANCEAMOUNT,',
    '            CGSTRATE,',
    '            SGSTRATE,',
    '            IGSTRATE,',
    '            CGSTAMOUNT,',
    '            SGSTAMOUNT,',
    '            IGSTAMOUNT',
    '        )',
    '        (select :P175_TNO , globaltno.nextval , c.vouchertno , c.vouchersno ,',
    '             a.tno , a.sno , a.GSTRATE , a.AMOUNT , a.CGSTRATE , a.SGSTRATE, a.IGSTRATE, ',
    '             a.CGSTAMOUNT , a.SGSTAMOUNT , a.IGSTAMOUNT ',
    '        from ADVANCERECEIPTDETAIL a , ADVANCERECEIPT b , ADVANCERECEIPTFORADJUSTMENT c',
    '        where a.tno = b.tno',
    '        and a.tno  = c.tno',
    '        and a.sno = c.sno',
    '        and c.BalanceAmount > 0 ',
    '        and getdocumentstatuscode(''ADVANCERECEIPT'',b.tno) = ''ACTIVE''',
    '        and a.REFERENCEMODULETNO = :P175_SALESORDERTNO);',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45092156691077582)
,p_event_id=>wwv_flow_imp.id(45091178185077582)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_ADJUSTEDADVANCEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_TNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select sum(nvl(adjustedadvanceamount,0)) from CCINVOICEADJUSTEDADVANCE ',
    'where tno = :P175_TNO;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45050988146077571)
,p_name=>'Set amount'
,p_static_id=>'set-amount'
,p_event_sequence=>680
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'QUANTITY1,RATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45051511527077572)
,p_event_id=>wwv_flow_imp.id(45050988146077571)
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
  'sql_query', 'select nvl(:quantity1,0)*nvl(:rate,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45097130796077583)
,p_name=>'set amounts'
,p_static_id=>'set-amounts'
,p_event_sequence=>1050
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'QUANTITY1'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'QUANTITY1'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45098169759077584)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1, QUANTITY2, RATE, AMOUNT, TOTALAMOUNT,FOOTERAMOUNT',
  'items_to_submit', 'QUANTITY1,QUANTITY2,RATE,AMOUNT,TOTALAMOUNT,TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,P175_PARTYCODE,P175_TRANSACTIONTYPECODE,P175_FORMSTATUS,P175_HSNCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    '    unit1 varchar2(30);',
    '    unit2 varchar2(30);',
    '    l_uom_decimal  NUMBER;',
    '    tmp    number;',
    '    phsn varchar(30);',
    '-----    set amounts',
    ' ',
    'begin',
    '    ',
    '    l_uom_decimal := nvl(getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)), 3);',
    '    l_uom_decimal := GREATEST(NVL(l_uom_decimal, 3), 3);',
    '    :QUANTITY1 := ROUND(TO_NUMBER(:QUANTITY1), l_uom_decimal);',
    '    select max(MULTIPLYINGFACTOR) into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;      ',
    '    :QUANTITY2 := ROUND(NVL(:QUANTITY1, 0) * NVL(mfactor, 1), l_uom_decimal);',
    '    -- :quantity2 := round(:QUANTITY1*mfactor,3);',
    '    -- :quantity2 := round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '',
    '    :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);',
    '    ',
    '    --:P175_DFAMOUNT    := :Amount ;',
    '    --:P175_DFQUANTITY1 := :Quantity1;',
    '    ',
    '    select trim(hsncode) INTO :P175_HSNCODE from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   ---- INSERT INTO FOOTER DETAIL',
    '    ',
    '    if nvl(:Rate,0) > 0 then',
    '    --raise_application_error(-20000,''100'');',
    '      --RAISE_APPLICATION_ERROR(-20000,''party ''||:P175_PARTYCODE||''tr type ''||:P175_TRANSACTIONTYPECODE||'' hsn ''||:P175_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P175_DFAMOUNT||'' specs''||:itemspecificationcode);',
    '',
    '           DELETE FROM CcinvoiceDetailFooter WHERE TNO = :TNO AND SNO = :SNO;',
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
    '                                    and f.PartyCode = :P175_PARTYCODE',
    '                                    And d.transactiontypecode = :P175_TRANSACTIONTYPECODE',
    '                                    and e.HSNCODE = :P175_HSNCODE',
    '                                    ',
    '            					--order by b.SNo',
    '            				)',
    '            			loop',
    '           -- raise_application_error(-20000,phsn);	',
    '           --if nvl(:rate,0) > 0 then',
    '           --RAISE_APPLICATION_ERROR(-20000,''party ''||:P175_PARTYCODE||''tr type ''||:P175_TRANSACTIONTYPECODE||'' hsn ''||:P175_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P175_DFAMOUNT||'' specs''||:itemspecificationcode||'' footervalue ''||vTaxRul'
||'e.FooterValue);',
    '           --end if;',
    '            			    Insert into CcinvoiceDetailFooter',
    '                            (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '            				values',
    '                            (:TNO,:SNO,globaltno.nextval,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,round(vTaxRule.FooterValue,2),vTaxRule.Slno,vTaxRule.LegendsCode);',
    '            			',
    '            			end loop; -- for vTaxRule',
    '                        commit;',
    '        end if;',
    '',
    '   ----',
    '   SELECT SUM(FOOTERVALUE) INTO :footeramount from CcinvoiceDetailFooter',
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
 p_id=>wwv_flow_imp.id(45101710194077585)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(878940955181035895)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45097695779077584)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
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
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45100180923077585)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set freight advance amount based on myparameter percent '
,p_static_id=>'set-freight-advance-amount-based-on-myparameter-percent'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FREIGHTADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_FREIGHTRATE,P175_TOTALQUANTITY',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tfrtadvancepercent number := to_number(getmyparametervalue(''FREIGHTADVANCEPERCENT''));',
    '  tfreightadvance number;',
    '',
    'begin',
    '    tfreightadvance := ((nvl(:P175_FREIGHTRATE,0) * NVL(:P175_TOTALQUANTITY,0)) * tfrtadvancepercent) / 100 ;',
    '    tfreightadvance := FLOOR(tfreightadvance/100)*100 ;',
    '   -- raise_application_error(-20001,''frt rate ''||nvl(:P175_FREIGHTRATE,0)||'' qty ''||NVL(:P175_TOTALQUANTITY,0)||''per ''||tfrtadvancepercent||''Freight Adv ''||tfreightadvance);',
    '    return (tfreightadvance);',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45101145286077585)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'set round off'
,p_static_id=>'set-round-off'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_ROUNDINGAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_CCINVOICEAMOUNT',
  'plsql_expression', 'round(:P175_CCINVOICEAMOUNT,2) - :P175_CCINVOICEAMOUNT ;',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45099689244077584)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//setTimeout(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    'let quantity1_total = 0;',
    '',
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
    '',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '});',
    '',
    '',
    '$s(''P175_SUMOFAMOUNT'',amount_total);',
    '$s(''P175_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P175_CCINVOICEAMOUNT'',totalamount_total);',
    '$s(''P175_TOTALQUANTITY'',quantity1_total);',
    '',
    '',
    '//},400',
    '//);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45098679027077584)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set tcs amount'
,p_static_id=>'set-tcs-amount'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERAMOUNT,TOTALAMOUNT',
  'items_to_submit', 'TNO,SNO,P175_TNO,P175_SNO,P175_PARTYCODE,FOOTERAMOUNT,AMOUNT,P175_CCINVOICEAMOUNT,P175_FINANCIALYEARCODE,TOTALAMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tTotalBillingforFY number;',
    '  tAmount            Number;',
    '  ttcspercent        number := to_number(GETMYPARAMETERVALUE(''TCSPERCENT''), ''99.999'') ;',
    '  ttcsvalue          Number;',
    '  ttotalamount       Number;',
    '  tapplicablefromfirstbill varchar2(30);',
    'begin',
    '   for vloop in (    select',
    '       	nvl(b.eligiblefortdsunder194q,''NO'') as EligibleFromFirstBill, sum(a.invoiceamount) TransactionAmt',
    '	 into tapplicablefromfirstbill,tTotalBillingforFY',
    '	from  invoice a, party b',
    '	where a.partycode=b.partycode',
    '	  and a.partycode= :P175_PARTYCODE',
    '	  and a.moduletno != :P175_TNO',
    '	  and a.Financialyearcode = :P175_FINANCIALYEARCODE',
    '	  and nvl(b.tdsapplicable,''NO'') = ''YES''',
    '      group by nvl(b.eligiblefortdsunder194q,''NO'')',
    '	 -- AND nvl(b.eligiblefortdsunder194q,''NO'') = ''YES''',
    '     -- 04-NOV-2024',
    '      union all',
    '     select ',
    '     nvl(b.eligiblefortdsunder194q,''NO'') as EligibleFromFirstBill, 0 TransactionAmt',
    '     from party b',
    '     where b.partycode= :P175_PARTYCODE',
    '       and nvl(b.tdsapplicable,''NO'') = ''YES''',
    '',
    '   ) loop',
    '     tapplicablefromfirstbill := vloop.EligibleFromFirstBill;',
    '     tTotalBillingforFY       := vloop.TransactionAmt;',
    '   end loop;',
    '    ',
    '	if nvl(tTotalBillingforFY,0) + nvl(:P175_CCINVOICEAMOUNT,0) >= 5000000 or tapplicablefromfirstbill = ''YES''  then',
    '             ttcsvalue  := nvl(:TOTALAMOUNT,0) * (nvl(ttcspercent,0)/100) ;',
    '           if nvl(ttcsvalue,0) > 0 then',
    '               delete from ccinvoicedetailfooter',
    '               where tno = :TNO',
    '                 and sno = :SNO',
    '                 and footerheadcode = ''.TCS.''',
    '                 ;',
    '               insert into CcinvoiceDetailFooter ( tno,sno,sn,footerheadcode,legendscode,footerpercent,footervalue)',
    '               values ( :P175_TNO,:P175_SNO,globaltno.nextval,''.TCS.'',''PRA'',ttcspercent,ttcsvalue)',
    '               ;',
    '',
    '                  SELECT SUM(FOOTERVALUE) INTO :footeramount from CcinvoiceDetailFooter',
    '                   where tno = :TNO',
    '                     and sno = :SNO;',
    '                   ',
    '                   ttotalamount := nvl(:amount,0) + nvl(:footeramount,0);',
    '           end if;',
    '    else',
    '        ttotalamount := :totalamount ;',
    '	end if;',
    '    :totalamount := ttotalamount ;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45099195522077584)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set totalamount'
,p_static_id=>'set-totalamount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' SELECT SUM(FOOTERAMOUNT) + SUM(AMOUNT) from CcinvoiceDetail',
    '   where tno = :TNO',
    '     and sno = :SNO;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45100710704077585)
,p_event_id=>wwv_flow_imp.id(45097130796077583)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'update  freight advance in loading advice'
,p_static_id=>'update-freight-advance-in-loading-advice'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_LOADINGADVICETNO,P175_FREIGHTADVANCE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    update loadingadvice a',
    '       set a.freightadvance = :P175_FREIGHTADVANCE',
    '    where a.tno = :P175_LOADINGADVICETNO',
    '    ;',
    '    COMMIT;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45102039113077585)
,p_name=>'set amounts_1'
,p_static_id=>'set-amounts-2'
,p_event_sequence=>1060
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'RATE'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'RATE'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45103100616077585)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1,QUANTITY2,RATE,AMOUNT,TOTALAMOUNT,FOOTERAMOUNT',
  'items_to_submit', 'QUANTITY1,QUANTITY2,RATE,AMOUNT,TOTALAMOUNT,TNO,SNO,ITEMCODE,ITEMSPECIFICATIONCODE,P175_PARTYCODE,P175_TRANSACTIONTYPECODE,P175_FORMSTATUS,P175_HSNCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    mfactor number;',
    '    unit1 varchar2(30);',
    '    unit2 varchar2(30);',
    '    tmp    number;',
    '    phsn varchar(30);',
    '-----    set amounts',
    ' ',
    'begin',
    '    :Quantity1 := round(:QUANTITY1 ,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '    select max(MULTIPLYINGFACTOR) into mfactor from ITEMSPECIFICATION where ITEMSPECIFICATIONCODE = :ITEMSPECIFICATIONCODE;      ',
    '    :quantity2 := round(:QUANTITY1*mfactor,3);',
    '    :quantity2 := round(:QUANTITY2,getuomdecimal(GetMeasuringUnitCodeFromItem(:ITEMCODE)) ) ;',
    '',
    '    :AMOUNT := nvl(:RATE,0)*nvl(:QUANTITY1,0);',
    '    ',
    '    --:P175_DFAMOUNT    := :Amount ;',
    '    --:P175_DFQUANTITY1 := :Quantity1;',
    '    ',
    '    select trim(hsncode) INTO :P175_HSNCODE from itemspecification where itemspecificationcode = :itemspecificationcode;',
    '   ---- INSERT INTO FOOTER DETAIL',
    '    ',
    '    if nvl(:Rate,0) > 0 then',
    '    --raise_application_error(-20000,''100'');',
    '      --RAISE_APPLICATION_ERROR(-20000,''party ''||:P175_PARTYCODE||''tr type ''||:P175_TRANSACTIONTYPECODE||'' hsn ''||:P175_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P175_DFAMOUNT||'' specs''||:itemspecificationcode);',
    '',
    '           DELETE FROM CcinvoiceDetailFooter WHERE TNO = :TNO AND SNO = :SNO;',
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
    '                                    and f.PartyCode = :P175_PARTYCODE',
    '                                    And d.transactiontypecode = :P175_TRANSACTIONTYPECODE',
    '                                    and e.HSNCODE = :P175_HSNCODE',
    '                                    ',
    '            					--order by b.SNo',
    '            				)',
    '            			loop',
    '           -- raise_application_error(-20000,phsn);	',
    '           --if nvl(:rate,0) > 0 then',
    '           --RAISE_APPLICATION_ERROR(-20000,''party ''||:P175_PARTYCODE||''tr type ''||:P175_TRANSACTIONTYPECODE||'' hsn ''||:P175_HSNCODE||'' tno ''||:tno||'' sno ''||:sno||'' amount ''||:P175_DFAMOUNT||'' specs''||:itemspecificationcode||'' footervalue ''||vTaxRul'
||'e.FooterValue);',
    '           --end if;',
    '            			    Insert into CcinvoiceDetailFooter',
    '                            (tno,sno,sn,footerheadcode,footerpercent,footervalue,serialno,legendscode)',
    '            				values',
    '                            (:TNO,:SNO,globaltno.nextval,vTaxRule.FooterHeadCode,vTaxRule.FooterPercent,round(vTaxRule.FooterValue,2),vTaxRule.Slno,vTaxRule.LegendsCode);',
    '            			',
    '            			end loop; -- for vTaxRule',
    '                        commit;',
    '        end if;',
    '',
    '   ----',
    '   SELECT SUM(FOOTERVALUE) INTO :footeramount from CcinvoiceDetailFooter',
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
 p_id=>wwv_flow_imp.id(45106573036077586)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>90
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(878940955181035895)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45102581304077585)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY2'
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
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45105611188077586)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_name=>'set freight advance amount based on myparameter percent '
,p_static_id=>'set-freight-advance-amount-based-on-myparameter-percent'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FREIGHTADVANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_FREIGHTRATE,P175_TOTALQUANTITY',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tfrtadvancepercent number := to_number(getmyparametervalue(''FREIGHTADVANCEPERCENT''));',
    '  tfreightadvance number;',
    '',
    'begin',
    '    tfreightadvance := ((nvl(:P175_FREIGHTRATE,0) * NVL(:P175_TOTALQUANTITY,0)) * tfrtadvancepercent) / 100 ;',
    '    tfreightadvance := floor(tfreightadvance/100) * 100;',
    '    return (tfreightadvance);',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45105099006077586)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_name=>'set roundoff'
,p_static_id=>'set-roundoff'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_ROUNDINGAMOUNT,P175_CCINVOICEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_CCINVOICEAMOUNT',
  'sql_query', 'SELECT ROUND(NVL(:P175_CCINVOICEAMOUNT,0) ,2) - NVL(:P175_CCINVOICEAMOUNT,0),ROUND(NVL(:P175_CCINVOICEAMOUNT,0) ,2) FROM DUAL  ',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45104607381077586)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_name=>'set summary'
,p_static_id=>'set-summary'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'setTimeout(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    'let quantity1_total = 0;',
    '',
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
    '',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '});',
    '',
    '',
    '$s(''P175_SUMOFAMOUNT'',amount_total);',
    '$s(''P175_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '$s(''P175_CCINVOICEAMOUNT'',totalamount_total);',
    '$s(''P175_TOTALQUANTITY'',quantity1_total);',
    '',
    '',
    '},400',
    ');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45103590784077586)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_name=>'set tcs amount'
,p_static_id=>'set-tcs-amount'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'FOOTERAMOUNT,TOTALAMOUNT',
  'items_to_submit', 'TNO,SNO,P175_TNO,P175_SNO,P175_PARTYCODE,FOOTERAMOUNT,AMOUNT,P175_CCINVOICEAMOUNT,P175_FINANCIALYEARCODE,TOTALAMOUNT',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tTotalBillingforFY number;',
    '  tAmount            Number;',
    '  ttcspercent        number := to_number(GETMYPARAMETERVALUE(''TCSPERCENT''), ''99.999'') ;',
    '  ttcsvalue          Number;',
    '  ttotalamount       Number;',
    '  tapplicablefromfirstbill varchar2(30);',
    '  ttaxvalue         Number;',
    'begin',
    '   for vloop in (    select',
    '       	nvl(b.eligiblefortdsunder194q,''NO'') as EligibleFromFirstBill, sum(a.invoiceamount) TransactionAmt',
    '	 into tapplicablefromfirstbill,tTotalBillingforFY',
    '	from  invoice a, party b',
    '	where a.partycode=b.partycode',
    '	  and a.partycode= :P175_PARTYCODE',
    '	  and a.moduletno != :P175_TNO',
    '	  and a.Financialyearcode = :P175_FINANCIALYEARCODE',
    '	  and nvl(b.tdsapplicable,''NO'') = ''YES''',
    '      group by nvl(b.eligiblefortdsunder194q,''NO'')',
    '	 -- AND nvl(b.eligiblefortdsunder194q,''NO'') = ''YES''',
    '     --04-NOV-2024',
    '      union all',
    '     select ',
    '     nvl(b.eligiblefortdsunder194q,''NO'') as EligibleFromFirstBill, 0 TransactionAmt',
    '     from party b',
    '     where b.partycode= :P175_PARTYCODE',
    '       and nvl(b.tdsapplicable,''NO'') = ''YES''',
    '',
    '   ) loop',
    '     tapplicablefromfirstbill := vloop.EligibleFromFirstBill;',
    '     tTotalBillingforFY       := vloop.TransactionAmt;',
    '   end loop;',
    '    ',
    '	if nvl(tTotalBillingforFY,0) + nvl(:P175_CCINVOICEAMOUNT,0) >= 5000000 or tapplicablefromfirstbill = ''YES''  then',
    '        select sum(footervalue) into ttaxvalue',
    '              from ccinvoicedetailfooter',
    '              where tno = :tno',
    '                and sno = :sno',
    '                and footerheadcode in (''.CGST.'',''.SGST.'',''.IGST.'');',
    '        ',
    '             ttcsvalue  := (nvl(:AMOUNT,0) + nvl(ttaxvalue,0) ) * (nvl(ttcspercent,0)/100) ;',
    '           if nvl(ttcsvalue,0) > 0 then',
    '               delete from ccinvoicedetailfooter',
    '               where tno = :TNO',
    '                 and sno = :SNO',
    '                 and footerheadcode = ''.TCS.''',
    '                 ;',
    '               insert into CcinvoiceDetailFooter ( tno,sno,sn,footerheadcode,legendscode,footerpercent,footervalue)',
    '               values ( :P175_TNO,:P175_SNO,globaltno.nextval,''.TCS.'',''PRA'',ttcspercent,ttcsvalue)',
    '               ;',
    '',
    '                  SELECT SUM(FOOTERVALUE) INTO :footeramount from CcinvoiceDetailFooter',
    '                   where tno = :TNO',
    '                     and sno = :SNO;',
    '                   ',
    '                   ttotalamount := nvl(:amount,0) + nvl(:footeramount,0);',
    '           end if;',
    '    else',
    '        ttotalamount := :totalamount ;',
    '	end if;',
    '    :totalamount := ttotalamount ;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45104047138077586)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'set totalamount'
,p_static_id=>'set-totalamount'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'TOTALAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'TNO,SNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' SELECT SUM(FOOTERAMOUNT) + SUM(AMOUNT) from CcinvoiceDetail',
    '   where tno = :TNO',
    '     and sno = :SNO;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45106104385077586)
,p_event_id=>wwv_flow_imp.id(45102039113077585)
,p_event_result=>'TRUE'
,p_action_sequence=>80
,p_execute_on_page_init=>'N'
,p_name=>'update  freight advance in loading advice'
,p_static_id=>'update-freight-advance-in-loading-advice'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_LOADINGADVICETNO,P175_FREIGHTADVANCE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    update loadingadvice a',
    '       set a.freightadvance = :P175_FREIGHTADVANCE',
    '    where a.tno = :P175_LOADINGADVICETNO',
    '    ;',
    '    COMMIT;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45118894317077589)
,p_name=>'set amounts on loose focus'
,p_static_id=>'set-amounts-on-loose-focus'
,p_event_sequence=>1180
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45119362778077590)
,p_event_id=>wwv_flow_imp.id(45118894317077589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//setTimeout(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    'let quantity1_total = 0;',
    '',
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
    '',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '});',
    '',
    '',
    '$s(''P175_SUMOFAMOUNT'',amount_total);',
    '$s(''P175_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '// $s(''P175_CCINVOICEAMOUNT'',totalamount_total);',
    '$s(''P175_TOTALQUANTITY'',quantity1_total);',
    '',
    '',
    '//},400',
    '//);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45117949486077589)
,p_name=>'set amounts selection change'
,p_static_id=>'set-amounts-selection-change'
,p_event_sequence=>1170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45118485347077589)
,p_event_id=>wwv_flow_imp.id(45117949486077589)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//setTimeout(function(){',
    'let model = apex.region("Detail").widget().interactiveGrid("getViews", "grid").model; // retrieve the model',
    'let amount_total = 0;',
    'let footeramount_total = 0;',
    'let totalamount_total = 0;',
    'let quantity1_total = 0;',
    '',
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
    '',
    '    if (model.getValue(record, "QUANTITY1") !== "" && !meta.deleted && !meta.agg) {',
    '        quantity1_total += Number(model.getValue(record, "QUANTITY1"));',
    '    }',
    '});',
    '',
    '',
    '$s(''P175_SUMOFAMOUNT'',amount_total);',
    '$s(''P175_SUMOFFOOTERAMOUNT'',footeramount_total);',
    '// $s(''P175_CCINVOICEAMOUNT'',totalamount_total);',
    '$s(''P175_TOTALQUANTITY'',quantity1_total);',
    '',
    '',
    '//},400',
    '//);',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45092578427077582)
,p_name=>'set balance amount'
,p_static_id=>'set-balance-amount'
,p_event_sequence=>1010
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_ADJUSTEDADVANCEAMOUNT,P175_CCINVOICEAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45093091873077582)
,p_event_id=>wwv_flow_imp.id(45092578427077582)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_BALANCEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_ADJUSTEDADVANCEAMOUNT,P175_CCINVOICEAMOUNT',
  'plsql_expression', ':P175_CCINVOICEAMOUNT - :P175_ADJUSTEDADVANCEAMOUNT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45108802226077587)
,p_name=>'set ccinvoice amount'
,p_static_id=>'set-ccinvoice-amount'
,p_event_sequence=>1090
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_ROUNDINGAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45109267488077587)
,p_event_id=>wwv_flow_imp.id(45108802226077587)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_CCINVOICEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_CCINVOICEAMOUNT,P175_ROUNDINGAMOUNT',
  'plsql_expression', 'nvl(:P175_TEMP_CCINVOICEAMOUNT_HIDDEN,0)+nvl(:P175_ROUNDINGAMOUNT,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(44534438493019104)
,p_name=>'Set Condition for FOR(sales)'
,p_static_id=>'set-condition-for-for-sales'
,p_event_sequence=>1260
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_FREIGHTTYPECODE'
,p_condition_element=>'P175_DESPATCHADVICETNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(44534546030019105)
,p_event_id=>wwv_flow_imp.id(44534438493019104)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var freightType = apex.item(''P175_FREIGHTTYPECODE'').getValue();',
    'var freightUnit = apex.item(''P175_FREIGHTUNITCODE'');',
    'var freightRate = apex.item(''P175_FREIGHTRATE'');',
    '',
    'if (freightType === ''FOROUTWARD'') { //changed on 5-5-26 from TOPAYOUTWARD TO FOROUTWARD on request of Pushpak',
    '',
    '    freightUnit.enable();',
    '    freightRate.enable();',
    '    ',
    '    $(freightUnit.node).prop("required", true);',
    '    $(freightRate.node).prop("required", true);',
    '};',
    '// else {',
    '//     freightUnit.disable();',
    '//     freightRate.disable();',
    '    ',
    '//     $(freightUnit.node).prop("required", false);',
    '//     $(freightRate.node).prop("required", false);',
    '// }',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45002085580077557)
,p_name=>'Set Consignee '
,p_static_id=>'set-consignee'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45002559671077558)
,p_event_id=>wwv_flow_imp.id(45002085580077557)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_CONSIGNEECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_PARTYCODE',
  'plsql_expression', ':P175_PARTYCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45014542421077562)
,p_name=>'Set Currency Unit Value'
,p_static_id=>'set-currency-unit-value'
,p_event_sequence=>310
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_CURRENCYUNITCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45015107934077562)
,p_event_id=>wwv_flow_imp.id(45014542421077562)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_CURRENCYVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_CURRENCYUNITCODE',
  'sql_query', 'Select a.currencyvalue From currencyunit a where a.currencyunitcode = :P175_CURRENCYUNITCODE',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45059244594077574)
,p_name=>'Set Detail Spec'
,p_static_id=>'set-detail-spec'
,p_event_sequence=>760
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45059820284077574)
,p_event_id=>wwv_flow_imp.id(45059244594077574)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DETAILITEMCODE,P175_DETAILITEMSPECIFICATIONCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,ITEMCODE',
  'sql_query', 'select :ITEMCODE , :ITEMSPECIFICATIONCODE FROM DUAL ;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45060251606077574)
,p_event_id=>wwv_flow_imp.id(45059244594077574)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'ITEMSPECIFICATIONNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select B.ITEMSPECIFICATIONNAME',
    'from  itemspecification b',
    'where B.ITEMSPECIFICATIONCODE=:ITEMSPECIFICATIONCODE;')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45060644664077574)
,p_name=>'set detailqty1'
,p_static_id=>'set-detailqty'
,p_event_sequence=>770
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45061218805077574)
,p_event_id=>wwv_flow_imp.id(45060644664077574)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DETAILQTY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY1',
  'sql_query', 'select nvl(:QUANTITY1,0) from dual ',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45021892935077564)
,p_name=>'Set DF Amount Temp'
,p_static_id=>'set-df-amount-temp'
,p_event_sequence=>460
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45022370672077564)
,p_event_id=>wwv_flow_imp.id(45021892935077564)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DFAMOUNT_TEMP'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DFAMOUNT',
  'sql_query', 'select nvl(:P175_DFAMOUNT,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45051867523077572)
,p_name=>'Set DFAMOUNT'
,p_static_id=>'set-dfamount'
,p_event_sequence=>690
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45052414105077572)
,p_event_id=>wwv_flow_imp.id(45051867523077572)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DFAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'AMOUNT',
  'sql_query', 'select :AMOUNT from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45063388716077575)
,p_name=>'Set freight type'
,p_static_id=>'set-freight-type'
,p_event_sequence=>810
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_SALESORDERTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45063822461077575)
,p_event_id=>wwv_flow_imp.id(45063388716077575)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FREIGHTTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_SALESORDERTNO',
  'sql_query', 'select freighttypecode from salesorder where tno = :P175_SALESORDERTNO',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45018153893077563)
,p_name=>'Set include with tax amount'
,p_static_id=>'set-include-with-tax-amount'
,p_event_sequence=>430
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45018710140077563)
,p_event_id=>wwv_flow_imp.id(45018153893077563)
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
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45107836044077587)
,p_name=>'Set Item and Specification to page item'
,p_static_id=>'set-item-and-specification-to-page-item'
,p_event_sequence=>1080
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'DESCRIPTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45108370389077587)
,p_event_id=>wwv_flow_imp.id(45107836044077587)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_DETAILITEMCODE,P175_DETAILITEMSPECIFICATIONCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMSPECIFICATIONCODE,ITEMCODE',
  'sql_query', 'select :ITEMCODE , :ITEMSPECIFICATIONCODE FROM DUAL ;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45043369459077569)
,p_name=>'Set Other Detail'
,p_static_id=>'set-other-detail'
,p_event_sequence=>640
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45043865984077569)
,p_event_id=>wwv_flow_imp.id(45043369459077569)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_TRANSPORTERCODE,P175_VEHICLENO,P175_VEHICLETYPECODE,P175_DRIVERNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ISSUEDTOPARTYCODE , VEHICLENO ,',
    'vehicletype , drivername',
    'from loadingadvice where tno = :P175_LOADINGADVICETNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45044345624077569)
,p_event_id=>wwv_flow_imp.id(45043369459077569)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_FREIGHTTYPECODE,P175_FREIGHTUNITCODE,P175_FREIGHTRATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select  FREIGHTTYPECODE , FREIGHTUNITCODE , FREIGHTRATE ',
    'from loadingadvice where tno = :P175_LOADINGADVICETNO',
    'and freightchargedat = ''OUTBOUND''')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45040691157077569)
,p_name=>'Set page item sno_1'
,p_static_id=>'set-page-item-sno'
,p_event_sequence=>610
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45041130076077569)
,p_event_id=>wwv_flow_imp.id(45040691157077569)
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
    'apex.item( "P175_SNO" ).setValue (pSNO);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45050106497077571)
,p_name=>'Set Quantity2'
,p_static_id=>'set-quantity'
,p_event_sequence=>670
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45050582169077571)
,p_event_id=>wwv_flow_imp.id(45050106497077571)
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
    '    return :QUANTITY1*mfactor;',
    'exception when others then',
    '    null;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45062457046077574)
,p_name=>'Set Quantity1'
,p_static_id=>'set-quantity-2'
,p_event_sequence=>800
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'QUANTITY2'
,p_condition_element_type=>'COLUMN'
,p_condition_element=>'QUANTITY2'
,p_triggering_condition_type=>'GREATER_THAN'
,p_triggering_expression=>'0'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45062984591077574)
,p_event_id=>wwv_flow_imp.id(45062457046077574)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'QUANTITY2,ITEMSPECIFICATIONCODE,MEASURINGUNITNAME2',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select',
    '  NVL(:QUANTITY2,0) / NVL(A.MULTIPLYINGFACTOR,0) ',
    'from itemspecification a',
    'where a.itemspecificationcode = :ITEMSPECIFICATIONCODE',
    '  and NVL(:QUANTITY2 ,0) > 0',
    '  and :MEASURINGUNITNAME2 IS NOT NULL ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45117114635077589)
,p_name=>'set rate measuring unit'
,p_static_id=>'set-rate-measuring-unit'
,p_event_sequence=>1160
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'ITEMSPECIFICATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45117527920077589)
,p_event_id=>wwv_flow_imp.id(45117114635077589)
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
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select measuringunitcode1 from item ',
    'where itemcode = :itemcode')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45124543176077591)
,p_name=>'set roundoff'
,p_static_id=>'set-roundoff'
,p_event_sequence=>1210
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'TOTALAMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45125041534077591)
,p_event_id=>wwv_flow_imp.id(45124543176077591)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_ROUNDINGAMOUNT,P175_CCINVOICEAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_CCINVOICEAMOUNT',
  'sql_query', 'SELECT ROUND(NVL(:P175_CCINVOICEAMOUNT,0) ,2) - NVL(:P175_CCINVOICEAMOUNT,0),ROUND(NVL(:P175_CCINVOICEAMOUNT,0) ,2) FROM DUAL  ',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45042521721077569)
,p_name=>'set salesordertno'
,p_static_id=>'set-salesordertno'
,p_event_sequence=>630
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45042929992077569)
,p_event_id=>wwv_flow_imp.id(45042521721077569)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_SALESORDERTNO,P175_AGENTCODE,P175_CONSIGNEECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_LOADINGADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select salesordertno , b.agentcode,b.consigneecode  from loadingadvice a, salesorder b',
    ' where a.salesordertno = b.tno',
    '   and a.tno = :P175_LOADINGADVICETNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45004855821077559)
,p_name=>'Set Serial No for Detail'
,p_static_id=>'set-serial-no-for-detail'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_triggering_element=>'FOOTERHEADCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45005370785077559)
,p_event_id=>wwv_flow_imp.id(45004855821077559)
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
 p_id=>wwv_flow_imp.id(45074804844077578)
,p_name=>'Set SNO'
,p_static_id=>'set-sno'
,p_event_sequence=>900
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(507080149136152917)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|apexbeginrecordedit'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45075279085077578)
,p_event_id=>wwv_flow_imp.id(45074804844077578)
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
    '    Select to_char(GlobalTNo.nextval) into mysno from dual;',
    'else MYSNO := :SNO;',
    'end if;',
    'return mysno;',
    'end;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45056864656077573)
,p_name=>'set SNO, item & specification, QTY'
,p_static_id=>'set-sno-item-specification-qty'
,p_event_sequence=>750
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45058326715077573)
,p_event_id=>wwv_flow_imp.id(45056864656077573)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P175_DETAILITEMCODE,P175_DETAILITEMSPECIFICATIONCODE,P175_DETAILQTY1',
  'items_to_submit', 'ITEMCODE,ITEMSPECIFICATIONCODE,QUANTITY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT :ITEMCODE, :ITEMSPECIFICATIONCODE, :QUANTITY1',
    ' INTO  :P175_DETAILITEMCODE, :P175_DETAILITEMSPECIFICATIONCODE, :P175_DETAILQTY1',
    'FROM DUAL;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_build_option_id=>wwv_flow_imp.id(566229566348256666)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45057352242077573)
,p_event_id=>wwv_flow_imp.id(45056864656077573)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pSno,',
    'model = this.data.model;',
    '',
    'pSNO = model.getValue( this.data.selectedRecords[0], "ITEMCODE");',
    '',
    'apex.item( "P175_DETAILITEMCODE" ).setValue (pSNO);')))).to_clob
,p_build_option_id=>wwv_flow_imp.id(566229566348256666)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45057872065077573)
,p_event_id=>wwv_flow_imp.id(45056864656077573)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var v_itemCode, v_itemSpecificationCode, v_Qty1, $model = this.data.model;',
    '',
    'v_itemCode = $model.getValue( this.data.selectedRecords[0], "ITEMCODE");',
    'v_itemSpecificationCode = $model.getValue( this.data.selectedRecords[0], "ITEMSPECIFICATIONCODE");',
    'v_Qty1 = $model.getValue( this.data.selectedRecords[0], "QUANTITY1");',
    '',
    '',
    'apex.item("P175_DETAILITEMCODE").setValue (v_itemCode);',
    'apex.item("P175_DETAILITEMSPECIFICATIONCODE").setValue (v_itemSpecificationCode);',
    'apex.item("P175_DETAILQTY1").setValue (v_Qty1);')))).to_clob
,p_build_option_id=>wwv_flow_imp.id(566229566348256666)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45058894333077574)
,p_event_id=>wwv_flow_imp.id(45056864656077573)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-3'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var v_sno, v_itemCode, v_itemSpecificationCode, v_Qty1, $model = this.data.model;',
    '',
    'v_sno = $model.getValue( this.data.selectedRecords[0], "SNO");',
    'v_itemCode = $model.getValue( this.data.selectedRecords[0], "ITEMCODE");',
    'v_itemSpecificationCode = $model.getValue( this.data.selectedRecords[0], "ITEMSPECIFICATIONCODE");',
    'v_Qty1 = $model.getValue( this.data.selectedRecords[0], "QUANTITY1");',
    '',
    'apex.item("P175_SNO").setValue(v_sno);',
    'apex.item("P175_DETAILITEMCODE").setValue(v_itemCode);',
    'apex.item("P175_DETAILITEMSPECIFICATIONCODE").setValue(v_itemSpecificationCode);',
    'apex.item("P175_DETAILQTY1").setValue(v_Qty1);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45034277651077567)
,p_name=>'set SO & Consignee & Agent'
,p_static_id=>'set-so-consignee-agent'
,p_event_sequence=>550
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_DESPATCHADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45034761916077567)
,p_event_id=>wwv_flow_imp.id(45034277651077567)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_SALESORDERTNO,P175_CONSIGNEECODE,P175_AGENTCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DESPATCHADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    '   b.tno,b.consigneecode,b.agentcode',
    'from Despatchadvice a, SalesOrder b',
    'where a.referencetno = b.tno',
    '  and a.tno = :P175_DESPATCHADVICETNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45035201494077567)
,p_name=>'set SO & Consignee & Agent_1'
,p_static_id=>'set-so-consignee-agent-2'
,p_event_sequence=>560
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45035628032077567)
,p_event_id=>wwv_flow_imp.id(45035201494077567)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_SALESORDERTNO,P175_CONSIGNEECODE,P175_AGENTCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DESPATCHADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select ',
    '   b.tno,b.consigneecode,b.agentcode',
    'from Despatchadvice a, SalesOrder b',
    'where a.referencetno = b.tno',
    '  and a.tno = :P175_DESPATCHADVICETNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45107016703077586)
,p_name=>'set stktno'
,p_static_id=>'set-stktno'
,p_event_sequence=>1070
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(853779799753102156)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45107513766077587)
,p_event_id=>wwv_flow_imp.id(45107016703077586)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var pStockTno, $model = this.data.model;',
    '',
    'pStockTno = $model.getValue( this.data.selectedRecords[0], "STOCKTNO");',
    '',
    'apex.item( "P175_STKTNO" ).setValue(pStockTno);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45041585697077569)
,p_name=>'SET sTORAGE LOC'
,p_static_id=>'set-storage-loc'
,p_event_sequence=>620
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(853779799753102156)
,p_triggering_element=>'STORAGELOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45042095710077569)
,p_event_id=>wwv_flow_imp.id(45041585697077569)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_STORAGELOCATIONCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'STORAGELOCATIONCODE',
  'plsql_expression', ':STORAGELOCATIONCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45055931564077573)
,p_name=>'Set StorageLocationCode and StockTNo to Page items'
,p_static_id=>'set-storagelocationcode-and-stocktno-to-page-items'
,p_event_sequence=>740
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(853779799753102156)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|interactivegridselectionchange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45056518167077573)
,p_event_id=>wwv_flow_imp.id(45055931564077573)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var v_storageLocationCode, pStockTno, $model = this.data.model;',
    '',
    'v_storageLocationCode   = $model.getValue( this.data.selectedRecords[0], "STORAGELOCATIONCODE");',
    'pStockTno               = $model.getValue( this.data.selectedRecords[0], "STOCKTNO");',
    '',
    'apex.item("P175_STORAGELOCATIONCODE").setValue(v_storageLocationCode);',
    'apex.item( "P175_STKTNO" ).setValue(pStockTno);',
    '',
    '',
    '',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(52667013458987203)
,p_name=>'Set the Stock Qty for Out to Out Case'
,p_static_id=>'set-the-stock-qty-for-out-to-out-case'
,p_event_sequence=>1280
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(52667106438987204)
,p_event_id=>wwv_flow_imp.id(52667013458987203)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'Direct Insert Method'
,p_static_id=>'direct-insert-method'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_TNO,P175_SNO,P175_LOCATIONCODE,P175_LOADINGADVICETNO,QUANTITY1, ITEMCODE, ITEMSPECIFICATIONCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '    v_required_qty NUMBER := NVL(:QUANTITY1, 0);',
    '    v_total_stock  NUMBER := 0;',
    '',
    '    CURSOR c_stock_qty IS ',
    '        SELECT ',
    '               S.TNO AS STOCKTNO,',
    '               ROUND((NVL(S.STOCKQUANTITY1, 0) - NVL(U.USED_QTY, 0)), 3) AS AVAILABLE_QTY,',
    '               S.STORAGELOCATIONCODE,',
    '               ''AUTO ALLOCATED FOR OTO CASE'' AS REMARK',
    '        FROM STOCK S',
    '        LEFT JOIN (',
    '            SELECT STOCKTNO, SUM(USEDSTOCKQUANTITY1) AS USED_QTY ',
    '            FROM USEDSTOCK ',
    '            GROUP BY STOCKTNO',
    '        ) U ON S.TNO = U.STOCKTNO',
    '        INNER JOIN GRN g ON g.TNO = s.GRNTNO ',
    '        WHERE S.ITEMCODE                = :ITEMCODE',
    '          AND S.ITEMSPECIFICATIONCODE   = :ITEMSPECIFICATIONCODE ',
    '          AND S.COMPANYCODE             = :GLOBAL_COMPANYCODE',
    '          AND S.LOCATIONCODE            = :P175_LOCATIONCODE',
    '          AND g.LOADINGADVICETNO        = :P175_LOADINGADVICETNO',
    '          AND (NVL(S.STOCKQUANTITY1, 0) - NVL(U.USED_QTY, 0)) > 0',
    '        ORDER BY S.STOCKDATE ASC, S.TNO ASC;',
    '    ',
    '    TYPE t_stock_list IS TABLE OF c_stock_qty%ROWTYPE INDEX BY PLS_INTEGER;',
    '    v_stocks t_stock_list;',
    '',
    'BEGIN',
    '    IF :P175_LOADINGADVICETNO IS NOT NULL AND v_required_qty > 0 THEN',
    '        ',
    '        -- First Delete the Old Data for that Row',
    '        Delete From CCINVOICESTOCKSTORAGEDETAIL Where TNo = :P175_TNO and SNO = :P175_SNO;',
    '',
    '        -- 1. Fetch data ONCE into collection memory',
    '        OPEN c_stock_qty;',
    '        FETCH c_stock_qty BULK COLLECT INTO v_stocks;',
    '        CLOSE c_stock_qty;',
    '',
    '        FOR i IN 1..v_stocks.COUNT LOOP',
    '            v_total_stock := v_total_stock + v_stocks(i).available_qty;',
    '        END LOOP;',
    '',
    '        -- 2. Validate shortfall instantly before processing ',
    '        IF v_total_stock < v_required_qty THEN',
    '            RAISE_APPLICATION_ERROR(-20002, ''Insufficient stock available. Required: '' || v_required_qty || '', Available: '' || v_total_stock);',
    '        END IF;',
    '',
    '        -- 3. Execute FIFO stock allocation from memory',
    '        BEGIN',
    '            FOR i IN 1..v_stocks.COUNT LOOP',
    '                EXIT WHEN v_required_qty <= 0;',
    '                ',
    '                DECLARE',
    '                    v_issue_qty NUMBER := LEAST(v_required_qty, v_stocks(i).available_qty);',
    '                BEGIN',
    '                    INSERT INTO CCINVOICESTOCKSTORAGEDETAIL (',
    '                        TNO, SNO, SN, STOCKTNO, QUANTITY1, STORAGELOCATIONCODE, REMARK',
    '                    ) VALUES (',
    '                        :P175_TNO, :P175_SNO, GlobalTNo.NEXTVAL, v_stocks(i).STOCKTNO, v_issue_qty, v_stocks(i).STORAGELOCATIONCODE, v_stocks(i).REMARK',
    '                    );',
    '                    ',
    '                    v_required_qty := v_required_qty - v_issue_qty;',
    '                END;',
    '            END LOOP;',
    '            ',
    '            COMMIT;',
    '',
    '        EXCEPTION',
    '            WHEN OTHERS THEN',
    '                ROLLBACK; ',
    '                RAISE_APPLICATION_ERROR(-20001, ''Error during OTO auto-insert: '' || SQLERRM);',
    '        END;',
    '',
    '    END IF;',
    'END;',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(52667570696987209)
,p_event_id=>wwv_flow_imp.id(52667013458987203)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Grid Insert Method'
,p_static_id=>'grid-insert-method'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var r = apex.region(''Detail'');',
    'if (r) {',
    '    var g = r.call(''getViews'', ''grid''),',
    '        m = g.model,',
    '        s = r.call(''getSelectedRecords'');',
    '    if (s && s.length > 0) {',
    '        var r0 = s[0],',
    '            sno = m.getValue(r0, "SNO"),',
    '            qty = m.getValue(r0, "QUANTITY1"),',
    '            itm = m.getValue(r0, "ITEMCODE"),',
    '            spc = m.getValue(r0, "ITEMSPECIFICATIONCODE"),',
    '            iv = (itm && typeof itm === ''object'') ? itm.v : itm,',
    '            sv = (spc && typeof spc === ''object'') ? spc.v : spc;',
    '        apex.server.process("FETCH_DATA_FOR_STOCK_GRID_FOR_OTO", {',
    '            pageItems: "#P175_TNO,#P175_LOCATIONCODE,#P175_LOADINGADVICETNO",',
    '            x01: sno,',
    '            x02: qty,',
    '            x03: iv,',
    '            x04: sv',
    '        }, {',
    '            success: function(d) {',
    '                console.log("Response:", d);',
    '                if (d.status === ''ERROR'') {',
    '                    apex.message.showErrors([{',
    '                        type: "error",',
    '                        location: "page",',
    '                        message: d.message',
    '                    }]);',
    '                    return;',
    '                }',
    '                var tr = apex.region(''Stock_Detail'');',
    '                if (!tr) return;',
    '                var tg = tr.call(''getViews'', ''grid''),',
    '                    tm = tg.model,',
    '                    ig = tr.widget(),',
    '                    act = ig.interactiveGrid("getActions");',
    '                act.enable("selection-add-row");',
    '                act.enable("row-add-row");',
    '                act.enable("row-duplicate");',
    '                var recs = [];',
    '                tm.forEach(function(x) {',
    '                    recs.push(x);',
    '                });',
    '                if (recs.length > 0) {',
    '                    tm.deleteRecords(recs);',
    '                }',
    '',
    '                function cln(v) {',
    '                    return (v === undefined || v === null) ? "" : String(v);',
    '                }',
    '                if (d.stockQty && d.stockQty.length > 0) {',
    '                    d.stockQty.forEach(function(q) {',
    '                        var nid = tm.insertNewRecord(),',
    '                            nr = tm.getRecord(nid);',
    '                        tm.setValue(nr, ''TNO'', cln(q.TNO));',
    '                        tm.setValue(nr, ''SNO'', cln(q.SNO));',
    '                        tm.setValue(nr, ''SN'', cln(q.SN));',
    '                        if (q.STORAGELOCATIONCODE) {',
    '                            tm.setValue(nr, ''STORAGELOCATIONCODE'', {',
    '                                d: cln(q.STORAGELOCATIONNAME),',
    '                                v: cln(q.STORAGELOCATIONCODE)',
    '                            });',
    '                        } else {',
    '                            tm.setValue(nr, ''STORAGELOCATIONCODE'', null);',
    '                        }',
    '                        if (q.STOCKTNO) {',
    '                            tm.setValue(nr, ''STOCKTNO'', {',
    '                                d: cln(q.TRANSACTIONNO),',
    '                                v: cln(q.STOCKTNO)',
    '                            });',
    '                        } else {',
    '                            tm.setValue(nr, ''STOCKTNO'', null);',
    '                        }',
    '                        tm.setValue(nr, ''QUANTITY1'', cln(q.QUANTITY1));',
    '                        tm.setValue(nr, ''REMARK'', cln(q.REMARK));',
    '                    });',
    '                }',
    '                act.disable("selection-add-row");',
    '                act.disable("row-add-row");',
    '                act.disable("row-duplicate");',
    '            }',
    '        });',
    '    }',
    '}')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(52667633827987210)
,p_event_id=>wwv_flow_imp.id(52667013458987203)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(853779799753102156)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45052819608077572)
,p_name=>'Set total amount'
,p_static_id=>'set-total-amount'
,p_event_sequence=>700
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(499336145146944843)
,p_triggering_element=>'AMOUNT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45053313558077572)
,p_event_id=>wwv_flow_imp.id(45052819608077572)
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
  'sql_query', 'select nvl(:AMOUNT,0) + nvl(:FOOTERAMOUNT,0) , nvl(:FOOTERAMOUNT,0) from dual',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45036077710077567)
,p_name=>'set transportation detail'
,p_static_id=>'set-transportation-detail'
,p_event_sequence=>570
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_DESPATCHADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45036534991077568)
,p_event_id=>wwv_flow_imp.id(45036077710077567)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_TRANSPORTERCODE,P175_VEHICLETYPECODE,P175_VEHICLENO,P175_DRIVERNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DESPATCHADVICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select ',
    'a.transportercode,',
    'a.vehicletypecode,',
    'a.vehicleno,',
    'a.DRIVERNAME',
    'From despatchadvice a',
    'Where a.tno = :P175_DESPATCHADVICETNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45008119681077560)
,p_name=>'Set Value- Final value of Detail footer on Loose Focus'
,p_static_id=>'set-value-final-value-of-detail-footer-on-loose-focus'
,p_event_sequence=>170
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45008620897077560)
,p_event_id=>wwv_flow_imp.id(45008119681077560)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
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
    'apex.item("P175_FVALUE").setValue(n_totamt);')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45110621125077587)
,p_name=>'set value for stock required'
,p_static_id=>'set-value-for-stock-required'
,p_event_sequence=>1110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_LOADINGADVICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45111076018077587)
,p_event_id=>wwv_flow_imp.id(45110621125077587)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_STOCKREQUIRED'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_LOADINGADVICETNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'rtvalue varchar2(30);',
    'begin',
    'if :P175_LOADINGADVICETNO is not null then',
    '    for vloop in (',
    '    Select  *',
    '     From loadingadvice a ',
    '    Where A.TNO = :P175_LOADINGADVICETNO',
    '      and (a.ispartylocation=''YES''              -- Change it to ''YES'' from ''No'' to enable to stock allocation for Out to Out Cases  -- Changed by Vibhor',
    '      OR getmyparametervalue(''STOCKREQUIREDFOROUTWARD'')=''YES'')',
    '    ) loop',
    '        rtvalue := ''YES'';',
    '    end loop;',
    'else',
    '    rtvalue := ''YES'';',
    'end if;',
    'return(nvl(rtvalue,''NO''));',
    'end;',
    '')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45111465728077588)
,p_name=>'set value for stock required during page load'
,p_static_id=>'set-value-for-stock-required-during-page-load'
,p_event_sequence=>1120
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45111941982077588)
,p_event_id=>wwv_flow_imp.id(45111465728077588)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_STOCKREQUIRED'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_LOADINGADVICETNO',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'rtvalue varchar2(30);',
    'begin',
    'if :P175_LOADINGADVICETNO is not null then',
    '    for vloop in (',
    '    Select  *',
    '     From loadingadvice a ',
    '    Where A.TNO = :P175_LOADINGADVICETNO',
    '      and (a.ispartylocation=''YES''              -- Change it to ''YES'' from ''No'' to enable to stock allocation for Out to Out Cases  -- Changed by Vibhor',
    '      OR getmyparametervalue(''STOCKREQUIREDFOROUTWARD'')=''YES'')',
    '    ) loop',
    '        rtvalue := ''YES'';',
    '    end loop;',
    'else',
    '    rtvalue := ''YES'';',
    'end if;',
    'return(nvl(rtvalue,''NO''));',
    'end;',
    '')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45016351323077562)
,p_name=>'SetQuantity'
,p_static_id=>'setquantity'
,p_event_sequence=>330
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(853779799753102156)
,p_triggering_element=>'STORAGELOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45016881680077562)
,p_event_id=>wwv_flow_imp.id(45016351323077562)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_QUANTITYTOALLOCATE',
  'sql_query', 'select :P175_QUANTITYTOALLOCATE FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45020979155077563)
,p_name=>'SetSum of Footer Amount'
,p_static_id=>'setsum-of-footer-amount'
,p_event_sequence=>450
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_FVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45021438763077564)
,p_event_id=>wwv_flow_imp.id(45020979155077563)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_SUMOFFOOTERAMOUNT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_FVALUE',
  'sql_query', 'select :P175_FVALUE FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45015478740077562)
,p_name=>'SetTransactionType'
,p_static_id=>'settransactiontype'
,p_event_sequence=>320
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_PARTYCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45016020526077562)
,p_event_id=>wwv_flow_imp.id(45015478740077562)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_TRANSACTIONTYPECODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_PARTYCODE,P175_LOCATIONCODE,P175_COMPANYCODE,P175_DOCTYPECODE,P175_CCINVOICEDATE',
  'sql_query', 'select GetTransactionTypeCodeFor(:P175_PARTYCODE,:P175_LOCATIONCODE,:P175_DOCTYPECODE,:P175_COMPANYCODE, :P175_CCINVOICEDATE) from dual ',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45088446648077581)
,p_name=>'skip focus'
,p_static_id=>'skip-focus'
,p_event_sequence=>970
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_CCINVOICEDATE'
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
 p_id=>wwv_flow_imp.id(45089016238077581)
,p_event_id=>wwv_flow_imp.id(45088446648077581)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-focus'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P175_EMPLOYEECODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45096286267077583)
,p_name=>'update database in value'
,p_static_id=>'update-database-in-value'
,p_event_sequence=>1040
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(878940955181035895)
,p_triggering_element=>'LEGENDSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45096816311077583)
,p_event_id=>wwv_flow_imp.id(45096286267077583)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'update ccinvoicedetailfooter a',
    'set a.footervalue = :FOOTERVALUE',
    'WHERE TNO = :175_TNO',
    '  AND SNO = :SNO',
    '  AND FOOTERHEADCODE = :FOOTERHEADCODE;',
    '  ')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45077031281077578)
,p_name=>'update freight advance in loading advice'
,p_static_id=>'update-freight-advance-in-loading-advice'
,p_event_sequence=>920
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P175_FREIGHTADVANCE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45077526902077578)
,p_event_id=>wwv_flow_imp.id(45077031281077578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P175_FREIGHTADVANCE,P175_LOADINGADVICETNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    'update loadingadvice a set a.freightadvance = :P175_FREIGHTADVANCE WHERE TNO = :P175_LOADINGADVICETNO;',
    'commit;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45075682138077578)
,p_name=>'validate stock'
,p_static_id=>'validate-stock'
,p_event_sequence=>910
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(853779799753102156)
,p_triggering_element=>'STOCKTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45076682931077578)
,p_event_id=>wwv_flow_imp.id(45075682138077578)
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
 p_id=>wwv_flow_imp.id(45076222127077578)
,p_event_id=>wwv_flow_imp.id(45075682138077578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'COLUMN'
,p_affected_elements=>'QUANTITY1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P175_DETAILQTY1,P175_STOCKQTY1',
  'plsql_expression', 'nvl(:P175_DETAILQTY1,0)-nvl(:P175_STOCKQTY1,0)',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(45077959561077578)
,p_name=>'validate stock'
,p_static_id=>'validate-stock-2'
,p_event_sequence=>930
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(853779799753102156)
,p_triggering_element=>'QUANTITY1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45078440370077579)
,p_event_id=>wwv_flow_imp.id(45077959561077578)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'QUANTITY1,STOCKTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  stockqty  number;',
    '  allocateqty number;',
    'begin',
    '    allocateqty := nvl(:quantity1,0);',
    '     select sum(stockquantity1) - sum(nvl(usedstockquantity1,0)) into stockqty ',
    '     from stock where tno = :STOCKTNO;',
    '',
    '     if nvl(stockqty,0) > allocateqty then',
    '          :QUANTITY1 := allocateqty ;',
    '     else',
    '          :quantity1 := stockqty ;',
    '          --raise_application_error ( -20000,'' Stock Quantity is Less Than Allocated Quantity'');',
    '     end if;',
    'end;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45079939804077579)
,p_event_id=>wwv_flow_imp.id(45077959561077578)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'QUANTITY1',
  'items_to_submit', 'P175_STOCKQTY1,P175_INPUTQUANTITY,QUANTITY1',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if :P175_STOCKQTY1>:P175_INPUTQUANTITY then  ',
    '    raise_application_error(-20000,''Detail Quantity not matching with entered quantity.'');',
    '    :QUANTITY1 := 0;',
    'end if;')),
  'show_processing', 'Y',
  'suppress_change_event', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45079503470077579)
,p_event_id=>wwv_flow_imp.id(45077959561077578)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("Stock_Detail").widget().interactiveGrid("getViews", "grid").model;',
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
    '$s("P175_STOCKQTY1", totalAmt.toFixed(3));',
    '',
    '	')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(45079000017077579)
,p_event_id=>wwv_flow_imp.id(45077959561077578)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44989612154077550)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(498408659754989526)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Advancereceipt - Save Interactive Grid Data'
,p_static_id=>'advancereceipt-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35064089837550984
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44999626263077556)
,p_process_sequence=>160
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Calculate Footer'
,p_static_id=>'calculate-footer'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*declare',
'    tTotalDetailAmount number;',
'    tTotalAmount       number;',
'begin',
'    for vCCInvoiceDetail in',
'        (',
'        Select',
'            sum(a.Amount) as TotalAmount',
'        From CCInvoiceDetail a',
'        Where a.Tno = :P175_Tno',
'        )',
'    loop',
'        tTotalDetailAmount := vCCInvoiceDetail.TotalAmount;',
'    end loop;',
'    update ccinvoice set sumofamount = tTotalDetailAmount',
'    where tno = :P175_TNO;',
'    ----',
'    if nvl(:P175_ITEMWISEFOOTER, ''NO'') = ''YES'' then',
'        delete from CCInvoiceFooter a',
'        where a.TNO = :P175_TNO',
'        ;',
'        insert into CCInvoiceFooter',
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
'        From CCInvoiceDetailFooter a, FooterSchemeList b',
'        Where a.FooterHeadCode = b.FooterHeadCode',
'        	and b.CompanyCode = :global_CompanyCode',
'        	and b.FinancialYearCode = :global_FinancialYearCode',
'        	and b.ModuleCode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'        	and a.TNo = :P175_TNo',
'        Group by a.TNO, b.SNO, a.FooterHeadCode,a.serialno',
'        ;',
'',
'        UPDATE CCINVOICE X SET X.SUMOFFOOTERAMOUNT = ( SELECT SUM(FOOTERVALUE) FROM CCINVOICEDETAILFOOTER WHERE TNO = :P175_TNO) ',
'        WHERE X.TNO = :P175_TNO',
'        ;',
'    else',
'        Delete From CCInvoiceDetailFooter a Where a.Tno = :P175_Tno;',
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
'    		Update CCInvoiceFooter a',
'            Set a.SerialNo = vFooter.SerialNo',
'            Where a.FooterHeadCode = vFooter.FooterHeadCode',
'            and a.Tno = :P175_Tno',
'            ;',
'    	end loop;',
'        ----',
'        if nvl(tTotalDetailAmount, 0) > 0 then',
'            insert into CCInvoiceDetailFooter',
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
'            From CCInvoiceDetail a, CCInvoiceFooter b',
'            Where a.TNo = b.TNo',
'                and a.TNo = :P175_TNo',
'            ;',
'        end if;',
'    end if;',
'    --------------------',
'    for vCCInvoiceDetail in',
'    	(',
'    	Select',
'    		a.Tno,',
'    		a.Sno,',
'    		a.Amount,',
'    		a.FooterAmount,',
'    		a.TotalAmount',
'    	From CCInvoiceDetail a',
'    	Where a.Tno = :P175_Tno',
'    	)',
'    loop',
'    	declare',
'    		cursor cFooter is',
'    			select',
'    				round(sum(a.Amount * b.FooterValue / tTotalDetailAmount), 2) as Footeramount',
'    			from CCInvoiceDetail a, CCInvoiceFooter b',
'    			where a.TNo = b.TNo',
'    				and a.TNo = vCCInvoiceDetail.TNo',
'    				and a.SNo = vCCInvoiceDetail.SNo',
'    		;',
'    		vFooter cFooter%rowtype;',
'    	begin',
'    		open cFooter;',
'    		fetch cFooter into vFooter;',
'    		if cFooter%FOUND then',
'',
'                --raise_application_error(-20000, vFooter.FooterAmount);',
'',
'    			Update CCInvoiceDetail a',
'    				Set a.FooterAmount = vFooter.FooterAmount,',
'    				a.Totalamount = vCCInvoiceDetail.Amount + NVL(vFooter.FooterAmount, 0)',
'    			where a.tno = vCCInvoiceDetail.Tno',
'    				and a.sno = vCCInvoiceDetail.Sno',
'    			;',
'    		else',
'    			Update CCInvoiceDetail a',
'    				Set a.FooterAmount = null,',
'    				a.Totalamount = vCCInvoiceDetail.amount ',
'    			where a.tno = vCCInvoiceDetail.Tno',
'    				and a.sno = vCCInvoiceDetail.Sno',
'    			;',
'    		end if;',
'    		close cFooter;',
'    	end;	  								  							',
'    end loop;',
'end; */',
'begin',
'    delete from CCINVOICEDETAILFOOTER a',
'    where not exists (',
'        select 1 from ccinvoicedetail  aa  ',
'        where aa.tno = a.tno',
'          and aa.sno = a.sno',
'    );',
'    ',
'    delete from CCInvoiceFooter where tno = :P175_TNO;',
'',
'    insert into CCInvoiceFooter',
'        (tno ,',
'        FOOTERHEADCODE ,',
'        legendscode,        ',
'        FOOTERVALUE )',
'        (   select ',
'                :P175_TNO , ',
'                FOOTERHEADCODE ,',
'                legendscode ,',
'                round(sum(FOOTERVALUE),2) as sumofvalue ',
'            from CCInvoicedetailfooter',
'            where tno = :P175_TNO',
'            group by FOOTERHEADCODE,legendscode',
'        );',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35074103946550990
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44946125896077531)
,p_process_sequence=>180
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(507613493385104937)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'CCInvoice Job - Save Interactive Grid Data'
,p_static_id=>'ccinvoice-job-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35020603579550965
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44994901283077554)
,p_process_sequence=>80
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check for Page Readonly'
,p_static_id=>'check-for-page-readonly'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    :P175_IS_READONLY := GET_TRANSACTION_STATUS(:P175_TNO, ''INVOICE'');',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35069378966550988
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45597555966848216)
,p_process_sequence=>90
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Check for Special Access'
,p_static_id=>'check-for-special-access'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_access    NUMBER;',
'BEGIN',
'    SELECT',
'         COUNT(*) INTO v_access',
'    FROM MODULEPRIVILEGE A',
'    WHERE A.MODULECODE = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'      AND A.BOSSUSERCODE = :GLOBAL_BOSSUSERCODE',
'      AND A.OTHERPRIVILEGE= ''YES''',
'      AND A.COMPANYCODE = :GLOBAL_COMPANYCODE;',
'',
'    IF v_access > 0 THEN',
'        :P175_HAS_SPECIAL_ACCESS := ''Y'';',
'    ELSE',
'        :P175_HAS_SPECIAL_ACCESS    :=  ''N'';',
'    END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35672033650321650
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44995305958077554)
,p_process_sequence=>230
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create invoice'
,p_static_id=>'create-invoice'
,p_process_sql_clob=>'createinvoice(:p175_tno);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35069783641550988
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45000102416077556)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete From Child Table'
,p_static_id=>'delete-from-child-table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Delete From CCINVOICEDETAILFOOTER a Where a.Tno = :P175_TNO;',
'Delete From CCINVOICEFOOTER a Where a.Tno = :P175_TNO;',
'--Delete From CCINVOICETAC a Where a.Tno = :P175_TNO;',
'Delete From CCINVOICESTOCKDETAIL a Where a.Tno = :P175_TNO;',
'Delete From CCINVOICEDETAIL a Where a.Tno = :P175_TNO;',
'Delete From CCINVOICESTOCKSTORAGEDETAIL a Where a.Tno = :P175_TNO;',
'Delete From CCINVOICE a Where a.Tno = :P175_TNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(44993051484077551)
,p_internal_uid=>35074580099550990
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44996915955077555)
,p_process_sequence=>210
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete from invoice'
,p_static_id=>'delete-from-invoice'
,p_process_sql_clob=>'delete from invoice where MODULETNO= :P175_TNO;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(44993051484077551)
,p_internal_uid=>35071393638550989
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44998058160077555)
,p_process_sequence=>200
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete master if Detail is not saved'
,p_static_id=>'delete-master-if-detail-is-not-saved'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  tmp   number;',
'  tmp1  number;',
'  tmp2  number;',
'begin',
'    checkdetail(getmodulecodeforpageno(:APP_PAGE_ID),:P175_TNO);',
'',
'    select sum(a.quantity1) into tmp from ccinvoicedetail a , Item b',
'     where a.ItemCode = b.ItemCode',
'      and b.ItemClassificationCode = ''MATERIAL''',
'      and a.tno = :P175_TNO;',
'',
'    select sum(a.quantity1) into tmp1 from ccinvoicestockstoragedetail a',
'     where A.tno = :P175_TNO;',
'-- added by sanjay on 23-jul-2026',
'    -- select sum(a.usedstockquantity1) into tmp2 from usedstockstoragedetail a',
'    --  where A.moduletno = :P175_TNO;',
'',
'    --  if nvl(tmp1,0) != nvl(tmp2,0)  then',
'    --    raise_application_error(-20001,''Something Wrong , Pl. Check Quantity '');',
'    -- end if;',
'----',
'    if nvl(tmp,0) != nvl(tmp1,0) and :P175_STOCKREQUIRED = ''YES'' then',
'       raise_application_error(-20000,''Pl. Allocate All Quantity'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35072535843550989
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44922019941077520)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(878940955181035895)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Detail Footer - Save Interactive Grid Data'
,p_static_id=>'detail-footer-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    --raise_application_error(-20000,:APEX$ROW_STATUS);',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into CCINVOICEDETAILFOOTER  (TNO,SNO, SN, SERIALNO,FOOTERHEADCODE,FOOTERPERCENT,FOOTERVALUE,LEGENDSCODE)',
'            Values (:TNO, :SNO, GlobalTNo.nextval,:SERIALNO,:FOOTERHEADCODE,:FOOTERPERCENT,:FOOTERVALUE,:LEGENDSCODE);',
'        ',
'        when ''U'' then',
'            update CCINVOICEDETAILFOOTER ',
'                set ',
'                TNO = :TNO,',
'                SNO = :SNO,',
'                SN = :SN,',
'                SERIALNO = :SERIALNO,',
'                FOOTERHEADCODE = :FOOTERHEADCODE,',
'                FOOTERPERCENT = :FOOTERPERCENT,',
'                FOOTERVALUE = :FOOTERVALUE,',
'                LEGENDSCODE = :LEGENDSCODE',
'            WHERE TNO = :TNO',
'             and SNO = :SNO',
'             and SN = :SN;',
'',
'        when ''D'' then',
'            Delete From CCINVOICEDETAILFOOTER ',
'            Where TNo = :TNO',
'              and SNO = :SNO;',
'    end case;',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>34996497624550954
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44994428413077554)
,p_process_sequence=>90
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FETCH_DATA_FOR_STOCK_GRID'
,p_static_id=>'fetch-data-for-stock-grid'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_required_qty NUMBER := NVL(:P175_DETAILQTY1, 0);',
'    v_shortfall    NUMBER := 0;',
'',
'    CURSOR c_stock_qty is ',
'        SELECT ',
'               S.TNO AS STOCKTNO,',
'               ROUND((NVL(S.STOCKQUANTITY1, 0) - NVL(U.USED_QTY, 0)),3) AS AVAILABLE_QTY,',
'               S.STORAGELOCATIONCODE,',
'               GETSTORAGELOCATIONNAME(S.STORAGELOCATIONCODE) AS STORAGELOCATIONNAME,',
'               GETMODULENO(S.STOCKMODULECODE,S.STOCKMODULETNO) AS TRANSACTIONNO,',
'               pb.TNO AS PURCHASEBILLTNO,',
'               pb.PARTYBILLNO,',
'               ''AUTO ALLOCATED'' AS REMARK',
'        FROM STOCK S',
'        LEFT JOIN (SELECT STOCKTNO, SUM(USEDSTOCKQUANTITY1) USED_QTY ',
'                   FROM USEDSTOCK GROUP BY STOCKTNO) U ON S.TNO = U.STOCKTNO',
'        LEFT JOIN (SELECT DISTINCT pb.TNO, pb.PURCHASEBILLNO, pb.PARTYBILLNO, pb.PURCHASEORDERTNO , x.GRNTNO',
'                   FROM PURCHASEBILL pb ',
'                   LEFT JOIN PURCHASEBILLGRNDETAIL x ON x.TNO = pb.TNO) pb ON pb.PURCHASEORDERTNO = s.PURCHASEORDERTNO AND pb.GRNTNO = s.GRNTNO',
'        WHERE S.ITEMCODE = :P175_DETAILITEMCODE',
'          AND S.ITEMSPECIFICATIONCODE = :P175_DETAILITEMSPECIFICATIONCODE',
'          AND S.COMPANYCODE = :GLOBAL_COMPANYCODE',
'          AND S.LOCATIONCODE = :P175_LOCATIONCODE',
'          AND (NVL(S.STOCKQUANTITY1, 0) - NVL(U.USED_QTY, 0)) > 0',
'        ORDER BY S.STOCKDATE ASC, S.TNO ASC;',
'',
'BEGIN',
'    IF :P175_LOADINGADVICETNO IS NULL THEN          --Only auto Allocate for DespatchAdvice Cases',
'        --Check the Qty is available or not',
'        for rec in c_stock_qty ',
'        LOOP',
'            EXIT WHEN v_required_qty <= 0;',
'            v_required_qty := v_required_qty - LEAST(v_required_qty, rec.available_qty);',
'        END LOOP;',
'',
'        -- Error Handling',
'        IF v_required_qty > 0 THEN',
'            OWA_UTIL.MIME_HEADER(''application/json'', FALSE);',
'            HTP.P(''Cache-Control: no-cache'');',
'            HTP.P(''Pragma: no-cache'');',
'            OWA_UTIL.HTTP_HEADER_CLOSE;',
'            ',
'            APEX_JSON.OPEN_OBJECT;',
'            APEX_JSON.WRITE(''status'', ''ERROR'');',
'            APEX_JSON.WRITE(''message'', ''Insufficient stock. Shortfall: '' || v_required_qty);',
'            APEX_JSON.CLOSE_OBJECT;',
'            RETURN;',
'        END IF;',
'',
'',
'        v_required_qty := NVL(:P175_DETAILQTY1, 0); -- Reset Qty for 2nd loop',
'',
'        apex_json.open_object;',
'        apex_json.open_array(''stockQty'');',
'',
'        for r in c_stock_qty LOOP',
'            EXIT WHEN v_required_qty <= 0;',
'            ',
'            DECLARE',
'                v_issue_qty NUMBER := LEAST(v_required_qty, r.available_qty);',
'                v_sn_seq    NUMBER := GlobalTNo.Nextval;',
'            BEGIN',
'                apex_json.open_object;',
'                apex_json.write(''TNO''                 , :P175_TNO);',
'                apex_json.write(''SNO''                 , :P175_SNO);',
'                apex_json.write(''SN''                  , v_sn_seq);',
'                apex_json.write(''STORAGELOCATIONCODE'' , r.STORAGELOCATIONCODE);',
'                apex_json.write(''STORAGELOCATIONNAME'' , r.STORAGELOCATIONNAME);',
'                apex_json.write(''STOCKTNO''            , r.STOCKTNO);',
'                apex_json.write(''TRANSACTIONNO''       , r.TRANSACTIONNO);',
'                apex_json.write(''QUANTITY1''           , v_issue_qty);',
'                apex_json.write(''PARTYBILLNO''         , r.PARTYBILLNO);',
'                apex_json.write(''PURCHASEBILLTNO''     , r.PURCHASEBILLTNO);',
'                apex_json.write(''REMARK''              , r.REMARK);',
'                apex_json.close_object;',
'                ',
'                v_required_qty := v_required_qty - v_issue_qty;',
'            END;',
'        END LOOP;',
'        apex_json.close_array;',
'        apex_json.close_object;',
'    END IF;',
'',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35068906096550988
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(52667504670987208)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'FETCH_DATA_FOR_STOCK_GRID_FOR_OTO'
,p_static_id=>'fetch-data-for-stock-grid-for-oto'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_sno          NUMBER := TO_NUMBER(apex_application.g_x01);',
'    col_quantity   NUMBER := TO_NUMBER(apex_application.g_x02);',
'    col_item       VARCHAR2(250) := UPPER(TRIM(apex_application.g_x03)); ',
'    col_itemSpec   VARCHAR2(250) := UPPER(TRIM(apex_application.g_x04));',
'    ',
'    v_required_qty NUMBER := NVL(col_quantity, 0);',
'    v_total_stock  NUMBER := 0;',
'',
'    CURSOR c_stock_qty IS ',
'        SELECT ',
'               S.TNO AS STOCKTNO,',
'               ROUND((NVL(S.STOCKQUANTITY1, 0) - NVL(U.USED_QTY, 0)), 3) AS AVAILABLE_QTY,',
'               S.STORAGELOCATIONCODE,',
'               GETSTORAGELOCATIONNAME(S.STORAGELOCATIONCODE) AS STORAGELOCATIONNAME,',
'               GETMODULENO(S.STOCKMODULECODE, S.STOCKMODULETNO) AS TRANSACTIONNO,',
'               ''AUTO ALLOCATED'' AS REMARK',
'        FROM STOCK S',
'        LEFT JOIN (',
'            SELECT STOCKTNO, SUM(NVL(USEDSTOCKQUANTITY1, 0)) AS USED_QTY ',
'            FROM USEDSTOCK ',
'            GROUP BY STOCKTNO',
'        ) U ON S.TNO = U.STOCKTNO',
'        INNER JOIN GRN g ON g.TNO = S.GRNTNO ',
'        WHERE UPPER(TRIM(S.ITEMCODE))                = col_item',
'          AND UPPER(TRIM(S.ITEMSPECIFICATIONCODE))   = col_itemSpec',
'          AND S.COMPANYCODE                          = :GLOBAL_COMPANYCODE',
'          AND S.LOCATIONCODE                         = :P175_LOCATIONCODE',
'          AND g.LOADINGADVICETNO                     = :P175_LOADINGADVICETNO',
'          AND (NVL(S.STOCKQUANTITY1, 0) - NVL(U.USED_QTY, 0)) > 0',
'        ORDER BY S.STOCKDATE ASC, S.TNO ASC;',
'',
'    TYPE t_stock_list IS TABLE OF c_stock_qty%ROWTYPE INDEX BY PLS_INTEGER;',
'    v_stocks t_stock_list;',
'',
'BEGIN',
'    -- 1. Fetch rows from database',
'    OPEN c_stock_qty;',
'    FETCH c_stock_qty BULK COLLECT INTO v_stocks;',
'    CLOSE c_stock_qty;',
'',
'    -- Compute dynamic inventory totals',
'    FOR i IN 1..v_stocks.COUNT LOOP',
'        v_total_stock := v_total_stock + v_stocks(i).AVAILABLE_QTY;',
'    END LOOP;',
'',
'    -- Instant Shortfall validation',
'    IF v_total_stock < v_required_qty THEN',
'        OWA_UTIL.MIME_HEADER(''application/json'', FALSE);',
'        HTP.P(''Cache-Control: no-cache'');',
'        HTP.P(''Pragma: no-cache'');',
'        OWA_UTIL.HTTP_HEADER_CLOSE;',
'        ',
'        APEX_JSON.OPEN_OBJECT;',
'        APEX_JSON.WRITE(''status'', ''ERROR'');',
'        APEX_JSON.WRITE(''message'', ''Insufficient stock. Required: '' || v_required_qty || '' but Available: '' || v_total_stock);',
'        APEX_JSON.CLOSE_OBJECT;',
'        RETURN;',
'    END IF;',
'',
'    -- 2. FIX: Reset quantity context right before JSON array generation loop',
'    v_required_qty := NVL(col_quantity, 0); ',
'',
'    -- Success JSON build',
'    APEX_JSON.OPEN_OBJECT;',
'    APEX_JSON.WRITE(''status'', ''SUCCESS'');',
'    APEX_JSON.OPEN_ARRAY(''stockQty'');',
'',
'    FOR i IN 1..v_stocks.COUNT LOOP',
'        EXIT WHEN v_required_qty <= 0;',
'        ',
'        DECLARE',
'            v_issue_qty NUMBER := LEAST(v_required_qty, v_stocks(i).AVAILABLE_QTY);',
'            v_sn_seq    NUMBER := GlobalTNo.NEXTVAL;',
'        BEGIN',
'            APEX_JSON.OPEN_OBJECT;',
'            APEX_JSON.WRITE(''TNO''                 , :P175_TNO);',
'            APEX_JSON.WRITE(''SNO''                 , v_sno);',
'            APEX_JSON.WRITE(''SN''                  , v_sn_seq);',
'            APEX_JSON.WRITE(''STORAGELOCATIONCODE'' , v_stocks(i).STORAGELOCATIONCODE);',
'            APEX_JSON.WRITE(''STORAGELOCATIONNAME'' , v_stocks(i).STORAGELOCATIONNAME);',
'            APEX_JSON.WRITE(''STOCKTNO''            , v_stocks(i).STOCKTNO);',
'            APEX_JSON.WRITE(''TRANSACTIONNO''       , v_stocks(i).TRANSACTIONNO);',
'            APEX_JSON.WRITE(''QUANTITY1''           , v_issue_qty);',
'            APEX_JSON.WRITE(''REMARK''              , v_stocks(i).REMARK);',
'            APEX_JSON.CLOSE_OBJECT;',
'            ',
'            v_required_qty := v_required_qty - v_issue_qty;',
'        END;',
'    END LOOP;',
'',
'    APEX_JSON.CLOSE_ARRAY;',
'    APEX_JSON.CLOSE_OBJECT;',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>42741982354460642
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44999228709077556)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No CCinvoice'
,p_static_id=>'get-document-no-ccinvoice'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P175_Tno is null then',
'        Select GlobalTno.NextVal into :P175_Tno From Dual;',
'     end if;',
'    ----',
'    if :P175_CCInvoiceNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P175_LocationCode,',
'					:P175_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P175_CCInvoiceDATE, ''DD-MM-RRRR'')',
'				);',
'        :P175_CCInvoiceNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P175_LocationCode,',
'                    :P175_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P175_CCInvoiceDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35073706392550990
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44995640886077554)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Document No Eway Bill'
,p_static_id=>'get-document-no-eway-bill'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := getModuleCodeForPageNo(:APP_PAGE_ID);',
'    tmp         number ;',
'begin',
'     if :P175_Tno is null then',
'        Select GlobalTno.NextVal into :P175_Tno From Dual;',
'     end if;',
'    ----',
'    if :P175_EWBNO is null then',
'            SetDocNoNext(',
'					tModuleCode,',
'					:global_CompanyCode,',
'					:global_FinancialYearCode,',
'					:P175_LocationCode,',
'					:P175_DocTypeCode,',
'					NULL,',
'					TO_DATE(:P175_EWBDATE, ''DD-MM-RRRR'')',
'				);',
'        :P175_EWBNO := GetDocNo(',
'                    tModuleCode,',
'                    :global_CompanyCode,',
'                    :global_FinancialYearCode,',
'                    :P175_LocationCode,',
'                    :P175_DocTypeCode,',
'                    NULL,',
'                    TO_DATE(:P175_EWBDATE, ''DD-MM-RRRR'')',
'                    );',
'    end if;',
'    ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>35070118569550988
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44998508812077555)
,p_process_sequence=>50
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get TNo'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If :P175_TNO is null then',
':P175_TNO := GlobalTNo.nextval;',
':P175_TNO_1 := :P175_TNO;',
':P175_FORMSTATUS := ''NEWRECORD'';',
'ELSE',
':P175_FORMSTATUS := ''EDITRECORD'';',
'End if;',
':P175_STATUS := nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P175_TNO), ''Status'');',
'',
'if :P175_SALESORDERTNO is not null then',
'    declare',
'        advance number := 0;',
'    begin',
'        select sum(nvl(a.amount,0)) into advance from ADVANCERECEIPTDETAIL a , ADVANCERECEIPT b',
'        where a.tno = b.tno',
'        and getdocumentstatuscode(''ADVANCERECEIPT'',b.tno) = ''ACTIVE''',
'        and a.REFERENCEMODULETNO = :P175_SALESORDERTNO;',
'',
'        --:P175_ADVANCEAMOUNT := advance;',
'',
'        :P175_BALANCEAMOUNT := :P175_CCINVOICEAMOUNT - :P175_ADJUSTEDADVANCEAMOUNT;',
'        --raise_application_error(-20000 , advance);',
'    end;',
'',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35072986495550989
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45001226924077557)
,p_process_sequence=>60
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
'       :P175_MODULEFLOW := ''YES'';',
'   else',
'       :P175_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P71_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P175_ONTHETABLE := ''YES'' ;',
'   else',
'       :P175_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35075704607550991
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44934928153077527)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(242780065526223382)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Eway Bill'
,p_static_id=>'initialize-form-eway-bill'
,p_process_when_type=>'NEVER'
,p_internal_uid=>35009405836550961
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44951757503077534)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(838405705639067145)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Invoice'
,p_static_id=>'initialize-form-invoice'
,p_internal_uid=>35026235186550968
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44905383575077512)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(499336145146944843)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Item Detail - Save Interactive Grid Data'
,p_static_id=>'item-detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'            if :itemcode is null and :itemspecificationcode is not null then',
'                select itemcode INTO :ITEMCODE from  itemspecification a, item b',
'                where a.tno = b.tno',
'                  and a.itemspecificationcode = :ITEMSPECIFICATIONCODE',
'                  AND ROWNUM = 1',
'                  ;',
'   ',
'            end if;',
' ',
'    --RAISE_APPLICATION_ERROR(-20000,:APEX$ROW_STATUS);',
'    case :APEX$ROW_STATUS',
'',
'        when ''C'' then',
'           Insert Into CCInvoiceDetail (                 ',
'                   TNO              ,',
'                   SNO              ,',
'                   ITEMCODE         ,',
'                   ITEMSPECIFICATIONCODE,',
'                   DESCRIPTION      ,',
'                   QUANTITY1        ,',
'                   QUANTITY2        ,',
'                   RATE             ,',
'                   AMOUNT           ,',
'                   FOOTERAMOUNT     ,',
'                   TOTALAMOUNT      ,',
'                   REMARK           ,',
'                   TAXRULECODE      ,',
'                   PACKINGTYPECODE  ,',
'                   PACKINGNOS ,',
'                   RATEMEASURINGUNITCODE ,',
'                   DESPATCHCATEGORYCODE',
'            )',
'            Values (',
'                   :TNO              ,',
'                   :SNO              ,',
'                   :ITEMCODE         ,',
'                   :ITEMSPECIFICATIONCODE,',
'                   :DESCRIPTION      ,',
'                   :QUANTITY1        ,',
'                   :QUANTITY2        ,',
'                   :RATE             ,',
'                   :AMOUNT           ,',
'                   :FOOTERAMOUNT     ,',
'                   :TOTALAMOUNT      ,',
'                   :REMARK           ,',
'                   :TAXRULECODE      ,',
'                   :PACKINGTYPECODE  ,',
'                   :PACKINGNOS ,',
'                   :RATEMEASURINGUNITCODE ,',
'                   :P175_TRANSACTIONTYPECODE',
'  ',
'            );',
'        ',
'        when ''U'' then',
'            update CCInvoiceDetail Set',
'                TNO              =     :TNO          ,',
'                SNO              =     :SNO          ,',
'                ITEMCODE         =     :ITEMCODE     ,',
'                ITEMSPECIFICATIONCODE         =     :ITEMSPECIFICATIONCODE     ,',
'                DESCRIPTION      =     :DESCRIPTION  ,',
'                QUANTITY1        =     :QUANTITY1    ,',
'                QUANTITY2        =     :QUANTITY2    ,',
'                RATE             =     :RATE         ,',
'                AMOUNT           =     :AMOUNT       ,',
'                FOOTERAMOUNT     =     :FOOTERAMOUNT ,',
'                TOTALAMOUNT      =     :TOTALAMOUNT  ,',
'                REMARK           =     :REMARK       ,',
'                TAXRULECODE      =     :TAXRULECODE  ,',
'                PACKINGTYPECODE  =     :PACKINGTYPECODE,',
'                PACKINGNOS       =     :PACKINGNOS ,',
'                RATEMEASURINGUNITCODE = :RATEMEASURINGUNITCODE ,',
'                DESPATCHCATEGORYCODE = :P175_TRANSACTIONTYPECODE',
'       WHERE TNO = :P175_TNO',
'         AND SNO = :SNO',
'           ;',
'',
'        when ''D'' then',
'            Delete From CCInvoiceDetail',
'            Where TNo = :P175_TNO',
'              and SNO = :SNO',
'              ;',
'',
'            Delete From CCINVOICEDETAILFOOTER a Where a.Tno = :P175_TNO AND SNO = :SNO;',
'            Delete From CCINVOICESTOCKDETAIL a Where a.Tno = :P175_TNO AND SNO = :SNO;',
'',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>34979861258550946
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45000435541077556)
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
,p_internal_uid=>35074913224550990
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44935373252077527)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(242780065526223382)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process Form Eway Bill'
,p_static_id=>'process-form-eway-bill'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35009850935550961
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44952218567077534)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(838405705639067145)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Invoice'
,p_static_id=>'process-form-invoice'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35026696250550968
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45001716854077557)
,p_process_sequence=>190
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P175_TNO, :P175_CCINVOICENO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(44993850666077552)
,p_internal_uid=>35076194537550991
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44997629207077555)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date'
,p_static_id=>'set-allowed-date'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P175_FORMSTATUS = ''NEWRECORD'' THEN ',
'',
'select',
'		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'		--a.FreezeDate',
'        INTO :P175_ALLOWEDBACK,:P175_ALLOWEDFORWARD',
'from Module a, ModulePrivilege b, BossUser c',
'where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'		and a.ModuleCode = b.ModuleCode',
'		and b.BossUsercode = c.BossUserCode',
'		and c.LoginName = :GLOBAL_LOGINNAME',
'		and b.CompanyCode = :GLOBAL_CompanyCode',
'        ;',
'',
'else',
'     :P175_ALLOWEDBACK       := :P175_CCINVOICEDATE ; ',
'    :P175_ALLOWEDFORWARD    := :P175_CCINVOICEDATE ;',
' end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35072106890550989
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44998822996077555)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Allowed Date as per Module Privilege'
,p_static_id=>'set-allowed-date-as-per-module-privilege'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for vloop in (',
'Select a.AllowBackDateEntry,',
'       a.FreezeDate,',
'       ''P'' || a.EntryPageNo || ''_'' || a.Transactiondatecolumn As DateColumnName,',
'       to_char(Trunc(Sysdate) - nvl(to_number(b.allowedbackdays),0),''DD-MM-RRRR'') As MinAllowedDate,',
'       to_char(Trunc(Sysdate) + nvl(to_number(b.allowedforwarddays),0),''DD-MM-RRRR'') as MaxAllowedDate,',
'       ''P'' || a.EntryPageNo || ''_FROMDATE'' as pageitem,',
'       '':GLOBAL_FROMDATE'' as Globaldate',
'  From Module a, Moduleprivilege b',
' Where a.ModuleCode = b.ModuleCode',
'   And a.EntryPageNo = :APP_PAGE_ID',
'   And b.bossusercode = :GLOBAL_BOSSUSERCODE',
') loop',
'    --:P0_FROMDATE := vloop.MinAllowedDate;',
'    --:P0_TODATE   := vloop.MaxAllowedDate;',
'    NULL;',
' End loop;',
'   ',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35073300679550989
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(45000873507077556)
,p_process_sequence=>40
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Voucher No'
,p_static_id=>'set-voucher-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  TEMP NUMBER;',
'begin',
'    select count(*) into temp from voucher a , invoice b where b.moduletno = :P175_TNO and a.moduletno = b.tno ;',
'    IF NVL(TEMP,0) > 0 THEN',
'    select a.tno,a.voucherno into :P175_vouchertno,:P175_voucherno from voucher a , invoice b where b.moduletno = :P175_TNO and a.moduletno = b.tno ;',
'    ',
'        --select tno,voucherno into :P175_vouchertno,:P175_voucherno from voucher a where a.ModuleTno = :P175_TNO and a.doctypecode=''SALE'';',
'    END IF;',
'    /* 15-apr-2026',
'    select ',
'       TO_CHAR(b.tno),b.consigneecode,b.agentcode ',
'       into :P175_SALESORDERTNO,:P175_CONSIGNEECODE,:P175_AGENTCODE',
'    from Despatchadvice a, SalesOrder b',
'    where a.referencetno = b.tno',
'      and a.tno = :P175_DESPATCHADVICETNO;',
'    */',
'      /*',
'',
'      if :P175_SALESORDERTNO is null then',
'         for vinv in (',
'            select ',
'               TO_CHAR(b.tno) salesordertno,b.consigneecode,b.agentcode',
'            from ccinvoice a, SalesOrder b ',
'            where a.SalesOrdertno = b.tno',
'              and a.tno = :P175_TNO',
'         ) loop',
'                :P175_SALESORDERTNO := vinv.salesordertno;',
'                :P175_CONSIGNEECODE := vinv.consigneecode;',
'                :P175_AGENTCODE     := vinv.agentcode ;',
'         end loop;',
'      end if;',
'      */',
'exception when others then',
'    null;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>35075351190550990
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44913890662077517)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(853779799753102156)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Stock  Detail - Save Interactive Grid Data'
,p_static_id=>'stock-detail-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'dml_plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    '    -- DELETE FROM CCINVOICESTOCKSTORAGEDETAIL',
    '    -- WHERE TNO = :P175_TNO',
    '    --   AND SNO = :P175_SNO;',
    '    ',
    '    CASE :APEX$ROW_STATUS',
    '        WHEN ''C'' THEN -- Create (Insert) logic',
    '            INSERT INTO CCINVOICESTOCKSTORAGEDETAIL (',
    '                TNO, SNO, SN, STORAGELOCATIONCODE, STOCKTNO, ',
    '                QUANTITY1, partybillno, purchasebilltno, REMARK',
    '            ) VALUES (',
    '                :TNO, :SNO, GlobalTNo.Nextval, :STORAGELOCATIONCODE, :STOCKTNO, ',
    '                :QUANTITY1, :partybillno, :purchasebilltno, :REMARK',
    '            ) RETURNING ROWID INTO :ROWID; -- Rowid return',
    '',
    '        WHEN ''U'' THEN -- Update logic',
    '            UPDATE CCINVOICESTOCKSTORAGEDETAIL',
    '            SET STORAGELOCATIONCODE = :STORAGELOCATIONCODE,',
    '                STOCKTNO = :STOCKTNO,',
    '                QUANTITY1 = :QUANTITY1,',
    '                partybillno = :partybillno,',
    '                purchasebilltno = :purchasebilltno,',
    '                REMARK = :REMARK',
    '            WHERE ROWID = :ROWID; -- Update based on ROWID',
    '',
    '        WHEN ''D'' THEN -- Delete logic',
    '            DELETE FROM CCINVOICESTOCKSTORAGEDETAIL',
    '            WHERE ROWID = :ROWID;',
    '    END CASE;',
    'END;',
    '')),
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'target_type', 'PLSQL_CODE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>34988368345550951
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44940338311077529)
,p_process_sequence=>170
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(507080149136152917)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Terms And Conditions - Save Interactive Grid Data'
,p_static_id=>'terms-and-conditions-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35014815994550963
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(14724764057648032)
,p_process_sequence=>240
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update CCINVOICEStockStorageDetail quantity2 so that Update Trigger Forcefully Fired'
,p_static_id=>'update-ccinvoicestockstoragedetail-quantity2-so-that-update-trigger-forcefully-fired'
,p_process_sql_clob=>'update CCINVOICEStockStorageDetail set quantity2=0 where tno = :P175_TNO;'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>14724764057648032
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44996053478077555)
,p_process_sequence=>220
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'UPDATE FREIGHT ADVANCE IN Loading Advice'
,p_static_id=>'update-freight-advance-in-loading-advice'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'',
'begin',
'if NVL(:P297_FREIGHTRATE,0) > 0 then',
'        Update ccinvoice x set x.freightrate = :P297_FREIGHTRATE',
'        where x.tno = :P297_CCINVOICETNO;',
'        if :P175_LOADINGADVICETNO is not null then',
'            update loadingadvice xx',
'               set xx.freightrate=:P297_FREIGHTRATE',
'            where xx.tno = :P175_LOADINGADVICETNO',
'            ;',
'        end if;',
'    end if;',
'',
'end;',
'update loadingadvice a set a.freightadvance = :P175_FREIGHTADVANCE WHERE TNO = :P175_LOADINGADVICETNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>35070531161550989
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44997241807077555)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate CCinvoice Detail and CCinvoice Stock Quantity'
,p_static_id=>'validate-ccinvoice-detail-and-ccinvoice-stock-quantity'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number;',
'    tmp1 number;',
'    tmp2 number;',
'begin',
'--raise_application_error(-20001 , ''Input Quantity and Stock Quantity Not Matching.'');',
'  for vloop in ( select tno,sno,sum(quantity1) as Quantity1 from CCINVOICEDETAIL  where tno = :P175_TNO GROUP BY TNO,SNO) LOOP',
'           tmp1 := vloop.Quantity1 ;',
'     ',
'           select sum(A.quantity1) into tmp2  from CCINVOICESTOCKSTORAGEDETAIL A, ITEM B',
'           where B.iTEMClassificationcode = ''MATERIAL''',
'            AND A.tno = vloop.tno and A.sno = vloop.sno ;',
' ',
'        if nvl(tmp1,0) <> nvl(tmp2,0) and :P175_STOCKREQUIRED = ''YES''  then',
'               raise_application_error(-20000 , ''CCInvoice Quantity and Stock Quantity Not Matching.'');',
'       end if;',
'  END LOOP;',
'  ',
'end;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>35071719490550989
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(44996518538077555)
,p_process_sequence=>150
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Validate CCinvoice Detail and CCinvoice Stock Quantity_1'
,p_static_id=>'validate-ccinvoice-detail-and-ccinvoice-stock-quantity-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number;',
'    tmp1 number;',
'    tmp2 number;',
'begin',
'--raise_application_error(-20001 , ''Input Quantity and Stock Quantity Not Matching.'');',
'  select SUM(amount) into tmp from CCINVOICEDETAIL  where tno = :P175_TNO ;',
'',
'  if nvl(tmp,0) != NVL(:P175_SUMOFAMOUNT,0) then',
'    raise_application_error(-20001 , ''Amount In Summary and Detail Section Not Matching., Pl. Check'');',
'  end if;',
'   ',
'  ',
'end;',
'',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>35070996221550989
);
wwv_flow_imp.component_end;
end;
/
