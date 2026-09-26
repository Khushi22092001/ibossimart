prompt --application/pages/page_00311
begin
--   Manifest
--     PAGE: 00311
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
 p_id=>311
,p_name=>'Challan List'
,p_alias=>'CHALLAN-LIST'
,p_step_title=>'Challan List'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(181866866320078240)
,p_plug_name=>'Challan List'
,p_static_id=>'challan-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ACCOUNTCODE,',
'       CHALLANAMOUNT,',
'       CHALLANDATE,',
'       CHALLANNO,',
'       COMPANYCODE,',
'       getdoctypename(DOCTYPECODE) doctype,',
'       FINANCIALYEARCODE,',
'       FROMDATE,',
'       getlocationname(LOCATIONCODE) location,',
'       MONEYTRANSFERMODECODE,',
'       MONEYTRANSFERREFERENCEDATE,',
'       MONEYTRANSFERREFERENCENO,',
'       PAYMENTDONE,',
'       REMARK,',
'       TNO,',
'       TODATE,',
'       DEPOSITEDINBANKCODE,',
'       DEPOSITORCODE,',
'       NARRATION,',
'       COVERINGLETTERNO,',
'       TAXSECTIONCODE,',
'       CREATOR,',
'       MODULECODE,',
'       MODULETNO,',
'       FILENAME,',
'       CREATIONTIME',
'  from CHALLAN'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Challan List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(181866963143078240)
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
,p_detail_link=>'f?p=&APP_ID.:312:&APP_SESSION.::&DEBUG.:RP:P312_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>21489434485653548
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181867641354078242)
,p_db_column_name=>'ACCOUNTCODE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Accountcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181868108009078243)
,p_db_column_name=>'CHALLANAMOUNT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Challanamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181868503866078243)
,p_db_column_name=>'CHALLANDATE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Challandate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181868850447078243)
,p_db_column_name=>'CHALLANNO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Challanno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181869327935078243)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181875323502078246)
,p_db_column_name=>'COVERINGLETTERNO'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Coveringletterno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181877728040078247)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181876090756078246)
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
 p_id=>wwv_flow_imp.id(181874075121078245)
,p_db_column_name=>'DEPOSITEDINBANKCODE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Depositedinbankcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181874455594078246)
,p_db_column_name=>'DEPOSITORCODE'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Depositorcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182350961940733400)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>36
,p_column_identifier=>'AA'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181877242529078247)
,p_db_column_name=>'FILENAME'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Filename'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181870073421078244)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181870506604078244)
,p_db_column_name=>'FROMDATE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Fromdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182351055184733401)
,p_db_column_name=>'LOCATION'
,p_display_order=>46
,p_column_identifier=>'AB'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181876476929078246)
,p_db_column_name=>'MODULECODE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181876847327078247)
,p_db_column_name=>'MODULETNO'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181871282509078244)
,p_db_column_name=>'MONEYTRANSFERMODECODE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Moneytransfermodecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181871688950078244)
,p_db_column_name=>'MONEYTRANSFERREFERENCEDATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Moneytransferreferencedate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181872116412078244)
,p_db_column_name=>'MONEYTRANSFERREFERENCENO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Moneytransferreferenceno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181874911893078246)
,p_db_column_name=>'NARRATION'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Narration'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181872493838078245)
,p_db_column_name=>'PAYMENTDONE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Paymentdone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181872839500078245)
,p_db_column_name=>'REMARK'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181875696955078246)
,p_db_column_name=>'TAXSECTIONCODE'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Taxsectioncode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181873265470078245)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'O'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(181873692113078245)
,p_db_column_name=>'TODATE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Todate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(181878671903084549)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'215012'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DOCTYPE:LOCATION:ACCOUNTCODE:CHALLANAMOUNT:CHALLANDATE:CHALLANNO:COMPANYCODE:FINANCIALYEARCODE:FROMDATE:MONEYTRANSFERMODECODE:MONEYTRANSFERREFERENCEDATE:MONEYTRANSFERREFERENCENO:PAYMENTDONE:REMARK:TODATE:DEPOSITEDINBANKCODE:DEPOSITORCODE:NARRATION:CO'
||'VERINGLETTERNO:TAXSECTIONCODE:CREATOR:MODULECODE:MODULETNO:FILENAME:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(181878204325078247)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(181866866320078240)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:312:&APP_SESSION.::&DEBUG.:312::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(181330223992368501)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(181866866320078240)
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
 p_id=>wwv_flow_imp.id(182350660472733397)
,p_name=>'P311_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(535888481198896310)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(182350783082733398)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(182350839769733399)
,p_event_id=>wwv_flow_imp.id(182350783082733398)
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
