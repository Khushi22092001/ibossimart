prompt --application/shared_components/user_interface/lovs/p195_mrn
begin
--   Manifest
--     P195_MRN
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
 p_id=>wwv_flow_imp.id(458410473055204327)
,p_lov_name=>'P195_MRN'
,p_static_id=>'p195-mrn'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.mrnno , a.tno , a.mrndate from mrn a ',
'where getdocumentstatuscode(''MRN'',a.TNO) = ''ACTIVE''',
'and a.partycode = :P195_PARTYCODE',
'and not exists (select 1 from gatepass aa where aa.mrntno = a.tno )',
'union all',
'select a.mrnno , a.tno , a.mrndate from mrn a ',
'where getdocumentstatuscode(''MRN'',a.TNO) = ''ACTIVE''',
'and a.partycode = :P195_PARTYCODE',
'and tno = :P195_MRNTNO'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'MRNNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(458411819425213837)
,p_query_column_name=>'MRNDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(458411438847213837)
,p_query_column_name=>'MRNNO'
,p_heading=>'MRN No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(458410985245213836)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
