prompt --application/pages/page_00258
begin
--   Manifest
--     PAGE: 00258
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
 p_id=>258
,p_name=>'Account Ledger '
,p_alias=>'ACCOUNT-LEDGER1'
,p_step_title=>'Account Ledger '
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
'  var bireporturl = $(''#P11_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/AccountLedger.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P11_FROMDATE'').val());',
'  var toDate = new Date($(''#P11_TODATE'').val());',
'  var companycode ,global_companycode;',
'  ',
' ',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } ',
'',
'var reportParams = ',
'      ''&P_FROMDATE=''+ $v(''P11_FROMDATE'')+',
'      ''&P_TODATE='' + $v(''P11_TODATE'') +',
'      ''&P_NARRATION='' +$v(''P11_NARRATION'')+',
'      ''&P_PRINTDRCR='' +$v(''P11_PRINTDRCR'')+',
'      ''&P_LOCATION='' +$v(''P11_LOCATION'') +  ',
'      ''&P_PARTY='' +$v(''P11_PARTY'') +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
'      ;',
' ',
'//alert($v(''P11_PARTY''));',
'  var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53877161777993864981)
,p_plug_name=>'Account Ledger '
,p_static_id=>'account-ledger'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-Region--removeHeader js-removeLandmark:t-Form--slimPadding:margin-bottom-sm'
,p_plug_template=>2322115667525957943
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1010999573492314399)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT X.TNO,',
'       X.VOUCHERDATE,',
'       getlocationname(X.LOCATIONCODE) LocationCode,',
'       X.ACCOUNTNAME,',
'       X.VOUCHERNO,',
'       :P258_PARTYCODE as party,',
'       ( SELECT DOCTYPECODE FROM VOUCHER WHERE TNO = X.TNO) AS VOUCHERTYPE,',
'      -- ''DETAIL'' AS VRDETAIL,',
'       --''NARRATION'' AS NARRATION,',
'       X.NARRATION AS NARRATION,',
'       abs(X.AMOUNT) as amount,',
'       CASE WHEN X.VOUCHERNO = ''CLOSING'' THEN ',
'               0',
'            ELSE           ',
'               X.DRAMOUNT',
'       END DRAMOUNT,',
'      CASE WHEN X.VOUCHERNO = ''CLOSING'' THEN ',
'               0',
'            ELSE            ',
'               X.CRAMOUNT',
'       END CRAMOUNT,',
'       CASE',
'         WHEN (SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)) < 0 AND',
'              X.VOUCHERNO != ''CLOSING'' THEN',
'          ROUND((SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)), 0) * -1',
'         WHEN (SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)) < 0 AND',
'              X.VOUCHERNO = ''CLOSING'' THEN',
'          DECODE(X.AMOUNT + ABS(X.AMOUNT), 0, ROUND(X.AMOUNT * -1, 0))',
'         ELSE',
'          0',
'       END DRCLOSING,',
'       CASE',
'         WHEN (SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)) > 0 AND',
'              X.VOUCHERNO != ''CLOSING'' THEN',
'          ROUND((SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)), 0)',
'         WHEN (SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)) > 0 AND',
'              X.VOUCHERNO = ''CLOSING'' THEN',
'          DECODE(X.AMOUNT + ABS(X.AMOUNT), 2 * X.AMOUNT, ROUND(X.AMOUNT, 0))',
'         ELSE',
'          0',
'       END CRCLOSING,',
'       ''VOUCHER'' AS VOUCHER,',
'     CASE WHEN NVL(X.BILLATTACHED,''NO'')=''YES'' THEN',
'        getmodulename(X.MODULECODE)',
'        ELSE',
'          NULL',
'    END MODULEODE,',
'     --X.MODULETNO,',
'',
'	  abs(Sum(x.Amount) over(Order By VOUCHERDATE, TNO rows unbounded preceding)) As ClosingAmount,',
'    /*  Case When Sum(x.Amount) over(Order By VOUCHERDATE, TNO rows unbounded preceding) > 0 Then',
'    	         Sum(x.Amount) over(Order By VOUCHERDATE, TNO rows unbounded preceding)',
'    			Else ',
'                Sum(x.Amount) over(Order By VOUCHERDATE, TNO rows unbounded preceding) * -1',
'     End ClosingAmt,',
'*/',
'     Case When Sum(x.Amount) over(Order By VOUCHERDATE, TNO rows unbounded preceding) > 0 Then',
'    	         ''Cr''',
'    			Else ''Dr''',
'     End ClosingType',
'      ',
'  FROM (SELECT 1 AS TNO,',
'               TO_DATE(:P258_FROMDATE,''DD-MM-RRRR'') AS VOUCHERDATE,',
'               NULL AS LOCATIONCODE,',
'               ''OPENING'' AS ACCOUNTNAME,',
'               ''OPENING'' AS VOUCHERNO,',
'               NULL AS NARRATION,',
'               (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X',
'                  Where X.VOUCHERDATE <= TO_DATE(:P258_FROMDATE, ''DD-MM-RRRR'')',
'                    And instr('':'' || :P258_PARTYCODE || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (&P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'                 Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P258_PARTYCODE',
'                    And a.locationcode = :P258_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE))) As AMOUNT,',
'               CASE',
'                 WHEN (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X',
'                  Where X.VOUCHERDATE <= TO_DATE(:P258_FROMDATE, ''DD-MM-RRRR'')',
'                    And instr('':'' || :P258_PARTYCODE || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (&P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'                 Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P258_PARTYCODE',
'                    And a.locationcode = :P258_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE)))  < 0 THEN',
'                  (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X',
'                  Where X.VOUCHERDATE <= TO_DATE(:P258_FROMDATE, ''DD-MM-RRRR'')',
'                    And instr('':'' || :P258_PARTYCODE || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'                 Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P258_PARTYCODE',
'                    And a.locationcode = :P258_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE)))  * -1',
'                 ELSE',
'                  0',
'               END DRAMOUNT,',
'               CASE',
'                 WHEN (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X',
'                  Where X.VOUCHERDATE <= TO_DATE(:P258_FROMDATE, ''DD-MM-RRRR'')',
'                    And instr('':'' || :P258_PARTYCODE || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'                 Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P258_PARTYCODE',
'                    And a.locationcode = :P258_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE)))  > 0 THEN',
'                  (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X',
'                  Where X.VOUCHERDATE <= TO_DATE(:P258_FROMDATE, ''DD-MM-RRRR'')',
'                    And instr('':'' || :P258_PARTYCODE || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'                 Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P258_PARTYCODE',
'                    And a.locationcode = :P258_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE)))',
'                 ELSE',
'                  0',
'               END CRAMOUNT,',
'               (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X',
'                  Where X.VOUCHERDATE <= TO_DATE(:P258_FROMDATE, ''DD-MM-RRRR'')',
'                    And instr('':'' || :P258_PARTYCODE || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'                 Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P258_PARTYCODE',
'                    And a.locationcode = :P258_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE)))  AS CLOSING,',
'                NULL AS MODULECODE,',
'                --''OPENING'' AS MODULETNO,',
'        NULL AS BILLATTACHED',
'          FROM DUAL',
'        UNION ALL',
'        ',
'        SELECT X.TNO,',
'               ',
'               X.VOUCHERDATE,',
'               X.LOCATIONCODE,',
'               getpartyname(X.ACCOUNTCODE) AS ACCOUNTNAME,',
'               X.VOUCHERNO,',
'               X.NARRATION,',
'               X.AMOUNT,',
'               DECODE(X.AMOUNT + ABS(X.AMOUNT), 0, ROUND(X.AMOUNT * -1, 0)) AS DRAMOUNT,',
'               DECODE(X.AMOUNT + ABS(X.AMOUNT), 2 * X.AMOUNT, ROUND(X.AMOUNT, 0)) AS CRAMOUNT,',
'               (SUM(X.Amount) OVER(ORDER BY X.VOUCHERDATE, X.TNO)) CLOSING,',
'               nvl(Y.MODULECODE,y.referencemodulecode) as modulecode,',
'              /* case when nvl(Y.MODULECODE,y.referencemodulecode)=''PBPASS'' then',
'                      ( ',
'                         select A.tno from purchasebill a, pbpass b',
'                          where a.tno = b.purchasebilltno',
'                            and b.tno = nvl(Y.MODULETNO,y.referencetno)',
'                      )',
'                    when nvl(Y.MODULECODE,y.referencemodulecode)=''JBPASS'' then',
'                     ( ',
'                         select A.tno from jobbill a, jbpass b',
'                          where a.tno = b.jobbilltno',
'                            and b.tno = nvl(Y.MODULETNO,y.referencetno)',
'                      )',
'                    else',
'                        nvl(Y.MODULETNO,y.referencetno) ',
'               end moduletno ,',
'               */',
'         X.BILLATTACHED',
'            FROM Accountledgerreport X, Voucher y',
'         WHERE X.TNO = y.tno',
'           AND X.VOUCHERDATE BETWEEN TO_DATE(:P258_FROMDATE,''DD-MM-RRRR'') AND TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'           AND X.CREATOR = ''&APP_USER.''',
'           AND instr('':''||:P258_PARTYCODE||'':'','':''||X.LEDGERACCOUNTCODE||'':'') > 0',
'           AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'        UNION ALL',
'        SELECT 99999999999 AS TNO,',
'               TO_DATE(:P258_TODATE,''DD-MM-RRRR'') AS VOUCHERDATE,',
'               NULL AS LOCATIONCODE,',
'               ''CLOSING'' AS ACCOUNTNAME,',
'               ''CLOSING'' AS VOUCHERNO,',
'               NULL AS NARRATION,',
'               0 AS AMOUNT,',
'               CASE',
'                 WHEN (SELECT ROUND(SUM(AMOUNT), 0)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P258_PARTYCODE||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               ) < 0 THEN',
'                  0',
'                 ELSE',
'                  0',
'               END DRAMOUNT,',
'               CASE',
'                 WHEN (SELECT ROUND(SUM(AMOUNT), 0)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P258_PARTYCODE||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               ) > 0 THEN',
'                  0               ',
'                 ELSE',
'                  0',
'               END CRAMOUNT,',
'               0 AS CLOSING,',
'               NULL AS MODULECODE,',
'               --NULL AS MODULETNO,',
'         NULL AS BILLATTACHED',
'        ',
'          FROM DUAL',
'        ',
'       /* ------- CLOSING',
'        UNION ALL',
'        SELECT 99999999999 AS TNO,',
'               TO_DATE(:P258_TODATE,''DD-MM-RRRR'') AS VOUCHERDATE,',
'               NULL AS LOCATIONCODE,',
'               ''CLOSING'' AS ACCOUNTNAME,',
'               ''CLOSING'' AS VOUCHERNO,',
'               NULL AS NARRATION,',
'               (SELECT ROUND(SUM(AMOUNT), 0)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P258_PARTY||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               ) AS AMOUNT,',
'               CASE',
'                 WHEN (SELECT ROUND(SUM(AMOUNT), 0)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P258_PARTY||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               ) < 0 THEN',
'                  (SELECT ROUND(SUM(AMOUNT), 0)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P258_PARTY||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               ) * -1',
'                 ELSE',
'                  0',
'               END DRAMOUNT,',
'               CASE',
'                 WHEN (SELECT ROUND(SUM(AMOUNT), 0)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P258_PARTY||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               ) > 0 THEN',
'                  (SELECT ROUND(SUM(AMOUNT), 0)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P258_PARTY||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               )',
'                 ELSE',
'                  0',
'               END CRAMOUNT,',
'               (SELECT ROUND(SUM(AMOUNT), 0)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P258_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P258_PARTY||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P258_LOCATION IS NULL OR instr('':''||:P258_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               ) AS CLOSING,',
'               NULL AS MODULECODE,',
'               --NULL AS MODULETNO,',
'         NULL AS BILLATTACHED',
'        ',
'          FROM DUAL',
'        */',
'',
'         ORDER BY VOUCHERDATE',
'        ',
' ',
'        ',
'        ) X',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P258_FROMDATE,P258_TODATE,P258_NARRATION,P258_PRINTDRCR,P258_LOCATION,P258_PARTY,P258_REPORTTITLE,P258_BIREPORTURL,P258_PARTYCODE'
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
 p_id=>wwv_flow_imp.id(1011001229530314415)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>793500544717095681
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933115128195037980)
,p_db_column_name=>'ACCOUNTNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'ACCOUNT NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933116271845037981)
,p_db_column_name=>'AMOUNT'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(867904225668945008)
,p_db_column_name=>'CLOSINGAMOUNT'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'CLOSING AMOUNT'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(867904306641945009)
,p_db_column_name=>'CLOSINGTYPE'
,p_display_order=>180
,p_column_identifier=>'S'
,p_column_label=>'DR/CR'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933117083298037982)
,p_db_column_name=>'CRAMOUNT'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'CR AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933117896816037983)
,p_db_column_name=>'CRCLOSING'
,p_display_order=>130
,p_column_identifier=>'K'
,p_column_label=>'CR CLOSING'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933116674078037982)
,p_db_column_name=>'DRAMOUNT'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'DR AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933117455817037982)
,p_db_column_name=>'DRCLOSING'
,p_display_order=>120
,p_column_identifier=>'J'
,p_column_label=>'DR CLOSING'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933114699878037979)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933119502168037984)
,p_db_column_name=>'MODULEODE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'MODULE CODE'
,p_column_link=>'f?p=&APP_ID.:58:&SESSION.::&DEBUG.:58:P58_TNO:#MODULETNO#'
,p_column_linktext=>'#MODULEODE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933115861820037981)
,p_db_column_name=>'NARRATION'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'NARRATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(301451386915226957)
,p_db_column_name=>'PARTY'
,p_display_order=>190
,p_column_identifier=>'T'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933113924880037978)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933118288337037983)
,p_db_column_name=>'VOUCHER'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'VOUCHER'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933114339455037979)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'VOUCHER DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933115477734037980)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'VOUCHER NO'
,p_column_link=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.::P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS,P156_CALLEDFROMTNO,P156_PARTYCODE:#TNO#,258,CALLED,#TNO#,#PARTY#'
,p_column_linktext=>'#VOUCHERNO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(933119852589037985)
,p_db_column_name=>'VOUCHERTYPE'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>'VOUCHER TYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1011052388288668457)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'690993'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100000
,p_report_columns=>'VOUCHERDATE:LOCATIONCODE:ACCOUNTNAME:VOUCHERNO:VOUCHERTYPE:DRAMOUNT:CRAMOUNT:CLOSINGAMOUNT:CLOSINGTYPE:NARRATION'
,p_sum_columns_on_break=>'DRAMOUNT:CRAMOUNT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(301551092688086379)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Preview'
,p_button_redirect_url=>'javascript:window.open(''http://65.1.227.214:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/LOGICBOX/REPORT/AccountLedgerRevisedwithattachment.xdo&nQUser=weblogic&nQPassword=webboss123&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1","_paramsP304_FROMDATE":"&P258_FROMDATE.","_paramsP304_TODATE":"&P258_TODATE.","_paramsP304_LOCATION":"&P258_LOCATION.","_paramsP304_PARTY":"&P258_PARTY.","_paramsP304_USER":"&APP_USER."}'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(301549923011086375)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(1010999573492314399)
,p_button_name=>'PRINT'
,p_static_id=>'print'
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
 p_id=>wwv_flow_imp.id(301550749568086379)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_static_id=>'REFRESH'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(945230656465151399)
,p_name=>'P258_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(933138191162038159)
,p_name=>'P258_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT',
'FINANCIALYEARBEGIN',
'FROM FINANCIALYEAR',
'WHERE TRUNC(SYSDATE) BETWEEN FINANCIALYEARBEGIN AND FINANCIALYEAREND'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>40
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
 p_id=>wwv_flow_imp.id(933139773335038161)
,p_name=>'P258_LOCATION'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select distinct ',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = getmodulecodeforpageno(:APP_PAGE_ID)',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(933139014488038161)
,p_name=>'P258_NARRATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(933140221512038162)
,p_name=>'P258_PARTY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(385388560947406107)
,p_name=>'P258_PARTYCODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      p.PartyName d,',
'      p.PartyCode r',
'From  Party p',
'Where P.PartyTYPECODE != ''ACCOUNTGROUP''',
'',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(933139437995038161)
,p_name=>'P258_PRINTDRCR'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_use_cache_before_default=>'NO'
,p_item_default=>'STATE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(933140602562038162)
,p_name=>'P258_REPORTTITLE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_item_default=>'Account Ledger'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(525043198033107321)
,p_name=>'P258_TNO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(933138594975038160)
,p_name=>'P258_TODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53877161777993864981)
,p_use_cache_before_default=>'NO'
,p_item_default=>'SELECT TRUNC(SYSDATE) FROM DUAL;'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_format_mask=>'DD-MM-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>40
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(301555932261086399)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(301550749568086379)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301557949634086412)
,p_event_id=>wwv_flow_imp.id(301555932261086399)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'APEX_UTIL.SET_SESSION_STATE (''P258_PARTY'',:P258_PARTY);',
    'APEX_UTIL.SET_SESSION_STATE (''P258_FROMDATE'',:P258_FROMDATE);',
    'APEX_UTIL.SET_SESSION_STATE (''P258_TODATE'',:P258_TODATE);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301556933798086412)
,p_event_id=>wwv_flow_imp.id(301555932261086399)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P258_FROMDATE,P258_TODATE,P258_LOCATION,P258_PARTY,P258_PARTYCODE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'declare',
    'pappuser varchar2(100);',
    'PPARTYCODE VARCHAR2(30);',
    'BEGIN',
    '  DELETE FROM TrialbalancerevisedLOCATION;',
    '  INSERT INTO TrialbalancerevisedLOCATION',
    '    (TNO, LOCATIONCODE, CREATOR )',
    '    (select globaltno.nextval,',
    '           X.locationcode,',
    '           v(''APP_USER'')',
    '     FROM LOCATION X',
    '     WHERE (:P258_LOCATION Is Null Or',
    '                        instr('':'' || :P258_LOCATION || '':'',',
    '                               '':'' || X.LocationCode || '':'') > 0))',
    '                    ',
    '    --values ( globaltno.nextval,:P258_LOCATION,V(''APP_USER''))',
    '    ',
    '    ;',
    'commit;',
    '',
    '   if :P258_LOCATION is not null then',
    '            FOR vLocation IN (SELECT * FROM TRIALBALANCEREVISEDLOCATION) LOOP',
    '          /* raise_application_error(',
    '                  -20000,',
    '                  :P258_PARTY||''-''||:P258_FROMDATE||''-''||:P258_TODATE||''-''||:GLOBAL_COMPANYCODE||''-''||:P258_LOCATION||''-''||V(''APP_USER'')',
    '                );   ',
    '           */ ',
    '           GenerateAccountLedgerRevised(:P258_PARTYCODE,',
    '                                         TO_DATE(:P258_FROMDATE,''DD-MM-RRRR''),',
    '                                         TO_DATE(:P258_TODATE,''DD-MM-RRRR''),',
    '                                         :GLOBAL_COMPANYCODE,',
    '                                         vLocation.LocationCode,',
    '                                         ''NO'',',
    '                                         vLocation.Creator);',
    '            ',
    '',
    '         END LOOP;',
    '    else',
    '        GenerateAccountLedgerRevised(:P258_PARTYCODE,',
    '                                         TO_DATE(:P258_FROMDATE,''DD-MM-RRRR''),',
    '                                         TO_DATE(:P258_TODATE,''DD-MM-RRRR''),',
    '                                         :GLOBAL_COMPANYCODE,',
    '                                         :P258_LOCATION,',
    '                                         ''NO'',',
    '                                         V(''APP_USER''));',
    '    end if;',
    '',
    'COMMIT;',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301557394928086412)
,p_event_id=>wwv_flow_imp.id(301555932261086399)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(1010999573492314399)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301556450279086410)
,p_event_id=>wwv_flow_imp.id(301555932261086399)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P258_FROMDATE,P258_TODATE,P258_LOCATION,P258_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P258_FROMDATE,P258_TODATE,P258_LOCATION,P258_PARTY',
  'sql_query', 'SELECT :P258_FROMDATE,:P258_TODATE,:P258_LOCATION, :P258_PARTY FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(301560665929086414)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301561106906086414)
,p_event_id=>wwv_flow_imp.id(301560665929086414)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    ' var button = document.getElementById(''REFRESH'');',
    '    button.click();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(301559708632086413)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P258_PARTY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301560225085086414)
,p_event_id=>wwv_flow_imp.id(301559708632086413)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P258_PARTYCODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P258_PARTY',
  'sql_query', 'SELECT :P258_PARTY FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(301558382026086412)
,p_name=>'Print Slip'
,p_static_id=>'print-slip'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(301549923011086375)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301559289972086413)
,p_event_id=>wwv_flow_imp.id(301558382026086412)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301558848972086413)
,p_event_id=>wwv_flow_imp.id(301558382026086412)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P258_FROMDATE,P258_TODATE,P258_LOCATION,P258_PARTY'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P258_FROMDATE,P258_TODATE,P258_LOCATION,P258_PARTY',
  'sql_query', 'SELECT :P258_FROMDATE,:P258_TODATE,:P258_LOCATION,:P258_PARTY FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(301555558453086397)
,p_process_sequence=>20
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'loading event'
,p_static_id=>'loading-event'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'pappuser varchar2(100);',
'PPARTYCODE VARCHAR2(30);',
'BEGIN',
'  DELETE FROM TrialbalancerevisedLOCATION;',
'  INSERT INTO TrialbalancerevisedLOCATION',
'    (TNO, LOCATIONCODE, CREATOR )',
'    (select globaltno.nextval,',
'           X.locationcode,',
'           v(''APP_USER'')',
'     FROM LOCATION X',
'     WHERE (:P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0))',
'                    ',
'    --values ( globaltno.nextval,:P258_LOCATION,V(''APP_USER''))',
'    ',
'    ;',
'commit;',
'',
'   if :P258_LOCATION is not null then',
'            FOR vLocation IN (SELECT * FROM TRIALBALANCEREVISEDLOCATION) LOOP',
'          /* raise_application_error(',
'                  -20000,',
'                  :P258_PARTY||''-''||:P258_FROMDATE||''-''||:P258_TODATE||''-''||:GLOBAL_COMPANYCODE||''-''||:P258_LOCATION||''-''||V(''APP_USER'')',
'                );   ',
'           */ ',
'           GenerateAccountLedgerRevised(:P258_PARTY,',
'                                         TO_DATE(:P258_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P258_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         vLocation.LocationCode,',
'                                         ''NO'',',
'                                         vLocation.Creator);',
'            ',
'',
'         END LOOP;',
'    else',
'        GenerateAccountLedgerRevised(:P258_PARTY,',
'                                         TO_DATE(:P258_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P258_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         :P258_LOCATION,',
'                                         ''NO'',',
'                                         V(''APP_USER''));',
'    end if;',
'',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>84054873639867663
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(301555148335086395)
,p_process_sequence=>20
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_1'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'pappuser varchar2(100);',
'PPARTYCODE VARCHAR2(30);',
'BEGIN',
'  DELETE FROM TrialbalancerevisedLOCATION;',
'  INSERT INTO TrialbalancerevisedLOCATION',
'    (TNO, LOCATIONCODE, CREATOR )',
'    (select globaltno.nextval,',
'           X.locationcode,',
'           v(''APP_USER'')',
'     FROM LOCATION X',
'     WHERE (:P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0))',
'                    ',
'    --values ( globaltno.nextval,:P258_LOCATION,V(''APP_USER''))',
'    ',
'    ;',
'commit;',
'',
'   if :P258_LOCATION is not null then',
'            FOR vLocation IN (SELECT * FROM TRIALBALANCEREVISEDLOCATION) LOOP',
'          /* raise_application_error(',
'                  -20000,',
'                  :P258_PARTY||''-''||:P258_FROMDATE||''-''||:P258_TODATE||''-''||:GLOBAL_COMPANYCODE||''-''||:P258_LOCATION||''-''||V(''APP_USER'')',
'                );   ',
'           */ ',
'           GenerateAccountLedgerRevised(:P258_PARTY,',
'                                         TO_DATE(:P258_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P258_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         vLocation.LocationCode,',
'                                         ''NO'',',
'                                         vLocation.Creator);',
'            ',
'',
'         END LOOP;',
'    else',
'        GenerateAccountLedgerRevised(:P258_PARTY,',
'                                         TO_DATE(:P258_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P258_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         :P258_LOCATION,',
'                                         ''NO'',',
'                                         V(''APP_USER''));',
'    end if;',
'',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>84054463521867661
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(301451565604226958)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New_2'
,p_static_id=>'new-2'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P156_PARTYCODE is not null then',
'    :P258_PARTYCODE := :P156_PARTYCODE;',
'    :P258_PARTY := :P156_PARTYCODE;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>83950880791008224
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(301554703390086391)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new-3'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'pappuser varchar2(100);',
'PPARTYCODE VARCHAR2(30);',
'BEGIN',
'  DELETE FROM TrialbalancerevisedLOCATION;',
'  INSERT INTO TrialbalancerevisedLOCATION',
'    (TNO, LOCATIONCODE, CREATOR )',
'    (select globaltno.nextval,',
'           X.locationcode,',
'           v(''APP_USER'')',
'     FROM LOCATION X',
'     WHERE (:P258_LOCATION Is Null Or',
'                        instr('':'' || :P258_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0))',
'                    ',
'    --values ( globaltno.nextval,:P258_LOCATION,V(''APP_USER''))',
'    ',
'    ;',
'commit;',
'',
'   if :P258_LOCATION is not null then',
'            FOR vLocation IN (SELECT * FROM TRIALBALANCEREVISEDLOCATION) LOOP',
'          /* raise_application_error(',
'                  -20000,',
'                  :P258_PARTY||''-''||:P258_FROMDATE||''-''||:P258_TODATE||''-''||:GLOBAL_COMPANYCODE||''-''||:P258_LOCATION||''-''||V(''APP_USER'')',
'                );   ',
'           */ ',
'           GenerateAccountLedgerRevised(:P258_PARTY,',
'                                         TO_DATE(:P258_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P258_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         vLocation.LocationCode,',
'                                         ''NO'',',
'                                         vLocation.Creator);',
'            ',
'',
'         END LOOP;',
'    else',
'        GenerateAccountLedgerRevised(:P258_PARTY,',
'                                         TO_DATE(:P258_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P258_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         :P258_LOCATION,',
'                                         ''NO'',',
'                                         V(''APP_USER''));',
'    end if;',
'',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>84054018576867657
);
wwv_flow_imp.component_end;
end;
/
