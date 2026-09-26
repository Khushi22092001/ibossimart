prompt --application/shared_components/user_interface/lovs/p195_stock
begin
--   Manifest
--     P195_STOCK
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
 p_id=>wwv_flow_imp.id(444396673670908658)
,p_lov_name=>'P195_STOCK'
,p_static_id=>'p195-stock'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'   a.tno,',
'   a.stockdate,',
'   a.stockmodulecode, ',
'	 getmoduleno(a.stockmodulecode,a.stockmoduletno) As TransactionNo,',
'   a.stockmodulecode||''-''||getmoduleno(a.stockmodulecode,a.stockmoduletno)||'' Stock Tno : ''||to_char(a.tno) as RefNo,',
'	 Nvl(b.stockquantity1,0) - Nvl(b.usedstockquantity1,0) - Nvl(b.reservestockquantity1,0) As BalanceQuantity',
'From stock a , stockstoragedetail b',
'Where a.tno = b.tno',
'  and b.storagelocationcode = :P195_STORAGELOCATIONCODE',
'  And A.STOCKDATE <= :P195_GATEPASSDATE',
'  and a.LocationCode = :P195_LOCATIONCODE',
'  and a.CompanyCode = :Global_CompanyCode',
'  And Nvl(b.stockquantity1,0) - Nvl(b.usedstockquantity1,0) - Nvl(b.reservestockquantity1,0) > 0',
'  And A.ITEMCODE = :P195_DETAILITEMCODE',
'  And A.ITEMSPECIFICATIONCODE = :P195_DETAILSPECIFICATIONCODE',
'	',
'UNION ALL',
'Select ',
'   a.tno,',
'   a.stockdate,',
'   a.stockmodulecode, ',
'   getmoduleno(a.stockmodulecode,a.stockmoduletno) As TransactionNo,',
'   a.stockmodulecode||''-''||getmoduleno(a.stockmodulecode,a.stockmoduletno)||'' Stock Tno : ''||to_char(a.tno) as RefNo,',
'   Nvl(a.stockquantity1,0) - Nvl(a.usedstockquantity1,0) - Nvl(a.reservestockquantity1,0) As BalanceQuantity',
'From stock a ',
'WHERE A.TNO = :P195_TNO',
' ORDER BY 2,1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'REFNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444399246433914283)
,p_query_column_name=>'BALANCEQUANTITY'
,p_heading=>'Balance'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444397646779914282)
,p_query_column_name=>'REFNO'
,p_heading=>'Ref No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444398042070914282)
,p_query_column_name=>'STOCKDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444398389291914282)
,p_query_column_name=>'STOCKMODULECODE'
,p_heading=>'Module'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444397201383914282)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444398782859914283)
,p_query_column_name=>'TRANSACTIONNO'
,p_heading=>'Transaction No'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
