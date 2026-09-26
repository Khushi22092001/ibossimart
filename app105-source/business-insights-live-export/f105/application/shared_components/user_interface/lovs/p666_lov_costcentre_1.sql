prompt --application/shared_components/user_interface/lovs/p666_lov_costcentre
begin
--   Manifest
--     P666_LOV_COSTCENTRE
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
 p_id=>wwv_flow_imp.id(469646572994904746)
,p_lov_name=>'P666_LOV_COSTCENTRE'
,p_static_id=>'p666-lov-costcentre'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COSTCENTRENAME,COSTCENTRECODE FROM COSTCENTRE',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'COSTCENTRECODE'
,p_display_column_name=>'COSTCENTRENAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
