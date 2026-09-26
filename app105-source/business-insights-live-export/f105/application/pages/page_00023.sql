prompt --application/pages/page_00023
begin
--   Manifest
--     PAGE: 00023
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
 p_id=>23
,p_name=>'GENERATEIRN'
,p_alias=>'GENERATEIRN'
,p_page_mode=>'MODAL'
,p_step_title=>'GENERATEIRN'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>2100407606326202693
,p_page_template_options=>'#DEFAULT#'
,p_dialog_height=>'400'
,p_dialog_width=>'600'
,p_protection_level=>'C'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(48026607535854944)
,p_plug_name=>'Cancel IRN'
,p_static_id=>'cancel-irn'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>90
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_display_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_display_when_condition=>'P23_ACTION'
,p_plug_display_when_cond2=>'CANCEL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(48026815235854947)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(48026607535854944)
,p_button_name=>'CANCEL_IRN'
,p_static_id=>'cancel-irn'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel IRN'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(567400490107040933)
,p_name=>'P23_ACTION'
,p_item_sequence=>40
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48026677540854945)
,p_name=>'P23_CANCEL_REASON_CODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(48026607535854944)
,p_prompt=>'Cancel Reason Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'IRNCANCELREASONNAME as d,',
'IRNCANCELREASONCODE as r',
'FROM IRNCANCELREASON',
'Order by 2'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select Cancel Reason --'
,p_cHeight=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(48026808198854946)
,p_name=>'P23_CANCEL_REMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(48026607535854944)
,p_prompt=>'Cancel Remark'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>300
,p_cHeight=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(569416938659400790)
,p_name=>'P23_INVOICEDATE'
,p_item_sequence=>70
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(569416834282400789)
,p_name=>'P23_INVOICENO'
,p_item_sequence=>60
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(567400994470040938)
,p_name=>'P23_LOCATIONCODE'
,p_item_sequence=>50
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(569417015604400791)
,p_name=>'P23_MODULECODE'
,p_item_sequence=>30
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(567400750724040935)
,p_name=>'P23_MODULETNO'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(567400080858040929)
,p_name=>'P23_TNO'
,p_item_sequence=>10
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(179757027606074115)
,p_name=>'P23_WITHEWAYBILL'
,p_item_sequence=>80
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(48026988951854948)
,p_name=>'Cancel the IRN'
,p_static_id=>'cancel-the-irn'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(48026815235854947)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(48027094819854949)
,p_event_id=>wwv_flow_imp.id(48026988951854948)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P23_MODULETNO,P23_CANCEL_REASON_CODE,P23_CANCEL_REMARK',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'IF :P23_ACTION =  ''CANCEL'' then  ',
    '        RequestForCancelIRN(:P23_MODULETNO, :P23_CANCEL_REASON_CODE, :P23_CANCEL_REMARK);',
    'end if;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(48027155362854950)
,p_event_id=>wwv_flow_imp.id(48026988951854948)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-submit-page'
,p_action=>'NATIVE_SUBMIT_PAGE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_processing', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(38691471214018485)
,p_name=>'generateIRn'
,p_static_id=>'generateirn'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(38691995652018486)
,p_event_id=>wwv_flow_imp.id(38691471214018485)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P23_TNO,P23_ACTION,P23_MODULETNO,P23_MODULECODE,P23_LOCATIONCODE,P23_INVOICENO,P23_INVOICEDATE,P23_WITHEWAYBILL',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '  tmessage varchar2(2000);',
    '  ',
    'begin',
    '--:P23_WITHEWAYBILL  := ''YES'';',
    '    if :P23_ACTION = ''CHECK'' then',
    '       tmessage := GetEInvoiceValidation(:P23_MODULETNO);',
    '       raise_application_error(-20000,'' ''||tmessage);',
    '    ELSIF UPPER(:P23_ACTION) =  ''REQUESTIRN'' then',
    '      --raise_application_error(-20001,'' WITH WAY BILL ''||:P23_WITHEWAYBILL|| '' THIS IS NOT ERROR. REQUEST FOR IRN DONE'');',
    '       RequestForIRN(:P23_MODULETNO, :P23_WITHEWAYBILL);',
    '      -- raise_application_error(-20001,'' ''|| ''THIS IS NOT ERROR. REQUEST FOR IRN DONE with ''||:P23_WITHEWAYBILL);',
    '    ELSIF :P23_ACTION =  ''GETIRN'' then',
    '        RequestForGeneratedIRN(:P23_MODULETNO);',
    '    ELSIF :P23_ACTION =  ''CANCEL'' then  ',
    '        -- RequestForCancelIRN(:P23_MODULETNO, :P23_CANCEL_REASON_CODE, :P23_CANCEL_REMARK);',
    '        NULL;',
    '    end if;',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(33491223565959533)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'New'
,p_static_id=>'new'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'show_success_messages', 'Y')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>16024211440730217
);
wwv_flow_imp.component_end;
end;
/
