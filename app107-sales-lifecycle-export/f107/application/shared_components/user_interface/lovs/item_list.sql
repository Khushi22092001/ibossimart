prompt --application/shared_components/user_interface/lovs/item_list
begin
--   Manifest
--     ITEM LIST 
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
 p_id=>wwv_flow_imp.id(450591344992005805)
,p_lov_name=>'ITEM LIST '
,p_static_id=>'item-list'
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
