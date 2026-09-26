prompt --application/shared_components/user_interface/lovs/p169_backmoduleflow
begin
--   Manifest
--     P169_BACKMODULEFLOW
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(304103646898757619)
,p_lov_name=>'P169_BACKMODULEFLOW'
,p_static_id=>'p169-backmoduleflow'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'a.ModuleFlowNo,',
'a.TNo,',
'b.ModuleName,',
'c.DocumentStatusName',
'from ModuleFlow a, Module b, DocumentStatus c',
'where',
'a.ModuleCode = b.ModuleCode',
'and a.DocumentStatusCode = c.DocumentStatusCode(+) ',
'and a.CompanyCode = :global_CompanyCode',
'and not a.TNo = :P169_TNO',
'and a.ModuleCode = :P169_MODULECODE',
'order by a.ModuleFlowNo'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'MODULENAME'
,p_version_scn=>'4388337262'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(304105222432757640)
,p_query_column_name=>'DOCUMENTSTATUSNAME'
,p_heading=>'Documentstatusname'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(304104388671757640)
,p_query_column_name=>'MODULEFLOWNO'
,p_heading=>'Moduleflowno'
,p_display_sequence=>15
,p_data_type=>'NUMBER'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(304104844655757640)
,p_query_column_name=>'MODULENAME'
,p_heading=>'Modulename'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(304104030342757636)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
