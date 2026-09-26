prompt --application/shared_components/security/authentications/validatebossuser
begin
--   Manifest
--     AUTHENTICATION: VALIDATEBOSSUSER
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_authentication(
 p_id=>wwv_flow_imp.id(583559900634444802)
,p_name=>'VALIDATEBOSSUSER'
,p_static_id=>'validatebossuser'
,p_scheme_type=>'NATIVE_CUSTOM'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'authentication_function', 'VALIDATEBOSSUSER',
  'enable_legacy_attributes', 'N')).to_clob
,p_invalid_session_type=>'LOGIN'
,p_use_secure_cookie_yn=>'N'
,p_ras_mode=>0
,p_version_scn=>'4388337352'
);
wwv_flow_imp.component_end;
end;
/
