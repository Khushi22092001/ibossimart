prompt --application/pages/page_00365
begin
--   Manifest
--     PAGE: 00365
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
 p_id=>365
,p_name=>'Enhance Interactive Grid with Treegrid'
,p_alias=>'ENHANCE-INTERACTIVE-GRID-WITH-TREEGRID'
,p_step_title=>'Enhance Interactive Grid with Treegrid'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(42000566634292311130)
,p_plug_name=>'Interactive Grid - Employees'
,p_static_id=>'interactive-grid-employees'
,p_region_name=>'TREEGRID_IG'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select modulecode as MODULECODE, ',
'       modulename as MODULENAME, ',
'       parentcode as PARENTCODE, ',
'       prior modulename as MODULE, ',
'       level,',
'       case when parentcode is null',
'              then ''fa-robot''',
'            when parentcode = ''7839''',
'              then ''fa-users''',
'            else ''fa-user''',
'       end as icon',
'  From (Select A.MODULECODE, A.MODULENAME, B.MODULEGROUPCODE As PARENTCODE, a.isactive',
'          From Module A, MODULEGROUP B',
'         Where A.MODULEGROUPCODE = B.MODULEGROUPCODE',
'        Union All',
'        Select B.MODULEGROUPCODE, B.MODULEGROUPNAME, Null, null ',
'          From MODULEGROUP B) X',
' Start With parentcode Is Null',
'Connect By NOCYCLE parentcode  = Prior MODULECODE',
'',
'/*',
'select partycode as empno, ',
'       partyname as ename, ',
'       parentcode as mgr, ',
'       prior partyname as emp, ',
'       level,',
'       case when parentcode is null',
'              then ''fa-robot''',
'            when parentcode = ''7839''',
'              then ''fa-users''',
'            else ''fa-user''',
'       end as icon',
'from party',
'connect by prior partycode = parentcode',
'start with parentcode is null;',
'*/',
' '))
,p_plug_source_type=>'NATIVE_IG'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(38995015227728475011)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(38995015157194475010)
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
 p_id=>wwv_flow_imp.id(16380439424337983129)
,p_name=>'ICON'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ICON'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>140
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(42000564532169311109)
,p_name=>'LEVEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEVEL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Level'
,p_heading_alignment=>'CENTER'
,p_display_sequence=>130
,p_value_alignment=>'CENTER'
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
 p_id=>wwv_flow_imp.id(92012226198981491)
,p_name=>'MODULE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Module'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
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
 p_id=>wwv_flow_imp.id(92011891259981488)
,p_name=>'MODULECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Modulecode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
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
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92011997026981489)
,p_name=>'MODULENAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MODULENAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HTML_EXPRESSION'
,p_heading=>'Modulename'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'html_expression', '<span class="fa &ICON."> &MODULENAME.</span>')).to_clob
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(92012070876981490)
,p_name=>'PARENTCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARENTCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Parentcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(42000566541260311129)
,p_internal_uid=>41974406712116605181
,p_is_editable=>true
,p_edit_operations=>'u'
,p_lost_update_check_type=>'VALUES'
,p_lazy_loading=>true
,p_requires_filter=>false
,p_show_nulls_as=>'-'
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'SEARCH_FIELD:ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'NONE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(39282188579564281825)
,p_interactive_grid_id=>wwv_flow_imp.id(42000566541260311129)
,p_static_id=>'29449718'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(39282188307863281825)
,p_report_id=>wwv_flow_imp.id(39282188579564281825)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(102224348667594487)
,p_view_id=>wwv_flow_imp.id(39282188307863281825)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(92011891259981488)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(102225364479594490)
,p_view_id=>wwv_flow_imp.id(39282188307863281825)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(92011997026981489)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(102226397380594491)
,p_view_id=>wwv_flow_imp.id(39282188307863281825)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(92012070876981490)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(102227423015594494)
,p_view_id=>wwv_flow_imp.id(39282188307863281825)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(92012226198981491)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(16378654027289955513)
,p_view_id=>wwv_flow_imp.id(39282188307863281825)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(16380439424337983129)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(38866328800868266242)
,p_view_id=>wwv_flow_imp.id(39282188307863281825)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(38995015227728475011)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(39275075020605112498)
,p_view_id=>wwv_flow_imp.id(39282188307863281825)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(42000564532169311109)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_highlight(
 p_id=>wwv_flow_imp.id(42225047654000822823)
,p_view_id=>wwv_flow_imp.id(39282188307863281825)
,p_execution_seq=>5
,p_name=>'Highlight level 2'
,p_static_id=>'highlight-level'
,p_background_color=>'#c74634'
,p_condition_type=>'COLUMN'
,p_condition_column_id=>wwv_flow_imp.id(42000564532169311109)
,p_condition_operator=>'EQ'
,p_condition_expression=>'2'
,p_is_enabled=>true
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(102217637676520449)
,p_name=>'Initialize treegrid on IG'
,p_static_id=>'initialize-treegrid-on-ig'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102218208255520451)
,p_event_id=>wwv_flow_imp.id(102217637676520449)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-enhanceigwithtreegrid-plugin'
,p_action=>'PLUGIN_COM.ENHANCEIGWITHTREEGRID.PLUGIN'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(42000566634292311130)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '.a-GV-table',
  'attribute_02', '.a-GV-row',
  'attribute_03', 'MODULECODE',
  'attribute_04', 'PARENTCODE',
  'attribute_05', 'expanded',
  'attribute_06', 'MODULENAME',
  'attribute_07', 'LEVEL')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(102218581163520451)
,p_name=>'Pagination changed'
,p_static_id=>'pagination-changed'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(42000566634292311130)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|gridpagechange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(102219114184520451)
,p_event_id=>wwv_flow_imp.id(102218581163520451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'plugin-com-enhanceigwithtreegrid-plugin'
,p_action=>'PLUGIN_COM.ENHANCEIGWITHTREEGRID.PLUGIN'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(42000566634292311130)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '.a-GV-table',
  'attribute_02', '.a-GV-row',
  'attribute_03', 'MODULECODE',
  'attribute_04', 'PARENTCODE',
  'attribute_05', 'expanded',
  'attribute_06', 'MODULENAME',
  'attribute_07', 'LEVEL')).to_clob
);
wwv_flow_imp.component_end;
end;
/
