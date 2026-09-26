prompt --application/shared_components/user_interface/lovs/p184_party
begin
--   Manifest
--     P184_PARTY
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
 p_id=>wwv_flow_imp.id(613213343086978856)
,p_lov_name=>'P184_PARTY'
,p_static_id=>'p184-party'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.partycode,',
'       getpartyname(a.partycode) As PartyName,',
'       c.CityName  ',
'  From ccinvoice a, Party b, City C',
' Where /*',
'    Not Exists',
' (Select aa.tno From salesgrn aa Where aa.ccinvoicetno = a.tno)',
'      And */',
'       a.companycode = :Global_CompanyCode',
'   and a.partycode = b.PartyCode  ',
'	--And getdocumentstatuscode(''CCINVOICE'',a.tno)=''ACTIVE''',
'	and a.ccinvoicedate >= ''01-apr-2023''',
'	',
' and nvl(b.WorksCityCode,b.OfficeCityCode) = c.CityCode ',
' Order By 2',
'',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_version_scn=>'7895634224'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(613214471603980107)
,p_query_column_name=>'CITYNAME'
,p_heading=>'Cityname'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(613213691622980106)
,p_query_column_name=>'PARTYCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(613214112931980107)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Partyname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
