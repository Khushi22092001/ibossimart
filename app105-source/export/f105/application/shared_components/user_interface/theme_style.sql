prompt --application/shared_components/user_interface/theme_style
begin
--   Manifest
--     THEME STYLE: 42
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(47428648679431539)
,p_theme_id=>42
,p_name=>'Vita (copy_2)'
,p_static_id=>'vita-copy'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_config=>'{"classes":[],"vars":{},"customCSS":"#P0_SEARCH{\n    width: 25px;\n    height: 25px;\n    border-width: 0px;\n    border-radius: 3px !important;\n    background-color: transparent;\n    color: #fff;\n    outline-width: 0;\n    margin-top: -6px;\n   '
||' margin-bottom: -4px;\n    margin-left: 5px;\n}\n.t-Header-navBar{\n    margin-bottom: -5px;\n}\n.t-NavifationBar{\n    margin-bottom: 5px;\n}","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#29961636554202223.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(574121162745792828)
,p_theme_id=>42
,p_name=>'Vita (copy_1)'
,p_static_id=>'vita-copy-2'
,p_is_public=>false
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Accent-BG":"#1b2c5f","@g_Nav-BG":"#0e0e53","@g_Nav-FG":"#d6d6d6","@g_Nav-Active-BG":"#0b1678","@g_Nav-Active-FG":"#f2f2f2"},"customCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#133734817494866304.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(576465903624905301)
,p_theme_id=>42
,p_name=>'Vita - Orange'
,p_static_id=>'vita-orange'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Nav-Active-BG":"#aab3ba","@g_Nav-Active-FG":"#ffffff","@g_Nav-BG":"#505f6d","@g_Nav-FG":"#f8f8f8","@g_Accent-BG":"#f9bd5d"},"customCSS":"","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#136079558373978777.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(443827080275198909)
,p_theme_id=>42
,p_name=>'Vita - Slate (copy_1)'
,p_static_id=>'vita-slate-copy'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Slate.less'
,p_theme_roller_config=>'{"classes":[],"vars":{"@g_Nav-Active-BG":"#aab3ba","@g_Nav-Active-FG":"#ffffff","@g_Nav-BG":"#c8ece2","@g_Nav-FG":"#f8f8f8","@g_Accent-BG":"#9fe9cf"},"customCSS":"#APP_FILES#mycss/MyIR (2)#MIN#.cs\n\n","useCustomLess":"N"}'
,p_theme_roller_output_file_url=>'#THEME_DB_FILES#73265837802159159.css'
,p_theme_roller_read_only=>false
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(574033029275959732)
,p_theme_id=>42
,p_name=>'Vita - Slate-original'
,p_static_id=>'vita-slate-original'
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_FILES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_FILES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
,p_reference_id=>wwv_imp_util.get_subscription_id(3291983347983194966,2010,'vita-slate',8842,null,'universal-theme')
);
wwv_flow_imp.component_end;
end;
/
