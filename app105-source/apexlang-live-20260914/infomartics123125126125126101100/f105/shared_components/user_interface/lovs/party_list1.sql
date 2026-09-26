prompt --application/shared_components/user_interface/lovs/party_list1
begin
--   Manifest
--     PARTY LIST1
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
 p_id=>wwv_flow_imp.id(433643286518849892)
,p_lov_name=>'PARTY LIST1'
,p_static_id=>'party-list-2'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.PartyName,',
'      a.PartyCode,',
'      a.OfficeCityCode,',
'      GetCityName(a.OfficeCityCode)CityName,',
'      a.OfficeStateCode,',
'      GetStateName(a.OfficeStateCode)StateName',
'From  Party a',
'--Where exists (Select 1 From SalesOrder b Where a.partyCode = b.PartyCode)'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_default_sort_column_name=>'PARTYNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp.component_end;
end;
/
