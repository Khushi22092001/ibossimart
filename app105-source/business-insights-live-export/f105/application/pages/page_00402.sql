prompt --application/pages/page_00402
begin
--   Manifest
--     PAGE: 00402
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
 p_id=>402
,p_name=>'Trial Balance'
,p_alias=>'TRIAL-BALANCE1'
,p_step_title=>'Trial Balance'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(823955647671203347)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'NEW'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'a.partycode,',
'a.partyname,',
'getTrialBalancePosition(a.PartyCode) AS ccurrentposition,',
'a.partytypecode,',
'c.AccountLevel,',
'decode(c.openingamount, 0, null, round(C.OPENINGAMOUNT,2)) as openingamount,',
'round(C.CLOSINGAMOUNT,2) as closingamount,',
'decode(c.OpeningDebitAmount, 0, null, round(c.OpeningDebitAmount,2)) as OpeningDebitAmount,',
'decode(c.OpeningCreditAmount, 0, null, round(c.OpeningCreditAmount,2)) as OpeningCreditAmount,',
'round(decode(C.DEBITAMOUNT, 0, null, c.DebitAmount),2) AS debitamount,',
'round(decode(C.CREDITAMOUNT, 0 , null, round(c.CreditAmount,2)),2) AS CreditAmount,',
'decode(C.PDEBITAMOUNT, 0, null, round(c.PDebitAmount,2)) AS pdebitamount,',
'decode(C.PCREDITAMOUNT, 0 , null, round(c.PCreditAmount,2)) AS pcreditamount,',
'decode(c.ClosingDebitAmount, 0, null, round(c.ClosingDebitAmount,2)) AS debitclosing,',
'decode(c.ClosingCreditAmount, 0, null, round(c.ClosingCreditAmount,2)) AS creditclosing,',
'CASE WHEN nvl(:P402_LedgerOnly,''NO'') = ''NO'' and A.partytypecode=''ACCOUNTGROUP'' then',
'',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':189:''||:APP_SESSION||''::''||''P189_accountcode:''|| a.partycode||'':''||''P189_FROMDATE,P189_ACCOUNTLEVEL,P189_ACCOUNTCODE,P189_TODATE:''||:P402_FROMDATE||'',''||C.ACCOUNTLEVEL||'',''||A.PARTYCODE||'','
||'''||:P402_TODATE,NULL,''SESSION'') ||''">''||rpad(''-'',5 * (C.AccountLevel - (nvl( (TO_NUMBER(:P402_AccountLevel,99)),1)) ),''-'')  || A.PARTYNAME||''</a>''',
'',
'     WHEN nvl(:P402_LedgerOnly,''NO'') = ''NO'' and A.partytypecode=''ACCOUNT'' then',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':141:''||:APP_SESSION||''::''||''P141_fromdate:''|| c.fromdate||'':''||''P141_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||rpad(''-'',5 * (C.AccountLevel - (nvl( (TO_NUMBER(:P402_AccountLevel,99)),1))'
||' ),''-'')  || A.PARTYNAME||''</a>''	',
' ',
'     when nvl(:P402_LedgerOnly,''NO'') = ''YES'' and A.partytypecode=''ACCOUNTGROUP'' then',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':189:''||:APP_SESSION||''::''||:DEBUG||''::''||''P189_fromdate:''|| c.fromdate||'':''||''P189_ACCOUNTLEVEL:''||c.accountlevel||'':''||''P189_ACCOUNTCODE:''||a.partycode,NULL,''SESSION'') ||''">''||a.partyname|'
||'|''</a>''',
'      ',
'     when nvl(:P402_LedgerOnly,''NO'') = ''YES'' and A.partytypecode=''ACCOUNT'' then',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':141:''||:APP_SESSION||''::''||''P141_fromdate:''|| c.fromdate||'':''||''P141_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||a.partyname||''</a>''	',
'end ACCOUNTNAMEDISPLAY ,',
'',
'CASE',
'        WHEN A.partytypecode=''ACCOUNTGROUP'' then',
'       /*<a href="||APEX_UTIL.PREPARE_URL(p_url => ''f?p='' || :APP_ID || '':190:''|| :APP_SESSION',
'                ||''::NO::P402_ITEM,C.FROMDATE'')"||''>''||c.partyname||''</a>''*/',
'',
'      /* ''<a href="http://3.7.1.231:8888/apex/f?p=&APP_ID.:190">''||c.partyname||''</a>''''*/',
'      ',
'      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':141:''||:APP_SESSION||''::''||:DEBUG||''::''||''P402_fromdate,P402_TODATE:''|| c.fromdate,C.TODATE,NULL,''SESSION'') ||''">''||a.partyname||''</a>''',
'',
'    ELSE',
'       ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':304:''||:APP_SESSION||''::''||''P304_fromdate:''|| c.fromdate||'':''||''P304_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||a.partyname||''</a>''	',
'end  LINK',
'',
'',
'',
'',
'FROM ',
'Party a, ApexTrialBalanceRevisedGroup c',
'WHERE C.CREATOR = ''&APP_USER.''',
'AND a.PartyCode = c.AccountCode',
'and (',
'     exists (',
'           select',
'                aa.ChildCode',
'           from MyAccountIncludeRevised aa',
'           where aa.CompanyCode = :P402_CompanyCode',
'               and aa.FromDate = :P402_FROMDATE',
'               and aa.ToDate = :P402_TODATE',
'               and nvl(aa.LocationCode, ''NULL'') = nvl(:P402_LocationCode, ''NULL'')',
'               and aa.AccountCode = :P402_AccountCode',
'               and aa.ChildCode = a.PartyCode',
'     )',
'     or',
'     :P402_AccountCode is null',
')',
'',
'and ( ',
'     nvl(:P402_LedgerOnly,''NO'') = ''YES''          ',
'     or',
'     c.AccountLevel <= nvl(:P402_DetailLevel,1)',
'     or',
'     ( c.AccountLevel <= :P402_AccountLevel+ nvl(:P402_DetailLevel,1) and :P402_AccountCode is not null )',
')',
'and ( ',
'     nvl(:P402_LedgerOnly,''NO'') = ''NO'' ',
'     OR',
'     a.PartyTypeCode != ''ACCOUNTGROUP''',
')',
'and (',
'     nvl(:P402_IncludeZeroTransaction ,''NO'') = ''YES''',
'     or ( ',
'         nvl(c.OpeningAmount,0) != 0',
'         or',
'         nvl(c.DebitAmount,0) != 0',
'         or',
'         nvl(c.CreditAmount,0) != 0',
'         or',
'         nvl(c.PDebitAmount,0) != 0',
'         or',
'         nvl(c.PCreditAmount,0) != 0',
'     )     ',
')',
'and (',
'     nvl(:P402_Exclude0Closing ,''NO'') = ''NO''',
'     or (',
'         ROUND(nvl(c.OpeningAmount,0) - nvl(c.DebitAmount,0) + nvl(c.CreditAmount,0)   - nvl(c.PDebitAmount,0) + nvl(c.PCreditAmount,0), 2) != 0',
'     )     ',
')',
'and c.FromDate = trunc(TO_DATE(:P402_FROMDATE,''DD-MON-RRRR''))',
'and c.ToDate = trunc(TO_DATE(:P402_TODATE,''DD-MON-RRRR''))',
'and c.IncludeChild = nvl(:P402_IncludeChild , ''NO'')',
'and c.CompanyCode = :P402_CompanyCode',
'and nvl(c.LocationCode, ''null'') = nvl(:P402_Locationcode, ''null'') ',
'ORDER BY c.TrialBalancePosition, a.PartyName ;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P402_FROMDATE,P402_TODATE,P402_DETAILLEVEL,P402_FINANCIALYEARCODE,P402_COMPANYCODE,P402_ACCOUNTCODE,P402_ACCOUNTLEVEL'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New'
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
 p_id=>wwv_flow_imp.id(685096727552603682)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>246111858352905698
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538037242544323546)
,p_db_column_name=>'ACCOUNTLEVEL'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Accountlevel'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538041612763323548)
,p_db_column_name=>'ACCOUNTNAMEDISPLAY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Accountnamedisplay'
,p_column_link=>'f?p=&APP_ID.:#WEBSITE#:&SESSION.::&DEBUG.:::'
,p_column_linktext=>'#ACCOUNTNAMEDISPLAY#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538036423737323546)
,p_db_column_name=>'CCURRENTPOSITION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Ccurrentposition'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538038047785323547)
,p_db_column_name=>'CLOSINGAMOUNT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Closingamount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538039609680323547)
,p_db_column_name=>'CREDITAMOUNT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Creditamount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538041255071323548)
,p_db_column_name=>'CREDITCLOSING'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Creditclosing'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538039213086323547)
,p_db_column_name=>'DEBITAMOUNT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Debitamount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538040793046323548)
,p_db_column_name=>'DEBITCLOSING'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Debitclosing'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538042021397323549)
,p_db_column_name=>'LINK'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538037653594323546)
,p_db_column_name=>'OPENINGAMOUNT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Openingamount'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538038842304323547)
,p_db_column_name=>'OPENINGCREDITAMOUNT'
,p_display_order=>80
,p_column_identifier=>'I'
,p_column_label=>'Openingcreditamount'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538038439980323547)
,p_db_column_name=>'OPENINGDEBITAMOUNT'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Openingdebitamount'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538035642418323545)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538036040919323546)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Partyname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538036829661323546)
,p_db_column_name=>'PARTYTYPECODE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Partytypecode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538040480869323548)
,p_db_column_name=>'PCREDITAMOUNT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Pcreditamount'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(538040029303323548)
,p_db_column_name=>'PDEBITAMOUNT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Pdebitamount'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(685190457114141987)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133834'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ACCOUNTNAMEDISPLAY:PARTYTYPECODE:OPENINGDEBITAMOUNT:OPENINGCREDITAMOUNT:DEBITAMOUNT:CREDITAMOUNT:DEBITCLOSING:CREDITCLOSING:LINK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53759346602708182956)
,p_plug_name=>'Trial Balance '
,p_static_id=>'trial-balance'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(444682188357368645)
,p_button_sequence=>190
,p_button_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_redirect_url=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:::'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(444682574607368645)
,p_button_sequence=>200
,p_button_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/trialbalancewithouttotal.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P303_FROMDATE=&P402_FROMDATE.&P303_TODATE=&P402_TODATE.&P303_LOCATIONCODE=&P402_LOCATIONCODE.&P303_ACCOUNTCODE=&P402_ACCOUNTCODE.&P303_CREATOR=&APP_USER.&P303_DETAILLEVEL=&P402_DETAILLEVEL.&P303_COMPANYCODE=&P402_COMPANYCODE.&P303_ACCOUNTLEVEL=&P402_ACCOUNTLEVEL.&P303_WITHINDENT=&P402_WITHINDENT.&P303_LEDGERONLY=&P402_LEDGERONLY.&_xf=pdf'
,p_button_execute_validations=>'N'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538062998492323621)
,p_name=>'P402_ACCOUNTCODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>'SELECT 1 FROM PARTY WHERE 1 != 1'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      p.PartyName d,',
'      p.PartyCode r',
'From  Party p',
'Where P.PartyTYPECODE != ''ACCOUNTGROUP''',
'',
'Order By 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538063344310323621)
,p_name=>'P402_ACCOUNTLEVEL'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_prompt=>'Accountlevel'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538066167293323622)
,p_name=>'P402_COMPANYCODE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>'1'
,p_prompt=>'Companycode'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538064934745323621)
,p_name=>'P402_DETAILLEVEL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_prompt=>'Detaillevel'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538066991800323622)
,p_name=>'P402_DIVISIONWISE'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_prompt=>'Divisionwise'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538065727564323622)
,p_name=>'P402_EXCLUDE0CLOSING'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_prompt=>'Exclude0closing'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538066517310323622)
,p_name=>'P402_FINANCIALYEARCODE'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>'20-21'
,p_item_default_type=>'ITEM'
,p_prompt=>'Financialyearcode'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538060549835323620)
,p_name=>'P402_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'FINANCIALYEARBEGIN',
'FROM FINANCIALYEAR',
'WHERE TRUNC(SYSDATE) BETWEEN FINANCIALYEARBEGIN AND FINANCIALYEAREND'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538064516674323621)
,p_name=>'P402_INCLUDECHILD'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_prompt=>'Includechild'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538065354180323622)
,p_name=>'P402_INCLUDEZEROTRANSACTION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_prompt=>'Include0transaction'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538064179696323621)
,p_name=>'P402_LEDGERONLY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_prompt=>'Ledgeronly'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538062516667323621)
,p_name=>'P402_LOCATIONCODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>'SELECT 1 FROM PARTY WHERE 1 != 1'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Locationcode'
,p_placeholder=>'Enter Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''PURCHASEBILL''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(538061727243323620)
,p_name=>'P402_NARRATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538062146857323620)
,p_name=>'P402_PRINTDRCR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>'STATE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538063766913323621)
,p_name=>'P402_REPORTTITLE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>'Account Ledger'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538060930902323620)
,p_name=>'P402_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>'SELECT TRUNC(SYSDATE) FROM DUAL;'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(538061355317323620)
,p_name=>'P402_WITHINDENT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53759346602708182956)
,p_item_default=>'NO'
,p_prompt=>'With Indent'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(444688343822368647)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' if :p402_accountcode is not null then',
'   :p402_detaillevel := :p402_accountlevel + 1;',
' end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>5703474622670663
);
wwv_flow_imp.component_end;
end;
/
