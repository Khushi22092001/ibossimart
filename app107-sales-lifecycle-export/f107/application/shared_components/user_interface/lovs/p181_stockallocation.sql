prompt --application/shared_components/user_interface/lovs/p181_stockallocation
begin
--   Manifest
--     P181_STOCKALLOCATION
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
 p_id=>wwv_flow_imp.id(58645784426942504)
,p_lov_name=>'P181_STOCKALLOCATION'
,p_static_id=>'p181-stockallocation'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    x.*',
'FROM (',
'    SELECT ',
'        a.tno,',
'        a.stockdate,',
'        a.stockmodulecode, ',
'        getmoduleno(a.stockmodulecode, a.stockmoduletno) AS TransactionNo,',
'        a.stockmodulecode || ''-'' || getmoduleno(a.stockmodulecode, a.stockmoduletno) ',
'            || '' Stock Tno : '' || TO_CHAR(a.tno) AS RefNo,',
'        (NVL(a.stockquantity1,0) ',
'         - NVL(a.usedstockquantity1,0) ',
'         - NVL(a.reservestockquantity1,0)) AS BalanceQuantity',
'    FROM stock a',
'    JOIN stockstoragedetail b ',
'        ON a.tno = b.tno',
'    WHERE b.storagelocationcode = :P181_STORAGELOCATIONCODE',
'      AND a.stockdate <= :P181_STOCKJOURNALDATE',
'      AND a.locationcode = :P181_LOCATIONCODE',
'      AND a.companycode = :GLOBAL_COMPANYCODE',
'      AND a.itemcode = :P181_DETAILITEM',
'      AND a.itemspecificationcode = :P181_DETAILITEMSPECIFICATION',
'      AND (NVL(a.stockquantity1,0) ',
'           - NVL(a.usedstockquantity1,0) ',
'           - NVL(a.reservestockquantity1,0)) > 0',
'',
'    UNION ALL',
'',
'    SELECT ',
'        a.tno,',
'        a.stockdate,',
'        a.stockmodulecode, ',
'        getmoduleno(a.stockmodulecode, a.stockmoduletno) AS TransactionNo,',
'        a.stockmodulecode || ''-'' || getmoduleno(a.stockmodulecode, a.stockmoduletno) ',
'            || '' Stock Tno : '' || TO_CHAR(a.tno) AS RefNo,',
'        (NVL(a.stockquantity1,0) ',
'         - NVL(a.usedstockquantity1,0) ',
'         - NVL(a.reservestockquantity1,0)) AS BalanceQuantity',
'    FROM stock a',
'    WHERE a.tno = :STOCKTNO',
')x',
'ORDER BY x.stockdate, x.tno;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'REFNO'
,p_version_scn=>'37036625'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(58648147447942509)
,p_query_column_name=>'BALANCEQUANTITY'
,p_heading=>'Balance'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(58646608479942508)
,p_query_column_name=>'REFNO'
,p_heading=>'Ref No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(58646985870942508)
,p_query_column_name=>'STOCKDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(58647334130942508)
,p_query_column_name=>'STOCKMODULECODE'
,p_heading=>'Module'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(58646192802942506)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(58647792827942509)
,p_query_column_name=>'TRANSACTIONNO'
,p_heading=>'Transaction No'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
