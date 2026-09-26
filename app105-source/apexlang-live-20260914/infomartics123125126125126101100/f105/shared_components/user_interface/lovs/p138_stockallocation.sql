prompt --application/shared_components/user_interface/lovs/p138_stockallocation
begin
--   Manifest
--     P138_STOCKALLOCATION
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
 p_id=>wwv_flow_imp.id(603765945883969587)
,p_lov_name=>'P138_STOCKALLOCATION'
,p_static_id=>'p138-stockallocation'
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
' and b.storagelocationcode = :P138_STORAGELOCATION',
'  And A.STOCKDATE <= :P138_ISSUEDATE',
' and a.LocationCode = :P138_LOCATIONCODE',
'  and a.CompanyCode = :Global_CompanyCode',
'  And Nvl(b.stockquantity1,0) - Nvl(b.usedstockquantity1,0) - Nvl(b.reservestockquantity1,0) > 0',
'  And A.ITEMCODE = :P138_ITEMCODE',
'  And A.ITEMSPECIFICATIONCODE = :P138_ITEMSPECIFICATIONCODE',
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
'WHERE A.TNO = :STOCKTNO',
'',
' ORDER BY 2,1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'TRANSACTIONNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(440915808525857892)
,p_query_column_name=>'BALANCEQUANTITY'
,p_heading=>'Balance'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(440915451838857892)
,p_query_column_name=>'REFNO'
,p_heading=>'Ref No'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(440914588726857892)
,p_query_column_name=>'STOCKDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(440914226124857892)
,p_query_column_name=>'STOCKMODULECODE'
,p_heading=>'Module'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(440913813359857890)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(440915001614857892)
,p_query_column_name=>'TRANSACTIONNO'
,p_heading=>'Transaction'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
