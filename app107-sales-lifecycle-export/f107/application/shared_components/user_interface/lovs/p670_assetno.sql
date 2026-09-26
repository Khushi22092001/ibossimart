prompt --application/shared_components/user_interface/lovs/p670_assetno
begin
--   Manifest
--     P670_ASSETNO
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
 p_id=>wwv_flow_imp.id(479895045201532379)
,p_lov_name=>'P670_ASSETNO'
,p_static_id=>'p670-assetno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ASSETNO,TNO,ASSETDATE from ASSET',
'WHERE LOCATIONCODE = :P670_LOCATIONCODE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'ASSETNO'
,p_default_sort_column_name=>'ASSETDATE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(479896432149544210)
,p_query_column_name=>'ASSETDATE'
,p_heading=>'Assetdate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(479896071684544209)
,p_query_column_name=>'ASSETNO'
,p_heading=>'Assetno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(479895748941544206)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
