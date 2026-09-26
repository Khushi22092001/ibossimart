prompt --application/pages/page_00253
begin
--   Manifest
--     PAGE: 00253
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>253
,p_name=>'Hire to Retire'
,p_alias=>'HIRE-TO-RETIRE'
,p_step_title=>'Hire to Retire'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#iBOSS Custom Templates Classes#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NO1 .t-Region-headerIcon .t-Icon {',
'    color: white;',
'    background-color: var(--u-color-25);',
'    border-radius: 10px;',
'}',
'',
'#NO2 .t-Region-headerIcon .t-Icon {',
'    color: white;',
'    background-color: var(--u-color-26);',
'    border-radius: 10px;',
'}',
'',
'#NO3 .t-Region-headerIcon .t-Icon {',
'    color: white;',
'    background-color: var(--u-color-27);',
'    border-radius: 10px;',
'}',
'',
'#NO4 .t-Region-headerIcon .t-Icon {',
'    color: white;',
'    background-color: var(--u-color-28);',
'    border-radius: 10px;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(475493253761674257)
,p_name=>'ATTENDANCE CARD'
,p_static_id=>'attendance-card'
,p_parent_plug_id=>wwv_flow_imp.id(475492812207674253)
,p_template=>2072724515482255512
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ATTENDENCE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:631:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Attendance''                as LIST_TITLE,',
'    ''fa fa-calendar-plus-o''     as ICON_CLASS,',
'    ''u-color-1''                 as ICON_COLOR_CLASS,',
'    ''Recording of Employee Attendance'' as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''EMPLOYEESALARY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:621:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Employee Gatepass''     as LIST_TITLE,',
'    ''fa fa-sign-out''        as ICON_CLASS,',
'    ''u-color-2''             as ICON_COLOR_CLASS,',
'    ''Employee Early going Management   '' as HELP_TEXT',
'From Dual',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ICON NAMES',
'----------',
'',
'''Attendance''            -->     ''fa fa-calendar-plus-o''',
'''Employee Gatepass''     -->     ''fa fa-sign-out'''))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303966152739669487)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303965311137669487)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>40
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303965709865669487)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303964498692669487)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303964960316669487)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303964171738669487)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(475492812207674253)
,p_plug_name=>'Attendance Management '
,p_static_id=>'attendance-management'
,p_region_name=>'NO2'
,p_parent_plug_id=>wwv_flow_imp.id(475492556975674250)
,p_icon_css_classes=>'fa-calendar-o fa-3x'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(475493405213674259)
,p_name=>'Employee Exit CARD'
,p_static_id=>'employee-exit-card'
,p_parent_plug_id=>wwv_flow_imp.id(475493017820674255)
,p_template=>2072724515482255512
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    11                          as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''RESIGNATION'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:337:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Employee Separation''       as LIST_TITLE,',
'    ''fa fa-users-alt''            as ICON_CLASS,',
'    ''u-color-11''                 as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    12                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''FULLANDFINAL'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:695:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Full and Finalization'' as LIST_TITLE,',
'    ''fa fa-briefcase''       as ICON_CLASS,',
'    ''u-color-12''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ICON NAMES',
'----------',
'',
'''Employee Separation''       -->     ''fa fa-user-alt''',
'''Full and Finalization''     -->     ''fa fa-briefcase'''))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303976096553669511)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303975302414669511)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>40
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303975704029669511)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303974548495669509)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303974916006669509)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303974131734669508)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(475493017820674255)
,p_plug_name=>'Employee Exit Management'
,p_static_id=>'employee-exit-management'
,p_region_name=>'NO4'
,p_parent_plug_id=>wwv_flow_imp.id(476341909278381036)
,p_icon_css_classes=>'fa-sign-out fa-3x'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>90
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(475493069586674256)
,p_name=>'HIRE CARD'
,p_static_id=>'hire-card'
,p_parent_plug_id=>wwv_flow_imp.id(475492683727674252)
,p_template=>2072724515482255512
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''EMPLOYEE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:86:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Employee Master''           as LIST_TITLE,',
'    ''fa fa-user-graduate''       as ICON_CLASS,',
'    ''u-color-1''                 as ICON_COLOR_CLASS,',
'    ''Register your Hired Employee details, Allocated Department, Designation'' as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''EMPLOYEESALARY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:621:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Employee Salary''       as LIST_TITLE,',
'    ''fa fa-user-chart''     as ICON_CLASS,',
'    ''u-color-2''             as ICON_COLOR_CLASS,',
'    ''Define his emoluments'' as HELP_TEXT',
'From Dual',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ICON NAMES',
'----------',
'',
'''Employee Master''   -->     ''fa fa-user-graduate''',
'''Employee Salary''   -->     ''fa fa-user-chart'''))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303962899879669484)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303962090585669484)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>40
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303962572079669484)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303961373120669484)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>20
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303961748918669484)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303960921916669484)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(475492556975674250)
,p_plug_name=>'Hire to Retire'
,p_static_id=>'hire-to-retire'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465101029662226488)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(475492683727674252)
,p_plug_name=>'Hiring'
,p_static_id=>'hiring'
,p_region_name=>'NO1'
,p_parent_plug_id=>wwv_flow_imp.id(475492556975674250)
,p_icon_css_classes=>'fa-handshake-o fa-3x'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(476305765761095947)
,p_name=>'LEAVE CARD'
,p_static_id=>'leave-card'
,p_parent_plug_id=>wwv_flow_imp.id(476305697496095946)
,p_template=>2072724515482255512
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LEAVEREQUEST'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:605:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Leave Request & Sanction''  as LIST_TITLE,',
'    ''fa fa-calendar-user''       as ICON_CLASS,',
'    ''u-color-1''                 as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LEAVEREQUEST'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Leave Cancellation''        as LIST_TITLE,',
'    ''fa fa-calendar-times-o''    as ICON_CLASS,',
'    ''u-color-2''                 as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    3                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LEAVEREQUEST'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Leave Conversion''      as LIST_TITLE,',
'    ''fa fa-calendar-edit''   as ICON_CLASS,',
'    ''u-color-3''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    4                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LEAVEREQUEST'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Leave Encashment''          as LIST_TITLE,',
'    ''fa fa-calendar-check-o''    as ICON_CLASS,',
'    ''u-color-4''                 as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303972498060669507)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303971720994669505)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>30
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303972173037669506)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>40
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303970888687669503)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303971325175669504)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303970555127669502)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476305697496095946)
,p_plug_name=>'Leave Management'
,p_static_id=>'leave-management'
,p_region_name=>'NO4'
,p_parent_plug_id=>wwv_flow_imp.id(475492556975674250)
,p_icon_css_classes=>'fa-user-clock fa-3x'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>50
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476306555197095954)
,p_plug_name=>'Loan & Advance Management'
,p_static_id=>'loan-advance-management'
,p_region_name=>'NO1'
,p_parent_plug_id=>wwv_flow_imp.id(476341909278381036)
,p_icon_css_classes=>'fa-hand-stop-o fa-3x'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>60
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(476306585662095955)
,p_name=>'LOAN CARD'
,p_static_id=>'loan-card'
,p_parent_plug_id=>wwv_flow_imp.id(476306555197095954)
,p_template=>2072724515482255512
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    11                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOANREQUEST'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:637:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Loan Request''          as LIST_TITLE,',
'    ''fa fa-hand-o-up''       as ICON_CLASS,',
'    ''u-color-11''            as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    12                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOANSANCTION'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:638:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Loan Sanction''         as LIST_TITLE,',
'    ''fa fa-thumbs-o-up''     as ICON_CLASS,',
'    ''u-color-12''            as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    13                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOANRELAXATION'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:345:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Loan Relaxation''       as LIST_TITLE,',
'    ''fa fa-thumbs-up''       as ICON_CLASS,',
'    ''u-color-13''            as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    15                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOANRECEIPT'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:343:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Loan Receipt''          as LIST_TITLE,',
'    ''fa fa-hand-peace-o''    as ICON_CLASS,',
'    ''u-color-15''            as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303979361353669518)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303978518207669517)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>30
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303978890510669518)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>40
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303977721281669515)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303978160200669516)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303977330928669514)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476341909278381036)
,p_plug_name=>'Loan to Exit Management'
,p_static_id=>'loan-to-exit-management'
,p_parent_plug_id=>wwv_flow_imp.id(475492556975674250)
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-region--topborder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465657877284472980)
,p_plug_display_sequence=>1009
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(475493333009674258)
,p_name=>'PAYROLL CARD'
,p_static_id=>'payroll-card'
,p_parent_plug_id=>wwv_flow_imp.id(475492939547674254)
,p_template=>2072724515482255512
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALARY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:640:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Salary''                    as LIST_TITLE,',
'    ''fa fa-dollar''              as ICON_CLASS,',
'    ''u-color-1''                 as ICON_COLOR_CLASS,',
'    ''Preparation of Salary from attendance''                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALARYPAYMENTADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:683:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Salary Payment Advise'' as LIST_TITLE,',
'    ''fa fa-id-badge''        as ICON_CLASS,',
'    ''u-color-2''             as ICON_COLOR_CLASS,',
'    ''Bank wise release of generated salary''                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    3                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALARYVOUCHER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:681:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Salary Voucher''        as LIST_TITLE,',
'    ''fa fa-money''           as ICON_CLASS,',
'    ''u-color-3''             as ICON_COLOR_CLASS,',
'    ''Posting of salary ''    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    4                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''HOLDSALARY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:685:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Hold Salary''           as LIST_TITLE,',
'    ''fa fa-flag-swallowtail''     as ICON_CLASS,',
'    ''u-color-4''             as ICON_COLOR_CLASS,',
'    ''Hold salary of an employee for any reason''    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    5                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''UNHOLDSALARY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:687:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Unhold Salary''         as LIST_TITLE,',
'    ''fa fa-flag-swallowtail-o''   as ICON_CLASS,',
'    ''u-color-5''             as ICON_COLOR_CLASS,',
'    ''Release the salary of the employee hold previously''    as HELP_TEXT',
'From Dual',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303967344816669494)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>60
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303968930131669499)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>40
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303969332623669501)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>50
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303968184608669496)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>70
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303968567665669497)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>30
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303967751200669495)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(475492939547674254)
,p_plug_name=>'Payroll Management'
,p_static_id=>'payroll-management'
,p_region_name=>'NO3'
,p_parent_plug_id=>wwv_flow_imp.id(475492556975674250)
,p_icon_css_classes=>'fa-badge-dollar fa-3x'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476307281000095962)
,p_plug_name=>'Reward and Recognition'
,p_static_id=>'reward-and-recognition'
,p_region_name=>'NO2'
,p_parent_plug_id=>wwv_flow_imp.id(476341909278381036)
,p_icon_css_classes=>'fa-badge-check fa-3x'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(476307476498095964)
,p_name=>'REWARD CARD'
,p_static_id=>'reward-card'
,p_parent_plug_id=>wwv_flow_imp.id(476307281000095962)
,p_template=>2072724515482255512
,p_display_sequence=>40
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    11                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''CHANGEINEMPLOYEE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:335:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Employee Transfer''     as LIST_TITLE,',
'    ''fa fa-user-circle''     as ICON_CLASS,',
'    ''u-color-11''            as ICON_COLOR_CLASS,',
'    ''Transfer from one location to another location''                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    12                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''CHANGEINEMPLOYEE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:335:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Increment and promotion''   as LIST_TITLE,',
'    ''fa fa-user-arrow-up''       as ICON_CLASS,',
'    ''u-color-12''                as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303982098432669520)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303981367521669520)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>30
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303981775714669520)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>40
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303980526903669519)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303980932047669520)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303982504576669520)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(476308199865095971)
,p_name=>'TOUR AND TRAVEL CARD'
,p_static_id=>'tour-and-travel-card'
,p_parent_plug_id=>wwv_flow_imp.id(476307450206095963)
,p_template=>2072724515482255512
,p_display_sequence=>50
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    11                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''CONVEYANCESCHEME'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:648:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Reimbursement Policy''      as LIST_TITLE,',
'    ''fa fa-newspaper-o''       as ICON_CLASS,',
'    ''u-color-11''                as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    12                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''TOURREQUEST'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:651:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''On Duty Request''           as LIST_TITLE,',
'    ''fa fa-motorcycle''          as ICON_CLASS,',
'    ''u-color-12''                as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    13                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''TOURREQUESTONSPECIALAPPROVAL'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:657:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Od Request On Special Approval''           as LIST_TITLE,',
'    ''fa fa-user-secret''         as ICON_CLASS,',
'    ''u-color-13''                as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    14                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''TOUREXPENSE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:659:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P253_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Reimbursement Claim''   as LIST_TITLE,',
'    ''fa fa-file-user''       as ICON_CLASS,',
'    ''u-color-14''            as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303985716403669526)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>50
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303984958706669524)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>30
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303985296522669525)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>40
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303984141909669523)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>60
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303984504348669523)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>20
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(303983773005669521)
,p_query_column_id=>1
,p_column_alias=>'SEQ'
,p_column_display_sequence=>10
,p_column_heading=>'Seq'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476307450206095963)
,p_plug_name=>'Tour and Travel Management'
,p_static_id=>'tour-and-travel-management'
,p_region_name=>'NO3'
,p_parent_plug_id=>wwv_flow_imp.id(476341909278381036)
,p_icon_css_classes=>'fa-car fa-3x'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(475493300112674252)
,p_name=>'P253_CURRENT_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(475492556975674250)
,p_item_default=>'6'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
