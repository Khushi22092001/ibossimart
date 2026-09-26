prompt --application/shared_components/user_interface/lovs/p336_employee
begin
--   Manifest
--     P336_EMPLOYEE
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
 p_id=>wwv_flow_imp.id(290126692444573723)
,p_lov_name=>'P336_EMPLOYEE'
,p_static_id=>'p336-employee'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'    employeename,',
'    employeecode,',
'    employeeid,',
'    getdepartmentname(departmentcode) AS departmentname',
'FROM',
'    employee',
'WHERE',
'    locationcode = :p336_locationcode'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMPLOYEECODE'
,p_display_column_name=>'EMPLOYEENAME'
,p_default_sort_column_name=>'EMPLOYEENAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(290129595251590378)
,p_query_column_name=>'DEPARTMENTNAME'
,p_heading=>'Department'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(290128425797590373)
,p_query_column_name=>'EMPLOYEECODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(290129247272590378)
,p_query_column_name=>'EMPLOYEEID'
,p_heading=>'ID'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(290128823279590378)
,p_query_column_name=>'EMPLOYEENAME'
,p_heading=>'Employee'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
