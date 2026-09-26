prompt --application/shared_components/user_interface/lovs/p175_stockallocation
begin
--   Manifest
--     P175_STOCKALLOCATION
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
 p_id=>wwv_flow_imp.id(610809163210118215)
,p_lov_name=>'P175_STOCKALLOCATION'
,p_static_id=>'p175-stockallocation'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*Select ',
'   a.tno,',
'   a.stockdate,',
'   a.stockmodulecode, ',
'	 getmoduleno(a.stockmodulecode,a.stockmoduletno) As TransactionNo,',
'   a.stockmodulecode||''-''||getmoduleno(a.stockmodulecode,a.stockmoduletno)||'' Stock Tno : ''||to_char(a.tno) as RefNo,',
'	 Nvl(b.stockquantity1,0) - Nvl(b.usedstockquantity1,0) - Nvl(b.reservestockquantity1,0) As BalanceQuantity,',
'   e.tno as PurchaseBillTNo,',
'   e.purchasebillno,',
'   e.partybillno,',
'   getpartyname(e.partycode) as Party',
'From stock a , stockstoragedetail b, PURCHASEBILLGRNDETAIL D, PURCHASEBILL E, PURCHASEBILLdetail f',
'Where a.tno = b.tno',
'  AND A.GRNTNO  = D.GRNTNO(+)',
'  and d.tno=E.TNO(+) ',
'  and b.storagelocationcode = :P175_STORAGELOCATIONCODE',
'  And A.STOCKDATE <= :P175_CCINVOICEDATE',
'  and a.LocationCode = :P175_LOCATIONCODE',
'  and a.CompanyCode = :Global_COMPANYCODE',
'  And Nvl(b.stockquantity1,0) - Nvl(b.usedstockquantity1,0) - Nvl(b.reservestockquantity1,0) > 0',
'  And A.ITEMCODE = :P175_DETAILITEMCODE',
'  And A.ITEMSPECIFICATIONCODE = :P175_DETAILITEMSPECIFICATIONCODE',
'  and d.sno = f.sno(+)',
'  And (a.stockmodulecode = ''ITEMOPENING'' Or',
'       (a.itemcode = f.ITEMCODE And',
'       a.itemspecificationcode = f.ITEMSPECIFICATIONCODE))	',
'Union All',
'Select a.tno,',
'       a.stockdate,',
'       a.stockmodulecode,',
'       getmoduleno(a.stockmodulecode, a.stockmoduletno) As TransactionNo,',
'       a.stockmodulecode || ''-'' ||',
'       getmoduleno(a.stockmodulecode, a.stockmoduletno) || '' Stock Tno : '' ||',
'       to_char(a.tno) As RefNo,',
'       Nvl(a.stockquantity1, 0) - Nvl(a.usedstockquantity1, 0) -',
'       Nvl(a.reservestockquantity1, 0) As BalanceQuantity,',
'       e.tno As PurchaseBillTNo,',
'       e.CCINVOICEno,',
'       e.CCINVOICEno AS PARTYBILLNO,',
'       getpartyname(e.partycode) As Party',
'  From stock a, STOCKSTORAGEDETAIL B, SALESGRN C, CCINVOICEDETAIL D, CCINVOICE E',
' Where A.TNO = B.TNO',
'   And A.STOCKMODULETNO = C.TNO',
'   And C.CCINVOICETNO = D.TNO',
'   And d.tno = E.TNO(+)',
'   And a.itemcode = D.ITEMCODE(+)',
'   And a.itemspecificationcode = D.ITEMSPECIFICATIONCODE(+)',
'   And b.storagelocationcode = :P175_STORAGELOCATIONCODE',
'   And A.STOCKDATE <= :P175_CCINVOICEDATE',
'   And a.LocationCode = :P175_LOCATIONCODE',
'   And a.CompanyCode = :Global_CompanyCode',
'   ',
'UNION All',
'*/',
'Select a.tno,',
'       a.stockdate,',
'       a.stockmodulecode,',
'       getmoduleno(a.stockmodulecode, a.stockmoduletno) As TransactionNo,',
'       a.stockmodulecode || ''-'' ||',
'       getmoduleno(a.stockmodulecode, a.stockmoduletno) || '' Stock Tno : '' ||',
'       to_char(a.tno) As RefNo,',
'       Nvl(a.stockquantity1, 0) - Nvl(a.usedstockquantity1, 0) -',
'       Nvl(a.reservestockquantity1, 0) As BalanceQuantity,',
'       null as PurchaseBillTNo,',
'       null as CCINVOICEno,',
'       null as PARTYBILLNO,',
'       null as Party',
'  From stock a, STOCKSTORAGEDETAIL B, Production C, ProductionFinished D',
' Where A.TNO = B.TNO',
'   And A.STOCKMODULETNO = C.TNO(+)',
'   And C.TNO = D.TNO(+)',
'   And a.itemcode = D.ITEMCODE(+)',
'   And a.itemspecificationcode = D.ITEMSPECIFICATIONCODE(+)',
'   And b.storagelocationcode = :P175_STORAGELOCATIONCODE',
'   And A.STOCKDATE <= :P175_CCINVOICEDATE',
'   And a.LocationCode = :P175_LOCATIONCODE',
'   And a.CompanyCode = :Global_CompanyCode',
'   And A.ITEMCODE = :P175_DETAILITEMCODE',
'  And A.ITEMSPECIFICATIONCODE = :P175_DETAILITEMSPECIFICATIONCODE',
' -- AND A.STOCKMODULECODE NOT IN (''INSPECTION'',''ITEMOPENING'')',
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
'         - NVL(a.reservestockquantity1,0)) AS BalanceQuantity,',
'         null,',
'           null,',
'           null,',
'           null',
'    FROM stock a',
'    WHERE a.tno = :STOCKTNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'TRANSACTIONNO'
,p_version_scn=>'40420581'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610811732674120260)
,p_query_column_name=>'BALANCEQUANTITY'
,p_heading=>'BalanceQuantity'
,p_display_sequence=>70
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(294317301976887959)
,p_query_column_name=>'PARTY'
,p_heading=>'Party'
,p_display_sequence=>80
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(294316954382887959)
,p_query_column_name=>'PARTYBILLNO'
,p_heading=>'Partybillno'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(294316135563887958)
,p_query_column_name=>'PURCHASEBILLTNO'
,p_display_sequence=>20
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610811315998120260)
,p_query_column_name=>'REFNO'
,p_heading=>'RefNo'
,p_display_sequence=>100
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610810494890120259)
,p_query_column_name=>'STOCKDATE'
,p_heading=>'Stockdate'
,p_display_sequence=>60
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610810923445120260)
,p_query_column_name=>'STOCKMODULECODE'
,p_heading=>'StockModuleCode'
,p_display_sequence=>90
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610809693558120257)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(610810048952120259)
,p_query_column_name=>'TRANSACTIONNO'
,p_heading=>'Transactionno'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
