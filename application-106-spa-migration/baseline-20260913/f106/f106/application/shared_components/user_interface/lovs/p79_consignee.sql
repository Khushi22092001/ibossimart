prompt --application/shared_components/user_interface/lovs/p79_consignee
begin
--   Manifest
--     P79_CONSIGNEE
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
 p_id=>wwv_flow_imp.id(610269595952527259)
,p_lov_name=>'P79_CONSIGNEE'
,p_static_id=>'p79-consignee'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'     PartyName||'' (''||PartyCode||'')'' as d,',
'     PartyCode as r',
'From Party',
'where partytypecode = ''CUSTOMER'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_default_sort_column_name=>'D'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
