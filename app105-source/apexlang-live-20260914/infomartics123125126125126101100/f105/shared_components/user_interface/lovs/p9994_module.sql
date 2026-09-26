prompt --application/shared_components/user_interface/lovs/p9994_module
begin
--   Manifest
--     P9994_MODULE
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
 p_id=>wwv_flow_imp.id(435703228167889919)
,p_lov_name=>'P9994_MODULE'
,p_static_id=>'p9994-module'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select aa.MYBOXLABEL,',
'       ''f?p=&APP_ID.:'' || TO_CHAR(aA.PAGENO) || '':&SESSION.:::::'' target,',
'       aa.MYBOXKEY,',
'       aa.pageno,',
'       ''YES'' As is_current,',
'       decode(nvl(ICONNAME, ''A''), ''A'', '''', ICONNAME) image',
'From (Select *',
'          From myboxtree_apex a',
'         Where A.BossUserCode = :GLOBAL_BOSSUSERCODE',
'           And A.COMPANYCODE = :GLOBAL_COMPANYCODE',
'           AND A.MYBOXTYPE=''MODULE'') AA',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'MYBOXKEY'
,p_display_column_name=>'MYBOXLABEL'
,p_version_scn=>'4388568065'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(435705676786893039)
,p_query_column_name=>'IMAGE'
,p_heading=>'Image'
,p_display_sequence=>60
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(435705324449893039)
,p_query_column_name=>'IS_CURRENT'
,p_heading=>'Is Current'
,p_display_sequence=>50
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(435704945152893039)
,p_query_column_name=>'MYBOXKEY'
,p_heading=>'Myboxkey'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(435703810515893035)
,p_query_column_name=>'MYBOXLABEL'
,p_display_sequence=>15
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(435714694168937159)
,p_query_column_name=>'PAGENO'
,p_heading=>'Pageno'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(435704459347893039)
,p_query_column_name=>'TARGET'
,p_heading=>'Target'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
