prompt --application/shared_components/user_interface/lovs/p346_loantype
begin
--   Manifest
--     P346_LOANTYPE
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
 p_id=>wwv_flow_imp.id(477190801527246760)
,p_lov_name=>'P346_LOANTYPE'
,p_static_id=>'p346-loantype'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select d.LoanTypeName      As LoanType,',
'       a.loantypecode,',
'       a.loansanctionno,',
'       a.loansanctiondate,',
'       a.tno               As LoansanctionTno,',
'       b.VoucherNo,',
'       b.VoucherDate,',
'       a.installmentamount,',
'       b.tno               As VoucherTno',
'  From LoanSanction a, Voucher b, LoanRequest c, LoanType d',
' Where a.tno = b.ModuleTno(+)',
'   And a.Loanrequesttno = c.tno',
'   And a.LoanTypecode = d.LoanTypecode(+)',
'	 And c.Employeecode = :P346_EMPLOYEECODE',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'LOANTYPECODE'
,p_display_column_name=>'LOANTYPE'
,p_default_sort_column_name=>'LOANTYPE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477194149191255153)
,p_query_column_name=>'INSTALLMENTAMOUNT'
,p_heading=>'Installment Amount'
,p_display_sequence=>80
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477192530118255150)
,p_query_column_name=>'LOANSANCTIONDATE'
,p_heading=>'Loan Sanction Date'
,p_display_sequence=>40
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477192140642255150)
,p_query_column_name=>'LOANSANCTIONNO'
,p_heading=>'Loan Sanction No'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477192925316255150)
,p_query_column_name=>'LOANSANCTIONTNO'
,p_heading=>'Loansanctiontno'
,p_display_sequence=>50
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477191740128255150)
,p_query_column_name=>'LOANTYPE'
,p_heading=>'Loan Type'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477191316903255147)
,p_query_column_name=>'LOANTYPECODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477193750848255153)
,p_query_column_name=>'VOUCHERDATE'
,p_heading=>'Voucherdate'
,p_display_sequence=>70
,p_data_type=>'DATE'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477193279515255152)
,p_query_column_name=>'VOUCHERNO'
,p_heading=>'Voucher No'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(477194509483255153)
,p_query_column_name=>'VOUCHERTNO'
,p_heading=>'Vouchertno'
,p_display_sequence=>90
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp.component_end;
end;
/
