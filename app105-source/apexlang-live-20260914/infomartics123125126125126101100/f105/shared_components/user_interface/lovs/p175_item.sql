prompt --application/shared_components/user_interface/lovs/p175_item
begin
--   Manifest
--     P175_ITEM
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
 p_id=>wwv_flow_imp.id(603208701975898688)
,p_lov_name=>'P175_ITEM'
,p_static_id=>'p175-item'
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
'and (:P175_DespatchAdvicetno is null  ',
'        or',
'        a.ItemClassificationCode != ''MATERIAL''     ',
'        Or',
'        exists (Select aa.* from Despatchadvicedetail aa',
'        where aa.tno = :P175_DespatchadviceTno',
'                  and aa.itemcode = a.itemcode',
'                  and aa.itemspecificationcode = d.itemspecificationcode',
'                  ) )',
'and  (:P175_SalesOrderTno is null ',
'        OR',
'        a.ItemClassificationCode != ''MATERIAL''',
'       Or',
'        exists (Select aa.* from SalesOrderDetail aa',
'        where aa.tno = :P175_SalesOrderTno',
'                  and aa.itemcode = a.itemcode',
'                  and aa.itemspecificationcode = d.itemspecificationcode',
'                  ) )',
'',
'order by a.ItemName'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_column_name=>'ITEMNAME'
,p_version_scn=>'18545186'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603212679320903676)
,p_query_column_name=>'HEATNOREQUIRED'
,p_heading=>'Heatnorequired'
,p_display_sequence=>100
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603212285871903676)
,p_query_column_name=>'HSNCODE'
,p_heading=>'Hsncode'
,p_display_sequence=>90
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603213103084903676)
,p_query_column_name=>'ITEMCLASSIFICATIONCODE'
,p_heading=>'Itemclassificationcode'
,p_display_sequence=>110
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603209103153903675)
,p_query_column_name=>'ITEMCODE'
,p_heading=>'Item'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603209537725903675)
,p_query_column_name=>'ITEMNAME'
,p_heading=>'Itemname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603210350679903676)
,p_query_column_name=>'ITEMSPECIFICATIONCODE'
,p_heading=>'Itemspecificationcode'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603209938683903676)
,p_query_column_name=>'ITEMSPECIFICATIONNAME'
,p_heading=>'Itemspecificationname'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603211871088903676)
,p_query_column_name=>'LOCATIONCODE'
,p_heading=>'Locationcode'
,p_display_sequence=>80
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603210667685903676)
,p_query_column_name=>'MEASURINGUNITNAME1'
,p_heading=>'Measuringunitname1'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603211100708903676)
,p_query_column_name=>'MEASURINGUNITNAME2'
,p_heading=>'Measuringunitname2'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(603213482104903676)
,p_query_column_name=>'SERIALNOREQUIRED'
,p_heading=>'Serialnorequired'
,p_display_sequence=>120
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
