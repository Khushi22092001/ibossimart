prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
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
 p_id=>13
,p_name=>'Item Specification Master'
,p_alias=>'ITEM-SPECIFICATION-MASTER'
,p_step_title=>'Item Specification Master'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1055759379779645549)
,p_plug_name=>'CommonFields'
,p_static_id=>'commonfields'
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
 p_id=>wwv_flow_imp.id(712212437803155911)
,p_plug_name=>'Flow Buttons'
,p_static_id=>'flow-buttons'
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
 p_id=>wwv_flow_imp.id(575348770200133724)
,p_plug_name=>'Item'
,p_static_id=>'item'
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
 p_id=>wwv_flow_imp.id(577800164566608476)
,p_plug_name=>'Item Specification Detail'
,p_static_id=>'item-specification-detail'
,p_region_name=>'ITEMDETAIL'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ROWID,',
'       TNO,',
'       SNO,',
'       sn,',
'       ITEMCHARACTERISTICSCODE,',
'       MCVALUESNO,',
'       VALUE,',
'       null as ShortName,',
'       ISCHARACTERISTICSINCLUDE',
'  from ITEMSPECIFICATIONDETAIL',
'  where tno = :P13_ITEMTNO',
'  and sno = :P13_SNO',
'  '))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P13_ITEMTNO,P13_SNO'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Item Specification Detail'
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
 p_id=>wwv_flow_imp.id(577801054973608484)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(577801087045608485)
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
 p_id=>wwv_flow_imp.id(33752397078252301)
,p_name=>'ISCHARACTERISTICSINCLUDE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ISCHARACTERISTICSINCLUDE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Ischaracteristicsinclude'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
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
,p_default_type=>'ITEM'
,p_default_expression=>'P13_ISCHARACTERISTICSINCLUDE'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(577800648525608480)
,p_name=>'ITEMCHARACTERISTICSCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ITEMCHARACTERISTICSCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Item Characteristics'
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
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' Select',
'     ITEMCHARACTERISTICSNAME,',
'     ITEMCHARACTERISTICSCODE',
'From ITEMCHARACTERISTICS ',
'where ITEMCHARACTERISTICSCODE in ',
'    (',
'        select distinct ITEMCHARACTERISTICSCODE from itemdetail',
'        where tno = :P13_ITEMTNO',
'    )',
''))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P13_ITEMTNO'
,p_ajax_optimize_refresh=>false
,p_static_id=>'ITEMCHARACTERISTICSCODE'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(577800686208608481)
,p_name=>'MCVALUESNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MCVALUESNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Value'
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
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'     VALUE,',
'     SNO',
'From MCValue a, ITEMCHARACTERISTICS b',
'Where a.Tno = b.TNo',
' and b.ITEMCHARACTERISTICSCode = :ITEMCHARACTERISTICSCODE'))
,p_lov_display_extra=>true
,p_lov_display_null=>false
,p_lov_cascade_parent_items=>'ITEMCHARACTERISTICSCODE'
,p_ajax_items_to_submit=>'MCVALUESNO,ITEMCHARACTERISTICSCODE'
,p_ajax_optimize_refresh=>false
,p_static_id=>'MCVALUESNO'
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(577800893044608483)
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
 p_id=>wwv_flow_imp.id(584719540140205190)
,p_name=>'SHORTNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SHORTNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(290738070570788310)
,p_name=>'SN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SN'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Sn'
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
 p_id=>wwv_flow_imp.id(577800507455608479)
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
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(577800364786608478)
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
,p_default_type=>'ITEM'
,p_default_expression=>'P13_ITEMTNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(577800763587608482)
,p_name=>'VALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'VALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>500
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
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(577800287994608477)
,p_internal_uid=>144955432552384703
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
 p_id=>wwv_flow_imp.id(577806505535627064)
,p_interactive_grid_id=>wwv_flow_imp.id(577800287994608477)
,p_static_id=>'1449617'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(577806668987627066)
,p_report_id=>wwv_flow_imp.id(577806505535627064)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(33761826628254738)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(33752397078252301)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(293716635644237232)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(290738070570788310)
,p_is_visible=>false
,p_is_frozen=>false
,p_sort_order=>1
,p_sort_direction=>'ASC'
,p_sort_nulls=>'LAST'
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(577807156769627068)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(577800364786608478)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(577808081225627071)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(577800507455608479)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(577809020035627073)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(577800648525608480)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>347
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(577809896369627076)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(577800686208608481)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(577810773844627078)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(577800763587608482)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(577811693128627080)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(577800893044608483)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(577813500253627852)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(577801054973608484)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>40
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(584761410859697353)
,p_view_id=>wwv_flow_imp.id(577806668987627066)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(584719540140205190)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(202876510095379998)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
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
 p_id=>wwv_flow_imp.id(577820353975677388)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
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
 p_id=>wwv_flow_imp.id(577821467248677388)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>'P13_FORMSTATUS'
,p_button_condition2=>'NEWRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(577820663227677388)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
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
,p_button_condition=>'P13_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(577822340657677389)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_condition=>'P13_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(577822713535677389)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P13_TNO.'
,p_button_condition=>'P13_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(577821935294677388)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition=>'P13_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(577819871773677388)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_button_condition=>'P13_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(577821148425677388)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>'P13_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(577823133990677389)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(712212437803155911)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_static_id=>'STATUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P3_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>'P13_FORMSTATUS'
,p_button_condition2=>'EDITRECORD'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(577801761411608492)
,p_branch_name=>'Go To Page 20'
,p_branch_action=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(577820663227677388)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1047580666088020382)
,p_name=>'P13_CALLEDFROMPAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1055759379779645549)
,p_item_default=>'20'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1049863784560588120)
,p_name=>'P13_FORMSTATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1055759379779645549)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(598663823931545086)
,p_name=>'P13_HSNCODE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select hsncode  from itemspecification',
'where tno = :P13_ITEMTNO',
'and sno = :P13_SNO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Hsn Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P13_HSNCODE'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>35
,p_colspan=>4
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
  'width', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(436409351481585181)
,p_name=>'P13_ISCHARACTERISTICSINCLUDE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_item_default=>'NO'
,p_prompt=>'Is Characteristics Name Include'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(577804045576608514)
,p_name=>'P13_ITEMCHARACTERISTICS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(577800089498608475)
,p_name=>'P13_ITEMTNO'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select itemname , tno from item'
,p_cSize=>30
,p_colspan=>4
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
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(577804461368608519)
,p_name=>'P13_MCVALUE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(577802531945608499)
,p_name=>'P13_MFACTOR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Multiplyingfactor from itemspecification',
'where tno = :P13_ITEMTNO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Multiplying Factor'
,p_format_mask=>'999999999.999'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1057658766559133714)
,p_name=>'P13_MODULEFLOW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(1055759379779645549)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1057658673469133713)
,p_name=>'P13_ONTHETABLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1055759379779645549)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1057590591596994281)
,p_name=>'P13_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1055759379779645549)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452945499601088577)
,p_name=>'P13_SEPARATER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_prompt=>'Separater'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'STATIC::;:,-;-,X;X'
,p_cSize=>30
,p_colspan=>4
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
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33753391532252311)
,p_name=>'P13_SKU'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select sku  from itemspecification',
'where tno = :P13_ITEMTNO',
'and sno = :P13_SNO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'SKU'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(577803360795608508)
,p_name=>'P13_SNO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(1055759379779645549)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(577803069059608505)
,p_name=>'P13_SPECIFICATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select itemspecificationname  from itemspecification',
'where tno = :P13_ITEMTNO',
'and sno = :P13_SNO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>100
,p_cMaxlength=>100
,p_cHeight=>5
,p_tag_attributes=>'readonly=true'
,p_colspan=>8
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(584719406060205189)
,p_name=>'P13_SPECIFICATIONCODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select itemspecificationcode  from itemspecification',
'where tno = :P13_ITEMTNO',
'and sno = :P13_SNO'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Specification Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>200
,p_tag_attributes=>'readonly=true'
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(490135939335170667)
,p_name=>'P13_STATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(1055759379779645549)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1057590427951994280)
,p_name=>'P13_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1055759379779645549)
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
 p_id=>wwv_flow_imp.id(577802319664608497)
,p_name=>'P13_UNIT1'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MEASURINGUNITNAME from MEASURINGUNIT',
'where MEASURINGUNITCODE in ',
'(select MEASURINGUNITCODE1 from item where tno = :P13_ITEMTNO)'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'UNIT 1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select MEASURINGUNITNAME , MEASURINGUNITCODE from MEASURINGUNIT'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(577802431733608498)
,p_name=>'P13_UNIT2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(575348770200133724)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select MEASURINGUNITNAME from MEASURINGUNIT',
'where MEASURINGUNITCODE in ',
'(select MEASURINGUNITCODE2 from item where tno = :P13_ITEMTNO)'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'UNIT 2'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'select MEASURINGUNITNAME , MEASURINGUNITCODE from MEASURINGUNIT'
,p_cSize=>30
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(584719243690205187)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(577820353975677388)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(584719259068205188)
,p_event_id=>wwv_flow_imp.id(584719243690205187)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'delete from ITEMSPECIFICATIONDETAIL a',
    'where not exists (select 1 from ITEMSPECIFICATION aa where aa.tno = a.tno);')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577835217538724794)
,p_name=>'DISABLE DELETE UPDATE IF STATUS IS ACTIVE'
,p_static_id=>'disable-delete-update-if-status-is-active'
,p_event_sequence=>70
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577835567531724794)
,p_event_id=>wwv_flow_imp.id(577835217538724794)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577820663227677388)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577836119852724794)
,p_event_id=>wwv_flow_imp.id(577835217538724794)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577820663227677388)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P13_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577836578228724794)
,p_event_id=>wwv_flow_imp.id(577835217538724794)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577820663227677388)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.DELETEPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577840071880728110)
,p_name=>'Disable Print Button'
,p_static_id=>'disable-print-button'
,p_event_sequence=>100
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577840973055728110)
,p_event_id=>wwv_flow_imp.id(577840071880728110)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577819871773677388)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577840520700728110)
,p_event_id=>wwv_flow_imp.id(577840071880728110)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577819871773677388)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.PRINTPRIVILEGE= ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577836970502725813)
,p_name=>'DISABLE SAVE BUTTON FOR UPDATEPRIVILLEGE'
,p_static_id=>'disable-save-button-for-updateprivillege'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577837939667725813)
,p_event_id=>wwv_flow_imp.id(577836970502725813)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577821148425677388)
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
'   AND A.UPDATEPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577837397287725813)
,p_event_id=>wwv_flow_imp.id(577836970502725813)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577821148425677388)
,p_server_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_server_condition_expr1=>'P13_STATUS'
,p_server_condition_expr2=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577838403513725815)
,p_event_id=>wwv_flow_imp.id(577836970502725813)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577821148425677388)
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
'   AND A.UPDATEPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577838822722727135)
,p_name=>'Disable Status Button'
,p_static_id=>'disable-status-button'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577839725078727136)
,p_event_id=>wwv_flow_imp.id(577838822722727135)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577823133990677389)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''NO'''))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577839167187727135)
,p_event_id=>wwv_flow_imp.id(577838822722727135)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577823133990677389)
,p_server_condition_type=>'EXISTS'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1 From MODULEPRIVILEGE A',
' Where A.MODULECODE = GetModuleCodeForPageNo(:APP_PAGE_ID)',
'   And a.bossusercode = :GLOBAL_BOSSUSERCODE',
'   AND A.STATUSPRIVILEGE = ''YES'''))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577829290066691171)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(577823133990677389)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577832162794691172)
,p_event_id=>wwv_flow_imp.id(577829290066691171)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P13_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577831718804691171)
,p_event_id=>wwv_flow_imp.id(577829290066691171)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P13_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577830203687691171)
,p_event_id=>wwv_flow_imp.id(577829290066691171)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P13_ITEMTNO,P13_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P13_ITEMTNO,:P13_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577830700593691171)
,p_event_id=>wwv_flow_imp.id(577829290066691171)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P13_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(490135996933170668)
,p_event_id=>wwv_flow_imp.id(577829290066691171)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577823133990677389)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'location.reload()',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577831207017691171)
,p_event_id=>wwv_flow_imp.id(577829290066691171)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(712212437803155911)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577829721069691171)
,p_event_id=>wwv_flow_imp.id(577829290066691171)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577833428217695073)
,p_name=>'Enable Disable Pass/Fail/Flow'
,p_static_id=>'enable-disable-pass-fail-flow'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577833803816695074)
,p_event_id=>wwv_flow_imp.id(577833428217695073)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577821935294677388)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P13_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577834269351695074)
,p_event_id=>wwv_flow_imp.id(577833428217695073)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577822340657677389)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P13_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577834777905695074)
,p_event_id=>wwv_flow_imp.id(577833428217695073)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(577822713535677389)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P13_MODULEFLOW'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577827536594689497)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(577822340657677389)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577828438072689498)
,p_event_id=>wwv_flow_imp.id(577827536594689497)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P13_TNO,P13_COMPANYCODE,P13_PURCHASEORDERNO',
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
 p_id=>wwv_flow_imp.id(577828856148689498)
,p_event_id=>wwv_flow_imp.id(577827536594689497)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577827911873689498)
,p_event_id=>wwv_flow_imp.id(577827536594689497)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577832624989693007)
,p_name=>'Go Back To Called Form'
,p_static_id=>'go-back-to-called-form'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(577820353975677388)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577833020680693007)
,p_event_id=>wwv_flow_imp.id(577832624989693007)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P13_CALLEDFROMPAGE'').getValue();',
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
 p_id=>wwv_flow_imp.id(577804596388608520)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>160
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_ITEMCHARACTERISTICS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577804733947608521)
,p_event_id=>wwv_flow_imp.id(577804596388608520)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_SPECIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P13_SPECIFICATION,P13_ITEMCHARACTERISTICS',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select :P13_SPECIFICATION||ITEMCHARACTERISTICSNAME||'':''',
    'from ITEMCHARACTERISTICS',
    'where ITEMCHARACTERISTICSCODE = :P13_ITEMCHARACTERISTICS')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577804785811608522)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>170
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_MCVALUE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577804890442608523)
,p_event_id=>wwv_flow_imp.id(577804785811608522)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_SPECIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P13_SPECIFICATION,P13_MCVALUE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select :P13_SPECIFICATION||VALUE||'';'' from mcvalue  ',
    'where sno = :P13_MCVALUE')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577825681097680721)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(577821935294677388)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577826638351680727)
,p_event_id=>wwv_flow_imp.id(577825681097680721)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P13_TNO,P13_COMPANYCODE',
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
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577827091797680727)
,p_event_id=>wwv_flow_imp.id(577825681097680721)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577826088115680722)
,p_event_id=>wwv_flow_imp.id(577825681097680721)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P163_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(584718920413205184)
,p_name=>'Set ITEMSPECIFICATIONDETAIL'
,p_static_id=>'set-itemspecificationdetail'
,p_event_sequence=>210
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_ITEMTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(584718994481205185)
,p_event_id=>wwv_flow_imp.id(584718920413205184)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P13_SNO,P13_ITEMTNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '    tmp number:=0;',
    '    tmp1 number:=0;',
    'begin',
    '',
    '    /*delete from ITEMSPECIFICATIONDETAIL a',
    '    where not exists (select 1 from ITEMSPECIFICATION aa where aa.tno = a.tno); */',
    '',
    '    select count(*) into tmp from ITEMSPECIFICATIONDETAIL ',
    '    where tno = :P13_ITEMTNO ',
    '    and sno = :P13_SNO ',
    '    and MCVALUESNO is null',
    '    and VALUE is null;',
    '',
    '    select count(*) into tmp1 from ITEMSPECIFICATIONDETAIL ',
    '    where tno = :P13_ITEMTNO ',
    '    and sno = :P13_SNO ',
    '    and MCVALUESNO is not null',
    '    and VALUE is not null;',
    '',
    '    if tmp =0 and tmp1=0 then',
    '',
    '        insert into ITEMSPECIFICATIONDETAIL',
    '        (',
    '            tno,',
    '            sno,',
    '            sn,',
    '            ITEMCHARACTERISTICSCODE   ',
    '        )',
    '        (',
    '            select ',
    '                tno,',
    '                :P13_SNO,',
    '                globaltno.nextval,',
    '                ITEMCHARACTERISTICSCODE',
    '            from ItemDetail',
    '            where ',
    '                tno = :P13_ITEMTNO',
    '        );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(584719137887205186)
,p_event_id=>wwv_flow_imp.id(584718920413205184)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(577800164566608476)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577802756430608502)
,p_name=>'set mfactor'
,p_static_id=>'set-mfactor'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_ITEMTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577802950409608503)
,p_event_id=>wwv_flow_imp.id(577802756430608502)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_MFACTOR,P13_SPECIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P13_ITEMTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select Multiplyingfactor , itemspecificationname from itemspecification',
    'where tno = :P13_ITEMTNO',
    'and sno = :P13_SNO',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577804124176608515)
,p_name=>'set p13_new'
,p_static_id=>'set-p13-new'
,p_event_sequence=>140
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(577800164566608476)
,p_triggering_element=>'ITEMCHARACTERISTICSCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577804234912608516)
,p_event_id=>wwv_flow_imp.id(577804124176608515)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_ITEMCHARACTERISTICS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'ITEMCHARACTERISTICSCODE,P13_ITEMCHARACTERISTICS',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '',
    'BEGIN',
    '    IF :ITEMCHARACTERISTICSCODE IS NOT NULL THEN',
    '        --RETURN(:P13_ITEMCHARACTERISTICS||:ITEMCHARACTERISTICSCODE||'':'' );',
    '        RETURN(:ITEMCHARACTERISTICSCODE );',
    '    END IF;',
    '',
    'END;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577804291743608517)
,p_name=>'Set p13_new_1'
,p_static_id=>'set-p13-new-2'
,p_event_sequence=>150
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(577800164566608476)
,p_triggering_element=>'MCVALUESNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577804404251608518)
,p_event_id=>wwv_flow_imp.id(577804291743608517)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_MCVALUE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'MCVALUESNO,P13_MCVALUE',
  'plsql_function_body', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '',
    'BEGIN',
    '  IF :MCVALUESNO IS NOT  NULL THEN',
    '     --RETURN(:P13_MCVALUE||:MCVALUESNO||'':'') ;',
    '     RETURN(:MCVALUESNO) ;',
    '  END IF;',
    'END;')),
  'suppress_change_event', 'N',
  'type', 'FUNCTION_BODY')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577803459655608509)
,p_name=>'Set Specification'
,p_static_id=>'set-specification'
,p_event_sequence=>130
,p_triggering_element_type=>'COLUMN'
,p_triggering_region_id=>wwv_flow_imp.id(577800164566608476)
,p_triggering_element=>'MCVALUESNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577803652036608510)
,p_event_id=>wwv_flow_imp.id(577803459655608509)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var model = apex.region("ITEMDETAIL").widget().interactiveGrid("getViews", "grid").model;',
    'var result;',
    'var amtKey = model.getFieldKey("ITEMCHARACTERISTICSCODE");',
    'model.forEach(function(r) ',
    '    {',
    '        var n_amount = parseInt(r[amtKey], 10);',
    '        //var n_key = model.getValue(r,''ITEMCHARACTERISTICSCODE'');',
    '        //var n_key1 = model.getValue(r,''MCVALUESNO'');',
    '        //result = n_key + ":" + n_key1 + ";" ;',
    '',
    '        ',
    '        //String(ratekey);',
    '        alert(n_amount);',
    '        ',
    '    }',
    ');',
    '',
    '//$s(''P13_SPECIFICATION'',result);')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577803745013608511)
,p_event_id=>wwv_flow_imp.id(577803459655608509)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_SPECIFICATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(584719811457205193)
,p_name=>'Set Specs_1'
,p_static_id=>'set-specs'
,p_event_sequence=>200
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(577800164566608476)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(584719897698205194)
,p_event_id=>wwv_flow_imp.id(584719811457205193)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget      = apex.region(''ITEMDETAIL'').widget();',
    'var grid        = widget.interactiveGrid(''getViews'',''grid'');  ',
    'var model       = grid.model; ',
    'var jsonData     = [];',
    '',
    'model.forEach(function(r) {',
    '    var record = r;',
    '    var value1 = model.getValue(record,''TNO'');',
    '    var value2 = model.getValue(record,''SNO'');',
    '   ',
    '    jsonData.push(record);',
    '',
    '',
    '})',
    '//console.log(jsonData);',
    '',
    'var extractedData = [];',
    '',
    'jsonData.forEach(function(record) {',
    '  var ansValue = "";',
    '  ',
    '  record.forEach(function(cell, columnIndex) {',
    '',
    '    if (columnIndex == 4 ) {',
    '      extractedData.push(cell);',
    '    }',
    '  });',
    '});',
    '',
    '',
    'var output = extractedData.join("-");',
    '',
    '$s(''P13_SPECIFICATIONCODE'',output);',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(490136089735170669)
,p_name=>'Set Specs on lose focus'
,p_static_id=>'set-specs-on-lose-focus'
,p_event_sequence=>190
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(577800164566608476)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(490136278624170670)
,p_event_id=>wwv_flow_imp.id(490136089735170669)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var widget      = apex.region(''ITEMDETAIL'').widget();',
    'var grid        = widget.interactiveGrid(''getViews'',''grid'');  ',
    'var model       = grid.model; ',
    'var jsonData     = [];',
    'var sp = apex.item(''P13_SEPARATER'').getValue();',
    '',
    'model.forEach(function(r) {',
    '    var record = r;',
    '    var value1 = model.getValue(record,''TNO'');',
    '    var value2 = model.getValue(record,''SNO'');',
    '   ',
    '    jsonData.push(record);',
    '',
    '',
    '})',
    '',
    '',
    'var extractedData = [];',
    '',
    'jsonData.forEach(function(record) {',
    '  var ansValue = "";',
    '  ',
    '  record.forEach(function(cell, columnIndex) {',
    '      if (apex.item(''P13_ISCHARACTERISTICSINCLUDE'').getValue()==''YES'')',
    '            {',
    '                    if (columnIndex == 2) {',
    '                    ansValue = cell.d + sp;',
    '                    }',
    '            }',
    '       ',
    '    if (columnIndex == 3 ) {',
    '      extractedData.push(ansValue +  cell.d);',
    '    }',
    '  });',
    '});',
    '',
    'var output = extractedData.join(sp);',
    '',
    '$s(''P13_SPECIFICATION'',output);',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(577802614408608500)
,p_name=>'set unit1 and unit2'
,p_static_id=>'set-unit1-and-unit'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_ITEMTNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(577802690763608501)
,p_event_id=>wwv_flow_imp.id(577802614408608500)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_UNIT1,P13_UNIT2'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P13_ITEMTNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select MEASURINGUNITCODE1 , MEASURINGUNITCODE2 from item',
    'where tno = :P13_ITEMTNO')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(492281087209890449)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'check specification before delete'
,p_static_id=>'check-specification-before-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tmp number :=0;',
'begin',
'    select count(*) into tmp',
'    from indentdetail  ',
'    where itemspecificationcode = :P13_SPECIFICATIONCODE;',
'',
'    if tmp>0 then',
'        raise_application_error(-20000 , ''Specification Cannot be deleted.'');',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(577820663227677388)
,p_internal_uid=>60837707818895215
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(577802192913608496)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Item Spec Detail'
,p_static_id=>'delete-item-spec-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from itemSpecificationdetail ',
'where tno = :P13_ITEMTNO',
'and sno = :P13_SNO;',
'',
'delete from itemSpecification',
'where tno = :P13_ITEMTNO',
'and sno = :P13_SNO;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(577820663227677388)
,p_internal_uid=>144957337471384722
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(577847375948782550)
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
'       :P13_MODULEFLOW := ''YES'';',
'   else',
'       :P13_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P71_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P13_ONTHETABLE := ''YES'' ;',
'   else',
'       :P13_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>145002520506558776
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(577847137725781642)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'gettno'
,p_static_id=>'gettno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P13_ITEMTNO IS NULL then',
'    :P13_FORMSTATUS := ''NEWRECORD'';',
'    select globaltno.nextval into :P13_SPECIFICATIONCODE from dual;',
'  else ',
'    :P13_FORMSTATUS := ''EDITRECORD'';',
'end if;',
'',
'if :P13_SNO is null then',
'    :P13_SNO := globaltno.nextval;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>145002282283557868
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(577801207528608486)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(577800164566608476)
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Item Specification Detail - Save Interactive Grid Data'
,p_static_id=>'item-specification-detail-save-interactive-grid-data'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Begin',
'    case :APEX$ROW_STATUS',
'        when ''C'' then',
'            Insert Into itemSpecificationdetail (                 ',
'                    TNO,',
'                    SNO,',
'                    sn,',
'                    ITEMCHARACTERISTICSCODE,',
'                    MCVALUESNO,',
'                    ISCHARACTERISTICSINCLUDE,',
'                    VALUE',
'            )',
'            Values (',
'                :P13_ITEMTNO,',
'                :P13_SNO,',
'                globaltno.nextval,',
'                :ITEMCHARACTERISTICSCODE,',
'                :MCVALUESNO,',
'                :P13_ISCHARACTERISTICSINCLUDE,',
'                :VALUE',
'',
'            );',
'        ',
'        when ''U'' then',
'            update itemSpecificationdetail Set',
'                 TNO=:TNO,',
'                    SNO=:SNO,',
'                    ITEMCHARACTERISTICSCODE=:ITEMCHARACTERISTICSCODE,',
'                    MCVALUESNO=:MCVALUESNO,',
'                    ISCHARACTERISTICSINCLUDE=:P13_ISCHARACTERISTICSINCLUDE,',
'                    VALUE=:VALUE',
'            WHERE TNO = :P13_ITEMTNO',
'              and rowid = :ROWID;',
'',
'        when ''D'' then',
'            Delete From itemSpecificationdetail',
'            Where TNo = :P13_ITEMTNO',
'              and SNO = :SNO',
'              and ITEMCHARACTERISTICSCODE = :ITEMCHARACTERISTICSCODE',
'              ;',
'    end case;',
'exception when others then',
'    raise_application_error(-20010, sqlerrm);',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>144956352086384712
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(577841676451734139)
,p_process_sequence=>30
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
,p_internal_uid=>144996821009510365
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(577841427741732771)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P13_ITEMTNO, :P13_ITEMTNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(577821467248677388)
,p_internal_uid=>144996572299508997
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(438243021285653764)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set ischaracteristicsinclude '
,p_static_id=>'set-ischaracteristicsinclude'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P13_ITEMTNO is not null then',
'    select ischaracteristicsinclude , sku ',
'       into :P13_ischaracteristicsinclude, :P13_SKU',
'      from itemspecification ',
'     where tno = :P13_ITEMTNO',
'       and sno = :P13_SNO;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6799641894658530
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(598663941242545087)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Mfactor befor Insert'
,p_static_id=>'set-mfactor-befor-insert'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P13_UNIT1 is null or :P13_UNIT2 is null then',
'    :P13_MFACTOR := 0;',
'end if;',
'',
'if :P13_UNIT1 is not null and  :P13_UNIT2 is not null then',
'    if :P13_MFACTOR is null then',
'        raise_application_error(-20000 , ''Kindly Provide Multiplying Factor'');',
'    end if;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>165819085800321313
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(577803005149608504)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Specification'
,p_static_id=>'set-specification'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare ',
'    tmp number;',
'begin',
'    --select count(*) into tmp from itemspecification where tno = :P13_ITEMTNO;',
'    if :P13_FORMSTATUS = ''EDITRECORD'' then',
'',
'        update itemspecification set multiplyingfactor = :P13_MFACTOR , hsncode = :P13_HSNCODE,',
'               ischaracteristicsinclude = :P13_ischaracteristicsinclude, sku = :P13_SKU',
'        where tno = :P13_ITEMTNO',
'        and sno = :P13_SNO;',
'        DECLARE ',
'              v_Specification VARCHAR2(500);',
'              v_Specification2 VARCHAR2(500);',
'        BEGIN',
'              FOR vloop IN (',
'                SELECT ic.ITEMCHARACTERISTICSNAME || '': '' || m.VALUE as vResult',
'                FROM ItemspecificationDetail a, MCValue m, ITEMCHARACTERISTICS ic',
'                WHERE a.TNo = :P13_ITEMTNO',
'                  and a.sno = :P13_SNO',
'                  AND a.MCVALUESNO = m.SNo',
'                  and a.ITEMCHARACTERISTICSCODE = ic.ITEMCHARACTERISTICSCODE',
'                  order by a.sno',
'              )',
'              LOOP',
'                v_Specification := vloop.vResult;',
'                v_Specification2 := CASE WHEN v_Specification2 IS NULL THEN v_Specification ELSE v_Specification2 || '' ; '' || v_Specification END;',
'              END LOOP;',
'              UPDATE itemspecification SET itemSPECIFICATIONname = :P13_SPECIFICATION , itemspecificationcode = :P13_SPECIFICATIONCODE',
'              where TNO = :P13_ITEMTNO',
'              and sno = :P13_SNO;',
'        END;  ',
'    else',
'        insert into itemspecification ',
'        (',
'            tno,',
'            sno,',
'            itemspecificationcode,',
'            itemspecificationname,',
'            multiplyingfactor,',
'            hsncode,',
'            sku',
'        )',
'        values',
'        (',
'            :P13_ITEMTNO,',
'            :P13_SNO,',
'            globaltno.nextval,',
'            null,',
'            :P13_MFACTOR,',
'            :P13_HSNCODE,',
'            :P13_SKU',
'        );',
'',
'        DECLARE ',
'              v_Specification VARCHAR2(500);',
'              v_Specification2 VARCHAR2(500);',
'        BEGIN',
'              FOR vloop IN (',
'                SELECT ic.ITEMCHARACTERISTICSNAME || '': '' || m.VALUE as vResult',
'                FROM ItemspecificationDetail a, MCValue m, ITEMCHARACTERISTICS ic',
'                WHERE a.TNo = :P13_ITEMTNO',
'                  and a.sno = :P13_SNO',
'                  AND a.MCVALUESNO = m.SNo',
'                  and a.ITEMCHARACTERISTICSCODE = ic.ITEMCHARACTERISTICSCODE',
'                  order by a.sno',
'              )',
'              LOOP',
'                v_Specification := vloop.vResult;',
'                v_Specification2 := CASE WHEN v_Specification2 IS NULL THEN v_Specification ELSE v_Specification2 || '' ; '' || v_Specification END;',
'              END LOOP;',
'              UPDATE itemspecification SET itemSPECIFICATIONname = :P13_SPECIFICATION , itemspecificationcode = :P13_SPECIFICATIONCODE',
'              where TNO = :P13_ITEMTNO',
'              and sno = :P13_SNO;',
'        END; ',
'',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>144958149707384730
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(201861531753982963)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update item specification name_1'
,p_static_id=>'update-item-specification-name'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'tspecname Varchar2(4000);',
'Begin',
'	For iSpec In (',
'	Select  b.ISCHARACTERISTICSINCLUDE,',
'               a.itemcharacteristicscode,',
'			   c.value',
'          From itemspecificationdetail a, ItemSpecification b, mcvalue c',
'         Where a.tno = b.tno',
'           And a.sno = b.sno',
'		   And a.mcvaluesno = c.sno',
'           And a.sno = v(''P13_SNO'')',
'         order by a.sn',
'	',
'	) Loop',
'       --',
'        If NVL(iSPec.ISCHARACTERISTICSINCLUDE,''NO'') = ''YES'' Then',
'			 If tspecname is null  Then',
'		      tspecname := ispec.itemcharacteristicscode||''-''||ispec.value||v(''P13_SEPARATER'');',
'			 Else',
'			    tspecname := tspecname||ispec.itemcharacteristicscode||''-''||ispec.value||v(''P13_SEPARATER'');',
'			 End If;',
'		Else',
'',
'		    If tspecname is null Then',
'',
'                tspecname := ispec.value||v(''P13_SEPARATER'');',
'           -- RAISE_APPLICATION_ERROR(-20005,'' ''||ispec.value||v(''P13_SEPARATER'')||''SpecName ''||tspecname||''T ''||V(''P13_ITEMTNO'')||'' s ''||v(''P13_SNO'')||'' l ''||Length(tspecname)||'' ischa ''||NVL(iSPec.ISCHARACTERISTICSINCLUDE,''NO''));',
'',
'            Else',
'                tspecname := tspecname||ispec.value||v(''P13_SEPARATER'');',
'            End If;',
'		End If;',
'        mytestlog(v(''P13_SNO'')||''-''||tspecname);',
'	End Loop;',
'	Update ItemSpecification x',
'	   Set ItemspecificationName = SUBSTR(tspecname,1,100),',
'           CREATOR = :GLOBAL_LOGINNAME',
'	 Where x.tno = v(''P13_ITEMTNO'')',
'	   And X.SNO = V(''P13_SNO'');',
'End;  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>9879615489279042
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(290736953661788299)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'update item specification name'
,p_static_id=>'update-item-specification-name-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Declare',
'tspecname Varchar2(4000);',
'Begin',
'	For iSpec In (',
'	Select  b.ISCHARACTERISTICSINCLUDE,',
'               a.itemcharacteristicscode,',
'			   c.value',
'          From itemspecificationdetail a, ItemSpecification b, mcvalue c',
'         Where a.tno = b.tno',
'           And a.sno = b.sno',
'		   And a.mcvaluesno = c.sno',
'           And a.sno = v(''P13_SNO'')',
'         order by a.sn',
'	',
'	) Loop',
'       --',
'        If NVL(iSPec.ISCHARACTERISTICSINCLUDE,''NO'') = ''YES'' Then',
'			 If tspecname is null  Then',
'		      tspecname := ispec.itemcharacteristicscode||''-''||ispec.value;',
'			 Else',
'			    tspecname := tspecname||v(''P13_SEPARATER'')||ispec.itemcharacteristicscode||''-''||ispec.value;',
'			 End If;',
'		Else',
'',
'		    If tspecname is null Then',
'',
'                tspecname := ispec.value;',
'           -- RAISE_APPLICATION_ERROR(-20005,'' ''||ispec.value||v(''P13_SEPARATER'')||''SpecName ''||tspecname||''T ''||V(''P13_ITEMTNO'')||'' s ''||v(''P13_SNO'')||'' l ''||Length(tspecname)||'' ischa ''||NVL(iSPec.ISCHARACTERISTICSINCLUDE,''NO''));',
'',
'            Else',
'                tspecname := tspecname||v(''P13_SEPARATER'')||ispec.value;',
'            End If;',
'		End If;',
'        mytestlog(v(''P13_SNO'')||''-''||tspecname);',
'	End Loop;',
'	Update ItemSpecification x',
'	   Set ItemspecificationName = SUBSTR(tspecname,1,100),',
'           CREATOR = :GLOBAL_LOGINNAME',
'	 Where x.tno = v(''P13_ITEMTNO'')',
'	   And X.SNO = V(''P13_SNO'');',
'End;  '))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>80777758657272315
);
wwv_flow_imp.component_end;
end;
/
