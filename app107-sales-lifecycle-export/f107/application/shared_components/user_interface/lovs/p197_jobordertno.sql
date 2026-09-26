prompt --application/shared_components/user_interface/lovs/p197_jobordertno
begin
--   Manifest
--     P197_JOBORDERTNO
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
 p_id=>wwv_flow_imp.id(462169011410759678)
,p_lov_name=>'P197_JOBORDERTNO'
,p_static_id=>'p197-jobordertno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tno , joborderno , joborderdate from joborder a ',
'where a.joborderdate <= :P197_PRODUCTIONDATE ',
'and getdocumentstatuscode(''JOBORDER'',A.TNO)=''ACTIVE'' ',
'and partycode = :P197_CONTRACTORCODE'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'JOBORDERNO'
,p_default_sort_column_name=>'JOBORDERNO'
,p_default_sort_direction=>'ASC'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462170574648764233)
,p_query_column_name=>'JOBORDERDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462170174949764233)
,p_query_column_name=>'JOBORDERNO'
,p_heading=>'Job Order No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(462169778091764232)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
