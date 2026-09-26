prompt --application/shared_components/user_interface/lovs/p242_paymentadviceno
begin
--   Manifest
--     P242_PAYMENTADVICENO
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
 p_id=>wwv_flow_imp.id(455251530662918924)
,p_lov_name=>'P242_PAYMENTADVICENO'
,p_static_id=>'p242-paymentadviceno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'a.Tno as PaymentAdviceTno,',
'a.PaymentAdviceNo,',
'a.paymentadvicedate,',
'a.AmountDr,',
'b.PartyName,',
'A.ChequePRINTNAME,',
'c.PartyTypeName,',
'getlocationname(a.locationcode) as LocationName,',
'a.LocationCode',
'From PaymentAdvice a, Party b, PartyType c, DocumentStatusDetail dsd',
'Where a.PartyCode=b.PartyCode',
'and b.PartyTypeCode=c.PartyTypeCode',
'and a.Tno=dsd.ModuleTno',
'and dsd.DocumentStatusCode=''ACTIVE''',
'and a.AccountCode=:P242_AccountCode',
'-- remarked on 11-sep-2024',
'--and a.LocationCode=:P242_LocationCode',
'and a.MoneyTransferModeCode=:P242_MoneyTransferModeCode',
'and getcompanyprivilege(A.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'and ( :P242_FORMSTATUS = ''EDITRECORD'' ',
'        or',
'        not exists(Select 1',
'	       From RtgsLetterDetail aa',
'	       Where aa.PaymentAdviceTno=a.Tno',
'	       )',
')',
'Order by a.PaymentAdviceNo'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PAYMENTADVICETNO'
,p_display_column_name=>'PAYMENTADVICENO'
,p_version_scn=>'4416501870'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455299104804108678)
,p_query_column_name=>'AMOUNTDR'
,p_heading=>'Amount Dr'
,p_display_sequence=>30
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455299859166108678)
,p_query_column_name=>'CHEQUEPRINTNAME'
,p_heading=>'Cheque Print Name'
,p_display_sequence=>80
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(201721615215047316)
,p_query_column_name=>'LOCATIONCODE'
,p_heading=>'Locationcode'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(201721173450047316)
,p_query_column_name=>'LOCATIONNAME'
,p_heading=>'Location'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455299529789108678)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party Name'
,p_display_sequence=>70
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455300317235108678)
,p_query_column_name=>'PARTYTYPENAME'
,p_heading=>'Partytypename'
,p_display_sequence=>90
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(201724848603061889)
,p_query_column_name=>'PAYMENTADVICEDATE'
,p_heading=>'Paymentadvicedate'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455298676698108677)
,p_query_column_name=>'PAYMENTADVICENO'
,p_heading=>'Payment Advice No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(455298437489108674)
,p_query_column_name=>'PAYMENTADVICETNO'
,p_display_sequence=>60
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
