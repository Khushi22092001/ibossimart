prompt --application/shared_components/user_interface/lovs/p244_item
begin
--   Manifest
--     P244_ITEM
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
 p_id=>wwv_flow_imp.id(446497926077039607)
,p_lov_name=>'P244_ITEM'
,p_static_id=>'p244-item'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.ITEMNAME,',
'a.ItemCode,',
'b.MeasuringUnitName as MeasuringUnitName1,',
'c.MeasuringUnitName as MeasuringUnitName2,',
'a.locationcode,',
'g.itemname as GroupName,',
'h.itemspecificationname,',
'h.itemspecificationcode,',
'a.ItemNatureCode',
'from Item a, MeasuringUnit b, MeasuringUnit c,',
'item g, itemspecification h',
'where a.MeasuringUnitCode1 = b.MeasuringUnitCode(+)',
'and a.MeasuringUnitCode2 = c.MeasuringUnitCode(+)',
'And a.itemclassificationcode = ''MATERIAL''',
'and a.parentcode = g.itemcode(+)',
'and a.tno = h.tno',
'and ( a.LocationCode is null or a.LocationCode = :P244_LocationCode )',
'order by a.ItemName, h.ItemSpecificationName'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMCODE'
,p_display_column_name=>'ITEMNAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446502170167049344)
,p_query_column_name=>'GROUPNAME'
,p_heading=>'Group'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446500145195049340)
,p_query_column_name=>'ITEMCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446500561668049343)
,p_query_column_name=>'ITEMNAME'
,p_heading=>'Itemname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446503416854049345)
,p_query_column_name=>'ITEMNATURECODE'
,p_heading=>'Itemnaturecode'
,p_display_sequence=>90
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446503015107049345)
,p_query_column_name=>'ITEMSPECIFICATIONCODE'
,p_heading=>'Itemspecificationcode'
,p_display_sequence=>80
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446502611230049344)
,p_query_column_name=>'ITEMSPECIFICATIONNAME'
,p_heading=>'Item Specification'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446501770354049344)
,p_query_column_name=>'LOCATIONCODE'
,p_heading=>'Location'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446500942617049343)
,p_query_column_name=>'MEASURINGUNITNAME1'
,p_heading=>'UOM 1'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(446501410627049344)
,p_query_column_name=>'MEASURINGUNITNAME2'
,p_heading=>'UOM 2'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
