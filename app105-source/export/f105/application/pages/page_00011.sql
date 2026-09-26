prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'Account Ledger '
,p_alias=>'ACCOUNT-LEDGER'
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
'      ''&P_FROMDATE=''+ $(''#P11_FROMDATE'').val()+',
'      ''&P_TODATE='' + $(''#P11_TODATE'').val() +',
'      ''&P_LOCATION='' +$(''#P11_LOCATION'').val() +  ',
'      ''&P_PARTY='' +$(''#P11_PARTY'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
'      ;',
' ',
'//alert($v(''P11_PARTY''));',
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
'  var bireporturl = $(''#P11_BIREPORTURL'').val()',
'  var reportName =  ''AccountLedger.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  ',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P11_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'         ''"_paramsP_FROMDATE":"'' +$(''#P11_FROMDATE'').val() + ''",'' + ',
'         ''"_paramsP_TODATE":"'' +$(''#P11_TODATE'').val() + ''",'' + ',
'	 ''"_paramsP_LOCATION":"'' + $(''#P11_LOCATION'').val() + ''",'' + ',
'	 ''"_paramsP_PARTY":"'' + $(''#P11_PARTY'').val() + ''",'' + ',
'         ''"_paramsGLOBAL_COMPANYCODE":"'' +global_companycode;',
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
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(53793118476325997431)
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
 p_id=>wwv_flow_imp.id(866434332315304528)
,p_plug_name=>'Buttons'
,p_static_id=>'buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>20
,p_plug_display_point=>'BEFORE_NAVIGATION_BAR'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(926956271824446849)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'---- DT 20-NOV-2024',
'SELECT X.TNO,',
'       X.VOUCHERDATE,',
'       getlocationname(X.LOCATIONCODE) LocationCode,',
'       X.ACCOUNTNAME,',
'       X.VOUCHERNO,',
'       :P11_PARTY as party,',
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
'          ROUND((SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)), 2) * -1',
'         WHEN (SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)) < 0 AND',
'              X.VOUCHERNO = ''CLOSING'' THEN',
'          DECODE(X.AMOUNT + ABS(X.AMOUNT), 0, ROUND(X.AMOUNT * -1, 2))',
'         ELSE',
'          0',
'       END DRCLOSING,',
'       CASE',
'         WHEN (SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)) > 0 AND',
'              X.VOUCHERNO != ''CLOSING'' THEN',
'          ROUND((SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)), 2)',
'         WHEN (SUM(X.Amount) OVER(ORDER BY VOUCHERDATE, TNO)) > 0 AND',
'              X.VOUCHERNO = ''CLOSING'' THEN',
'          DECODE(X.AMOUNT + ABS(X.AMOUNT), 2 * X.AMOUNT, ROUND(X.AMOUNT, 2))',
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
' ',
'     Case When Sum(x.Amount) over(Order By VOUCHERDATE, TNO rows unbounded preceding) > 0 Then',
'    	         ''Cr''',
'    			Else ''Dr''',
'     End ClosingType',
'      ',
'  FROM (',
'         SELECT 1 AS TNO,',
'               TO_DATE(:P11_FROMDATE,''DD-MM-RRRR'') AS VOUCHERDATE,',
'               NULL AS LOCATIONCODE,',
'               ''OPENING'' AS ACCOUNTNAME,',
'               ''OPENING'' AS VOUCHERNO,',
'               NULL AS NARRATION,',
'               (Select Sum(AMOUNT)',
'          From (',
'		        (Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X',
'                  Where X.VOUCHERDATE < TO_DATE(:P11_FROMDATE, ''DD-MM-RRRR'')',
'                    And ',
'                        instr('':'' || :P11_PARTY || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'                 /*Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P11_PARTY',
'                    And a.locationcode = :P11_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE',
'                  */ ',
'                    ))) As AMOUNT,',
'               CASE',
'                 WHEN (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X',
'                  Where X.VOUCHERDATE < TO_DATE(:P11_FROMDATE, ''DD-MM-RRRR'')',
'                    And ',
'                        instr('':'' || :P11_PARTY || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (&P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'                 /*Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P11_PARTY',
'                    And a.locationcode = :P11_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE',
'                  */',
'                    )))  < 0 THEN',
'                  (Select Sum(AMOUNT)',
'          From (',
'		        (Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X, voucher y',
'                  Where x.tno = y.tno',
'				    and X.VOUCHERDATE < TO_DATE(:P11_FROMDATE, ''DD-MM-RRRR'')',
'                    And ',
'                        instr('':'' || :P11_PARTY || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'							   ',
'				    and y.companycode = :Global_companycode',
'                /* Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P11_PARTY',
'                    And a.locationcode = :P11_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE',
'					*/',
'					)))  * -1',
'                 ELSE',
'                  0',
'               END DRAMOUNT,',
'               CASE',
'                 WHEN (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X, Voucher y',
'                  Where x.tno = y.tno',
'				    and X.VOUCHERDATE < TO_DATE(:P11_FROMDATE, ''DD-MM-RRRR'')',
'                    And ',
'                        instr('':'' || :P11_PARTY || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'				    and y.companycode = :Global_companycode',
'                 /*Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P11_PARTY',
'                    And a.locationcode = :P11_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE',
'					*/',
'					)))  > 0 THEN',
'                  (Select Sum(AMOUNT)',
'          From ((Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X, voucher y',
'                  Where X.VOUCHERDATE < TO_DATE(:P11_FROMDATE, ''DD-MM-RRRR'')',
'				    and x.tno =y.tno',
'                    And',
'                        instr('':'' || :P11_PARTY || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'					and y.companycode = :Global_companycode',
'                 /*Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P11_PARTY',
'                    And a.locationcode = :P11_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE',
'					*/',
'					)))',
'                 ELSE',
'                  0',
'               END CRAMOUNT,',
'               (Select Sum(AMOUNT)',
'          From (',
'		        (Select Sum(x.AMOUNT) As AMOUNT',
'                   From VOUCHERDETAIL X, voucher y',
'                  Where X.VOUCHERDATE < TO_DATE(:P11_FROMDATE, ''DD-MM-RRRR'')',
'				    and x.tno =y.tno',
'                    And ',
'                        instr('':'' || :P11_PARTY || '':'',',
'                              '':'' || X.ACCOUNTCODE || '':'') > 0',
'                    And (:P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0)',
'				    and y.companycode = :Global_companycode',
'                 /*Union All',
'                 Select Sum(openingamount)',
'                   From accountopening a',
'                  Where a.accountcode = :P11_PARTY',
'                    And a.locationcode = :P11_LOCATION',
'                    And A.COMPANYCODE = :GLOBAL_COMPANYCODE',
'					*/',
'					)',
'				)',
'				)  AS CLOSING,',
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
'               DECODE(X.AMOUNT + ABS(X.AMOUNT), 0, ROUND(X.AMOUNT * -1, 2)) AS DRAMOUNT,',
'               DECODE(X.AMOUNT + ABS(X.AMOUNT), 2 * X.AMOUNT, ROUND(X.AMOUNT, 2)) AS CRAMOUNT,',
'               (SUM(X.Amount) OVER(ORDER BY X.VOUCHERDATE, X.TNO)) CLOSING,',
'               nvl(Y.MODULECODE,y.referencemodulecode) as modulecode,',
' ',
'         X.BILLATTACHED',
'            FROM Accountledgerreport X, Voucher y',
'         WHERE X.TNO = y.tno',
'           AND X.VOUCHERDATE BETWEEN TO_DATE(:P11_FROMDATE,''DD-MM-RRRR'') AND TO_DATE(:P11_TODATE,''DD-MM-RRRR'')',
'           AND X.CREATOR = ''&APP_USER.''',
'           AND instr('':''||:P11_PARTY||'':'','':''||X.LEDGERACCOUNTCODE||'':'') > 0',
'           AND (:P11_LOCATION IS NULL OR instr('':''||:P11_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'        UNION ALL',
'        SELECT 99999999999 AS TNO,',
'               TO_DATE(:P11_TODATE,''DD-MM-RRRR'') AS VOUCHERDATE,',
'               NULL AS LOCATIONCODE,',
'               ''CLOSING'' AS ACCOUNTNAME,',
'               ''CLOSING'' AS VOUCHERNO,',
'               NULL AS NARRATION,',
'               0 AS AMOUNT,',
'               CASE',
'                 WHEN (SELECT ROUND(SUM(AMOUNT), 2)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P11_TODATE,''DD-MM-RRRR'')',
'                   AND  instr('':''||:P11_PARTY||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P11_LOCATION IS NULL OR instr('':''||:P11_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
'               ) < 0 THEN',
'                  0',
'                 ELSE',
'                  0',
'               END DRAMOUNT,',
'               CASE',
'                 WHEN (SELECT ROUND(SUM(AMOUNT), 2)',
'                  FROM VOUCHERDETAIL X',
'                 WHERE X.VOUCHERDATE <= TO_DATE(:P11_TODATE,''DD-MM-RRRR'')',
'                   AND instr('':''||:P11_PARTY||'':'','':''||X.ACCOUNTCODE||'':'') > 0',
'                   AND (:P11_LOCATION IS NULL OR instr('':''||:P11_LOCATION||'':'','':''||X.LocationCode||'':'') > 0)',
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
'',
'         ORDER BY VOUCHERDATE',
'        ',
' ',
'        ',
'        ) X',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P11_FROMDATE,P11_TODATE,P11_NARRATION,P11_PRINTDRCR,P11_LOCATION,P11_PARTY_1,P11_REPORTTITLE,P11_BIREPORTURL,P11_PARTY_OLD'
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
 p_id=>wwv_flow_imp.id(926957927862446865)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>486571582611520341
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(849071826527170430)
,p_db_column_name=>'ACCOUNTNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'ACCOUNT NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(849072970177170431)
,p_db_column_name=>'AMOUNT'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(783860924001077458)
,p_db_column_name=>'CLOSINGAMOUNT'
,p_display_order=>170
,p_column_identifier=>'R'
,p_column_label=>'CLOSING AMOUNT'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(783861004974077459)
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
 p_id=>wwv_flow_imp.id(849073781630170432)
,p_db_column_name=>'CRAMOUNT'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'CR AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999990.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(849074595148170433)
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
 p_id=>wwv_flow_imp.id(849073372410170432)
,p_db_column_name=>'DRAMOUNT'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'DR AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999990.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(849074154149170432)
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
 p_id=>wwv_flow_imp.id(849071398210170429)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(849076200500170434)
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
 p_id=>wwv_flow_imp.id(849072560152170431)
,p_db_column_name=>'NARRATION'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'NARRATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(301451632079226959)
,p_db_column_name=>'PARTY'
,p_display_order=>190
,p_column_identifier=>'U'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(849070623212170428)
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
 p_id=>wwv_flow_imp.id(849074986669170433)
,p_db_column_name=>'VOUCHER'
,p_display_order=>140
,p_column_identifier=>'L'
,p_column_label=>'VOUCHER'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(849071037787170429)
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
 p_id=>wwv_flow_imp.id(849072176066170430)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'VOUCHER NO'
,p_column_link=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.::P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS,P156_CALLEDFROMTNO,P156_PARTYCODE:#TNO#,11,CALLED,#TNO#,#PARTY#'
,p_column_linktext=>'#VOUCHERNO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(849076550921170435)
,p_db_column_name=>'VOUCHERTYPE'
,p_display_order=>60
,p_column_identifier=>'Q'
,p_column_label=>'VOUCHER TYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(927009086620800907)
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
 p_id=>wwv_flow_imp.id(174839685276600188)
,p_button_sequence=>210
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--pillEnd'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'CHANGE'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:&APP_PAGE_ID.::'
,p_confirm_message=>'Want to Add New Record?'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tModuleFlow number;',
'  tmp         number;',
'  tmp1        number;',
'BEGIN',
'   select count(*) into tmp1 from ModuleFlow a where a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID);',
'   if nvl(tmp1,0) > 0 then',
'        select ',
'            count(*) into tModuleFlow',
'        from ModuleFlow a, ModuleFlowUser b, Bossuser c',
'        where a.tno = b.tno',
'          and b.bossusercode = c.bossusercode',
'          and a.Modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
'          and c.bossusername = :APP_USER',
'          ;',
'',
'          if nvl(tModuleFlow,0) > 0 then',
'             return(TRUE) ;',
'          else',
'             return(FALSE);',
'          end if;',
'     else',
'            Select',
'            	COUNT(*) into tmp ',
'            From Module a, ModulePrivilege b, BossUser c',
'            Where a.ModuleCode = b.ModuleCode',
'            	and b.BossUsercode = c.BossUserCode',
'            	and c.LoginName = :GLOBAL_LOGINNAME',
'                and a.ModuleCode= getmodulecodeforpageno(:APP_PAGE_ID)',
'            	and b.CompanyCode = :GLOBAL_COMPANYCODE',
'            	and b.InsertPrivilege = ''YES'' ;',
'            if nvl(tmp,0) > 0 then',
'               return(TRUE);',
'            else',
'               return(FALSE);',
'            end if;',
'      end if;',
'              ',
'END;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174842040115600189)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'CANCEL'
,p_static_id=>'cancel'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-arrow-circle-o-left'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174843266852600189)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create'
,p_button_position=>'CLOSE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save'
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174130570263657817)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_button_name=>'Daily'
,p_static_id=>'daily'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Daily'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174842457878600189)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'DELETE'
,p_static_id=>'delete'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_execute_validations=>'N'
,p_confirm_message=>'&APP_TEXT$DELETE_MSG!RAW.'
,p_confirm_style=>'danger'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-trash-o'
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174840510620600188)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'Fail'
,p_static_id=>'fail'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Fail'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-thumbs-o-down'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174840880781600188)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'Flow'
,p_static_id=>'flow'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'FLow'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:162:P162_TNO:&P71_TNO.'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-workflow'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174130454513657816)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_button_name=>'Monthly'
,p_static_id=>'monthly'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Monthly'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(607635741859537016)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_button_name=>'New'
,p_static_id=>'new'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Preview'
,p_button_redirect_url=>'javascript:window.open(''http://65.1.227.214:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/LOGICBOX/REPORT/AccountLedgerRevisedwithattachment.xdo&nQUser=weblogic&nQPassword=webboss123&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1","_paramsP304_FROMDATE":"&P11_FROMDATE.","_paramsP304_TODATE":"&P11_TODATE.","_paramsP304_LOCATION":"&P11_LOCATION.","_paramsP304_PARTY":"&P11_PARTY.","_paramsP304_USER":"&APP_USER."}'');'
,p_button_execute_validations=>'N'
,p_button_condition_type=>'NEVER'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174840071675600188)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'Pass'
,p_static_id=>'pass'
,p_button_static_id=>'PASS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pass'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:163::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-thumbs-o-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174841662885600188)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'PRINT_1'
,p_static_id=>'print'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Print'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-print'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(607634510143537014)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(926956271824446849)
,p_button_name=>'PRINT'
,p_static_id=>'print-2'
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
 p_id=>wwv_flow_imp.id(607635325281537016)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(53793118476325997431)
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
,p_grid_column_attributes=>'style="margin-left: 50px;"'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174842856158600189)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'SAVE'
,p_static_id=>'save'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--pill'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CLOSE'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-save-as'
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(174841253867600188)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(866434332315304528)
,p_button_name=>'Status'
,p_static_id=>'status'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--warning:t-Button--iconLeft:t-Button--pill'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'&P118_STATUS.'
,p_button_position=>'CLOSE'
,p_button_redirect_url=>'f?p=&APP_ID.:164:&SESSION.::&DEBUG.:164::'
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-comments-o'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(861179824107283752)
,p_name=>'P11_BIREPORTURL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(849087358804170512)
,p_name=>'P11_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
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
 p_id=>wwv_flow_imp.id(849088940977170514)
,p_name=>'P11_LOCATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(849088182130170514)
,p_name=>'P11_NARRATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(44818035449098821)
,p_name=>'P11_PARTY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Account'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_ONE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      distinct nvl(getpartyname(a.partycode),a.partycode) d, ',
'      a.partycode r',
'From  Party a',
'Where a.PartyTYPECODE != ''ACCOUNTGROUP''',
'',
'Order By 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'U'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'fetch_on_search', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(849089389154170515)
,p_name=>'P11_PARTY_1'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_use_cache_before_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(301337728589538460)
,p_name=>'P11_PARTY_OLD'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Account'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      distinct nvl(getpartyname(a.partycode),a.partycode) d, ',
'      a.partycode r',
'From  Party a',
'Where a.PartyTYPECODE != ''ACCOUNTGROUP''',
'',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(573771056156959416)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(849088605637170514)
,p_name=>'P11_PRINTDRCR'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_use_cache_before_default=>'NO'
,p_item_default=>'STATE'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(849089770204170515)
,p_name=>'P11_REPORTTITLE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_item_default=>'Account Ledger'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(440992365675239674)
,p_name=>'P11_TNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(849087762617170513)
,p_name=>'P11_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(53793118476325997431)
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
 p_id=>wwv_flow_imp.id(174130850498657820)
,p_name=>'call daily summary'
,p_static_id=>'call-daily-summary'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(174130570263657817)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(174131012549657821)
,p_event_id=>wwv_flow_imp.id(174130850498657820)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P11_FROMDATE'').getValue();',
    'var y = ''11'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P11_TODATE'').getValue();',
    'var y1 = apex.item(''P11_LOCATION'').getValue();',
    'var z1 = apex.item(''P11_PARTY'').getValue();',
    '',
    '',
    'var url = "f?p=#APP_ID#:250:#SESSION#::NO:RP,250:P250_FROMDATE,P250_TODATE,P250_CALLEDFROMPAGE,P250_PARTY:#P250_FROMDATE#,#P250_TODATE#,#P250_CALLEDFROMPAGE#,#P250_PARTY#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P250_FROMDATE#", x);',
    'url = url.replace("#P250_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P250_TODATE#", x1);',
    'url = url.replace("#P250_LOCATION#", y1);',
    'url = url.replace("#P250_PARTY#", z1);',
    '',
    '',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(174130658125657818)
,p_name=>'call monthly summary'
,p_static_id=>'call-monthly-summary'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(174130454513657816)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(174130741494657819)
,p_event_id=>wwv_flow_imp.id(174130658125657818)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P11_FROMDATE'').getValue();',
    'var y = ''11'';',
    'var z = ''CALLED'';',
    'var x1 = apex.item(''P11_TODATE'').getValue();',
    'var y1 = apex.item(''P11_LOCATION'').getValue();',
    'var z1 = apex.item(''P11_PARTY'').getValue();',
    '',
    '',
    'var url = "f?p=#APP_ID#:249:#SESSION#::NO:RP,249:P249_FROMDATE,P249_TODATE,P249_CALLEDFROMPAGE,P249_PARTY:#P249_FROMDATE#,#P249_TODATE#,#P249_CALLEDFROMPAGE#,#P249_PARTY#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#P249_FROMDATE#", x);',
    'url = url.replace("#P249_CALLEDFROMPAGE#", y);',
    'url = url.replace("#P249_TODATE#", x1);',
    'url = url.replace("#P249_LOCATION#", y1);',
    'url = url.replace("#P249_PARTY#", z1);',
    '',
    '',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(174846884998610257)
,p_name=>'Delete unsaved data'
,p_static_id=>'delete-unsaved-data'
,p_event_sequence=>80
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(174842040115600189)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(174848329264610258)
,p_event_id=>wwv_flow_imp.id(174846884998610257)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'var x = apex.item(''P11_CALLEDFROMPAGE'').getValue();',
    'var y = apex.item(''P11_CALLEDFROMTNO'').getValue();',
    '',
    '//var url = "f?p=#APP_ID#:80:#SESSION#::NO:RP,80:P156_TNO,P156_CALLEDFROMPAGE,P156_FORMSTATUS:#P156_TNO#,#P156_CALLEDFROMPAGE#,#P156_FORMSTATUS#";',
    '',
    '',
    'var url = "f?p=#APP_ID#:#2002#:#SESSION#::NO:RP,#2002#:P#2002#_TNO:#P2002_TNO#";',
    '//:P2002_TNO:#P2002_TNO#";',
    '',
    'url = url.replace("#APP_ID#", $v("pFlowId"));',
    'url = url.replace("#SESSION#", $v("pInstance"));',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    'url = url.replace("#2002#", x);',
    '',
    'url = url.replace("#P2002_TNO#", y);',
    '//window.alert(x);',
    '//window.alert(y);',
    '//window.alert(url);',
    '',
    '',
    '//call',
    'apex.server.process("PREPARE_URL", {',
    'x01: url',
    '  }, {',
    '  success: function(pData) {',
    '   if (pData.success === true) {',
    '     apex.navigation.redirect(pData.url);',
    '   } else {',
    '     console.log("FALSE");',
    '   }',
    ' },',
    'error: function(request, status, error) {',
    'console.log("status---" + status + " error----" + error);',
    '  }',
    '});',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(607641289306537021)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(607634510143537014)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(607641803850537021)
,p_event_id=>wwv_flow_imp.id(607641289306537021)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(504911389169991116)
,p_event_id=>wwv_flow_imp.id(607641289306537021)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FROMDATE,P11_TODATE,P11_LOCATION,P11_PARTY_OLD'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P11_FROMDATE,P11_TODATE,P11_LOCATION,P11_PARTY_OLD',
  'sql_query', 'SELECT :P11_FROMDATE,:P11_TODATE,:P11_LOCATION,:P11_PARTY FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_stop_execution_on_error=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(174846128317608711)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf-2'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(174841662885600188)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(174846473868608713)
,p_event_id=>wwv_flow_imp.id(174846128317608711)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(607639937204537019)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(607635325281537016)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(298279608548491061)
,p_event_id=>wwv_flow_imp.id(607639937204537019)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'APEX_UTIL.SET_SESSION_STATE (''P11_PARTY'',:P11_PARTY);',
    'APEX_UTIL.SET_SESSION_STATE (''P11_FROMDATE'',:P11_FROMDATE);',
    'APEX_UTIL.SET_SESSION_STATE (''P11_TODATE'',:P11_TODATE);',
    '')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(607640389909537020)
,p_event_id=>wwv_flow_imp.id(607639937204537019)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code-2'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P11_FROMDATE,P11_TODATE,P11_LOCATION,P11_PARTY_1,P11_PARTY_OLD,P11_PARTY',
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
    '     WHERE (:P11_LOCATION Is Null Or',
    '                        instr('':'' || :P11_LOCATION || '':'',',
    '                               '':'' || X.LocationCode || '':'') > 0))',
    '                    ',
    '    --values ( globaltno.nextval,:P11_LOCATION,V(''APP_USER''))',
    '    ',
    '    ;',
    'commit;',
    '',
    '   if :P11_LOCATION is not null then',
    '            FOR vLocation IN (SELECT * FROM TRIALBALANCEREVISEDLOCATION) LOOP',
    '          /* raise_application_error(',
    '                  -20000,',
    '                  :P11_PARTY||''-''||:P11_FROMDATE||''-''||:P11_TODATE||''-''||:GLOBAL_COMPANYCODE||''-''||:P11_LOCATION||''-''||V(''APP_USER'')',
    '                );   ',
    '           */ ',
    '           GenerateAccountLedgerRevised(:P11_PARTY,',
    '                                         TO_DATE(:P11_FROMDATE,''DD-MM-RRRR''),',
    '                                         TO_DATE(:P11_TODATE,''DD-MM-RRRR''),',
    '                                         :GLOBAL_COMPANYCODE,',
    '                                         vLocation.LocationCode,',
    '                                         ''NO'',',
    '                                         vLocation.Creator);',
    '            ',
    '',
    '         END LOOP;',
    '    else',
    '        GenerateAccountLedgerRevised(:P11_PARTY,',
    '                                         TO_DATE(:P11_FROMDATE,''DD-MM-RRRR''),',
    '                                         TO_DATE(:P11_TODATE,''DD-MM-RRRR''),',
    '                                         :GLOBAL_COMPANYCODE,',
    '                                         :P11_LOCATION,',
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
 p_id=>wwv_flow_imp.id(607640931061537020)
,p_event_id=>wwv_flow_imp.id(607639937204537019)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(926956271824446849)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440992448447239675)
,p_event_id=>wwv_flow_imp.id(607639937204537019)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_FROMDATE,P11_TODATE,P11_LOCATION,P11_PARTY_1'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P11_FROMDATE,P11_TODATE,P11_LOCATION,P11_PARTY_1',
  'sql_query', 'SELECT :P11_FROMDATE,:P11_TODATE,:P11_LOCATION, :P11_PARTY FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(297559098723230636)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(297559210714230637)
,p_event_id=>wwv_flow_imp.id(297559098723230636)
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
 p_id=>wwv_flow_imp.id(301337853009538461)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_PARTY_1'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(301337943880538462)
,p_event_id=>wwv_flow_imp.id(301337853009538461)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P11_PARTY_OLD'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P11_PARTY_1',
  'sql_query', 'SELECT :P11_PARTY_1 FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(607639449009537019)
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
'     WHERE (:P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0))',
'                    ',
'    --values ( globaltno.nextval,:P11_LOCATION,V(''APP_USER''))',
'    ',
'    ;',
'commit;',
'',
'   if :P11_LOCATION is not null then',
'            FOR vLocation IN (SELECT * FROM TRIALBALANCEREVISEDLOCATION) LOOP',
'          /* raise_application_error(',
'                  -20000,',
'                  :P11_PARTY||''-''||:P11_FROMDATE||''-''||:P11_TODATE||''-''||:GLOBAL_COMPANYCODE||''-''||:P11_LOCATION||''-''||V(''APP_USER'')',
'                );   ',
'           */ ',
'           GenerateAccountLedgerRevised(:P11_PARTY,',
'                                         TO_DATE(:P11_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P11_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         vLocation.LocationCode,',
'                                         ''NO'',',
'                                         vLocation.Creator);',
'            ',
'',
'         END LOOP;',
'    else',
'        GenerateAccountLedgerRevised(:P11_PARTY,',
'                                         TO_DATE(:P11_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P11_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         :P11_LOCATION,',
'                                         ''NO'',',
'                                         V(''APP_USER''));',
'    end if;',
'',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>167253103758610495
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(607639109354537018)
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
'     WHERE (:P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0))',
'                    ',
'    --values ( globaltno.nextval,:P11_LOCATION,V(''APP_USER''))',
'    ',
'    ;',
'commit;',
'',
'   if :P11_LOCATION is not null then',
'            FOR vLocation IN (SELECT * FROM TRIALBALANCEREVISEDLOCATION) LOOP',
'          /* raise_application_error(',
'                  -20000,',
'                  :P11_PARTY||''-''||:P11_FROMDATE||''-''||:P11_TODATE||''-''||:GLOBAL_COMPANYCODE||''-''||:P11_LOCATION||''-''||V(''APP_USER'')',
'                );   ',
'           */ ',
'           GenerateAccountLedgerRevised(:P11_PARTY,',
'                                         TO_DATE(:P11_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P11_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         vLocation.LocationCode,',
'                                         ''NO'',',
'                                         vLocation.Creator);',
'            ',
'',
'         END LOOP;',
'    else',
'        GenerateAccountLedgerRevised(:P11_PARTY,',
'                                         TO_DATE(:P11_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P11_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         :P11_LOCATION,',
'                                         ''NO'',',
'                                         V(''APP_USER''));',
'    end if;',
'',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>167252764103610494
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(607638711858537018)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new-2'
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
'     WHERE (:P11_LOCATION Is Null Or',
'                        instr('':'' || :P11_LOCATION || '':'',',
'                               '':'' || X.LocationCode || '':'') > 0))',
'                    ',
'    --values ( globaltno.nextval,:P11_LOCATION,V(''APP_USER''))',
'    ',
'    ;',
'commit;',
'',
'   if :P11_LOCATION is not null then',
'            FOR vLocation IN (SELECT * FROM TRIALBALANCEREVISEDLOCATION) LOOP',
'          /* raise_application_error(',
'                  -20000,',
'                  :P11_PARTY||''-''||:P11_FROMDATE||''-''||:P11_TODATE||''-''||:GLOBAL_COMPANYCODE||''-''||:P11_LOCATION||''-''||V(''APP_USER'')',
'                );   ',
'           */ ',
'           GenerateAccountLedgerRevised(:P11_PARTY,',
'                                         TO_DATE(:P11_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P11_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         vLocation.LocationCode,',
'                                         ''NO'',',
'                                         vLocation.Creator);',
'            ',
'',
'         END LOOP;',
'    else',
'        GenerateAccountLedgerRevised(:P11_PARTY,',
'                                         TO_DATE(:P11_FROMDATE,''DD-MM-RRRR''),',
'                                         TO_DATE(:P11_TODATE,''DD-MM-RRRR''),',
'                                         :GLOBAL_COMPANYCODE,',
'                                         :P11_LOCATION,',
'                                         ''NO'',',
'                                         V(''APP_USER''));',
'    end if;',
'',
'COMMIT;',
'END;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_type=>'NEVER'
,p_internal_uid=>167252366607610494
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(301451761550226960)
,p_process_sequence=>30
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set party'
,p_static_id=>'set-party'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P156_PARTYCODE is not null then',
'    :P11_PARTY_1 := :P156_PARTYCODE;',
'    :P11_PARTY := :P156_PARTYCODE;',
'    :P156_PARTYCODE:=null;',
'end if;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>83951076737008226
);
wwv_flow_imp.component_end;
end;
/
