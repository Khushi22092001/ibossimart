prompt --application/shared_components/user_interface/lovs/p383_item
begin
--   Manifest
--     P383_ITEM
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
 p_id=>wwv_flow_imp.id(20324034743204038)
,p_lov_name=>'P383_ITEM'
,p_static_id=>'p383-item'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'a.ItemCode,',
'a.ItemName itemname,',
'd.itemspecificationname,',
'd.itemspecificationcode,',
'b.MeasuringUnitName as MeasuringUnitName1,',
'c.MeasuringUnitName as MeasuringUnitName2,',
'a.locationcode ,',
'd.hsncode,',
'a.HeatNoRequired,',
'a.ItemClassificationCode,',
'a.SerialNoRequired',
'from Item a, MeasuringUnit b, MeasuringUnit c, Itemspecification d ',
'where a.MeasuringUnitCode1 = b.MeasuringUnitCode(+)',
'and a.MeasuringUnitCode2 = c.MeasuringUnitCode(+)',
'and a.TNO = d.TNO',
'and  (:P383_SalesOrderTno is null ',
'        OR',
'        a.ItemClassificationCode != ''MATERIAL''',
'       Or',
'        exists (Select aa.* from SalesOrderDetail aa',
'        where aa.tno = :P383_SalesOrderTno',
'                  and aa.itemcode = a.itemcode',
'                  and aa.itemspecificationcode = d.itemspecificationcode',
'                  ) )',
'',
'order by a.ItemName'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_column_name=>'ITEMNAME'
,p_version_scn=>'8061491567'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(20326285552224079)
,p_query_column_name=>'HSNCODE'
,p_heading=>'HSN Code'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(20326697425224079)
,p_query_column_name=>'ITEMCODE'
,p_heading=>'Item Code'
,p_display_sequence=>1
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(20325071770224079)
,p_query_column_name=>'ITEMNAME'
,p_heading=>'Item Name'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(20340024923310725)
,p_query_column_name=>'ITEMSPECIFICATIONCODE'
,p_heading=>'Itemspecificationcode'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(20325486770224079)
,p_query_column_name=>'ITEMSPECIFICATIONNAME'
,p_heading=>'Item Specification Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(20325893151224079)
,p_query_column_name=>'MEASURINGUNITNAME1'
,p_heading=>'UOM'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
