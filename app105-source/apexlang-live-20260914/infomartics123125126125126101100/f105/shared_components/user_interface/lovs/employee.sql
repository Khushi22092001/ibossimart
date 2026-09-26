prompt --application/shared_components/user_interface/lovs/employee
begin
--   Manifest
--     EMPLOYEE
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
 p_id=>wwv_flow_imp.id(602724197470824507)
,p_lov_name=>'EMPLOYEE'
,p_static_id=>'employee'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'EmployeeName,',
'EmployeeCode',
'From Employee',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMPLOYEECODE'
,p_display_column_name=>'EMPLOYEENAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(449992103089531438)
,p_query_column_name=>'EMPLOYEECODE'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(449991712551531435)
,p_query_column_name=>'EMPLOYEENAME'
,p_heading=>'Employeename'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
