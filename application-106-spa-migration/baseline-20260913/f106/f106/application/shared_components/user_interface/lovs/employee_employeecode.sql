prompt --application/shared_components/user_interface/lovs/employee_employeecode
begin
--   Manifest
--     EMPLOYEE.EMPLOYEECODE
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
 p_id=>wwv_flow_imp.id(57898171724834790)
,p_lov_name=>'EMPLOYEE.EMPLOYEECODE'
,p_static_id=>'employee-employeecode'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'EMPLOYEE'
,p_return_column_name=>'EMPLOYEECODE'
,p_default_sort_column_name=>'EMPLOYEECODE'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'58837583'
);
wwv_flow_imp.component_end;
end;
/
