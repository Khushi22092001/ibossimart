prompt --application/shared_components/user_interface/lovs/party_partyname
begin
--   Manifest
--     PARTY.PARTYNAME
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
 p_id=>wwv_flow_imp.id(50357364467132046)
,p_lov_name=>'PARTY.PARTYNAME'
,p_static_id=>'party-partyname'
,p_source_type=>'TABLE'
,p_location=>'LOCAL'
,p_query_table=>'PARTY'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_default_sort_column_name=>'PARTYNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'58837584'
);
wwv_flow_imp.component_end;
end;
/
