
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
--     PAGE: 75
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
null;
end;
/
prompt --application/pages/delete_00075
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>75);
end;
/
prompt --application/pages/page_00075
begin
wwv_flow_imp_page.create_page(
 p_id=>75
,p_name=>'Module Doc Type Master'
,p_alias=>'MODULE-DOC-TYPE-MASTER'
,p_page_mode=>'MODAL'
,p_step_title=>'Module Doc Type Master'
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
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
':root{',
'    --a-menu-font-size: 1.25rem !important;',
'}',
'/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */',
'details#hspl-keyboard-help{display:none!important}',
''))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'600'
,p_dialog_width=>'900'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(583622938955140284)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'output_as', 'TEXT',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(590602583999368045)
,p_plug_name=>'Detail'
,p_static_id=>'detail'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       DOCTYPECODE,',
'       REMARK,',
'       NATUREDOCTYPECODE,',
'       SNO',
'  from MODULEDOCTYPEDETAIL',
'  where tno = :P75_TNO'))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P75_TNO'
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590603415272368053)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590603543398368054)
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
 p_id=>wwv_flow_imp.id(590602933008368048)
,p_name=>'DOCTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DOCTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Doc Type'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
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
'sELECT DocTypename d, DocTypecode r',
'from DocType '))
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
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590603068920368050)
,p_name=>'NATUREDOCTYPECODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'NATUREDOCTYPECODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>60
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590603029630368049)
,p_name=>'REMARK'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'REMARK'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Remark'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
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
 p_id=>wwv_flow_imp.id(590603340924368052)
,p_name=>'ROWID'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWID'
,p_data_type=>'ROWID'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>80
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(590603214197368051)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
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
 p_id=>wwv_flow_imp.id(590602791660368047)
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
,p_default_expression=>'P75_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(590602695424368046)
,p_internal_uid=>150216350173441522
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
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(591167201856748801)
,p_interactive_grid_id=>wwv_flow_imp.id(590602695424368046)
,p_static_id=>'1507809'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(591167373878748806)
,p_report_id=>wwv_flow_imp.id(591167201856748801)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591167866796748817)
,p_view_id=>wwv_flow_imp.id(591167373878748806)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(590602791660368047)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591168826868748823)
,p_view_id=>wwv_flow_imp.id(591167373878748806)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(590602933008368048)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591169742408748825)
,p_view_id=>wwv_flow_imp.id(591167373878748806)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(590603029630368049)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591170593945748827)
,p_view_id=>wwv_flow_imp.id(591167373878748806)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(590603068920368050)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591171511283748829)
,p_view_id=>wwv_flow_imp.id(591167373878748806)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(590603214197368051)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591172423469748831)
,p_view_id=>wwv_flow_imp.id(591167373878748806)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(590603340924368052)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(591174115697756460)
,p_view_id=>wwv_flow_imp.id(591167373878748806)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(590603415272368053)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(718027597752639540)
,p_plug_name=>'Fields'
,p_static_id=>'fields'
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(583618271907140282)
,p_plug_name=>'Module Doc Type Master'
,p_static_id=>'module-doc-type-master'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'MODULEDOCTYPE'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583623341260140285)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583625496139140286)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P75_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583624645400140286)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P75_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583639357784163326)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P75_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583639686024164334)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Flow'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P2_TNO1.'
,p_button_condition=>'P75_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583639126912162322)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P75_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583640333683166299)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P75_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583625054101140286)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P75_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(583640040336165330)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Status'
,p_button_position=>'TOP'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P75_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(718144064453519223)
,p_name=>'P75_CALLEDFROMPAGE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(718027597752639540)
,p_item_default=>'2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(583619059693140283)
,p_name=>'P75_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_source_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(583620682086140284)
,p_name=>'P75_CREATIONTIME'
,p_source_data_type=>'DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_source_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_default=>'select to_char(sysdate,''DD-MM-YYYY HH24:MI:SS'') from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Creation Time'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_begin_on_new_line=>'N'
,p_display_when=>'P75_MODULECODE'
,p_display_when_type=>'ITEM_IS_NOT_NULL'
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
 p_id=>wwv_flow_imp.id(583620318360140284)
,p_name=>'P75_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_source_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_default=>'select :GLOBAL_LOGINNAME from Dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Creator'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>32
,p_cMaxlength=>30
,p_tag_attributes=>'readonly=true'
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
 p_id=>wwv_flow_imp.id(718145641958538631)
,p_name=>'P75_FORMSTATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(718027597752639540)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000751)
,p_name=>'P75_IMART_SAVE_OP_ID'
,p_item_sequence=>999999
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000755)
,p_name=>'P75_IMART_STATUS_DONE'
,p_item_sequence=>1000002
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000754)
,p_name=>'P75_IMART_STATUS_START'
,p_item_sequence=>1000001
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105000756)
,p_name=>'P75_IMART_WORKFLOW_START'
,p_item_sequence=>1000003
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(583619524718140283)
,p_name=>'P75_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_source_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_prompt=>'Module Code'
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        A.MODULENAME, ',
'        A.MODULECODE ',
'        FROM MODULE A ',
'        ORDER BY A.MODULECODE DESC'))
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
 p_id=>wwv_flow_imp.id(718145233964535269)
,p_name=>'P75_MODULEFLOW'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(718027597752639540)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(718144946676531392)
,p_name=>'P75_ONTHETABLE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(718027597752639540)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(718144583719526813)
,p_name=>'P75_PASSFAILREMARK'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(718027597752639540)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(583619923736140283)
,p_name=>'P75_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_source_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_prompt=>'Remark'
,p_source=>'REMARK'
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
 p_id=>wwv_flow_imp.id(718145956534540904)
,p_name=>'P75_STATUS'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(718027597752639540)
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P2_TNO1), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(718144337803521544)
,p_name=>'P75_STATUSRIGHT'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(718027597752639540)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(583618671130140282)
,p_name=>'P75_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_item_source_plug_id=>wwv_flow_imp.id(583618271907140282)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583623373992140285)
,p_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583623341260140285)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583624155398140286)
,p_event_id=>wwv_flow_imp.id(583623373992140285)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583656343196204420)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583656700678204420)
,p_event_id=>wwv_flow_imp.id(583656343196204420)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583624645400140286)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583657219122204420)
,p_event_id=>wwv_flow_imp.id(583656343196204420)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583624645400140286)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P75_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583657648311204420)
,p_event_id=>wwv_flow_imp.id(583656343196204420)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583624645400140286)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.DELETEPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583661183338206158)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583662100278206158)
,p_event_id=>wwv_flow_imp.id(583661183338206158)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583640333683166299)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583661596593206158)
,p_event_id=>wwv_flow_imp.id(583661183338206158)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583640333683166299)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.PRINTPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583658051926204925)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583658962050204926)
,p_event_id=>wwv_flow_imp.id(583658051926204925)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583625054101140286)
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
 p_id=>wwv_flow_imp.id(583658501728204926)
,p_event_id=>wwv_flow_imp.id(583658051926204925)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583625054101140286)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P75_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583659493654204926)
,p_event_id=>wwv_flow_imp.id(583658051926204925)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583625054101140286)
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
 p_id=>wwv_flow_imp.id(583659899388205502)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583660755321205502)
,p_event_id=>wwv_flow_imp.id(583659899388205502)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583640040336165330)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583660282231205502)
,p_event_id=>wwv_flow_imp.id(583659899388205502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583640040336165330)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   And a.companycode = :GLOBAL_COMPANYCODE',
'   AND A.STATUSPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583648718946192943)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583640040336165330)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583651063960192945)
,p_event_id=>wwv_flow_imp.id(583648718946192943)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P75_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583650562329192944)
,p_event_id=>wwv_flow_imp.id(583648718946192943)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583652049165192945)
,p_event_id=>wwv_flow_imp.id(583648718946192943)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P75_IMART_STATUS_DONE',
  'items_to_submit', 'P75_TNO,P75_STATUS,P75_IMART_SAVE_OP_ID,P75_IMART_STATUS_START',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare ack_keys clob;procedure ack_business is begin',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P75_TNO,:P75_STATUS);',
    'end;begin',
    'select json_array(to_char(:P75_TNO) null on null returning clob) into ack_keys from dual;',
    'imart_save_ack.begin_status(:P75_IMART_SAVE_OP_ID,GetModuleCodeForPageNo(:APP_PAGE_ID),:P75_TNO,:P75_STATUS,''P75_TNO'',ack_keys);',
    'ack_business;',
    'imart_save_ack.finish_status(:P75_IMART_SAVE_OP_ID);',
    ':P75_IMART_STATUS_DONE:=:P75_IMART_SAVE_OP_ID;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583649070614192944)
,p_event_id=>wwv_flow_imp.id(583648718946192943)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$(''#STATUS span'').text($v(''P75_STATUS''));')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583649548715192944)
,p_event_id=>wwv_flow_imp.id(583648718946192943)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583650111768192944)
,p_event_id=>wwv_flow_imp.id(583648718946192943)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583651566591192945)
,p_event_id=>wwv_flow_imp.id(583648718946192943)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583654535550203869)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>50
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583654886091203869)
,p_event_id=>wwv_flow_imp.id(583654535550203869)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583639126912162322)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P75_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583655384240203869)
,p_event_id=>wwv_flow_imp.id(583654535550203869)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583639357784163326)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P75_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583655852991203870)
,p_event_id=>wwv_flow_imp.id(583654535550203869)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(583639686024164334)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P75_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583646416226191313)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583639357784163326)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583647281230191314)
,p_event_id=>wwv_flow_imp.id(583646416226191313)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P75_PASSFAILREMARK,P75_TNO1',
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
    '						and a.ModuleTNo = :P75_TNO1',
    '						AND D.BOSSUSERNAME = :APP_USER',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100);',
    '    tModulecode Varchar2(30);',
    'begin',
    '',
    '    select DISTINCT ',
    '    	d.ModuleCode, :P130_JOBBILLNO',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = :P75_PASSFAILREMARK',
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
 p_id=>wwv_flow_imp.id(583647758025191314)
,p_event_id=>wwv_flow_imp.id(583646416226191313)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583648263301191314)
,p_event_id=>wwv_flow_imp.id(583646416226191313)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583646809475191314)
,p_event_id=>wwv_flow_imp.id(583646416226191313)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(583644123981190099)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(583639126912162322)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583645006336190100)
,p_event_id=>wwv_flow_imp.id(583644123981190099)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P75_IMART_STATUS_DONE',
  'items_to_submit', 'P75_PASSFAILREMARK,P75_TNO1,P75_IMART_SAVE_OP_ID,P75_TNO,P75_IMART_WORKFLOW_START',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare ack_keys clob;procedure ack_business is begin',
    'DECLARE',
    '  tModuleCode  Varchar2(30) := GetModuleCodeForPageNo(:APP_PAGE_ID);',
    '  TMP          vARCHAR2(100) ;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = :P75_TNO1',
    '				AND D.BOSSUSERNAME = :APP_USER',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select DISTINCT ',
    '    	d.ModuleCode, :P130_JOBBILLNO',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '        AND d.modulecode = GetModuleCodeForPageNo(:APP_PAGE_ID)',
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
    '				a.remark = :P75_PASSFAILRREMARK',
    '			where a.TNo = vPassFail.TNo;',
    '			COMMIT;',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, :P75_TNO1 , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;',
    'end;begin',
    'select json_array(to_char(:P75_TNO) null on null returning clob) into ack_keys from dual;',
    'imart_save_ack.begin_v2(:P75_IMART_SAVE_OP_ID,''P75_TNO'',ack_keys,''STATUS'');',
    'ack_business;',
    'select json_array(to_char(:P75_TNO) null on null returning clob) into ack_keys from dual;',
    'imart_save_ack.finish_v2(:P75_IMART_SAVE_OP_ID,ack_keys);',
    ':P75_IMART_STATUS_DONE:=:P75_IMART_SAVE_OP_ID;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583645482236190101)
,p_event_id=>wwv_flow_imp.id(583644123981190099)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'location.reload()')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583645980497190101)
,p_event_id=>wwv_flow_imp.id(583644123981190099)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(583644521998190099)
,p_event_id=>wwv_flow_imp.id(583644123981190099)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P75_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583626676730140287)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(583624645400140286)
,p_internal_uid=>143240331479213763
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(590603695119368056)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Detail'
,p_static_id=>'delete-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from MODULEDOCTYPEDETAIL',
'where tno = :P75_TNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(583624645400140286)
,p_internal_uid=>150217349868441532
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(590603613701368055)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(590602583999368045)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Detail - Save Interactive Grid Data'
,p_static_id=>'detail-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>150217268450441531
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583653112810197758)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Form Status And TNO'
,p_static_id=>'get-form-status-and-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'     if :P75_TNO is null then',
'            :P75_FORMSTATUS := ''NEWRECORD'';',
'        else',
'            :P75_FORMSTATUS := ''EDITRECORD'';',
'        end if;',
'',
'    if :P75_TNO is null then',
'',
'        select globaltno.nextval into :P75_TNO from dual;',
'',
'    end if; ',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>143266767559271234
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583653393498198565)
,p_process_sequence=>70
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get On The Table'
,p_static_id=>'get-on-the-table'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P75_MODULEFLOW := ''YES'';',
'   else',
'       :P75_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P75_TNO1 and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P75_ONTHETABLE := ''YES'' ;',
'   else',
'       :P75_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>143267048247272041
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25268232713899038)
,p_process_sequence=>95
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART_DOCUMENT_HISTORY'
,p_static_id=>'imart-document-history'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' l_doc varchar2(4000);l_root varchar2(128):=''MODULEDOCTYPE'';l_record varchar2(4000);l_tno varchar2(100);l_links clob;',
' l_mode varchar2(20):=apex_application.g_x01;',
' l_key varchar2(100):=apex_application.g_x02;',
' l_after number:=to_number(apex_application.g_x03 default null on conversion error);',
' l_snapshot number:=to_number(apex_application.g_x04 default null on conversion error);',
' l_sort varchar2(10):=case when apex_application.g_x05=''OLDEST'' then ''OLDEST'' else ''NEWEST'' end;',
' l_filter varchar2(20):=nvl(apex_application.g_x06,''ALL'');',
' l_company varchar2(128);l_location varchar2(128);l_count number:=0;l_more boolean:=false;',
' l_json clob;l_pos pls_integer:=1;',
' function label_for(p_table varchar2,p_column varchar2) return varchar2 is v varchar2(500);',
' begin',
'  select max(regexp_replace(label,''<[^>]+>'','''')) into v from apex_application_page_items',
'  where application_id=105 and page_id=75 and item_source=p_column and label is not null;',
'  return coalesce(v,case p_column when ''QUANTITY1'' then ''Primary Quantity'' when ''QUANTITY2'' then ''Secondary Quantity''',
'    when ''ITEMSPECS'' then ''Item Specification'' when ''TNO'' then ''Document ID'' when ''SNO'' then ''Line ID''',
'    when ''IMART_AUDIT_ROW_ID'' then ''Audit Row ID'' when ''ITEMCODE'' then ''Item'' else initcap(replace(p_column,''_'','' '')) end);',
' end;',
' function actor_name(p_code varchar2,p_user varchar2) return varchar2 is v varchar2(255);',
' begin select max(coalesce(e.employeename,b.bossusername)) into v from bossuser b left join employee e on e.employeecode=b.employeecode',
' where b.bossusercode=p_code or (p_code is null and upper(b.loginname)=upper(p_user));',
' return coalesce(v,p_user,p_code,''Unknown user'');end;',
' function readable(p_field varchar2,p_value clob) return varchar2 is v varchar2(500);k varchar2(500):=dbms_lob.substr(p_value,500,1);',
' begin',
'  if k is null then return null;end if;',
'  case p_field',
'   when ''PARTYCODE'' then select max(partyname) into v from party where partycode=k;',
'   when ''ITEMCODE'' then select max(itemname) into v from item where itemcode=k;',
'   when ''LOCATIONCODE'' then select max(locationname) into v from location where locationcode=k;',
'   when ''DOCTYPECODE'' then select max(doctypename) into v from doctype where doctypecode=k;',
'   when ''EMPLOYEECODE'' then select max(employeename) into v from employee where employeecode=k;',
'   when ''ITEMSPECIFICATIONCODE'' then select max(itemspecificationname) into v from itemspecification where itemspecificationcode=k;',
'   else return null;',
'  end case;return v;',
' end;',
' function item_context(p_line varchar2) return varchar2 is begin return case when p_line is not null then ''Detail Line ''||p_line end;end;',
'begin',
' apex_json.initialize_clob_output;',
' apex_json.open_object;',
' if :APP_ID<>105 or :APP_PAGE_ID<>75 or not imart_audit.can_inquire then',
'  apex_json.write(''status'',''restricted'');apex_json.write(''message'',''Audit history access is not granted for this user.'');',
' else',
'  begin select COMPANYCODE,cast(null as varchar2(128)),json_object(''TNO'' value to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')),to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,''''''),json_array(json_object(''t'' value ''MODULEDOCTYPE'',''c'' value ''TNO'',''v'''
||' value to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')),json_object(''t'' value ''MODULEDOCTYPEDETAIL'',''c'' value ''TNO'',''v'' value to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) returning clob) into l_company,l_location,l_record,l_tno,l_links from'
||' MODULEDOCTYPE where TNO=to_number(:P75_TNO default null on conversion error);l_doc:=l_record;',
'  exception when no_data_found then l_doc:=null;when too_many_rows then l_doc:=null;end;',
'  if l_doc is null then apex_json.write(''status'',''empty'');apex_json.write(''message'',''History is available after this record has been saved.'');',
'  elsif imart_audit.can_read(l_company,l_location)<>1 then',
'   apex_json.write(''status'',''restricted'');apex_json.write(''message'',''Audit history access is not granted for this document.'');',
'  else',
'   -- A sequence boundary is not an audit row; authorize only the document''s candidate rows below.',
'   if l_snapshot is null then select nvl(max(audit_event_id),0) into l_snapshot from imart_audit_event;end if;',
'   apex_json.write(''status'',''ok'');apex_json.write(''snapshot'',to_char(l_snapshot));',
'   if l_mode=''LIST'' then',
'    apex_json.open_array(''activities'');',
'    for r in (',
'with links as (',
' select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))',
'), anchor_keys as (',
' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v',
' from links s join imart_audit_event e on e.table_name=s.t',
' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c',
' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v',
'), owned as (',
' select /*+ materialize */ e.* from imart_audit_event e',
' where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')',
' and (',
'  (e.table_name=l_root and json_equal(e.record_key,l_record))',
'  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))',
'  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)',
'  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key',
'   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))',
'        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id',
'        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c',
'        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)',
' )',
'), eligible as (',
' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then',
' rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))',
' else ''EVENT-''||to_char(audit_event_id) end activity_key',
' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1',
')',
'',
'     , grouped as (',
'      select activity_key,max(audit_event_id) sort_id,min(event_timestamp) first_time,max(event_timestamp) last_time,',
'      max(user_name) user_name,max(bossusercode) bossusercode,max(rawtohex(request_id)) request_id,max(transaction_id) transaction_id,',
'      sum(field_count) change_count,',
'      count(*) event_count,',
'      case when max(case when table_name=l_root and action_type=''INSERT'' and event_type=''ROW_CHANGE'' then 1 else 0 end)=1 then ''CREATED''',
'       when max(case when action_type=''APPROVE'' then 1 else 0 end)=1 then ''APPROVED''',
'       when max(case when action_type=''REJECT'' then 1 else 0 end)=1 then ''REJECTED''',
'       when max(case when action_type=''CANCEL'' then 1 else 0 end)=1 then ''CANCELLED''',
'       when max(case when table_name=l_root and action_type=''DELETE'' then 1 else 0 end)=1 then ''DELETED''',
'       when max(case when action_type=''SUBMIT'' then 1 else 0 end)=1 and max(case when event_type=''ROW_CHANGE'' then 1 else 0 end)=0 then ''SUBMITTED''',
'       else ''UPDATED'' end activity_type',
'      from eligible e group by activity_key',
'     ) select * from grouped where (l_filter=''ALL'' or activity_type=l_filter)',
'     and (l_after is null or (l_sort=''NEWEST'' and sort_id<l_after) or (l_sort=''OLDEST'' and sort_id>l_after))',
'     order by case when l_sort=''NEWEST'' then -sort_id else sort_id end fetch first 21 rows only',
'    ) loop',
'     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;',
'     apex_json.open_object;apex_json.write(''key'',r.activity_key);apex_json.write(''cursor'',to_char(r.sort_id));',
'     apex_json.write(''type'',r.activity_type);apex_json.write(''changes'',r.change_count);apex_json.write(''events'',r.event_count);',
'     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));apex_json.write(''login'',r.user_name);',
'     apex_json.write(''time'',to_char(r.first_time at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));',
'     apex_json.write(''lastTime'',to_char(r.last_time at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));',
'     apex_json.write(''request'',r.request_id);apex_json.write(''transaction'',r.transaction_id);apex_json.close_object;',
'    end loop;',
'    apex_json.close_array;apex_json.write(''more'',l_more);',
'   elsif l_mode=''DETAIL'' then',
'    apex_json.open_array(''changes'');',
'    for r in (',
'with links as (',
' select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))',
'), anchor_keys as (',
' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v',
' from links s join imart_audit_event e on e.table_name=s.t',
' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c',
' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v',
'), owned as (',
' select /*+ materialize */ e.* from imart_audit_event e',
' where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')',
' and (',
'  (e.table_name=l_root and json_equal(e.record_key,l_record))',
'  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))',
'  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)',
'  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key',
'   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))',
'        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id',
'        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c',
'        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)',
' )',
'), eligible as (',
' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then',
' rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))',
' else ''EVENT-''||to_char(audit_event_id) end activity_key',
' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1',
')',
'',
'     select c.*,e.action_type,e.record_key,e.event_timestamp,e.user_name,e.bossusercode,e.outcome,',
'     coalesce(json_value(e.record_key,''$.SNO''),(select coalesce(dbms_lob.substr(z.new_value,100,1),dbms_lob.substr(z.old_value,100,1))',
'       from imart_audit_event h join imart_audit_change z on z.audit_event_id=h.audit_event_id',
'       where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'       and h.audit_event_id<=e.audit_event_id and z.column_name=''SNO''',
'       order by h.audit_event_id desc,z.audit_change_id desc fetch first 1 row only)) line_id',
'     from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id',
'     where e.activity_key=l_key and (l_after is null or c.audit_change_id>l_after)',
'     order by c.audit_change_id fetch first 21 rows only',
'    ) loop',
'     l_count:=l_count+1;if l_count>20 then l_more:=true;exit;end if;',
'     apex_json.open_object;apex_json.write(''id'',to_char(r.audit_change_id));apex_json.write(''event'',to_char(r.audit_event_id));',
'     apex_json.write(''table'',r.table_name);apex_json.write(''field'',r.column_name);apex_json.write(''label'',label_for(r.table_name,r.column_name));',
'     apex_json.write(''action'',r.action_type);apex_json.write(''record'',r.record_key);apex_json.write(''line'',r.line_id);',
'     apex_json.write(''item'',item_context(r.line_id));',
'     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));',
'     apex_json.write(''time'',to_char(r.event_timestamp at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));',
'     apex_json.write(''old'',dbms_lob.substr(r.old_value,2000,1));apex_json.write(''new'',dbms_lob.substr(r.new_value,2000,1));',
'     if r.old_state=''VALUE'' and r.capture_mode=''FULL'' then apex_json.write(''oldLabel'',readable(r.column_name,r.old_value));end if;',
'     if r.new_state=''VALUE'' and r.capture_mode=''FULL'' then apex_json.write(''newLabel'',readable(r.column_name,r.new_value));end if;',
'     apex_json.write(''oldState'',r.old_state);apex_json.write(''newState'',r.new_state);apex_json.write(''mode'',r.capture_mode);',
'     apex_json.write(''long'',greatest(nvl(dbms_lob.getlength(r.old_value),0),nvl(dbms_lob.getlength(r.new_value),0))>2000);',
'     apex_json.close_object;',
'    end loop;',
'    apex_json.close_array;apex_json.write(''more'',l_more);',
'    apex_json.open_array(''events'');',
'    for r in (',
'with links as (',
' select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))',
'), anchor_keys as (',
' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v',
' from links s join imart_audit_event e on e.table_name=s.t',
' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c',
' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v',
'), owned as (',
' select /*+ materialize */ e.* from imart_audit_event e',
' where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')',
' and (',
'  (e.table_name=l_root and json_equal(e.record_key,l_record))',
'  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))',
'  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)',
'  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key',
'   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))',
'        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id',
'        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c',
'        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)',
' )',
'), eligible as (',
' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then',
' rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))',
' else ''EVENT-''||to_char(audit_event_id) end activity_key',
' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1',
')',
'',
'     select audit_event_id,action_type,table_name,record_key,outcome,event_type,event_timestamp,remarks,user_name,bossusercode',
'     from eligible e where activity_key=l_key and not exists(select 1 from imart_audit_change c where c.audit_event_id=e.audit_event_id)',
'     order by audit_event_id',
'    ) loop',
'     apex_json.open_object;apex_json.write(''event'',to_char(r.audit_event_id));apex_json.write(''action'',r.action_type);',
'     apex_json.write(''table'',r.table_name);apex_json.write(''record'',r.record_key);apex_json.write(''outcome'',r.outcome);',
'     apex_json.write(''time'',to_char(r.event_timestamp at time zone sessiontimezone,''DD-MM-YYYY HH:MI:SS AM TZH:TZM''));',
'     apex_json.write(''user'',actor_name(r.bossusercode,r.user_name));apex_json.write(''remarks'',r.remarks);apex_json.close_object;',
'    end loop;apex_json.close_array;',
'   elsif l_mode=''VALUE'' then',
'    for r in (',
'with links as (',
' select t,c,v from json_table(l_links,''$[*]'' columns(t varchar2(128) path ''$.t'',c varchar2(128) path ''$.c'',v varchar2(4000) path ''$.v''))',
'), anchor_keys as (',
' select /*+ materialize */ distinct e.table_name,e.record_key_hash,e.record_key,s.c,s.v',
' from links s join imart_audit_event e on e.table_name=s.t',
' join imart_audit_change c on c.audit_event_id=e.audit_event_id and c.column_name=s.c',
' where dbms_lob.substr(c.new_value,4000,1)=s.v or dbms_lob.substr(c.old_value,4000,1)=s.v',
'), owned as (',
' select /*+ materialize */ e.* from imart_audit_event e',
' where e.application_id=105 and e.event_type in (''ROW_CHANGE'',''BUSINESS'') and e.outcome in (''SUCCESS'',''OBSERVED'')',
' and (',
'  (e.table_name=l_root and json_equal(e.record_key,l_record))',
'  or (e.parent_table=l_root and (json_equal(e.parent_key,l_record) or (l_tno is not null and json_value(e.parent_key,''$.TNO'')=l_tno)))',
'  or exists(select 1 from links s where s.t=e.table_name and s.c=''TNO'' and json_value(e.record_key,''$.TNO'')=s.v)',
'  or exists(select 1 from anchor_keys k where k.table_name=e.table_name and k.record_key_hash=e.record_key_hash and k.record_key=e.record_key',
'   and (select coalesce(dbms_lob.substr(c.new_value,4000,1),dbms_lob.substr(c.old_value,4000,1))',
'        from imart_audit_event h join imart_audit_change c on c.audit_event_id=h.audit_event_id',
'        where h.table_name=e.table_name and h.record_key_hash=e.record_key_hash and h.record_key=e.record_key',
'        and h.audit_event_id<=e.audit_event_id and c.column_name=k.c',
'        order by h.audit_event_id desc,c.audit_change_id desc fetch first 1 row only)=k.v)',
' )',
'), eligible as (',
' select e.*,(select count(*) from imart_audit_change c where c.audit_event_id=e.audit_event_id) field_count,case when request_id is not null and transaction_id is not null then',
' rawtohex(standard_hash(rawtohex(request_id)||''|''||transaction_id||''|''||nvl(bossusercode,user_name)||''|''||apex_session_id||''|''||source_type,''SHA256''))',
' else ''EVENT-''||to_char(audit_event_id) end activity_key',
' from owned e where audit_event_id<=l_snapshot and imart_audit.can_read(e.company_code,e.location_code)=1',
')',
'',
'     select c.old_value,c.new_value from eligible e join imart_audit_change c on c.audit_event_id=e.audit_event_id',
'     where e.activity_key=l_key and c.audit_change_id=l_after',
'    ) loop apex_json.write(''old'',r.old_value);apex_json.write(''new'',r.new_value);end loop;',
'   else raise_application_error(-20001,''Unsupported history request'');end if;',
'  end if;',
' end if;',
' apex_json.close_object;l_json:=apex_json.get_clob_output;',
' while l_pos<=dbms_lob.getlength(l_json) loop sys.htp.prn(dbms_lob.substr(l_json,8000,l_pos));l_pos:=l_pos+8000;end loop;',
' apex_json.free_output;',
'exception when others then',
' apex_json.free_output;',
' apex_json.open_object;apex_json.write(''status'',''error'');apex_json.write(''message'',''History could not be loaded. Retry or open Audit Trail.'');apex_json.close_object;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>25268232713899038
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105000752)
,p_process_sequence=>-1000000
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART save receipt begin'
,p_static_id=>'imart-save-receipt-begin'
,p_process_sql_clob=>'declare ack_keys clob;begin select json_array(to_char(:P75_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.begin_v2(:P75_IMART_SAVE_OP_ID,''P75_TNO'',ack_keys);end;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>99061010105000752
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105000753)
,p_process_sequence=>1000000
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART save receipt finish'
,p_static_id=>'imart-save-receipt-finish'
,p_process_sql_clob=>'declare ack_keys clob;begin select json_array(to_char(:P75_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.finish_v2(:P75_IMART_SAVE_OP_ID,ack_keys);end;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Document saved.'
,p_internal_uid=>99061010105000753
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583625864367140287)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(583618271907140282)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Module Doc Type Master'
,p_static_id=>'initialize-form-module-doc-type-master'
,p_internal_uid=>143239519116213763
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(583626263356140287)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(583618271907140282)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Module Doc Type Master'
,p_static_id=>'process-form-module-doc-type-master'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>143239918105213763
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
