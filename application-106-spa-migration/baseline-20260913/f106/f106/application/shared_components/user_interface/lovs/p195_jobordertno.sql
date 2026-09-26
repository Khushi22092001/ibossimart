prompt --application/shared_components/user_interface/lovs/p195_jobordertno
begin
--   Manifest
--     P195_JOBORDERTNO
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
 p_id=>wwv_flow_imp.id(452354965946739285)
,p_lov_name=>'P195_JOBORDERTNO'
,p_static_id=>'p195-jobordertno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'JOBORDERNO , ',
'TNO , ',
'JOBORDERDATE ',
'FROM JOBORDER',
'where doctypecode = :P195_DOCTYPECODE',
'    and partycode = :P195_PARTYCODE',
'    and getdocumentstatuscode(''JOBORDER'',TNO)=''ACTIVE'' '))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'JOBORDERNO'
,p_version_scn=>'30296844'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(452356826405772165)
,p_query_column_name=>'JOBORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(452356445632772165)
,p_query_column_name=>'JOBORDERNO'
,p_heading=>'Job No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(452356047209772161)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
