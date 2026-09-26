prompt --application/shared_components/user_interface/lovs/lov_employee
begin
--   Manifest
--     LOV_EMPLOYEE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(455194400582877071)
,p_lov_name=>'LOV_EMPLOYEE'
,p_static_id=>'lov-employee'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  SELECT E.EMPLOYEENAME,E.EMPLOYEECODE,d.DEPARTMENTNAME,s.DESIGNATIONNAME ',
'      FROM EMPLOYEE e,DEPARTMENT d,DESIGNATION s',
'      WHERE e.DEPARTMENTCODE=d.DEPARTMENTCODE(+)',
'      and e.DESIGNATIONCODE = s.DESIGNATIONCODE(+)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMPLOYEECODE'
,p_display_column_name=>'EMPLOYEENAME'
,p_default_sort_column_name=>'EMPLOYEENAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457582199584768919)
,p_query_column_name=>'DEPARTMENTNAME'
,p_heading=>'Departmentname'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457582665167768919)
,p_query_column_name=>'DESIGNATIONNAME'
,p_heading=>'Designationname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(456885304682187189)
,p_query_column_name=>'EMPLOYEECODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(456885610194187194)
,p_query_column_name=>'EMPLOYEENAME'
,p_heading=>'Employeename'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
