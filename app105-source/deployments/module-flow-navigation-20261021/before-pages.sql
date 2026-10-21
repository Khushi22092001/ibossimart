
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
--   Export Type:     Component Export
--   Manifest
--     PAGE: 259
--     PAGE: 263
--     PAGE: 264
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/pages/delete_00259
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>259);
end;
/
prompt --application/pages/page_00259
begin
wwv_flow_imp_page.create_page(
 p_id=>259
,p_name=>'Setup and Admin'
,p_alias=>'SETUP-AND-ADMIN'
,p_step_title=>'Setup and Admin'
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
'',
'/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */',
'details#hspl-keyboard-help{display:none!important}',
''))
,p_step_template=>wwv_flow_imp.id(95002006100359)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(465913256932396624)
,p_name=>'EMP CARD'
,p_static_id=>'emp-card'
,p_parent_plug_id=>wwv_flow_imp.id(465911117388396603)
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
 p_id=>wwv_flow_imp.id(305001611918403270)
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
 p_id=>wwv_flow_imp.id(305000974181403266)
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
 p_id=>wwv_flow_imp.id(305001358227403268)
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
 p_id=>wwv_flow_imp.id(305000110714403263)
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
 p_id=>wwv_flow_imp.id(305000543671403265)
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
 p_id=>wwv_flow_imp.id(304999767236403259)
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
 p_id=>wwv_flow_imp.id(465911117388396603)
,p_plug_name=>'Employee Configuration'
,p_static_id=>'employee-configuration'
,p_region_name=>'EMP_CONFIG'
,p_parent_plug_id=>wwv_flow_imp.id(465910995074396601)
,p_icon_css_classes=>'fa-user-md fa-2x fa-lg'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
,p_plug_display_sequence=>35
,p_plug_new_grid_row=>false
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(95002006300259)
,p_plug_name=>'Header initial approved identity'
,p_static_id=>'header-initial-approved-identity'
,p_region_name=>'imart-initial-header-259'
,p_region_attributes=>'style="display:contents"'
,p_plug_template=>wwv_flow_imp.id(95001071000503)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<div class="hspl-hero-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"></path><p'
||'ath d="M14 3v5h5M9 13h6M9 17h6M9 9h1"></path></svg></div><div class="hspl-title-block"><h1 class="hspl-page-title">Setup and Admin</h1><p class="hspl-module-subtitle">Configure organization, access and workforce foundations in one place.</p></div><di'
||'v class="hspl-module-journey" aria-label="Administration lifecycle: Organize, Control, Configure, Govern"><div class="hspl-module-step is-blue"><span class="fa fa-sitemap" aria-hidden="true"></span><b>Organize</b></div><span class="hspl-module-arrow '
||'fa fa-chevron-right" aria-hidden="true"></span><div class="hspl-module-step is-green"><span class="fa fa-shield" aria-hidden="true"></span><b>Control</b></div><span class="hspl-module-arrow fa fa-chevron-right" aria-hidden="true"></span><div class="h'
||'spl-module-step is-violet"><span class="fa fa-users" aria-hidden="true"></span><b>Configure</b></div><span class="hspl-module-arrow fa fa-chevron-right" aria-hidden="true"></span><div class="hspl-module-step is-orange"><span class="fa fa-check-square'
||'-o" aria-hidden="true"></span><b>Govern</b></div></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(465911331088396605)
,p_name=>'ORG CARD'
,p_static_id=>'org-card'
,p_parent_plug_id=>wwv_flow_imp.id(465911089706396602)
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
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
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
 p_id=>wwv_flow_imp.id(304998487327403255)
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
 p_id=>wwv_flow_imp.id(304997717008403252)
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
 p_id=>wwv_flow_imp.id(304998120357403253)
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
 p_id=>wwv_flow_imp.id(304996903516403251)
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
 p_id=>wwv_flow_imp.id(304997311856403252)
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
 p_id=>wwv_flow_imp.id(304996496040403250)
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
 p_id=>wwv_flow_imp.id(465911089706396602)
,p_plug_name=>'Organization Structure'
,p_static_id=>'organization-structure'
,p_region_name=>'ORG_CONFIG'
,p_parent_plug_id=>wwv_flow_imp.id(465910995074396601)
,p_icon_css_classes=>'fa-building fa-2x fa-lg'
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(465910995074396601)
,p_plug_name=>'Setup & Admin'
,p_static_id=>'setup-admin'
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
 p_id=>wwv_flow_imp.id(477563483255208785)
,p_name=>'USER CARD'
,p_static_id=>'user-card'
,p_parent_plug_id=>wwv_flow_imp.id(465911223593396604)
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
,p_query_row_template=>wwv_flow_imp.id(465248607516014816)
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
 p_id=>wwv_flow_imp.id(305004882779403279)
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
 p_id=>wwv_flow_imp.id(305004078787403277)
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
 p_id=>wwv_flow_imp.id(305004421676403278)
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
 p_id=>wwv_flow_imp.id(305003220766403274)
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
 p_id=>wwv_flow_imp.id(305003652545403276)
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
 p_id=>wwv_flow_imp.id(305002878074403273)
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
 p_id=>wwv_flow_imp.id(465911223593396604)
,p_plug_name=>'User Configuration'
,p_static_id=>'user-configuration'
,p_region_name=>'USER_CONFIG'
,p_parent_plug_id=>wwv_flow_imp.id(465910995074396601)
,p_icon_css_classes=>'fa-user-wrench fa-2x fa-lg'
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(465124707371244476)
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
 p_id=>wwv_flow_imp.id(477564851541208800)
,p_name=>'P259_CURRENT_PAGE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(465910995074396601)
,p_item_default=>'5'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
end;
/
prompt --application/pages/delete_00263
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>263);
end;
/
prompt --application/pages/page_00263
begin
wwv_flow_imp_page.create_page(
 p_id=>263
,p_name=>'Module Flow List'
,p_alias=>'MODULE-FLOW-LIST'
,p_step_title=>'Module Flow List'
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
'</script>',
'<!-- IMART_REGISTER_INITIAL_PAINT_20261006: only register page 263 -->',
'<style id="imart-register-initial-paint-263">',
'',
'html.page-263 #R448871020061554529 .a-IRR-table th.a-IRR-header{font-size:10.5px!important;font-weight:700!important;letter-spacing:.08em!important;line-height:1.35!important;padding:7px 12px!important;border:1px solid #e7e9f0!important;background-co'
||'lor:#e6e8f7!important}',
'html.page-263 #R448871020061554529 .a-IRR-table th.a-IRR-header .a-IRR-headerLink{font-size:10.5px!important;font-weight:700!important;letter-spacing:.08em!important;color:#5b5bd6!important}',
'html.page-263 #R448871020061554529 .a-IRR-table tbody td{font-size:12px!important;padding:7px 12px!important;border:1px solid #e7e9f0!important;line-height:1.32!important}',
'html.page-263 #R448871020061554529 .a-IRR-table td:not(:has(input,select,textarea,button)) :is(div,span,a):not(.fa):not(.a-Icon){font-size:inherit!important}',
'html.page-263 #R448871020061554529 .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]){background-color:#f3f6fc!important}',
'html.page-263 #R448871020061554529 .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]){background-color:#fff!important}',
'html.page-263 .imart-initial-status-263{display:inline-flex!important;align-items:center;gap:6px;height:23px;box-sizing:border-box;padding:0 11px;border:0;border-radius:999px;font-size:12px;font-weight:600;line-height:1;letter-spacing:.02em;white-spa'
||'ce:nowrap;background:var(--c-accent-soft);color:var(--c-primary)}',
'html.page-263 .imart-initial-status-263::before{content:"";width:5px;height:5px;flex:none;border-radius:50%;background:currentColor}',
'html.page-263 .imart-initial-status-263[data-imart-status=""]{display:none!important}',
'html.page-263 .imart-initial-status-263:is([data-imart-status^="PREPAR" i],[data-imart-status*=" PREPAR" i],[data-imart-status*="-PREPAR" i],[data-imart-status*="/PREPAR" i],[data-imart-status^="APPROV" i],[data-imart-status*=" APPROV" i],[data-imart'
||'-status*="-APPROV" i],[data-imart-status*="/APPROV" i],[data-imart-status^="COMPLET" i],[data-imart-status*=" COMPLET" i],[data-imart-status*="-COMPLET" i],[data-imart-status*="/COMPLET" i],[data-imart-status^="PASS" i],[data-imart-status*=" PASS" i]'
||',[data-imart-status*="-PASS" i],[data-imart-status*="/PASS" i],[data-imart-status^="DISPATCH" i],[data-imart-status*=" DISPATCH" i],[data-imart-status*="-DISPATCH" i],[data-imart-status*="/DISPATCH" i],[data-imart-status^="DELIVER" i],[data-imart-sta'
||'tus*=" DELIVER" i],[data-imart-status*="-DELIVER" i],[data-imart-status*="/DELIVER" i],[data-imart-status^="DONE" i],[data-imart-status*=" DONE" i],[data-imart-status*="-DONE" i],[data-imart-status*="/DONE" i],[data-imart-status^="SUCCESS" i],[data-i'
||'mart-status*=" SUCCESS" i],[data-imart-status*="-SUCCESS" i],[data-imart-status*="/SUCCESS" i],[data-imart-status^="ACTIVE" i],[data-imart-status*=" ACTIVE" i],[data-imart-status*="-ACTIVE" i],[data-imart-status*="/ACTIVE" i],[data-imart-status^="ISS'
||'UED" i],[data-imart-status*=" ISSUED" i],[data-imart-status*="-ISSUED" i],[data-imart-status*="/ISSUED" i],[data-imart-status^="RECEIV" i],[data-imart-status*=" RECEIV" i],[data-imart-status*="-RECEIV" i],[data-imart-status*="/RECEIV" i],[data-imart-'
||'status^="CLOSED" i],[data-imart-status*=" CLOSED" i],[data-imart-status*="-CLOSED" i],[data-imart-status*="/CLOSED" i],[data-imart-status^="PAID" i],[data-imart-status*=" PAID" i],[data-imart-status*="-PAID" i],[data-imart-status*="/PAID" i],[data-im'
||'art-status^="VERIFIED" i],[data-imart-status*=" VERIFIED" i],[data-imart-status*="-VERIFIED" i],[data-imart-status*="/VERIFIED" i],[data-imart-status^="ACCEPT" i],[data-imart-status*=" ACCEPT" i],[data-imart-status*="-ACCEPT" i],[data-imart-status*="'
||'/ACCEPT" i],[data-imart-status^="CONFIRM" i],[data-imart-status*=" CONFIRM" i],[data-imart-status*="-CONFIRM" i],[data-imart-status*="/CONFIRM" i],[data-imart-status^="BALANCED" i],[data-imart-status*=" BALANCED" i],[data-imart-status*="-BALANCED" i]'
||',[data-imart-status*="/BALANCED" i],[data-imart-status^="HEALTHY" i],[data-imart-status*=" HEALTHY" i],[data-imart-status*="-HEALTHY" i],[data-imart-status*="/HEALTHY" i],[data-imart-status^="WITHIN" i],[data-imart-status*=" WITHIN" i],[data-imart-st'
||'atus*="-WITHIN" i],[data-imart-status*="/WITHIN" i],[data-imart-status^="COVERED" i],[data-imart-status*=" COVERED" i],[data-imart-status*="-COVERED" i],[data-imart-status*="/COVERED" i],[data-imart-status^="ADEQUATE" i],[data-imart-status*=" ADEQUAT'
||'E" i],[data-imart-status*="-ADEQUATE" i],[data-imart-status*="/ADEQUATE" i],[data-imart-status^="MOVING" i],[data-imart-status*=" MOVING" i],[data-imart-status*="-MOVING" i],[data-imart-status*="/MOVING" i],[data-imart-status^="NORMAL" i],[data-imart'
||'-status*=" NORMAL" i],[data-imart-status*="-NORMAL" i],[data-imart-status*="/NORMAL" i],[data-imart-status^="FAST" i],[data-imart-status*=" FAST" i],[data-imart-status*="-FAST" i],[data-imart-status*="/FAST" i],[data-imart-status^="FULLY" i],[data-im'
||'art-status*=" FULLY" i],[data-imart-status*="-FULLY" i],[data-imart-status*="/FULLY" i],[data-imart-status^="COSTED" i],[data-imart-status*=" COSTED" i],[data-imart-status*="-COSTED" i],[data-imart-status*="/COSTED" i],[data-imart-status^="CLEAN" i],'
||'[data-imart-status*=" CLEAN" i],[data-imart-status*="-CLEAN" i],[data-imart-status*="/CLEAN" i]){background:#e7f6ec!important;color:#1e7d45!important}',
'html.page-263 .imart-initial-status-263:is([data-imart-status^="HOLD" i],[data-imart-status*=" HOLD" i],[data-imart-status*="-HOLD" i],[data-imart-status*="/HOLD" i],[data-imart-status^="PARTIAL" i],[data-imart-status*=" PARTIAL" i],[data-imart-statu'
||'s*="-PARTIAL" i],[data-imart-status*="/PARTIAL" i],[data-imart-status^="PARTLY" i],[data-imart-status*=" PARTLY" i],[data-imart-status*="-PARTLY" i],[data-imart-status*="/PARTLY" i],[data-imart-status^="IN PROCESS" i],[data-imart-status*=" IN PROCESS'
||'" i],[data-imart-status*="-IN PROCESS" i],[data-imart-status*="/IN PROCESS" i],[data-imart-status^="IN-PROCESS" i],[data-imart-status*=" IN-PROCESS" i],[data-imart-status*="-IN-PROCESS" i],[data-imart-status*="/IN-PROCESS" i],[data-imart-status^="PRO'
||'CESSING" i],[data-imart-status*=" PROCESSING" i],[data-imart-status*="-PROCESSING" i],[data-imart-status*="/PROCESSING" i],[data-imart-status^="IN PROGRESS" i],[data-imart-status*=" IN PROGRESS" i],[data-imart-status*="-IN PROGRESS" i],[data-imart-st'
||'atus*="/IN PROGRESS" i],[data-imart-status^="IN-PROGRESS" i],[data-imart-status*=" IN-PROGRESS" i],[data-imart-status*="-IN-PROGRESS" i],[data-imart-status*="/IN-PROGRESS" i],[data-imart-status^="AWAIT" i],[data-imart-status*=" AWAIT" i],[data-imart-'
||'status*="-AWAIT" i],[data-imart-status*="/AWAIT" i],[data-imart-status^="DRAFT" i],[data-imart-status*=" DRAFT" i],[data-imart-status*="-DRAFT" i],[data-imart-status*="/DRAFT" i],[data-imart-status^="OPEN" i],[data-imart-status*=" OPEN" i],[data-imar'
||'t-status*="-OPEN" i],[data-imart-status*="/OPEN" i],[data-imart-status^="SLOW" i],[data-imart-status*=" SLOW" i],[data-imart-status*="-SLOW" i],[data-imart-status*="/SLOW" i],[data-imart-status^="NON MOV" i],[data-imart-status*=" NON MOV" i],[data-im'
||'art-status*="-NON MOV" i],[data-imart-status*="/NON MOV" i],[data-imart-status^="NON-MOV" i],[data-imart-status*=" NON-MOV" i],[data-imart-status*="-NON-MOV" i],[data-imart-status*="/NON-MOV" i],[data-imart-status^="LOW RATIO" i],[data-imart-status*='
||'" LOW RATIO" i],[data-imart-status*="-LOW RATIO" i],[data-imart-status*="/LOW RATIO" i],[data-imart-status^="LOW-RATIO" i],[data-imart-status*=" LOW-RATIO" i],[data-imart-status*="-LOW-RATIO" i],[data-imart-status*="/LOW-RATIO" i],[data-imart-status^'
||'="LOW" i],[data-imart-status*=" LOW" i],[data-imart-status*="-LOW" i],[data-imart-status*="/LOW" i],[data-imart-status^="EXCESS" i],[data-imart-status*=" EXCESS" i],[data-imart-status*="-EXCESS" i],[data-imart-status*="/EXCESS" i],[data-imart-status^'
||'="OVERSTOCK" i],[data-imart-status*=" OVERSTOCK" i],[data-imart-status*="-OVERSTOCK" i],[data-imart-status*="/OVERSTOCK" i],[data-imart-status^="IDLE" i],[data-imart-status*=" IDLE" i],[data-imart-status*="-IDLE" i],[data-imart-status*="/IDLE" i],[da'
||'ta-imart-status^="STUCK" i],[data-imart-status*=" STUCK" i],[data-imart-status*="-STUCK" i],[data-imart-status*="/STUCK" i],[data-imart-status^="NO OUTPUT" i],[data-imart-status*=" NO OUTPUT" i],[data-imart-status*="-NO OUTPUT" i],[data-imart-status*'
||'="/NO OUTPUT" i],[data-imart-status^="NO-OUTPUT" i],[data-imart-status*=" NO-OUTPUT" i],[data-imart-status*="-NO-OUTPUT" i],[data-imart-status*="/NO-OUTPUT" i],[data-imart-status^="NO INPUT" i],[data-imart-status*=" NO INPUT" i],[data-imart-status*="'
||'-NO INPUT" i],[data-imart-status*="/NO INPUT" i],[data-imart-status^="NO-INPUT" i],[data-imart-status*=" NO-INPUT" i],[data-imart-status*="-NO-INPUT" i],[data-imart-status*="/NO-INPUT" i],[data-imart-status^="NOT ISSUED" i],[data-imart-status*=" NOT '
||'ISSUED" i],[data-imart-status*="-NOT ISSUED" i],[data-imart-status*="/NOT ISSUED" i],[data-imart-status^="NOT-ISSUED" i],[data-imart-status*=" NOT-ISSUED" i],[data-imart-status*="-NOT-ISSUED" i],[data-imart-status*="/NOT-ISSUED" i],[data-imart-status'
||'^="SHORT ISSUED" i],[data-imart-status*=" SHORT ISSUED" i],[data-imart-status*="-SHORT ISSUED" i],[data-imart-status*="/SHORT ISSUED" i],[data-imart-status^="SHORT-ISSUED" i],[data-imart-status*=" SHORT-ISSUED" i],[data-imart-status*="-SHORT-ISSUED" '
||'i],[data-imart-status*="/SHORT-ISSUED" i],[data-imart-status^="BELOW REORDER" i],[data-imart-status*=" BELOW REORDER" i],[data-imart-status*="-BELOW REORDER" i],[data-imart-status*="/BELOW REORDER" i],[data-imart-status^="BELOW-REORDER" i],[data-imar'
||'t-status*=" BELOW-REORDER" i],[data-imart-status*="-BELOW-REORDER" i],[data-imart-status*="/BELOW-REORDER" i],[data-imart-status^="NOT COSTED" i],[data-imart-status*=" NOT COSTED" i],[data-imart-status*="-NOT COSTED" i],[data-imart-status*="/NOT COST'
||'ED" i],[data-imart-status^="NOT-COSTED" i],[data-imart-status*=" NOT-COSTED" i],[data-imart-status*="-NOT-COSTED" i],[data-imart-status*="/NOT-COSTED" i],[data-imart-status^="DELAY" i],[data-imart-status*=" DELAY" i],[data-imart-status*="-DELAY" i],['
||'data-imart-status*="/DELAY" i],[data-imart-status^="OUT IN" i],[data-imart-status*=" OUT IN" i],[data-imart-status*="-OUT IN" i],[data-imart-status*="/OUT IN" i],[data-imart-status^="OUT-IN" i],[data-imart-status*=" OUT-IN" i],[data-imart-status*="-O'
||'UT-IN" i],[data-imart-status*="/OUT-IN" i],[data-imart-status^="OUT/IN" i],[data-imart-status*=" OUT/IN" i],[data-imart-status*="-OUT/IN" i],[data-imart-status*="/OUT/IN" i]){background:#fef4e4!important;color:#b45309!important}',
'html.page-263 .imart-initial-status-263:is([data-imart-status^="PENDING" i],[data-imart-status*=" PENDING" i],[data-imart-status*="-PENDING" i],[data-imart-status*="/PENDING" i],[data-imart-status^="REJECT" i],[data-imart-status*=" REJECT" i],[data-i'
||'mart-status*="-REJECT" i],[data-imart-status*="/REJECT" i],[data-imart-status^="CANCEL" i],[data-imart-status*=" CANCEL" i],[data-imart-status*="-CANCEL" i],[data-imart-status*="/CANCEL" i],[data-imart-status^="FAIL" i],[data-imart-status*=" FAIL" i]'
||',[data-imart-status*="-FAIL" i],[data-imart-status*="/FAIL" i],[data-imart-status^="DECLIN" i],[data-imart-status*=" DECLIN" i],[data-imart-status*="-DECLIN" i],[data-imart-status*="/DECLIN" i],[data-imart-status^="EXPIR" i],[data-imart-status*=" EXP'
||'IR" i],[data-imart-status*="-EXPIR" i],[data-imart-status*="/EXPIR" i],[data-imart-status^="OVERDUE" i],[data-imart-status*=" OVERDUE" i],[data-imart-status*="-OVERDUE" i],[data-imart-status*="/OVERDUE" i],[data-imart-status^="UNPAID" i],[data-imart-'
||'status*=" UNPAID" i],[data-imart-status*="-UNPAID" i],[data-imart-status*="/UNPAID" i],[data-imart-status^="UNAPPROV" i],[data-imart-status*=" UNAPPROV" i],[data-imart-status*="-UNAPPROV" i],[data-imart-status*="/UNAPPROV" i],[data-imart-status^="CRI'
||'TICAL" i],[data-imart-status*=" CRITICAL" i],[data-imart-status*="-CRITICAL" i],[data-imart-status*="/CRITICAL" i],[data-imart-status^="STOCKOUT" i],[data-imart-status*=" STOCKOUT" i],[data-imart-status*="-STOCKOUT" i],[data-imart-status*="/STOCKOUT"'
||' i],[data-imart-status^="STOCK OUT" i],[data-imart-status*=" STOCK OUT" i],[data-imart-status*="-STOCK OUT" i],[data-imart-status*="/STOCK OUT" i],[data-imart-status^="STOCK-OUT" i],[data-imart-status*=" STOCK-OUT" i],[data-imart-status*="-STOCK-OUT"'
||' i],[data-imart-status*="/STOCK-OUT" i],[data-imart-status^="NEGATIVE" i],[data-imart-status*=" NEGATIVE" i],[data-imart-status*="-NEGATIVE" i],[data-imart-status*="/NEGATIVE" i],[data-imart-status^="DEAD" i],[data-imart-status*=" DEAD" i],[data-imar'
||'t-status*="-DEAD" i],[data-imart-status*="/DEAD" i],[data-imart-status^="BELOW MIN" i],[data-imart-status*=" BELOW MIN" i],[data-imart-status*="-BELOW MIN" i],[data-imart-status*="/BELOW MIN" i],[data-imart-status^="BELOW-MIN" i],[data-imart-status*='
||'" BELOW-MIN" i],[data-imart-status*="-BELOW-MIN" i],[data-imart-status*="/BELOW-MIN" i],[data-imart-status^="STILL NO" i],[data-imart-status*=" STILL NO" i],[data-imart-status*="-STILL NO" i],[data-imart-status*="/STILL NO" i],[data-imart-status^="ST'
||'ILL-NO" i],[data-imart-status*=" STILL-NO" i],[data-imart-status*="-STILL-NO" i],[data-imart-status*="/STILL-NO" i],[data-imart-status^="SHORTAGE" i],[data-imart-status*=" SHORTAGE" i],[data-imart-status*="-SHORTAGE" i],[data-imart-status*="/SHORTAGE'
||'" i]){background:#fdecef!important;color:#be2a45!important}',
'',
'/* IMART106_HEADER_LABEL_CENTER: keep existing link height/padding/colors. */',
'html.page-263 #R448871020061554529 .a-IRR-table th.a-IRR-header > .a-IRR-headerLink{display:block!important;align-content:center!important;}',
'html.page-263 #R448871020061554529 .a-IRR-table th.a-IRR-header.u-tR > .a-IRR-headerLink{justify-content:flex-end;}',
'html.page-263 #R448871020061554529 .a-IRR-table th.a-IRR-header.u-tC > .a-IRR-headerLink{justify-content:center;}',
'</style>',
''))
,p_javascript_file_urls=>'#APP_FILES#imart-register-finder-all.js?initial105=1&v=20261005a'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'/* IMART_REGISTER_FINDER_ALL_V1 */',
'IMARTRegisterFinder.init({"pageId":263,"regionSelector":"#R448871020061554529","process":"IMART_REGISTER_RECORD_FINDER_ALL","title":"Search Module Flow Records","placeholder":"Search module flow records...","description":"Type to find and open any mo'
||'dule flow available to your user","columns":[{"key":"record","label":"Module Flow No","width":"32.9%"},{"key":"code","label":"Code","width":"15.7%"},{"key":"status","label":"Status","width":"15.7%"},{"key":"description","label":"Description","width":'
||'"35.7%"}]});',
'/* IMART_COMPLETED_263_0_INITIAL_COLLAPSE: native presentation only. */',
'(function(){',
' var panel=document.getElementById(''R448871020061554529_control_panel'');',
' if(!panel)return;',
' apex.theme.closeRegion(''R448871020061554529_control_panel'');',
' document.getElementById(''R448871020061554529'').setAttribute(''data-imart-initial-collapse'',''ready'');',
'})();',
''))
,p_css_file_urls=>'#APP_FILES#imart-register-finder-all.css?v=20261005a'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */',
'details#hspl-keyboard-help{display:none!important}',
'',
'/* IMART_MASTER_CARD_COMPACT_20261005: ONLY master list 263; existing KPIs, maximum four desktop tracks. */',
'html #t_Body_content #mr-register-kpis-263{margin:0 0 3px!important;padding:6px 8px!important;border-radius:10px!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-grid{display:grid!important;grid-template-columns:repeat(auto-fit,minmax(min(100%,270px),270px))!important;grid-auto-columns:auto!important;max-width:1104px!important;justify-content:start!important;'
||'gap:8px!important;min-height:0!important;align-items:start!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-inline-kpi{box-sizing:border-box!important;width:100%!important;min-width:0!important;max-width:none!important;height:82px!important;min-height:82px!important;max-height:82px!important;padding:8px 10px!i'
||'mportant;border-radius:9px!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-card-body{min-height:0!important;gap:6px!important;padding:0!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-card-icon{width:26px!important;height:26px!important;border-radius:8px!important;font-size:14px!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-status{margin:0!important;font-size:10px!important;line-height:1.2!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-inline-kpi strong{margin:0!important;font-size:22px!important;line-height:1!important;letter-spacing:-.3px!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-share{margin:1px 0!important;font-size:9.5px!important;line-height:1.2!important;white-space:nowrap!important;overflow:hidden!important;text-overflow:ellipsis!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-card-bottom{padding-top:3px!important;gap:5px!important;font-size:9.5px!important;line-height:1.2!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-wave{width:40px!important;height:15px!important;bottom:4px!important;opacity:.24!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-method{margin-top:3px!important;font-size:10px!important;line-height:1.15!important}',
'@media(max-width:580px){html #t_Body_content #mr-register-kpis-263 .mr-kpi-grid{grid-template-columns:minmax(0,270px)!important}}',
'',
'/* IMART_COMPLETED_263_0_REGISTER_PREVIEW_V1: ONLY KPI group mr-register-kpis-263. Initial native disclosure, no delayed collapse. */',
'#imart-register-263-breadcrumb{margin:0 0 3px;padding:0 2px;color:#64748b;font-size:11px;line-height:18px}',
'#imart-register-263-breadcrumb ol{display:flex;align-items:center;flex-wrap:wrap;gap:7px;list-style:none;padding:0;margin:0}',
'#imart-register-263-breadcrumb li+li::before{content:"/";margin-right:7px;color:#94a3b8}',
'#imart-register-263-breadcrumb [aria-current="page"]{color:#334155;font-weight:600}',
'#imart-register-263-kpi-disclosure{margin:0 0 3px;border:1px solid #e0e5f2;border-radius:10px;background:linear-gradient(120deg,#fff 65%,#faf9ff)}',
'#imart-register-263-kpi-disclosure>summary{display:flex;align-items:center;gap:8px;min-height:34px;padding:7px 11px;box-sizing:border-box;cursor:pointer;list-style:none;font-size:12px;font-weight:600;color:#596781}',
'#imart-register-263-kpi-disclosure>summary::-webkit-details-marker{display:none}',
'#imart-register-263-kpi-disclosure>summary>.fa{color:#6658d7;font-size:14px}',
'#imart-register-263-kpi-disclosure>summary:focus-visible{outline:2px solid #6658d7;outline-offset:2px;border-radius:9px}',
'#imart-register-263-kpi-disclosure .imart-register-263-kpi-caption{font-size:11px;font-weight:400;color:#8790a3;margin-left:6px}',
'#imart-register-263-kpi-disclosure .imart-register-263-kpi-show,#imart-register-263-kpi-disclosure .imart-register-263-kpi-hide{margin-left:auto;font-size:11px;color:#6658d7}',
'#imart-register-263-kpi-disclosure .imart-register-263-kpi-hide{display:none}',
'#imart-register-263-kpi-disclosure[open] .imart-register-263-kpi-show{display:none}',
'#imart-register-263-kpi-disclosure[open] .imart-register-263-kpi-hide{display:inline}',
'#imart-register-263-kpi-disclosure .imart-register-263-kpi-chevron{width:6px;height:6px;border-right:1.5px solid currentColor;border-bottom:1.5px solid currentColor;transform:rotate(45deg);margin:0 3px 3px 6px}',
'#imart-register-263-kpi-disclosure[open] .imart-register-263-kpi-chevron{transform:rotate(225deg);margin-bottom:0}',
'html #t_Body_content #mr-register-kpis-263{margin:0!important;border:0!important;box-shadow:none!important;padding:4px 8px 6px!important;background:transparent!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-grid{display:grid!important;grid-template-columns:repeat(auto-fit,minmax(min(100%,270px),270px))!important;grid-auto-columns:auto!important;max-width:1104px!important;justify-content:start!important;'
||'gap:8px!important;min-height:0!important;align-items:start!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-inline-kpi{box-sizing:border-box!important;width:100%!important;min-width:0!important;max-width:none!important;height:82px!important;min-height:82px!important;max-height:82px!important;padding:8px 10px!i'
||'mportant;border-radius:9px!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-card-body{min-height:0!important;gap:6px!important;padding:0!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-card-icon{width:26px!important;height:26px!important;border-radius:8px!important;font-size:14px!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-status{margin:0!important;font-size:10px!important;line-height:1.2!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-inline-kpi strong{margin:0!important;font-size:22px!important;line-height:1!important;letter-spacing:-.3px!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-share{margin:1px 0!important;font-size:9.5px!important;line-height:1.2!important;white-space:nowrap!important;overflow:hidden!important;text-overflow:ellipsis!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-card-bottom{padding-top:3px!important;gap:5px!important;font-size:9.5px!important;line-height:1.2!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-wave{width:40px!important;height:15px!important;bottom:4px!important;opacity:.24!important}',
'html #t_Body_content #mr-register-kpis-263 .mr-kpi-method{margin-top:3px!important;font-size:10px!important;line-height:1.15!important}',
'/* Report highlight settings stay native and available. Collapse initial content before native initialization; expansion restores it. */',
'#R448871020061554529:not([data-imart-initial-collapse="ready"]) #R448871020061554529_control_panel>.a-MediaBlock-content{display:none!important}',
'#R448871020061554529:not([data-imart-initial-collapse="ready"]) #R448871020061554529_control_panel>.a-IRR-reportSummaryContainer{display:block!important}',
'',
'/* IMART_COMPLETED_263_0_NATIVE_COLLAPSED_SUMMARY_V1: retain the native highlight summary when initialized closed. */',
'#R448871020061554529_control_panel.is-collapsed>.a-IRR-reportSummaryContainer{display:block!important}',
'',
'@media(max-width:580px){html #t_Body_content #mr-register-kpis-263 .mr-kpi-grid{grid-template-columns:minmax(0,270px)!important}}',
'',
'/* IMART_KPI_POINTER_FOCUS_20261005: only existing KPI summary controls. */',
'html #t_Body_content #imart-register-263-kpi-disclosure>summary,',
'html #t_Body_content #imart-register-263-kpi-disclosure>summary *{user-select:none;-webkit-user-select:none}',
'html #t_Body_content #imart-register-263-kpi-disclosure>summary:focus:not(:focus-visible){outline:none!important;box-shadow:none!important}',
''))
,p_step_template=>wwv_flow_imp.id(95002006000005)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448871020061554529)
,p_plug_name=>'Module Flow'
,p_static_id=>'module-flow'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select mr_source.* from (Select a.TNo,',
'       a.ModuleFlowNo,',
'       f.ModuleFlowNo as "On Module Flow No",',
'       b.ModuleName,',
'       c.DocumentStatusName,',
'       e.BossUserName,',
'       d.updateprivilege,',
'       d.onlyifcreator,',
'       substr(getDocumentStatusCode(''MODULEFLOW'', a.TNO), 1, 100) As ModuleFlowStatus,',
'       getmoduleflowcondition(a.tno) as Condition ',
'  From ModuleFlow     a,',
'       Module         b,',
'       DocumentStatus c,',
'       ModuleFlowUser d,',
'       BossUser       e,',
'       ModuleFlow     f',
' Where a.ModuleCode = b.ModuleCode',
'   And a.DocumentStatusCode = c.DocumentStatusCode(+)',
'   And a.TNo = d.TNo(+)',
'   and a.ONPASSINGOFMODULEFLOWTNO= f.tno(+)',
'   And d.BossUserCode = e.BossUserCode(+)',
' Order By b.ModuleName, a.ModuleFlowNo',
'',
') mr_source where ((select imart_register_kpis.selected_mode(263) from dual)=''ALL'' or ((select imart_register_kpis.selected_mode(263) from dual)=''STATUS'' and nvl(trim(cast((select ds.documentstatuscode from documentstatusdetail ds where ds.modulecode'
||'=''MODULEFLOW'' and ds.moduletno=mr_source.TNO fetch first 1 row only) as varchar2(4000))),chr(1))=nvl((select imart_register_kpis.selected_status(263) from dual),chr(1))) or ((select imart_register_kpis.selected_mode(263) from dual)=''RECENT'' and exist'
||'s(select 1 from MODULEFLOW mr_created where mr_created.TNO=mr_source.TNO and mr_created.CREATIONTIME >= sysdate-7 and mr_created.CREATIONTIME <= sysdate)) or ((select imart_register_kpis.selected_mode(263) from dual)=''MINE'' and exists(select 1 from M'
||'ODULEFLOW mr_created where mr_created.TNO=mr_source.TNO and upper(trim(mr_created.CREATOR))=upper(trim(:APP_USER)))))'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Module Flow'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(448871118210554529)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:264:&SESSION.::&DEBUG.:RP,:P264_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_detail_link_condition_type=>'EXISTS'
,p_detail_link_cond=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select 1',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.PAGENO = :APP_PAGE_ID',
'   --and a.modulecode=''CITY''',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE',
'   And B.UPDATEPRIVILEGE = ''YES'''))
,p_internal_uid=>231370433397335795
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(447828407235349199)
,p_db_column_name=>'BOSSUSERNAME'
,p_display_order=>34
,p_column_identifier=>'S'
,p_column_label=>'Boss User Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468167898971913714)
,p_db_column_name=>'CONDITION'
,p_display_order=>64
,p_column_identifier=>'V'
,p_column_label=>'Condition'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(447828301261349198)
,p_db_column_name=>'DOCUMENTSTATUSNAME'
,p_display_order=>24
,p_column_identifier=>'R'
,p_column_label=>'Document Status Name'
,p_column_html_expression=>'<span class="hspl-status-pill is-info imart-initial-status imart-initial-status-263" data-imart-status="#DOCUMENTSTATUSNAME!ATTR#">#DOCUMENTSTATUSNAME!HTML#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448872641058554533)
,p_db_column_name=>'MODULEFLOWNO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Module Flow No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(447828434296349200)
,p_db_column_name=>'MODULEFLOWSTATUS'
,p_display_order=>44
,p_column_identifier=>'T'
,p_column_label=>'Module Flow Status'
,p_column_html_expression=>'<span class="hspl-status-pill is-info imart-initial-status imart-initial-status-263" data-imart-status="#MODULEFLOWSTATUS!ATTR#">#MODULEFLOWSTATUS!HTML#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(447828195880349197)
,p_db_column_name=>'MODULENAME'
,p_display_order=>14
,p_column_identifier=>'Q'
,p_column_label=>'Module Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468168060278913716)
,p_db_column_name=>'ONLYIFCREATOR'
,p_display_order=>84
,p_column_identifier=>'X'
,p_column_label=>'Only If Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(417724440009986525)
,p_db_column_name=>'On Module Flow No'
,p_display_order=>54
,p_column_identifier=>'U'
,p_column_label=>'On Module Flow No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448871822131554533)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_column_identifier=>'B'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468168005446913715)
,p_db_column_name=>'UPDATEPRIVILEGE'
,p_display_order=>74
,p_column_identifier=>'W'
,p_column_label=>'Update Privilege'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(448936569480830110)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'583549'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'MODULEFLOWNO:On Module Flow No:MODULENAME:DOCUMENTSTATUSNAME:BOSSUSERNAME:ONLYIFCREATOR:UPDATEPRIVILEGE:MODULEFLOWSTATUS:CONDITION'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2026100200026300)
,p_plug_name=>'Master KPI Cards'
,p_static_id=>'mr-kpi-shell-263'
,p_region_template_options=>'#DEFAULT#:t-Region--noUI'
,p_plug_template=>3371237801798025892
,p_plug_display_sequence=>9
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin htp.p(q''^<style>.mr-register-kpis[hidden]{display:none!important}',
'button[aria-controls^="mr-register-kpis-"]{display:inline-flex;align-items:center;justify-content:center;gap:7px;margin-right:4px;padding:8px 11px!important;min-height:0;border:1px solid #c5bfee!important;border-radius:9px!important;background:linear'
||'-gradient(135deg,#fff,#f5f3ff)!important;color:#6255d7!important;font-weight:600!important;font-size:13px!important;box-shadow:0 2px 5px #5846c80c!important}',
'button[aria-controls^="mr-register-kpis-"]::before{content:"";display:block;flex:none;width:15px;height:15px;background:linear-gradient(currentColor,currentColor) left bottom/3px 7px no-repeat,linear-gradient(currentColor,currentColor) center bottom/'
||'3px 13px no-repeat,linear-gradient(currentColor,currentColor) right bottom/3px 10px no-repeat}',
'button[aria-controls^="mr-register-kpis-"]:hover{border-color:#9687e7!important;background:#eeebff!important}',
'button[aria-controls^="mr-register-kpis-"][aria-expanded="true"]{border-color:#a89de6!important;background:#f2efff!important;color:#5846c8!important}',
'button[aria-controls^="mr-register-kpis-"]:focus-visible{outline:2px solid #6658d7;outline-offset:3px}',
'.mr-register-kpis{margin:0 0 18px;padding:22px;border:1px solid #e0e5f2;border-radius:18px;background:linear-gradient(120deg,#fff 65%,#faf9ff);box-shadow:0 4px 18px #24336205}',
'.mr-register-kpis header{display:flex;flex-wrap:wrap;align-items:center;justify-content:space-between;gap:16px;margin-bottom:20px}',
'.mr-register-kpis .mr-kpi-heading{display:flex;align-items:center;gap:13px;min-width:0}',
'.mr-register-kpis .mr-kpi-heading-icon{display:grid;place-items:center;width:44px;height:44px;flex:none;border-radius:13px;background:#eeecff;color:#6255d7;font-size:20px}',
'.mr-register-kpis .mr-kpi-eyebrow{font-size:10px;font-weight:700;letter-spacing:1.4px;color:#847baf;display:block;margin-bottom:5px}',
'.mr-register-kpis h2{font-size:19px;font-weight:700;line-height:1.3;color:#202a43;margin:0}',
'.mr-register-kpis .mr-kpi-subtitle{font-size:12px;color:#79849b;margin:5px 0 0}',
'.mr-register-kpis .mr-kpi-close{display:flex;align-items:center;gap:7px;flex:none;border:1px solid #e2e5f0;border-radius:9px;padding:8px 12px;background:#fff;color:#657089;font:inherit;font-size:12px;cursor:pointer}',
'.mr-register-kpis .mr-kpi-close:hover{color:#5d50d2;border-color:#bcb5ee;background:#faf9ff}',
'.mr-register-kpis .mr-kpi-grid{display:grid;grid-template-columns:repeat(auto-fit,minmax(min(100%,190px),1fr));gap:14px}',
'.mr-register-kpis .mr-inline-kpi{--kpi-accent:#6658d7;--kpi-tint:#efedff;--kpi-line:#e3defb;position:relative;overflow:hidden;display:flex;flex-direction:column;gap:0;min-width:0;width:100%;padding:17px 18px 14px;border:1px solid var(--kpi-line);bord'
||'er-radius:13px;background:linear-gradient(125deg,#fff,var(--kpi-tint));font-family:inherit;text-align:left;cursor:pointer;color:#202a43;box-shadow:0 2px 5px #24336203}',
'.mr-register-kpis .mr-inline-kpi[data-tone="success"]{--kpi-accent:#198a68;--kpi-tint:#edf9f3;--kpi-line:#d8eee4}',
'.mr-register-kpis .mr-inline-kpi[data-tone="warning"]{--kpi-accent:#b87b19;--kpi-tint:#fff8e9;--kpi-line:#f0e4c7}',
'.mr-register-kpis .mr-inline-kpi[data-tone="danger"]{--kpi-accent:#c55364;--kpi-tint:#fff0f2;--kpi-line:#f2dce2}',
'.mr-register-kpis .mr-inline-kpi[data-tone="neutral"]{--kpi-accent:#738099;--kpi-tint:#f2f5fa;--kpi-line:#e0e5ee}',
'.mr-register-kpis .mr-inline-kpi[data-tone="info"]{--kpi-accent:#397db7;--kpi-tint:#edf6ff;--kpi-line:#dceafa}',
'.mr-register-kpis .mr-inline-kpi:hover{border-color:var(--kpi-accent);box-shadow:0 4px 14px #2433620a}',
'.mr-register-kpis .mr-inline-kpi[aria-pressed="true"]{border-color:var(--kpi-accent);box-shadow:inset 0 0 0 1px var(--kpi-accent),0 4px 14px #24336208}',
'.mr-register-kpis .mr-inline-kpi:focus-visible,.mr-register-kpis .mr-kpi-close:focus-visible{outline:2px solid #6658d7;outline-offset:3px}',
'.mr-register-kpis .mr-inline-kpi:disabled{cursor:progress;opacity:.75}',
'.mr-register-kpis .mr-kpi-card-top{display:flex;justify-content:space-between;align-items:center;gap:12px;margin-bottom:10px}',
'.mr-register-kpis .mr-kpi-status{display:flex;align-items:center;gap:7px;font-size:12px;font-weight:600;color:#606d85}',
'.mr-register-kpis .mr-kpi-status::before{content:"";width:6px;height:6px;border-radius:50%;background:var(--kpi-accent);flex:none}',
'.mr-register-kpis .mr-kpi-card-icon{display:grid;place-items:center;flex:none;width:31px;height:31px;border:1px solid var(--kpi-line);border-radius:9px;background:#ffffffb3;color:var(--kpi-accent);font-size:16px}',
'.mr-register-kpis .mr-inline-kpi strong{font-size:32px;line-height:1.15;font-weight:700;letter-spacing:-.8px;color:#202a43;margin-bottom:5px}',
'.mr-register-kpis .mr-kpi-share{font-size:11px;color:#8790a3;margin-bottom:13px}',
'.mr-register-kpis .mr-kpi-card-bottom{display:flex;justify-content:space-between;align-items:center;border-top:1px solid var(--kpi-line);padding-top:10px;gap:10px;color:var(--kpi-accent);font-size:11px;font-weight:600}',
'.mr-register-kpis .mr-kpi-selected{display:none}',
'.mr-register-kpis [aria-pressed="true"] .mr-kpi-selected{display:inline}',
'.mr-register-kpis [aria-pressed="true"] .mr-kpi-unselected{display:none}',
'.mr-register-kpis .mr-kpi-method{margin-top:13px;color:#8790a3;font-size:11px}',
'.mr-register-kpis .mr-kpi-method summary{cursor:pointer;list-style:none;display:inline-flex;align-items:center;gap:6px}',
'.mr-register-kpis .mr-kpi-method summary::-webkit-details-marker{display:none}',
'.mr-register-kpis .mr-kpi-method p{font-size:11px;line-height:1.6;color:#738099;margin:8px 0 0;max-width:1000px}',
'.mr-register-kpis .mr-kpi-card-body{display:flex;align-items:flex-start;gap:17px;position:relative;padding:3px 0 0;min-height:100px}',
'.mr-register-kpis .mr-kpi-card-details{display:flex;flex-direction:column;min-width:0;position:relative;z-index:1}',
'.mr-register-kpis .mr-kpi-card-icon{width:45px;height:45px;border:0;border-radius:16px;background:var(--kpi-tint);font-size:24px}',
'.mr-register-kpis .mr-kpi-status{font-size:13px;margin:5px 0 8px}',
'.mr-register-kpis .mr-kpi-status::before{display:none}',
'.mr-register-kpis .mr-kpi-share{margin-bottom:13px}',
'.mr-register-kpis .mr-kpi-wave{position:absolute;right:0;bottom:18px;width:105px;height:39px;color:var(--kpi-accent);opacity:.65;pointer-events:none}',
'.mr-register-kpis .mr-kpi-wave svg{display:block;width:100%;height:100%}',
'@media(max-width:1000px){.mr-register-kpis .mr-kpi-wave{width:75px;opacity:.35}}',
'@media(max-width:650px){.mr-register-kpis{padding:16px}.mr-register-kpis h2{font-size:16px}.mr-register-kpis .mr-kpi-heading-icon{display:none}.mr-register-kpis .mr-kpi-grid{gap:10px}.mr-register-kpis .mr-inline-kpi{padding:13px}.mr-register-kpis .mr'
||'-inline-kpi strong{font-size:27px}.mr-register-kpis .mr-kpi-card-top{flex-wrap:wrap;gap:6px}}',
'@media(max-width:380px){.mr-register-kpis .mr-kpi-grid{grid-template-columns:1fr}}',
'.mr-register-kpis{padding:12px;margin-bottom:12px}',
'.mr-register-kpis header{gap:10px;margin-bottom:10px}',
'.mr-register-kpis .mr-kpi-heading{gap:9px}',
'.mr-register-kpis .mr-kpi-heading-icon{width:32px;height:32px;border-radius:10px;font-size:17px}',
'.mr-register-kpis .mr-kpi-eyebrow{margin-bottom:2px;letter-spacing:1px}',
'.mr-register-kpis h2{font-size:16px}',
'.mr-register-kpis .mr-kpi-subtitle{margin-top:3px;font-size:11px}',
'.mr-register-kpis .mr-kpi-grid{gap:9px}',
'.mr-register-kpis .mr-inline-kpi{padding:7px 10px 6px;border-radius:10px}',
'.mr-register-kpis .mr-kpi-card-body{min-height:0;gap:8px;padding:0}',
'.mr-register-kpis .mr-kpi-card-icon{width:27px;height:27px;border-radius:9px;font-size:17px}',
'.mr-register-kpis .mr-kpi-status{font-size:11px;line-height:1.3;margin:0 0 1px}',
'.mr-register-kpis .mr-inline-kpi strong{font-size:22px;line-height:1.05;margin:0;letter-spacing:-.4px}',
'.mr-register-kpis .mr-kpi-share{font-size:10px;line-height:1.3;margin:1px 0 2px}',
'.mr-register-kpis .mr-kpi-card-bottom{padding-top:4px;gap:6px;font-size:10px;line-height:1.3}',
'.mr-register-kpis .mr-kpi-card-bottom>.fa{font-size:11px;line-height:13px}',
'.mr-register-kpis .mr-kpi-wave{width:48px;height:18px;bottom:5px;opacity:.3}',
'.mr-register-kpis .mr-kpi-method{margin-top:8px}',
'.mr-register-kpis .mr-kpi-grid{min-height:87px}',
'</style><nav id="imart-register-263-breadcrumb" aria-label="Breadcrumb"><ol><li>Home</li><li>Setup &amp; Admin</li><li aria-current="page">Module Flow List</li></ol></nav><details id="imart-register-263-kpi-disclosure"><summary><span class="fa fa-bar'
||'-chart" aria-hidden="true"></span><span>KPIs <span class="imart-register-263-kpi-caption">Record summary</span></span><span class="imart-register-263-kpi-show">Show KPIs</span><span class="imart-register-263-kpi-hide">Hide KPIs</span><span class="ima'
||'rt-register-263-kpi-chevron" aria-hidden="true"></span></summary><section id="mr-register-kpis-263" class="mr-register-kpis" data-report-region="module-flow" data-report-label="Module&#x20;Flow" aria-label="Master KPIs"><div class="mr-kpi-grid" data-'
||'kpi-content role="status"></div><details class="mr-kpi-method"><summary><span class="fa fa-info-circle" aria-hidden="true"></span> How counts work</summary><p data-kpi-scope></p></details></section></details><script>(function () {',
'  ''use strict'';',
'  if (window.IMARTMasterKpis) return;',
'  var currentRequest = null;',
'  function section(page) { return document.getElementById(''mr-register-kpis-'' + page); }',
'  function reportId(root) {',
'    var id = root.dataset.reportRegion;',
'    if (id && document.getElementById(id) && apex.region(id)) return id;',
'    var reports = Array.from(document.querySelectorAll(''main .js-apex-region'')).filter(function (el) {',
'      return el.querySelector(''.a-IRR,.a-IG'') && apex.region(el.id);',
'    });',
'    var named = reports.filter(function (el) { return el.getAttribute(''aria-label'') === root.dataset.reportLabel; });',
'    return named.length === 1 ? named[0].id : reports.length === 1 ? reports[0].id : null;',
'  }',
'  function load(page) {',
'    var root = section(page);',
'    if (!root) return;',
'    if (currentRequest) currentRequest.abort();',
'    var content = root.querySelector(''[data-kpi-content]'');',
unistr('    if (!content.querySelector(''button'')) content.textContent = ''Loading KPIs\2026'';'),
'    root.setAttribute(''aria-busy'', ''true'');',
'    currentRequest = apex.server.process(''IMART_REGISTER_KPIS'', {x01: String(page)}, {',
'      dataType: ''json'', timeout: 15000,',
'      success: function (data) {',
'        root.dataset.reportRegion = reportId(root) || data.region;',
'        root.querySelector(''[data-kpi-scope]'').textContent = data.scope;',
'        content.replaceChildren();',
'        var total = Number(String(data.cards[0].value).replace(/[^0-9.-]/g, ''''));',
'        data.cards.forEach(function (card) {',
'          if (card.mode === ''STATUS'' && (card.status == null || /^NO[ _-]?STATUS$/i.test(String(card.label).trim()))) return;',
'          var el = document.createElement(''button''), label = document.createElement(''span''),',
'            value = document.createElement(''strong''), share = document.createElement(''span''),',
'            top = document.createElement(''span''), icon = document.createElement(''span''),',
'            bottom = document.createElement(''span''), action = document.createElement(''span''), arrow = document.createElement(''span''),',
'            body = document.createElement(''span''), details = document.createElement(''span''), wave = document.createElement(''span'');',
'          var status = String(card.label).toUpperCase(), tone = ''info'', iconName = ''fa-circle-o'';',
'          if (card.mode === ''ALL'') { tone = ''total''; iconName = ''fa-th-large''; }',
'          else if (card.mode === ''RECENT'') { tone = ''info''; iconName = ''fa-calendar''; }',
'          else if (card.mode === ''MINE'') { tone = ''total''; iconName = ''fa-user''; }',
'          else if (/NON.?ACTIVE|INACTIVE|CANCEL|REJECT/.test(status)) { tone = ''danger''; iconName = ''fa-ban''; }',
'          else if (/^ACTIVE$|CLOSED|COMPLETE|APPROV|AUTHORI/.test(status)) { tone = ''success''; iconName = ''fa-check-circle-o''; }',
'          else if (/PREPAR|PEND|DRAFT|OPEN/.test(status)) { tone = ''warning''; iconName = ''fa-clock-o''; }',
'          else if (/NO STATUS/.test(status)) { tone = ''neutral''; iconName = ''fa-minus-circle''; }',
'          el.className = ''mr-inline-kpi''; el.dataset.tone = tone;',
'          label.className = ''mr-kpi-status''; label.textContent = card.mode === ''ALL'' ? ''Total records'' : card.label.replace(/[_-]/g, '' '').toLowerCase().replace(/\b\w/g, function (s) { return s.toUpperCase(); });',
'          top.className = ''mr-kpi-card-top''; icon.className = ''mr-kpi-card-icon fa '' + (card.mode === ''ALL'' ? ''fa-file-text-o'' : iconName); icon.setAttribute(''aria-hidden'', ''true'');',
'          el.type = ''button''; el.setAttribute(''aria-pressed'', String(card.selected));',
'          el.setAttribute(''aria-label'', card.label + '': '' + card.value);',
'          value.textContent = card.value; share.className = ''mr-kpi-share'';',
'          var count = Number(String(card.value).replace(/[^0-9.-]/g, ''''));',
'          share.textContent = card.note || (card.mode === ''ALL'' ? ''All records in this scope'' : (total ? (count / total * 100).toFixed(1) : ''0'') + ''% of total records'');',
'          bottom.className = ''mr-kpi-card-bottom''; action.innerHTML = ''<span class="mr-kpi-unselected">View records</span><span class="mr-kpi-selected">Showing records</span>'';',
'          arrow.className = ''fa fa-arrow-right''; arrow.setAttribute(''aria-hidden'', ''true''); bottom.append(action, arrow);',
'          el.addEventListener(''click'', function () {',
'            var buttons = content.querySelectorAll(''button'');',
'            buttons.forEach(function (b) { b.disabled = true; });',
'            apex.server.process(''IMART_KPI_STATUS_FILTER'', {x01: String(page), x02: card.mode, x03: card.status}, {',
'              dataType: ''json'', timeout: 15000,',
'              success: function () {',
'                buttons.forEach(function (b) { b.setAttribute(''aria-pressed'', String(b === el)); });',
'                var id = reportId(root), report = id && apex.region(id);',
'                if (id) root.dataset.reportRegion = id;',
'                if (report) report.refresh();',
'                else apex.message.alert(''The register could not be refreshed. Please reload this page.'');',
'              },',
'              error: function () { apex.message.alert(''KPI filter could not be applied. Please retry.''); },',
'              complete: function () { buttons.forEach(function (b) { b.disabled = false; }); }',
'            });',
'          });',
'          details.className = ''mr-kpi-card-details''; details.append(label, value, share);',
'          body.className = ''mr-kpi-card-body''; body.append(icon, details);',
'          wave.className = ''mr-kpi-wave''; wave.setAttribute(''aria-hidden'', ''true'');',
'          wave.innerHTML = ''<svg viewBox="0 0 120 44" fill="none" focusable="false"><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72 9 84 19 S98 26 119 13" stroke="currentColor" stroke-width="1.2"/><path d="M1 30 C12 24 20 18 30 24 S43 34 56 25 S72'
||' 9 84 19 S98 26 119 13 V44 H1 Z" fill="currentColor" opacity=".06"/></svg>'';',
'          body.append(wave); el.append(body, bottom); content.append(el);',
'        });',
'      },',
'      error: function (request, status) {',
'        if (status !== ''abort'' && !content.querySelector(''.mr-inline-kpi'')) {',
'          content.textContent = ''KPIs could not be loaded. '';',
'          var retry = document.createElement(''button'');',
'          retry.type = ''button''; retry.textContent = ''Retry'';',
'          retry.addEventListener(''click'', function () { load(page); });',
'          content.append(retry);',
'        }',
'      },',
'      complete: function () { currentRequest = null; root.removeAttribute(''aria-busy''); }',
'    });',
'  }',
'  function listen() {',
'    var initial = document.querySelector(''.mr-register-kpis'');',
'    if (initial) load(Number(initial.id.replace(''mr-register-kpis-'', '''')));',
'    apex.jQuery(document).on(''apexafterrefresh.imartMasterKpis'', ''.js-apex-region'', function () {',
'    var root = document.querySelector(''.mr-register-kpis'');',
'    if (!root) return;',
'    var page = Number(root.id.replace(''mr-register-kpis-'', ''''));',
'    if (root.dataset.reportRegion === this.id) load(page);',
'  }); }',
'  window.IMARTMasterKpis = {reload: load};',
'  if (document.readyState === ''loading'') document.addEventListener(''DOMContentLoaded'', listen, {once: true});',
'  else listen();',
'})();',
'</script>^'');end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'FUNCTION_BODY'
,p_plug_display_when_condition=>'begin for r in (select module_code from imart_mr_catalog where register_page=:APP_PAGE_ID) loop if imart_master_reports.allowed(r.module_code)=1 then return true; end if; end loop; return false; end;'
,p_plug_display_when_cond2=>'PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(95002006010263)
,p_plug_name=>'Register initial approved title'
,p_static_id=>'register-initial-approved-title'
,p_region_name=>'imart-initial-title-263'
,p_region_attributes=>'style="display:contents"'
,p_plug_template=>wwv_flow_imp.id(95001071000503)
,p_plug_display_sequence=>1
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>'<div class="hspl-hero-icon"><svg viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.7" stroke-linecap="round" stroke-linejoin="round" aria-hidden="true"><path d="M14 3H7a2 2 0 0 0-2 2v14a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V8z"></path><p'
||'ath d="M14 3v5h5M9 13h6M9 17h6M9 9h1"></path></svg></div><div class="hspl-title-block"><h1 class="hspl-page-title">Module Flow List</h1></div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(304068721458752801)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(448871020061554529)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:264:&SESSION.::&DEBUG.:264::'
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
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(304070071985752804)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(448871020061554529)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304070573004752808)
,p_event_id=>wwv_flow_imp.id(304070071985752804)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(448871020061554529)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(304070899641752811)
,p_name=>'IG Pagination'
,p_static_id=>'ig-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304071472003752813)
,p_event_id=>wwv_flow_imp.id(304070899641752811)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2026100502000263)
,p_process_sequence=>100
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART_REGISTER_RECORD_FINDER_ALL'
,p_static_id=>'imart-register-record-finder-all'
,p_process_sql_clob=>'begin IMART_REGISTER_FINDER.search;end;'
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2026100502000263
);
end;
/
prompt --application/pages/delete_00264
begin
wwv_flow_imp_page.remove_page (p_flow_id=>wwv_flow.g_flow_id, p_page_id=>264);
end;
/
prompt --application/pages/page_00264
begin
wwv_flow_imp_page.create_page(
 p_id=>264
,p_name=>'Module Flow'
,p_alias=>'MODULE-FLOW'
,p_page_mode=>'MODAL'
,p_step_title=>'Module Flow'
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
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'',
'/* WIDE_GRID_HORIZONTAL_BAR_STANDARD_V1 */',
'/* A track appears only when the grid columns exceed the available width. */',
'.a-IG .a-GV-bdy {',
'  overflow-x: auto !important;',
'}',
'',
'.a-IG .a-GV-w-scroll {',
'  overflow-x: auto !important;',
'}',
'',
'/* IMART_HIDE_KEYBOARD_HELP_ALL_V1 */',
'details#hspl-keyboard-help{display:none!important}',
''))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'1000'
,p_dialog_width=>'1000'
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448873904829559330)
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
 p_id=>wwv_flow_imp.id(447836823629354014)
,p_plug_name=>'Flow Condition'
,p_static_id=>'flow-condition'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'MODULEFLOWCONDITION'
,p_query_where=>'TNO = :P264_TNO'
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'SNO'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447837442913354021)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447837567668354022)
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
 p_id=>wwv_flow_imp.id(447837173974354018)
,p_name=>'COLUMNCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COLUMNCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Column'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'DISTINCT',
'b.TableName || ''.'' || a.ColumnDescriptiveName as ColumnName,',
'a.ColumnCode',
'from TableColumn a, ModuleTable b',
'where a.TableName = b.TableName',
'and b.Modulecode = :P264_ModuleCode',
'order by 1'))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_lov_cascade_parent_items=>'TNO'
,p_ajax_items_to_submit=>'P264_MODULECODE'
,p_ajax_optimize_refresh=>true
,p_use_as_row_header=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447837348090354020)
,p_name=>'COLUMNVALUE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'COLUMNVALUE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Column Value'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>70
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>1000
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447837268501354019)
,p_name=>'LOGICALOPERATOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LOGICALOPERATOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SELECT_LIST'
,p_heading=>'Logical Operator'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>60
,p_value_alignment=>'LEFT'
,p_is_required=>false
,p_lov_type=>'STATIC'
,p_lov_source=>'STATIC:=;=,!=;!=,<;<,<=;<=,>;>,>=;>=,IN;IN,NOT IN;NOT IN,LIKE;LIKE,NOT LIKE;NOT LIKE'
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447837049123354017)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Sno'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447837011122354016)
,p_name=>'TNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'TNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>false
,p_enable_hide=>true
,p_is_primary_key=>false
,p_default_type=>'ITEM'
,p_default_expression=>'P264_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(447836864396354015)
,p_internal_uid=>230336179583135281
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>false
,p_define_chart_view=>false
,p_enable_download=>false
,p_download_formats=>null
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>200
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(449038356426018687)
,p_interactive_grid_id=>wwv_flow_imp.id(447836864396354015)
,p_static_id=>'584490'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(449038597107018687)
,p_report_id=>wwv_flow_imp.id(449038356426018687)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449039078294018688)
,p_view_id=>wwv_flow_imp.id(449038597107018687)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(447837011122354016)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449039951088018690)
,p_view_id=>wwv_flow_imp.id(449038597107018687)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(447837049123354017)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449040843568018692)
,p_view_id=>wwv_flow_imp.id(449038597107018687)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(447837173974354018)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449041774534018694)
,p_view_id=>wwv_flow_imp.id(449038597107018687)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(447837268501354019)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>112.5
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449042685247018695)
,p_view_id=>wwv_flow_imp.id(449038597107018687)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(447837348090354020)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449070764385065809)
,p_view_id=>wwv_flow_imp.id(449038597107018687)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(447837442913354021)
,p_is_visible=>true
,p_is_frozen=>true
,p_width=>52.5
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(448863009868559317)
,p_plug_name=>'Module Flow'
,p_static_id=>'module-flow'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.MODULECODE,',
'       a.MODULEFLOWNO,',
'       a.DOCUMENTSTATUSCODE,',
'       a.ONPASSINGOFMODULEFLOWTNO,',
'       a.ONGETTINGOFPASSMARKS,',
'       a.REBOUNDFAILMARKS,',
'       a.COMPANYCODE,',
'       a.REMARK,',
'       a.CREATOR,',
'       a.COLUMNCODE,',
'       a.BACKMODULEFLOWTNO,',
'       a.ACTIVEDATE,',
'       a.CREATIONTIME,',
'       a.TTC,',
'       a.SHOWONMOBILEAPPS,',
'       nvl(GetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID), a.Tno), ''Status'') AS Status',
'  from MODULEFLOW a'))
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447837914304354025)
,p_plug_name=>'Module Flow User'
,p_static_id=>'module-flow-user'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'MODULEFLOWUSER'
,p_query_where=>'TNO = :P264_TNO'
,p_query_order_by_type=>'STATIC'
,p_query_order_by=>'SNO'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IG'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Module Flow User'
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
 p_id=>wwv_flow_imp.id(447839593506354042)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(449224657942148793)
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
 p_id=>wwv_flow_imp.id(447838272692354029)
,p_name=>'BOSSUSERCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'BOSSUSERCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_POPUP_LOV'
,p_heading=>'Boss User'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_lov_type=>'SQL_QUERY'
,p_lov_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sELECT Bossusername d, bossusercode from bossuser a ',
'--where getdocumentstatuscode(''BOSSUSER'',TNO) = ''ACTIVE'''))
,p_lov_display_extra=>true
,p_lov_display_null=>true
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'LOV'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447838750362354034)
,p_name=>'CAPTIONSIGN'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CAPTIONSIGN'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Caption Sign'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447838536688354032)
,p_name=>'FAILMARKS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'FAILMARKS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Failmarks'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>70
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(447838378100354030)
,p_name=>'MESSAGETEXT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'MESSAGETEXT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Message Text'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
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
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447838855144354035)
,p_name=>'ONLYIFCREATOR'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'ONLYIFCREATOR'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Only If Creator'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>100
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
,p_is_required=>false
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
,p_default_type=>'STATIC'
,p_default_expression=>'NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447838498296354031)
,p_name=>'PASSMARKS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PASSMARKS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Passmarks'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>60
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
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
 p_id=>wwv_flow_imp.id(447838152567354028)
,p_name=>'SNO'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'SNO'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>40
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>true
,p_default_type=>'SEQUENCE'
,p_default_expression=>'GLOBALTNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447838096076354027)
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
,p_default_expression=>'P264_TNO'
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447838694671354033)
,p_name=>'UPDATEPRIVILEGE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'UPDATEPRIVILEGE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_SINGLE_CHECKBOX'
,p_heading=>'Updateprivilege'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>80
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
,p_is_required=>false
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
,p_default_type=>'STATIC'
,p_default_expression=>'NO'
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(447839186659354038)
,p_name=>'WAITDAYS'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'WAITDAYS'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_HIDDEN'
,p_display_sequence=>130
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
,p_use_as_row_header=>false
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>false
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(447837958769354026)
,p_internal_uid=>230337273956135292
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SET'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_toolbar_buttons=>'ACTIONS_MENU'
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'REGION'
,p_fixed_header_max_height=>250
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(449093450853111437)
,p_interactive_grid_id=>wwv_flow_imp.id(447837958769354026)
,p_static_id=>'585041'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(449093658836111437)
,p_report_id=>wwv_flow_imp.id(449093450853111437)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449094126192111438)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(447838096076354027)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449095049240111440)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(447838152567354028)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449095987092111442)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(447838272692354029)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>95
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449096906507111444)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>15
,p_column_id=>wwv_flow_imp.id(447838378100354030)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>98
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449097777809111445)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(447838498296354031)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>79
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449098714194111447)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(447838536688354032)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>74
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449099622322111449)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(447838694671354033)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>113
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449100445099111450)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(447838750362354034)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>85
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449101325894111452)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(447838855144354035)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>92
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449104088716111458)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(447839186659354038)
,p_is_visible=>false
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(449230657662153288)
,p_view_id=>wwv_flow_imp.id(449093658836111437)
,p_display_seq=>0
,p_column_id=>wwv_flow_imp.id(447839593506354042)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(909391138630770572)
,p_plug_name=>'PassFailButtons'
,p_static_id=>'passfailbuttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(304084249568757592)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(448873904829559330)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(304085397339757593)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(448873904829559330)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'NEXT'
,p_button_condition=>'SELECT * FROM MODULEFLOW WHERE TNO = :P264_TNO'
,p_button_condition_type=>'NOT_EXISTS'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(304084616665757593)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(448873904829559330)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P264_TNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(304085035408757593)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(448873904829559330)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'NEXT'
,p_button_condition=>'SELECT * FROM MODULEFLOW WHERE TNO = :P264_TNO'
,p_button_condition_type=>'EXISTS'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(304086247765757594)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(909391138630770572)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_static_id=>'STATUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P169_STATUS.'
,p_button_position=>'ABOVE_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_css_classes=>'js-menuButton'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448868719745559325)
,p_name=>'P264_ACTIVEDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_source=>'ACTIVEDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448868331880559325)
,p_name=>'P264_BACKMODULEFLOWTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'Back Module Flow No'
,p_source=>'BACKMODULEFLOWTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'P169_BACKMODULEFLOW'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>40
,p_cMaxlength=>255
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(448867898026559325)
,p_name=>'P264_COLUMNCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'Column Name'
,p_source=>'COLUMNCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'DISTINCT',
'b.TableName || ''.'' || a.ColumnDescriptiveName as ColumnName,',
'a.ColumnCode',
'from TableColumn a, ModuleTable b',
'where a.TableName = b.TableName',
'and b.Modulecode = :P264_ModuleCode',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_lov_cascade_parent_items=>'P264_MODULECODE'
,p_ajax_items_to_submit=>'P264_TNO,P264_MODULECODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>40
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(448866776597559324)
,p_name=>'P264_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448867488700559324)
,p_name=>'P264_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_default=>'GLOBAL_LOGINNAME'
,p_item_default_type=>'ITEM'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448865203795559324)
,p_name=>'P264_DOCUMENTSTATUSCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'Document Status'
,p_source=>'DOCUMENTSTATUSCODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'Select DocumentStatusName d, DocumentStatusCode r from DocumentStatus order by 1'
,p_lov_display_null=>'YES'
,p_cSize=>40
,p_cMaxlength=>30
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(99061010105002641)
,p_name=>'P264_IMART_SAVE_OP_ID'
,p_item_sequence=>999999
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105002645)
,p_name=>'P264_IMART_STATUS_DONE'
,p_item_sequence=>1000002
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(99061010105002644)
,p_name=>'P264_IMART_STATUS_START'
,p_item_sequence=>1000001
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448864378238559322)
,p_name=>'P264_MODULECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'Module'
,p_source=>'MODULECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sELECT ModuleName d, Modulecode from Module ',
'where pageno != ''1'''))
,p_lov_display_null=>'YES'
,p_cSize=>40
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(448864768344559323)
,p_name=>'P264_MODULEFLOWNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'Module Flow No'
,p_source=>'MODULEFLOWNO'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>40
,p_cMaxlength=>255
,p_colspan=>6
,p_grid_column=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1',
'      from codeschememaster a',
'     where a.modulecode = ''MODULEFLOW''',
'       and a.CodeScheme = ''AUTO'''))
,p_read_only_when_type=>'EXISTS'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448865948701559324)
,p_name=>'P264_ONGETTINGOFPASSMARKS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'On Getting Of Pass Marks'
,p_source=>'ONGETTINGOFPASSMARKS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>40
,p_cMaxlength=>255
,p_colspan=>6
,p_grid_column=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448865545901559324)
,p_name=>'P264_ONPASSINGOFMODULEFLOWTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'On Module Flow No'
,p_source=>'ONPASSINGOFMODULEFLOWTNO'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'a.ModuleFlowNo d,',
'a.TNo r',
'from ModuleFlow a',
'where ',
'a.CompanyCode = :global_CompanyCode',
'and not a.TNo = :P264_TNo',
'AND A.ModuleCode = :P264_MODULECODE',
'order by a.ModuleFlowNo'))
,p_lov_display_null=>'YES'
,p_lov_cascade_parent_items=>'P264_MODULECODE'
,p_ajax_items_to_submit=>'P264_TNO,P264_MODULECODE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>40
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(448866419072559324)
,p_name=>'P264_REBOUNDFAILMARKS'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'Rebound Fail Marks'
,p_source=>'REBOUNDFAILMARKS'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>40
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'right',
  'virtual_keyboard', 'text')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448867156173559324)
,p_name=>'P264_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>60
,p_cMaxlength=>100
,p_colspan=>6
,p_grid_column=>1
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
 p_id=>wwv_flow_imp.id(447836983797354010)
,p_name=>'P264_SHOWONMOBILEAPPS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_default=>'NO'
,p_source=>'SHOWONMOBILEAPPS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(504619356010780496)
,p_name=>'P264_STATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_source=>'STATUS'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(505585619233226079)
,p_name=>'P264_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(909391138630770572)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.STATUSPRIVILEGE',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.ENTRYPAGENO = :APP_PAGE_ID',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE',
'',
''))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448864012460559319)
,p_name=>'P264_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448869604986559328)
,p_name=>'P264_TTC'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_source_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_default=>'0.166'
,p_source=>'TTC'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447837103833354011)
,p_name=>'P264_TTCINMINUTES'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(448863009868559317)
,p_item_default=>'10'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(304098955843757610)
,p_name=>'Cancel Dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(304084249568757592)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304099461575757611)
,p_event_id=>wwv_flow_imp.id(304098955843757610)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(304100743595757615)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(304086247765757594)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304101237504757615)
,p_event_id=>wwv_flow_imp.id(304100743595757615)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P264_STATUS'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304102225134757617)
,p_event_id=>wwv_flow_imp.id(304100743595757615)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_return', 'P264_IMART_STATUS_DONE',
  'items_to_submit', 'P264_TNO,P264_STATUS,P264_IMART_SAVE_OP_ID,P264_IMART_STATUS_START',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare ack_keys clob;procedure ack_business is begin',
    'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P264_TNO,:P264_STATUS);',
    'end;begin',
    'select json_array(to_char(:P264_TNO) null on null returning clob) into ack_keys from dual;',
    'imart_save_ack.begin_status(:P264_IMART_SAVE_OP_ID,GetModuleCodeForPageNo(:APP_PAGE_ID),:P264_TNO,:P264_STATUS,''P264_TNO'',ack_keys);',
    'ack_business;',
    'imart_save_ack.finish_status(:P264_IMART_SAVE_OP_ID);',
    ':P264_IMART_STATUS_DONE:=:P264_IMART_SAVE_OP_ID;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304102769625757617)
,p_event_id=>wwv_flow_imp.id(304100743595757615)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(304086247765757594)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text($v(''P264_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304103248500757618)
,p_event_id=>wwv_flow_imp.id(304100743595757615)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(448863009868559317)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304101774660757616)
,p_event_id=>wwv_flow_imp.id(304100743595757615)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P264_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(304099815576757611)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P264_TTCINMINUTES'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(304100332842757615)
,p_event_id=>wwv_flow_imp.id(304099815576757611)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P264_TTC'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P264_TTCINMINUTES',
  'sql_query', 'SELECT ROUND(:P264_TTCINMINUTES / 60, 0) FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304098512625757610)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>86597827812538876
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304090918098757606)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(447836823629354014)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Flow Condition - Save Interactive Grid Data'
,p_static_id=>'flow-condition-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>86590233285538872
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304098121175757610)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'getdocno'
,p_static_id=>'getdocno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    tModuleCode varchar2(30) := ''MODULEFLOW'';',
'',
'    tmp         number ;',
'begin',
'    select count(*) into tmp',
'      from codeschememaster a',
'     where a.modulecode = tModuleCode',
'       and a.CodeScheme = ''AUTO''',
'     ;',
'',
'     if nvl(tmp,0) > 0 and :P4_CITYCODE is null and :P264_MODULEFLOWNO is null then',
'            setCodeNext(tModuleCode);',
'	  		:P264_MODULEFLOWNO := getCode(tModuleCode) ;',
'     end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>86597436362538876
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304097713838757610)
,p_process_sequence=>60
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetTno'
,p_static_id=>'gettno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'    IF :P264_TNO IS NULL THEN    ',
'        SELECT GLOBALTNO.NEXTVAL INTO :P264_TNO FROM DUAL;',
'    END IF;',
'    --apex_util.set_session_state(''P264_TNO'', :P264_TNO);',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>86597029025538876
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25275994120907979)
,p_process_sequence=>95
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART_DOCUMENT_HISTORY'
,p_static_id=>'imart-document-history'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' l_doc varchar2(4000);l_root varchar2(128):=''MODULEFLOW'';l_record varchar2(4000);l_tno varchar2(100);l_links clob;',
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
'  where application_id=105 and page_id=264 and item_source=p_column and label is not null;',
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
' if :APP_ID<>105 or :APP_PAGE_ID<>264 or not imart_audit.can_inquire then',
'  apex_json.write(''status'',''restricted'');apex_json.write(''message'',''Audit history access is not granted for this user.'');',
' else',
'  begin select COMPANYCODE,cast(null as varchar2(128)),json_object(''IMART_AUDIT_ROW_ID'' value IMART_AUDIT_ROW_ID),to_char(TNO,''TM9'',''NLS_NUMERIC_CHARACTERS=''''.,''''''),json_array(json_object(''t'' value ''MODULEFLOW'',''c'' value ''TNO'',''v'' value to_char(TNO,'''
||'TM9'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) returning clob) into l_company,l_location,l_record,l_tno,l_links from MODULEFLOW where TNO=to_number(:P264_TNO default null on conversion error);l_doc:=l_record;',
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
,p_internal_uid=>25275994120907979
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105002642)
,p_process_sequence=>-1000000
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART save receipt begin'
,p_static_id=>'imart-save-receipt-begin'
,p_process_sql_clob=>'declare ack_keys clob;begin select json_array(to_char(:P264_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.begin_v2(:P264_IMART_SAVE_OP_ID,''P264_TNO'',ack_keys);end;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>99061010105002642
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(99061010105002643)
,p_process_sequence=>1000000
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'IMART save receipt finish'
,p_static_id=>'imart-save-receipt-finish'
,p_process_sql_clob=>'declare ack_keys clob;begin select json_array(to_char(:P264_TNO) null on null returning clob) into ack_keys from dual;imart_save_ack.finish_v2(:P264_IMART_SAVE_OP_ID,ack_keys);end;'
,p_process_clob_language=>'PLSQL'
,p_process_when=>'CREATE,SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_process_success_message=>'Document saved.'
,p_internal_uid=>99061010105002643
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25585145756434596)
,p_process_sequence=>1000000
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Disable saved header controls'
,p_static_id=>'imart_saved_header_controls_20261021'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' for h in(select 1 from "MODULEFLOW" where ("TNO"=:P264_TNO or ("TNO" is null and :P264_TNO is null)))loop',
'  apex_javascript.add_onload_code(p_code=>''// Invoked only when the server has found the persisted native header row.',
'// Keep native items and their values; do not replace them with display spans.',
'(function (ids) {',
'  "use strict";',
'  function lockControls() {',
'    ids.forEach(function (id) {',
'      var item = apex.item(id);',
'      var node = item.node;',
'      if (!node || node.type === "hidden") return;',
'      var root = document.getElementById(id + "_CONTAINER") || node;',
'      // Native item.disable() makes some APEX widgets return an empty value.',
'      // Keep data controls enabled for validation/serialization; prevent user',
'      // interaction with readonly inputs, inaccessible triggers and capture.',
'      if (root.getAttribute("data-imart-saved-header-lock") !== "true") {',
'        ["keydown", "beforeinput", "paste", "drop"].forEach(function (type) {',
'          root.addEventListener(type, function (event) {',
'            if (type === "keydown" && (event.key === "Tab" || ((event.ctrlKey || event.metaKey) && event.key.toLowerCase() === "c"))) return;',
'            event.preventDefault();',
'            event.stopImmediatePropagation();',
'          }, true);',
'        });',
'      }',
'      root.setAttribute("data-imart-saved-header-lock", "true");',
'      root.setAttribute("aria-disabled", "true");',
'      root.style.pointerEvents = "none";',
'      root.querySelectorAll("button").forEach(function (control) {',
'        control.disabled = true;',
'        control.setAttribute("aria-disabled", "true");',
'      });',
'      root.querySelectorAll("input:not([type=hidden]),select,textarea").forEach(function (control) {',
'        if (control.tagName !== "SELECT") control.readOnly = true;',
'        control.setAttribute("aria-readonly", "true");',
'        control.setAttribute("tabindex", "-1");',
'      });',
'      node.setAttribute("tabindex", "-1");',
'      root.querySelectorAll("a,[role=button]").forEach(function (control) {',
'        control.setAttribute("aria-disabled", "true");',
'        control.setAttribute("tabindex", "-1");',
'      });',
'    });',
'  }',
'  lockControls();',
'  apex.jQuery(document).on("apexreadyend.imartSavedHeaderControls apexafterrefresh.imartSavedHeaderControls", lockControls);',
'})(["P264_MODULEFLOWNO"]);',
''');',
'  exit;',
' end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25585145756434596
,p_process_comment=>'Keep original controls visible; disable only the saved document header fields. Server guard unchanged.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(25570618666142563)
,p_process_sequence=>-1000001
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Protect saved document header'
,p_static_id=>'imart_saved_header_lock_20261021'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
' function changed(a varchar2,b varchar2) return boolean is begin',
'  if a is null then return b is not null;elsif b is null then return true;else return a<>b;end if;',
' end;',
' function changed_date(a date,b varchar2,fmt varchar2) return boolean is d date;begin',
'  if b is null then return a is not null;elsif a is null then return true;end if;',
'  begin d:=to_date(b,fmt);exception when others then return true;end;',
'  return trunc(a)<>trunc(d);',
' end;',
'begin',
' if upper(nvl(:REQUEST,''SAVE'')) in(''DELETE'',''CANCEL'',''RESET'') then return;end if;',
' for h in(select "MODULEFLOWNO" c0 from "MODULEFLOW" where ("TNO"=:P264_TNO or ("TNO" is null and :P264_TNO is null))) loop',
'  if changed(h.c0,:P264_MODULEFLOWNO) then raise_application_error(-20079,''Document No cannot be changed after saving this document.'');end if;',
' end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25570618666142563
,p_process_comment=>'SAVED_HEADER_LOCK_20261021: own document number only; linked references unchanged.'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304083176367757592)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(448863009868559317)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Module Flow'
,p_static_id=>'initialize-form-module-flow'
,p_internal_uid=>86582491554538858
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304097249036757610)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(447837914304354025)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'Module Flow User - Save Interactive Grid Data'
,p_static_id=>'module-flow-user-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>86596564223538876
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(304083508684757592)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(448863009868559317)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Module Flow'
,p_static_id=>'process-form-module-flow'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>86582823871538858
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
