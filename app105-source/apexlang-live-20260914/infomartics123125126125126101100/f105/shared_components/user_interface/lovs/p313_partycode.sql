prompt --application/shared_components/user_interface/lovs/p313_partycode
begin
--   Manifest
--     P313_PARTYCODE
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
 p_id=>wwv_flow_imp.id(161361821425633528)
,p_lov_name=>'P313_PARTYCODE'
,p_static_id=>'p313-partycode'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    A.VENDORNAME, ',
'    A.VENDORCODE, ',
'    getcityname(A.officecitycode) AS city',
'FROM vendor A',
'LEFT JOIN DOCUMENTSTATUSDETAIL B ',
'    ON A.TNO = B.MODULETNO',
'WHERE NVL(GETMYPARAMETERVALUE(''VENDORAPPLICABLEINPURCHASE''),''NO'') = ''YES''',
'  AND B.DOCUMENTSTATUSCODE = ''ACTIVE''',
'AND EXISTS (',
'    SELECT 1 ',
'    FROM Enquirypartydetail aa ',
'    WHERE aa.partycode = A.vendorcode ',
'      AND aa.tno = :P710_ENQUIRYTNO',
')',
'UNION ALL',
'SELECT ',
'    A.PARTYNAME, ',
'    A.PARTYCODE, ',
'    getcityname(A.officecitycode) AS city',
'FROM PARTY A',
'WHERE NVL(GETMYPARAMETERVALUE(''VENDORAPPLICABLEINPURCHASE''),''NO'') = ''NO''',
'  AND getdocumentstatuscode(''PARTY'',TNO) = ''ACTIVE''',
'AND partytypecode = ''SUPPLIER''',
'AND EXISTS (',
'    SELECT 1 ',
'    FROM ENQUIRYPARTYDETAIL AA ',
'    WHERE AA.PARTYCODE = A.PARTYCODE ',
'      AND AA.TNO = :P710_ENQUIRYTNO',
')',
'ORDER BY 1;'))
,p_source_type=>'SQL'
,p_location=>'LOCAL'
,p_return_column_name=>'VENDORCODE'
,p_display_column_name=>'VENDORNAME'
,p_version_scn=>'19239582'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(161363040056633528)
,p_query_column_name=>'CITY'
,p_heading=>'City'
,p_display_sequence=>30
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(161362145430633528)
,p_query_column_name=>'VENDORCODE'
,p_display_sequence=>10
,p_data_type=>'VARCHAR2'
,p_is_visible=>'N'
,p_is_searchable=>'N'
);
wwv_flow_imp_shared.create_list_of_values_cols(
 p_id=>wwv_flow_imp.id(161362545259633528)
,p_query_column_name=>'VENDORNAME'
,p_heading=>'Name'
,p_display_sequence=>20
,p_data_type=>'VARCHAR2'
);
wwv_flow_imp.component_end;
end;
/
