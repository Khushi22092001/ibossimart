prompt --application/shared_components/user_interface/lovs/221_jobbill
begin
--   Manifest
--     221_JOBBILL
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
 p_id=>wwv_flow_imp.id(451446098267013205)
,p_lov_name=>'221_JOBBILL'
,p_static_id=>'221-jobbill'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'	  A.TNO',
'	, A.JOBBILLNO',
'	, A.PARTYBILLNO',
'	, A.JOBBILLDATE ',
'FROM JOBBILL A',
'WHERE A.PARTYCODE = :P221_PARTYCODE',
'AND NOT EXISTS (SELECT 1 FROM JBPASS x WHERE x.JOBBILLTNO = A.TNO)',
'',
'UNION ALL',
'',
'SELECT ',
'	  A.TNO ',
'	, A.JOBBILLNO ',
'	, A.PARTYBILLNO',
'	, A.JOBBILLDATE ',
'FROM JOBBILL A',
'WHERE A.PARTYCODE = :P221_PARTYCODE',
'AND EXISTS(SELECT 1 FROM JBPASS x WHERE x.TNO = :P221_TNO AND A.TNO = x.JOBBILLTNO);;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'JOBBILLNO'
,p_version_scn=>'46220841'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(451447286697024530)
,p_query_column_name=>'JOBBILLDATE'
,p_heading=>'DATE'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(451446897898024529)
,p_query_column_name=>'JOBBILLNO'
,p_heading=>'JOB BILL NO'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(183836281019099559)
,p_query_column_name=>'PARTYBILLNO'
,p_heading=>'Party Bill No'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(451446639012024527)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
