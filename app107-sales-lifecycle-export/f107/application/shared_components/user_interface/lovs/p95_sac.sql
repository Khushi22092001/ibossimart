prompt --application/shared_components/user_interface/lovs/p95_sac
begin
--   Manifest
--     P95_SAC
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(455210096731546618)
,p_lov_name=>'P95_SAC'
,p_static_id=>'p95-sac'
,p_lov_query=>'SELECT SACCODE, SACNAME FROM SAC ORDER BY 1'
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'SACCODE'
,p_display_column_name=>'SACCODE'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455210516363551280)
,p_query_column_name=>'SACCODE'
,p_heading=>'SAC Code'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455210922420551282)
,p_query_column_name=>'SACNAME'
,p_heading=>'SAC Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
