prompt --application/pages/page_00638
begin
--   Manifest
--     PAGE: 00638
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
 p_id=>638
,p_name=>'LOANSANCTION'
,p_alias=>'LOANSANCTION'
,p_step_title=>'LOANSANCTION'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 0.90rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(452410110523140483)
,p_plug_name=>'LOANSANCTION'
,p_static_id=>'loansanction'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select A.TNO,',
'         A.COMPANYCODE,',
'         A.FINANCIALYEARCODE,',
'         A.LOCATIONCODE,',
'         A.DOCTYPECODE,',
'         A.LOANSANCTIONNO,',
'         A.LOANSANCTIONDATE,',
'         A.LOANREQUESTTNO,',
'         A.LOANREQUESTNO,',
'         A.LOANTYPECODE,',
'         L.LOANTYPENAME,',
'         A.LOANAMOUNT,',
'         A.MERGEDAMOUNT,',
'         A.TOTALAMOUNT,',
'         A.INSTALLMENTAMOUNT,',
'         A.NOOFINSTALLMENT,',
'         A.DEDUCTIONSTARTDATE,',
'         A.REMARK,',
'         A.PAYMENTDONE,',
'         A.CREDITACCOUNTCODE,',
'         A.MONEYTRANSFERMODECODE,',
'         A.MONEYTRANSFERREFERENCENO,',
'         A.MONEYTRANSFERREFERENCEDATE,',
'         A.CREATOR,',
'         A.DEDUCTEDAMOUNT,',
'         A.MODULETNO,',
'         A.MODULECODE,',
'         A.MODULESNO,',
'         R.EMPLOYEECODE,',
'         GETEMPLOYEENAME(R.EMPLOYEECODE) Employee,',
'         GETLOCATIONNAME(A.LOCATIONCODE) Location,',
'         A.CREATIONTIME',
'    From LOANSANCTION A, LOANTYPE L, LOANREQUEST R',
'   Where A.LOANTYPECODE = L.LOANTYPECODE',
'     And A.LOANREQUESTTNO = R.TNO(+)',
'   Order By 2, 1',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P638_TNO'
,p_prn_page_header=>'LOANSANCTION'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(452410277456140483)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:639:&SESSION.::&DEBUG.:639:P639_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>20966898065145249
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452411006629140505)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452421398963140510)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>209
,p_column_identifier=>'AB'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452419413323140508)
,p_db_column_name=>'CREATOR'
,p_display_order=>159
,p_column_identifier=>'W'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452417871104140507)
,p_db_column_name=>'CREDITACCOUNTCODE'
,p_display_order=>119
,p_column_identifier=>'S'
,p_column_label=>'Creditaccountcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452419824887140508)
,p_db_column_name=>'DEDUCTEDAMOUNT'
,p_display_order=>169
,p_column_identifier=>'X'
,p_column_label=>'Deductedamount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452416631217140507)
,p_db_column_name=>'DEDUCTIONSTARTDATE'
,p_display_order=>89
,p_column_identifier=>'P'
,p_column_label=>'Deduction Start Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452412269433140505)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(207190380011015927)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>229
,p_column_identifier=>'AF'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(207190250023015926)
,p_db_column_name=>'EMPLOYEECODE'
,p_display_order=>219
,p_column_identifier=>'AE'
,p_column_label=>'Employeecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452411404433140505)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452415860016140507)
,p_db_column_name=>'INSTALLMENTAMOUNT'
,p_display_order=>69
,p_column_identifier=>'N'
,p_column_label=>'Instalment Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452414610315140506)
,p_db_column_name=>'LOANAMOUNT'
,p_display_order=>39
,p_column_identifier=>'K'
,p_column_label=>'Loan Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452413829059140506)
,p_db_column_name=>'LOANREQUESTNO'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Loanrequestno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452413423289140506)
,p_db_column_name=>'LOANREQUESTTNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Loanrequesttno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452413077972140505)
,p_db_column_name=>'LOANSANCTIONDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Loan Sanction Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452412580138140505)
,p_db_column_name=>'LOANSANCTIONNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Loan Sanction No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452414184654140506)
,p_db_column_name=>'LOANTYPECODE'
,p_display_order=>29
,p_column_identifier=>'J'
,p_column_label=>'Loan type code'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(453078428629427660)
,p_db_column_name=>'LOANTYPENAME'
,p_display_order=>19
,p_column_identifier=>'AC'
,p_column_label=>'Loan Type Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(207190420728015928)
,p_db_column_name=>'LOCATION'
,p_display_order=>239
,p_column_identifier=>'AG'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452411868229140505)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452415046487140506)
,p_db_column_name=>'MERGEDAMOUNT'
,p_display_order=>49
,p_column_identifier=>'L'
,p_column_label=>'Merged Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452420611121140509)
,p_db_column_name=>'MODULECODE'
,p_display_order=>189
,p_column_identifier=>'Z'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452421009256140509)
,p_db_column_name=>'MODULESNO'
,p_display_order=>199
,p_column_identifier=>'AA'
,p_column_label=>'Modulesno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452420276826140508)
,p_db_column_name=>'MODULETNO'
,p_display_order=>179
,p_column_identifier=>'Y'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452418204790140508)
,p_db_column_name=>'MONEYTRANSFERMODECODE'
,p_display_order=>129
,p_column_identifier=>'T'
,p_column_label=>'Moneytransfermodecode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452419025362140508)
,p_db_column_name=>'MONEYTRANSFERREFERENCEDATE'
,p_display_order=>149
,p_column_identifier=>'V'
,p_column_label=>'Moneytransferreferencedate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452418635327140508)
,p_db_column_name=>'MONEYTRANSFERREFERENCENO'
,p_display_order=>139
,p_column_identifier=>'U'
,p_column_label=>'Moneytransferreferenceno'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452416241561140507)
,p_db_column_name=>'NOOFINSTALLMENT'
,p_display_order=>79
,p_column_identifier=>'O'
,p_column_label=>'No of Instalment'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452417475957140507)
,p_db_column_name=>'PAYMENTDONE'
,p_display_order=>109
,p_column_identifier=>'R'
,p_column_label=>'Paymentdone'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452416994604140507)
,p_db_column_name=>'REMARK'
,p_display_order=>99
,p_column_identifier=>'Q'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452410632212140503)
,p_db_column_name=>'TNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(452415466819140506)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>59
,p_column_identifier=>'M'
,p_column_label=>'Total Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(452431312493286554)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'209880'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOCATION:LOANSANCTIONNO:LOANSANCTIONDATE:EMPLOYEE:LOANTYPENAME:LOANAMOUNT:MERGEDAMOUNT:TOTALAMOUNT:INSTALLMENTAMOUNT:NOOFINSTALLMENT:DEDUCTIONSTARTDATE:REMARK'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(469122574711012751)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(452410110523140483)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:639:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453494161763129807)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(452410110523140483)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(452281194398086171)
,p_name=>'P638_TNO'
,p_item_sequence=>30
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(469122089289012747)
,p_name=>'Hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(469122215657012748)
,p_event_id=>wwv_flow_imp.id(469122089289012747)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(469122378366012749)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(469122385366012750)
,p_event_id=>wwv_flow_imp.id(469122378366012749)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
