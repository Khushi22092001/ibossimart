prompt --application/pages/page_00400
begin
--   Manifest
--     PAGE: 00400
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
 p_id=>400
,p_name=>'Trial Balance'
,p_alias=>'TRIAL-BALANCE'
,p_step_title=>'Trial Balance'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function formatDate(date) {',
'  var monthNames = [',
'    "JAN", "FEB", "MAR",',
'    "APR", "MAY", "JUN", "JUL",',
'    "AUG", "SEP", "OCT",',
'    "NOV", "DEC"',
'  ];',
'',
'  var day = date.getDate();',
'  var monthIndex = date.getMonth();',
'  var year = date.getFullYear();',
'',
'  return day + ''-'' + monthNames[monthIndex] + ''-'' + year;',
'}',
'',
'function generatePDF() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P400_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/TrialBalance.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P400_FROMDATE'').val());',
'  var toDate = new Date($(''#P400_TODATE'').val());',
'  var companycode ,global_companycode;',
'',
'var reportParams = ',
'      ''&P_FROMDATE=''+ $(''#P400_FROMDATE'').val()+',
'      ''&P_TODATE='' + $(''#P400_TODATE'').val() +',
'      ''&P_LOCATIONCODE='' +$(''#P400_LOCATIONCODE'').val() +  ',
'      ''&P_AccountCode='' +$(''#P400_ACCOUNTCODE'').val() +  ',
'      ''&P_AccountLevel='' +$(''#P400_ACCOUNTLEVEL'').val() +  ',
'      ''&P_WITHINDENT='' +$(''#P400_WITHINDENT'').val() +  ',
'      ''&P_LedgerOnly='' +$(''#P400_LEDGERONLY'').val() +  ',
'      ''&P_IncludeChild='' +$(''#P400_INCLUDECHILD'').val() +  ',
'      ''&P_IncludeZeroTransaction='' +$(''#P400_INCLUDEZEROTRANSACTION'').val() +  ',
'      ''&P_Exclude0Closing='' +$(''#P400_EXCLUDE0CLOSING'').val()   ',
'      ',
'      ;',
' ',
'//alert($v(''P400_PARTY''));',
'  var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P400_BIREPORTURL'').val()',
'  var reportName =  ''TrialBalance.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'var reportParams = ',
'         ''"_paramsP_FROMDATE":"'' +$(''#P400_FROMDATE'').val() + ''",'' + ',
'         ''"_paramsP_TODATE":"'' +$(''#P400_TODATE'').val() + ''",'' + ',
'         ''"_paramsP_WITHINDENT":"'' + $(''#P400_WITHINDENT_1'').val() + ''",'' + ',
'         ''"_paramsP_LedgerOnly":"'' + $(''#P400_LEDGERONLY_1'').val() + ''",'' + ',
'	     ''"_paramsP_LOCATIONCODE":"'' + $(''#P400_LOCATIONCODE'').val() + ''",'' + ',
'	     ''"_paramsP_AccountCode":"'' + $(''#P400_ACCOUNTCODE'').val() + ''",'' + ',
'         ''"_paramsP_IncludeChild":"'' + $(''#P400_INCLUDECHILD_1'').val() + ''",'' +',
'         ''"_paramsP_IncludeZeroTransaction":"'' + $(''#P400_INCLUDEZEROTRANSACTION_1'').val() + ''",'' + ',
'         ''"_paramsP_AccountLevel":"'' + $(''#P400_ACCOUNTLEVEL'').val() + ''",'' + ',
'         ''"_paramsP_Exclude0Closing":"'' + $(''#P400_EXCLUDE0CLOSING_1'').val()  ',
'         ;',
'     ',
'//alert($(''#P9993_TNO'').val());',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''&nQUser=''+ username +',
'              ''&nQPassword=''+ password +',
'              ''&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1",''+reportParams+''"}''',
'//alert(reportURL);',
'  window.open(reportURL, ''_blank'');',
'}',
'',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_rejoin_existing_sessions=>'N'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(799500938229613050)
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
'to_number(decode(c.openingamount, 0, null, round(C.OPENINGAMOUNT,2)) ) as openingamount,',
'to_number(round(C.CLOSINGAMOUNT,2)) as closingamount,',
'to_number(decode(c.OpeningDebitAmount, 0, null, round(c.OpeningDebitAmount,2)) ) as OpeningDebitAmount,',
'to_number(decode(c.OpeningCreditAmount, 0, null, round(c.OpeningCreditAmount,2)) ) as OpeningCreditAmount,',
'to_number(round(decode(C.DEBITAMOUNT, 0, null, c.DebitAmount),2) ) AS debitamount,',
'to_number(round(decode(C.CREDITAMOUNT, 0 , null, round(c.CreditAmount,2)),2) ) AS CreditAmount,',
'to_number(decode(C.PDEBITAMOUNT, 0, null, round(c.PDebitAmount,2)) ) AS pdebitamount,',
'to_number(decode(C.PCREDITAMOUNT, 0 , null, round(c.PCreditAmount,2)) ) AS pcreditamount,',
'to_number(decode(c.ClosingDebitAmount, 0, null, round(c.ClosingDebitAmount,2)) ) AS debitclosing,',
'to_number(decode(c.ClosingCreditAmount, 0, null, round(c.ClosingCreditAmount,2))) AS creditclosing,',
'CASE WHEN NVL(:P400_WITHINDENT,''NO'')=''YES'' then',
'	    rpad(''-'',15 * (C.AccountLevel - (nvl( (TO_NUMBER(:P400_AccountLevel,99)),1)) ),''-'')  || A.PARTYNAME',
'	else',
'		A.PARTYNAME		',
'end ACCOUNTNAMEDISPLAY ,',
'',
'CASE WHEN C.AccountLevel  = nvl(:P400_AccountLevel,1) or NVL(:P400_LedgerOnly, ''NO'') = ''YES''  then',
'       c.OpeningDebitAmount  ',
'     ELSE',
'        0',
'END  DebitOpeningC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P400_AccountLevel,1) or NVL(:P400_LedgerOnly, ''NO'') = ''YES''  then',
'       c.OpeningCreditAmount ',
'     ELSE',
'        0',
'END  CreditOpeningC,',
'CASE WHEN C.AccountLevel  = nvl(:P400_AccountLevel,1) or NVL(:P400_LedgerOnly, ''NO'') = ''YES''  then',
'       c.DebitAmount  ',
'     ELSE',
'        0',
'END  DebitAmountC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P400_AccountLevel,1) or NVL(:P400_LedgerOnly, ''NO'') = ''YES''  then',
'       c.CreditAmount ',
'     ELSE',
'        0',
'END  CreditAmountC,',
'CASE WHEN C.AccountLevel  = nvl(:P400_AccountLevel,1) or NVL(:P400_LedgerOnly, ''NO'') = ''YES''  then',
'       c.ClosingDebitAmount  ',
'     ELSE',
'        0',
'END  DebitClosingC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P400_AccountLevel,1) or NVL(:P400_LedgerOnly, ''NO'') = ''YES''  then',
'       c.ClosingCreditAmount ',
'     ELSE',
'        0',
'END  CreditClosingC',
'',
'',
'',
'FROM ',
'Party a, ApexTrialBalanceRevisedGroup c',
'WHERE C.CREATOR = V(''APP_USER'')',
'AND a.PartyCode = c.AccountCode',
'and (',
'     exists (',
'           select',
'                aa.ChildCode',
'           from MyAccountIncludeRevised aa',
'           where aa.CompanyCode = :P400_CompanyCode',
'               and aa.FromDate = TO_DATE(:P400_FROMDATE,''DD-MM-RRRR'')',
'               and aa.ToDate = TO_DATE(:P400_TODATE,''DD-MM-RRRR'')',
'               and (:P400_LOCATIONCODE is null or instr('':''||:P400_LocationCode||'':'','':''||aa.LocationCode||'':'') > 0 )',
'               --and nvl(aa.LocationCode, ''NULL'') = nvl(:P400_LocationCode, ''NULL'')',
'              -- and aa.AccountCode = :P400_AccountCode',
'               and instr('':''||:P400_AccountCode_1||'':'','':''||aa.AccountCode||'':'') > 0',
'               and aa.ChildCode = a.PartyCode',
'     )',
'     or',
'     :P400_AccountCode is null',
')',
'',
'and ( ',
'     nvl(:P400_LedgerOnly,''NO'') = ''YES''          ',
'     or',
'     c.AccountLevel <= nvl(:P400_ACCOUNTLEVEL,1)',
')',
'',
'/*and ( ',
'     nvl(:P400_LedgerOnly,''NO'') = ''NO'' ',
'     OR',
'     a.PartyTypeCode != ''ACCOUNTGROUP''',
')',
'*/',
'and (',
'     nvl(:P400_IncludeZeroTransaction ,''NO'') = ''YES''',
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
'     nvl(:P400_Exclude0Closing ,''NO'') = ''NO''',
'     or (',
'         ROUND(nvl(c.OpeningAmount,0) - nvl(c.DebitAmount,0) + nvl(c.CreditAmount,0)   - nvl(c.PDebitAmount,0) + nvl(c.PCreditAmount,0), 2) != 0',
'     )     ',
')',
'',
'and c.FromDate = TO_DATE(:P400_FROMDATE,''DD-MM-RRRR'')',
'and c.ToDate = TO_DATE(:P400_TODATE,''DD-MM-RRRR'')',
'and c.IncludeChild = nvl(:P400_IncludeChild , ''NO'')',
'and c.CompanyCode = :P400_CompanyCode',
'and nvl(c.LocationCode, ''null'') = nvl(:P400_Locationcode, ''null'') ',
'',
'ORDER BY c.TrialBalancePosition, a.PartyName ;',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P400_FROMDATE,P400_TODATE,P400_DETAILLEVEL,P400_FINANCIALYEARCODE,P400_COMPANYCODE,P400_PRINTDRCR,P400_LOCATIONCODE,P400_LEDGERONLY,P400_INCLUDECHILD,P400_INCLUDEZEROTRANSACTION,P400_EXCLUDE0CLOSING,P400_ACCOUNTLEVEL,P400_WITHINDENT,P400_ACCOUNTCODE,'
||'P400_ACCOUNTCODE_1'
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
 p_id=>wwv_flow_imp.id(799729670681329941)
,p_max_row_count=>'1000000'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>782262658556100625
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653354649793929229)
,p_db_column_name=>'ACCOUNTLEVEL'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'Accountlevel'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653359030364929231)
,p_db_column_name=>'ACCOUNTNAMEDISPLAY'
,p_display_order=>30
,p_column_identifier=>'U'
,p_column_label=>'ACCOUNT NAME DISPLAY'
,p_column_link=>'f?p=&APP_ID.:401:&SESSION.::&DEBUG.:RP,401:P401_FROMDATE,P401_TODATE,P401_ACCOUNTCODE,P401_ACCOUNTLEVEL,P401_LEDGERONLY,P401_LOCATIONCODE,P401_WITHINDENT:&P400_FROMDATE.,&P400_TODATE.,#PARTYCODE#,#ACCOUNTLEVEL#,&P400_LEDGERONLY.,&P400_LOCATIONCODE.,Y'
||'ES'
,p_column_linktext=>'#ACCOUNTNAMEDISPLAY#'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653353842049929229)
,p_db_column_name=>'CCURRENTPOSITION'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Ccurrentposition'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653355055944929229)
,p_db_column_name=>'CLOSINGAMOUNT'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Closingamount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653355828817929230)
,p_db_column_name=>'CREDITAMOUNT'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'CREDIT AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653351834565929228)
,p_db_column_name=>'CREDITAMOUNTC'
,p_display_order=>180
,p_column_identifier=>'Y'
,p_column_label=>'Creditamountc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162271357946782983)
,p_db_column_name=>'CREDITCLOSING'
,p_display_order=>140
,p_column_identifier=>'AC'
,p_column_label=>'CREDIT CLOSING'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653352628297929228)
,p_db_column_name=>'CREDITCLOSINGC'
,p_display_order=>200
,p_column_identifier=>'AA'
,p_column_label=>'Creditclosingc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653351051506929227)
,p_db_column_name=>'CREDITOPENINGC'
,p_display_order=>160
,p_column_identifier=>'W'
,p_column_label=>'Creditopeningc'
,p_column_html_expression=>'<div style="display:block; width:100px">#CREDITOPENINGC#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653355454975929229)
,p_db_column_name=>'DEBITAMOUNT'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'DEBIT AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653351494836929227)
,p_db_column_name=>'DEBITAMOUNTC'
,p_display_order=>170
,p_column_identifier=>'X'
,p_column_label=>'Debitamountc'
,p_column_html_expression=>'<div style="display:block; width:100px">#DEBITAMOUNTC#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162271278637782982)
,p_db_column_name=>'DEBITCLOSING'
,p_display_order=>130
,p_column_identifier=>'AB'
,p_column_label=>'DEBIT CLOSING'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653352273821929228)
,p_db_column_name=>'DEBITCLOSINGC'
,p_display_order=>190
,p_column_identifier=>'Z'
,p_column_label=>'Debitclosingc'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653350710731929227)
,p_db_column_name=>'DEBITOPENINGC'
,p_display_order=>150
,p_column_identifier=>'V'
,p_column_label=>'Debitopeningc'
,p_column_html_expression=>'<div style="display:block; width:100px">#DEBITOPENINGC#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162271470226782984)
,p_db_column_name=>'OPENINGAMOUNT'
,p_display_order=>220
,p_column_identifier=>'AD'
,p_column_label=>'Openingamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162271635839782986)
,p_db_column_name=>'OPENINGCREDITAMOUNT'
,p_display_order=>100
,p_column_identifier=>'AF'
,p_column_label=>'OPENING CREDIT AMOUNT'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162271539068782985)
,p_db_column_name=>'OPENINGDEBITAMOUNT'
,p_display_order=>90
,p_column_identifier=>'AE'
,p_column_label=>'OPENING DEBIT AMOUNT'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653353049945929228)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653353430249929229)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>60
,p_column_identifier=>'B'
,p_column_label=>'ACCOUNT NAME'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(653354304559929229)
,p_db_column_name=>'PARTYTYPECODE'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Partytypecode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162271805829782988)
,p_db_column_name=>'PCREDITAMOUNT'
,p_display_order=>240
,p_column_identifier=>'AH'
,p_column_label=>'Pcreditamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(162271783206782987)
,p_db_column_name=>'PDEBITAMOUNT'
,p_display_order=>230
,p_column_identifier=>'AG'
,p_column_label=>'Pdebitamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(799782940816506557)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'133057'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'ACCOUNTNAMEDISPLAY:OPENINGDEBITAMOUNT:OPENINGCREDITAMOUNT:DEBITAMOUNT:CREDITAMOUNT:DEBITCLOSING:CREDITCLOSING'
,p_sum_columns_on_break=>'OPENINGDEBITAMOUNT:OPENINGCREDITAMOUNT:DEBITAMOUNT:CREDITAMOUNT:DEBITCLOSING:CREDITCLOSING'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(664779308689273882)
,p_plug_name=>'PassFailButtons'
,p_static_id=>'passfailbuttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noBorder'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'AFTER_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_landmark_type=>'region'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53734891893266592659)
,p_plug_name=>'Trial Balance '
,p_static_id=>'trial-balance'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody:t-Form--slimPadding'
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
 p_id=>wwv_flow_imp.id(35715887683393782)
,p_button_sequence=>230
,p_button_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_icon_css_classes=>'fa-save'
,p_grid_column_css_classes=>'1'
,p_grid_new_row=>'Y'
,p_grid_column_span=>4
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35699622300393761)
,p_button_sequence=>30
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--danger:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'PREVIOUS'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35700084757393762)
,p_button_sequence=>40
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P400_TNO.'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35702375559393765)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35715438176393782)
,p_button_sequence=>230
,p_button_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35700821690393762)
,p_button_sequence=>60
,p_button_name=>'Post'
,p_static_id=>'post'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Post'
,p_button_position=>'PREVIOUS'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'Are you want to post this transaction?'
,p_confirm_style=>'warning'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-location-arrow fa'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35701633274393762)
,p_button_sequence=>220
,p_button_name=>'Print'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--primary:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'PREVIOUS'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35716213861393782)
,p_button_sequence=>240
,p_button_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--success:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-save'
,p_grid_column_css_classes=>'1'
,p_grid_new_row=>'N'
,p_grid_column_span=>4
,p_grid_column=>5
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35716692128393782)
,p_button_sequence=>250
,p_button_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_button_name=>'RefreshOpenig'
,p_static_id=>'refreshopenig'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh Opening From P. Year'
,p_warn_on_unsaved_changes=>null
,p_confirm_message=>'!!  Really Want to Refresh Opening !!!'
,p_confirm_style=>'warning'
,p_icon_css_classes=>'fa-save'
,p_grid_column_css_classes=>'1'
,p_grid_new_row=>'N'
,p_grid_column_span=>4
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35701233023393762)
,p_button_sequence=>210
,p_button_name=>'show'
,p_static_id=>'show'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Show'
,p_button_position=>'PREVIOUS'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35700444361393762)
,p_button_sequence=>50
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_static_id=>'STATUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--small:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P84_STATUS.'
,p_button_position=>'PREVIOUS'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653419123217929429)
,p_name=>'P400_ACCOUNTCODE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
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
'where exists ( select 1 from partycompany aa where aa.tno= p.tno and aa.companycode = :global_companycode)',
'Order By 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(163269350216367206)
,p_name=>'P400_ACCOUNTCODE_1'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653419932633929429)
,p_name=>'P400_ACCOUNTLEVEL'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_prompt=>'Detail Level'
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
 p_id=>wwv_flow_imp.id(145076073939714026)
,p_name=>'P400_BIREPORTURL'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(656567355144648721)
,p_name=>'P400_CALLEDFROMPAGE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_item_default=>'103'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653423106563929430)
,p_name=>'P400_COMPANYCODE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653421556475929430)
,p_name=>'P400_DETAILLEVEL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653422657788929430)
,p_name=>'P400_DIVISIONWISE'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'YES'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653422294380929430)
,p_name=>'P400_EXCLUDE0CLOSING'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
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
 p_id=>wwv_flow_imp.id(142516193819853736)
,p_name=>'P400_EXCLUDE0CLOSING_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653423555824929430)
,p_name=>'P400_FINANCIALYEARCODE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(658850473617216459)
,p_name=>'P400_FORMSTATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653416743386929428)
,p_name=>'P400_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'GLOBAL_FINANCIALYEARBEGIN'
,p_item_default_type=>'ITEM'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_format_mask=>'DD-MM-YYYY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>35
,p_colspan=>4
,p_grid_column=>1
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
 p_id=>wwv_flow_imp.id(653421094492929430)
,p_name=>'P400_INCLUDECHILD'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_prompt=>'Include Child'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>4
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
 p_id=>wwv_flow_imp.id(142515988048853734)
,p_name=>'P400_INCLUDECHILD_1'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653421945046929430)
,p_name=>'P400_INCLUDEZEROTRANSACTION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_prompt=>'Include ZeroTransaction'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_column=>7
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
 p_id=>wwv_flow_imp.id(142516103290853735)
,p_name=>'P400_INCLUDEZEROTRANSACTION_1'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653420689053929429)
,p_name=>'P400_LEDGERONLY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Ledger Only'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_colspan=>3
,p_grid_column=>1
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
 p_id=>wwv_flow_imp.id(142515913237853733)
,p_name=>'P400_LEDGERONLY_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653418689044929429)
,p_name=>'P400_LOCATIONCODE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'SELECT 1 FROM PARTY WHERE 1 != 1'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'Location'
,p_placeholder=>'Enter Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'Select LocationName d, LocationCode r From Location Where ISDIVISION = ''YES'''
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(665325126019337275)
,p_name=>'P400_MODULEFLOW'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653417905425929429)
,p_name=>'P400_NARRATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653419550571929429)
,p_name=>'P400_NEW'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(665324977558337274)
,p_name=>'P400_ONTHETABLE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(666577280653622620)
,p_name=>'P400_PASSFAILREMARK'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653418300651929429)
,p_name=>'P400_PRINTDRCR'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'STATE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653420273354929429)
,p_name=>'P400_REPORTTITLE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'Account Ledger'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(588797041682582780)
,p_name=>'P400_STATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'STATUS'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(666577117008622619)
,p_name=>'P400_STATUSRIGHT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select B.STATUSPRIVILEGE',
'  From module a, moduleprivilege b, bossuser c',
' Where a.modulecode = b.modulecode',
'   And b.bossusercode = c.bossusercode',
'   And c.loginname = :GLOBAL_LOGINNAME',
'   And A.ENTRYPAGENO = :APP_PAGE_ID',
'   AND B.COMPANYCODE = :GLOBAL_COMPANYCODE'))
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(653417126793929428)
,p_name=>'P400_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_item_default=>'SELECT TRUNC(SYSDATE) FROM DUAL;'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>35
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(653417494122929428)
,p_name=>'P400_WITHINDENT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(53734891893266592659)
,p_use_cache_before_default=>'NO'
,p_prompt=>'With Indent'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(142515844012853732)
,p_name=>'P400_WITHINDENT_1'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(664779308689273882)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35730042751393790)
,p_name=>'DocumentStatus'
,p_static_id=>'documentstatus'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35700444361393762)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35733039323393791)
,p_event_id=>wwv_flow_imp.id(35730042751393790)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(35700444361393762)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P400_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35732546437393791)
,p_event_id=>wwv_flow_imp.id(35730042751393790)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-enable'
,p_action=>'NATIVE_ENABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(35700444361393762)
,p_client_condition_type=>'NOT_EQUALS'
,p_client_condition_element=>'P400_STATUS'
,p_client_condition_expression=>'ACTIVE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35731073490393791)
,p_event_id=>wwv_flow_imp.id(35730042751393790)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P400_TNO,P400_STATUS',
  'language', 'PLSQL',
  'plsql_code', 'SetDocumentStatusCode(GetModuleCodeForPageNo(:APP_PAGE_ID),:P400_TNO,:P400_STATUS);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35731591635393791)
,p_event_id=>wwv_flow_imp.id(35730042751393790)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(35700444361393762)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#STATUS span'').text('''');',
    '$(''#STATUS'').text($v(''P400_STATUS''));',
    '',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35732024224393791)
,p_event_id=>wwv_flow_imp.id(35730042751393790)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(664779308689273882)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35730571780393791)
,p_event_id=>wwv_flow_imp.id(35730042751393790)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_STATUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35733435156393791)
,p_name=>'Enable Disable Buttons Based On Module Flow'
,p_static_id=>'enable-disable-buttons-based-on-module-flow'
,p_event_sequence=>60
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35733924115393791)
,p_event_id=>wwv_flow_imp.id(35733435156393791)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-disable'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(35702375559393765)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P400_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35734431362393792)
,p_event_id=>wwv_flow_imp.id(35733435156393791)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_static_id=>'native-disable-2'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(35699622300393761)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P400_ONTHETABLE'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35734973432393792)
,p_event_id=>wwv_flow_imp.id(35733435156393791)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_static_id=>'native-disable-3'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(35700444361393762)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P400_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35735440006393792)
,p_event_id=>wwv_flow_imp.id(35733435156393791)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_static_id=>'native-disable-4'
,p_action=>'NATIVE_DISABLE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(35700084757393762)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P400_MODULEFLOW'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35728137179393790)
,p_name=>'Fail'
,p_static_id=>'fail'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35699622300393761)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35729194888393790)
,p_event_id=>wwv_flow_imp.id(35728137179393790)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P400_TNO,P400_COMPANYCODE,P400_PURCHASEORDERNO',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    '		cursor cPassFail is',
    '				select',
    '						a.TNo,',
    '						a.TokenNo										',
    '				from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '				where a.ModuleFlowTNo = b.TNo',
    '						and b.TNo = c.TNo',
    '						and a.BossUserCode = c.BossUserCode',
    '						and c.BossUserCode = d.BossUserCode',
    '						and a.ModuleTNo = '':P''||to_char(:APP_PAGE_ID)||''_TNo''',
    '						and d.LoginName = User',
    '						and a.isPass is null',
    '						and a.IsFail is null',
    '						and a.IsForwarded is null',
    '						and a.IsRebounded is null																				',
    '		;',
    '		vPassFail cPassFail%rowtype;',
    '    ',
    '    tTokenNo NUMBER;',
    '    TMP VARCHAR2(100) := :P60_TNO;',
    'begin',
    '		open cPassFail;',
    '		fetch cPassFail into vPassFail;',
    '		if cPassFail%FOUND then',
    '				tTokenNo := vPassFail.TokenNo;',
    '				close cPassFail;',
    '',
    '           	',
    '				update PassFail a',
    '				set a.IsFail = ''YES'',',
    '						a.remark = '':P''||to_char(:APP_PAGE_ID)||''_PASSFAILREMARK''',
    '				where a.TNo = vPassFail.TNo;',
    '				',
    '				SendBackPassFail(tTokenNo , TMP );',
    '		    		',
    '				',
    '				commit;',
    '		else',
    '				close cPassFail;',
    '		end if;',
    '',
    '	',
    'end;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35729690387393790)
,p_event_id=>wwv_flow_imp.id(35728137179393790)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(664779308689273882)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35728612967393790)
,p_event_id=>wwv_flow_imp.id(35728137179393790)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P400_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35743769606393794)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>130
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35715438176393782)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35744297565393794)
,p_event_id=>wwv_flow_imp.id(35743769606393794)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35724837970393789)
,p_name=>'New_1'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35701233023393762)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35725397931393789)
,p_event_id=>wwv_flow_imp.id(35724837970393789)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35725893638393789)
,p_event_id=>wwv_flow_imp.id(35724837970393789)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_LEDGERONLY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P400_LEDGERONLY',
  'sql_query', 'SELECT :P400_LEDGERONLY FROM DUAL;',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35747880024393795)
,p_name=>'New_9'
,p_static_id=>'new-10'
,p_event_sequence=>170
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35716692128393782)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35748318697393795)
,p_event_id=>wwv_flow_imp.id(35747880024393795)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', 'RefreshOpening(:global_FinancialYearCode, :global_CompanyCode);',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35748912087393795)
,p_event_id=>wwv_flow_imp.id(35747880024393795)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35735871763393792)
,p_name=>'New'
,p_static_id=>'new-2'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_WITHINDENT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35736902899393792)
,p_event_id=>wwv_flow_imp.id(35735871763393792)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35736410573393792)
,p_event_id=>wwv_flow_imp.id(35735871763393792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_WITHINDENT_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P400_WITHINDENT',
  'plsql_expression', ':P400_WITHINDENT',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35737244024393792)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_ACCOUNTLEVEL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35737747066393792)
,p_event_id=>wwv_flow_imp.id(35737244024393792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35738163255393792)
,p_name=>'New_3'
,p_static_id=>'new-4'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_LEDGERONLY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35739165640393793)
,p_event_id=>wwv_flow_imp.id(35738163255393792)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35738691242393793)
,p_event_id=>wwv_flow_imp.id(35738163255393792)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_LEDGERONLY_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P400_LEDGERONLY',
  'plsql_expression', ':P400_LEDGERONLY',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35739591285393793)
,p_name=>'New_4'
,p_static_id=>'new-5'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_INCLUDEZEROTRANSACTION'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35740525711393793)
,p_event_id=>wwv_flow_imp.id(35739591285393793)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35740056144393793)
,p_event_id=>wwv_flow_imp.id(35739591285393793)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_INCLUDEZEROTRANSACTION_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P400_INCLUDEZEROTRANSACTION',
  'plsql_expression', ':P400_INCLUDEZEROTRANSACTION',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35740937073393793)
,p_name=>'New_5'
,p_static_id=>'new-6'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_EXCLUDE0CLOSING'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35741914973393793)
,p_event_id=>wwv_flow_imp.id(35740937073393793)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35741504010393793)
,p_event_id=>wwv_flow_imp.id(35740937073393793)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_EXCLUDE0CLOSING_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P400_EXCLUDE0CLOSING',
  'plsql_expression', ':P400_EXCLUDE0CLOSING',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35742321207393794)
,p_name=>'New_6'
,p_static_id=>'new-7'
,p_event_sequence=>120
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_INCLUDECHILD'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35743326154393794)
,p_event_id=>wwv_flow_imp.id(35742321207393794)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35742899842393794)
,p_event_id=>wwv_flow_imp.id(35742321207393794)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_INCLUDECHILD_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P400_INCLUDECHILD',
  'plsql_expression', ':P400_INCLUDECHILD',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35745563651393794)
,p_name=>'New_7'
,p_static_id=>'new-8'
,p_event_sequence=>150
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P400_ACCOUNTCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'focusout'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35746593107393795)
,p_event_id=>wwv_flow_imp.id(35745563651393794)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35746030288393794)
,p_event_id=>wwv_flow_imp.id(35745563651393794)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_ACCOUNTCODE_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P400_FROMDATE,P400_TODATE,P400_DETAILLEVEL,P400_FINANCIALYEARCODE,P400_COMPANYCODE,P400_PRINTDRCR,P400_LOCATIONCODE,P400_LEDGERONLY,P400_INCLUDECHILD,P400_INCLUDEZEROTRANSACTION,P400_EXCLUDE0CLOSING,P400_ACCOUNTLEVEL,P400_WITHINDENT,P400_ACCOUNTCODE,'
||'P400_ACCOUNTCODE_1',
  'plsql_expression', ':P400_ACCOUNTCODE',
  'suppress_change_event', 'N',
  'type', 'PLSQL_EXPRESSION')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35747005835393795)
,p_name=>'New_8'
,p_static_id=>'new-9'
,p_event_sequence=>160
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35716213861393782)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35747470113393795)
,p_event_id=>wwv_flow_imp.id(35747005835393795)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(799500938229613050)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35726236456393789)
,p_name=>'Pass'
,p_static_id=>'pass'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35702375559393765)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35727287037393790)
,p_event_id=>wwv_flow_imp.id(35726236456393789)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P400_TNO,P400_COMPANYCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'DECLARE',
    '  tModuleCode  Varchar2(30);',
    '  TMP          vARCHAR2(100) ;--:= :P80_PICKUPREQUESTNO;',
    'cursor cPassFail is',
    '		select',
    '				a.TNo',
    '		from PassFail a, ModuleFlow b, ModuleFlowUser c, BossUser d',
    '		where a.ModuleFlowTNo = b.TNo',
    '				and b.TNo = c.TNo',
    '				and a.BossUserCode = c.BossUserCode',
    '				and c.BossUserCode = d.BossUserCode',
    '				and a.ModuleTNo = '':P''||:APP_PAGE_ID||''_TNo''',
    '				and d.LoginName = User',
    '				and a.isPass is null',
    '				and a.IsFail is null',
    '				and a.IsForwarded is null',
    '				and a.IsRebounded is null										',
    ';',
    'vPassFail cPassFail%rowtype;',
    'BEGIN',
    '',
    '    select',
    '    	d.ModuleCode, '':P''||:APP_PAGE_ID||''_''||labelcolumnname ',
    '                into tModuleCode,tmp',
    '    from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
    '    where a.LocationCode = b.LocationCode',
    '    	and b.tno = c.tno',
    '    	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
    '    	and c.CompanyCode = :global_CompanyCode',
    '        and d.EntryPageNo = :APP_PAGE_ID',
    '        ;',
    '',
    '			',
    '	open cPassFail;',
    '	fetch cPassFail into vPassFail;',
    '	if cPassFail%FOUND then',
    '			',
    '		',
    '			update PassFail a',
    '			set a.IsPass = ''YES'',',
    '				a.remark = '':P''||:APP_PAGE_ID||''_PASSFAILREMARK''',
    '			where a.TNo = vPassFail.TNo;',
    '			',
    '			close cPassFail;',
    '			',
    '			',
    '			SendPassFailForward(tModuleCode, '':P''||:APP_PAGE_ID||''_TNo'' , TMP, :global_CompanyCode );',
    '',
    '    end if;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35727755400393790)
,p_event_id=>wwv_flow_imp.id(35726236456393789)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(664779308689273882)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35726749858393790)
,p_event_id=>wwv_flow_imp.id(35726236456393789)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_PASSFAILREMARK'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P400_REMARK',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35744685784393794)
,p_name=>'set check box values'
,p_static_id=>'set-check-box-values'
,p_event_sequence=>140
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35745199993393794)
,p_event_id=>wwv_flow_imp.id(35744685784393794)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P400_WINTHINDENT_1,P400_LEDGERONLY_1,P400_INCLUDECHILD_1,P400_INCLUDEZEROTRANSACTION_1,P400_EXCLUDE0CLOSING_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P400_WINTHINDENT,P400_LEDGERONLY,P400_INCLUDECHILD,P400_INCLUDEZEROTRANSACTION,P400_EXCLUDE0CLOSING',
  'sql_query', 'select :P400_WINTHINDENT,:P400_LEDGERONLY,:P400_INCLUDECHILD,:P400_INCLUDEZEROTRANSACTION,:P400_EXCLUDE0CLOSING FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35723626399393788)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'create'
,p_static_id=>'create'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'BEGIN',
'		declare',
'            	tFromDate Date := to_date(:P400_FromDate,''DD-MM-RRRR'');',
'				tToDate Date := to_date(:P400_ToDate,''DD-MM-RRRR'');',
'				tStartDate Date := GetFinancialYearBegin(:P400_FinancialYearCode);',
'				tDetailLevel number := :P400_DetailLevel;',
'                tFinancialyearcode  varchar2(30) ;',
'				tLedgerOnly Varchar2(30) := :P400_LedgerOnly;',
'				tIncludeChild Varchar2(30) := :P400_IncludeChild;		',
'				tLocationCode Varchar2(30) := :P400_LocationCode;',
'				tLocationName Varchar2(2000) := :P400_LocationName;',
'				tDivisionWise Varchar2(3) := :P400_DivisionWise;',
'		begin ',
'                Select aa.financialyearcode,aa.financialyearbegin ',
'                into tFinancialyearcode,tStartDate',
'                From financialyear aa',
'                Where to_date(:p400_fromdate,''DD-MM-RRRR'') Between aa.financialyearbegin And aa.financialyearend ;',
' ',
'                ',
'                DELETE FROM MyAccountIncludeRevised ',
'                WHERE CREATOR = ''&APP_USER.'' ;',
'                ',
'                DELETE FROM MyAccountIncludeRevised ',
'                WHERE CREATOR = ''APEX_PUBLIC_USER'' ;',
'                           ',
'                ',
'                CreateMyAccountIncludeRevised(:P400_CompanyCode, tLocationCode, tFromDate, tToDate);',
'                --RefreshMyAccountIncludeForAll;',
'  ',
'                 UPDATE MyAccountIncludeRevised ',
'                  SET CREATOR = ''&APP_USER.''',
'                WHERE CREATOR = ''APEX_PUBLIC_USER'' ;',
'   ',
'                ',
'                /*----------------------------',
'				-- EXECUTE REFRESH OPENING ON INSTRUCTION FROM TIWARI SIR DATE 30 APR 2018',
'				*/',
'               RefreshOpening(nvl(:P400_FinancialYearCode,tFinancialyearcode), :P400_CompanyCode);			',
'				',
'				/*----------------------------*/',
'				',
'				delete ',
'						from TrialBalanceRevised a ',
'						where a.CompanyCode = :P400_CompanyCode',
'								and nvl(a.LocationCode, ''null'') = nvl(tLocationCode, ''null'')',
'								and a.FromDate = tFromDate',
'								and a.ToDate = tToDate',
'								--and a.Creator = ''&APP_USER.''',
'				;',
'				',
'				',
'				insert into TrialBalanceRevised(',
'						LocationCode,',
'						CompanyCode,',
'						Accountcode,',
'						FromDate,',
'						ToDate,',
'						OpeningAmount,',
'						DebitAmount,',
'						CreditAmount,',
'						PDebitAmount,',
'						PCreditAmount,',
'						IncludeChild',
'				) ',
'					select',
'							tLocationCode,',
'							:P400_companycode,',
'							a.PartyCode,',
'							tFromDate,',
'							tToDate,',
'							b.OpeningAmount,',
'							b.DebitAmount,',
'							b.CreditAmount,',
'							b.PDebitAmount,',
'							b.PCreditAmount,',
'							nvl(tIncludeChild, ''NO'')',
'					from Party a, (',
'							select',
'								a11.AccountCode,',
'								sum(a11.OpeningAmount) as OpeningAmount,',
'								sum(a11.DebitAmount) as DebitAmount,',
'								sum(a11.CreditAmount) as CreditAmount,',
'								sum(a11.PDebitAmount) as PDebitAmount,',
'								sum(a11.PCreditAmount) as PCreditAmount	',
'							from (',
'								select',
'									nvl(tLocationCode, a1.LocationCode) as LocationCode,',
'									a1.AccountCode,',
'									a1.OpeningAmount as OpeningAmount,',
'									null DebitAmount,',
'									null as CreditAmount,',
'									null as PDebitAmount,',
'									null as PCreditAmount',
'								from Opening a1',
'								where a1.CompanyCode = :P400_CompanyCode',
'									and a1.OpeningDate = tStartDate',
'									-- date 02-jna-2020',
'									 and a1.LocationCode = nvl(tLocationCode, a1.LocationCode)',
'								',
'									----------------------------------- --*/',
'								',
'								union all',
'								select',
'									nvl(tLocationCode, a1.LocationCode) as LocationCode,',
'									a1.AccountCode,',
'									a1.Amount as OpeningAmount,',
'									null DebitAmount,',
'									null as CreditAmount,',
'									null as PDebitAmount,',
'									null as PCreditAmount',
'								from VoucherDetail a1, Voucher a2',
'								where a2.CompanyCode = :P400_CompanyCode',
'                                  and a1.tno = a2.tno',
'								  and a1.VoucherDate between tStartDate and (tFromDate-1)',
'								  and a1.LocationCode = nvl(tLocationCode, a1.LocationCode)',
'								',
'								/*	----------------------------------- --',
'								--',
'                                  */  ',
'								union all',
'								select',
'									nvl(tLocationCode, a1.LocationCode) as LocationCode,',
'									a1.AccountCode,',
'									null as OpeningAmount,',
'									-1 *a1.Amount DebitAmount,',
'									null as CreditAmount,',
'									null as PDebitAmount,',
'									null as PCreditAmount',
'								from VoucherDetail a1, Voucher a2',
'								where a1.Amount < 0',
'                                  and a1.tno = a2.tno',
'								  and a2.CompanyCode = :P400_CompanyCode',
'								  and a1.VoucherDate between tFromDate and tToDate				',
'								  and a1.LocationCode = nvl(tLocationCode, a1.LocationCode)',
'								',
'								/*	----------------------------------- --',
'								--',
'                                 */',
'								union all',
'								select',
'									nvl(tLocationCode, a1.LocationCode) as LocationCode,',
'									a1.AccountCode,',
'									null as OpeningAmount,',
'									null as DebitAmount,',
'									a1.Amount as CreditAmount,',
'									null as PDebitAmount,',
'									null as PCreditAmount',
'								from VoucherDetail a1, Voucher a2',
'								where a1.Amount > 0',
'                                  and a1.tno = a2.tno',
'								  and a2.CompanyCode = :P400_CompanyCode',
'								  and a1.VoucherDate between tFromDate and tToDate',
'								 and a1.LocationCode = nvl(tLocationCode, a1.LocationCode)',
'								',
'								/*	----------------------------------- --',
'								--',
'                                */',
'															',
'							) a11',
'							group by',
'                           a11.AccountCode						',
'					) b',
'					where a.PartyTypeCode != ''ACCOUNTGROUP''',
'							and a.PartyCode = b.AccountCode',
'				;',
'				',
'						',
'				update TrialBalanceRevised a',
'						set a.ClosingAmount = nvl(a.OpeningAmount,0) - nvl(a.Debitamount,0) +  nvl(a.CreditAmount,0) - nvl(a.PDebitamount,0) +  nvl(a.PCreditAmount,0),',
'                        CREATOR = ''&APP_USER.''',
'				where a.CompanyCode = :P400_CompanyCode',
'						and a.FromDate = tFromDate',
'						and a.ToDate = tToDate',
'						and nvl(a.IncludeChild,''NO'') = nvl(tIncludeChild, ''NO'' )',
'				;',
'				',
'				commit;',
'				/*CreateMyAccountIncludeRevised(:P400_CompanyCode, tLocationCode, tFromDate, tToDate);*/',
'				commit;',
'/*				',
'				:P400_FromDate := tFromDate;',
'				:P400_ToDate := tToDate;',
'				:P400_LedgerOnly := tLedgerOnly;',
'				:P400_IncludeChild := tIncludeChild;',
'				:P400_DetailLevel := tDetailLevel;',
'				',
'				:P400_LocationCode := tLocationCode;',
'				:P400_LocationName := tLocationName;',
'				:P400_DivisionWise := tDivisionWise;',
'				',
'				go_block(''masterblock'');',
'				',
'				execute_query(no_validate);',
'				',
'				clear_message;',
'*/				',
'		end;  ',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>18256614274164472
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35724047529393788)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GetOnTheTable'
,p_static_id=>'getonthetable'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'tmp  number;',
'tmp1 number;',
'begin',
' -------- Checking Module Flow Prepared Or Not ',
'   select count(*) into tmp1 from moduleflow where modulecode = getModuleCodeForPageNo(:APP_PAGE_ID) and getdocumentstatuscode(''MODULEFLOW'',TNO)=''ACTIVE'';',
'   if nvl(tmp1,0) > 0 then',
'       :P400_MODULEFLOW := ''YES'';',
'   else',
'       :P400_MODULEFLOW := ''NO'';',
'   end if;',
'  ',
'  ----- Checking On The Table ',
'   select count(*) into tmp from onthetable_apex where moduletno = :P71_TNO and loginname = :GLOBAL_LOGINNAME;',
'   if nvl(tmp,0) > 0 then',
'      :P400_ONTHETABLE := ''YES'' ;',
'   else',
'       :P400_ONTHETABLE := ''NO'';',
'   end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>18257035404164472
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35723274005393787)
,p_process_sequence=>20
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'loading event'
,p_static_id=>'loading-event'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*if :p400_accountcode is not null then',
'   :p400_detaillevel := NVL(:P400_DETAILLEVEL,1) + 1 ;',
'END IF;',
'*/ ',
'null;'))
,p_process_clob_language=>'PLSQL'
,p_process_is_stateful_y_n=>'Y'
,p_internal_uid=>18256261880164471
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35724488716393788)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Send Pass Fail '
,p_static_id=>'send-pass-fail'
,p_process_sql_clob=>'sendpassfailforward(getModuleCodeForPageNo(:APP_PAGE_ID) , :P400_TNO, :P400_PURCHASEBILLNO||'' :'', :GLOBAL_COMPANYCODE);'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35715887683393782)
,p_internal_uid=>18257476591164472
);
wwv_flow_imp.component_end;
end;
/
