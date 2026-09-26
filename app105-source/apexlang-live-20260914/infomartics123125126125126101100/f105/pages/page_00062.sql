prompt --application/pages/page_00062
begin
--   Manifest
--     PAGE: 00062
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
 p_id=>62
,p_name=>'Party Detail Party Attribute'
,p_alias=>'PARTY-DETAIL-PARTY-ATTRIBUTE'
,p_page_mode=>'MODAL'
,p_step_title=>'Party Detail Party Attribute'
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
,p_dialog_chained=>'N'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(865916997403339435)
,p_plug_name=>'Attribute '
,p_static_id=>'attribute'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:t-Form--stretchInputs:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ATTRIBUTECODE,',
'       ATTRIBUTEVALUE,',
'       REMARK,',
'       TNO,',
'       ATTACHMENTBLOB,',
'       FILENAME,',
'       SNO,',
'       trunc(sysdate) as Creationdate,',
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
'            */',
'            mimetype',
'  from PARTYATTRIBUTEDETAIL A'))
,p_is_editable=>false
,p_plug_source_type=>'NATIVE_FORM'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(866242469706651610)
,p_plug_name=>'BUTTONS'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573100279336943805)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(866242469706651610)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'DELETE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573101115271943805)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(866242469706651610)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Save'
,p_button_position=>'NEXT'
,p_button_condition=>'P62_SNO'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573099923775943804)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(866242469706651610)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'DELETE'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>'P62_SNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(573100732413943805)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(866242469706651610)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Update'
,p_button_position=>'NEXT'
,p_button_condition=>'P62_SNO'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(865919776052339456)
,p_name=>'P62_ATTACHMENTBLOB'
,p_source_data_type=>'BLOB'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_prompt=>'<b>Attachment</b>'
,p_source=>'ATTACHMENTBLOB'
,p_display_as=>'NATIVE_FILE'
,p_cSize=>30
,p_colspan=>5
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
  'filename_column', 'FILENAME',
  'mime_type_column', 'MIMETYPE',
  'storage_type', 'DB_COLUMN')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(865919571872339454)
,p_name=>'P62_ATTRIBUTECODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_prompt=>'<b>Attribute Name</b>'
,p_source=>'ATTRIBUTECODE'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select PARTYATTRIBUTENAME D, PARTYATTRIBUTECODE From PARTYATTRIBUTE',
'where getdocumentstatuscode(''PARTYATTRIBUTE'',TNO) = ''ACTIVE'''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_cMaxlength=>30
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>2
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
 p_id=>wwv_flow_imp.id(865919629247339455)
,p_name=>'P62_ATTRIBUTEVALUE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_prompt=>'<b>Attribute Value</b>'
,p_source=>'ATTRIBUTEVALUE'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_colspan=>5
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(870536579168392256)
,p_name=>'P62_CREATIONDATE'
,p_source_data_type=>'DATE'
,p_is_query_only=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_source=>'CREATIONDATE'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(865919838347339457)
,p_name=>'P62_FILENAME'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_source=>'FILENAME'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(870536433384392255)
,p_name=>'P62_MIMETYPE'
,p_source_data_type=>'VARCHAR2'
,p_is_query_only=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_source=>'MIMETYPE'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(865918518536339444)
,p_name=>'P62_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_source=>'REMARK'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(865919940079339458)
,p_name=>'P62_SNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_default=>'GLOBALTNO'
,p_item_default_type=>'SEQUENCE'
,p_source=>'SNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(865918629832339445)
,p_name=>'P62_TNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_item_source_plug_id=>wwv_flow_imp.id(865916997403339435)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(573102125616943806)
,p_name=>'Cancledialog'
,p_static_id=>'cancledialog'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(573100279336943805)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(573102623175943809)
,p_event_id=>wwv_flow_imp.id(573102125616943806)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-close'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(573101750722943805)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'N')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE,SAVE,DELETE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>140256895280720031
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(573098853325943803)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(865916997403339435)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Party Detail Party Attribute'
,p_static_id=>'initialize-form-party-detail-party-attribute'
,p_internal_uid=>140253997883720029
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(573099188603943804)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(865916997403339435)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Account Master'
,p_static_id=>'process-form-account-master'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>140254333161720030
);
wwv_flow_imp.component_end;
end;
/
