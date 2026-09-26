prompt --application/pages/page_00257
begin
--   Manifest
--     PAGE: 00257
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
 p_id=>257
,p_name=>'Asset Management'
,p_alias=>'ASSET-MANAGEMENT'
,p_step_title=>'Asset Management'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#NO1 .t-Region-headerIcon .t-Icon {',
'    color: white;',
'    background-color: var(--u-color-25);',
'    border-radius: 10px;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(485858692121851967)
,p_name=>'ASSET CARD'
,p_static_id=>'asset-card'
,p_parent_plug_id=>wwv_flow_imp.id(485858612128851966)
,p_template=>2072724515482255512
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:t-MediaList--stack'
,p_display_point=>'SUB_REGIONS'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    1                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ASSETCATEGORYDEPRATE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:678:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Asset Category Depriciation Rate''                    as LIST_TITLE,',
'    ''fa fa-retweet''             as ICON_CLASS,',
'    ''u-color-1''                 as ICON_COLOR_CLASS,',
'    ''Preparation of Salary from attendance''                        as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    2                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ASSETOPENING'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:665:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Asset Opening''         as LIST_TITLE,',
'    ''fa fa-dollar''          as ICON_CLASS,',
'    ''u-color-2''             as ICON_COLOR_CLASS,',
'    ''Enter your asset on the date of opening''                    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    3                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''SALARYVOUCHER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Capitalization''        as LIST_TITLE,',
'    ''fa fa-podcast''         as ICON_CLASS,',
'    ''u-color-3''             as ICON_COLOR_CLASS,',
'    ''Put to use your asset, purchase and issue your material under doctype capital''    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    4                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ASSET'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:674:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Asset''                 as LIST_TITLE,',
'    ''fa fa-university''      as ICON_CLASS,',
'    ''u-color-4''             as ICON_COLOR_CLASS,',
'    ''Formation of a New Asset''    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    5                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ASSETDEPRECIATION'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:676:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Asset Depreciation''        as LIST_TITLE,',
'    ''fa fa-arrow-circle-down''   as ICON_CLASS,',
'    ''u-color-5''                 as ICON_COLOR_CLASS,',
'    ''Depriciate your asset as per Company Norms''    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    6                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ASSETTRANSFER'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:691:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Asset Transfer''        as LIST_TITLE,',
'    ''fa fa-random''          as ICON_CLASS,',
'    ''u-color-6''             as ICON_COLOR_CLASS,',
'    null    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    7                   as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ASSETSALE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:669:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                 as LINK,',
'    ''Asset Sale''        as LIST_TITLE,',
'    ''fa fa-tags''        as ICON_CLASS,',
'    ''u-color-7''         as ICON_COLOR_CLASS,',
'    null                as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    8                       as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''ASSETDISCARD'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:671:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                     as LINK,',
'    ''Asset Discard''         as LIST_TITLE,',
'    ''fa fa-times-circle''    as ICON_CLASS,',
'    ''u-color-8''             as ICON_COLOR_CLASS,',
'    null    as HELP_TEXT',
'From Dual',
'',
'Union All',
'',
'Select',
'    9                           as SEQ,',
'    CASE WHEN CHECK_MODULE_VIEW_ACCESS(''FIXEDASSETSREVISED'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    ELSE',
'        APEX_UTIL.PREPARE_URL(''f?p=&APP_ID.:&P257_CURRENT_PAGE.:&APP_SESSION.'')',
'    END                         as LINK,',
'    ''Fixed Assets''              as LIST_TITLE,',
'    ''fa fa-box-arrow-in-south''  as ICON_CLASS,',
'    ''u-color-9''                 as ICON_COLOR_CLASS,',
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
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(313479214870140418)
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
 p_id=>wwv_flow_imp.id(313478413637140416)
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
 p_id=>wwv_flow_imp.id(313478868806140417)
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
 p_id=>wwv_flow_imp.id(313477634480140414)
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
 p_id=>wwv_flow_imp.id(313478048691140415)
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
 p_id=>wwv_flow_imp.id(313477205952140413)
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
 p_id=>wwv_flow_imp.id(485858612128851966)
,p_plug_name=>'Asset Management'
,p_static_id=>'asset-management'
,p_region_name=>'NO1'
,p_parent_plug_id=>wwv_flow_imp.id(485858373826851964)
,p_icon_css_classes=>'fa-home fa-2x fa-lg'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(474604911202710840)
,p_plug_display_sequence=>10
,p_plug_grid_column_span=>3
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(485858373826851964)
,p_plug_name=>'Fixed Asset Management'
,p_static_id=>'fixed-asset-management'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(474581233493692852)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(485858982297851967)
,p_name=>'P257_CURRENT_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(485858373826851964)
,p_item_default=>'257'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
