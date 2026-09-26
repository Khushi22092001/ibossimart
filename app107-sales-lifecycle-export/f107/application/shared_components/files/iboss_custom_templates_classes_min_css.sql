prompt --application/shared_components/files/iboss_custom_templates_classes_min_css
begin
--   Manifest
--     APP STATIC FILES: 107
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E742D726567696F6E2D2D6C656674626F726465722C2E742D726567696F6E2D2D746F70626F726465727B626F726465723A3021696D706F7274616E743B626F782D736861646F773A6E6F6E6521696D706F7274616E747D2E742D726567696F6E2D2D6C';
wwv_flow_imp.g_varchar2_table(2) := '656674626F726465727B626F726465722D6C6566743A31707820736F6C696420766172282D2D75742D70616C657474652D7072696D6172792921696D706F7274616E747D2E742D726567696F6E2D2D746F70626F726465727B626F726465722D746F703A';
wwv_flow_imp.g_varchar2_table(3) := '31707820736F6C6964202364616461646121696D706F7274616E747D2E69626F73732D752D636F6C6F722D317B6261636B67726F756E642D636F6C6F723A236638663866387D2E742D526567696F6E2D2D686964652D7469746C65202E742D526567696F';
wwv_flow_imp.g_varchar2_table(4) := '6E2D6865616465727B646973706C61793A6E6F6E6521696D706F7274616E747D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>wwv_flow_imp.id(188323222834143694)
,p_file_name=>'iBOSS Custom Templates Classes.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
wwv_flow_imp.component_end;
end;
/
