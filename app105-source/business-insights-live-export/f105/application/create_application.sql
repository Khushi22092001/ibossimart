prompt --application/create_application
begin
--   Manifest
--     FLOW: 105
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_imp_workspace.create_flow(
 p_id=>wwv_flow.g_flow_id
,p_owner=>nvl(wwv_flow_application_install.get_schema,'IMART')
,p_name=>nvl(wwv_flow_application_install.get_application_name,'Imart')
,p_alias=>nvl(wwv_flow_application_install.get_application_alias,'INFOMARTICS123125126125126101100')
,p_page_view_logging=>'YES'
,p_page_protection_enabled_y_n=>'N'
,p_checksum_salt=>'A355789D2CD73C2D5191057FB8A5B741E0CE735E41D13B234BF9A9D2AD858836'
,p_bookmark_checksum_function=>'SH512'
,p_compatibility_mode=>'21.2'
,p_accessible_read_only=>'N'
,p_session_state_commits=>'IMMEDIATE'
,p_flow_language=>'en'
,p_flow_language_derived_from=>'FLOW_PRIMARY_LANGUAGE'
,p_allow_feedback_yn=>'Y'
,p_date_format=>'DD-MM-RRRR'
,p_date_time_format=>'DD-MM-YYYY HH:MIPM'
,p_timestamp_format=>'DD-MM-YYYY HH:MIPM'
,p_timestamp_tz_format=>'DD-MM-YYYY HH.MI.SSXFF PM TZR'
,p_direction_right_to_left=>'N'
,p_flow_image_prefix=>nvl(wwv_flow_application_install.get_image_prefix,'')
,p_authentication_id=>wwv_flow_imp.id(574079696802978438)
,p_application_tab_set=>1
,p_logo_type=>'T'
,p_logo_text=>'&GLOBAL_TITLE.'
,p_public_user=>'APEX_PUBLIC_USER'
,p_proxy_server=>nvl(wwv_flow_application_install.get_proxy,'')
,p_no_proxy_domains=>nvl(wwv_flow_application_install.get_no_proxy_domains,'')
,p_flow_version=>'InfoMart Release 1.0 Developed By Infomatics'
,p_flow_status=>'AVAILABLE_W_EDIT_LINK'
,p_browser_frame=>'D'
,p_runtime_api_usage=>'T'
,p_authorize_public_pages_yn=>'Y'
,p_authorize_batch_job=>'N'
,p_rejoin_existing_sessions=>'N'
,p_csv_encoding=>'Y'
,p_modernization_available=>'Y'
,p_substitution_string_01=>'APP_NAME'
,p_substitution_value_01=>'Imart'
,p_file_prefix=>nvl(wwv_flow_application_install.get_static_app_file_prefix,'')
,p_files_version=>2461297233813
,p_version_scn=>'8156823039'
,p_print_server_type=>'INSTANCE'
,p_file_storage=>'DB'
,p_is_pwa=>'Y'
,p_pwa_is_installable=>'Y'
,p_pwa_manifest_display=>'standalone'
,p_pwa_manifest_orientation=>'any'
,p_pwa_is_push_enabled=>'N'
,p_theme_id=>42
,p_home_url=>'f?p=&APP_ID.:1:&APP_SESSION.::&DEBUG.:::'
,p_login_url=>'f?p=&APP_ID.:LOGIN:&APP_SESSION.::&DEBUG.:::'
,p_theme_style_by_user_pref=>true
,p_built_with_love=>false
,p_global_page_id=>0
,p_navigation_list_id=>wwv_flow_imp.id(575002417063958534)
,p_navigation_list_position=>'SIDE'
,p_navigation_list_template_id=>2467739217141810545
,p_nav_list_template_options=>'#DEFAULT#:js-defaultCollapsed:js-navCollapsed--hidden:t-TreeNav--styleA'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#hspl-form-action-first-paint.css?cb=20260925c',
'#APP_FILES#hspl-theme.css?version=#APP_VERSION#&cb=20260921navstable3',
'#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260909e',
'#APP_FILES#globalSeach_styles.css',
'#APP_FILES#hspl-nav-hierarchy-v22.css?cb=20260911bd',
'#APP_FILES#hspl-nav-final.css?cb=20260911bf',
'#APP_FILES#hspl-legacy-back-hero-guard.css?cb=20260914i',
'#APP_FILES#hspl-sidebar-state.css?cb=20260925sbstate52'))
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260925formactions1',
'#APP_FILES#hspl-dummy-button-guard.js?cb=20260915d',
'#APP_FILES#hspl-nav-paint.js?cb=20260921navstable3',
'#APP_FILES#hspl-sidebar-state.js?cb=20260925sbstate52'))
,p_nav_bar_type=>'LIST'
,p_nav_bar_list_id=>wwv_flow_imp.id(574055972862959750)
,p_nav_bar_list_template_id=>2847543055748234966
,p_nav_bar_template_options=>'#DEFAULT#'
);
wwv_flow_imp.component_end;
end;
/
