prompt --application/shared_components/user_interface/lovs/p348_referenceno
begin
--   Manifest
--     P348_REFERENCENO
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
 p_id=>wwv_flow_imp.id(506905411708380333)
,p_lov_name=>'P348_REFERENCENO'
,p_static_id=>'p348-referenceno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'A.REFERENCEMODULETNO,     ',
'A.REFERENCEMODULENO||'' : ''||A.REFERENCEMODULECODE REFNO,',
'A.REFERENCEMODULECODE ',
'FROM REFERENCEFORADVANCERECEIPT A',
'WHERE A.PARTYCODE=:P348_PARTYCODE',
'AND A.TransactionTypeCode = :P348_TransactionTypeCode',
'ORDER BY  A.REFERENCEMODULENO,A.REFERENCEMODULECODE       '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'REFERENCEMODULETNO'
,p_display_column_name=>'REFNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(506906745623384241)
,p_query_column_name=>'REFERENCEMODULECODE'
,p_heading=>'Referencemodulecode'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(506905938111384238)
,p_query_column_name=>'REFERENCEMODULETNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(506906356212384241)
,p_query_column_name=>'REFNO'
,p_heading=>'Refno'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
