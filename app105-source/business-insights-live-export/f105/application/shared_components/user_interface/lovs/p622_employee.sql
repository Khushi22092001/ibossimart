prompt --application/shared_components/user_interface/lovs/p622_employee
begin
--   Manifest
--     P622_EMPLOYEE
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
 p_id=>wwv_flow_imp.id(218075457271272527)
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
 p_id=>wwv_flow_imp.id(218076807395279303)
,p_query_column_name=>'DEPARTMENT'
,p_heading=>'Department'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(218076013470279302)
,p_query_column_name=>'EMPLOYEECODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(218077266152279303)
,p_query_column_name=>'EMPLOYEEID'
,p_heading=>'ID'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(218076435375279303)
,p_query_column_name=>'EMPLOYEENAME'
,p_heading=>'Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
