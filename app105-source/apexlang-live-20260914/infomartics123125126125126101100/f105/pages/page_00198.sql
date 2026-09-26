prompt --application/pages/page_00198
begin
--   Manifest
--     PAGE: 00198
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
 p_id=>198
,p_name=>'Freight Advice List'
,p_alias=>'FREIGHT-ADVICE-LIST'
,p_step_title=>'Freight Advice List'
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
'  var bireporturl = $(''#P198_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/FreightAdviceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P198_FROMDATE'').val());',
'  var toDate = new Date($(''#P198_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P198_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P198_COMPANY'').val() ==="" || $(''#P198_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P198_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P198_COMPANY'').val();',
'       global_companycode= $(''#P198_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +   ',
'      ''&P_FROMDATE='' +$(''#P198_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P198_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P198_LOCATION'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
'     ',
'       ',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P198_BIREPORTURL'').val()',
'  var reportName =  ''FreightAdviceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P198_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P198_COMPANY'').val() ==="" || $(''#P198_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P198_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P198_COMPANY'').val();',
'       global_companycode= $(''#P198_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P198_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P198_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P198_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P198_LOCATION'').val() + ''",'' + ',
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
'',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(559970454984903167)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(498468087132442454)
,p_plug_name=>'Freight Advice List'
,p_static_id=>'freight-advice-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/*select NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,',
'a.TNO,',
'       a.COMPANYCODE,',
'       a.FINANCIALYEARCODE,',
'       a.LOCATIONCODE,',
'       a.DOCTYPECODE,',
'       a.FREIGHTADVICENO,',
'       a.FREIGHTADVICEDATE,',
'       a.TRANSPORTERCODE,',
'       a.FREIGHTTYPECODE,',
'       a.PARTYBILLNO,',
'       a.PARTYBILLDATE,',
'       a.MONEYTRANSFERMODECODE,',
'       a.MONEYTRANSFERREFERENCENO,',
'       a.DEBITACCOUNTCODE,',
'       a.CREDITACCOUNTCODE,',
'       a.TDSMASTERCODE,',
'       a.ITEMWISEFOOTER,',
'       a.REMARK,',
'       a.SUMOFAMOUNT,',
'       a.SUMOFFOOTERAMOUNT,',
'       a.FREIGHTADVICEAMOUNT,',
'       a.SUMOFTDSAMOUNT,',
'       a.SUMOFDEDUCTIONAMOUNT,',
'       a.SUMOFADVANCEAMOUNT,',
'       a.SUMOFPAYMENTCOMMISSION,',
'       a.SUMOFNETPAYABLEAMOUNT,',
'       a.AMOUNTAFTERTDS,',
'       a.TDSDEDUCTABLEAMOUNT,',
'       a.TDSALREADYDEDUCTEDON,',
'       a.PAIDTO,',
'       a.NARRATION,',
'       a.CREATOR,',
'       a.CREATIONTIME,',
'       a.BANKACCOUNTNO,',
'       a.TRANSACTIONTYPECODE,',
'       a.REVERSECHARGEIFAPPLICABLE,',
'       a.NATUREOFSUPPLYCODE,',
'       a.DUEDATE,',
'       a.REVERSECHARGEFOOTERNATURECODE,',
'       a.TDSNATURECODE,',
'       a.TDSPAYEECATEGORYCODE,',
'       a.PANNO,',
'       a.TDSTAXCATEGORYCODE,',
'       a.TDSTHRESHOLD,',
'       a.TDSTRANSACTIONTHRESHOLD,',
'       a.TOTALTDSPERCENT,',
'       a.ADVANCEORBILL,',
'       a.THRESHOLDPLUSMINUS,',
'       a.TDSDEDUCTEDINADVANCE,',
'       a.PAIDAMOUNT,',
'       a.PAIDINADVANCE,',
'       a.TDSCERTIFICATENO,',
'       a.TDSCERTIFICATEFILENAME,',
'       a.TDSLOWERRATEAPPLICABLE,',
'       a.TDSLOWERRATE,',
'       a.CESSLOWERRATE,',
'       a.SURCHARGELOWERRATE,',
'       a.FOOTERNATURECODE,',
'       a.BANKCODE,',
'       a.PAIDTOCODE,',
'       a.CHANGEFREIGHTRATE,',
'       a.SUMOFGPSDEDUCTIONAMOUNT,',
'       a.IFSCCODE,',
'       a.PAYMENTMETHODCODE,',
'       a.SMSFLAG,',
'       a.LOANAMOUNT,',
'       a.LOANTOTRANSPORTERTNO,',
'       a.NOOFLR,',
'       a.NETPAYABLEAFTERLOAN,',
'       a.PASSONQUANTITYCODE,',
'       a.BILLEDONQUANTITYCODE,',
'       a.SUMOFBILLEDAMOUNT,',
'       a.SUMOFBILLEDFOOTERAMOUNT,',
'       a.BILLEDFREIGHTADVICEAMOUNT,',
'       a.SUMOFFREIGHTDEDUCTIONAMOUNT,',
'       b.locationname ,',
'       c.doctypename ,',
'       d.partyname as transportername ,',
'       e.freighttypename,',
'                 ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''FreightAdvice1''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true'
||'" title="Action"></span</span></a>'' AS Print',
'',
'  from FREIGHTADVICE a , location b , doctype c , party d , freighttype e',
'  where a.locationcode = b.locationcode',
'  and a.doctypecode = c.doctypecode',
'  and a.TRANSPORTERCODE = d.partycode',
'  and a.freighttypecode = e.freighttypecode',
'  */',
'  select        a.TNO,',
'       a.COMPANYCODE,',
'       a.FINANCIALYEARCODE,',
'       a.LOCATIONCODE,',
'       a.DOCTYPECODE,',
'       a.FREIGHTADVICENO,',
'       a.FREIGHTADVICEDATE,',
'       a.TRANSPORTERCODE,',
'       a.FREIGHTTYPECODE,',
'       a.PARTYBILLNO,',
'       a.PARTYBILLDATE,',
'       a.MONEYTRANSFERMODECODE,',
'       a.MONEYTRANSFERREFERENCENO,',
'       a.DEBITACCOUNTCODE,',
'       a.CREDITACCOUNTCODE,',
'       a.TDSMASTERCODE,',
'       a.ITEMWISEFOOTER,',
'       a.REMARK,',
'       a.SUMOFAMOUNT,',
'       a.SUMOFFOOTERAMOUNT,',
'       a.FREIGHTADVICEAMOUNT,',
'       a.SUMOFTDSAMOUNT,',
'       a.SUMOFDEDUCTIONAMOUNT,',
'       a.SUMOFADVANCEAMOUNT,',
'       a.SUMOFPAYMENTCOMMISSION,',
'       a.SUMOFNETPAYABLEAMOUNT,',
'       a.AMOUNTAFTERTDS,',
'       --a.TDSDEDUCTABLEAMOUNT,',
'       a.TDSALREADYDEDUCTEDON,',
'       a.PAIDTO,',
'       a.NARRATION,',
'       a.CREATOR,',
'       a.CREATIONTIME,',
'       a.BANKACCOUNTNO,',
'       a.TRANSACTIONTYPECODE,',
'       a.REVERSECHARGEIFAPPLICABLE,',
'       a.NATUREOFSUPPLYCODE,',
'       a.DUEDATE,',
'       a.REVERSECHARGEFOOTERNATURECODE,',
'       a.TDSNATURECODE,',
'       a.TDSPAYEECATEGORYCODE,',
'       a.PANNO,',
'       a.TDSTAXCATEGORYCODE,',
'       a.TDSTHRESHOLD,',
'       a.TDSTRANSACTIONTHRESHOLD,',
'       a.TOTALTDSPERCENT,',
'       a.ADVANCEORBILL,',
'       a.THRESHOLDPLUSMINUS,',
'       a.TDSDEDUCTEDINADVANCE,',
'       a.PAIDAMOUNT,',
'       a.PAIDINADVANCE,',
'       a.TDSCERTIFICATENO,',
'       a.TDSCERTIFICATEFILENAME,',
'       a.TDSLOWERRATEAPPLICABLE,',
'       a.TDSLOWERRATE,',
'       a.CESSLOWERRATE,',
'       a.SURCHARGELOWERRATE,',
'       a.FOOTERNATURECODE,',
'       a.BANKCODE,',
'       a.PAIDTOCODE,',
'       a.CHANGEFREIGHTRATE,',
'       a.SUMOFGPSDEDUCTIONAMOUNT,',
'       a.IFSCCODE,',
'       a.PAYMENTMETHODCODE,',
'       a.SMSFLAG,',
'       a.LOANAMOUNT,',
'       a.LOANTOTRANSPORTERTNO,',
'       a.NOOFLR,',
'       a.NETPAYABLEAFTERLOAN,',
'       a.PASSONQUANTITYCODE,',
'       a.BILLEDONQUANTITYCODE,',
'       a.SUMOFBILLEDAMOUNT,',
'       a.SUMOFBILLEDFOOTERAMOUNT,',
'       a.BILLEDFREIGHTADVICEAMOUNT,',
'       a.SUMOFFREIGHTDEDUCTIONAMOUNT,',
'       a.locationname ,',
'       a.doctypename ,',
'       a.transportername ,',
'       a.freighttypename,',
'       a.ccinvoiceno,',
'       a.item,',
'       a.specification,',
'       a.QUANTITY1,',
'	   a.RATE,',
'       a.AMOUNT,',
'       a.FOOTERAMOUNT,',
'       a.TOTALAMOUNT ,',
'       a.TDSDEDUCTABLEAMOUNT,',
'       a.TDSAMOUNT ,',
'       a.NETFREIGHTAMOUNT,',
'       a.ADVANCEAMOUNT,',
'       a.NETPAYABLEAMOUNT,',
'       a.VehicleNo,',
'       a.ChalanQuantity1,',
'       a.ReachedQuantity1,',
'       a.TransactiontypeName,',
'       a.NatureOfSupplyName,',
'       a.ModuleNo,',
'       a.ModuleDate,',
'       a.Quantity1 as PassQuantity,',
'       a.ShortageQuantity1,',
'       a.DeductionRate,',
'       a.Unit,',
'       a.OtherAmount,',
'       a.DeductionAmount,',
'       a.TDSNatureName,',
'       a.CGSTAmt,',
'       a.SGSTAmt,',
'       a.IGSTAmt,',
'       a.PaymentAdviceNo,',
'       a.PaymentAdviceDate,',
'       a.PaymentStatus, ',
'       a.DocumentStatusCode,',
'          ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''FreightAdvice1''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title'
||'="Action"></span</span></a>'' AS Print  ',
'             from FREIGHTADVICEREGISTER_VW a',
'  where  a.FREIGHTADVICEDATE between :P198_FROMDATE and :P198_TODATE',
'  and ( :P198_COMPANY IS NULL OR instr('':''||:P198_COMPANY||'':'','':''||A.companyCODE||'':'') > 0 )',
'  and ( :P198_LOCATION IS NULL OR instr('':''||:P198_LOCATION||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
'  and getlocationprivilege( a.locationcode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES''',
'  and getdoctypeprivilege( a.doctypecode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES''',
'',
'  ORDER BY a.FREIGHTADVICEDATE DESC, a.freightadviceno desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Freight Advice List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(498468198165442454)
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
,p_detail_link=>'f?p=&APP_ID.:199:&SESSION.::&DEBUG.:RP,:P199_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>472308369021736506
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206428063279141271)
,p_db_column_name=>'ADVANCEAMOUNT'
,p_display_order=>245
,p_column_identifier=>'CN'
,p_column_label=>'Advance Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498486977864442478)
,p_db_column_name=>'ADVANCEORBILL'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Advance or Bill'
,p_column_html_expression=>'<div style="display:block; width:100px">#ADVANCEORBILL#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427512173141266)
,p_db_column_name=>'AMOUNT'
,p_display_order=>195
,p_column_identifier=>'CI'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498479052994442476)
,p_db_column_name=>'AMOUNTAFTERTDS'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Amount After TDS'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498481859758442476)
,p_db_column_name=>'BANKACCOUNTNO'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Bank Account No'
,p_column_html_expression=>'<div style="display:block; width:110px">#BANKACCOUNTNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498491811447442479)
,p_db_column_name=>'BANKCODE'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Bank'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498497811652442481)
,p_db_column_name=>'BILLEDFREIGHTADVICEAMOUNT'
,p_display_order=>74
,p_column_identifier=>'BV'
,p_column_label=>'Billed Freight Advice Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498496656211442481)
,p_db_column_name=>'BILLEDONQUANTITYCODE'
,p_display_order=>71
,p_column_identifier=>'BS'
,p_column_label=>'Billed On Quantity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427048542141261)
,p_db_column_name=>'CCINVOICENO'
,p_display_order=>145
,p_column_identifier=>'CD'
,p_column_label=>'Ccinvoiceno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498490645403442479)
,p_db_column_name=>'CESSLOWERRATE'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'CESS Lower Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217649137181454062)
,p_db_column_name=>'CGSTAMT'
,p_display_order=>425
,p_column_identifier=>'DF'
,p_column_label=>'CGST Amt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217647876978454049)
,p_db_column_name=>'CHALANQUANTITY1'
,p_display_order=>295
,p_column_identifier=>'CS'
,p_column_label=>'Challan Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498492653252442480)
,p_db_column_name=>'CHANGEFREIGHTRATE'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Change Freight Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498469049404442471)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217647685311454047)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>275
,p_column_identifier=>'CQ'
,p_column_label=>'Creation Time'
,p_column_html_expression=>'<div style="display:block; width:150px">#CREATIONTIME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498480983925442476)
,p_db_column_name=>'CREATOR'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Creator'
,p_column_html_expression=>'<div style="display:block; width:110px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498474190832442474)
,p_db_column_name=>'CREDITACCOUNTCODE'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Credit Account'
,p_column_html_expression=>'<div style="display:block; width:100px">#CREDITACCOUNTCODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498473838491442474)
,p_db_column_name=>'DEBITACCOUNTCODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Debit Account'
,p_column_html_expression=>'<div style="display:block; width:100px">#DEBITACCOUNTCODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648906495454060)
,p_db_column_name=>'DEDUCTIONAMOUNT'
,p_display_order=>405
,p_column_identifier=>'DD'
,p_column_label=>'Deduction Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648671820454057)
,p_db_column_name=>'DEDUCTIONRATE'
,p_display_order=>375
,p_column_identifier=>'DA'
,p_column_label=>'Deduction Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498470227556442472)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Doctype Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(557033886639861455)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>95
,p_column_identifier=>'BY'
,p_column_label=>'Doctype'
,p_column_html_expression=>'<div style="display:block; width:100px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217649705625454068)
,p_db_column_name=>'DOCUMENTSTATUSCODE'
,p_display_order=>485
,p_column_identifier=>'DL'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498483439408442477)
,p_db_column_name=>'DUEDATE'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<div style="display:block; width:100px">#DUEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498469464341442472)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financial Year'
,p_column_html_expression=>'<div style="display:block; width:100px">#FINANCIALYEARCODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427611457141267)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>205
,p_column_identifier=>'CJ'
,p_column_label=>'Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498491366089442479)
,p_db_column_name=>'FOOTERNATURECODE'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Footer Nature'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498476584046442475)
,p_db_column_name=>'FREIGHTADVICEAMOUNT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Freight Advice amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498471062198442472)
,p_db_column_name=>'FREIGHTADVICEDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Freight Advice Date'
,p_column_html_expression=>'<div style="display:block; width:90px">#FREIGHTADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_static_id=>'FREIGHTADVICEDATE'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498470593876442472)
,p_db_column_name=>'FREIGHTADVICENO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Freight Advice No'
,p_column_html_expression=>'<div style="display:block; width:150px">#FREIGHTADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498471775082442472)
,p_db_column_name=>'FREIGHTTYPECODE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Freight Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(557034101667861457)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>115
,p_column_identifier=>'CA'
,p_column_label=>'Freight type'
,p_column_html_expression=>'<div style="display:block; width:120px">#FREIGHTTYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498493411016442480)
,p_db_column_name=>'IFSCCODE'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Ifsc Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217649312467454064)
,p_db_column_name=>'IGSTAMT'
,p_display_order=>445
,p_column_identifier=>'DH'
,p_column_label=>'IGST Amt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427186558141262)
,p_db_column_name=>'ITEM'
,p_display_order=>155
,p_column_identifier=>'CE'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498475046328442474)
,p_db_column_name=>'ITEMWISEFOOTER'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Itemwisefooter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498494611553442480)
,p_db_column_name=>'LOANAMOUNT'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Loan Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498495007426442480)
,p_db_column_name=>'LOANTOTRANSPORTERTNO'
,p_display_order=>67
,p_column_identifier=>'BO'
,p_column_label=>'Loan To Transporter Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498469835879442472)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(557033772413861454)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>85
,p_column_identifier=>'BX'
,p_column_label=>'Location'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648348685454054)
,p_db_column_name=>'MODULEDATE'
,p_display_order=>345
,p_column_identifier=>'CX'
,p_column_label=>'Module Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#MODULEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648225378454053)
,p_db_column_name=>'MODULENO'
,p_display_order=>335
,p_column_identifier=>'CW'
,p_column_label=>'Module No'
,p_column_html_expression=>'<div style="display:block; width:150px">#MODULENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498473018415442473)
,p_db_column_name=>'MONEYTRANSFERMODECODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Money Transfer Mode'
,p_column_html_expression=>'<div style="display:block; width:110px">#MONEYTRANSFERMODECODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498473447291442474)
,p_db_column_name=>'MONEYTRANSFERREFERENCENO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Money Transfer Reference No'
,p_column_html_expression=>'<div style="display:block; width:120px">#MONEYTRANSFERREFERENCENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498480651315442476)
,p_db_column_name=>'NARRATION'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Narration'
,p_column_html_expression=>'<div style="display:block; width:200px">#NARRATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498483016601442477)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Nature Of Supply'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648095285454052)
,p_db_column_name=>'NATUREOFSUPPLYNAME'
,p_display_order=>325
,p_column_identifier=>'CV'
,p_column_label=>'Nature Of Supply Name'
,p_column_html_expression=>'<div style="display:block; width:140px">#NATUREOFSUPPLYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427957928141270)
,p_db_column_name=>'NETFREIGHTAMOUNT'
,p_display_order=>235
,p_column_identifier=>'CM'
,p_column_label=>'Net Freight Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498495813971442481)
,p_db_column_name=>'NETPAYABLEAFTERLOAN'
,p_display_order=>69
,p_column_identifier=>'BQ'
,p_column_label=>'Net Payable After Loan'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206428129342141272)
,p_db_column_name=>'NETPAYABLEAMOUNT'
,p_display_order=>255
,p_column_identifier=>'CO'
,p_column_label=>'Net Payable Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498495456540442481)
,p_db_column_name=>'NOOFLR'
,p_display_order=>68
,p_column_identifier=>'BP'
,p_column_label=>'Nooflr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648886391454059)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>395
,p_column_identifier=>'DC'
,p_column_label=>'Other Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498488205032442478)
,p_db_column_name=>'PAIDAMOUNT'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Paid Amount'
,p_column_html_expression=>'<div style="display:block; width:100px">#PAIDAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498488632393442479)
,p_db_column_name=>'PAIDINADVANCE'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Paid In Advance'
,p_column_html_expression=>'<div style="display:block; width:100px">#PAIDINADVANCE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498480247017442476)
,p_db_column_name=>'PAIDTO'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Paid To'
,p_column_html_expression=>'<div style="display:block; width:150px">#PAIDTO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498492204747442480)
,p_db_column_name=>'PAIDTOCODE'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Paidtocode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498485033515442477)
,p_db_column_name=>'PANNO'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'PAN No'
,p_column_html_expression=>'<div style="display:block; width:100px">#PANNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498472637305442473)
,p_db_column_name=>'PARTYBILLDATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Party Bill Date'
,p_column_html_expression=>'<div style="display:block; width:100px">#PARTYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498472250419442472)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Party Bill No'
,p_column_html_expression=>'<div style="display:block; width:140px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498496170865442481)
,p_db_column_name=>'PASSONQUANTITYCODE'
,p_display_order=>70
,p_column_identifier=>'BR'
,p_column_label=>'Pass On Quantity'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648393872454055)
,p_db_column_name=>'PASSQUANTITY'
,p_display_order=>355
,p_column_identifier=>'CY'
,p_column_label=>'Pass Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217649508599454066)
,p_db_column_name=>'PAYMENTADVICEDATE'
,p_display_order=>465
,p_column_identifier=>'DJ'
,p_column_label=>'Payment Advice Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PAYMENTADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217649450079454065)
,p_db_column_name=>'PAYMENTADVICENO'
,p_display_order=>455
,p_column_identifier=>'DI'
,p_column_label=>'Payment Advice No'
,p_column_html_expression=>'<div style="display:block; width:130px">#PAYMENTADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498493781131442480)
,p_db_column_name=>'PAYMENTMETHODCODE'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Payment Method'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217649633557454067)
,p_db_column_name=>'PAYMENTSTATUS'
,p_display_order=>475
,p_column_identifier=>'DK'
,p_column_label=>'Payment Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206428260885141273)
,p_db_column_name=>'PRINT'
,p_display_order=>265
,p_column_identifier=>'CP'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427355185141264)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>175
,p_column_identifier=>'CG'
,p_column_label=>'Quantity1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427431987141265)
,p_db_column_name=>'RATE'
,p_display_order=>185
,p_column_identifier=>'CH'
,p_column_label=>'Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217647922111454050)
,p_db_column_name=>'REACHEDQUANTITY1'
,p_display_order=>305
,p_column_identifier=>'CT'
,p_column_label=>'Reached Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498475444339442475)
,p_db_column_name=>'REMARK'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Remark'
,p_column_html_expression=>'<div style="display:block; width:190px">#REMARK#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498483820489442477)
,p_db_column_name=>'REVERSECHARGEFOOTERNATURECODE'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Reverse Charge Footer Nature Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498482609268442477)
,p_db_column_name=>'REVERSECHARGEIFAPPLICABLE'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Reverse Charge If Applicable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217649272487454063)
,p_db_column_name=>'SGSTAMT'
,p_display_order=>435
,p_column_identifier=>'DG'
,p_column_label=>'SGST Amt'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648544365454056)
,p_db_column_name=>'SHORTAGEQUANTITY1'
,p_display_order=>365
,p_column_identifier=>'CZ'
,p_column_label=>'Shortage Quantity'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498494182805442480)
,p_db_column_name=>'SMSFLAG'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Sms Flag'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427239064141263)
,p_db_column_name=>'SPECIFICATION'
,p_display_order=>165
,p_column_identifier=>'CF'
,p_column_label=>'Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498477776971442475)
,p_db_column_name=>'SUMOFADVANCEAMOUNT'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Sum Of Advance Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498475852268442475)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Sum Of Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498497033069442481)
,p_db_column_name=>'SUMOFBILLEDAMOUNT'
,p_display_order=>72
,p_column_identifier=>'BT'
,p_column_label=>'Sum Of Billed Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498497380279442481)
,p_db_column_name=>'SUMOFBILLEDFOOTERAMOUNT'
,p_display_order=>73
,p_column_identifier=>'BU'
,p_column_label=>'Sum Of Billed Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498477427532442475)
,p_db_column_name=>'SUMOFDEDUCTIONAMOUNT'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Sum Of Deduction Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498476205240442475)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Sum Of Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498498200683442482)
,p_db_column_name=>'SUMOFFREIGHTDEDUCTIONAMOUNT'
,p_display_order=>75
,p_column_identifier=>'BW'
,p_column_label=>'Sum Of Freight Deduction Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498492984842442480)
,p_db_column_name=>'SUMOFGPSDEDUCTIONAMOUNT'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Sum of Gps Deduction Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498478578283442476)
,p_db_column_name=>'SUMOFNETPAYABLEAMOUNT'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Sum Of Net Payable Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498478183783442475)
,p_db_column_name=>'SUMOFPAYMENTCOMMISSION'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Sum Of Payment Commission'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498477000276442475)
,p_db_column_name=>'SUMOFTDSAMOUNT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Sum Of Tds Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498491020166442479)
,p_db_column_name=>'SURCHARGELOWERRATE'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Surcharge lower Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498479793899442476)
,p_db_column_name=>'TDSALREADYDEDUCTEDON'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'TDS Already Deducted On'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427820814141269)
,p_db_column_name=>'TDSAMOUNT'
,p_display_order=>225
,p_column_identifier=>'CL'
,p_column_label=>'TDS Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498489452771442479)
,p_db_column_name=>'TDSCERTIFICATEFILENAME'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'TDS Certificate File Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498489009296442479)
,p_db_column_name=>'TDSCERTIFICATENO'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'TDS Certificate No'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSCERTIFICATENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498479445562442476)
,p_db_column_name=>'TDSDEDUCTABLEAMOUNT'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'TDS Deductable Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498487842822442478)
,p_db_column_name=>'TDSDEDUCTEDINADVANCE'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'TDS Deducted In Advance'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSDEDUCTEDINADVANCE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498490249226442479)
,p_db_column_name=>'TDSLOWERRATE'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'TDS Lower Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498489825544442479)
,p_db_column_name=>'TDSLOWERRATEAPPLICABLE'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'TDS Lower Rate Applicable'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498474646713442474)
,p_db_column_name=>'TDSMASTERCODE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'TDS Master'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSMASTERCODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498484216356442477)
,p_db_column_name=>'TDSNATURECODE'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Tds Nature Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217649009850454061)
,p_db_column_name=>'TDSNATURENAME'
,p_display_order=>415
,p_column_identifier=>'DE'
,p_column_label=>'TDS Nature Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498484660217442477)
,p_db_column_name=>'TDSPAYEECATEGORYCODE'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Tds Payee Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498485437026442478)
,p_db_column_name=>'TDSTAXCATEGORYCODE'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'TDS Tax Category'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSTAXCATEGORYCODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498485770531442478)
,p_db_column_name=>'TDSTHRESHOLD'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'TDS Threshold'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSTHRESHOLD#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498486185633442478)
,p_db_column_name=>'TDSTRANSACTIONTHRESHOLD'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'TDS Transaction Threshold'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSTRANSACTIONTHRESHOLD#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498487459876442478)
,p_db_column_name=>'THRESHOLDPLUSMINUS'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Threshold Plus Minus'
,p_column_html_expression=>'<div style="display:block; width:100px">#THRESHOLDPLUSMINUS#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498468643599442466)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(206427749911141268)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>215
,p_column_identifier=>'CK'
,p_column_label=>'Total Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498486660220442478)
,p_db_column_name=>'TOTALTDSPERCENT'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Total TDS Percent'
,p_column_html_expression=>'<div style="display:block; width:100px">#TOTALTDSPERCENT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498482204375442477)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Transaction Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648084600454051)
,p_db_column_name=>'TRANSACTIONTYPENAME'
,p_display_order=>315
,p_column_identifier=>'CU'
,p_column_label=>'Transaction Type Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#TRANSACTIONTYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(498471412308442472)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Transporter '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(557033967748861456)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>105
,p_column_identifier=>'BZ'
,p_column_label=>'Transporter'
,p_column_html_expression=>'<div style="display:block; width:190px">#TRANSPORTERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217648761264454058)
,p_db_column_name=>'UNIT'
,p_display_order=>385
,p_column_identifier=>'DB'
,p_column_label=>'Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(217647761831454048)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>285
,p_column_identifier=>'CR'
,p_column_label=>'Vehicle No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(498836987698446036)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'406021'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:DOCUMENTSTATUSCODE:LOCATIONNAME:DOCTYPENAME:FREIGHTADVICENO:FREIGHTADVICEDATE:TRANSPORTERNAME:PANNO:FREIGHTTYPENAME:PARTYBILLNO:PARTYBILLDATE:TRANSACTIONTYPENAME:NATUREOFSUPPLYNAME:TDSNATURENAME:MODULENO:MODULEDATE:VEHICLENO:CHALANQUANTITY1:REA'
||'CHEDQUANTITY1:PASSQUANTITY:SHORTAGEQUANTITY1:DEDUCTIONRATE:RATE:UNIT:OTHERAMOUNT:AMOUNT:CGSTAMT:SGSTAMT:IGSTAMT:TOTALAMOUNT:ADVANCEAMOUNT:DEDUCTIONAMOUNT:TDSAMOUNT:SUMOFBILLEDAMOUNT:NETPAYABLEAMOUNT:PAYMENTSTATUS:PAYMENTADVICENO:PAYMENTADVICEDATE:CRE'
||'ATOR:CREATIONTIME'
,p_sum_columns_on_break=>'SUMOFFOOTERAMOUNT:SUMOFTDSAMOUNT:CHALANQUANTITY1:REACHEDQUANTITY1:PASSQUANTITY:SHORTAGEQUANTITY1:OTHERAMOUNT:AMOUNT:CGSTAMT:SGSTAMT:IGSTAMT:TOTALAMOUNT:ADVANCEAMOUNT:DEDUCTIONAMOUNT:TDSAMOUNT:SUMOFBILLEDAMOUNT:NETPAYABLEAMOUNT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(100892296146709594)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(498468087132442454)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:199:&SESSION.::&DEBUG.:199::'
,p_icon_css_classes=>'fa-plus-circle-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(100891885071709594)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(498468087132442454)
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
 p_id=>wwv_flow_imp.id(100891472682709593)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(498468087132442454)
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
 p_id=>wwv_flow_imp.id(100893073689709599)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(559970454984903167)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'NEXT'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(465845988204897379)
,p_name=>'P198_BIREPORTURL'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(559970454984903167)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(303511563856899810)
,p_name=>'P198_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(559970454984903167)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select companyname D, companycode R from company  ',
'where companycode in (select distinct companycode from freightadvice)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(560033228920903409)
,p_name=>'P198_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(559970454984903167)
,p_item_default=>'select trunc(sysdate - 7) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(561036009425372161)
,p_name=>'P198_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(559970454984903167)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct b.locationname D, b.locationcode R from FREIGHTADVICE a , location b',
'where a.locationcode = b.locationcode'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
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
 p_id=>wwv_flow_imp.id(207385828751048213)
,p_name=>'P198_TNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(559970454984903167)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(561035943372372160)
,p_name=>'P198_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(559970454984903167)
,p_item_default=>'select trunc(sysdate) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(100896422031709605)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(100891472682709593)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100896834405709605)
,p_event_id=>wwv_flow_imp.id(100896422031709605)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(100895467601709604)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100895945868709605)
,p_event_id=>wwv_flow_imp.id(100895467601709604)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(100897254394709605)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(100897768705709605)
,p_event_id=>wwv_flow_imp.id(100897254394709605)
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
