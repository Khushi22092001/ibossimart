prompt --application/shared_components/user_interface/lovs/lov_loanrequest
begin
--   Manifest
--     LOV_LOANREQUEST
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
 p_id=>wwv_flow_imp.id(452534041430425879)
,p_lov_name=>'LOV_LOANREQUEST'
,p_static_id=>'lov-loanrequest'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  A.LOANREQUESTNO,',
'        A.TNO,',
'        A.LOANREQUESTDATE, getemployeename(A.EMPLOYEECODE) employeename',
'  --      E.EMPLOYEENAME,',
'  --      L.LOANTYPENAME,',
'  --      A.LOANTYPECODE,',
'  --      A.LOANAMOUNT,',
'  --      A.MERGEDAMOUNT,',
'  --      A.TOTALAMOUNT,',
'  --      A.INSTALLMENTAMOUNT,',
'  --      A.NOOFINSTALLMENT,',
'  --      A.DEDUCTIONSTARTDATE,',
'  --      A.MONEYTRANSFERMODECODE',
' FROM LOANREQUEST a',
' --EMPLOYEE E,LOANTYPE L',
' --WHERE A.EMPLOYEECODE=E.EMPLOYEECODE',
' --AND A.LOANTYPECODE = L.LOANTYPECODE',
'ORDER BY 1',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'LOANREQUESTNO'
,p_default_sort_column_name=>'LOANREQUESTNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(479035075267302610)
,p_query_column_name=>'EMPLOYEENAME'
,p_heading=>'Employee Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(479034616623302607)
,p_query_column_name=>'LOANREQUESTDATE'
,p_heading=>'Date'
,p_display_sequence=>10
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(452535320746443385)
,p_query_column_name=>'LOANREQUESTNO'
,p_heading=>'Loan No'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(452535757935443386)
,p_query_column_name=>'TNO'
,p_display_sequence=>20
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
);
wwv_flow_imp.component_end;
end;
/
