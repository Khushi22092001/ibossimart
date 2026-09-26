prompt --application/shared_components/user_interface/lovs/lov_loantype
begin
--   Manifest
--     LOV_LOANTYPE
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
 p_id=>wwv_flow_imp.id(459300056486305330)
,p_lov_name=>'LOV_LOANTYPE'
,p_static_id=>'lov-loantype'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT LOANTYPENAME,LOANTYPECODE FROM LOANTYPE',
'ORDER BY 1'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'LOANTYPECODE'
,p_display_column_name=>'LOANTYPENAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
