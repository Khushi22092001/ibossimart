prompt --application/shared_components/user_interface/lovs/party
begin
--   Manifest
--     PARTY
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
 p_id=>wwv_flow_imp.id(619755744032993633)
,p_lov_name=>'PARTY'
,p_static_id=>'party'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'     PartyName||'' (''||PartyCode||'')'' as d,',
'     PartyCode as r',
'From Party',
'where partytypecode = ''TRANSPORTER'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'R'
,p_display_column_name=>'D'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
