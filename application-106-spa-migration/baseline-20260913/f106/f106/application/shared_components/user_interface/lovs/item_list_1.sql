prompt --application/shared_components/user_interface/lovs/item_list_1
begin
--   Manifest
--     ITEM LIST 1
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(441183619686552641)
,p_lov_name=>'ITEM LIST 1'
,p_static_id=>'item-list-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.ItemCode,',
'      a.ItemName,',
'      GetItemName(a.ParentCode)GroupName,',
'      a.ParentCode,',
'      a.MeasuringUnitCode1 PUOM,',
'      a.MeasuringUnitCode2 SUOM',
'From  Item a',
'--Where exists (Select 1 From SalesorderDetail b Where a.ItemCode = b.ItemCode)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMCODE'
,p_display_column_name=>'ITEMNAME'
,p_default_sort_column_name=>'ITEMNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
