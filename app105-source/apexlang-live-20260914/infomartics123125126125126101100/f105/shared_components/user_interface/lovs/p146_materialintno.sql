prompt --application/shared_components/user_interface/lovs/p146_materialintno
begin
--   Manifest
--     P146_MATERIALINTNO
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(439768623459507846)
,p_lov_name=>'P146_MATERIALINTNO'
,p_static_id=>'p146-materialintno'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.MATERIALINNO , A.materialindate , A.TNO , A.REFDOCNO,',
'       GETPARTYNAME(A.PARTYCODE) PARTYNAME,',
'       A.PARTYCODE from materialin A',
'where A.LOCATIONCODE = :P146_LOCATIONCODE',
'and A.DOCTYPECODE = :P146_DOCTYPECODE',
' and (a.partycode = :P146_PARTYCODE ',
'	        Or Exists (Select * ',
'	                   From GROUPOFPARTY AA, GROUPOFPARTYDETAIL BB',
'                    Where AA.TNO = BB.TNO',
'                      And BB.PARTYCODE = :P146_PARTYCODE)',
'				)',
'and getdocumentstatuscode(''MATERIALIN'',A.TNO)=''ACTIVE''',
'AND ( A.TNO = :P146_MATERIALINTNO OR NOT EXISTS ( SELECT 1 FROM GRN AA WHERE MATERIALINTNO = A.TNO))'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'MATERIALINNO'
,p_version_scn=>'6765516'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(439769945129519580)
,p_query_column_name=>'MATERIALINDATE'
,p_heading=>'Date'
,p_display_sequence=>50
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(439769512016519580)
,p_query_column_name=>'MATERIALINNO'
,p_heading=>'MaterialIn No'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(36465199585371139)
,p_query_column_name=>'PARTYCODE'
,p_heading=>'Partycode'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(36464749550371139)
,p_query_column_name=>'PARTYNAME'
,p_heading=>'Party Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(36464411305371139)
,p_query_column_name=>'REFDOCNO'
,p_heading=>'Refdocno'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(439769207782519578)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
