prompt --application/shared_components/user_interface/lovs/lov_leave
begin
--   Manifest
--     LOV_LEAVE
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
 p_id=>wwv_flow_imp.id(450707517676553425)
,p_lov_name=>'LOV_LEAVE'
,p_static_id=>'lov-leave'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LEAVENAME,LEAVECODE FROM LEAVE',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'LEAVECODE'
,p_display_column_name=>'LEAVENAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
