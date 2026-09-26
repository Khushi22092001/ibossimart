prompt --application/shared_components/logic/application_processes/get_binary_file
begin
--   Manifest
--     APPLICATION PROCESS: GET_BINARY_FILE
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(53531154616945347)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'GET_BINARY_FILE'
,p_static_id=>'get-binary-file'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_blob          BLOB;',
'    l_mime_type     VARCHAR2(200);',
'    l_file_name     VARCHAR2(200);',
'    v_tno           NUMBER := apex_application.g_x01;',
'BEGIN',
'',
'    SELECT FILE_DATA, MIME_TYPE, FILE_NAME ',
'    INTO   l_blob, l_mime_type, l_file_name',
'    FROM   BINARY_STORE',
'    WHERE  TNO = v_tno',
'    ORDER BY TNO DESC',
'    FETCH FIRST 1 ROW ONLY;',
'',
'    owa_util.mime_header(nvl(l_mime_type, ''application/octet-stream''), FALSE);',
'    htp.p(''Content-Length: '' || dbms_lob.getlength(l_blob));',
'    htp.p(''Content-Disposition: inline; filename="'' || l_file_name || ''"''); ',
'    owa_util.http_header_close;',
'',
'    wpg_docload.download_file(l_blob);',
'EXCEPTION',
'    WHEN OTHERS THEN',
'        htp.p(''Error: File not found.'');',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'47548829'
);
wwv_flow_imp.component_end;
end;
/
