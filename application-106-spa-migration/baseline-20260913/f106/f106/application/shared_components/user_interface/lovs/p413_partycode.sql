prompt --application/shared_components/user_interface/lovs/p413_partycode
begin
--   Manifest
--     P413_PARTYCODE
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
 p_id=>wwv_flow_imp.id(187805024017959291)
,p_lov_name=>'P413_PARTYCODE'
,p_static_id=>'p413-partycode'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.AccountCode as PartyCode,',
'a.AccountName as PartyName,',
'a.AccountLevel',
'from AccountWithLevel a',
'order by  2'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_version_scn=>'4407548670'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(187806411660964663)
,p_query_column_name=>'ACCOUNTLEVEL'
,p_heading=>'Accountlevel'
,p_display_sequence=>30
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(187805525988964663)
,p_query_column_name=>'PARTYCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(187805997242964663)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Partyname'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
