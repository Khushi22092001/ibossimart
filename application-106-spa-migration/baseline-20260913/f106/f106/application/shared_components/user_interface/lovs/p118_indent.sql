prompt --application/shared_components/user_interface/lovs/p118_indent
begin
--   Manifest
--     P118_INDENT
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
 p_id=>wwv_flow_imp.id(606864119973285006)
,p_lov_name=>'P118_INDENT'
,p_static_id=>'p118-indent'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT tno, ',
'       indentno, ',
'       indentdate, ',
'       getdepartmentname(departmentcode) AS DepartmentName',
'FROM indent a',
'WHERE locationcode = :P118_LOCATIONCODE ',
'  AND companycode = :global_companycode',
'  AND (',
'       -- Condition 1: Specifically requested Indent',
'       tno = :P118_INDENTTNO ',
'       OR ',
'       (',
'        -- Condition 2: Active indents with pending quantities',
'        getdocumentstatuscode(''INDENT'', a.tno) = ''ACTIVE''',
'        AND (',
'             :P118_FORMSTATUS = ''EDITRECORD'' ',
'             OR EXISTS (',
'                 SELECT 1 ',
'                 FROM indentdetail b ',
'                 WHERE b.tno = a.tno ',
'                   AND NVL(b.quantity1, 0) - NVL(b.orderedquantity1, 0) > 0',
'             )',
'        )',
'       )',
'  )',
'ORDER BY indentdate DESC, indentno DESC;',
''))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'TNO'
,p_display_column_name=>'INDENTNO'
,p_version_scn=>'41461982'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(606866226003293312)
,p_query_column_name=>'DEPARTMENTNAME'
,p_heading=>'Department Name'
,p_display_sequence=>40
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(606865771061293312)
,p_query_column_name=>'INDENTDATE'
,p_heading=>'Indent Date'
,p_display_sequence=>30
,p_data_type=>'DATE'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(606865359242293312)
,p_query_column_name=>'INDENTNO'
,p_heading=>'Indent No'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(606864949797293309)
,p_query_column_name=>'TNO'
,p_display_sequence=>10
,p_data_type=>'NUMBER'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp.component_end;
end;
/
