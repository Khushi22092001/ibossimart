prompt --application/pages/page_00401
begin
--   Manifest
--     PAGE: 00401
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
 p_id=>401
,p_name=>'Trial Balance'
,p_alias=>'TRIAL-BALANCE2'
,p_step_title=>'Trial Balance'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(869396695875759297)
,p_plug_name=>'New'
,p_static_id=>'new'
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
'--CASE WHEN nvl(:P401_LedgerOnly,''NO'') = ''NO'' and A.partytypecode=''ACCOUNTGROUP'' and NVL(:P401_WITHINDENT,''NO'') = ''YES'' then',
'CASE WHEN  A.partytypecode=''ACCOUNTGROUP'' and NVL(:P401_WITHINDENT,''NO'') = ''YES'' then',
'  ',
'      ''<B>''||''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||401||'':''||:APP_SESSION||''::::''||''P401_ACCOUNTCODE,P401_FROMDATE,P401_ACCOUNTLEVEL,P401_ACCOUNTCODE,P401_TODATE,P401_WITHINDENT''||'':''||A.PARTYCODE||'',''||nvl(:P401_FROMDATE,:P400_FRO'
||'MDATE)||'',''||C.ACCOUNTLEVEL ||'',''||A.PARTYCODE||'',''||NVL(:P401_TODATE,:P400_TODATE)||'',''||''YES''||'':NO'')||''">''||rpad(''-'',2 * (C.AccountLevel),''-'')  || A.PARTYNAME||''</a>''||''</b>''',
' ',
'   WHEN   A.partytypecode=''ACCOUNTGROUP'' and NVL(:P401_WITHINDENT,''NO'') = ''NO'' then',
' ',
'      ''<B>''||''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||401||'':''||:APP_SESSION||''::::''||''P401_ACCOUNTCODE,P401_FROMDATE,P401_ACCOUNTLEVEL,P401_ACCOUNTCODE,P401_TODATE,P401_WITHINDENT''||'':''||A.PARTYCODE||'',''||nvl(:P401_FROMDATE,:P400_FRO'
||'MDATE)||'',''||C.ACCOUNTLEVEL ||'',''||A.PARTYCODE||'',''||NVL(:P401_TODATE,:P400_TODATE)||'',''||''YES''||'':NO'')||''">''||A.PARTYNAME||''</a>''||''</b>''',
' ',
'   WHEN  A.partytypecode ! =''ACCOUNTGROUP'' and NVL(:P401_WITHINDENT,''NO'') = ''YES'' then',
'     --  ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':141:''||:APP_SESSION||''::''||''P141_fromdate:''|| c.fromdate||'':''||''P141_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||a.partyname||''</a>''	',
'      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':11:''||:APP_SESSION||''::''||''P11_fromdate:''|| c.fromdate||'':''||''P11_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||rpad(''-'',2 * (C.AccountLevel ),''-'')  || A.PARTYNAME||''</a>''',
' ',
'   WHEN  A.partytypecode ! =''ACCOUNTGROUP'' and NVL(:P401_WITHINDENT,''NO'') = ''NO'' then',
'     --  ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':141:''||:APP_SESSION||''::''||''P141_fromdate:''|| c.fromdate||'':''||''P141_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||a.partyname||''</a>''	',
'      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':11:''||:APP_SESSION||''::''||''P11_fromdate:''|| c.fromdate||'':''||''P11_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||A.PARTYNAME||''</a>''',
'end ACCOUNTNAMEDISPLAY,',
'',
'',
'',
'CASE WHEN C.AccountLevel  = nvl(:P401_AccountLevel,1) or NVL(:P401_LedgerOnly, ''NO'') = ''YES''  then',
'       c.OpeningDebitAmount  ',
'     ELSE',
'        0',
'END  DebitOpeningC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P401_AccountLevel,1) or NVL(:P401_LedgerOnly, ''NO'') = ''YES''  then',
'       c.OpeningCreditAmount ',
'     ELSE',
'        0',
'END  CreditOpeningC,',
'CASE WHEN C.AccountLevel  = nvl(:P401_AccountLevel,1) or NVL(:P401_LedgerOnly, ''NO'') = ''YES''  then',
'       c.DebitAmount  ',
'     ELSE',
'        0',
'END  DebitAmountC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P401_AccountLevel,1) or NVL(:P401_LedgerOnly, ''NO'') = ''YES''  then',
'       c.CreditAmount ',
'     ELSE',
'        0',
'END  CreditAmountC,',
'CASE WHEN C.AccountLevel  = nvl(:P401_AccountLevel,1) or NVL(:P401_LedgerOnly, ''NO'') = ''YES''  then',
'       c.ClosingDebitAmount  ',
'     ELSE',
'        0',
'END  DebitClosingC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P401_AccountLevel,1) or NVL(:P401_LedgerOnly, ''NO'') = ''YES''  then',
'       c.ClosingCreditAmount ',
'     ELSE',
'        0',
'END  CreditClosingC',
'',
'',
'',
'FROM ',
'Party a, ApexTrialBalanceRevisedGroup c',
'WHERE 1=1',
'AND  C.CREATOR = ''&APP_USER.''',
'AND a.PartyCode = c.AccountCode(+)',
'',
'and (',
'     exists (',
'           select',
'                aa.ChildCode',
'           from MyAccountIncludeRevised aa',
'           where aa.CompanyCode = :P401_CompanyCode',
'               and aa.FromDate = :P401_FROMDATE',
'               and aa.ToDate = :P401_TODATE',
'               and nvl(aa.LocationCode, ''NULL'') = nvl(:P401_LocationCode, ''NULL'')',
'               and aa.AccountCode = :P401_AccountCode',
'               and aa.ChildCode = a.PartyCode',
'     )',
'     or',
'     :P401_AccountCode is null',
')',
'',
'and ( ',
'     nvl(:P401_LedgerOnly,''NO'') = ''YES''          ',
'     or',
'     c.AccountLevel <= nvl(:P401_AccountLevel,1)',
'     ',
')',
'and ( ',
'     nvl(:P401_LedgerOnly,''NO'') = ''NO'' ',
'     OR',
'     a.PartyTypeCode != ''ACCOUNTGROUP''',
')',
'and (',
'     nvl(:P401_IncludeZeroTransaction ,''NO'') = ''YES''',
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
'     nvl(:P401_Exclude0Closing ,''NO'') = ''NO''',
'     or (',
'         ROUND(nvl(c.OpeningAmount,0) - nvl(c.DebitAmount,0) + nvl(c.CreditAmount,0)   - nvl(c.PDebitAmount,0) + nvl(c.PCreditAmount,0), 2) != 0',
'     )     ',
')',
'and c.FromDate = ''&P401_FROMDATE.''--TO_DATE(:P401_FROMDATE,''DD-MM-RRRR'')',
'and c.ToDate = ''&P401_TODATE.''--TO_DATE(:P401_TODATE,''DD-MM-RRRR'')',
'and c.IncludeChild = nvl(:P401_IncludeChild , ''NO'')',
'and c.CompanyCode = :P401_CompanyCode',
'and nvl(c.LocationCode, ''null'') = nvl(:P401_Locationcode, ''null'') ',
'--and ( ''&P401_ACCOUNTCODE.'' IS NULL OR A.PARTYCODE = ''&P401_ACCOUNTCODE.'')',
'',
'ORDER BY c.TrialBalancePosition, a.PartyName ;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P401_FROMDATE,P401_TODATE,P401_WITHINDENT,P401_LEDGERONLY,P401_NARRATION,P401_PRINTDRCR,P401_LOCATIONCODE,P401_ACCOUNTCODE,P401_INCLUDECHILD,P401_INCLUDEZEROTRANSACTION,P401_NEW,P401_REPORTTITLE,P401_DIVISIONWISE,P401_ACCOUNTLEVEL,P401_DETAILLEVEL,P4'
||'01_EXCLUDE0CLOSING,P401_COMPANYCODE,P401_FINANCIALYEARCODE'
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
 p_id=>wwv_flow_imp.id(800422619921091742)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>782955607795862426
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653475278514033716)
,p_db_column_name=>'ACCOUNTLEVEL'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Accountlevel'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(652722975050363867)
,p_db_column_name=>'ACCOUNTNAMEDISPLAY'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Accountnamedisplay'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653474441837033716)
,p_db_column_name=>'CCURRENTPOSITION'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Ccurrentposition'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653476115484033717)
,p_db_column_name=>'CLOSINGAMOUNT'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Closingamount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653477705848033718)
,p_db_column_name=>'CREDITAMOUNT'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'CREDIT AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653481306277033719)
,p_db_column_name=>'CREDITAMOUNTC'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Creditamountc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653479270801033718)
,p_db_column_name=>'CREDITCLOSING'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'CREDIT CLOSING'
,p_column_type=>'STRING'
,p_format_mask=>'999999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653482130195033719)
,p_db_column_name=>'CREDITCLOSINGC'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Creditclosingc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653480466133033719)
,p_db_column_name=>'CREDITOPENINGC'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Creditopeningc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653477311538033717)
,p_db_column_name=>'DEBITAMOUNT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'DEBIT AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653480902984033719)
,p_db_column_name=>'DEBITAMOUNTC'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Debitamountc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653478920982033718)
,p_db_column_name=>'DEBITCLOSING'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'DEBIT CLOSING'
,p_column_type=>'STRING'
,p_format_mask=>'999999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653481659889033719)
,p_db_column_name=>'DEBITCLOSINGC'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Debitclosingc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653480074627033719)
,p_db_column_name=>'DEBITOPENINGC'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Debitopeningc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653475653638033716)
,p_db_column_name=>'OPENINGAMOUNT'
,p_display_order=>50
,p_column_identifier=>'F'
,p_column_label=>'Openingamount'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653476894046033717)
,p_db_column_name=>'OPENINGCREDITAMOUNT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'OPENING CREDIT AMOUNT'
,p_column_type=>'STRING'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653476500382033717)
,p_db_column_name=>'OPENINGDEBITAMOUNT'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'OPENING DEBIT AMOUNT'
,p_column_type=>'STRING'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653473644459033715)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653474043792033716)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Partyname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653474843111033716)
,p_db_column_name=>'PARTYTYPECODE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Partytypecode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653478508316033718)
,p_db_column_name=>'PCREDITAMOUNT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Pcreditamount'
,p_column_type=>'STRING'
,p_format_mask=>'999999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653478048284033718)
,p_db_column_name=>'PDEBITAMOUNT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Pdebitamount'
,p_column_type=>'STRING'
,p_format_mask=>'999999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(800501178401255684)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133332'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ACCOUNTNAMEDISPLAY:OPENINGDEBITAMOUNT:OPENINGCREDITAMOUNT:DEBITAMOUNT:CREDITAMOUNT:DEBITCLOSING:CREDITCLOSING'
,p_sum_columns_on_break=>'DEBITAMOUNT:CREDITAMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53818752033055991820)
,p_plug_name=>'Trial Balance '
,p_static_id=>'trial-balance'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35766743787493923)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_icon_css_classes=>'fa-save'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737267013200328677)
,p_name=>'P401_ACCOUNTCODE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'SELECT 1 FROM PARTY WHERE 1 != 1'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Account'
,p_placeholder=>'Account List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      p.PartyName d,',
'      p.PartyCode r',
'From  Party p',
'--Where P.PartyTYPECODE != ''ACCOUNTGROUP''',
'',
'Order By 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
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
 p_id=>wwv_flow_imp.id(737267822616328677)
,p_name=>'P401_ACCOUNTLEVEL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_prompt=>'Detail Level'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737270996546328678)
,p_name=>'P401_COMPANYCODE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737269446458328678)
,p_name=>'P401_DETAILLEVEL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737270547771328678)
,p_name=>'P401_DIVISIONWISE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'YES'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737270184363328678)
,p_name=>'P401_EXCLUDE0CLOSING'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_prompt=>'Exclude Zero Closing'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737271445807328678)
,p_name=>'P401_FINANCIALYEARCODE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737264633369328676)
,p_name=>'P401_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'GLOBAL_FINANCIALYEARBEGIN'
,p_item_default_type=>'ITEM'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_format_mask=>'DD-MM-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>35
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737268984475328678)
,p_name=>'P401_INCLUDECHILD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_prompt=>'Include Child'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737269835029328678)
,p_name=>'P401_INCLUDEZEROTRANSACTION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_prompt=>'Include ZeroTransaction'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737268579036328677)
,p_name=>'P401_LEDGERONLY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ledger Only'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737266579027328677)
,p_name=>'P401_LOCATIONCODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'SELECT 1 FROM PARTY WHERE 1 != 1'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Locationcode'
,p_placeholder=>'Enter Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'Select LocationName d, LocationCode r From Location Where ISDIVISION = ''YES'''
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(737265795408328677)
,p_name=>'P401_NARRATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737267440554328677)
,p_name=>'P401_NEW'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737266190634328677)
,p_name=>'P401_PRINTDRCR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'STATE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737268163337328677)
,p_name=>'P401_REPORTTITLE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'Account Ledger'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(672644931664982028)
,p_name=>'P401_STATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'STATUS'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737265016776328676)
,p_name=>'P401_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_item_default=>'SELECT TRUNC(SYSDATE) FROM DUAL;'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>35
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(737265384105328676)
,p_name=>'P401_WITHINDENT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53818752033055991820)
,p_use_cache_before_default=>'NO'
,p_prompt=>'With Indent'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35773471004493926)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'document'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'contextmenu'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35773992502493926)
,p_event_id=>wwv_flow_imp.id(35773471004493926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'plugin-com-pretius-apex-contextmenu'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(869396695875759297)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'trial_context',
  'attribute_02', 'DAMP:SEP')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35774392903493926)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P401_WITHINDENT,P401_LEDGERONLY,P401_LOCATIONCODE,P401_ACCOUNTCODE,P401_INCLUDECHILD,P401_INCLUDEZEROTRANSACTION,P401_ACCOUNTLEVEL,P401_EXCLUDE0CLOSING'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35774907518493927)
,p_event_id=>wwv_flow_imp.id(35774392903493926)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(869396695875759297)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35773051350493926)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' if :p401_accountcode is not null then',
'   :P401_ACCOUNTLEVEL := to_number(:P401_ACCOUNTLEVEL)  + 1;',
' end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>18306039225264610
);
wwv_flow_imp.component_end;
end;
/
