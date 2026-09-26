prompt --application/shared_components/user_interface/lovs/p197_stockallocation
begin
--   Manifest
--     P197_STOCKALLOCATION
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
 p_id=>wwv_flow_imp.id(443985585171766153)
,p_lov_name=>'P197_STOCKALLOCATION'
,p_static_id=>'p197-stockallocation'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'   a.tno,',
'   a.stockdate,',
'   a.stockmodulecode, ',
'	 getmoduleno(a.stockmodulecode,a.stockmoduletno) As TransactionNo,',
'   a.stockmodulecode||''-''||getmoduleno(a.stockmodulecode,a.stockmoduletno)||'' Stock Tno : ''||to_char(a.tno) as RefNo,',
'	ROUND( Nvl(b.stockquantity1,0) - Nvl(b.usedstockquantity1,0) - Nvl(b.reservestockquantity1,0),3) As BalanceQuantity',
'From stock a , stockstoragedetail b',
'Where a.tno = b.tno',
' and b.storagelocationcode = :P197_STORAGELOCATION',
'  And A.STOCKDATE <= :P197_PRODUCTIONDATE',
' and a.LocationCode = :P197_LOCATIONCODE',
'  and a.CompanyCode = :Global_CompanyCode',
'  And Nvl(b.stockquantity1,0) - Nvl(b.usedstockquantity1,0) - Nvl(b.reservestockquantity1,0) > 0',
'  And A.ITEMCODE = :P197_DETAILITEMCODE',
'  And A.ITEMSPECIFICATIONCODE = :P197_DETAILITEMSPECIFICATIONCODE',
'	',
'UNION ALL',
'Select ',
'   a.tno,',
'   a.stockdate,',
'   a.stockmodulecode, ',
'   getmoduleno(a.stockmodulecode,a.stockmoduletno) As TransactionNo,',
'   a.stockmodulecode||''-''||getmoduleno(a.stockmodulecode,a.stockmoduletno)||'' Stock Tno : ''||to_char(a.tno) as RefNo,',
'   ROUND(Nvl(a.stockquantity1,0) - Nvl(a.usedstockquantity1,0) - Nvl(a.reservestockquantity1,0),3) As BalanceQuantity',
'From stock a ',
'WHERE A.TNO = :STOCKTNO',
'',
' ORDER BY 2,1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'TRANSACTIONNO'
,p_version_scn=>'22131152'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443988214052777903)
,p_query_column_name=>'BALANCEQUANTITY'
,p_heading=>'Balancequantity'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443987788099777903)
,p_query_column_name=>'REFNO'
,p_heading=>'Refno'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443986992185777903)
,p_query_column_name=>'STOCKDATE'
,p_heading=>'Stockdate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443987416699777903)
,p_query_column_name=>'STOCKMODULECODE'
,p_heading=>'Stockmodulecode'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443986199329777902)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(443986609975777903)
,p_query_column_name=>'TRANSACTIONNO'
,p_heading=>'Transactionno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
