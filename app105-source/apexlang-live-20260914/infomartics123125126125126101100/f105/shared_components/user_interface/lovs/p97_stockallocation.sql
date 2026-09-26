prompt --application/shared_components/user_interface/lovs/p97_stockallocation
begin
--   Manifest
--     P97_STOCKALLOCATION
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
 p_id=>wwv_flow_imp.id(605042607540280936)
,p_lov_name=>'P97_STOCKALLOCATION'
,p_static_id=>'p97-stockallocation'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'   a.tno,',
'   a.stockdate,',
'   a.stockmodulecode, ',
'	 getmoduleno(a.stockmodulecode,a.stockmoduletno) As TransactionNo,',
'   a.stockmodulecode||''-''||getmoduleno(a.stockmodulecode,a.stockmoduletno)||'' Stock Tno : ''||to_char(a.tno) as RefNo,',
'	 Nvl(a.stockquantity1,0) - Nvl(a.usedstockquantity1,0) - Nvl(a.reservestockquantity1,0) As BalanceQuantity',
'From stock a , stockstoragedetail b',
'Where  a.tno = b.tno',
'  And b.storagelocationcode = :P181_STORAGELOCATIONCODE',
'  And A.STOCKDATE <= :P181_STOCKJOURNALDATE',
'  and a.LocationCode = :P181_LOCATIONCODE',
'  and a.CompanyCode = :Global_CompanyCode',
'	And Nvl(a.stockquantity1,0) - Nvl(a.usedstockquantity1,0) - Nvl(a.reservestockquantity1,0) > 0',
'	And A.ITEMCODE = :P181_DETAILITEM',
'    And A.ITEMSPECIFICATIONCODE = :P181_DETAILITEMSPECIFICATION',
'UNION ALL',
'Select ',
'   a.tno,',
'   a.stockdate,',
'   a.stockmodulecode, ',
'	 getmoduleno(a.stockmodulecode,a.stockmoduletno) As TransactionNo,',
'   a.stockmodulecode||''-''||getmoduleno(a.stockmodulecode,a.stockmoduletno)||'' Stock Tno : ''||to_char(a.tno) as RefNo,',
'	 Nvl(a.stockquantity1,0) - Nvl(a.usedstockquantity1,0) - Nvl(a.reservestockquantity1,0) As BalanceQuantity',
'From stock a ',
'WHERE A.TNO = :P181_STOCKTNO',
' ORDER BY 2,1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'REFNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605044993259280937)
,p_query_column_name=>'BALANCEQUANTITY'
,p_heading=>'Balance'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605043413187280937)
,p_query_column_name=>'REFNO'
,p_heading=>'Ref No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605043783113280937)
,p_query_column_name=>'STOCKDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605044248639280937)
,p_query_column_name=>'STOCKMODULECODE'
,p_heading=>'Module'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605042985282280937)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(605044587676280937)
,p_query_column_name=>'TRANSACTIONNO'
,p_heading=>'Transaction No'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
