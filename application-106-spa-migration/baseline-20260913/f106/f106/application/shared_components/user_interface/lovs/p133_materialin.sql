prompt --application/shared_components/user_interface/lovs/p133_materialin
begin
--   Manifest
--     P133_MATERIALIN
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
 p_id=>wwv_flow_imp.id(42602509153376195)
,p_lov_name=>'P133_MATERIALIN'
,p_static_id=>'p133-materialin'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.materialinno,',
'       A.tno,',
'       A.REFDOCNO,',
'       GETPARTYNAME(A.PARTYCODE) PARTYNAME,',
'       A.PARTYCODE',
'  From materialin A',
' Where getdocumentstatuscode(''MATERIALIN'', TNO) = ''ACTIVE''',
'   And (Not Exists',
' (Select 1 From WEIGHMENT AA Where AA.MATERIALINTNO = A.TNO) or :P133_FORMSTATUS=''EDITRECORD'')',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'MATERIALINNO'
,p_version_scn=>'6760336'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(44002269851038495)
,p_query_column_name=>'MATERIALINNO'
,p_heading=>'Materialin  No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(44003440659038495)
,p_query_column_name=>'PARTYCODE'
,p_heading=>'Partycode'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(44003092476038495)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(44002703353038495)
,p_query_column_name=>'REFDOCNO'
,p_heading=>'Party Bill No'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(44001995998038494)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
