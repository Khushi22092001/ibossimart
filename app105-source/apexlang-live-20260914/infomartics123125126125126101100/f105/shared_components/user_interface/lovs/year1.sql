prompt --application/shared_components/user_interface/lovs/year1
begin
--   Manifest
--     YEAR1
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
 p_id=>wwv_flow_imp.id(433643909769849892)
,p_lov_name=>'YEAR1'
,p_static_id=>'year-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'     To_Char(a.Fin_date,''YYYY'') YYYY,',
'     a.Fin_Year',
'From BI_DateTime a  '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'YYYY'
,p_display_column_name=>'FIN_YEAR'
,p_default_sort_column_name=>'FIN_YEAR'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
