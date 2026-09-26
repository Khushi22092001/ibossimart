prompt --application/pages/page_00261
begin
--   Manifest
--     PAGE: 00261
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
 p_id=>261
,p_name=>'Job and Service'
,p_alias=>'JOB-AND-SERVICE'
,p_step_title=>'Job and Service'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#iBOSS Custom Templates Classes#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#JOB_SERVICE .t-Region-headerIcon .t-Icon {',
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(478429727585918756)
,p_plug_name=>'Info'
,p_static_id=>'info'
,p_parent_plug_id=>wwv_flow_imp.id(478428744006918746)
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--wizard:t-Alert--defaultIcons:t-Alert--info:t-Alert--removeHeading js-removeLandmark'
,p_plug_template=>2040683448887306517
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p style="font-weight:bold; margin-bottom: 0px;">Doc type - Material Handling</p> to process loading unloading type of service bill through system Verified data.',
'<br><br>',
'<p style="font-weight:bold; margin-bottom: 0px;">Doc type - Conversion job out of premises</p>  for any job work provided to third parties like cutting, conversion etc. with system verified data.',
'<br><br>',
'<p style="font-weight:bold; margin-bottom: 0px;">Doc type - General</p>  for any type of services those have no evidence in the system has to process with manual consent given by the passing authority',
''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(478428902413918747)
,p_plug_name=>'Job and Service'
,p_static_id=>'job-and-service'
,p_region_name=>'JOB_SERVICE'
,p_parent_plug_id=>wwv_flow_imp.id(478428744006918746)
,p_icon_css_classes=>'fa-user-wrench fa-2x fa-lg'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>4
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(478428744006918746)
,p_plug_name=>'Job and Service Management'
,p_static_id=>'job-and-service-management'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465101029662226488)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(478428933093918748)
,p_name=>'SERVICE CARD'
,p_static_id=>'service-card'
,p_parent_plug_id=>wwv_flow_imp.id(478428902413918747)
,p_template=>2072724515482255512
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_new_grid_row=>false
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''JOBTYPE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:94:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P261_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Service Type''              as LIST_TITLE,',
'    ''fa fa-database-wrench''     as ICON_CLASS,',
'    ''u-color-1''                 as ICON_COLOR_CLASS,',
'    ''Create Unique servies and assign SAC Code  in to it.'' as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                    as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''JOBORDER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:178:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P261_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                  as LINK,',
'    ''Service Order''      as LIST_TITLE,',
'    ''fa fa-file-wrench''  as ICON_CLASS,',
'    ''u-color-2''          as ICON_COLOR_CLASS,',
'    ''Award Order to the service provider'' as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    3                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''JOBBILL'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:212:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P261_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                       as LINK,',
'    ''Service Bill Receipt''            as LIST_TITLE,',
'    ''fa fa-file-text-o''       as ICON_CLASS,',
'    ''u-color-3''               as ICON_COLOR_CLASS,',
'    ''To enter the service bill of provider'' as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    4                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''JBPASS'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:220:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P261_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Service Bill Receipt Pass''     as LIST_TITLE,',
'    ''fa fa-file-text''       as ICON_CLASS,',
'    ''u-color-4''             as ICON_COLOR_CLASS,',
'    ''process and pass the service bill''                    as HELP_TEXT',
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
 p_id=>wwv_flow_imp.id(305012104593406396)
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
 p_id=>wwv_flow_imp.id(305011317151406395)
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
 p_id=>wwv_flow_imp.id(305011741870406396)
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
 p_id=>wwv_flow_imp.id(305010546950406393)
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
 p_id=>wwv_flow_imp.id(305010915558406394)
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
 p_id=>wwv_flow_imp.id(305010099256406390)
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(478430263018918757)
,p_name=>'P261_CURRENT_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(478428744006918746)
,p_item_default=>'8'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp.component_end;
end;
/
