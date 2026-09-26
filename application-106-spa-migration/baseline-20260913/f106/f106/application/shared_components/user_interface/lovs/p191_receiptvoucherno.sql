prompt --application/shared_components/user_interface/lovs/p191_receiptvoucherno
begin
--   Manifest
--     P191_RECEIPTVOUCHERNO
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
 p_id=>wwv_flow_imp.id(444433908057082119)
,p_lov_name=>'P191_RECEIPTVOUCHERNO'
,p_static_id=>'p191-receiptvoucherno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	c.VoucherNo,',
'    a.TNo,',
'	c.VoucherDate,',
'	a.Amount as Amount,',
'	a.Amount - nvl(d.Amount, 0) as BalanceAmount,',
'	',
'    a.SNo,',
'	mtm.MoneyTransferModeName,',
'	c.MoneyTransferReferenceNo,',
'	c.MoneyTransferModeCode,',
'	c.Narration',
'from VoucherDetail a, Voucher c, MoneyTransferMode mtm, (',
'	select ',
'		aa.AccountCode, ',
'		aa.VoucherTNo,',
'		aa.VoucherSNo,',
'		sum(aa.Amount - nvl(aa.TDSAmount, 0)) as Amount  ',
'	from DFreightBillReceipt aa ',
'	where aa.AccountCode = :P191_DEPOCODE',
'	group by ',
'		aa.AccountCode, ',
'		aa.VoucherTNo,',
'		aa.VoucherSNo',
'	union all',
'	select ',
'		aa.AccountCode, ',
'		aa.TDSVoucherTNo as VoucherTNo,',
'		aa.TDSVoucherSNo as VoucherSNo,',
'		sum(aa.TDSAmount) as Amount  ',
'	from DFreightBillReceipt aa ',
'	where aa.AccountCode = :P191_DEPOCODE',
'	group by ',
'		aa.AccountCode, ',
'		aa.TDSVoucherTNo,',
'		aa.TDSVoucherSNo	',
') d',
'where a.TNO = c.TNo',
'	and c.MoneyTransferModeCode = mtm.MoneyTransferModeCode(+)',
'	and a.TNO = d.VoucherTNo(+)	',
'	and a.SNO = d.VoucherSNo(+)	',
'	and a.AccountCode = d.AccountCode(+)	',
'	and a.Amount > 0	',
'	and a.AccountCode = :P191_DEPOCODE',
'	and c.CompanyCode = :global_CompanyCode',
'	--and a.VoucherDate > ''26-dec-2011''',
'	and a.VoucherDate <= :P191_DFreightBillReceiptDate',
'	and a.Amount - nvl(d.Amount, 0) > 0	',
'                and NVL(c.moduleCODE,''NULL'') !=''BILLRECEIPT''',
'AND  (',
'NVL(c.moduleCODE,''NULL'') !=''CREDITNOTE''',
'OR EXISTS',
'(SELECT aaa.TNO ',
'FROM CREDITNOTE aaa',
'WHERE aaa.TNO=C.MODULETNO',
'AND aaa.REFERENCEMODULETNO IS NULL ',
')',
')',
'/* 27-NOV-2024',
'and exists',
'(',
'  select 1 from voucherdetail aa where aa.accountcode=:P191_ACCOUNTCODE and aa.tno = a.tno',
'',
')*/',
'',
'order by c.VoucherDate, c.VoucherNo'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'VOUCHERNO'
,p_version_scn=>'7922514624'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444435547122092382)
,p_query_column_name=>'AMOUNT'
,p_heading=>'Amount'
,p_display_sequence=>40
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444435922928092390)
,p_query_column_name=>'BALANCEAMOUNT'
,p_heading=>'Balanceamount'
,p_display_sequence=>50
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444437455338092390)
,p_query_column_name=>'MONEYTRANSFERMODECODE'
,p_heading=>'Moneytransfermodecode'
,p_display_sequence=>90
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444436665184092390)
,p_query_column_name=>'MONEYTRANSFERMODENAME'
,p_heading=>'Moneytransfermodename'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444437127922092390)
,p_query_column_name=>'MONEYTRANSFERREFERENCENO'
,p_heading=>'Moneytransferreferenceno'
,p_display_sequence=>80
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444437901750092390)
,p_query_column_name=>'NARRATION'
,p_heading=>'Narration'
,p_display_sequence=>100
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444436329888092390)
,p_query_column_name=>'SNO'
,p_heading=>'Sno'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444434472972092373)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444435210218092382)
,p_query_column_name=>'VOUCHERDATE'
,p_heading=>'Voucherdate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444434827031092377)
,p_query_column_name=>'VOUCHERNO'
,p_heading=>'Voucherno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
