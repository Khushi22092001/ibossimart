prompt --application/shared_components/user_interface/lovs/p133_despatchadvice
begin
--   Manifest
--     P133_DESPATCHADVICE
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
 p_id=>wwv_flow_imp.id(444331417586652830)
,p_lov_name=>'P133_DESPATCHADVICE'
,p_static_id=>'p133-despatchadvice'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select despatchadviceno , tno , despatchadvicedate from despatchadvice',
'where doctypecode = :P133_DOCTYPECODE',
'and  getdocumentstatuscode(''DESPATCHADVICE'',TNO) = ''ACTIVE'''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'DESPATCHADVICENO'
,p_default_sort_column_name=>'DESPATCHADVICENO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444332749464660526)
,p_query_column_name=>'DESPATCHADVICEDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444332344053660526)
,p_query_column_name=>'DESPATCHADVICENO'
,p_heading=>'Despatch Advice No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(444331923738660524)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
