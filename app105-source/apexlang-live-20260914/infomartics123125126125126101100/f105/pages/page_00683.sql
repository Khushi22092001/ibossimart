prompt --application/pages/page_00683
begin
--   Manifest
--     PAGE: 00683
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
 p_id=>683
,p_name=>'Salary Payment Advice List'
,p_alias=>'SALARY-PAYMENT-ADVICE-LIST1'
,p_step_title=>'Salary Payment Advice List'
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
 p_id=>wwv_flow_imp.id(472897079424336065)
,p_plug_name=>'Salary Payment Advice List'
,p_static_id=>'salary-payment-advice-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       FINANCIALYEARCODE,',
'       getlocationname(LOCATIONCODE) loationname,',
'       getdoctypename(DOCTYPECODE) doctypename,',
'       SALARYPAYMENTADVICENO,',
'       SALARYPAYMENTADVICEDATE,',
'       SALARYFROMDATE,',
'       SALARYTODATE,',
'       ACCOUNTCODEPAYABLE,',
'       EMPLOYEEBANKCODE,',
'       STAFFTYPECODE,',
'       AMOUNT,',
'       ACCOUNTCODE,',
'       NARRATION,',
'       MODULECODE,',
'       MODULETNO,',
'       REMARK,',
'       AMOUNTDR,',
'       AMOUNTCR,',
'       PAYMENTDONE,',
'       CREATOR,',
'       MONEYTRANSFERMODECODE,',
'       MONEYTRANSFERREFERENCENO,',
'       MONEYTRANSFERREFERENCEDATE,',
'       getemployeename(EMPLOYEECODE) employeename,',
'       SUMOFAMOUNT,',
'       VOUCHERPOSTINGDATE,',
'       CREATIONTIME,',
'       PAYMENTADVICELOCATIONCODE',
'  from SALARYPAYMENTADVICE'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Salary Payment Advice List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(472897263391336065)
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
,p_detail_link=>'f?p=&APP_ID.:684:&APP_SESSION.::&DEBUG.:RP:P684_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>41453884000340831
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472902766987336090)
,p_db_column_name=>'ACCOUNTCODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Account'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472901079947336090)
,p_db_column_name=>'ACCOUNTCODEPAYABLE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Account Code Payable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472902333711336090)
,p_db_column_name=>'AMOUNT'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472905142218336091)
,p_db_column_name=>'AMOUNTCR'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Amountcr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472904772694336091)
,p_db_column_name=>'AMOUNTDR'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Amountdr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472897961055336089)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472908713167336095)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472905975278336092)
,p_db_column_name=>'CREATOR'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(479672447548041138)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>50
,p_column_identifier=>'AF'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472901529725336090)
,p_db_column_name=>'EMPLOYEEBANKCODE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Employee Bank'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(479672540545041139)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>60
,p_column_identifier=>'AG'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472898330239336089)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(479672298474041137)
,p_db_column_name=>'LOATIONNAME'
,p_display_order=>40
,p_column_identifier=>'AE'
,p_column_label=>'Loation'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472903487849336091)
,p_db_column_name=>'MODULECODE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472903942727336091)
,p_db_column_name=>'MODULETNO'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472906363883336092)
,p_db_column_name=>'MONEYTRANSFERMODECODE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Money Transfer Mode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472907100565336092)
,p_db_column_name=>'MONEYTRANSFERREFERENCEDATE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Money Transfer Reference Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472906735821336092)
,p_db_column_name=>'MONEYTRANSFERREFERENCENO'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Money Transfer reference No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472903133080336091)
,p_db_column_name=>'NARRATION'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472909118882336095)
,p_db_column_name=>'PAYMENTADVICELOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Payment Advice Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472905486823336091)
,p_db_column_name=>'PAYMENTDONE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Payment done'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472904301725336091)
,p_db_column_name=>'REMARK'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472900354604336090)
,p_db_column_name=>'SALARYFROMDATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Salary From Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472899946647336089)
,p_db_column_name=>'SALARYPAYMENTADVICEDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Salary Payment Advice Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472899496341336089)
,p_db_column_name=>'SALARYPAYMENTADVICENO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Salary Payment Advice No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472900768992336090)
,p_db_column_name=>'SALARYTODATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Salary To Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472901906832336090)
,p_db_column_name=>'STAFFTYPECODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Staff Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472907934293336094)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Sum Of Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472897633194336081)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(472908368052336094)
,p_db_column_name=>'VOUCHERPOSTINGDATE'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Voucherpostingdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(473030764674372210)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'415874'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DOCTYPENAME:EMPLOYEENAME:LOATIONNAME:SALARYPAYMENTADVICENO:SALARYPAYMENTADVICEDATE:SALARYFROMDATE:SALARYTODATE:STAFFTYPECODE:AMOUNT:NARRATION:REMARK:PAYMENTDONE:CREATOR:MONEYTRANSFERMODECODE:MONEYTRANSFERREFERENCENO:MONEYTRANSFERREFERENCEDATE:SUMOFAM'
||'OUNT:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(472909611848336095)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(472897079424336065)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:684:&APP_SESSION.::&DEBUG.:684::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(471169094675143983)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(472897079424336065)
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
 p_id=>wwv_flow_imp.id(473038042826459670)
,p_name=>'P683_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(535888481198896310)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(471169180602143984)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(473034557616459635)
,p_event_id=>wwv_flow_imp.id(471169180602143984)
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
 p_id=>wwv_flow_imp.id(473034655607459636)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(473034752808459637)
,p_event_id=>wwv_flow_imp.id(473034655607459636)
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
