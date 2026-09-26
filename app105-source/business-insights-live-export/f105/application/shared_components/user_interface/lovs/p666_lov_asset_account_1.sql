prompt --application/shared_components/user_interface/lovs/p666_lov_asset_account
begin
--   Manifest
--     P666_LOV_ASSET_ACCOUNT
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(468341741308273533)
,p_lov_name=>'P666_LOV_ASSET_ACCOUNT'
,p_static_id=>'p666-lov-asset-account'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PartyName AssetName,PartyCode AssetCode',
'from Party a, Documentstatusdetail Dsd',
'Where a.Tno = dsd.ModuleTno',
'and dsd.DocumentStatusCode = ''ACTIVE''',
'and PartyTypeCode=''ASSET''',
'Order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ASSETCODE'
,p_display_column_name=>'ASSETNAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(468342547917282563)
,p_query_column_name=>'ASSETCODE'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(468342191458282560)
,p_query_column_name=>'ASSETNAME'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
