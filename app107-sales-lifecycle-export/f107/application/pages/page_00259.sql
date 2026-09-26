prompt --application/pages/page_00259
begin
--   Manifest
--     PAGE: 00259
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
 p_id=>259
,p_name=>'Setup and Admin'
,p_alias=>'SETUP-AND-ADMIN'
,p_step_title=>'Setup and Admin'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#iBOSS Custom Templates Classes#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#ORG_CONFIG .t-Region-headerIcon .t-Icon {',
'    color: linear-gradient(45deg, transparent, var(--ut-focus-outline-color));',
'    background: linear-gradient(45deg, var(--ut-focus-outline-color), transparent);',
'    border-radius: 10px;',
'}',
'',
'#USER_CONFIG .t-Region-headerIcon .t-Icon {',
'    color: linear-gradient(45deg, transparent, var(--ut-focus-outline-color));',
'    background: linear-gradient(45deg, var(--ut-focus-outline-color), transparent);',
'    border-radius: 10px;',
'}',
'',
'#EMP_CONFIG .t-Region-headerIcon .t-Icon {',
'    color: linear-gradient(45deg, transparent, var(--ut-focus-outline-color));',
'    background: linear-gradient(45deg, var(--ut-focus-outline-color), transparent);',
'    border-radius: 10px;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(475393460763862988)
,p_name=>'EMP CARD'
,p_static_id=>'emp-card'
,p_parent_plug_id=>wwv_flow_imp.id(475391321219862967)
,p_template=>2072724515482255512
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--stack:t-MediaList--iconsRounded'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''STAFFTYPE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:601:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Staff Type''            as LIST_TITLE,',
'    ''fa fa-users-alt''       as ICON_CLASS,',
'    ''u-color-1''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ATTENDENCEHEAD'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:615:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Attendance Head''       as LIST_TITLE,',
'    ''fa fa-calendar-o''      as ICON_CLASS,',
'    ''u-color-2''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    3                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOADINGADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Attendance Scheme''     as LIST_TITLE,',
'    ''fa fa-calendar-wrench'' as ICON_CLASS,',
'    ''u-color-3''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    4                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALARYHEAD'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:603:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Salary Head''           as LIST_TITLE,',
'    ''fa fa-h-square''        as ICON_CLASS,',
'    ''u-color-4''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    5                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALARYSCHEME'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:623:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Salary Scheme''         as LIST_TITLE,',
'    ''fa fa-window-wrench''   as ICON_CLASS,',
'    ''u-color-5''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    6                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LEAVE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:605:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Leave Type''            as LIST_TITLE,',
'    ''fa fa-user-clock''      as ICON_CLASS,',
'    ''u-color-6''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    7                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LEAVESCHEME'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:341:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Leave Scheme''          as LIST_TITLE,',
'    ''fa fa-tiles-2x2''       as ICON_CLASS,',
'    ''u-color-7''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    8                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOANTYPE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:609:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Loan Type''             as LIST_TITLE,',
'    ''fa fa-hand-scissors-o'' as ICON_CLASS,',
'    ''u-color-8''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    9                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOANSCHEME'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:627:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Loan Scheme''           as LIST_TITLE,',
'    ''fa fa-handshake-o''     as ICON_CLASS,',
'    ''u-color-9''            as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    10                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''PFANDESICSETTING'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:331:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''PF and ESIC Settings''      as LIST_TITLE,',
'    ''fa fa-server-wrench''       as ICON_CLASS,',
'    ''u-color-10''                 as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
'',
''))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(474728811347481180)
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
'''Employee Type''         -->      ''fa fa-users''',
'''Staff Type''            -->      ''fa fa-users-alt''',
'''Attendance Head''       -->      ''fa fa-calendar-o''',
'''Attendance Scheme''     -->      ''fa fa-calendar-wrench''',
'''Salary Head''           -->      ''fa fa-h-square''',
'''Salary Scheme''         -->      ''fa fa-window-wrench'' ',
'''Leave Type''            -->      ''fa fa-user-clock''',
'''Leave Scheme''          -->      ''fa fa-tiles-2x2''',
'''Loan Type''             -->      ''fa fa-hand-scissors-o''',
'''Loan Scheme''           -->      ''fa fa-handshake-o'''))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314481815749869634)
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
 p_id=>wwv_flow_imp.id(314481178012869630)
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
 p_id=>wwv_flow_imp.id(314481562058869632)
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
 p_id=>wwv_flow_imp.id(314480314545869627)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>50
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314480747502869629)
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
 p_id=>wwv_flow_imp.id(314479971067869623)
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
 p_id=>wwv_flow_imp.id(475391321219862967)
,p_plug_name=>'Employee Configuration'
,p_static_id=>'employee-configuration'
,p_region_name=>'EMP_CONFIG'
,p_parent_plug_id=>wwv_flow_imp.id(475391198905862965)
,p_icon_css_classes=>'fa-user-md fa-2x fa-lg'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(474604911202710840)
,p_plug_display_sequence=>35
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(475391534919862969)
,p_name=>'ORG CARD'
,p_static_id=>'org-card'
,p_parent_plug_id=>wwv_flow_imp.id(475391293537862966)
,p_template=>2072724515482255512
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--stack:t-MediaList--iconsRounded'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''COMPANY'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:3:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Company''                   as LIST_TITLE,',
'    ''fa fa-home''                as ICON_CLASS,',
'    ''u-color-1''                 as ICON_COLOR_CLASS,',
'    ''An organization is a body built for a collection of individuals who join together to achieve some common goals and objectives bounded by legal entities or a Trade Name'' as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                                   as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''LOCATION'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:24:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                                 as LINK,',
'    ''Division / Branch / Location''      as LIST_TITLE,',
'    ''fa fa-map-marker''                    as ICON_CLASS,',
'    ''u-color-2''                         as ICON_COLOR_CLASS,',
'    ''The Location is an operating area within a company where there is stock movement. Each of the Project, Branch, Corporate office shall be identified as a Location in  Software. For the purposes of Segrigation of Data, Users etc.'' as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    3                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''FINANCIALYEAR'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:27:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Financial Year''            as LIST_TITLE,',
'    ''fa fa-calendar''            as ICON_CLASS,',
'    ''u-color-3''                 as ICON_COLOR_CLASS,',
'    null as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    4                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''DEPARTMENT'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:82:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Department''            as LIST_TITLE,',
'    ''fa fa-gears''           as ICON_CLASS,',
'    ''u-color-4''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    5                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SHIFT'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:203:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                 as LINK,',
'    ''Shift''             as LIST_TITLE,',
'    ''fa fa-clock-o''     as ICON_CLASS,',
'    ''u-color-5''         as ICON_COLOR_CLASS,',
'    null                as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    6                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''STORAGELOCATION'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:127:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Storage Location''          as LIST_TITLE,',
'    ''fa fa-inbox''               as ICON_CLASS,',
'    ''u-color-6''                 as ICON_COLOR_CLASS,',
'    ''A storage location is the place where stock is physically kept within a Plant/ Project/ Location.a Location can have one or more storage locations.',
'A Location / Plant has an Address, GST No, and State.'' as HELP_TEXT',
'From Dual'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(474728811347481180)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ICONS NAME',
'----------',
'',
'''Company''                           -->     ''fa fa-home''  ',
'''Division / Branch / Location''      -->     ''fa fa-map-marker'' ',
'''Financial Year''                    -->     ''fa fa-calendar'' ',
'''Department''                        -->     ''fa fa-gears''           ',
'''Shift''                             -->     ''fa fa-clock-o''     ',
'''Storage Location''                  -->     ''fa fa-inbox''               '))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314478691158869619)
,p_query_column_id=>6
,p_column_alias=>'HELP_TEXT'
,p_column_display_sequence=>170
,p_column_heading=>'Help Text'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314477920839869616)
,p_query_column_id=>4
,p_column_alias=>'ICON_CLASS'
,p_column_display_sequence=>130
,p_column_heading=>'Icon Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314478324188869617)
,p_query_column_id=>5
,p_column_alias=>'ICON_COLOR_CLASS'
,p_column_display_sequence=>150
,p_column_heading=>'Icon Color Class'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314477107347869615)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>160
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314477515687869616)
,p_query_column_id=>3
,p_column_alias=>'LIST_TITLE'
,p_column_display_sequence=>100
,p_column_heading=>'List Title'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314476699871869614)
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
 p_id=>wwv_flow_imp.id(475391293537862966)
,p_plug_name=>'Organization Structure'
,p_static_id=>'organization-structure'
,p_region_name=>'ORG_CONFIG'
,p_parent_plug_id=>wwv_flow_imp.id(475391198905862965)
,p_icon_css_classes=>'fa-building fa-2x fa-lg'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(474604911202710840)
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(475391198905862965)
,p_plug_name=>'Setup & Admin'
,p_static_id=>'setup-admin'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(474581233493692852)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(487043687086675149)
,p_name=>'USER CARD'
,p_static_id=>'user-card'
,p_parent_plug_id=>wwv_flow_imp.id(475391427424862968)
,p_template=>2072724515482255512
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleC'
,p_component_template_options=>'#DEFAULT#:u-colors:t-MediaList--stack:t-MediaList--iconsRounded'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''BOSSUSER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:80:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Boss User''                 as LIST_TITLE,',
'    ''fa fa-user''                as ICON_CLASS,',
'    ''u-color-1''                 as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''MODULELOCATION'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:76:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Module Location''       as LIST_TITLE,',
'    ''fa fa-map-pin''         as ICON_CLASS,',
'    ''u-color-2''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    3                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''MODULEDOCTYPE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:74:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Module Doctype''        as LIST_TITLE,',
'    ''fa fa-folder-file''     as ICON_CLASS,',
'    ''u-color-3''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    4                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''MODULEPRIVILEGE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:135:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Module Privilege''      as LIST_TITLE,',
'    ''fa fa-folder-user''     as ICON_CLASS,',
'    ''u-color-4''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    5                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''CODESCHEME'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:40:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Code Scheme''           as LIST_TITLE,',
'    ''fa fa-folder-wrench''   as ICON_CLASS,',
'    ''u-color-5''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    6                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''MODULEFLOW'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:124:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Module Flow''           as LIST_TITLE,',
'    ''fa fa-workflow''        as ICON_CLASS,',
'    ''u-color-6''             as ICON_COLOR_CLASS,',
'    null                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    7                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''MODULEDOCTYPEWISETAC'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:224:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P259_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Module DocType wise TAC''   as LIST_TITLE,',
'    ''fa fa-table-wrench''        as ICON_CLASS,',
'    ''u-color-7''                 as ICON_COLOR_CLASS,',
'    null                        as HELP_TEXT',
'From Dual'))
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(474728811347481180)
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'ICON NAMES',
'-----------',
'',
'''Boss User''                 -->     ''fa fa-user'' ',
'''Module Location''           -->     ''fa fa-map-pin'' ',
'''Module Doctype''            -->     ''fa fa-folder-file''',
'''Module Privilege''          -->     ''fa fa-folder-user''',
'''Code Scheme''               -->     ''fa fa-folder-wrench''',
'''Module Flow''               -->     ''fa fa-workflow''',
'''Module DocType wise TNC''   -->     ''fa fa-table-wrench'' '))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314485086610869643)
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
 p_id=>wwv_flow_imp.id(314484282618869641)
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
 p_id=>wwv_flow_imp.id(314484625507869642)
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
 p_id=>wwv_flow_imp.id(314483424597869638)
,p_query_column_id=>2
,p_column_alias=>'LINK'
,p_column_display_sequence=>50
,p_column_heading=>'Link'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(314483856376869640)
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
 p_id=>wwv_flow_imp.id(314483081905869637)
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
 p_id=>wwv_flow_imp.id(475391427424862968)
,p_plug_name=>'User Configuration'
,p_static_id=>'user-configuration'
,p_region_name=>'USER_CONFIG'
,p_parent_plug_id=>wwv_flow_imp.id(475391198905862965)
,p_icon_css_classes=>'fa-user-wrench fa-2x fa-lg'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(474604911202710840)
,p_plug_display_sequence=>15
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(487045055372675164)
,p_name=>'P259_CURRENT_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(475391198905862965)
,p_item_default=>'5'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
