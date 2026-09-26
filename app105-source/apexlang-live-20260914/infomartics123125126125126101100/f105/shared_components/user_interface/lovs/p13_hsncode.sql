prompt --application/shared_components/user_interface/lovs/p13_hsncode
begin
--   Manifest
--     P13_HSNCODE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(598801659691929265)
,p_lov_name=>'P13_HSNCODE'
,p_static_id=>'p13-hsncode'
,p_lov_query=>'select hsncode , hsnname from hsn'
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'HSNCODE'
,p_display_column_name=>'HSNCODE'
,p_default_sort_column_name=>'HSNNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(598802170851933015)
,p_query_column_name=>'HSNCODE'
,p_heading=>'HSN Code'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(598802595543933015)
,p_query_column_name=>'HSNNAME'
,p_heading=>'HSN Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
