prompt --application/pages/page_00680
begin
--   Manifest
--     PAGE: 00680
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
 p_id=>680
,p_name=>'Fixed Assets'
,p_alias=>'FIXED-ASSETS'
,p_step_title=>'Fixed Assets'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(465777707720650609)
,p_plug_name=>'Breadcrumb'
,p_static_id=>'breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>2531463326621247859
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_menu_id=>wwv_flow_imp.id(566230209300256676)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>4072363345357175094
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(464308009314617859)
,p_plug_name=>'dummy'
,p_static_id=>'dummy'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(465778390878650630)
,p_plug_name=>'Fixed Assets'
,p_static_id=>'fixed-assets'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
' row_number() over(order by a.PARTYCODE) SerialNo,',
'A.PARTYNAME,',
'A.PARTYCODE,',
'(-1) * getAccountOpening(A.PartyCode, to_date(:P680_FINANCIALYEARBEGIN, ''dd-mm-yyyy''), :P680_LOCATIONCODE, :Global_CompanyCode) As NBOPENING,',
'(-1) * getAccountOpening(A.PartyCode, to_date(:P680_ASONDATE, ''dd-mm-yyyy''), :P680_LOCATIONCODE, :Global_CompanyCode) As NBCLOSING,',
'GetAccountGBCloseRevised(A.PartyCode,',
'                        :P680_LOCATIONCODE,',
'                        :Global_CompanyCode,',
'                        to_date(:P680_FINANCIALYEARBEGIN, ''dd-mm-yyyy'') - 1) As GBOPENING,',
'GetAccountGBCloseRevised(A.PartyCode, :P680_LOCATIONCODE, :Global_CompanyCode, to_date(:P680_ASONDATE, ''dd-mm-yyyy'')) As GBCLOSING,',
'GetAccountGBAdditionRevised(A.PartyCode,',
'                           :P680_LOCATIONCODE,',
'                           :Global_CompanyCode,',
'                           to_date(:P680_FINANCIALYEARBEGIN, ''dd-mm-yyyy''),',
'                           to_date(:P680_ASONDATE, ''dd-mm-yyyy'')) As GBADDITION,',
'GetAccountGBDepreciation(A.PartyCode, :P680_LOCATIONCODE, :Global_CompanyCode, to_date(:P680_ASONDATE, ''dd-mm-yyyy'')) As DEPRECIATIONCLOSING,',
'GetAccountGBDepreciation(A.PartyCode, :P680_LOCATIONCODE, :Global_CompanyCode, to_date(:P680_FINANCIALYEARBEGIN, ''dd-mm-yyyy'')-1) As DEPRECIATIONOPENING,',
'nvl(GetAccountGBCloseRevised(A.PartyCode,',
'                            :P680_LOCATIONCODE,',
'                            :Global_CompanyCode,',
'                            to_date(:P680_FINANCIALYEARBEGIN, ''dd-mm-yyyy'') - 1),',
'   0) +',
'nvl(GetAccountGBAdditionRevised(A.PartyCode,',
'                               :P680_LOCATIONCODE,',
'                               :Global_CompanyCode,',
'                               to_date(:P680_FINANCIALYEARBEGIN, ''dd-mm-yyyy''),',
'                               to_date(:P680_ASONDATE, ''dd-mm-yyyy'')),',
'   0) -',
'nvl(GetAccountGBCloseRevised(A.PartyCode, :P680_LOCATIONCODE, :Global_CompanyCode, to_date(:P680_ASONDATE, ''dd-mm-yyyy'')),',
'   0) As GBDeduction,',
'GetAccountGBDepreciation(A.PartyCode, :P680_LOCATIONCODE, :Global_CompanyCode, to_date(:P680_ASONDATE, ''dd-mm-yyyy'')) -',
'GetAccountGBDepreciation(A.PartyCode, :P680_LOCATIONCODE, :Global_CompanyCode, to_date(:P680_FINANCIALYEARBEGIN, ''dd-mm-yyyy'')-1) As DepreciationAddition',
'',
'From PARTY A',
'Where A.PARTYTYPECODE = ''ASSET''',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P680_ASONDATE,P680_LOCATIONCODE,P680_FINANCIALYEARBEGIN,P680_FINANCIALYEARCODE'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(210488289977069129)
,p_heading=>'Depreciation'
,p_static_id=>'depreciation'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(210488226428069128)
,p_heading=>'Gross Block'
,p_static_id=>'gross-block'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(210488479128069130)
,p_heading=>'Net Block'
,p_static_id=>'net-block'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(210488168762069127)
,p_name=>'DEPRECIATIONADDITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPRECIATIONADDITION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Addition'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>80
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488289977069129)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210487858970069124)
,p_name=>'DEPRECIATIONCLOSING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPRECIATIONCLOSING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Closing'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>90
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488289977069129)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210487936412069125)
,p_name=>'DEPRECIATIONOPENING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEPRECIATIONOPENING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Opening'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488289977069129)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210487764514069123)
,p_name=>'GBADDITION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GBADDITION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Addition'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488226428069128)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210487636432069122)
,p_name=>'GBCLOSING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GBCLOSING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Closing'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488226428069128)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210488035635069126)
,p_name=>'GBDEDUCTION'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GBDEDUCTION'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Deduction'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488226428069128)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210487550557069121)
,p_name=>'GBOPENING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'GBOPENING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Opening'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>30
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488226428069128)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210487433052069120)
,p_name=>'NBCLOSING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NBCLOSING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Closing'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>120
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488479128069130)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210190727483914369)
,p_name=>'NBOPENING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NBOPENING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Opening'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>110
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(210488479128069130)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_format_mask=>'999G999G999G999G990D00'
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
 p_id=>wwv_flow_imp.id(210190661340914368)
,p_name=>'PARTYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Partycode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
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
 p_id=>wwv_flow_imp.id(210190495423914367)
,p_name=>'PARTYNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Party Name'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>10
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
 p_id=>wwv_flow_imp.id(182109741165397008)
,p_name=>'SERIALNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SERIALNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Serial No'
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(210190399715914366)
,p_internal_uid=>8191513324246747
,p_is_editable=>false
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
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(210493257935069489)
,p_interactive_grid_id=>wwv_flow_imp.id(210190399715914366)
,p_static_id=>'84944'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>false
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(210493473564069489)
,p_report_id=>wwv_flow_imp.id(210493257935069489)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(182455584356242720)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(182109741165397008)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92.156
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210493899384069495)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(210190495423914367)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>205
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210494819059069502)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(210190661340914368)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210495769879069506)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(210190727483914369)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>146.163
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210496613104069509)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(210487433052069120)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142.7814542236328
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210497502101069515)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(210487550557069121)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>142.986
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210498431980069521)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(210487636432069122)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>138.191
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210499312479069526)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(210487764514069123)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>145.16
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210500226783069530)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(210487858970069124)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>160.18099999999998
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210501117468069533)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(210487936412069125)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>134.15300000000002
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210502048613069536)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(210488035635069126)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>152.167
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(210502909290069539)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(210488168762069127)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>141.163
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(160377653085424692)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_static_id=>'sum'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(210487858970069124)
,p_show_grand_total=>false
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(160377764631427071)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_static_id=>'sum-2'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(210487764514069123)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(160377875223428967)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_static_id=>'sum-3'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(210488035635069126)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(160378015186431282)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_static_id=>'sum-4'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(210487636432069122)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(160378113172434280)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_static_id=>'sum-5'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(210487936412069125)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(160378135617436019)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_static_id=>'sum-6'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(210488168762069127)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(160378275274439438)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_static_id=>'sum-7'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(210190727483914369)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_ig_report_aggregate(
 p_id=>wwv_flow_imp.id(160378353344441021)
,p_view_id=>wwv_flow_imp.id(210493473564069489)
,p_static_id=>'sum-8'
,p_function=>'SUM'
,p_column_id=>wwv_flow_imp.id(210487433052069120)
,p_show_grand_total=>true
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(464308940006617868)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(464308009314617859)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(464308164117617860)
,p_name=>'P680_ASONDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(464308009314617859)
,p_prompt=>'As On Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(464308542291617864)
,p_name=>'P680_FINANCIALYEARBEGIN'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(464308009314617859)
,p_item_default=>'GLOBAL_FINANCIALYEARBEGIN'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(464308659017617865)
,p_name=>'P680_FINANCIALYEARCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(464308009314617859)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(464308422073617863)
,p_name=>'P680_LOCATIONCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(464308009314617859)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(182452922666233958)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(182453275878233959)
,p_event_id=>wwv_flow_imp.id(182452922666233958)
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
 p_id=>wwv_flow_imp.id(464309036830617869)
,p_name=>'Refresh'
,p_static_id=>'refresh'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(464308940006617868)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(464309086792617870)
,p_event_id=>wwv_flow_imp.id(464309036830617869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(465778390878650630)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(464308745688617866)
,p_name=>'set value'
,p_static_id=>'set-value'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P680_ASONDATE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(464308784726617867)
,p_event_id=>wwv_flow_imp.id(464308745688617866)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P680_FINANCIALYEARBEGIN,P680_FINANCIALYEARCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P680_ASONDATE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select a.financialyearbegin, a.financialyearcode',
    'from financialyear a',
    'where :P680_ASONDATE between a.FINANCIALYEARBEGIN and a.financialyearend',
    ';')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
