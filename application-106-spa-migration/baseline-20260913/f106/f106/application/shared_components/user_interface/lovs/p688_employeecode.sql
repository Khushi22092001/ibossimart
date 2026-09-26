prompt --application/shared_components/user_interface/lovs/p688_employeecode
begin
--   Manifest
--     P688_EMPLOYEECODE
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
 p_id=>wwv_flow_imp.id(483202648139422671)
,p_lov_name=>'P688_EMPLOYEECODE'
,p_static_id=>'p688-employeecode'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.tno , a.HOLDSALARYNO , a.SALARYFROMDATE , a.SALARYTODATE from holdsalary  a',
'where a.employeecode = :P688_EMPLOYEECODE',
'and not exists (select * from unholdsalary aa',
'                where aa.employeecode = a.employeecode',
'                and aa.SALARYFROMDATE = a.SALARYFROMDATE',
'                and aa.SALARYTODATE = a.SALARYTODATE)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'HOLDSALARYNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(483203855528428080)
,p_query_column_name=>'HOLDSALARYNO'
,p_heading=>'Hold Salary No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(483204199401428080)
,p_query_column_name=>'SALARYFROMDATE'
,p_heading=>'From Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(483204585270428080)
,p_query_column_name=>'SALARYTODATE'
,p_heading=>'To Date'
,p_display_sequence=>40
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(483203372361428077)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
