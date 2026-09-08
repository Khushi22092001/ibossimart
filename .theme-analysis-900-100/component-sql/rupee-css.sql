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
,p_default_workspace_id=>1516696681383506
,p_default_application_id=>100
,p_default_id_offset=>700000000000000000
,p_default_owner=>'SAGARDASHBOARD'
);
end;
/
 
prompt APPLICATION 900 - DASHBOARD(UI DEVELOPMENT)
--
-- Application Export:
--   Application:     900
--   Name:            DASHBOARD(UI DEVELOPMENT)
--   Date and Time:   17:00 Saturday August 29, 2026
--   Exported By:     SAGARDASHBOARD
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     APP_STATIC_FILE: 19306350808432681
--   Manifest End
--   Version:         26.1.2
--   Instance ID:     746064700808108
--

begin
  -- replace components
  wwv_flow_imp.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/files/rupee_css
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E7275706565207B0D0A202020206261636B67726F756E642D696D6167653A2075726C2872757065652E737667293B0D0A202020206261636B67726F756E642D7265706561743A206E6F2D7265706561743B0D0A202020206261636B67726F756E642D73';
wwv_flow_imp.g_varchar2_table(2) := '697A653A20636F7665723B0D0A202020206261636B67726F756E642D706F736974696F6E3A203530253B0D0A7D';
wwv_flow_imp_shared.create_app_static_file(
 p_id=>719306350808432681
,p_file_name=>'rupee.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
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
