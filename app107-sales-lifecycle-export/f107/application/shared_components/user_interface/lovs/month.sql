prompt --application/shared_components/user_interface/lovs/month
begin
--   Manifest
--     MONTH
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
 p_id=>wwv_flow_imp.id(450591969334005810)
,p_lov_name=>'MONTH'
,p_static_id=>'month'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      a.Fin_Month_Name,',
'      a.Fin_Month,',
'      To_char(a.Fin_date,''MON-YYYY'')as MONYYYY,',
'      To_char(a.Fin_date,''YYYYMM'')as YYYYMM',
'From  BI_DateTime a'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'YYYYMM'
,p_display_column_name=>'MONYYYY'
,p_default_sort_column_name=>'MONYYYY'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
