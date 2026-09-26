prompt --application/pages/page_00314
begin
--   Manifest
--     PAGE: 00314
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>314
,p_name=>'Payment Advice Report'
,p_alias=>'PAYMENT-ADVICE-ONLY-REPORT'
,p_step_title=>'Payment Advice  Report'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(547585271404462695)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(194017613650070977)
,p_plug_name=>'Payment Advice Report'
,p_static_id=>'payment-advice-report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select * from PAYMENTADVICE_VW a',
'where ( :P314_COMPANY IS NULL OR instr('':''||:P314_COMPANY||'':'','':''||a.Companyname||'':'') > 0)',
'  and ( :P314_LOCATION IS NULL OR instr('':''||:P314_LOCATION||'':'','':''||a.Locationname||'':'') > 0)',
'  and ( :P314_DOCTYPE IS NULL OR instr('':''||:P314_DOCTYPE||'':'','':''||a.DocTypename||'':'') > 0)',
'  and ( :P314_STATUSS IS NULL OR instr('':''||:P314_STATUSS||'':'','':''||a.Status||'':'') > 0)',
'  and a.PaymentAdviceDate between :P314_FROMDATE and :P314_TODATE',
'  and ( :P314_PARTY IS NULL OR instr('':''||:P314_PARTY||'':'','':''||a.Party||'':'') > 0 ) ',
'  and ( :P314_BANK IS NULL OR instr('':''||:P314_BANK||'':'','':''||a.BankAccount||'':'') > 0 )',
'  and case When a.Reference = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When a.Reference = ''JOBORDER'' Then ''JOBORDER''',
'           When a.Reference = ''JOBBILL'' Then ''JOBBILL''',
'           When a.Reference = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When a.Reference = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When a.Reference = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When a.Reference = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When a.Reference = ''ON ACCOUNT'' Then ''ON ACCOUNT''',
'      End like nvl(:P314_REFERENCECODE,''%'')',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Payment Advice Only Report'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(194017624800070977)
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
,p_detail_link=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.::P140_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>26098606333943535
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194023951821070998)
,p_db_column_name=>'AMOUNT'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194024382249070998)
,p_db_column_name=>'AMOUNTDR'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Amount DR'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194026628314071001)
,p_db_column_name=>'BANKACCOUNT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Bank account'
,p_column_html_expression=>'<div style="display:block; width:150px">#BANKACCOUNT#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194021998798070996)
,p_db_column_name=>'CERTIFICATENO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Certificate no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194025971216071000)
,p_db_column_name=>'CHECKNOORDDNO'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Check no or dd no'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194029071445071003)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Company name'
,p_column_html_expression=>'<div style="display:block; width:150px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194028284521071002)
,p_db_column_name=>'CREATOR'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194020385410070993)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Doctype name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194029871290071004)
,p_db_column_name=>'DOCUMENTSTATUSNAME'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Document status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194028631704071003)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Location name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194026242152071000)
,p_db_column_name=>'MODEOFTRANSACTION'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Mode of transaction'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194029511443071003)
,p_db_column_name=>'NARRATION'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Narration'
,p_column_html_expression=>'<div style="display:block; width:300px">#NARRATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194019921967070993)
,p_db_column_name=>'PARTY'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Party'
,p_column_html_expression=>'<div style="display:block; width:150px">#PARTY#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194019583228070992)
,p_db_column_name=>'PAYMENTADVICEDATE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Payment advice date'
,p_column_html_expression=>'<div style="display:block; width:100px">#PAYMENTADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194019124379070992)
,p_db_column_name=>'PAYMENTADVICENO'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Payment advice no'
,p_column_html_expression=>'<div style="display:block; width:150px">#PAYMENTADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194022734089070997)
,p_db_column_name=>'REFERENCE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Reference'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194023542995070997)
,p_db_column_name=>'REFERENCEDATE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Reference date'
,p_column_html_expression=>'<div style="display:block; width:100px">#REFERENCEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194027080556071001)
,p_db_column_name=>'REFERENCELOCATION'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Reference location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194023159247070997)
,p_db_column_name=>'REFERENCENO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Reference no'
,p_column_html_expression=>'<div style="display:block; width:150px">#REFERENCENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194025524305070999)
,p_db_column_name=>'ROUNDOFF'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Round off'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194018404282070991)
,p_db_column_name=>'STATUS'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'STATUS'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194025126054070999)
,p_db_column_name=>'TDSAMOUNT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'TDS amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194021606986070995)
,p_db_column_name=>'TDSLOWERRATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'TDS lower rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194021216990070994)
,p_db_column_name=>'TDSNATURENAME'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'TDS nature name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194022402257070996)
,p_db_column_name=>'TDSONOVERANDABOVE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'TDS on over and above'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSONOVERANDABOVE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194020766933070994)
,p_db_column_name=>'TDSPAYEECATEGORYNAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'TDS payee category name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194024730724070999)
,p_db_column_name=>'TDSRATE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'TDS rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194018807237070992)
,p_db_column_name=>'TNO'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194027916581071002)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Voucher date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194027463637071001)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Voucher no'
,p_column_html_expression=>'<div style="display:block; width:150px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(194030313379076397)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'261113'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STATUS:TNO:PAYMENTADVICENO:PAYMENTADVICEDATE:PARTY:DOCTYPENAME:TDSPAYEECATEGORYNAME:TDSNATURENAME:TDSLOWERRATE:CERTIFICATENO:TDSONOVERANDABOVE:REFERENCE:REFERENCENO:REFERENCEDATE:AMOUNT:AMOUNTDR:TDSRATE:TDSAMOUNT:ROUNDOFF:CHECKNOORDDNO:MODEOFTRANSACT'
||'ION:BANKACCOUNT:REFERENCELOCATION:VOUCHERNO:VOUCHERDATE:CREATOR:LOCATIONNAME:COMPANYNAME:DOCUMENTSTATUSNAME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(194044000951643875)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(194017613650070977)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(194043647714636918)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(194017613650070977)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(194043334636635686)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(194017613650070977)
,p_button_name=>'Pdf'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(194036136598429657)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'NEXT'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483217422540456944)
,p_name=>'P314_BANK'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_prompt=>'Bank '
,p_placeholder=>'Bank Account'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyName r',
'From PaymentAdvice a, Party p',
'Where a.AccountCode = p.PartyCode',
'  and p.PartyTypeCode IN (''BANK'',''CASH'');'))
,p_cSize=>75
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(484466378519718348)
,p_name=>'P314_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483161797152986616)
,p_name=>'P314_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      c.Companyname r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PAYMENTADVICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;',
''))
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483217007374456944)
,p_name=>'P314_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_prompt=>'DocType'
,p_placeholder=>'Enter DocType Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      dt.DocTypeName d,',
'      dt.DocTypename r',
'From  ModulePrivilege a, ModulePrivilegeDocType b, DocType dt, BossUser bu, ModuleDocType md, ModuleDocTypeDetail mdd',
'Where a.TNo = b.TNo(+)',
'  and (b.DocTypeCode = dt.DocTypeCode or b.DocTypeCode is null)',
'  and a.ModuleCode = md.ModuleCode',
'  and md.TNo = mdd.TNo',
'  and mdd.DocTypeCode = dt.DocTypeCode',
'  and a.ModuleCode = ''PAYMENTADVICE''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';'))
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483215461592456944)
,p_name=>'P314_FROMDATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_item_default=>'Trunc(Sysdate-3)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483216169939456944)
,p_name=>'P314_LOCATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.LocationName d,',
'      l.Locationname r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''PAYMENTADVICE''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
'  ',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483216633806456944)
,p_name=>'P314_PARTY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyName r',
'From PaymentAdvice a, Party p',
'Where a.PartyCode = p.PartyCode'))
,p_cSize=>75
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483217856947456945)
,p_name=>'P314_REFERENCECODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_prompt=>'Reference'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Purchase Order;PURCHASEORDER,Purchase Bill;PURCHASEBILL,Job Order;JOBORDER,Job Bill;JOBBILL,Account Opening;ACCOUNTOPENING,External Service Entry Sheet;EXTERNALSERVICESENTRY,On Account;OTHER'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Any Referance--'
,p_cHeight=>1
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(517691939789785384)
,p_name=>'P314_STATUSS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'DISTINCT',
'C.DOCUMENTSTATUSNAME d,',
'C.DOCUMENTSTATUSCODE r',
'FROM DOCUMENTSTATUSDETAIL B, DOCUMENTSTATUS C,PAYMENTADVICE A',
'WHERE B.DOCUMENTSTATUSCODE = C.DOCUMENTSTATUSCODE(+)',
'AND B.MODULETNO = A.TNO(+)',
'AND B.MODULECODE = ''PAYMENTADVICE''',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'2'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477923036933985005)
,p_name=>'P314_TNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483215807723456944)
,p_name=>'P314_TODATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(547585271404462695)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(194044209833645175)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(194043334636635686)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(194044564572645176)
,p_event_id=>wwv_flow_imp.id(194044209833645175)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(193694722368765072)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193694846989765073)
,p_event_id=>wwv_flow_imp.id(193694722368765072)
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
