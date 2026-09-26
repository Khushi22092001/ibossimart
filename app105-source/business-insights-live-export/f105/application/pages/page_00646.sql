prompt --application/pages/page_00646
begin
--   Manifest
--     PAGE: 00646
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>7541489808702750
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>646
,p_name=>'Image Priview'
,p_alias=>'IMAGE-PRIVIEW'
,p_page_mode=>'MODAL'
,p_step_title=>'Image Priview'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'var video = document.getElementById(''video'');',
'var videoStream;',
'var canvas = document.getElementById(''canvas'');',
'var context = canvas.getContext(''2d'');',
'',
'var spinner;',
'var spinTargetElem = document.getElementById(''wwvFlowForm'');',
'var spinOptions = {',
'  lines: 13',
', length: 28',
', width: 14',
', radius: 42',
', scale: 1',
', corners: 1',
', color: ''#000''',
', opacity: 0.25',
', rotate: 0',
', direction: 1',
', speed: 1',
', trail: 60',
', fps: 20',
', zIndex: 2e9',
', className: ''spinner''',
', top: ''50%''',
', left: ''50%''',
', shadow: false',
', hwaccel: false',
', position: ''absolute''',
'}'))
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'640'
,p_dialog_width=>'700'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(464276138510663096)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(463508130819938424)
,p_plug_name=>'Camera'
,p_static_id=>'camera'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align:center;">',
'  <video id="video" width="640" height="480" autoplay></video>',
'  <canvas id="canvas" width="640" height="480" style="display:none;"></canvas>',
'</div>'))
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="text-align:center;">',
'  <video id="video" width="640" height="480" autoplay></video>',
'  </div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(464276215332663097)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(464276138510663096)
,p_button_name=>'Cancel'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Cancel'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(464276543359663100)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(464276138510663096)
,p_button_name=>'SNAP_PHOTO'
,p_static_id=>'snap-photo'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Snap Photo'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P646_PHOTO_SEQ_ID'
,p_button_condition_type=>'ITEM_IS_NULL'
,p_icon_css_classes=>'fa-smile-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(464275831613663093)
,p_name=>'P646_PHOTO_SEQ_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(463508130819938424)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(464278638610663121)
,p_name=>'P646_TNO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(463508130819938424)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(464276280866663098)
,p_name=>'cancel dialog'
,p_static_id=>'cancel-dialog'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(464276215332663097)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(464276415635663099)
,p_event_id=>wwv_flow_imp.id(464276280866663098)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-dialog-cancel'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(463508219736938425)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(464275164488663086)
,p_event_id=>wwv_flow_imp.id(463508219736938425)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (''mediaDevices'' in navigator && ''getUserMedia'' in navigator.mediaDevices) {',
    '  alert(''ok'');',
    '} else { alert(''not ok'')} ',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(463508344570938426)
,p_event_id=>wwv_flow_imp.id(463508219736938425)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-javascript-code-2'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var errBack = function(error) {',
    '                console.log(''video capture error: '', error.code);',
    '              };',
    ' ',
    'if (navigator.mediaDevices && navigator.mediaDevices.getUserMedia) {',
    '  navigator.mediaDevices.getUserMedia({ video: true }).then(function(stream) {',
    '    videoStream = stream;',
    '    video.srcObject = stream;',
    '    video.play();',
    '  });',
    '} else if (navigator.getUserMedia) { // Standard',
    '  navigator.getUserMedia({ video: true }, function(stream) {',
    '    videoStream = stream;',
    '    video.src = stream;',
    '    video.play();',
    '  }, errBack);',
    '} else if (navigator.webkitGetUserMedia) { // WebKit-prefixed',
    '  navigator.webkitGetUserMedia({ video: true }, function(stream) {',
    '    videoStream = stream;',
    '    video.srcObject = stream;',
    '    video.play();',
    '  }, errBack);',
    '} else if (navigator.mozGetUserMedia) { // Mozilla-prefixed',
    '  navigator.mozGetUserMedia({ video: true }, function(stream) {',
    '    videoStream = stream;',
    '    video.srcObject = stream;',
    '    video.play();',
    '  }, errBack);',
    '}')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(464276608104663101)
,p_name=>'snap photo'
,p_static_id=>'snap-photo'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(464276543359663100)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(464276686403663102)
,p_event_id=>wwv_flow_imp.id(464276608104663101)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//spinner = new Spinner(spinOptions).spin(spinTargetElem);',
    'context.drawImage(video, 0, 0, 640, 480);',
    'video.style.display = ''none'';',
    'canvas.style.display = ''inline-block'';',
    'videoStream.getTracks()[0].stop();',
    '',
    'apex.server.process(',
    '  ''SAVE_PHOTO'',',
    '  {',
    '    p_clob_01: canvas.toDataURL().match(/,(.*)$/)[1]',
    '	},',
    '	{',
    '    success: function(data) {',
    '               if (data.result == ''success'') {',
    '                 apex.submit(''SNAP_PHOTO'');',
    '               }',
    '             }',
    '  }',
    ');')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(464278155915663116)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'close dialog'
,p_static_id=>'close-dialog'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>25293286715965132
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(464276827180663103)
,p_process_sequence=>20
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PHOTO'
,p_static_id=>'get-photo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_photo_clob clob;',
'  l_photo_blob blob;',
'begin',
'  select blob001',
'  into l_photo_blob',
'  from apex_collections',
'  where collection_name = ''PHOTOS''',
'  and seq_id = :P121_PHOTO_SEQ_ID;',
'   ',
'  l_photo_clob := apex_web_service.blob2clobbase64(',
'                    p_blob => l_photo_blob',
'                  );',
'   ',
'  apex_json.open_object;',
'  apex_json.write(''photoBase64'', l_photo_clob);',
'  apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>25291957980965119
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(463508817710938431)
,p_process_sequence=>10
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'SAVE_PHOTO'
,p_static_id=>'save-photo'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  l_photo_clob clob;',
'  l_photo_blob blob;',
'begin',
'  l_photo_clob := apex_application.g_clob_01;',
' ',
'  l_photo_blob := apex_web_service.clobbase642blob(',
'                    p_clob => l_photo_clob',
'                  );',
' ',
'  apex_collection.add_member(',
'    p_collection_name => ''PHOTOS'',',
'    p_blob001 => l_photo_blob',
'  );',
'  INSERT INTO VISITORINOUT (TNO,IMAGE1) VALUES (:P646_TNO,l_photo_blob);',
'  --:P646_BLOB := l_photo_blob;',
'  ',
'  apex_json.open_object;',
'  apex_json.write(',
'    p_name => ''result'',',
'    p_value => ''success''',
'  );',
'  apex_json.close_object;',
'exception',
'  when others then',
'    apex_json.open_object;',
'    apex_json.write(',
'      p_name => ''result'',',
'      p_value => ''fail''',
'    );',
'    apex_json.close_object;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>24523948511240447
);
wwv_flow_imp.component_end;
end;
/
