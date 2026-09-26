prompt --application/pages/page_00381
begin
--   Manifest
--     PAGE: 00381
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
 p_id=>381
,p_name=>'Payment Follow-up Action'
,p_alias=>'PAYMENT-FOLLOW-UP-ACTION'
,p_step_title=>'Payment Follow-up Action'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* #P381_CALLINGDATE .apex-item-datepicker{',
'    width: 400px;',
'}',
'#P381_NEXTFOLLOWUPDATE .apex-item-datepicker{',
'    width: 400px;',
'} */'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13988552263097418)
,p_plug_name=>'Audit Info'
,p_static_id=>'audit-info'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader js-addHiddenHeadingRoleDesc:t-Region--noUI:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(17396746397774715)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>40
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13988893577097421)
,p_plug_name=>'Call Execution & Next Action'
,p_static_id=>'call-execution-next-action'
,p_parent_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13988671272097419)
,p_plug_name=>'General'
,p_static_id=>'general'
,p_parent_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(13988831053097420)
,p_plug_name=>'Invoice & Financial Details'
,p_static_id=>'invoice-financial-details'
,p_parent_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(50372051520162207)
,p_plug_name=>'Payment Follow-up Action'
,p_static_id=>'payment-follow-up-action'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>4501440665235496320
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'TABLE'
,p_query_table=>'PAYMENTFOLLOWUPACTION'
,p_include_rowid_column=>false
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_plug_source_type=>'NATIVE_FORM'
,p_plug_read_only_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_plug_read_only_when=>'P381_IS_READONLY'
,p_plug_read_only_when2=>'1'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14047893515215410)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(17396746397774715)
,p_button_name=>'ADD_NEW'
,p_static_id=>'add-new'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CREATE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.:P&APP_PAGE_ID._FORMSTATUS:NEWRECORD'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P381_FORMSTATUS = ''EDITRECORD'' ',
'AND CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,383,''INSERT'') = 1 ',
'AND :P381_TNO IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14048305918215410)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(17396746397774715)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:377:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14049488823215411)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(17396746397774715)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P381_FORMSTATUS = ''NEWRECORD'' ',
'-- AND CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,383,''INSERT'') = 1 ',
'AND :P381_TNO IS NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14048744156215411)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(17396746397774715)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P381_FORMSTATUS = ''EDITRECORD'' ',
'AND :P381_TNO IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-trash-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14050275078215411)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(17396746397774715)
,p_button_name=>'PRINT'
,p_static_id=>'print'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P381_FORMSTATUS = ''EDITRECORD'' AND :P381_TNO IS NOT NULL',
'AND ',
'1=2 -- Disabled the Print button as not required',
'--AND CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,383,''PRINT'') = 1'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13990806951097440)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(13988671272097419)
,p_button_name=>'REVISE'
,p_static_id=>'revise'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Next Follow up'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT 1 ',
'FROM DOCUMENTSTATUSDETAIL dsd',
'JOIN PAYMENTFOLLOWUPACTION pfa ON dsd.MODULETNO = pfa.TNO',
'WHERE dsd.MODULETNO = :P381_TNO ',
'  AND dsd.MODULECODE = ''PAYMENTFOLLOWUPACTION''',
'  AND :P381_TNO IS NOT NULL',
'  AND pfa.IS_REVISED = ''N'''))
,p_button_condition_type=>'EXISTS'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
,p_grid_column_span=>2
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14049136089215411)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(17396746397774715)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P381_FORMSTATUS = ''EDITRECORD'' ',
'--AND CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,383,''UPDATE'') = 1 ',
'AND :P381_TNO IS NOT NULL'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(14049876696215411)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(17396746397774715)
,p_button_name=>'STATUS'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P381_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition=>':P381_FORMSTATUS = ''EDITRECORD'' AND :P381_TNO IS NOT NULL'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13989920357097431)
,p_branch_name=>'Land on Same Page after Creation'
,p_branch_action=>'f?p=&APP_ID.:381:&SESSION.::&DEBUG.:381:P381_TNO,P381_FORMSTATUS:&P381_TNO.,EDITRECORD&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'REQUEST_IN_CONDITION'
,p_branch_condition=>'CREATE,SAVE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13990014574097432)
,p_branch_name=>'Land on Report Page after Deletion'
,p_branch_action=>'f?p=&APP_ID.:377:&SESSION.::&DEBUG.:377::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(14048744156215411)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13991175013097444)
,p_branch_name=>'Land on Same Page after Revision'
,p_branch_action=>'f?p=&APP_ID.:381:&SESSION.::&DEBUG.:381:P381_TNO,P381_FORMSTATUS,P381_PAYMENTFOLLOWUPNO:&P381_TNO.,EDITRECORD,&P381_PAYMENTFOLLOWUPNO.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(13990806951097440)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13990179704097434)
,p_name=>'P381_ALLOWEDBACK'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13990335395097435)
,p_name=>'P381_ALLOWEDFORWARD'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50374440119162212)
,p_name=>'P381_CALLINGDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(13988893577097421)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Calling Date'
,p_source=>'CALLINGDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'style="width: 400px;"'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50374078678162212)
,p_name=>'P381_CALLINGPERSON'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(13988893577097421)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Calling Person'
,p_source=>'CALLINGPERSON'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     EMPLOYEENAME,',
'     EMPLOYEECODE',
'FROM EMPLOYEE E'))
,p_cSize=>30
,p_tag_attributes=>'style="width: 400px;"'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50374916135162212)
,p_name=>'P381_CALLINGSTATUS'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(13988893577097421)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Calling Status'
,p_source=>'CALLINGSTATUS'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Answered;A,Not Answered;NA'
,p_lov_display_null=>'YES'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50375672806162212)
,p_name=>'P381_COMMENTS'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(13988893577097421)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Comments'
,p_source=>'COMMENTS'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>2
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50376082178162212)
,p_name=>'P381_COMMITEDAMOUNT'
,p_source_data_type=>'NUMBER'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13988831053097420)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Commited Amount'
,p_source=>'COMMITEDAMOUNT'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13989144858097423)
,p_name=>'P381_COMPANYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_default=>':GLOBAL_COMPANYCODE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'COMPANYCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13882042373619965)
,p_name=>'P381_CREATIONTIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(13988552263097418)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Creation Time'
,p_source=>'CREATIONTIME'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13881897308619964)
,p_name=>'P381_CREATOR'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(13988552263097418)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Creator'
,p_source=>'CREATOR'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13989409784097426)
,p_name=>'P381_DOCTYPECODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(13988671272097419)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.DocTypeName,',
'a.DocTypeCode',
'from DocType a, ModuleDocTypeDetail b , ModuleDocType c',
'where a.DocTypeCode = b.DocTypeCode',
'and b.tno = c.tno',
'and c.companycode = :global_companycode',
'and c.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'and (',
'     not exists(',
'         select ',
'             aa.TNo',
'         from ModulePrivilege aa, ModulePrivilegeDocType bb, BossUser cc',
'         where aa.tno = bb.tno',
'             and aa.BossUserCode = cc.BossUserCode',
'             and cc.LoginName = :GLOBAL_LOGINNAME',
'             and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'             and aa.CompanyCode = :global_CompanyCode',
'     )',
'     or',
'     exists(',
'         select ',
'             aa.TNo',
'         from ModulePrivilege aa, ModulePrivilegeDocType bb, BossUser cc',
'         where aa.tno = bb.tno',
'             and aa.BossUserCode = cc.BossUserCode',
'             and cc.LoginName = :GLOBAL_LOGINNAME',
'             and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'             and bb.DocTypeCode = a.DocTypeCode',
'             and aa.CompanyCode = :global_CompanyCode',
'     )',
')',
'order by a.DocTypeName',
'Fetch first row only'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Doctype'
,p_source=>'DOCTYPECODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'DOCTYPE1'
,p_cSize=>30
,p_cMaxlength=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13989204298097424)
,p_name=>'P381_FINANCIALYEARCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_default=>':GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source=>'FINANCIALYEARCODE'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14058175362234724)
,p_name=>'P381_FORMSTATUS'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'	begin',
'	If :P381_TNO is null then',
'		return(''NEWRECORD'');',
'	else',
'		return(''EDITRECORD'');',
'	End if;',
'	end ;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50373668575162211)
,p_name=>'P381_INVOICEBALANCE'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(13988831053097420)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Invoice Balance'
,p_source=>'INVOICEBALANCE'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'readonly=true'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50373228555162211)
,p_name=>'P381_INVOICETNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13988831053097420)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Invoices'
,p_source=>'INVOICETNO'
,p_display_as=>'NATIVE_SELECT_MANY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    I.INVOICENO AS D,',
'    I.TNO AS R',
'FROM INVOICE I',
'WHERE I.PARTYCODE = :P381_PARTYCODE',
'  AND NVL(I.INVOICEAMOUNT, 0) > (',
'      SELECT NVL(SUM(X.AMOUNT), 0) ',
'      FROM DFREIGHTBILLRECEIPTDETAIL X ',
'      WHERE X.TNO = I.MODULETNO',
'  )',
''))
,p_lov_cascade_parent_items=>'P381_PARTYCODE'
,p_ajax_items_to_submit=>'P381_INVOICETNO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>32
,p_cMaxlength=>255
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y',
  'use_defaults', 'Y')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14057868754233652)
,p_name=>'P381_IS_READONLY'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13989286640097425)
,p_name=>'P381_LOCATIONCODE'
,p_source_data_type=>'VARCHAR2'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13988671272097419)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'	a.LocationCode',
'From Location a, ModuleLocationDetail b , ModuleLocation c',
'Where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'	and c.CompanyCode = :GLOBAL_COMPANYCODE',
'	and (',
'		not exists(',
'		Select ',
'			aa.TNo',
'		From ModulePrivilege aa, ModulePrivilegeLocation bb, BossUser cc',
'		Where aa.tno = bb.tno',
'			and aa.BossUserCode = cc.BossUserCode',
'			and cc.LoginName = :GLOBAL_LOGINNAME',
'			and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'			and aa.CompanyCode = :GLOBAL_COMPANYCODE',
'		)',
'		or',
'		exists(',
'		Select ',
'			aa.TNo',
'		From ModulePrivilege aa, ModulePrivilegeLocation bb, BossUser cc',
'		Where aa.tno = bb.tno',
'			and aa.BossUserCode = cc.BossUserCode',
'			and cc.LoginName = :GLOBAL_LOGINNAME',
'			and aa.ModuleCode = (Select ModuleCode from Module Where EntryPageNo = :APP_PAGE_ID)--GETMODULECODEFROMPAGE(:APP_PAGE_ID)',
'			and bb.LocationCode = a.LocationCode',
'			and aa.CompanyCode = :GLOBAL_COMPANYCODE',
'		)',
'	)',
'Order by a.LocationName',
'Fetch first row only'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Location'
,p_source=>'LOCATIONCODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_named_lov=>'LOCATION2'
,p_cSize=>30
,p_cMaxlength=>30
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13882105288619966)
,p_name=>'P381_MODIFIEDBY'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(13988552263097418)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Modified by'
,p_source=>'MODIFIEDBY'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13882209700619967)
,p_name=>'P381_MODIFIEDTIME'
,p_source_data_type=>'TIMESTAMP'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(13988552263097418)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Modified Time'
,p_source=>'MODIFIEDTIME'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50375309015162212)
,p_name=>'P381_NEXTFOLLOWUPDATE'
,p_source_data_type=>'DATE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(13988893577097421)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Next Follow-up Date'
,p_source=>'NEXTFOLLOWUPDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>32
,p_cMaxlength=>255
,p_tag_attributes=>'style="width: 400px;"'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'ITEM',
  'min_item', 'P381_CALLINGDATE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13881847957619963)
,p_name=>'P381_PARENTTNO'
,p_source_data_type=>'NUMBER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_source=>'PARENTTNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50372900704162211)
,p_name=>'P381_PARTYCODE'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(13988831053097420)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Party'
,p_source=>'PARTYCODE'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT',
'     P.PARTYNAME||'', ''||GETCITYNAME(P.OFFICECITYCODE)||'', ''||GETSTATENAME(P.OFFICESTATECODE) AS D,',
'     P.PARTYCODE AS R',
'FROM CCINVOICE CI',
'LEFT JOIN PARTY P ON P.PARTYCODE = CI.PARTYCODE'))
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13881679933619962)
,p_name=>'P381_PAYMENTFOLLOWUPDATE'
,p_source_data_type=>'DATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(13988671272097419)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Followup Date'
,p_source=>'PAYMENTFOLLOWUPDATE'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'ITEM',
  'max_item', 'P381_ALLOWEDFORWARD',
  'min_date', 'ITEM',
  'min_item', 'P381_ALLOWEDBACK',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(13881600475619961)
,p_name=>'P381_PAYMENTFOLLOWUPNO'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(13988671272097419)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Followup No'
,p_source=>'PAYMENTFOLLOWUPNO'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_tag_attributes=>'style="width: 400px;"'
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(50376466290162212)
,p_name=>'P381_REMARK'
,p_source_data_type=>'VARCHAR2'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(13988893577097421)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_prompt=>'Remark'
,p_source=>'REMARK'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>60
,p_cMaxlength=>4000
,p_cHeight=>2
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14057616844232659)
,p_name=>'P381_STATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_use_cache_before_default=>'NO'
,p_item_default=>'nvl(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P381_TNO), ''Status'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(50372502562162208)
,p_name=>'P381_TNO'
,p_source_data_type=>'NUMBER'
,p_is_primary_key=>true
,p_is_query_only=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_item_source_plug_id=>wwv_flow_imp.id(50372051520162207)
,p_source=>'TNO'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14055079450224784)
,p_name=>'Disable/Enable Delete Button'
,p_static_id=>'disable-enable-delete-button'
,p_event_sequence=>50
,p_condition_element=>'P381_TNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14056546034224785)
,p_event_id=>wwv_flow_imp.id(14055079450224784)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled but not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14048744156215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''DELETE'') = 0',
'OR',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14055949755224785)
,p_event_id=>wwv_flow_imp.id(14055079450224784)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14048744156215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''DELETE'') = 0',
'OR ',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14055547489224785)
,p_event_id=>wwv_flow_imp.id(14055079450224784)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14048744156215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''DELETE'') = 1',
'AND',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) NOT IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14053279094224193)
,p_name=>'Disable/Enable Edit Button'
,p_static_id=>'disable-enable-edit-button'
,p_event_sequence=>40
,p_condition_element=>'P381_TNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14054722460224194)
,p_event_id=>wwv_flow_imp.id(14053279094224193)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled but not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14049136089215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''UPDATE'') = 0',
'OR',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14054169705224193)
,p_event_id=>wwv_flow_imp.id(14053279094224193)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14049136089215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''UPDATE'') = 0',
'OR',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14053656381224193)
,p_event_id=>wwv_flow_imp.id(14053279094224193)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14049136089215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''UPDATE'') = 1',
'AND',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) NOT IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13990382200097436)
,p_name=>'Disable/Enable Print Button'
,p_static_id=>'disable-enable-print-button'
,p_event_sequence=>60
,p_condition_element=>'P381_TNO'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13990683561097439)
,p_event_id=>wwv_flow_imp.id(13990382200097436)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled but not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14050275078215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''PRINT'') = 0'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13990612587097438)
,p_event_id=>wwv_flow_imp.id(13990382200097436)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14050275078215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''PRINT'') = 0'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13990456294097437)
,p_event_id=>wwv_flow_imp.id(13990382200097436)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14050275078215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''PRINT'') = 1'
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14051503064223561)
,p_name=>'Disable/Enable Status Button'
,p_static_id=>'disable-enable-status-button'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14052855589223562)
,p_event_id=>wwv_flow_imp.id(14051503064223561)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_name=>'Disabled but not on Fire Initialization'
,p_static_id=>'disabled-but-not-on-fire-initialization'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14049876696215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''STATUS'') = 0',
'OR',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14052378167223562)
,p_event_id=>wwv_flow_imp.id(14051503064223561)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14049876696215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''STATUS'') = 0',
'OR',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14051864221223562)
,p_event_id=>wwv_flow_imp.id(14051503064223561)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(14049876696215411)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CHECK_USER_PRIVILEGE(:GLOBAL_BOSSUSERCODE,:GLOBAL_COMPANYCODE,:APP_PAGE_ID,''STATUS'') = 1',
'AND',
'GETDOCUMENTSTATUSCODE(GETMODULECODEFORPAGENO(:APP_PAGE_ID),:P381_TNO) NOT IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')'))
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(14058376203237669)
,p_name=>'Document Status'
,p_static_id=>'document-status'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(14049876696215411)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14060306339237671)
,p_event_id=>wwv_flow_imp.id(14058376203237669)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P381_STATUS''));')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14058826613237670)
,p_event_id=>wwv_flow_imp.id(14058376203237669)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14059300546237670)
,p_event_id=>wwv_flow_imp.id(14058376203237669)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P381_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14060802164237671)
,p_event_id=>wwv_flow_imp.id(14058376203237669)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_name=>'Reload Page'
,p_static_id=>'reload-page'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'location.reload()',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(14059756298237670)
,p_event_id=>wwv_flow_imp.id(14058376203237669)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_name=>'Set Document Status'
,p_static_id=>'set-document-status'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P381_TNO,P381_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P381_TNO,:P381_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(50059943362205996)
,p_name=>'Get the Invoice Balance'
,p_static_id=>'get-the-invoice-balance'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P381_INVOICETNO'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(50060083491205997)
,p_event_id=>wwv_flow_imp.id(50059943362205996)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P381_INVOICEBALANCE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P381_INVOICETNO',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'SELECT NVL(SUM(InvoiceAmount), 0)',
    'FROM Invoice',
    'WHERE TNo IN (',
    '    SELECT REGEXP_SUBSTR(:P381_INVOICETNO, ''[^:]+'', 1, LEVEL)',
    '    FROM DUAL',
    '    CONNECT BY REGEXP_SUBSTR(:P381_INVOICETNO, ''[^:]+'', 1, LEVEL) IS NOT NULL',
    ')',
    '')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13989023261097422)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Generate Document No'
,p_static_id=>'generate-document-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    V_MODULE_CODE VARCHAR2(30);',
'BEGIN',
'    V_MODULE_CODE := GETMODULECODEFORPAGENO(:APP_PAGE_ID);',
'',
'    IF :P381_PAYMENTFOLLOWUPNO IS NULL THEN',
'        ',
'        SETDOCNONEXT(',
'            pModuleCode        => V_MODULE_CODE,',
'            pCompanyCode       => :GLOBAL_COMPANYCODE,',
'            pFinancialYearCode => :GLOBAL_FINANCIALYEARCODE,',
'            pLocationCode      => :P381_LOCATIONCODE,',
'            pDocTypeCode       => :P381_DOCTYPECODE,',
'            pOtherCode         => NULL,',
'            pTransactionDate   => :P381_PAYMENTFOLLOWUPDATE',
'        );',
'',
'        :P381_PAYMENTFOLLOWUPNO := GETDOCNO(',
'            pModuleCode        => V_MODULE_CODE,',
'            pCompanyCode       => :GLOBAL_COMPANYCODE,',
'            pFinancialYearCode => :GLOBAL_FINANCIALYEARCODE,',
'            pLocationCode      => :P381_LOCATIONCODE,',
'            pDocTypeCode       => :P381_DOCTYPECODE,',
'            pOtherCode         => NULL,',
'            pTransactionDate   => :P381_PAYMENTFOLLOWUPDATE',
'        );',
'        ',
'    END IF;',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>5591473894959805
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(50383164792162216)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_region_id=>wwv_flow_imp.id(50372051520162207)
,p_process_type=>'NATIVE_FORM_INIT'
,p_process_name=>'Initialize form Payment Follow-up Action'
,p_static_id=>'initialize-form-payment-follow-up-action'
,p_internal_uid=>40457642475635650
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(50383588498162216)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(50372051520162207)
,p_process_type=>'NATIVE_FORM_DML'
,p_process_name=>'Process form Payment Follow-up Action'
,p_static_id=>'process-form-payment-follow-up-action'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_success_message=>'Data saved Successfully'
,p_internal_uid=>40458066181635650
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13991129648097443)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Revise'
,p_static_id=>'revise'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_allocated_tno NUMBER;',
'BEGIN',
'    REVISE_PAYMENTFOLLOWUPACTION(',
'        P_OLD_TNO => :P381_TNO,',
'        P_NEW_TNO => v_allocated_tno',
'    );',
'    ',
'    :P381_TNO := v_allocated_tno;',
'    :P381_FORMSTATUS := ''EDITRECORD''; ',
'    -- :P381_CALLINGSTATUS    := NULL;',
'    -- :P381_CALLINGDATE      := TRUNC(SYSDATE);',
'    -- :P381_NEXTFOLLOWUPDATE := NULL;',
'    -- :P381_COMMENTS         := NULL;',
'    -- :P381_REMARK           := NULL;',
'    -- :P381_COMMITEDAMOUNT   := 0;',
'    ',
'    APEX_APPLICATION.G_PRINT_SUCCESS_MESSAGE := ''Record Revised! New Follow-up Form Initialized.'';',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(13990806951097440)
,p_internal_uid=>5593580281959826
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13990141530097433)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Configutations'
,p_static_id=>'set-configutations'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Set Allowed Back/Forward Dates',
'    IF :P381_FORMSTATUS = ''NEWRECORD'' THEN ',
'',
'    select',
'    		trunc(sysdate) - nvl(b.AllowedBackDays, 0) as AllowedBack,',
'    		trunc(sysdate) + nvl(b.AllowedForwardDays, 0) AllowedForward	',
'            INTO :P381_ALLOWEDBACK,:P381_ALLOWEDFORWARD',
'    from Module a, ModulePrivilege b, BossUser c',
'    where a.ModuleCode = GetModuleCodeForpageNo(:APP_PAGE_ID)',
'    		and a.ModuleCode = b.ModuleCode',
'    		and b.BossUsercode = c.BossUserCode',
'    		and c.LoginName = :GLOBAL_LOGINNAME',
'    		and b.CompanyCode = :GLOBAL_CompanyCode',
'            ;',
'',
'    else',
'        :P381_ALLOWEDBACK       := :P381_PAYMENTFOLLOWUPDATE ; ',
'        :P381_ALLOWEDFORWARD    := :P381_PAYMENTFOLLOWUPDATE ;',
'     end if;',
'',
'--Set Status',
':P381_STATUS := NVL(GetDocumentStatusCode(getModuleCodeForPageNo(:APP_PAGE_ID), :P381_TNO), ''Status'');',
'',
'--Set Is Read Only',
'BEGIN',
'    SELECT COALESCE(MAX(1), 0)',
'      INTO :P381_IS_READONLY',
'      FROM DocumentStatusDetail ',
'     WHERE MODULETNO = :P381_TNO ',
'       AND DOCUMENTSTATUSCODE IN (''ACTIVE'', ''CANCELED'', ''CANCELLED'', ''CLOSED'')',
'       AND ROWNUM = 1;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>5592592163959816
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(13992339316097455)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Update and Delete'
,p_static_id=>'update-and-delete'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    v_parent_tno NUMBER;',
'BEGIN',
'    BEGIN',
'        SELECT PARENTTNO ',
'          INTO v_parent_tno ',
'          FROM PAYMENTFOLLOWUPACTION ',
'         WHERE TNO = :P381_TNO;',
'    EXCEPTION ',
'        WHEN NO_DATA_FOUND THEN ',
'            v_parent_tno := NULL;',
'    END;',
'',
'    IF v_parent_tno IS NOT NULL THEN',
'        UPDATE PAYMENTFOLLOWUPACTION ',
'           SET IS_REVISED = ''N'' ',
'         WHERE TNO = v_parent_tno;',
'    END IF;',
'    ',
'    DELETE FROM PAYMENTFOLLOWUPACTION ',
'     WHERE TNO = :P381_TNO;',
'',
'END;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(14048744156215411)
,p_internal_uid=>5594789949959838
);
wwv_flow_imp.component_end;
end;
/
