prompt --application/shared_components/user_interface/lovs/p140_refmoduleno
begin
--   Manifest
--     P140_REFMODULENO
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
 p_id=>wwv_flow_imp.id(595287282327143732)
,p_lov_name=>'P140_REFMODULENO'
,p_static_id=>'p140-refmoduleno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'       a.ReferenceModuleTNo,',
'       a.ReferenceModuleNo,',
'       a.ReferenceModuleAmount,',
'       a.BillAmount,',
'       A.PaidAmount,',
'       a.ToBePaidAgainstBill,',
'       A.BalanceAmount,',
'       A.ReferenceModuleDate,',
'       a.CurrencyValue,',
'       A.VoucherDate,',
'       A.VoucherNo,',
'       A.LocationName',
'From ReferenceForPaymentAdvice a ',
'Where 1=1  ',
'AND a.PartyCode = :P140_PartyCode',
'and a.ReferenceModuleCode = :P140_REFMODULECODE',
'and a.VoucherDate <= to_date(:P140_PaymentAdviceDate, ''DD-MM-RRRR'')',
'and a.CompanyCode=:Global_CompanyCode',
'and a.locationname = getlocationname(:P140_LOCATIONCODE)',
'and not exists (select 1 from freightadvicedetail ',
'                where moduletno in (select tno from grn ',
'                                    where loadingadvicetno = a.ReferenceModuleTNo))',
'And (Not Exists',
' (Select 1 From PaymentAdviceReference  aa Where aa.REFERENCEMODULETNO = a.REFERENCEMODULETNO)',
'   or exists (select 1 from PaymentAdvice ab  where ab.tno = :P140_TNO  )) ',
'   and  :P140_FORMSTATUS = ''NEWRECORD''',
' union all',
' Select ',
'       a.ReferenceModuleTNo,',
'       a.ReferenceModuleNo,',
'       a.ReferenceModuleAmount,',
'       a.BillAmount,',
'       A.PaidAmount,',
'       a.ToBePaidAgainstBill,',
'       A.BalanceAmount,',
'       A.ReferenceModuleDate,',
'       a.CurrencyValue,',
'       A.VoucherDate,',
'       A.VoucherNo,',
'       A.LocationName',
'From ReferenceForPaymentAdvice a ',
'where :P140_FORMSTATUS = ''EDITRECORD''',
'',
'',
'Order by 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'REFERENCEMODULETNO'
,p_display_column_name=>'REFERENCEMODULENO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444331993850211256)
,p_query_column_name=>'BALANCEAMOUNT'
,p_heading=>'Balanceamount'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444330784214211248)
,p_query_column_name=>'BILLAMOUNT'
,p_heading=>'Billamount'
,p_display_sequence=>20
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444332450879211256)
,p_query_column_name=>'CURRENCYVALUE'
,p_heading=>'Currencyvalue'
,p_display_sequence=>50
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444333599706211256)
,p_query_column_name=>'LOCATIONNAME'
,p_heading=>'Locationname'
,p_display_sequence=>80
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444331198400211255)
,p_query_column_name=>'PAIDAMOUNT'
,p_heading=>'Paidamount'
,p_display_sequence=>30
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(595288583591152875)
,p_query_column_name=>'REFERENCEMODULEAMOUNT'
,p_heading=>'Reference Module Amount'
,p_display_sequence=>40
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(595288999664152876)
,p_query_column_name=>'REFERENCEMODULEDATE'
,p_heading=>'Reference Module Date'
,p_display_sequence=>15
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(595288171618152875)
,p_query_column_name=>'REFERENCEMODULENO'
,p_heading=>'Reference Module No'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(595287796154152874)
,p_query_column_name=>'REFERENCEMODULETNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444331649320211255)
,p_query_column_name=>'TOBEPAIDAGAINSTBILL'
,p_heading=>'Tobepaidagainstbill'
,p_display_sequence=>50
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444332858613211256)
,p_query_column_name=>'VOUCHERDATE'
,p_heading=>'Voucherdate'
,p_display_sequence=>60
,p_data_type=>'DATE'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444333195884211256)
,p_query_column_name=>'VOUCHERNO'
,p_heading=>'Voucherno'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp.component_end;
end;
/
