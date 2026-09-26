prompt --application/shared_components/user_interface/lovs/p622_employee
begin
--   Manifest
--     P622_EMPLOYEE
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
 p_id=>wwv_flow_imp.id(227555661102738891)
,p_lov_name=>'P622_EMPLOYEE'
,p_static_id=>'p622-employee'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select EMPLOYEENAME , EMPLOYEECODE , getdepartmentname(DEPARTMENTCODE) as department ,',
' EMPLOYEEID  from employee'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'EMPLOYEECODE'
,p_display_column_name=>'EMPLOYEENAME'
,p_default_sort_column_name=>'EMPLOYEENAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4389259329'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(227557011226745667)
,p_query_column_name=>'DEPARTMENT'
,p_heading=>'Department'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(227556217301745666)
,p_query_column_name=>'EMPLOYEECODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(227557469983745667)
,p_query_column_name=>'EMPLOYEEID'
,p_heading=>'ID'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(227556639206745667)
,p_query_column_name=>'EMPLOYEENAME'
,p_heading=>'Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
