prompt --application/shared_components/user_interface/lovs/p161_item
begin
--   Manifest
--     P161_ITEM
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
 p_id=>wwv_flow_imp.id(602222596533421357)
,p_lov_name=>'P161_ITEM'
,p_static_id=>'p161-item'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH DocTypeCheck AS (',
'    SELECT',
'        CASE',
'            WHEN :P161_DOCTYPECODE IN (''4'', ''SALE'', ''PURCHASERETURN'')        THEN ''SALE_TYPE''',
'            WHEN :P161_DOCTYPECODE IN (''CONVERSIONJOBOUTOFPREMISES'')          THEN ''CONV_TYPE''',
'            WHEN EXISTS (',
'                SELECT 1',
'                FROM ModuleDocType    aa',
'                JOIN ModuleDocTypeDetail bb ON aa.TNO = bb.TNO',
'                WHERE aa.ModuleCode        = ''DESPATCHADVICE''',
'                  AND bb.DocTypeCode       = :P161_DOCTYPECODE',
'                  AND bb.NatureDocTypeCode IN (''4'', ''SALE'', ''PURCHASERETURN'')',
'            )                                                                 THEN ''SALE_TYPE''',
'            WHEN EXISTS (',
'                SELECT 1',
'                FROM ModuleDocType    aa',
'                JOIN ModuleDocTypeDetail bb ON aa.TNO = bb.TNO',
'                WHERE aa.ModuleCode        = ''DESPATCHADVICE''',
'                  AND bb.DocTypeCode       = :P161_DOCTYPECODE',
'                  AND bb.NatureDocTypeCode IN (''CONVERSIONJOBOUTOFPREMISES'')',
'            )                                                                 THEN ''CONV_TYPE''',
'        END AS DOCCATEGORY',
'    FROM DUAL',
'),',
'BaseItems AS (',
'    SELECT',
'        a.ItemName,',
'        a.ItemCode,',
'        b.MeasuringUnitName AS MeasuringUnitName1,',
'        c.MeasuringUnitName AS MeasuringUnitName2',
'    FROM Item              a',
'    JOIN ItemSpecification d  ON d.TNO               = a.TNO',
'    LEFT JOIN MeasuringUnit b ON b.MeasuringUnitCode  = a.MeasuringUnitCode1',
'    LEFT JOIN MeasuringUnit c ON c.MeasuringUnitCode  = a.MeasuringUnitCode2',
'    WHERE a.ItemClassificationCode = ''MATERIAL''',
')',
'SELECT DISTINCT',
'    bi.ItemName,',
'    bi.ItemCode,',
'    bi.MeasuringUnitName1,',
'    bi.MeasuringUnitName2',
'FROM BaseItems   bi',
'CROSS JOIN DocTypeCheck dtc',
'WHERE dtc.DOCCATEGORY = ''SALE_TYPE''',
'  AND EXISTS (',
'        SELECT 1',
'        FROM SalesOrderDetail aa',
'        WHERE aa.TNO      = :P161_REFERENCETNO',
'          AND aa.ItemCode = bi.ItemCode',
'      )',
'',
'UNION ALL',
'',
'SELECT DISTINCT',
'    bi.ItemName,',
'    bi.ItemCode,',
'    bi.MeasuringUnitName1,',
'    bi.MeasuringUnitName2',
'FROM BaseItems   bi',
'CROSS JOIN DocTypeCheck dtc',
'WHERE dtc.DocCategory = ''CONV_TYPE''',
'  AND EXISTS (',
'        SELECT 1',
'        FROM JobOrderDetail aa',
'        WHERE aa.TNO      = :P161_REFERENCETNO',
'          AND aa.ItemCode = bi.ItemCode',
'      )',
'ORDER BY ItemName;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'ITEMCODE'
,p_display_column_name=>'ITEMNAME'
,p_version_scn=>'30242716'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(602223199079448691)
,p_query_column_name=>'ITEMCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(602223603900448691)
,p_query_column_name=>'ITEMNAME'
,p_heading=>'Itemname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(602224024365448692)
,p_query_column_name=>'MEASURINGUNITNAME1'
,p_heading=>'Measuringunitname1'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(602224357704448692)
,p_query_column_name=>'MEASURINGUNITNAME2'
,p_heading=>'Measuringunitname2'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
