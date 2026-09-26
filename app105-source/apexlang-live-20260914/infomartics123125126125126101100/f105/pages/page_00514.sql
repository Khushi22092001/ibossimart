prompt --application/pages/page_00514
begin
--   Manifest
--     PAGE: 00514
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
 p_id=>514
,p_name=>'Supplier Detail'
,p_alias=>'SUPPLIER-DETAIL'
,p_step_title=>'Supplier Detail'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.background1{background-color: gainsboro;}',
'#MYID .t-Form-label {font-weight: bold;}',
'#MYID .apex-item-display-only {font-weight: normal;}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'17'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(447416166215825921)
,p_plug_name=>'Supplier Details'
,p_static_id=>'supplier-details'
,p_region_name=>'MYID'
,p_region_css_classes=>'background1'
,p_region_template_options=>'#DEFAULT#:t-Region--accent14:t-Region--stacked:t-Region--hiddenOverflow:t-Form--standardPadding:t-Form--stretchInputs:t-Form--leftLabels'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441914360544681274)
,p_name=>'P514_CONTACTNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Contact No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441913943782681274)
,p_name=>'P514_CONTACTPERSON'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Contact Person'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441911104301681273)
,p_name=>'P514_GSTNO'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'GST No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441914735344681274)
,p_name=>'P514_OFFICEADDRESS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Office Address'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441915572596681275)
,p_name=>'P514_OFFICECITY'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Office City'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441918734819681276)
,p_name=>'P514_OFFICEEMAIL'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Office Email'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441917571693681276)
,p_name=>'P514_OFFICEPHONENO'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Office Phone No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441917081190681275)
,p_name=>'P514_OFFICEPINCODE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Office Pin Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441915943701681275)
,p_name=>'P514_OFFICESTATE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Office State'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441919487302681276)
,p_name=>'P514_OWNERNAME'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441911945725681273)
,p_name=>'P514_PANNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Pan No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441913569493681274)
,p_name=>'P514_PARENTGROUP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Parent Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441910775294681273)
,p_name=>'P514_PARTYCODE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Party Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441911575680681273)
,p_name=>'P514_PARTYNAME'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441913079613681274)
,p_name=>'P514_PARTYSHORTNAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Short Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441912277489681273)
,p_name=>'P514_PARTYTYPECODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441912742754681274)
,p_name=>'P514_PRINTNAME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441815892078251326)
,p_name=>'P514_SUPPLIERCODE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441910356013681273)
,p_name=>'P514_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441915148443681275)
,p_name=>'P514_WORKSADDRESS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Works Address'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441916375967681275)
,p_name=>'P514_WORKSCITY'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Works City'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441919149732681276)
,p_name=>'P514_WORKSEMAIL'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Works Email'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441918292713681276)
,p_name=>'P514_WORKSPHONENO'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Works Phone No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441917884094681276)
,p_name=>'P514_WORKSPINCODE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Works  Pin Code'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441916742112681275)
,p_name=>'P514_WORKSSTATE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(447416166215825921)
,p_prompt=>'Works State'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DISPLAY_ONLY'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'based_on', 'VALUE',
  'format', 'PLAIN',
  'send_on_page_submit', 'Y',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(433805321041940659)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Supplier Detail'
,p_static_id=>'fetch-supplier-detail'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.TNo,',
'      a.PartyCode,',
'      a.PartyName,',
'      a.PartyTypeCode,',
'      a.PrintName,',
'      a.PartyShortName,',
'      GetPartyName(a.ParentCode) as ParentGroup,',
'      a.OfficeAddress1||''''||a.OfficeAddress2 as OfficeAddress,',
'      GetCityName(a.OfficeCityCode) as OfficeCity,',
'      GetStateName(a.OfficeStateCode) as OfficeState,',
'      a.OfficePinCode,',
'      a.OfficePhoneNo,',
'      a.OfficeEmail,',
'      a.WorksAddress1||''''||a.WorksAddress2 as WorksAddress,',
'      GetCityName(a.WorksCityCode) as WorksCity,',
'      GetStateName(a.WorksStateCode) as WorksState,',
'      a.WorksPinCode,',
'      a.WorksPhoneNo,',
'      a.WorksEmail,',
'      GetPartyAttributeValue(a.PartyCode,''GSTINNO'') as GSTNO,',
'      GetPartyAttributeValue(a.PartyCode,''PANNO'') as PANNO,',
'      a.ContactPerson,',
'      a.ContactNo,',
'      a.OwnerName',
'      into',
'      :P514_TNO,',
'      :P514_PARTYCODE,',
'      :P514_PARTYNAME,',
'      :P514_PARTYTYPECODE,',
'      :P514_PRINTNAME,',
'      :P514_PARTYSHORTNAME,',
'      :P514_PARENTGROUP,',
'      :P514_OFFICEADDRESS,',
'      :P514_OFFICECITY,',
'      :P514_OFFICESTATE,',
'      :P514_OFFICEPINCODE,',
'      :P514_OFFICEPHONENO,',
'      :P514_OFFICEEMAIL,',
'      :P514_WORKSADDRESS,',
'      :P514_WORKSCITY,',
'      :P514_WORKSSTATE,',
'      :P514_WORKSPINCODE,',
'      :P514_WORKSPHONENO,',
'      :P514_WORKSEMAIL,',
'      :P514_GSTNO,',
'      :P514_PANNO,',
'      :P514_CONTACTPERSON,',
'      :P514_CONTACTNO,',
'      :P514_OWNERNAME',
'From  Party a',
'Where a.PartyCode = :P514_SUPPLIERCODE;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>2361941650945425
);
wwv_flow_imp.component_end;
end;
/
