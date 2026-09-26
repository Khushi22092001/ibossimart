prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
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
 p_id=>9999
,p_name=>'Login Page'
,p_alias=>'LOGIN'
,p_step_title=>'InfoMartics - Log In'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'OFF'
,p_javascript_file_urls=>'#APP_FILES#hspl-login.js?cb=20260909b'
,p_css_file_urls=>'#APP_FILES#hspl-login.css?cb=20260909b'
,p_step_template=>2101157952850466385
,p_page_template_options=>'#DEFAULT#'
,p_overwrite_navigation_list=>'Y'
,p_page_is_public_y_n=>'Y'
,p_protection_level=>'C'
,p_page_component_map=>'12'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(566519155140257088)
,p_plug_name=>' Iron Mart Private Limited'
,p_static_id=>'iron-mart-private-limited'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding'
,p_plug_template=>2674157997338192145
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(566521244601257108)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(566519155140257088)
,p_button_name=>'LOGIN'
,p_static_id=>'login'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Sign In'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(535888451971896309)
,p_name=>'P9999_COMPANY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(566519155140257088)
,p_prompt=>'Company'
,p_placeholder=>'Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COMPANYNAME,COMPANYCODE FROM COMPANY a',
'Where Exists (Select BB.TNo',
'          From BossUser bb, BossUserRole cc',
'         Where cc.CompanyCode = a.CompanyCode',
'           And bb.LoginName = :Global_LoginName',
'           And bb.tno = cc.tno)',
' Order By A.CompanyName'))
,p_lov_cascade_parent_items=>'P9999_USERNAME'
,p_ajax_items_to_submit=>'P9999_USERNAME'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-home'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(535888343116896308)
,p_name=>'P9999_FINANCIALYEAR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(566519155140257088)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select financialyearcode from financialyear a',
'where trunc(sysdate) between a.financialyearbegin and a.financialyearend',
'; '))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Financial Year'
,p_placeholder=>'Financial Year'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT  TO_CHAR(FINANCIALYEARBEGIN,''DD-MON-RRRR'')||'' TO ''||TO_CHAR(FINANCIALYEAREND,''DD-MON-RRRR'') , FINANCIALYEARCODE',
'FROM FINANCIALYEAR ORDER BY FINANCIALYEARBEGIN DESC'))
,p_cSize=>30
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-calendar'
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(566519980878257102)
,p_name=>'P9999_PASSWORD'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(566519155140257088)
,p_prompt=>'Password'
,p_placeholder=>'Password'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_PASSWORD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="current-password"'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-key'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'submit_when_enter_pressed', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(566520807038257103)
,p_name=>'P9999_PERSISTENT_AUTH'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(566519155140257088)
,p_prompt=>'Remember me'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'apex_authentication.persistent_auth_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(566520445882257103)
,p_name=>'P9999_REMEMBER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(566519155140257088)
,p_prompt=>'Remember username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_display_when=>'apex_authentication.persistent_cookies_enabled and not apex_authentication.persistent_auth_enabled'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>2040785906935475274
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(566519603170257097)
,p_name=>'P9999_USERNAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(566519155140257088)
,p_prompt=>'Username'
,p_placeholder=>'Username'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>40
,p_cMaxlength=>100
,p_tag_attributes=>'autocomplete="username"'
,p_field_template=>2040785906935475274
,p_item_icon_css_classes=>'fa-user'
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(494096935065090470)
,p_name=>'Set Global login'
,p_static_id=>'set-global-login'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P9999_USERNAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(494097069306090471)
,p_event_id=>wwv_flow_imp.id(494096935065090470)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P9999_USERNAME',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'begin',
    '    for vloop in (',
    '        SELECT BOSSUSERCODE,LOGINNAME ',
    '        FROM BOSSUSER A WHERE UPPER(BOSSUSERNAME)=UPPER(:P9999_USERNAME)',
    '    ) loop',
    '        :GLOBAL_BOSSUSERCODE := vloop.bossusercode;',
    '        :GLOBAL_LOGINNAME    := vloop.LOGINNAME ;',
    '    end loop;',
    '',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33752465871252302)
,p_event_id=>wwv_flow_imp.id(494096935065090470)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9999_COMPANY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'GLOBAL_BOSSUSERCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select A.COMPANYCODE',
    'From BOSSUSERROLE A',
    'Where A.BOSSUSERROLECODE=:GLOBAL_BOSSUSERCODE',
    'And Nvl(A.ISDEFAULT,''NO'') =''YES''')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(33752528972252303)
,p_event_id=>wwv_flow_imp.id(494096935065090470)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P9999_FINANCIALYEAR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'select financialyearcode from financialyear a',
    'where trunc(sysdate) between a.financialyearbegin and a.financialyearend',
    '; ')),
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(566525246299257126)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'Clear Page(s) Cache'
,p_static_id=>'clear-page-s-cache'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'type', 'CLEAR_CACHE_CURRENT_PAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>133680390857033352
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(566524847507257126)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Get Username Cookie'
,p_static_id=>'get-username-cookie'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P9999_USERNAME := apex_authentication.get_login_username_cookie;',
':P9999_REMEMBER := case when :P9999_USERNAME is not null then ''Y'' end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>133679992065033352
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(566521374737257113)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Login'
,p_static_id=>'login'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_authentication.login(',
'    p_username => :P9999_USERNAME,',
'    p_password => :P9999_PASSWORD,',
'    p_set_persistent_auth => nvl(:P9999_PERSISTENT_AUTH, ''N'') = ''Y'' );',
' ',
'SELECT COMPANYCODE,COMPANYNAME,UPPER(:P9999_USERNAME), :P9999_FINANCIALYEAR INTO :GLOBAL_COMPANYCODE,:GLOBAL_COMPANYNAME,:GLOBAL_BOSSUSERNAME,:GLOBAL_FINANCIALYEARCODE',
'FROM COMPANY A WHERE A.COMPANYCODE = :P9999_COMPANY;',
'',
'SELECT BOSSUSERCODE,LOGINNAME INTO :GLOBAL_BOSSUSERCODE,:GLOBAL_LOGINNAME FROM BOSSUSER A WHERE UPPER(BOSSUSERNAME)=UPPER(:P9999_USERNAME);',
'',
'/*SELECT TO_CHAR(FINANCIALYEARBEGIN,''DD-MM-RRRR''),TO_CHAR(FINANCIALYEAREND,''DD-MM-RRRR'')',
'INTO :GLOBAL_FINANCIALYEARBEGIN,:GLOBAL_FINANCIALYEAREND',
'FROM FINANCIALYEAR WHERE UPPER(FINANCIALYEARCODE) = UPPER(:P9999_FINANCIALYEAR) ;',
'*/',
'',
'SELECT FINANCIALYEARBEGIN,FINANCIALYEAREND, SYSDATE',
'INTO :GLOBAL_FINANCIALYEARBEGIN,:GLOBAL_FINANCIALYEAREND, :GLOBAL_SYSDATE',
'FROM FINANCIALYEAR WHERE UPPER(FINANCIALYEARCODE) = UPPER(:P9999_FINANCIALYEAR) ;',
'',
':GLOBAL_TITLE := :GLOBAL_COMPANYNAME||'' [ ''||:GLOBAL_BOSSUSERNAME||'' ] ''||'' [ ''||:GLOBAL_FINANCIALYEARCODE||'' ]'' ;',
''))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>133676519295033339
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(535888234425896307)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set global variables'
,p_static_id=>'set-global-variables'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT COMPANYCODE,COMPANYNAME,UPPER(:P9999_USERNAME), :P9999_FINANCIALYEAR ',
'INTO :GLOBAL_COMPANYCODE,:GLOBAL_COMPANYNAME,:GLOBAL_BOSSUSERNAME,:GLOBAL_FINANCIALYEARCODE',
'FROM COMPANY A WHERE A.COMPANYCODE = :P9999_COMPANY;',
'',
'SELECT BOSSUSERCODE,LOGINNAME INTO :GLOBAL_BOSSUSERCODE,:GLOBAL_LOGINNAME FROM BOSSUSER A WHERE UPPER(BOSSUSERNAME)=UPPER(:P9999_USERNAME);',
'',
'/*SELECT TO_CHAR(FINANCIALYEARBEGIN,''DD-MM-RRRR''),TO_CHAR(FINANCIALYEAREND,''DD-MM-RRRR'')',
'INTO :GLOBAL_FINANCIALYEARBEGIN,:GLOBAL_FINANCIALYEAREND',
'FROM FINANCIALYEAR WHERE UPPER(FINANCIALYEARCODE) = UPPER(:P9999_FINANCIALYEAR) ;',
'*/',
'',
'SELECT FINANCIALYEARBEGIN,FINANCIALYEAREND, SYSDATE',
'INTO :GLOBAL_FINANCIALYEARBEGIN,:GLOBAL_FINANCIALYEAREND, :GLOBAL_SYSDATE',
'FROM FINANCIALYEAR WHERE UPPER(FINANCIALYEARCODE) = UPPER(:P9999_FINANCIALYEAR) ;',
'',
':GLOBAL_TITLE := :GLOBAL_COMPANYNAME||'' [ ''||:GLOBAL_BOSSUSERNAME||'' ] ''||'' [ ''||:GLOBAL_FINANCIALYEARCODE||'' ]'' ;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>103043378983672533
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(566523314826257126)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_INVOKE_API'
,p_process_name=>'Set Username Cookie'
,p_static_id=>'set-username-cookie'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'package', 'APEX_AUTHENTICATION',
  'package_method', 'SEND_LOGIN_USERNAME_COOKIE',
  'type', 'PLSQL_PACKAGE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>133678459384033352
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(566524272583257126)
,p_page_process_id=>wwv_flow_imp.id(566523314826257126)
,p_page_id=>9999
,p_name=>'p_consent'
,p_direction=>'IN'
,p_data_type=>'BOOLEAN'
,p_has_default=>false
,p_display_sequence=>2
,p_value_type=>'ITEM'
,p_value=>'P9999_REMEMBER'
);
wwv_flow_imp_shared.create_invokeapi_comp_param(
 p_id=>wwv_flow_imp.id(566523793625257126)
,p_page_process_id=>wwv_flow_imp.id(566523314826257126)
,p_page_id=>9999
,p_name=>'p_username'
,p_direction=>'IN'
,p_data_type=>'VARCHAR2'
,p_has_default=>false
,p_display_sequence=>1
,p_value_type=>'EXPRESSION'
,p_value_language=>'PLSQL'
,p_value=>'upper( :P9999_USERNAME )'
);
wwv_flow_imp.component_end;
end;
/
