prompt --application/shared_components/user_interface/lovs/p138_req
begin
--   Manifest
--     P138_REQ
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
 p_id=>wwv_flow_imp.id(457888424814621553)
,p_lov_name=>'P138_REQ'
,p_static_id=>'p138-req'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        A.requisitionno,',
'        A.Tno ,',
'        a.requisitiondate , ',
'        GetDEPARTMENTName(a.DEPARTMENTCODE) department',
'        from Requisition A',
'        where a.locationcode = :P138_LOCATIONCODE ',
'            and a.doctypecode = :P138_DOCTYPECODE',
'            and ( :P138_FORMSTATUS = ''EDITRECORD''',
'                  OR',
'                  not exists (',
'                select 1 from Issue  aa  ',
'                where aa.requisitiontno = a.tno',
'                ',
'                )',
'            ',
'               );'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'REQUISITIONNO'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457890258835638402)
,p_query_column_name=>'DEPARTMENT'
,p_heading=>'Department'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457889775497638402)
,p_query_column_name=>'REQUISITIONDATE'
,p_heading=>'Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457889386056638402)
,p_query_column_name=>'REQUISITIONNO'
,p_heading=>'Requisition No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(457888996859638400)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
