prompt --application/shared_components/user_interface/lovs/p666_lov_item
begin
--   Manifest
--     P666_LOV_ITEM
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
 p_id=>wwv_flow_imp.id(469407974852445296)
,p_lov_name=>'P666_LOV_ITEM'
,p_static_id=>'p666-lov-item'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.ItemCode,',
'      a.ItemName,',
'      GetItemName(a.ParentCode)GroupName,',
'      a.ParentCode,',
'      a.MeasuringUnitCode1 PUOM,',
'      a.MeasuringUnitCode2 SUOM,',
'      a.Tno as ItemTno',
'From  Item a'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMCODE'
,p_display_column_name=>'ITEMNAME'
,p_default_sort_column_name=>'ITEMNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(469423656310653311)
,p_query_column_name=>'ITEMCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(469424039225653311)
,p_query_column_name=>'ITEMNAME'
,p_heading=>'Itemname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
