prompt --application/shared_components/user_interface/lovs/default_location
begin
--   Manifest
--     DEFAULT LOCATION 
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
 p_id=>wwv_flow_imp.id(52962908307556620)
,p_lov_name=>'DEFAULT LOCATION '
,p_static_id=>'default-location'
,p_lov_query=>'Select a.LocationName as d, a.LocationName as r From Location a where a.LocationName = ''Raipur'';'
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'6360630'
);
wwv_flow_imp.component_end;
end;
/
