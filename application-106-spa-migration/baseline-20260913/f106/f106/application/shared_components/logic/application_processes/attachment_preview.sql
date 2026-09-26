prompt --application/shared_components/logic/application_processes/attachment_preview
begin
--   Manifest
--     APPLICATION PROCESS: attachment_preview
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(498357007888653858)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_name=>'attachment_preview'
,p_static_id=>'attachment-preview'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  vBlob blob;',
'  vmimetype varchar2(500);',
'  vtno    number;',
'  vfilename varchar2(100);',
'  vsno   number;',
'BEGIN',
'SELECT ',
'A.TNO,',
'A.ATTACHMENTBLOB,',
'--nvl(A.ATTACHMENTBLOB,GetAttachmentFileasBlob(a.FileName)) as AttachmentBlob,',
'a.modulesno,',
'CASE',
'  WHEN upper(A.FILENAME) LIKE ''%DOCX%'' then',
'   ''application/vnd.openxmlformats-officedocument.wordprocessingml.document''',
'  WHEN upper(A.FILENAME) LIKE ''%DOC'' then',
'   ''application/msword''',
'  when UPPER(a.filename) like ''%JPG'' then',
'   ''image/jpeg''',
'  when UPPER(a.filename) like ''%JPEG'' then',
'   ''image/jpeg''',
'  when UPPER(a.filename) like ''%PDF'' then',
'    ''application/pdf''',
'  when UPPER(a.filename) like ''%TXT'' then',
'    ''text/plain''',
'  when UPPER(a.filename) like ''%XLS'' then',
'    ''application/vnd.ms-excel''',
'  when UPPER(a.filename) like ''%XLSX'' then',
'    ''application/vnd.openxmlformats-officedocument.spreadsheetml.sheet''',
'  when UPPER(a.filename) like ''%PPT'' then',
'    ''application/vnd.ms-powerpoint''',
'  when UPPER(a.filename) like ''%PPTX'' then',
'    ''application/vnd.openxmlformats-officedocument.presentationml.presentation''',
'  when UPPER(a.filename) like ''%PNG'' then',
'   ''image/png''',
'  when UPPER(a.filename) like ''%TIF%'' then',
'   ''image/tiff''',
'end mimetype,',
'A.FILENAME',
'',
'into vtno,vblob,vsno,vmimetype,vfilename',
'FROM MODULEATTACHMENT A ',
'where a.MODULETNO = :P9995_tno',
'  AND (:P9995_sno IS NULL OR A.MODULESNO=:P9995_sno);',
'  --vfilename := ''              ',
'  owa_util.mime_header(vmimetype,false);',
'  htp.p(''Content-Length: '' || dbms_lob.getlength(vBlob)); ',
'  owa_util.http_header_close;  ',
'  wpg_docload.download_file(vBlob);',
'  exception ',
'  when no_data_found then',
'   null;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>'4360924665'
);
wwv_flow_imp.component_end;
end;
/
