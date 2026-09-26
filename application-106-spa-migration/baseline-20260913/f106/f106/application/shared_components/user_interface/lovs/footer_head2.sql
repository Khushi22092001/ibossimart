prompt --application/shared_components/user_interface/lovs/footer_head2
begin
--   Manifest
--     FOOTER HEAD2
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
 p_id=>wwv_flow_imp.id(610266192789527257)
,p_lov_name=>'FOOTER HEAD2'
,p_static_id=>'footer-head-3'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'a.FOOTERHEADCODE,',
'a.FOOTERHEADNAME',
'FROM FOOTERHEAD a'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'FOOTERHEADCODE'
,p_display_column_name=>'FOOTERHEADNAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
