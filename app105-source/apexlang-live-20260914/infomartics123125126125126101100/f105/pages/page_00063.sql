prompt --application/pages/page_00063
begin
--   Manifest
--     PAGE: 00063
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>1466918471259373
,p_default_application_id=>100
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>63
,p_name=>'Attachment'
,p_alias=>'PARTY-DETAIL-PARTY-ATTACHMENT'
,p_page_mode=>'MODAL'
,p_step_title=>'Attachment'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''input'').on(''focus'', function() {',
'$("#"+this.id+"_LABEL").css("background-color", "yellow");',
'}).on(''blur'', function() {',
'$("#"+this.id+"_LABEL").css("background-color", "white");',
'});',
'',
'',
'',
'$(document).ready(function() {',
'$(''input'').keydown( function(e) {',
'        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;',
'        if(key == 13) {',
'            e.preventDefault();',
'            var inputs = $(this).closest(''form'').find('':input:visible'');',
'            inputs.eq( inputs.index(this)+ 1 ).focus();',
'        }',
'    });',
'});'))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(866273026548658763)
,p_plug_name=>'BUTTONS'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(866271902684658751)
,p_plug_name=>'Party Attachment'
,p_static_id=>'party-attachment'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:t-Form--stretchInputs:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'      -- a.SNO,',
'       --a.DESCRIPTION,',
'       A.MODULETNO,',
'       A.MODULESNO,',
'       A.ATTRIBUTECODE,',
'       A.ATTRIBUTEVALUE,',
'       a.ATTACHMENTBLOB,',
'       a.FILENAME,',
'       trunc(sysdate) as Creationdate,',
'       a.mimetype',
'       /*CASE',
'              WHEN upper(A.FILENAME) LIKE ''%DOCX%'' then',
'               ''application/vnd.openxmlformats-officedocument.wordprocessingml.document''',
'              WHEN upper(A.FILENAME) LIKE ''%DOC'' then',
'               ''application/msword''',
'              when UPPER(a.filename) like ''%JPG'' then',
'               ''image/jpeg''',
'              when UPPER(a.filename) like ''%JPEG'' then',
'               ''image/jpeg''',
'              when UPPER(a.filename) like ''%PDF'' then',
'                ''application/pdf''',
'              when UPPER(a.filename) like ''%TXT'' then',
'                ''text/plain''',
'              when UPPER(a.filename) like ''%XLS'' then',
'                ''application/vnd.ms-excel''',
'              when UPPER(a.filename) like ''%XLSX'' then',
'                ''application/vnd.openxmlformats-officedocument.spreadsheetml.sheet''',
'              when UPPER(a.filename) like ''%PPT'' then',
'                ''application/vnd.ms-powerpoint''',
'              when UPPER(a.filename) like ''%PPTX'' then',
'                ''application/vnd.openxmlformats-officedocument.presentationml.presentation''',
'              when UPPER(a.filename) like ''%PNG'' then',
'               ''image/png''',
'              when UPPER(a.filename) like ''%TIF%'' then',
'               ''image/tiff''',
'            end mimetype',
'          */',
'  from MODULEATTACHMENT a',
'  WHERE  A.MODULESNO = :P63_MODULESNO',
'  /*',
'  union all',
'  select a.TNO,',
'      -- a.SNO,',
'       --a.DESCRIPTION,',
'       A.TNO as ModuleTno,',
'       A.SNO as ModuleSno,',
'       A.ATTRIBUTECODE,',
'       A.ATTRIBUTEVALUE,',
'       a.ATTACHMENTBLOB,',
'       a.FILENAME,',
'       trunc(sysdate) as Creationdate,',
'       a.mimetype',
'       CASE',
'              WHEN upper(A.FILENAME) LIKE ''%DOCX%'' then',
'               ''application/vnd.openxmlformats-officedocument.wordprocessingml.document''',
'              WHEN upper(A.FILENAME) LIKE ''%DOC'' then',
'               ''application/msword''',
'              when UPPER(a.filename) like ''%JPG'' then',
'               ''image/jpeg''',
'              when UPPER(a.filename) like ''%JPEG'' then',
'               ''image/jpeg''',
'              when UPPER(a.filename) like ''%PDF'' then',
'                ''application/pdf''',
'              when UPPER(a.filename) like ''%TXT'' then',
'                ''text/plain''',
'              when UPPER(a.filename) like ''%XLS'' then',
'                ''application/vnd.ms-excel''',
'              when UPPER(a.filename) like ''%XLSX'' then',
'                ''application/vnd.openxmlformats-officedocument.spreadsheetml.sheet''',
'              when UPPER(a.filename) like ''%PPT'' then',
'                ''application/vnd.ms-powerpoint''',
'              when UPPER(a.filename) like ''%PPTX'' then',
'                ''application/vnd.openxmlformats-officedocument.presentationml.presentation''',
'              when UPPER(a.filename) like ''%PNG'' then',
'               ''image/png''',
'              when UPPER(a.filename) like ''%TIF%'' then',
'               ''image/tiff''',
'            end mimetype',
'          ',
'  from locationdetail a',
'  WHERE A.TNO = :P63_MODULETNO',
'  AND A.SNO = :P63_MODULESNO',
'  */',
'  '))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
,p_ajax_items_to_submit=>'P63_MODULESNO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573113004509947995)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(866273026548658763)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'PREVIOUS'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573112558720947995)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(866273026548658763)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'CREATE'
,p_button_condition=>'P63_ATTRIBUTECODE'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573113439543947995)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(866273026548658763)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'PREVIOUS'
,p_button_condition=>'P63_ATTRIBUTECODE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573112245463947994)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(866273026548658763)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'CREATE'
,p_button_condition=>'P63_ATTRIBUTECODE'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(866273619627658761)
,p_name=>'P63_ATTACHMENTBLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_prompt=>'<b>Attachment</b>'
,p_source=>'ATTACHMENTBLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>100
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'allow_copy_paste', 'N',
  'blob_last_updated_column', 'CREATIONDATE',
  'content_disposition', 'attachment',
  'display_as', 'INLINE',
  'display_download_link', 'Y',
  'download_link_text', 'Download',
  'filename_column', 'FILENAME',
  'mime_type_column', 'MIMETYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(713334646287468088)
,p_name=>'P63_ATTRIBUTECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_prompt=>'Attribute'
,p_source=>'ATTRIBUTECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT PARTYATTRIBUTENAME, PARTYATTRIBUTECODE FROM PARTYATTRIBUTE',
'ORDER BY 1'))
,p_cSize=>30
,p_cMaxlength=>30
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(713334757051468089)
,p_name=>'P63_ATTRIBUTEVALUE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_prompt=>'Attribute Value'
,p_source=>'ATTRIBUTEVALUE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(870159629313874960)
,p_name=>'P63_CREATIONDATE'
,p_source_data_type=>'DATE'
,p_is_query_only=>true
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_source=>'CREATIONDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(866273800783658762)
,p_name=>'P63_FILENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_source=>'FILENAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(870159730192874961)
,p_name=>'P63_MIMETYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_source=>'MIMETYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(584722688931205222)
,p_name=>'P63_MODULESNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_source=>'MODULESNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(584722576978205221)
,p_name=>'P63_MODULETNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_source=>'MODULETNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(866273318032658757)
,p_name=>'P63_TNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_item_source_plug_id=>wwv_flow_imp.id(866271902684658751)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(573114418986947995)
,p_name=>'Cancle Dialog'
,p_static_id=>'cancle-dialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(573113004509947995)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(573114919196947997)
,p_event_id=>wwv_flow_imp.id(573114418986947995)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(573114042059947995)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'DELETE,SAVE,CREATE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>140269186617724221
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(584722823462205223)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET TNO'
,p_static_id=>'get-tno'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'IF :P63_TNO IS NULL THEN',
'    :P63_TNO := GLOBALTNO.NEXTVAL;',
'END IF;',
'IF :P63_MODULESNO IS NULL THEN',
'    :P63_MODULESNO := GLOBALTNO.NEXTVAL;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>151877968019981449
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(573111098335947991)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(866271902684658751)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Party Detail Party Attachment'
,p_static_id=>'initialize-form-party-detail-party-attachment'
,p_internal_uid=>140266242893724217
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(573111525053947992)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(866271902684658751)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process Form Account Master'
,p_static_id=>'process-form-account-master'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>140266669611724218
);
wwv_flow_imp.component_end;
end;
/
