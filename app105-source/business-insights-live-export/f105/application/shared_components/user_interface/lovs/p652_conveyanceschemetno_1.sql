prompt --application/shared_components/user_interface/lovs/p652_conveyanceschemetno
begin
--   Manifest
--     P652_CONVEYANCESCHEMETNO
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
 p_id=>wwv_flow_imp.id(465288102249703861)
,p_lov_name=>'P652_CONVEYANCESCHEMETNO'
,p_static_id=>'p652-conveyanceschemetno'
,p_lov_query=>'select CONVEYANCESCHEMENO , tno from CONVEYANCESCHEME'
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'CONVEYANCESCHEMENO'
,p_default_sort_column_name=>'CONVEYANCESCHEMENO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
