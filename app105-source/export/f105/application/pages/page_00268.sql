prompt --application/pages/page_00268
begin
--   Manifest
--     PAGE: 00268
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
 p_id=>268
,p_name=>'ESIC Monthly Report'
,p_alias=>'ESIC-MONTHLY-REPORT'
,p_step_title=>'ESIC Monthly Report'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(393556914767604041)
,p_plug_name=>'ESIC Monthly Report'
,p_static_id=>'esic-monthly-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ROWNUM,',
'    uan,',
'    employeename,',
'    DaysWorked,',
'    esicearning,',
'    esiccontributionemployee,',
'    esiccontributionemployer',
'FROM',
'    (',
'        SELECT',
'             uan,',
'                    employeename,                    ',
'                    sum(nvl(DaysWorked,0)) DaysWorked ,',
'                    sum(nvl(esicearning,0)) esicearning,',
'                    round((sum(nvl(esicearning,0))*0.75)/100,2) esiccontributionemployee,',
'                    round((sum(nvl(esicearning,0))*3.25)/100,2) esiccontributionemployer',
'                   ',
'        FROM',
'            (',
'                SELECT',
'                    c.uan,',
'                    c.employeename,                    ',
'                    b.salaryheadamount AS DaysWorked,',
'                    NULL               AS esicearning,',
'                    NULL               AS esiccontributionemployee,',
'                    null as esiccontributionemployer',
'                FROM',
'                    salary       a,',
'                    salarydetail b,',
'                    employee     c',
'                WHERE',
'                        a.tno = b.tno',
'                    AND a.employeecode = c.employeecode',
'--and a.tno =  54923442',
'                    AND b.salaryheadcode = ''TD''',
'                    and a.SALARYFROMDATE = :P268_FROMDATE',
'                    and a.SALARYTODATE = :P268_TODATE',
'                UNION ALL',
'                SELECT',
'                    c.uan,',
'                    c.employeename,',
'                    NULL               AS DaysWorked,',
'                    case when b.salaryheadamount <=21000 then',
'                    b.salaryheadamount',
'                    else ',
'                    0 ',
'                    end  esicearning,',
'                    null               AS esiccontributionemployee,',
'                    NULL               AS esiccontributionemployer',
'                FROM',
'                    salary       a,',
'                    salarydetail b,',
'                    employee     c',
'                WHERE',
'                        a.tno = b.tno',
'                    AND a.employeecode = c.employeecode',
'--and a.tno =  54923442',
'                    AND b.salaryheadcode = ''GROSSSALARY''',
'                     and a.SALARYFROMDATE = :P268_FROMDATE',
'                    and a.SALARYTODATE = :P268_TODATE',
'              ',
'            )',
'        GROUP BY',
'            uan,',
'            employeename',
'    )'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'ESIC Monthly Report'
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
 p_id=>wwv_flow_imp.id(392245084097563366)
,p_heading=>'Employee Contribution'
,p_static_id=>'employee-contribution'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(392245132253563367)
,p_heading=>'Employer Contribution'
,p_static_id=>'employer-contribution'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(304197116320765653)
,p_name=>'DAYSWORKED'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DAYSWORKED'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Days Worked'
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
 p_id=>wwv_flow_imp.id(392244548037563361)
,p_name=>'EMPLOYEENAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EMPLOYEENAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Name Of Member'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
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
 p_id=>wwv_flow_imp.id(304197338987765655)
,p_name=>'ESICCONTRIBUTIONEMPLOYEE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESICCONTRIBUTIONEMPLOYEE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ESIC Contribution'
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
 p_id=>wwv_flow_imp.id(304197409144765656)
,p_name=>'ESICCONTRIBUTIONEMPLOYER'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESICCONTRIBUTIONEMPLOYER'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>70
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(304197215320765654)
,p_name=>'ESICEARNING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ESICEARNING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'ESIC Earning'
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
 p_id=>wwv_flow_imp.id(392244377121563359)
,p_name=>'ROWNUM'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ROWNUM'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'SL No.'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>10
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
 p_id=>wwv_flow_imp.id(392244500933563360)
,p_name=>'UAN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UAN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'UAN'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>20
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
 p_id=>wwv_flow_imp.id(392244270302563358)
,p_internal_uid=>174743585489344624
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
 p_id=>wwv_flow_imp.id(393561679828608053)
,p_interactive_grid_id=>wwv_flow_imp.id(392244270302563358)
,p_static_id=>'880129'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(393561892725608060)
,p_report_id=>wwv_flow_imp.id(393561679828608053)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(305558221029025961)
,p_view_id=>wwv_flow_imp.id(393561892725608060)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(304197116320765653)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(305559162528025965)
,p_view_id=>wwv_flow_imp.id(393561892725608060)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(304197215320765654)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(305560018702025969)
,p_view_id=>wwv_flow_imp.id(393561892725608060)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(304197338987765655)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(305560816101025976)
,p_view_id=>wwv_flow_imp.id(393561892725608060)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(304197409144765656)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(393562405651608077)
,p_view_id=>wwv_flow_imp.id(393561892725608060)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(392244377121563359)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77.66300000000001
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(393563173018608086)
,p_view_id=>wwv_flow_imp.id(393561892725608060)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(392244500933563360)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>242.674
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(393564055610608089)
,p_view_id=>wwv_flow_imp.id(393561892725608060)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(392244548037563361)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(791693233979097885)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(305553994721016523)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(791693233979097885)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(730985630134402334)
,p_name=>'P268_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(791693233979097885)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(797609018835418586)
,p_name=>'P268_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(791693233979097885)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(791702215544098093)
,p_name=>'P268_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(791693233979097885)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(665351157892722057)
,p_name=>'P268_FORMONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(791693233979097885)
,p_prompt=>'For month'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'FORMONTH'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'additional_outputs', 'FROMDATE:P268_FROMDATE,TODATE:P268_TODATE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796779520839095333)
,p_name=>'P268_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(791693233979097885)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(791702109942098092)
,p_name=>'P268_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(791693233979097885)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(797608852053418585)
,p_name=>'P268_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(791693233979097885)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
