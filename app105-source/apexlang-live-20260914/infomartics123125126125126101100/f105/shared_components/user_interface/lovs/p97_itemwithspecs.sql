prompt --application/shared_components/user_interface/lovs/p97_itemwithspecs
begin
--   Manifest
--     P97_ITEMWITHSPECS
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
 p_id=>wwv_flow_imp.id(605040412299280882)
,p_lov_name=>'P97_ITEMWITHSPECS'
,p_static_id=>'p97-itemwithspecs'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    a.itemcode,',
'    a.itemname',
'    --a.specification',
'FROM',
'    item a'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMCODE'
,p_display_column_name=>'ITEMNAME'
,p_default_sort_column_name=>'ITEMNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605040698118280927)
,p_query_column_name=>'ITEMCODE'
,p_heading=>'Item code'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605041069062280930)
,p_query_column_name=>'ITEMNAME'
,p_heading=>'Item name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
