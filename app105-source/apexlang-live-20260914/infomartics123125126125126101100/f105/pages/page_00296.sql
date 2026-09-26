prompt --application/pages/page_00296
begin
--   Manifest
--     PAGE: 00296
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
 p_id=>296
,p_name=>'GST Liability'
,p_alias=>'GST-LIABILITY'
,p_step_title=>'GST Liability'
,p_autocomplete_on_off=>'OFF'
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
'  var reportName = ''IRONMART/REPORT/GSTLiability.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P296_FROMDATE'').val());',
'  var toDate = new Date($(''#P296_TODATE'').val());',
'',
'  var reportParams = ',
'  ''&P_COMPANY='' +  $(''#P296_COMPANY'').val() +',
'    ''&P_LOCATION='' +  $(''#P296_LOCATION'').val() +',
'    ''&P_FROMDATE=''  +  $(''#P296_FROMDATE'').val() +',
'    ''&P_TODATE=''  +  $(''#P296_TODATE'').val() +',
'    ''&P_ACCOUNT='' + $(''#P296_ACCOUNT'').val() +',
'    ''&P_MONTH='' +  $(''#P296_MONTH'').val() ',
'    ;',
' ',
'//alert($v(''P296_PARTY''));',
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
'  var bireporturl = $(''#P296_BIREPORTURL'').val()',
'  var reportName =  ''GSTLiability.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'',
'var reportParams = ',
'         ''"_paramsP_COMPANY":"'' +$(''#P296_COMPANY'').val() + ''",'' +',
'         ''"_paramsP_LOCATION":"'' +$(''#P296_LOCATION'').val() + ''",'' +',
'         ''"_paramsP_FROMDATE":"'' +$(''#P296_FROMDATE'').val() + ''",'' + ',
'         ''"_paramsP_TODATE":"'' +$(''#P296_TODATE'').val() + ''",'' + ',
'	     ''"_paramsP_ACCOUNT":"'' + $(''#P296_ACCOUNT'').val() + ''",'' + ',
'	     ''"_paramsP_MONTH":"'' + $(''#P296_MONTH'').val() ;',
'         ',
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
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(192170770088820123)
,p_plug_name=>'GST Liability'
,p_static_id=>'gst-liability'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(195401019426572388)
,p_plug_name=>'GST OUTPUT Liability'
,p_static_id=>'gst-output-liability'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select X.LOCATIONCODE,',
'       X.MSNO,',
'       X.GSTTYPE,',
'       X.ACCOUNTNAME,',
'       getAccountOpening(X.ACCOUNTCODE,',
'                         X.FROMDATE,',
'                         X.LOCATIONCODE,',
'                         X.COMPANYCODE) OPENING,',
'       getaccountbalancewithdrcr(X.ACCOUNTCODE,',
'                                 X.FROMDATE - 1,',
'                                 X.LOCATIONCODE,',
'                                 X.COMPANYCODE) As OP,',
'       (Select Sum(AMOUNT) * -1',
'          From VOUCHERDETAIL AA, VOUCHER BB',
'         Where AA.TNO = BB.TNO',
'           And AA.ACCOUNTCODE = X.ACCOUNTCODE',
'           And AA.COMPANYCODE = X.COMPANYCODE',
'           And BB.LOCATIONCODE = X.LOCATIONCODE',
'           And BB.VOUCHERDATE Between X.FROMDATE And X.TODATE',
'           And AA.AMOUNT < 0) As DR,',
'       (Select Sum(AMOUNT)',
'          From VOUCHERDETAIL AA, VOUCHER BB',
'         Where AA.TNO = BB.TNO',
'           And AA.ACCOUNTCODE = X.ACCOUNTCODE',
'           And AA.COMPANYCODE = X.COMPANYCODE',
'           And BB.LOCATIONCODE = X.LOCATIONCODE',
'           And BB.VOUCHERDATE Between X.FROMDATE And X.TODATE',
'           And AA.AMOUNT > 0) As CR,',
'       getaccountbalancewithdrcr(X.ACCOUNTCODE,',
'                                 X.TODATE,',
'                                 X.LOCATIONCODE,',
'                                 X.COMPANYCODE) As CLOSING',
'  From (Select Distinct 1 As msno,',
'                        ''OUTPUT'' As GSTType,',
'                        a.CompanyCode,',
'                        to_char(a.VoucherDate, ''MON-RRRR'') Monthh,',
'                        TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'') FROMDATE,',
'                        LAST_DAY(TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'')) TODATE,',
'                        a.LocationCode,',
'                        e.LocationName,',
'                        b.AccountCode,',
'                        d.PartyName As AccountName',
'          From Voucher a, VoucherDetail b, Party d, Location e, GSTSetup f',
'         Where a.Tno = b.Tno',
'           And b.AccountCode = d.PartyCode',
'           And a.LocationCode = e.LocationCode',
'           And b.Accountcode In (f.SGSTOUTPUTACCOUNTCODE,',
'                                 f.CGSTOUTPUTACCOUNTCODE,',
'                                 f.IGSTOUTPUTACCOUNTCODE)',
'           And to_char(a.VoucherDate, ''MON-RRRR'') = :P296_MONTH',
'        ---',
'        Union All',
'        Select Distinct 2 As msno,',
'                        ''INPUT'' As GSTType,',
'                        a.CompanyCode,',
'                        to_char(a.VoucherDate, ''MON-RRRR'') Monthh,',
'                        TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'') FROMDATE,',
'                        LAST_DAY(TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'')) TODATE,',
'                        a.LocationCode,',
'                        e.LocationName,',
'                        b.AccountCode,',
'                        d.PartyName As AccountName',
'          From Voucher a, VoucherDetail b, Party d, Location e, GSTSetup f',
'         Where a.Tno = b.Tno',
'           And b.AccountCode = d.PartyCode',
'           And a.LocationCode = e.LocationCode',
'           And b.Accountcode In (F.CGSTINPUTACCOUNTCODE,',
'                                 F.SGSTINPUTACCOUNTCODE,',
'                                 F.IGSTINPUTACCOUNTCODE)',
'           And to_char(a.VoucherDate, ''MON-RRRR'') = :P296_MONTH',
'        ',
'        ) X',
'  WHERE',
'  ( :P296_COMPANY IS NULL OR instr('':''||:P296_COMPANY||'':'','':''||X.CompanyCode||'':'') > 0 ) ',
'and ( :P296_ACCOUNT IS NULL OR instr('':''||:P296_ACCOUNT||'':'','':''||X.ACCOUNTCode||'':'') > 0 )',
'and ( :P296_LOCATION IS NULL OR instr('':''||:P296_LOCATION||'':'','':''||X.LocationCode||'':'') > 0 )',
'',
' Order By 1, 2, 3',
'',
'/*',
'Select  x.*,',
'            row_number() over(order by X.ACCOUNTCODE) SerialNo,',
'        getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE,X.LOCATIONCODE, X.COMPANYCODE) OpeningBalance,',
'        Case When getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE, X.LOCATIONCODE,  X.COMPANYCODE) > 0',
'             Then to_char(abs(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE,X.LOCATIONCODE,  X.COMPANYCODE)),''999999999.99'')||''Cr'' ',
'             When getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE, X.LOCATIONCODE,  X.COMPANYCODE) < 0',
'             Then to_char(abs(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE, X.LOCATIONCODE,  X.COMPANYCODE)),''999999999.99'')||''Dr''',
'             ELSE to_char(abs(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE, X.LOCATIONCODE, X.COMPANYCODE)),''999999999.99'')',
'             END as OpeningBalanceDRCR,',
'             nvl(getAccountDebit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) Debit,',
'             nvl(getAccountCredit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) Credit ,',
'        nvl(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           + nvl(getAccountCredit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           - nvl(getAccountDebit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) BalanceAmount,',
'        Case When (nvl(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           + nvl(getAccountCredit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE,X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           - nvl(getAccountDebit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0)) > 0',
'             Then To_char(abs((nvl(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE,X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           + nvl(getAccountCredit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           - nvl(getAccountDebit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0))),''999999999.99'')||''Cr''',
'             When (nvl(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE,X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           + nvl(getAccountCredit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           - nvl(getAccountDebit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE,X.LOCATIONCODE,  X.COMPANYCODE), 0)) < 0',
'             Then To_char(abs((nvl(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           + nvl(getAccountCredit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE,X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           - nvl(getAccountDebit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0))),''999999999.99'')||''Dr''',
'           Else To_char(abs((nvl(getAccountOpening(X.ACCOUNTCODE, :P296_FROMDATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           + nvl(getAccountCredit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0) ',
'           - nvl(getAccountDebit(X.ACCOUNTCODE, :P296_FROMDATE, :P296_TODATE, X.LOCATIONCODE,  X.COMPANYCODE), 0))),''999999999.99'')',
'           end as BalanceAmountDRCR',
'From',
'(',
'Select',
'distinct',
'--1 as msno,',
'''ONOUTPUT'' as GSTType,',
'--''1'' as OrderBy,',
'a.CompanyCode,',
'--getAccountOpening(:P296_ACCOUNT, :P296_FROMDATE, :P296_LOCATION, :P296_COMPANY) ACT,',
'to_char(a.VoucherDate,''MON-RRRR'') Monthh,',
'a.LocationCode,',
'e.LocationName,',
'b.AccountCode,',
'd.PartyName as AccountName',
'From Voucher a, VoucherDetail b, Party d, Location e,GSTSetup f',
'Where a.Tno = b.Tno',
'and b.AccountCode = d.PartyCode',
'and a.LocationCode = e.LocationCode',
'and b.Accountcode in(f.SGSTOUTPUTACCOUNTCODE,f.CGSTOUTPUTACCOUNTCODE,f.IGSTOUTPUTACCOUNTCODE)',
'and to_char(a.VoucherDate,''MON-RRRR'') = :P296_MONTH',
'and ( :P296_COMPANY IS NULL OR instr('':''||:P296_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'and ( :P296_ACCOUNT IS NULL OR instr('':''||:P296_ACCOUNT||'':'','':''||b.ACCOUNTCode||'':'') > 0 )',
'and ( :P296_LOCATION IS NULL OR instr('':''||:P296_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'-- Order by a.LocationCode',
'UNION ALL',
'Select',
'distinct',
'--1 as msno,',
'''ONINPUT'' as GSTType,',
'--''2'' as OrderBy,',
'a.CompanyCode,',
'--getAccountOpening(:P296_ACCOUNT, :P296_FROMDATE, :P296_LOCATION, :P296_COMPANY) ACT,',
'to_char(a.VoucherDate,''MON-RRRR'') Monthh,',
'a.LocationCode,',
'e.LocationName,',
'b.AccountCode,',
'd.PartyName as AccountName',
'From Voucher a, VoucherDetail b, Party d, Location e,GSTSetup f',
'Where a.Tno = b.Tno',
'and b.AccountCode = d.PartyCode',
'and a.LocationCode = e.LocationCode',
'and b.Accountcode in(F.CGSTINPUTACCOUNTCODE,F.SGSTINPUTACCOUNTCODE,F.IGSTINPUTACCOUNTCODE)',
'and to_char(a.VoucherDate,''MON-RRRR'') = :P296_MONTH',
'and ( :P296_COMPANY IS NULL OR instr('':''||:P296_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'and ( :P296_ACCOUNT IS NULL OR instr('':''||:P296_ACCOUNT||'':'','':''||b.ACCOUNTCode||'':'') > 0 )',
'and ( :P296_LOCATION IS NULL OR instr('':''||:P296_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'UNION ALL',
'Select',
'distinct',
'--1 as msno,',
'''PAYABLE'' as GSTType,',
'--''3'' as OrderBy,',
'a.CompanyCode,',
'--getAccountOpening(:P296_ACCOUNT, :P296_FROMDATE, :P296_LOCATION, :P296_COMPANY) ACT,',
'to_char(a.VoucherDate,''MON-RRRR'') Monthh,',
'--getAccountOpening(:P296_ACCOUNT, :P296_FROMDATE, :P296_LOCATION, :P296_COMPANY) ACT,',
'a.LocationCode,',
'e.LocationName,',
'b.AccountCode,',
'd.PartyName as AccountName',
'From Voucher a, VoucherDetail b,  Party d, Location e,GSTSetup f',
'Where a.Tno = b.Tno',
'and b.AccountCode = d.PartyCode',
'and a.LocationCode = e.LocationCode',
'and b.Accountcode in (F.CGSTPAYABLEACCOUNTCODE,F.IGSTPAYABLEACCOUNTCODE,F.SGSTPAYABLEACCOUNTCODE)',
'and to_char(a.VoucherDate,''MON-RRRR'') = :P296_MONTH',
'and ( :P296_COMPANY IS NULL OR instr('':''||:P296_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'and ( :P296_ACCOUNT IS NULL OR instr('':''||:P296_ACCOUNT||'':'','':''||b.ACCOUNTCode||'':'') > 0 )',
'and ( :P296_LOCATION IS NULL OR instr('':''||:P296_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'UNION ALL',
'Select',
'distinct',
'--1 as msno,',
'''RCMPAYABLE'' as GSTType,',
'--''4'' as OrderBy,',
'a.CompanyCode,',
'--getAccountOpening(:P296_ACCOUNT, :P296_FROMDATE, :P296_LOCATION, :P296_COMPANY) ACT,',
'to_char(a.VoucherDate,''MON-RRRR'') Monthh,',
'--getAccountOpening(:P296_ACCOUNT, :P296_FROMDATE, :P296_LOCATION, :P296_COMPANY) ACT,',
'a.LocationCode,',
'e.LocationName,',
'b.AccountCode,',
'd.PartyName as AccountName',
'From Voucher a, VoucherDetail b, Party d, Location e,GSTSetup f',
'Where a.Tno = b.Tno',
'and b.AccountCode = d.PartyCode',
'and a.LocationCode = e.LocationCode',
'and b.Accountcode in (f.CGSTRCMPAYABLEACCOUNTCODE,f.IGSTRCMPAYABLEACCOUNTCODE,f.SGSTRCMPAYABLEACCOUNTCODE)',
'and to_char(a.VoucherDate,''MON-RRRR'') = :P296_MONTH',
'and ( :P296_COMPANY IS NULL OR instr('':''||:P296_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'and ( :P296_ACCOUNT IS NULL OR instr('':''||:P296_ACCOUNT||'':'','':''||b.ACCOUNTCode||'':'') > 0 )',
'and ( :P296_LOCATION IS NULL OR instr('':''||:P296_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
')x',
'*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_page_header=>'GST Liability'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(195401203559572388)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>169241374415866440
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195404252036572392)
,p_db_column_name=>'ACCOUNTNAME'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Particular'
,p_column_html_expression=>'<div style="display:block; width:140px">#ACCOUNTNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(216778461736143406)
,p_db_column_name=>'CLOSING'
,p_display_order=>67
,p_column_identifier=>'T'
,p_column_label=>'Closing'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(216778322872143405)
,p_db_column_name=>'CR'
,p_display_order=>57
,p_column_identifier=>'S'
,p_column_label=>'Cr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(216778302838143404)
,p_db_column_name=>'DR'
,p_display_order=>47
,p_column_identifier=>'R'
,p_column_label=>'Dr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195401882952572390)
,p_db_column_name=>'GSTTYPE'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'.'
,p_column_html_expression=>'<div style="display:block; width:100px">#GSTTYPE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(195403033854572391)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(216777984364143401)
,p_db_column_name=>'MSNO'
,p_display_order=>17
,p_column_identifier=>'O'
,p_column_label=>'Msno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(216778181488143403)
,p_db_column_name=>'OP'
,p_display_order=>37
,p_column_identifier=>'Q'
,p_column_label=>'Op'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(216778100924143402)
,p_db_column_name=>'OPENING'
,p_display_order=>27
,p_column_identifier=>'P'
,p_column_label=>'Opening'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(195414824080629263)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'190056'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'GSTTYPE:ACCOUNTNAME'
,p_sort_column_1=>'ACCOUNTNAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'GSTTYPE'
,p_sort_direction_2=>'ASC'
,p_break_on=>'LOCATIONNAME:GSTTYPE'
,p_break_enabled_on=>'LOCATIONNAME:GSTTYPE'
,p_sum_columns_on_break=>'OPENINGBALANCE:DEBIT:CREDIT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(216778573353143407)
,p_name=>'New'
,p_static_id=>'new'
,p_template=>4072358936313175081
,p_display_sequence=>30
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--scrollBody:t-Form--slimPadding'
,p_component_template_options=>'#DEFAULT#:t-Report--altRowsDefault:t-Report--rowHighlight'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select getlocationname(X.LOCATIONCODE) Location,',
'       X.MSNO,',
'       X.GSTTYPE,',
'       X.ACCOUNTNAME,',
'       getaccountbalancewithdrcr(X.ACCOUNTCODE,',
'                                 X.FROMDATE - 1,',
'                                 X.LOCATIONCODE,',
'                                 X.COMPANYCODE) As OP,',
'       (Select Sum(AMOUNT) * -1',
'          From VOUCHERDETAIL AA, VOUCHER BB',
'         Where AA.TNO = BB.TNO',
'           And AA.ACCOUNTCODE = X.ACCOUNTCODE',
'           And AA.COMPANYCODE = X.COMPANYCODE',
'           And BB.LOCATIONCODE = X.LOCATIONCODE',
'           And BB.VOUCHERDATE Between X.FROMDATE And X.TODATE',
'           And AA.AMOUNT < 0) As DR,',
'       (Select Sum(AMOUNT)',
'          From VOUCHERDETAIL AA, VOUCHER BB',
'         Where AA.TNO = BB.TNO',
'           And AA.ACCOUNTCODE = X.ACCOUNTCODE',
'           And AA.COMPANYCODE = X.COMPANYCODE',
'           And BB.LOCATIONCODE = X.LOCATIONCODE',
'           And BB.VOUCHERDATE Between X.FROMDATE And X.TODATE',
'           And AA.AMOUNT > 0) As CR,',
'       getaccountbalancewithdrcr(X.ACCOUNTCODE,',
'                                 X.TODATE,',
'                                 X.LOCATIONCODE,',
'                                 X.COMPANYCODE) As CLOSING',
'  From ',
'  (Select Distinct 1 As msno,',
'                        ''OUTPUT'' As GSTType,',
'                        c.CompanyCode,',
'                        :P296_MONTH Monthh,',
'                        to_date(:P296_FROMDATE,''dd-mm-yyyy'') FROMDATE,',
'                        to_date(:P296_TODATE,''dd-mm-yyyy'') TODATE,',
'                        E.LocationCode,',
'                        e.LocationName,',
'                        D.PartyCode AS ACCOUNTCODE,',
'                        d.PartyName As AccountName',
'          From  Party d, Location e, GSTSetup f, Company c',
'         Where d.PartyCode In  (f.SGSTOUTPUTACCOUNTCODE,',
'                                 f.CGSTOUTPUTACCOUNTCODE,',
'                                 f.IGSTOUTPUTACCOUNTCODE)',
'     ',
'        ---',
'        Union All',
'        Select Distinct 2 As msno,',
'                        ''INPUT'' As GSTType,',
'                        c.CompanyCode,',
'                        :P296_MONTH Monthh,',
'                        to_date(:P296_FROMDATE,''dd-mm-yyyy'') FROMDATE,',
'                        to_date(:P296_TODATE,''dd-mm-yyyy'') TODATE,',
'                        E.LocationCode,',
'                        e.LocationName,',
'                        D.PartyCode,',
'                        d.PartyName As AccountName',
'          From  Party d, Location e, GSTSetup f, Company c',
'         Where d.PartyCode In (F.CGSTINPUTACCOUNTCODE,',
'                                 F.SGSTINPUTACCOUNTCODE,',
'                                 F.IGSTINPUTACCOUNTCODE)',
'          -- And to_char(a.VoucherDate, ''MON-RRRR'') BETWEEN :P296_FROMDATE AND :P296_TODATE',
'        ---',
'        Union All',
'        Select Distinct 4 As msno,',
'                        ''PAYBLE'' As GSTType,',
'                        c.CompanyCode,',
'                        :P296_MONTH Monthh,',
'                        to_date(:P296_FROMDATE,''dd-mm-yyyy'') FROMDATE,',
'                        to_date(:P296_TODATE,''dd-mm-yyyy'') TODATE,',
'                        E.LocationCode,',
'                        e.LocationName,',
'                        D.PartyCode,',
'                        d.PartyName As AccountName',
'          From  Party d, Location e, GSTSetup f, Company c',
'         Where d.PartyCode In  (F.CGSTPAYABLEACCOUNTCODE,',
'                                 F.SGSTPAYABLEACCOUNTCODE,',
'                                 F.IGSTPAYABLEACCOUNTCODE)',
'   ',
'        ---',
'        Union All',
'        Select Distinct 5 As msno,',
'                        ''RCMPAYBLE'' As GSTType,',
'                        c.CompanyCode,',
'                        :P296_MONTH Monthh,',
'                        to_date(:P296_FROMDATE,''dd-mm-yyyy'') FROMDATE,',
'                        to_date(:P296_TODATE,''dd-mm-yyyy'') TODATE,',
'                        E.LocationCode,',
'                        e.LocationName,',
'                        D.PartyCode,',
'                        d.PartyName As AccountName',
'          From  Party d, Location e, GSTSetup f, Company c',
'         Where d.PartyCode In  (F.CGSTRCMPAYABLEACCOUNTCODE,',
'                                 F.SGSTRCMPAYABLEACCOUNTCODE,',
'                                 F.IGSTRCMPAYABLEACCOUNTCODE)',
'',
'         ---',
'        Union All',
'        Select Distinct 3 As msno,',
'                        ''RCMINPUT'' As GSTType,',
'                        c.CompanyCode,',
'                        :P296_MONTH Monthh,',
'                        to_date(:P296_FROMDATE,''dd-mm-yyyy'') FROMDATE,',
'                        to_date(:P296_TODATE,''dd-mm-yyyy'') TODATE,',
'                        E.LocationCode,',
'                        e.LocationName,',
'                        D.PartyCode,',
'                        d.PartyName As AccountName',
'          From  Party d, Location e, GSTSetup f, Company c',
'         Where d.PartyCode In  (F.CGSTRCMINPUTACCOUNTCODE,',
'                                 F.SGSTRCMINPUTACCOUNTCODE,',
'                                 F.IGSTRCMINPUTACCOUNTCODE)',
'',
'        ----',
'        Union All',
'        Select Distinct 6 As msno,',
'                        ''RCMOUTPUT'' As GSTType,',
'                        c.CompanyCode,',
'                        :P296_MONTH Monthh,',
'                        to_date(:P296_FROMDATE,''dd-mm-yyyy'') FROMDATE,',
'                        to_date(:P296_TODATE,''dd-mm-yyyy'') TODATE,',
'                        E.LocationCode,',
'                        e.LocationName,',
'                        D.PartyCode ,',
'                        d.PartyName As AccountName',
'          From  Party d, Location e, GSTSetup f, Company c',
'         Where d.PartyCode In  (F.CGSTRCMOUTPUTACCOUNTCODE,',
'                                 F.SGSTRCMOUTPUTACCOUNTCODE,',
'                                 F.IGSTRCMOUTPUTACCOUNTCODE)',
'',
'        ) X',
'  WHERE',
'  ( :P296_COMPANY IS NULL OR instr('':''||:P296_COMPANY||'':'','':''||X.CompanyCode||'':'') > 0 ) ',
'and ( :P296_ACCOUNT IS NULL OR instr('':''||:P296_ACCOUNT||'':'','':''||X.ACCOUNTCode||'':'') > 0 )',
'and ( :P296_LOCATION IS NULL OR instr('':''||:P296_LOCATION||'':'','':''||X.LocationCode||'':'') > 0 )',
'and (',
'      NVL(getAccountOpening(X.ACCOUNTCODE,',
'                                 X.FROMDATE +1,',
'                                 X.LOCATIONCODE,',
'                                 X.COMPANYCODE),0) != 0',
'',
'     or  (Select Sum(AMOUNT) * -1',
'          From VOUCHERDETAIL AA, VOUCHER BB',
'         Where AA.TNO = BB.TNO',
'           And AA.ACCOUNTCODE = X.ACCOUNTCODE',
'           And AA.COMPANYCODE = X.COMPANYCODE',
'           And BB.LOCATIONCODE = X.LOCATIONCODE',
'           And BB.VOUCHERDATE Between X.FROMDATE And X.TODATE',
'           And AA.AMOUNT < 0) != 0',
'      or (Select Sum(AMOUNT)',
'          From VOUCHERDETAIL AA, VOUCHER BB',
'         Where AA.TNO = BB.TNO',
'           And AA.ACCOUNTCODE = X.ACCOUNTCODE',
'           And AA.COMPANYCODE = X.COMPANYCODE',
'           And BB.LOCATIONCODE = X.LOCATIONCODE',
'           And BB.VOUCHERDATE Between X.FROMDATE And X.TODATE',
'           And AA.AMOUNT > 0) != 0',
'',
'       or getAccountOpening(X.ACCOUNTCODE,',
'                                 X.TODATE+1,',
'                                 X.LOCATIONCODE,',
'                                 X.COMPANYCODE) != 0',
'',
')',
'',
'/*',
'Select getlocationname(X.LOCATIONCODE) Location,',
'       X.MSNO,',
'       X.GSTTYPE,',
'       X.ACCOUNTNAME,',
'      ',
'       getaccountbalancewithdrcr(X.ACCOUNTCODE,',
'                                 X.FROMDATE - 1,',
'                                 X.LOCATIONCODE,',
'                                 X.COMPANYCODE) As OP,',
'       (Select Sum(AMOUNT) * -1',
'          From VOUCHERDETAIL AA, VOUCHER BB',
'         Where AA.TNO = BB.TNO',
'           And AA.ACCOUNTCODE = X.ACCOUNTCODE',
'           And AA.COMPANYCODE = X.COMPANYCODE',
'           And BB.LOCATIONCODE = X.LOCATIONCODE',
'           And BB.VOUCHERDATE Between X.FROMDATE And X.TODATE',
'           And AA.AMOUNT < 0) As DR,',
'       (Select Sum(AMOUNT)',
'          From VOUCHERDETAIL AA, VOUCHER BB',
'         Where AA.TNO = BB.TNO',
'           And AA.ACCOUNTCODE = X.ACCOUNTCODE',
'           And AA.COMPANYCODE = X.COMPANYCODE',
'           And BB.LOCATIONCODE = X.LOCATIONCODE',
'           And BB.VOUCHERDATE Between X.FROMDATE And X.TODATE',
'           And AA.AMOUNT > 0) As CR,',
'       getaccountbalancewithdrcr(X.ACCOUNTCODE,',
'                                 X.TODATE,',
'                                 X.LOCATIONCODE,',
'                                 X.COMPANYCODE) As CLOSING',
'  From ',
'  (Select Distinct 1 As msno,',
'                        ''OUTPUT'' As GSTType,',
'                        a.CompanyCode,',
'                        to_char(a.VoucherDate, ''MON-RRRR'') Monthh,',
'                        TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'') FROMDATE,',
'                        LAST_DAY(TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'')) TODATE,',
'                        a.LocationCode,',
'                        e.LocationName,',
'                        b.AccountCode,',
'                        d.PartyName As AccountName',
'          From Voucher a, VoucherDetail b, Party d, Location e, GSTSetup f',
'         Where a.Tno = b.Tno',
'           And b.AccountCode = d.PartyCode',
'           And a.LocationCode = e.LocationCode',
'           And b.Accountcode In (f.SGSTOUTPUTACCOUNTCODE,',
'                                 f.CGSTOUTPUTACCOUNTCODE,',
'                                 f.IGSTOUTPUTACCOUNTCODE)',
'           And to_char(a.VoucherDate, ''MON-RRRR'') = :P296_MONTH',
'        ---',
'        Union All',
'        Select Distinct 2 As msno,',
'                        ''INPUT'' As GSTType,',
'                        a.CompanyCode,',
'                        to_char(a.VoucherDate, ''MON-RRRR'') Monthh,',
'                        TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'') FROMDATE,',
'                        LAST_DAY(TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'')) TODATE,',
'                        a.LocationCode,',
'                        e.LocationName,',
'                        b.AccountCode,',
'                        d.PartyName As AccountName',
'          From Voucher a, VoucherDetail b, Party d, Location e, GSTSetup f',
'         Where a.Tno = b.Tno',
'           And b.AccountCode = d.PartyCode',
'           And a.LocationCode = e.LocationCode',
'           And b.Accountcode In (F.CGSTINPUTACCOUNTCODE,',
'                                 F.SGSTINPUTACCOUNTCODE,',
'                                 F.IGSTINPUTACCOUNTCODE)',
'           And to_char(a.VoucherDate, ''MON-RRRR'') = :P296_MONTH',
'        ---',
'        Union All',
'        Select Distinct 4 As msno,',
'                        ''PAYABLE'' As GSTType,',
'                        a.CompanyCode,',
'                        to_char(a.VoucherDate, ''MON-RRRR'') Monthh,',
'                        TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'') FROMDATE,',
'                        LAST_DAY(TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'')) TODATE,',
'                        a.LocationCode,',
'                        e.LocationName,',
'                        b.AccountCode,',
'                        d.PartyName As AccountName',
'          From Voucher a, VoucherDetail b, Party d, Location e, GSTSetup f',
'         Where a.Tno = b.Tno',
'           And b.AccountCode = d.PartyCode',
'           And a.LocationCode = e.LocationCode',
'           And b.Accountcode In (F.CGSTPAYABLEACCOUNTCODE,',
'                                 F.SGSTPAYABLEACCOUNTCODE,',
'                                 F.IGSTPAYABLEACCOUNTCODE)',
'           And to_char(a.VoucherDate, ''MON-RRRR'') = :P296_MONTH',
'        ---',
'        Union All',
'        Select Distinct 5 As msno,',
'                        ''RCMPAYABLE'' As GSTType,',
'                        a.CompanyCode,',
'                        to_char(a.VoucherDate, ''MON-RRRR'') Monthh,',
'                        TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'') FROMDATE,',
'                        LAST_DAY(TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'')) TODATE,',
'                        a.LocationCode,',
'                        e.LocationName,',
'                        b.AccountCode,',
'                        d.PartyName As AccountName',
'          From Voucher a, VoucherDetail b, Party d, Location e, GSTSetup f',
'         Where a.Tno = b.Tno',
'           And b.AccountCode = d.PartyCode',
'           And a.LocationCode = e.LocationCode',
'           And b.Accountcode In (F.CGSTRCMPAYABLEACCOUNTCODE,',
'                                 F.SGSTRCMPAYABLEACCOUNTCODE,',
'                                 F.IGSTRCMPAYABLEACCOUNTCODE)',
'           And to_char(a.VoucherDate, ''MON-RRRR'') = :P296_MONTH',
'         ---',
'        Union All',
'        Select Distinct 3 As msno,',
'                        ''RCMINPUT'' As GSTType,',
'                        a.CompanyCode,',
'                        to_char(a.VoucherDate, ''MON-RRRR'') Monthh,',
'                        TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'') FROMDATE,',
'                        LAST_DAY(TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'')) TODATE,',
'                        a.LocationCode,',
'                        e.LocationName,',
'                        b.AccountCode,',
'                        d.PartyName As AccountName',
'          From Voucher a, VoucherDetail b, Party d, Location e, GSTSetup f',
'         Where a.Tno = b.Tno',
'           And b.AccountCode = d.PartyCode',
'           And a.LocationCode = e.LocationCode',
'           And b.Accountcode In (F.CGSTRCMINPUTACCOUNTCODE,',
'                                 F.SGSTRCMINPUTACCOUNTCODE,',
'                                 F.IGSTRCMINPUTACCOUNTCODE)',
'           And to_char(a.VoucherDate, ''MON-RRRR'') = :P296_MONTH',
'        ----',
'        Union All',
'        Select Distinct 6 As msno,',
'                        ''RCMOUTPUT'' As GSTType,',
'                        a.CompanyCode,',
'                        to_char(a.VoucherDate, ''MON-RRRR'') Monthh,',
'                        TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'') FROMDATE,',
'                        LAST_DAY(TO_DATE(''01'' || :P296_MONTH, ''DD-MON-YYYY'')) TODATE,',
'                        a.LocationCode,',
'                        e.LocationName,',
'                        b.AccountCode,',
'                        d.PartyName As AccountName',
'          From Voucher a, VoucherDetail b, Party d, Location e, GSTSetup f',
'         Where a.Tno = b.Tno',
'           And b.AccountCode = d.PartyCode',
'           And a.LocationCode = e.LocationCode',
'           And b.Accountcode In (F.CGSTRCMOUTPUTACCOUNTCODE,',
'                                 F.SGSTRCMOUTPUTACCOUNTCODE,',
'                                 F.IGSTRCMOUTPUTACCOUNTCODE)',
'           And to_char(a.VoucherDate, ''MON-RRRR'') = :P296_MONTH',
'        ) X',
'  WHERE',
'  ( :P296_COMPANY IS NULL OR instr('':''||:P296_COMPANY||'':'','':''||X.CompanyCode||'':'') > 0 ) ',
'and ( :P296_ACCOUNT IS NULL OR instr('':''||:P296_ACCOUNT||'':'','':''||X.ACCOUNTCode||'':'') > 0 )',
'and ( :P296_LOCATION IS NULL OR instr('':''||:P296_LOCATION||'':'','':''||X.LocationCode||'':'') > 0 )',
'--order by x.locationcode,x.msno,x.accountcode',
'*/'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P296_FROMDATE,P296_TODATE,P296_COMPANY,P296_LOCATION,P296_ACCOUNT,P296_MONTH,P296_BIREPORTURL'
,p_lazy_loading=>false
,p_query_row_template=>2538654340625403440
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'1:2'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_report_total_text_format=>'Total'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'Y'
,p_csv_output_link_text=>'Download'
,p_prn_output=>'Y'
,p_prn_format=>'PDF'
,p_prn_output_link_text=>'Print'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width_units=>'PERCENTAGE'
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
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101891966114813504)
,p_query_column_id=>4
,p_column_alias=>'ACCOUNTNAME'
,p_column_display_sequence=>30
,p_column_heading=>'Particulars'
,p_column_html_expression=>'<div style="display:block; width:250px">#ACCOUNTNAME#</div>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101893533870813505)
,p_query_column_id=>8
,p_column_alias=>'CLOSING'
,p_column_display_sequence=>80
,p_column_heading=>'Closing'
,p_column_html_expression=>'<div style="display:block; width:100px">#CLOSING#</div>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101893224052813505)
,p_query_column_id=>7
,p_column_alias=>'CR'
,p_column_display_sequence=>70
,p_column_heading=>'Credit'
,p_column_format=>'99999999999.99'
,p_column_html_expression=>'<div style="display:block; width:100px">#CR#</div>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101892812752813504)
,p_query_column_id=>6
,p_column_alias=>'DR'
,p_column_display_sequence=>60
,p_column_heading=>'Debit'
,p_column_format=>'99999999999.99'
,p_column_html_expression=>'<div style="display:block; width:100px">#DR#</div>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101891559979813504)
,p_query_column_id=>3
,p_column_alias=>'GSTTYPE'
,p_column_display_sequence=>20
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101890823776813502)
,p_query_column_id=>1
,p_column_alias=>'LOCATION'
,p_column_display_sequence=>10
,p_column_heading=>'Location'
,p_heading_alignment=>'LEFT'
,p_default_sort_column_sequence=>1
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101891185922813502)
,p_query_column_id=>2
,p_column_alias=>'MSNO'
,p_column_display_sequence=>90
,p_column_heading=>'Msno'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_default_sort_column_sequence=>2
,p_disable_sort_column=>'N'
,p_display_when_cond_type=>'NEVER'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(101892397372813504)
,p_query_column_id=>5
,p_column_alias=>'OP'
,p_column_display_sequence=>50
,p_column_heading=>'Opening'
,p_column_html_expression=>'<div style="display:block; width:100px">#OP#</div>'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_sum_column=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101883775229813493)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(192170770088820123)
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
 p_id=>wwv_flow_imp.id(101884149372813493)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(192170770088820123)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(192172709029820130)
,p_name=>'P296_ACCOUNT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(192170770088820123)
,p_prompt=>'Account'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct ',
'       c.PartyName d,',
'       c.PartyCode r',
'From   Voucher a,VoucherDetail b,Party c',
'Where  a.Tno = b.Tno',
'  and  b.AccountCode = c.PartyCode',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(195607039211729731)
,p_name=>'P296_BIREPORTURL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(192170770088820123)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(192172415334820128)
,p_name=>'P296_COMPANY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(192170770088820123)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'       b.CompanyName d,',
'       b.CompanyCode r',
'From   Voucher a,Company b',
'Where  a.CompanyCode = b.CompanyCode',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(192172257552820126)
,p_name=>'P296_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(192170770088820123)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(192172608295820129)
,p_name=>'P296_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(192170770088820123)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct ',
'       b.LocationName d,',
'       b.LocationCode r',
'From   Voucher a,Location b',
'Where  a.LocationCode = b.LocationCode',
'Order By 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(192173462369820138)
,p_name=>'P296_MONTH'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(192170770088820123)
,p_prompt=>'Month'
,p_format_mask=>'MON-RRRR'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(192172374699820127)
,p_name=>'P296_TODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(192170770088820123)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(101894183196813505)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(101883775229813493)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101894708278813505)
,p_event_id=>wwv_flow_imp.id(101894183196813505)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(101895046862813507)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101895625090813507)
,p_event_id=>wwv_flow_imp.id(101895046862813507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(101896007307813507)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P296_MONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101896973189813507)
,p_event_id=>wwv_flow_imp.id(101896007307813507)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P296_FROMDATE,P296_TODATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101896514439813507)
,p_event_id=>wwv_flow_imp.id(101896007307813507)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P296_FROMDATE,P296_TODATE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P296_MONTH',
  'sql_query', 'SELECT TO_DATE(''01-''||:P296_MONTH,''DD-MON-YYYY''),LAST_DAY(TO_DATE(''01-''||:P296_MONTH,''DD-MON-YYYY'')) FROM DUAL',
  'suppress_change_event', 'N',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
