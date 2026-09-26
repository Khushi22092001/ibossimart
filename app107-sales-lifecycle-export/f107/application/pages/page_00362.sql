prompt --application/pages/page_00362
begin
--   Manifest
--     PAGE: 00362
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
 p_id=>362
,p_name=>'Payment Followup'
,p_alias=>'PAYMENT-FOLLOWUP'
,p_step_title=>'Payment Followup'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54301984492565222)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:js-useLocalStorage:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(54302024914565223)
,p_plug_name=>'Report Region'
,p_static_id=>'report-region'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'     CCI.CCINVOICEDATE,',
'     CCI.CCINVOICENO,',
'     P.PARTYNAME,',
'     V.VOUCHERNO,',
'     V.VOUCHERDATE,',
'     E.EMPLOYEENAME AS SALESPERSON,',
'     SO.CREDITDAYS,',
'     SO.SALESORDERAMOUNT,',
'     CCI.CCINVOICEAMOUNT,',
'     SO.SALESORDERAMOUNT - CCI.CCINVOICEAMOUNT AS SO_CCI_AMOUNT,',
'     NVL(BR.AMOUNT,0) AS PAYMENT_RECEIVED,',
'     NVL(CCI.CCINVOICEAMOUNT,0) - NVL(BR.AMOUNT,0) AS BALANCE_AMOUNT,',
'     (CCI.CCINVOICEDATE + SO.CREDITDAYS) AS DUE_DATE,',
'     TRUNC(SYSDATE) - (CCI.CCINVOICEDATE + SO.CREDITDAYS) AS OVERDUEDAYS,',
'',
'     CASE ',
'        -- WHEN NVL(CCI.CCINVOICEAMOUNT,0) - NVL(BR.AMOUNT,0) <= 0 THEN ''Paid''',
'        WHEN (TRUNC(SYSDATE) - (CCI.CCINVOICEDATE + SO.CREDITDAYS)) <= 0 THEN ''Pending''',
'        WHEN (TRUNC(SYSDATE) - (CCI.CCINVOICEDATE + SO.CREDITDAYS)) < 5 THEN ''Due''',
'        WHEN (TRUNC(SYSDATE) - (CCI.CCINVOICEDATE + SO.CREDITDAYS)) <= 10 THEN ''Overdue''',
'        ELSE ''Seriously-Overdue''',
'     END AS PAYMENT_STATUS',
'',
'FROM CCINVOICE CCI',
'LEFT JOIN SALESORDER SO ON CCI.SALESORDERTNO = SO.TNO',
'LEFT JOIN VOUCHER V ON V.MODULETNO = (SELECT TNO FROM INVOICE WHERE MODULETNO = CCI.TNO)',
'LEFT JOIN PARTY P ON P.PARTYCODE = SO.PARTYCODE',
'LEFT JOIN EMPLOYEE E ON E.EMPLOYEECODE = SO.SALESEXECUTIVECODE',
'LEFT JOIN DFREIGHTBILLRECEIPTDETAIL BR ON BR.MODULETNO = (SELECT TNO FROM INVOICE WHERE MODULETNO = CCI.TNO)',
'',
'WHERE CCI.SALESORDERTNO IS NOT NULL',
'  AND V.VOUCHERNO IS NOT NULL',
'  AND NVL(CCI.CCINVOICEAMOUNT,0) - NVL(BR.AMOUNT,0) > 0  ',
'  AND CCI.CCINVOICEDATE BETWEEN :P362_FROMDATE AND :P362_TODATE',
'  AND ( :P362_PARTY IS NULL OR instr('':''||:P362_PARTY||'':'','':''||P.PARTYCODE||'':'') > 0 ) ',
'',
'ORDER BY CCI.CCINVOICEDATE DESC;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P362_PARTY,P362_TODATE,P362_FROMDATE'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#EEEEEE'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'bold'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#FFFFFF'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_prn_border_color=>'#666666'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(54302260861565225)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>27355044904869545
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504616572321287)
,p_db_column_name=>'BALANCE_AMOUNT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'BALANCE AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504332933321284)
,p_db_column_name=>'CCINVOICEAMOUNT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'CCINVOICE AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54302323848565226)
,p_db_column_name=>'CCINVOICEDATE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'CCINVOICE DATE'
,p_column_html_expression=>'<span style="display:block; width: 100px;">#CCINVOICEDATE#</span>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54302460572565227)
,p_db_column_name=>'CCINVOICENO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'CCINVOICE NO'
,p_column_html_expression=>'<span style="display:block; width: 100px;">#CCINVOICENO#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504201219321282)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'CREDIT DAYS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504803735321288)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'DUE DATE'
,p_column_html_expression=>'<span style="display:block; width: 100px;">#DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504887919321289)
,p_db_column_name=>'OVERDUEDAYS'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'OVERDUE DAYS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54302534348565228)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'PARTY NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504554219321286)
,p_db_column_name=>'PAYMENT_RECEIVED'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'PAYMENT RECEIVED'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(29090452761019849)
,p_db_column_name=>'PAYMENT_STATUS'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Payment Status'
,p_column_html_expression=>'<span class="iboss-tag iboss-tag-#PAYMENT_STATUS#">#PAYMENT_STATUS#</span>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504258377321283)
,p_db_column_name=>'SALESORDERAMOUNT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'SALES ORDER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504107660321281)
,p_db_column_name=>'SALESPERSON'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'SALES PERSON'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(57504453197321285)
,p_db_column_name=>'SO_CCI_AMOUNT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'SO CCI AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54302756783565230)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'VOUCHER DATE'
,p_column_html_expression=>'<span style="display:block; width: 100px;">#VOUCHERDATE#</span>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(54302706514565229)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'VOUCHER NO'
,p_column_html_expression=>'<span style="display:block; width: 100px;">#VOUCHERNO#</span>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(57514236401321502)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'305671'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CCINVOICEDATE:CCINVOICENO:PARTYNAME:VOUCHERNO:VOUCHERDATE:CREDITDAYS:DUE_DATE:OVERDUEDAYS:CCINVOICEAMOUNT:PAYMENT_STATUS:PAYMENT_RECEIVED:BALANCE_AMOUNT:SALESPERSON'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57504937186321290)
,p_name=>'P362_FROMDATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(54301984492565222)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(57505180152321292)
,p_name=>'P362_PARTY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(54301984492565222)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT P.PARTYNAME, P.PARTYCODE',
'',
'FROM CCINVOICE C',
'LEFT JOIN PARTY P ON P.PARTYCODE = C.PARTYCODE'))
,p_cSize=>100
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
 p_id=>wwv_flow_imp.id(57505062500321291)
,p_name=>'P362_TODATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(54301984492565222)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
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
 p_id=>wwv_flow_imp.id(57505308629321293)
,p_name=>'Refresh the Report Region'
,p_static_id=>'refresh-the-report-region'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P362_FROMDATE,P362_TODATE,P362_PARTY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(57505374472321294)
,p_event_id=>wwv_flow_imp.id(57505308629321293)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(54302024914565223)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
