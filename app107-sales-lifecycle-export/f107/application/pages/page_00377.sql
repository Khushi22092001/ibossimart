prompt --application/pages/page_00377
begin
--   Manifest
--     PAGE: 00377
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>377
,p_name=>'Payment Follow-up Action'
,p_alias=>'PAYMENT-FOLLOW-UP-ACTION1'
,p_step_title=>'Payment Follow-up Action'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.a-IRR-headerLink{',
'    text-transform: uppercase;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(31014055301266570)
,p_plug_name=>'Filters'
,p_static_id=>'filters'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(67406223922331331)
,p_plug_name=>'Payment Follow-up Action'
,p_static_id=>'payment-follow-up-action'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'    a.TNO,',
'    GetLocationName(a.LOCATIONCODE) AS Location_Name, a.DOCTYPECODE, a.PAYMENTFOLLOWUPNO, a.PAYMENTFOLLOWUPDATE,',
'    a.PARTYCODE,',
'    p.PartyName,',
'    a.INVOICETNO,',
'    (SELECT LISTAGG(i.INVOICENO, '' : '' ON OVERFLOW TRUNCATE ''...'') WITHIN GROUP (ORDER BY i.INVOICENO)',
'     FROM Invoice i',
'     WHERE INSTR('':'' || a.INVOICETNO || '':'', '':'' || i.TNO || '':'') > 0) AS INVOICENO_LIST,',
'    a.INVOICEBALANCE,',
'    a.CALLINGPERSON,',
'    e.EmployeeName AS CallingPersonName,',
'    a.CALLINGDATE,',
'    a.CALLINGSTATUS,',
'    -- DECODE(a.CALLINGSTATUS, ''A'', ''ANSWERED'', ''NA'', ''NOT-ANSWERED'', a.CALLINGSTATUS) AS CALLINGSTATUS, ',
'    a.NEXTFOLLOWUPDATE,',
'    a.COMMENTS,',
'    a.COMMITEDAMOUNT,',
'    a.REMARK,',
'    a.IS_REVISED',
'FROM PAYMENTFOLLOWUPACTION a',
'LEFT JOIN party p       ON p.partycode = a.PARTYCODE  ',
'LEFT JOIN Employee e    ON e.employeecode = a.CALLINGPERSON',
'WHERE a.PAYMENTFOLLOWUPDATE BETWEEN :P377_FROMDATE AND :P377_TODATE',
'  AND (:P377_LOCATION IS NULL OR REGEXP_LIKE(:P377_LOCATION, ''((^|:)'' || a.LocationCode || ''(:|$))''))',
'  AND (:P377_PARTY IS NULL OR REGEXP_LIKE(:P377_PARTY, ''((^|:)'' || a.PartyCode || ''(:|$))''))',
' ',
'ORDER BY A.TNO DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P377_LOCATION,P377_FROMDATE,P377_TODATE,P377_PARTY'
,p_prn_page_header=>'Payment Follow-up Action'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(67406349173331331)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:381:&SESSION.::&DEBUG.:RP,381:P381_TNO,P381_FORMSTATUS:\#TNO#\,EDITRECORD'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>40459133216635651
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67409107468331335)
,p_db_column_name=>'CALLINGDATE'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'CALLING DATE'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67408640757331334)
,p_db_column_name=>'CALLINGPERSON'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'CALLING PERSON'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(67378375556301154)
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67082091982375114)
,p_db_column_name=>'CALLINGPERSONNAME'
,p_display_order=>160
,p_column_identifier=>'N'
,p_column_label=>'CALLING PERSON NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67409434735331335)
,p_db_column_name=>'CALLINGSTATUS'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'CALLING STATUS'
,p_column_html_expression=>'<span class="iboss-tag iboss-tag-#CALLINGSTATUS#">#CALLINGSTATUS#</span>'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(29158475263798166)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67410255237331335)
,p_db_column_name=>'COMMENTS'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'COMMENTS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67410638267331335)
,p_db_column_name=>'COMMITEDAMOUNT'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'COMMITED AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31013466340266564)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>20
,p_column_identifier=>'Q'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67408223636331334)
,p_db_column_name=>'INVOICEBALANCE'
,p_display_order=>60
,p_column_identifier=>'D'
,p_column_label=>'INVOICE BALANCE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67082155671375115)
,p_db_column_name=>'INVOICENO_LIST'
,p_display_order=>170
,p_column_identifier=>'O'
,p_column_label=>'INVOICES'
,p_column_html_expression=>'<div style="display:block; width:110px">#INVOICENO_LIST#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67081839424375112)
,p_db_column_name=>'INVOICETNO'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'INVOICETNO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31013803638266567)
,p_db_column_name=>'IS_REVISED'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'Is Revised'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31013873466266568)
,p_db_column_name=>'LOCATION_NAME'
,p_display_order=>10
,p_column_identifier=>'U'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67409889451331335)
,p_db_column_name=>'NEXTFOLLOWUPDATE'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'NEXT FOLLOWUP DATE'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67407487409331334)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>50
,p_column_identifier=>'B'
,p_column_label=>'PARTY CODE'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_rpt_named_lov=>wwv_flow_imp.id(67379058107301160)
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67081956257375113)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>150
,p_column_identifier=>'M'
,p_column_label=>'PARTY NAME'
,p_column_html_expression=>'<div style="display:block; width:220px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31013703501266566)
,p_db_column_name=>'PAYMENTFOLLOWUPDATE'
,p_display_order=>40
,p_column_identifier=>'S'
,p_column_label=>'Payment Followup Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(31013585211266565)
,p_db_column_name=>'PAYMENTFOLLOWUPNO'
,p_display_order=>30
,p_column_identifier=>'R'
,p_column_label=>'Payment Followup No'
,p_column_html_expression=>'<div style="display:block; width:220px">#PAYMENTFOLLOWUPNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67411110112331335)
,p_db_column_name=>'REMARK'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'REMARK'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(67407114572331334)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(67412868069331949)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'404657'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOCATION_NAME:DOCTYPECODE:PAYMENTFOLLOWUPDATE:PAYMENTFOLLOWUPNO:PARTYNAME:INVOICENO_LIST:INVOICEBALANCE:COMMITEDAMOUNT:CALLINGPERSONNAME:CALLINGDATE:CALLINGSTATUS:NEXTFOLLOWUPDATE:COMMENTS:REMARK'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(67411568710331335)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(67406223922331331)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:381:&SESSION.::&DEBUG.:381:P381_FORMSTATUS:NEWRECORD'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(31014235790266571)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(31014055301266570)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31171777132393209)
,p_name=>'P377_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(31014055301266570)
,p_item_default=>'TRUNC(SYSDATE) -7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'-- Select From Date --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31171503275391989)
,p_name=>'P377_LOCATION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(31014055301266570)
,p_prompt=>'Location'
,p_placeholder=>'-- Select Location --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''PINVOICE''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31172453770395603)
,p_name=>'P377_PARTY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(31014055301266570)
,p_prompt=>'Party'
,p_placeholder=>'-- Select Customer Name  --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From pinvoice a, Party p',
'Where a.PartyCode = p.PartyCode',
'Order by 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(31172103217394358)
,p_name=>'P377_TODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(31014055301266570)
,p_item_default=>'TRUNC(SYSDATE)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'-- Select To Date --'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(67411836215331335)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(67406223922331331)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(67412383100331336)
,p_event_id=>wwv_flow_imp.id(67411836215331335)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(67406223922331331)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(67081438440375108)
,p_name=>'Hide Navigation Menu'
,p_static_id=>'hide-navigation-menu'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(67081570732375109)
,p_event_id=>wwv_flow_imp.id(67081438440375108)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
