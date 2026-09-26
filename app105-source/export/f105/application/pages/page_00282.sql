prompt --application/pages/page_00282
begin
--   Manifest
--     PAGE: 00282
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
 p_id=>282
,p_name=>'Trial Balance'
,p_alias=>'TRIAL-BALANCE3'
,p_step_title=>'Trial Balance'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'21'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(928588089635800322)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'TREEGRID_IG'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'     LEVEL,',
'     PARTYCODE,',
'     PARTYNAME,',
'     PARENTCODE,',
'     OPENINGAMOUNT,',
'     CLOSINGAMOUNT,',
'     OPENINGDEBITAMOUNT,',
'     OPENINGCREDITAMOUNT,',
'     DEBITAMOUNT,',
'     CREDITAMOUNT,',
'     PDEBITAMOUNT,',
'     DEBITCLOSING,',
'     CREDITCLOSING',
' FROM',
'(',
'SELECT ',
'a.partycode,',
'a.partyname,',
'A.PARENTCODE,',
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
'--CASE WHEN nvl(:P282_LedgerOnly,''NO'') = ''NO'' and A.partytypecode=''ACCOUNTGROUP'' and NVL(:P282_WITHINDENT,''NO'') = ''YES'' then',
'CASE WHEN  A.partytypecode=''ACCOUNTGROUP'' and NVL(:P282_WITHINDENT,''NO'') = ''YES'' then',
'  ',
'      ''<B>''||''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||401||'':''||:APP_SESSION||''::::''||''P282_ACCOUNTCODE,P282_FROMDATE,P282_ACCOUNTLEVEL,P282_ACCOUNTCODE,P282_TODATE,P282_WITHINDENT''||'':''||A.PARTYCODE||'',''||nvl(:P282_FROMDATE,:P400_FRO'
||'MDATE)||'',''||C.ACCOUNTLEVEL ||'',''||A.PARTYCODE||'',''||NVL(:P282_TODATE,:P400_TODATE)||'',''||''YES''||'':NO'')||''">''||rpad(''-'',2 * (C.AccountLevel),''-'')  || A.PARTYNAME||''</a>''||''</b>''',
' ',
'   WHEN   A.partytypecode=''ACCOUNTGROUP'' and NVL(:P282_WITHINDENT,''NO'') = ''NO'' then',
' ',
'      ''<B>''||''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||401||'':''||:APP_SESSION||''::::''||''P282_ACCOUNTCODE,P282_FROMDATE,P282_ACCOUNTLEVEL,P282_ACCOUNTCODE,P282_TODATE,P282_WITHINDENT''||'':''||A.PARTYCODE||'',''||nvl(:P282_FROMDATE,:P400_FRO'
||'MDATE)||'',''||C.ACCOUNTLEVEL ||'',''||A.PARTYCODE||'',''||NVL(:P282_TODATE,:P400_TODATE)||'',''||''YES''||'':NO'')||''">''||A.PARTYNAME||''</a>''||''</b>''',
' ',
'   WHEN  A.partytypecode ! =''ACCOUNTGROUP'' and NVL(:P282_WITHINDENT,''NO'') = ''YES'' then',
'     --  ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':141:''||:APP_SESSION||''::''||''P141_fromdate:''|| c.fromdate||'':''||''P141_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||a.partyname||''</a>''	',
'      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':11:''||:APP_SESSION||''::''||''P11_fromdate:''|| c.fromdate||'':''||''P11_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||rpad(''-'',2 * (C.AccountLevel ),''-'')  || A.PARTYNAME||''</a>''',
' ',
'   WHEN  A.partytypecode ! =''ACCOUNTGROUP'' and NVL(:P282_WITHINDENT,''NO'') = ''NO'' then',
'     --  ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':141:''||:APP_SESSION||''::''||''P141_fromdate:''|| c.fromdate||'':''||''P141_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||a.partyname||''</a>''	',
'      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':11:''||:APP_SESSION||''::''||''P11_fromdate:''|| c.fromdate||'':''||''P11_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||A.PARTYNAME||''</a>''',
'end ACCOUNTNAMEDISPLAY,',
'',
'',
'',
'CASE WHEN C.AccountLevel  = nvl(:P282_AccountLevel,1) or NVL(:P282_LedgerOnly, ''NO'') = ''YES''  then',
'       c.OpeningDebitAmount  ',
'     ELSE',
'        0',
'END  DebitOpeningC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P282_AccountLevel,1) or NVL(:P282_LedgerOnly, ''NO'') = ''YES''  then',
'       c.OpeningCreditAmount ',
'     ELSE',
'        0',
'END  CreditOpeningC,',
'CASE WHEN C.AccountLevel  = nvl(:P282_AccountLevel,1) or NVL(:P282_LedgerOnly, ''NO'') = ''YES''  then',
'       c.DebitAmount  ',
'     ELSE',
'        0',
'END  DebitAmountC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P282_AccountLevel,1) or NVL(:P282_LedgerOnly, ''NO'') = ''YES''  then',
'       c.CreditAmount ',
'     ELSE',
'        0',
'END  CreditAmountC,',
'CASE WHEN C.AccountLevel  = nvl(:P282_AccountLevel,1) or NVL(:P282_LedgerOnly, ''NO'') = ''YES''  then',
'       c.ClosingDebitAmount  ',
'     ELSE',
'        0',
'END  DebitClosingC,    ',
'CASE WHEN C.AccountLevel  = nvl(:P282_AccountLevel,1) or NVL(:P282_LedgerOnly, ''NO'') = ''YES''  then',
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
') X',
'START WITH PARENTCODE IS NULL ',
'CONNECT BY PRIOR PARTYCODE=PARENTCODE',
'/*',
'and (',
'     exists (',
'           select',
'                aa.ChildCode',
'           from MyAccountIncludeRevised aa',
'           where aa.CompanyCode = :P282_CompanyCode',
'               and aa.FromDate = :P282_FROMDATE',
'               and aa.ToDate = :P282_TODATE',
'               and nvl(aa.LocationCode, ''NULL'') = nvl(:P282_LocationCode, ''NULL'')',
'               and aa.AccountCode = :P282_AccountCode',
'               and aa.ChildCode = a.PartyCode',
'     )',
'     or',
'     :P282_AccountCode is null',
')',
'',
'and ( ',
'     nvl(:P282_LedgerOnly,''NO'') = ''YES''          ',
'     or',
'     c.AccountLevel <= nvl(:P282_AccountLevel,1)',
'     ',
')',
'and ( ',
'     nvl(:P282_LedgerOnly,''NO'') = ''NO'' ',
'     OR',
'     a.PartyTypeCode != ''ACCOUNTGROUP''',
')',
'and (',
'     nvl(:P282_IncludeZeroTransaction ,''NO'') = ''YES''',
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
'     nvl(:P282_Exclude0Closing ,''NO'') = ''NO''',
'     or (',
'         ROUND(nvl(c.OpeningAmount,0) - nvl(c.DebitAmount,0) + nvl(c.CreditAmount,0)   - nvl(c.PDebitAmount,0) + nvl(c.PCreditAmount,0), 2) != 0',
'     )     ',
')',
'and c.FromDate = ''&P282_FROMDATE.''--TO_DATE(:P282_FROMDATE,''DD-MM-RRRR'')',
'and c.ToDate = ''&P282_TODATE.''--TO_DATE(:P282_TODATE,''DD-MM-RRRR'')',
'and c.IncludeChild = nvl(:P282_IncludeChild , ''NO'')',
'and c.CompanyCode = :P282_CompanyCode',
'and nvl(c.LocationCode, ''null'') = nvl(:P282_Locationcode, ''null'') ',
'--and ( ''&P282_ACCOUNTCODE.'' IS NULL OR A.PARTYCODE = ''&P282_ACCOUNTCODE.'')',
'*/',
'--ORDER BY TrialBalancePosition, PartyName ;',
''))
,p_plug_source_type=>'NATIVE_IG'
,p_ajax_items_to_submit=>'P282_FROMDATE,P282_TODATE,P282_WITHINDENT,P282_LEDGERONLY,P282_NARRATION,P282_PRINTDRCR,P282_LOCATIONCODE,P282_ACCOUNTCODE,P282_INCLUDECHILD,P282_INCLUDEZEROTRANSACTION,P282_NEW,P282_REPORTTITLE,P282_DIVISIONWISE,P282_ACCOUNTLEVEL,P282_DETAILLEVEL,P2'
||'82_EXCLUDE0CLOSING,P282_COMPANYCODE,P282_FINANCIALYEARCODE'
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
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(928816709225517212)
,p_heading=>'CLOSING'
,p_static_id=>'closing'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(928816604691517211)
,p_heading=>'DURING THE PERIOD'
,p_static_id=>'during-the-period'
);
wwv_flow_imp_page.create_region_column_group(
 p_id=>wwv_flow_imp.id(928816474644517210)
,p_heading=>'OPENING'
,p_static_id=>'opening'
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211997335100077915)
,p_name=>'APEX$ROW_ACTION'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_ACTION'
,p_display_sequence=>20
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211997414684077916)
,p_name=>'APEX$ROW_SELECTOR'
,p_session_state_data_type=>'VARCHAR2'
,p_item_type=>'NATIVE_ROW_SELECTOR'
,p_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'enable_multi_select', 'Y',
  'hide_control', 'N',
  'show_select_all', 'Y')).to_clob
,p_use_as_row_header=>false
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211995783392077899)
,p_name=>'CLOSINGAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CLOSINGAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Closingamount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>100
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211996149376077903)
,p_name=>'CREDITAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREDITAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Creditamount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>140
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211996545001077907)
,p_name=>'CREDITCLOSING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'CREDITCLOSING'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Creditclosing'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>180
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211996009251077902)
,p_name=>'DEBITAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEBITAMOUNT'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Debitamount'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>130
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211996415875077906)
,p_name=>'DEBITCLOSING'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'DEBITCLOSING'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Debitclosing'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>170
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211997659044077918)
,p_name=>'LEVEL'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'LEVEL'
,p_data_type=>'NUMBER'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_NUMBER_FIELD'
,p_heading=>'Level'
,p_heading_alignment=>'RIGHT'
,p_display_sequence=>190
,p_value_alignment=>'RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
,p_is_required=>false
,p_enable_filter=>true
,p_filter_lov_type=>'NONE'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211995622940077898)
,p_name=>'OPENINGAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPENINGAMOUNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Openingamount'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>90
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211995959471077901)
,p_name=>'OPENINGCREDITAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPENINGCREDITAMOUNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Openingcreditamount'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>120
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211995884118077900)
,p_name=>'OPENINGDEBITAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'OPENINGDEBITAMOUNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Openingdebitamount'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>110
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211995298344077894)
,p_name=>'PARENTCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARENTCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Parentcode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>50
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211995060828077892)
,p_name=>'PARTYCODE'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYCODE'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Partycode'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>30
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>true
,p_max_length=>30
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>true
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211995168685077893)
,p_name=>'PARTYNAME'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PARTYNAME'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Partyname'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>40
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>100
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_region_column(
 p_id=>wwv_flow_imp.id(211996214474077904)
,p_name=>'PDEBITAMOUNT'
,p_source_type=>'DB_COLUMN'
,p_source_expression=>'PDEBITAMOUNT'
,p_data_type=>'VARCHAR2'
,p_session_state_data_type=>'VARCHAR2'
,p_is_query_only=>false
,p_item_type=>'NATIVE_TEXT_FIELD'
,p_heading=>'Pdebitamount'
,p_heading_alignment=>'LEFT'
,p_display_sequence=>150
,p_value_alignment=>'LEFT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'trim_spaces', 'BOTH')).to_clob
,p_is_required=>false
,p_max_length=>40
,p_enable_filter=>true
,p_filter_operators=>'C:S:CASE_INSENSITIVE:REGEXP'
,p_filter_text_case=>'MIXED'
,p_filter_exact_match=>true
,p_filter_lov_type=>'DISTINCT'
,p_use_as_row_header=>false
,p_enable_sort_group=>true
,p_enable_control_break=>true
,p_enable_hide=>true
,p_is_primary_key=>false
,p_duplicate_value=>true
,p_include_in_export=>true
);
wwv_flow_imp_page.create_interactive_grid(
 p_id=>wwv_flow_imp.id(211995001003077891)
,p_internal_uid=>12471594929671220
,p_is_editable=>true
,p_edit_operations=>'i:u:d'
,p_lost_update_check_type=>'VALUES'
,p_add_row_if_empty=>true
,p_lazy_loading=>false
,p_requires_filter=>false
,p_select_first_row=>true
,p_fixed_row_height=>true
,p_pagination_type=>'SCROLL'
,p_show_total_row_count=>true
,p_show_toolbar=>true
,p_enable_save_public_report=>false
,p_enable_subscriptions=>true
,p_enable_flashback=>true
,p_define_chart_view=>true
,p_enable_download=>true
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>true
,p_fixed_header=>'PAGE'
,p_show_icon_view=>false
,p_show_detail_view=>false
);
wwv_flow_imp_page.create_ig_report(
 p_id=>wwv_flow_imp.id(212003818086159202)
,p_interactive_grid_id=>wwv_flow_imp.id(211995001003077891)
,p_static_id=>'124805'
,p_type=>'PRIMARY'
,p_default_view=>'GRID'
,p_show_row_number=>false
,p_settings_area_expanded=>true
);
wwv_flow_imp_page.create_ig_report_view(
 p_id=>wwv_flow_imp.id(212004009660159202)
,p_report_id=>wwv_flow_imp.id(212003818086159202)
,p_view_type=>'GRID'
,p_stretch_columns=>true
,p_srv_exclude_null_values=>false
,p_srv_only_display_columns=>true
,p_edit_mode=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(199531395048495231)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>14
,p_column_id=>wwv_flow_imp.id(211997659044077918)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212004574841159206)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>2
,p_column_id=>wwv_flow_imp.id(211995060828077892)
,p_is_visible=>false
,p_is_frozen=>false
,p_width=>179
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212005406493159211)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>3
,p_column_id=>wwv_flow_imp.id(211995168685077893)
,p_is_visible=>true
,p_is_frozen=>false
,p_width=>266
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212006361524159215)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>4
,p_column_id=>wwv_flow_imp.id(211995298344077894)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212009913866159227)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>5
,p_column_id=>wwv_flow_imp.id(211995622940077898)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212010805548159230)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>6
,p_column_id=>wwv_flow_imp.id(211995783392077899)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212011672440159232)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>7
,p_column_id=>wwv_flow_imp.id(211995884118077900)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212012521498159235)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>8
,p_column_id=>wwv_flow_imp.id(211995959471077901)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212013417960159238)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>9
,p_column_id=>wwv_flow_imp.id(211996009251077902)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212014337540159241)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>10
,p_column_id=>wwv_flow_imp.id(211996149376077903)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212015294739159244)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>11
,p_column_id=>wwv_flow_imp.id(211996214474077904)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212017095280159250)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>12
,p_column_id=>wwv_flow_imp.id(211996415875077906)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212017923993159253)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>13
,p_column_id=>wwv_flow_imp.id(211996545001077907)
,p_is_visible=>true
,p_is_frozen=>false
);
wwv_flow_imp_page.create_ig_report_column(
 p_id=>wwv_flow_imp.id(212025138897159276)
,p_view_id=>wwv_flow_imp.id(212004009660159202)
,p_display_seq=>1
,p_column_id=>wwv_flow_imp.id(211997335100077915)
,p_is_visible=>true
,p_is_frozen=>true
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(211984321019075936)
,p_button_sequence=>220
,p_button_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796458834058369739)
,p_name=>'P282_ACCOUNTCODE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796459643474369739)
,p_name=>'P282_ACCOUNTLEVEL'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796462817404369740)
,p_name=>'P282_COMPANYCODE'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796461267316369740)
,p_name=>'P282_DETAILLEVEL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796462368629369740)
,p_name=>'P282_DIVISIONWISE'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_prompt=>'Division Wise'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(796462005221369740)
,p_name=>'P282_EXCLUDE0CLOSING'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796463266665369740)
,p_name=>'P282_FINANCIALYEARCODE'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_item_default=>'GLOBAL_FINANCIALYEARCODE'
,p_item_default_type=>'ITEM'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796456454227369738)
,p_name=>'P282_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796460805333369740)
,p_name=>'P282_INCLUDECHILD'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796461655887369740)
,p_name=>'P282_INCLUDEZEROTRANSACTION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_prompt=>'Include ZeroTransaction'
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
 p_id=>wwv_flow_imp.id(796460399894369739)
,p_name=>'P282_LEDGERONLY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796458399885369739)
,p_name=>'P282_LOCATIONCODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796457616266369739)
,p_name=>'P282_NARRATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796459261412369739)
,p_name=>'P282_NEW'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796458011492369739)
,p_name=>'P282_PRINTDRCR'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_item_default=>'STATE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796459984195369739)
,p_name=>'P282_REPORTTITLE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_item_default=>'Account Ledger'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(731836752523023090)
,p_name=>'P282_STATUS'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
,p_item_default=>'STATUS'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(796456837634369738)
,p_name=>'P282_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(796457204963369738)
,p_name=>'P282_WITHINDENT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53877943426816032845)
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
 p_id=>wwv_flow_imp.id(211991022402075951)
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
 p_id=>wwv_flow_imp.id(211991537926075952)
,p_event_id=>wwv_flow_imp.id(211991022402075951)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'plugin-com-pretius-apex-contextmenu'
,p_action=>'PLUGIN_COM.PRETIUS.APEX.CONTEXTMENU'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(928588089635800322)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'trial_context',
  'attribute_02', 'DAMP:SEP')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211991954760075953)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P282_WITHINDENT,P282_LEDGERONLY,P282_LOCATIONCODE,P282_ACCOUNTCODE,P282_INCLUDECHILD,P282_INCLUDEZEROTRANSACTION,P282_ACCOUNTLEVEL,P282_EXCLUDE0CLOSING'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211992493860075953)
,p_event_id=>wwv_flow_imp.id(211991954760075953)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(928588089635800322)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211994646080077888)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211994711364077889)
,p_event_id=>wwv_flow_imp.id(211994646080077888)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-com-enhanceigwithtreegrid-plugin'
,p_action=>'PLUGIN_COM.ENHANCEIGWITHTREEGRID.PLUGIN'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(928588089635800322)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '.a-GV-table',
  'attribute_02', '.a-GV-row',
  'attribute_03', 'PARTYCODE',
  'attribute_04', 'PARENTCODE',
  'attribute_05', 'collapsed',
  'attribute_06', 'PARTYNAME',
  'attribute_07', 'LEVEL')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(211997711245077919)
,p_name=>'New_3'
,p_static_id=>'new-4'
,p_event_sequence=>40
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(928588089635800322)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'NATIVE_IG|REGION TYPE|gridpagechange'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(211997809383077920)
,p_event_id=>wwv_flow_imp.id(211997711245077919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'plugin-com-enhanceigwithtreegrid-plugin'
,p_action=>'PLUGIN_COM.ENHANCEIGWITHTREEGRID.PLUGIN'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(928588089635800322)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '.a-GV-table',
  'attribute_02', '.a-GV-row',
  'attribute_03', 'PARTYCODE',
  'attribute_04', 'PARTYNAME',
  'attribute_05', 'collapsed',
  'attribute_06', 'PARTYNAME',
  'attribute_07', 'LEVEL')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(211990670348075950)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
' if :p282_accountcode is not null then',
'   :P282_ACCOUNTLEVEL := to_number(:P282_ACCOUNTLEVEL)  + 1;',
' end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12467264274669279
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(211997525578077917)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_region_id=>wwv_flow_imp.id(928588089635800322)
,p_process_type=>'NATIVE_IG_DML'
,p_process_name=>'New - Save Interactive Grid Data'
,p_static_id=>'new-save-interactive-grid-data'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'lock_row', 'Y',
  'prevent_lost_updates', 'Y',
  'return_primary_keys_after_insert', 'Y',
  'target_type', 'REGION_SOURCE')).to_clob
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>12474119504671246
);
wwv_flow_imp.component_end;
end;
/
