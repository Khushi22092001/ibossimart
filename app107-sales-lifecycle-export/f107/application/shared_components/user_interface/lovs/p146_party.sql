prompt --application/shared_components/user_interface/lovs/p146_party
begin
--   Manifest
--     P146_PARTY
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
 p_id=>wwv_flow_imp.id(471082963828402488)
,p_lov_name=>'P146_PARTY'
,p_static_id=>'p146-party'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode , getcityname(officecitycode) as city from party',
'where partytypecode in (''CUSTOMER'',''SUPPLIER'',''AGENT'',''CONTRACTOR'')',
'and :P146_DOCTYPECODE = ''RETURNGP''',
'union all  ',
'select partyname , partycode , getcityname(officecitycode) as city from party',
'where partytypecode in (''SUPPLIER'',''AGENT'')',
'and :P146_DOCTYPECODE = ''PURCHASE''',
'union all',
'select partyname , partycode , getcityname(officecitycode) as city from party',
'where partytypecode in (''CONTRACTOR'')',
'and :P146_DOCTYPECODE = ''CONVERSIONJOBOUTOFPREMISES''',
'union all',
'select partyname , partycode , getcityname(officecitycode) as city from party',
'where partytypecode in (''CUSTOMER'',''AGENT'')',
'and :P146_DOCTYPECODE = ''SALERETURN'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'PARTYCODE'
,p_display_column_name=>'PARTYNAME'
,p_default_sort_column_name=>'PARTYNAME'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(471084196081407736)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(471083387144407736)
,p_query_column_name=>'PARTYCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(471083803333407736)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
