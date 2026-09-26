prompt --application/pages/page_00262
begin
--   Manifest
--     PAGE: 00262
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>262
,p_name=>'PF Monthly Report'
,p_alias=>'PF-MONTHLY-REPORT'
,p_step_title=>'PF Monthly Report'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(713125300664766534)
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
 p_id=>wwv_flow_imp.id(314988981453272690)
,p_plug_name=>'PF Monthly Report'
,p_static_id=>'pf-monthly-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    ROWNUM,',
'    uan,',
'    employeename,',
'    pfearning,',
'    contributionepf,',
'    epfdifference,',
'    pentionfund',
'FROM',
'    (',
'        SELECT',
'            uan,',
'            employeename,',
'            SUM(nvl(pfearning, 0))                                       pfearning,',
'            SUM(nvl(contributionepf, 0))                                 contributionepf,',
'            abs(SUM(nvl(contributionepf, 0)) - ((SUM(nvl(pfearning, 0))*8.33)/100) ) epfdifference,',
'            ((SUM(nvl(pfearning, 0))*8.33)/100  )                                  pentionfund',
'        FROM',
'            (',
'                SELECT',
'                    c.uan,',
'                    c.employeename,',
'                    case when b.salaryheadamount>= 15000 then',
'                    15000',
'                    else',
'                    b.salaryheadamount ',
'                    end AS pfearning,',
'                    NULL               AS contributionepf,',
'                    NULL               AS epfdifference,',
'                    NULL               AS pentionfund',
'                FROM',
'                    salary       a,',
'                    salarydetail b,',
'                    employee     c',
'                WHERE',
'                        a.tno = b.tno',
'                    AND a.employeecode = c.employeecode',
'--and a.tno =  54923442',
'                    AND b.salaryheadcode = ''BASIC''',
'                    and a.SALARYFROMDATE = :P262_FROMDATE',
'                    and a.SALARYTODATE = :P262_TODATE',
'                UNION ALL',
'                SELECT',
'                    c.uan,',
'                    c.employeename,',
'                    NULL               AS pfearning,',
'                    b.salaryheadamount AS contributionepf,',
'                    NULL               AS epfdifference,',
'                    NULL               AS pentionfund',
'                FROM',
'                    salary       a,',
'                    salarydetail b,',
'                    employee     c',
'                WHERE',
'                        a.tno = b.tno',
'                    AND a.employeecode = c.employeecode',
'--and a.tno =  54923442',
'                    AND b.salaryheadcode = ''PFEMPLOYEE''',
'                     and a.SALARYFROMDATE = :P262_FROMDATE',
'                    and a.SALARYTODATE = :P262_TODATE',
'                UNION ALL',
'                SELECT',
'                    c.uan,',
'                    c.employeename,',
'                    NULL               AS pfearning,',
'                    NULL               AS contributionepf,',
'                    NULL               AS epfdifference,',
'                    b.salaryheadamount AS pentionfund',
'                FROM',
'                    salary       a,',
'                    salarydetail b,',
'                    employee     c',
'                WHERE',
'                        a.tno = b.tno',
'                    AND a.employeecode = c.employeecode',
'--and a.tno =  54923442',
'                    AND b.salaryheadcode = ''PFEMPLOYER''',
'                     and a.SALARYFROMDATE = :P262_FROMDATE',
'                    and a.SALARYTODATE = :P262_TODATE',
'            )',
'        GROUP BY',
'            uan,',
'            employeename',
'    )'))
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'PF Monthly Report'
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
 p_id=>wwv_flow_imp.id(313677150783232015)
,p_heading=>'Employee Contribution'
,p_static_id=>'employee-contribution'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(313677198939232016)
,p_heading=>'Employer Contribution'
,p_static_id=>'employer-contribution'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(313676852166232012)
,p_name=>'CONTRIBUTIONEPF'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CONTRIBUTIONEPF'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Contribution EPF'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>50
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(313677150783232015)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_width=>80
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
 p_id=>wwv_flow_imp.id(313676614723232010)
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
,p_item_width=>130
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
 p_id=>wwv_flow_imp.id(313676987891232013)
,p_name=>'EPFDIFFERENCE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'EPFDIFFERENCE'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'EPF Difference'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(313677198939232016)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_width=>80
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
 p_id=>wwv_flow_imp.id(313677007918232014)
,p_name=>'PENTIONFUND'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PENTIONFUND'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Pension Fund <br> 8.33%'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(313677198939232016)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_width=>80
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
 p_id=>wwv_flow_imp.id(313676763065232011)
,p_name=>'PFEARNING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PFEARNING'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'PF Earnings'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>40
,p_value_alignment=>'RIGHT'
,p_group_id=>wwv_flow_imp.id(313677150783232015)
,p_use_group_for=>'BOTH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_item_width=>100
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
 p_id=>wwv_flow_imp.id(313676443807232008)
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
 p_id=>wwv_flow_imp.id(313676567619232009)
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
,p_item_width=>70
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
 p_id=>wwv_flow_imp.id(313676336988232007)
,p_internal_uid=>86695448343546909
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
 p_id=>wwv_flow_imp.id(314993746514276702)
,p_interactive_grid_id=>wwv_flow_imp.id(313676336988232007)
,p_static_id=>'880129'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(314993959411276709)
,p_report_id=>wwv_flow_imp.id(314993746514276702)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314994472337276726)
,p_view_id=>wwv_flow_imp.id(314993959411276709)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(313676443807232008)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>77.66300000000001
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314995239704276735)
,p_view_id=>wwv_flow_imp.id(314993959411276709)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(313676567619232009)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>243.672
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314996122296276738)
,p_view_id=>wwv_flow_imp.id(314993959411276709)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(313676614723232010)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>265.3125
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314997060191276741)
,p_view_id=>wwv_flow_imp.id(314993959411276709)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(313676763065232011)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>170.674
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314997928837276745)
,p_view_id=>wwv_flow_imp.id(314993959411276709)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(313676852166232012)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>183.67
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314998820152276749)
,p_view_id=>wwv_flow_imp.id(314993959411276709)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(313676987891232013)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>185.66
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(314999782901276752)
,p_view_id=>wwv_flow_imp.id(314993959411276709)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(313677007918232014)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(315006716434300869)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(713125300664766534)
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
 p_id=>wwv_flow_imp.id(652412130692070906)
,p_name=>'P262_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(713125300664766534)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(719035519393087158)
,p_name=>'P262_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(713125300664766534)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(713128716101766665)
,p_name=>'P262_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(713125300664766534)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(586777658450390629)
,p_name=>'P262_FORMONTH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(713125300664766534)
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
  'additional_outputs', 'FROMDATE:P262_FROMDATE,TODATE:P262_TODATE',
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(718206021396763905)
,p_name=>'P262_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(713125300664766534)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(713128610499766664)
,p_name=>'P262_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(713125300664766534)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(719035352611087157)
,p_name=>'P262_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(713125300664766534)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(199542485441736405)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(199542872694736405)
,p_event_id=>wwv_flow_imp.id(199542485441736405)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
