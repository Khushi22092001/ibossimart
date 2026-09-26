prompt --application/shared_components/user_interface/lovs/p159_stock
begin
--   Manifest
--     P159_STOCK
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
 p_id=>wwv_flow_imp.id(68651002083786091)
,p_lov_name=>'P159_STOCK'
,p_static_id=>'p159-stock'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.tno,',
'       a.stockdate,',
'       a.stockmodulecode,',
'       getmoduleno(a.stockmodulecode, a.stockmoduletno) As TransactionNo,',
'       a.stockmodulecode || ''-'' ||',
'       getmoduleno(a.stockmodulecode, a.stockmoduletno) || '' Stock Tno : '' ||',
'       to_char(a.tno) As RefNo,',
'       Nvl(a.stockquantity1, 0) - Nvl(a.usedstockquantity1, 0) -',
'       Nvl(a.reservestockquantity1, 0) As BalanceQuantity',
'  From stock a, STOCKSTORAGEDETAIL B, Production C, ProductionFinished D',
' Where A.TNO = B.TNO',
'   And A.STOCKMODULETNO = C.TNO(+)',
'   And C.TNO = D.TNO(+)',
'   And a.itemcode = D.ITEMCODE(+)',
'   And a.itemspecificationcode = D.ITEMSPECIFICATIONCODE(+)',
'   And b.storagelocationcode = :P159_TEMP_STORAGELOCATION_CODE',
'   And A.STOCKDATE <= :P159_DEBITNOTEDATE',
'   And a.LocationCode = :P159_LOCATIONCODE',
'   And a.CompanyCode = :Global_CompanyCode',
'   And A.ITEMCODE = :P159_TEMP_ITEMCODE',
'  And A.ITEMSPECIFICATIONCODE = :P159_TEMP_ITEMSPECIFICATIONCODE',
'UNION ALL',
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
'    WHERE a.tno = :STOCKTNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'TRANSACTIONNO'
,p_version_scn=>'61523927'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(68653501778793031)
,p_query_column_name=>'BALANCEQUANTITY'
,p_heading=>'Balancequantity'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(68653056628793031)
,p_query_column_name=>'REFNO'
,p_heading=>'Refno'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(68652306013793031)
,p_query_column_name=>'STOCKDATE'
,p_heading=>'Stockdate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(68652642267793031)
,p_query_column_name=>'STOCKMODULECODE'
,p_heading=>'Stockmodulecode'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(68651505849793031)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(68651870482793031)
,p_query_column_name=>'TRANSACTIONNO'
,p_heading=>'Transactionno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
