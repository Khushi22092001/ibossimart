prompt --application/pages/page_00190
begin
--   Manifest
--     PAGE: 00190
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
 p_id=>190
,p_name=>'Bill Receipt'
,p_alias=>'BILL-RECEIPT1'
,p_step_title=>'Bill Receipt'
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
'  var bireporturl = $(''#P190_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/BillReceiptRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P190_FROMDATE'').val());',
'  var toDate = new Date($(''#P190_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P190_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P190_COMPANY'').val() ==="" || $(''#P190_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P190_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P190_COMPANY'').val();',
'       global_companycode= $(''#P190_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +   ',
'      ''&P_FROMDATE='' +$(''#P190_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P190_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P190_LOCATION'').val() +',
'      ''&P_PARTY='' +$(''#P190_PARTY'').val() +',
'      ''&P_DEBIT='' +$(''#P190_DEBIT'').val() +',
'      ''&P_INVOICE='' +$(''#P190_INVOICE'').val() +',
'      ''&P_SERVICEBILL='' +$(''#P190_SERVICEBILL'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
'      ',
'      ;',
'  ',
'',
' ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P190_BIREPORTURL'').val()',
'  var reportName =  ''BillReceiptRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P190_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P190_COMPANY'').val() ==="" || $(''#P190_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P190_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P190_COMPANY'').val();',
'       global_companycode= $(''#P190_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P190_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' +',
'      ''"_paramsP_FROMDATE":"'' +$(''#P190_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P190_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P190_LOCATION'').val() + ''",'' +  ',
'	  ''"_paramsP_PARTY":"'' +$(''#P190_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_DEBIT":"'' +$(''#P190_DEBIT'').val() + ''",'' +',
'	  ''"_paramsP_INVOICE":"'' +$(''#P190_INVOICE'').val() + ''",'' + ',
'	  ''"_paramsP_SERVICEBILL":"'' +$(''#P190_SERVICEBILL'').val() + ''",'' + ',
'      ''"_paramsGLOBAL_COMPANYCODE":"'' +global_companycode;',
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
'',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(610038537461623568)
,p_plug_name=>'Bill Receipt Register'
,p_static_id=>'bill-receipt-register'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(600498172302484751)
,p_plug_name=>'Bill Receipt Register Report'
,p_static_id=>'bill-receipt-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' Select x.*,',
'                        ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||X.Tno||'',''||''BillReceipt''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="'
||'true" title="Action"></span</span></a>'' AS Print',
'',
' From ( Select NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,',
'       a.tno,',
'       a.dfreightbillreceiptno   As ReceiptNo,',
'       a.dfreightbillreceiptdate As ReceiptDate,',
'       c.partyname,',
'       d.cityname,',
'       e.statename,',
'       h.PartyName as DebitAccount,',
'       a.Amount as TotalReceivedAmount,',
'       g.VoucherNo as ReferenceNo,',
'       sb.ServiceBillNo as Invoiceno,',
'       sb.ServiceBillDate as Invoicedate,',
'       sb.ServiceBillAmount as Invoiceamount,',
'       nvl(sb.ServiceBillAmount, 0) - nvl(sb.PaidAmount, 0) - nvl(sb.DeductedAmount, 0) as PendingAmount,',
'       b.Amount as ReceivedAmount,',
'       b.tdsamount,',
'       nvl(sb.ServiceBillAmount, 0) - nvl(sb.PaidAmount, 0) - nvl(sb.DeductedAmount, 0)- nvl(b.TDSAmount,0)-nvl(b.Amount,0) as BalanceAmount,',
'       lo.LocationName,',
'       co.CompanyName,',
'       a.Creator',
'  From dfreightbillreceipt a,dfreightbillreceiptdetail b,party c,city d,state e,Voucher g,',
'  Party  h, ServiceBill sb,Location lo, Company co',
' Where a.tno = b.tno',
'   And a.depocode = c.partycode',
'   And Nvl(c.workscitycode, c.officecitycode) = d.citycode(+)',
'   And Nvl(c.worksstatecode, c.officestatecode) = e.statecode(+)',
'   and a.VoucherTno = g.Tno(+)',
'   and a.AccountCode = h.PartyCode(+)',
'   and b.ServiceBillTno = sb.Tno(+)',
'   and a.LocationCode = lo.LocationCode(+)',
'   and a.CompanyCode = co.CompanyCode(+)',
'   and b.ModuleCode = ''SERVICEBILL''',
'   and a.dfreightbillreceiptdate between :P190_FROMDATE and :P190_TODATE',
'   and (:P190_COMPANY is Null Or Instr ('':'' || :P190_COMPANY || '':'' , '':'' ||co.CompanyCode|| '':'') > 0)',
'   and (:P190_LOCATION is Null Or Instr ('':'' || :P190_LOCATION || '':'' , '':'' ||lo.LocationCode|| '':'') > 0)',
'   and (:P190_PARTY is Null Or Instr ('':'' || :P190_PARTY || '':'' , '':'' ||c.PartyCode|| '':'') > 0)',
'   and (:P190_DEBIT is Null Or Instr ('':'' || :P190_DEBIT || '':'' , '':'' ||h.PartyCode|| '':'') > 0)',
'  and (:P190_SERVICEBILL is Null Or Instr ('':'' || :P190_SERVICEBILL || '':'' , '':'' ||sb.Tno|| '':'') > 0)',
'   -- added below condition on 27-nov-2024 on request of user & prasanna',
'   and  a.modulecode is null ',
'   --',
'UNION ALL',
'   ',
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,',
'       a.tno,',
'       a.dfreightbillreceiptno   As ReceiptNo,',
'       a.dfreightbillreceiptdate As ReceiptDate,',
'       c.partyname,',
'       d.cityname,',
'       e.statename,',
'       h.PartyName as DebitAccount,',
'       a.Amount as TotalReceivedAmount,',
'       g.VoucherNo as ReferenceNo,',
'       f.Invoiceno,',
'       f.Invoicedate,',
'       f.Invoiceamount,',
'       nvl(f.InvoiceAmount, 0) - nvl(f.PaidAmount, 0) - nvl(f.DeductedAmount, 0) as PendingAmount,',
'       b.Amount as ReceivedAmount,',
'       b.tdsamount,',
'       nvl(f.InvoiceAmount, 0) - nvl(f.PaidAmount, 0) - nvl(f.DeductedAmount, 0)- nvl(b.TDSAmount,0)-nvl(b.Amount,0) as BalanceAmount,',
'       lo.LocationName,',
'       co.CompanyName,',
'       a.Creator',
'  From dfreightbillreceipt a,dfreightbillreceiptdetail b,party c,city d,state e,invoice f,Voucher g,',
'  Party  h, Location lo, Company co',
' Where a.tno = b.tno',
'   And a.depocode = c.partycode',
'   And Nvl(c.workscitycode, c.officecitycode) = d.citycode(+)',
'   And Nvl(c.worksstatecode, c.officestatecode) = e.statecode(+)',
'   And b.moduletno = f.tno(+)',
'   and a.VoucherTno = g.Tno(+)',
'   and a.AccountCode = h.PartyCode(+)',
'   and a.LocationCode = lo.LocationCode(+)',
'   and a.CompanyCode = co.CompanyCode(+)',
'   --and b.ModuleCode in (''CCINVOICE'',''INVOICE'')',
'   and a.dfreightbillreceiptdate between :P190_FROMDATE and :P190_TODATE',
'   and (:P190_COMPANY is Null Or Instr ('':'' || :P190_COMPANY || '':'' , '':'' ||co.CompanyCode|| '':'') > 0)',
'   and (:P190_LOCATION is Null Or Instr ('':'' || :P190_LOCATION || '':'' , '':'' ||lo.LocationCode|| '':'') > 0)',
'   and (:P190_PARTY is Null Or Instr ('':'' || :P190_PARTY || '':'' , '':'' ||c.PartyCode|| '':'') > 0)',
'   and (:P190_DEBIT is Null Or Instr ('':'' || :P190_DEBIT || '':'' , '':'' ||h.PartyCode|| '':'') > 0)',
'   and (:P190_INVOICE is Null Or Instr ('':'' || :P190_INVOICE || '':'' , '':'' ||f.Tno|| '':'') > 0)',
'    -- added below condition on 27-nov-2024 on request of user & prasanna',
'   and  a.modulecode is null ',
'   --',
'  --Order By a.dfreightbillreceiptdate',
' )x'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Dispatch Advice Register'
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
 p_id=>wwv_flow_imp.id(622800769989947778)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:191:&SESSION.::&DEBUG.:191:P191_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>183815900790249794
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470305363090395343)
,p_db_column_name=>'BALANCEAMOUNT'
,p_display_order=>740
,p_column_identifier=>'CS'
,p_column_label=>'BALANCE AMOUNT'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470423342678281832)
,p_db_column_name=>'CITYNAME'
,p_display_order=>620
,p_column_identifier=>'BR'
,p_column_label=>'CITY '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477452275578953435)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>810
,p_column_identifier=>'CZ'
,p_column_label=>'COMPANY'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477452372153953436)
,p_db_column_name=>'CREATOR'
,p_display_order=>820
,p_column_identifier=>'DA'
,p_column_label=>'CREATOR'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477451136778953424)
,p_db_column_name=>'DEBITACCOUNT'
,p_display_order=>750
,p_column_identifier=>'CT'
,p_column_label=>'DEBIT ACCOUNT'
,p_column_type=>'STRING'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470305143057395341)
,p_db_column_name=>'INVOICEAMOUNT'
,p_display_order=>720
,p_column_identifier=>'CQ'
,p_column_label=>'INVOICE AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470305016583395340)
,p_db_column_name=>'INVOICEDATE'
,p_display_order=>710
,p_column_identifier=>'CP'
,p_column_label=>'INVOICE DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470304948626395339)
,p_db_column_name=>'INVOICENO'
,p_display_order=>700
,p_column_identifier=>'CO'
,p_column_label=>'INVOICE NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477452173285953434)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>800
,p_column_identifier=>'CY'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470423777387281832)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:150px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477451964299953432)
,p_db_column_name=>'PENDINGAMOUNT'
,p_display_order=>780
,p_column_identifier=>'CW'
,p_column_label=>'PENDING AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291367340645173276)
,p_db_column_name=>'PRINT'
,p_display_order=>830
,p_column_identifier=>'DB'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470304766904395337)
,p_db_column_name=>'RECEIPTDATE'
,p_display_order=>680
,p_column_identifier=>'CM'
,p_column_label=>'RECEIPT DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470304661318395336)
,p_db_column_name=>'RECEIPTNO'
,p_display_order=>670
,p_column_identifier=>'CL'
,p_column_label=>'RECEIPT NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477452097025953433)
,p_db_column_name=>'RECEIVEDAMOUNT'
,p_display_order=>790
,p_column_identifier=>'CX'
,p_column_label=>'RECEIVED AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477451366856953426)
,p_db_column_name=>'REFERENCENO'
,p_display_order=>770
,p_column_identifier=>'CV'
,p_column_label=>'REFERENCE NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470304826745395338)
,p_db_column_name=>'STATENAME'
,p_display_order=>690
,p_column_identifier=>'CN'
,p_column_label=>'STATE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(187202751900143560)
,p_db_column_name=>'STATUS'
,p_display_order=>840
,p_column_identifier=>'DC'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470305269332395342)
,p_db_column_name=>'TDSAMOUNT'
,p_display_order=>730
,p_column_identifier=>'CR'
,p_column_label=>'TDS AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(470304524824395335)
,p_db_column_name=>'TNO'
,p_display_order=>660
,p_column_identifier=>'CK'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(477451244668953425)
,p_db_column_name=>'TOTALRECEIVEDAMOUNT'
,p_display_order=>760
,p_column_identifier=>'CU'
,p_column_label=>'TOTAL RECEIVED AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(622863962441953312)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'103590'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:STATUS:RECEIPTNO:RECEIPTDATE:PARTYNAME:CITYNAME:STATENAME:DEBITACCOUNT:TOTALRECEIVEDAMOUNT:REFERENCENO:INVOICENO:INVOICEDATE:INVOICEAMOUNT:PENDINGAMOUNT:RECEIVEDAMOUNT:TDSAMOUNT:LOCATIONNAME:COMPANYNAME:CREATOR'
,p_sort_column_1=>'CCINVOICEDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CCINVOICENO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'TOTALRECEIVEDAMOUNT:INVOICEAMOUNT:PENDINGAMOUNT:RECEIVEDAMOUNT:TDSAMOUNT:BALANCEAMOUNT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453229577848509567)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(600498172302484751)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:191:&SESSION.::&DEBUG.:191::'
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
 p_id=>wwv_flow_imp.id(453216816876496477)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(600498172302484751)
,p_button_name=>'CUSTOM2'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/ccinvoiceregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P190_FROMDATE=&P190_FROMDATE.&P190_TODATE=&P190_TODATE.&P190_LOCATION=&P190_LOCATION.&P190_DOCTYPE=&P190_DOCTYPE.&P190_PARTY=&P190_PARTY.&P190_TRANSPORTER=&P190_TRANSPORTER.&P190_ITEM=&P190_ITEM.&P190_ITEMSPECIFICATION=&P190_ITEMSPECIFICATION.&P190_CCINO=&P190_CCINO.&P190_VEHICLENO=&P190_VEHICLENO.&P190_VSTATUS=&P190_VSTATUS.&P190_MISTATUS=&P190_MISTATUS.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453227894479504990)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(600498172302484751)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(453228267384506358)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(600498172302484751)
,p_button_name=>'PDF'
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
 p_id=>wwv_flow_imp.id(453217992128496477)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(610038537461623568)
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
 p_id=>wwv_flow_imp.id(454691475368081357)
,p_name=>'P190_BIREPORTURL'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(477705221131805722)
,p_name=>'P190_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'distinct',
'a.CompanyName d,',
'a.CompanyCode r',
'From Company a',
'Where exists(',
'   Select',
'      aa.CompanyCode',
'   From DFreightBillReceipt aa',
'   Where aa.companyCode = a.companyCode',
')',
'Order by 1'))
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(476903411612784100)
,p_name=>'P190_DEBIT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_prompt=>'Debit A/C'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.PartyName d,',
'      l.PartyCode r',
'from dfreightbillreceipt a, party l',
'where a.AccountCode = l.PartyCode(+)',
'Order By 1',
';',
''))
,p_cSize=>30
,p_cattributes_element=>'1'
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(470441923243281869)
,p_name=>'P190_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_item_default=>'select sysdate - 7 from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_cattributes_element=>'1'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
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
 p_id=>wwv_flow_imp.id(476903455103784101)
,p_name=>'P190_INVOICE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_prompt=>'Invoice No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.InvoiceNo d,',
'      l.Tno r',
'from dfreightbillreceiptDetail a, Invoice l',
'where a.ModuleTno = l.Tno(+)',
'Order By 1',
';',
''))
,p_cSize=>30
,p_cattributes_element=>'1'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(477460717560953470)
,p_name=>'P190_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'distinct',
'a.LocationName d,',
'a.LocationCode r',
'From Location a',
'Where exists(',
'   Select',
'      aa.LocationCode',
'   From DFreightBillReceipt aa',
'   Where aa.LocationCode = a.LocationCode',
')',
'Order by 1'))
,p_cSize=>30
,p_cattributes_element=>'1'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(476903303832784099)
,p_name=>'P190_PARTY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'  b.PartyName d,',
'  b.PartyCode r',
'From DFreightBillReceipt a, Party b',
'Where a.DepoCode = b.PartyCode'))
,p_cSize=>30
,p_cattributes_element=>'1'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(477460822561953471)
,p_name=>'P190_SERVICEBILL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_prompt=>'Service Bill No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.ServiceBillNo d,',
'      l.Tno r',
'from dfreightbillreceiptDetail a, ServiceBill l',
'where a.ServiceBillTno = l.Tno(+)',
'Order By 1',
';',
''))
,p_cSize=>30
,p_cattributes_element=>'1'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(470442237108281869)
,p_name=>'P190_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(610038537461623568)
,p_item_default=>'select sysdate from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_cattributes_element=>'1'
,p_begin_on_new_line=>'N'
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
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
 p_id=>wwv_flow_imp.id(453228744644508408)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(453228267384506358)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453229165547508408)
,p_event_id=>wwv_flow_imp.id(453228744644508408)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453226429730501247)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453226776224501247)
,p_event_id=>wwv_flow_imp.id(453226429730501247)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453225585643500341)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453226057809500342)
,p_event_id=>wwv_flow_imp.id(453225585643500341)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(453220977230496479)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P190_CCINO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P190_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P190_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>14236108030798495
);
wwv_flow_imp.component_end;
end;
/
