prompt --application/pages/page_00178
begin
--   Manifest
--     PAGE: 00178
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
 p_id=>178
,p_name=>'Service Order List'
,p_alias=>'JOB-ORDER-LIST'
,p_step_title=>'Service Order List'
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
'  var bireporturl = $(''#P178_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/ServiceOrderRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P178_FROMDATE'').val());',
'  var toDate = new Date($(''#P178_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P178_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P178_COMPANY'').val() ==="" || $(''#P178_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P178_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P178_COMPANY'').val();',
'       global_companycode= $(''#P178_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode + ',
'      ''&P_LOCATION='' + $(''#P178_LOCATION'').val() +',
'      ''&P_FROMDATE='' +$(''#P178_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P178_TODATE'').val() + ',
'      ''&P_DOCTYPE='' +$(''#P178_DOCTYPE'').val() +',
'      ''&P_JOBTYPE='' +$(''#P178_JOBTYPE'').val() +',
'      ''&P_PARTY='' +$(''#P178_PARTY'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P178_BIREPORTURL'').val()',
'  var reportName =  ''ServiceOrderRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P178_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P178_COMPANY'').val() ==="" || $(''#P178_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P178_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P178_COMPANY'').val();',
'       global_companycode= $(''#P178_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P178_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P178_LOCATION'').val() + ''",'' +  ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P178_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P178_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' +$(''#P178_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_JOBTYPE":"'' +$(''#P178_JOBTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' +$(''#P178_PARTY'').val() + ''",'' + ',
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
 p_id=>wwv_flow_imp.id(475375325798177155)
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
 p_id=>wwv_flow_imp.id(604357070511912536)
,p_plug_name=>'Job Order List'
,p_static_id=>'job-order-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       GETCOMPANYNAME(A.COMPANYCODE) as companyname,',
'       A.FINANCIALYEARCODE,',
'       GetLocationName(A.LOCATIONCODE) as locationname,',
'       GetDoctypeName(A.DOCTYPECODE) as doctypename,',
'       GetDEPARTMENTName(A.DEPARTMENTCODE) as departmentname,',
'       GetEMPLOYEEName(A.EMPLOYEECODE) as employeename,',
'       A.JOBORDERNO,',
'       A.JOBORDERDATE,',
'       A.DELIVERYDATE,',
'       GetCurrencyunitName(A.CURRENCYUNITCODE) as currency,',
'       A.CURRENCYVALUE,',
'       A.WORKORDERTNO,',
'       GetPartyName(A.PARTYCODE) as partyname,',
'       A.SUMOFAMOUNT,',
'       A.SUMOFFOOTERAMOUNT,',
'       A.JOBORDERAMOUNT,',
'       A.SUBJECTTEXT,',
'       A.REFERENCETEXT,',
'       A.LETTERTEXT,',
'       A.TITLETEXT,',
'       A.REMARK,',
'       A.ITEMWISEFOOTER,',
'       A.EXECUTIONDAYS,',
'       A.WITHMATERIAL,',
'       A.BURNINGALLOWEDPERCENT,',
'       A.SCRAPALLOWEDPERCENT,',
'       A.INDENTTNO,',
'       A.RATECONTRACTTNO,',
'       A.JOBLOCATIONCODE,',
'       A.MAINTENANCEPLANTNO,',
'       A.AMCSTARTDATE,',
'       A.AMCENDDATE,',
'       A.WCT,',
'       A.TASKSNO,',
'       A.CREATOR,',
'       A.PROJECTTNO,',
'       A.JOBORDERTNO,',
'       A.REVISIONJOBORDERTNO,',
'       A.MAJORTASKSNO,',
'       A.REVISIONEFFECTIVEFROMDATE,',
'       A.CREDITDAYS,',
'       A.SUBSIDERYPURCHASEDBYSP,',
'       A.TRANCTIONTYPECODE,',
'       A.TRANSACTIONTYPECODE,',
'       A.PAYMENTBYLC,',
'       A.NATUREOFSUPPLYCODE,',
'       A.EQUIPMENTMAINTENANCEORDERTNO,',
'       A.RECEIPTOFBIDTNO,',
'       A.BIDCOMPARISONTNO,',
'       A.RFQSERVICETNO,',
'       A.TYPEOFWORKCODE,',
'       A.RETENTIONMONEYPERCANTAGE,',
'       A.BILLTOPARTYCODE,',
'       A.SHIPTOPARTYCODE,',
'       A.INVOICETOPARTYCODE,',
'       A.PAIDAMOUNT,',
'       A.REPAIRINGREQUISITIONTNO,',
'       A.GSTHOLD,',
'       A.CREATIONTIME,',
'       A.ISFULLADVANCE,',
'       A.JOBORDERADVANCEAMOUNT,',
'       A.PURCHASEORDERTNO,',
'       A.PAYMENTADVICELOCATIONCODE,',
'       A.CONVERSIONSTORAGELOCATIONCODE,',
'       A.REPAIRINGREQUISITIONSNO,',
'                 ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||a.Tno||'',''||''ServiceOrder''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" '
||'title="Action"></span</span></a>'' AS Print',
'',
'  from JOBORDER A, JOBORDERDETAIL B',
'  WHERE A.TNO = B.TNO   ',
'  AND a.JobOrderDate between :P178_FROMDATE and :P178_TODATE',
'  and ( :P178_DOCTYPE IS NULL OR instr('':''||:P178_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 ) ',
'  and ( :P178_LOCATION IS NULL OR instr('':''||:P178_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'  and ( :P178_COMPANY IS NULL OR instr('':''||:P178_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'  --and instr('':''||:P178_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0',
'  --and instr('':''||:P178_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  --and instr('':''||:P178_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and ( :P178_JOBTYPE IS NULL OR instr('':''||:P178_JOBTYPE||'':'','':''||b.JobTypeCode||'':'') > 0 ) ',
'  and ( :P178_PARTY IS NULL OR instr('':''||:P178_PARTY||'':'','':''||A.Partycode||'':'') > 0 ) ',
'',
'  order by JOBORDERDATE desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Job Order List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(604357227644912536)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:179:&APP_SESSION.::&DEBUG.:RP:P179_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>171512372202688762
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604370409763912560)
,p_db_column_name=>'AMCENDDATE'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Amcenddate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604369994677912560)
,p_db_column_name=>'AMCSTARTDATE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Amcstartdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604377189379912566)
,p_db_column_name=>'BIDCOMPARISONTNO'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Bidcomparisontno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604378792697912566)
,p_db_column_name=>'BILLTOPARTYCODE'
,p_display_order=>54
,p_column_identifier=>'BB'
,p_column_label=>'Billtopartycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604367566312912559)
,p_db_column_name=>'BURNINGALLOWEDPERCENT'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Burningallowedpercent'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604639894407598896)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>76
,p_column_identifier=>'BO'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604383207396912568)
,p_db_column_name=>'CONVERSIONSTORAGELOCATIONCODE'
,p_display_order=>65
,p_column_identifier=>'BM'
,p_column_label=>'Conversionstoragelocationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604381222986912568)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>60
,p_column_identifier=>'BH'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604371597958912560)
,p_db_column_name=>'CREATOR'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604374046881912564)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Credit Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604640414531598901)
,p_db_column_name=>'CURRENCY'
,p_display_order=>126
,p_column_identifier=>'BT'
,p_column_label=>'Currency'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604362053270912557)
,p_db_column_name=>'CURRENCYVALUE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Currency Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604361210028912557)
,p_db_column_name=>'DELIVERYDATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Delivery Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604640210273598899)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>106
,p_column_identifier=>'BR'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604640144347598898)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>96
,p_column_identifier=>'BQ'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604640341251598900)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>116
,p_column_identifier=>'BS'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604376402788912565)
,p_db_column_name=>'EQUIPMENTMAINTENANCEORDERTNO'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Equipmentmaintenanceordertno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604366813532912559)
,p_db_column_name=>'EXECUTIONDAYS'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Executiondays'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604358369503912556)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financial Year'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604380783263912568)
,p_db_column_name=>'GSTHOLD'
,p_display_order=>59
,p_column_identifier=>'BG'
,p_column_label=>'Gsthold'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604368428336912559)
,p_db_column_name=>'INDENTTNO'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Indenttno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604379583044912567)
,p_db_column_name=>'INVOICETOPARTYCODE'
,p_display_order=>56
,p_column_identifier=>'BD'
,p_column_label=>'Invoicetopartycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604381641244912568)
,p_db_column_name=>'ISFULLADVANCE'
,p_display_order=>61
,p_column_identifier=>'BI'
,p_column_label=>'Is Full Advance'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604366443143912559)
,p_db_column_name=>'ITEMWISEFOOTER'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Item Wise Footer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604369244181912560)
,p_db_column_name=>'JOBLOCATIONCODE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Joblocationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604381962585912568)
,p_db_column_name=>'JOBORDERADVANCEAMOUNT'
,p_display_order=>62
,p_column_identifier=>'BJ'
,p_column_label=>'Advance Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604364041692912558)
,p_db_column_name=>'JOBORDERAMOUNT'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Total Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604360847979912557)
,p_db_column_name=>'JOBORDERDATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Job Order Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604360416745912557)
,p_db_column_name=>'JOBORDERNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Job Order No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604372439181912561)
,p_db_column_name=>'JOBORDERTNO'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Jobordertno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604365166669912558)
,p_db_column_name=>'LETTERTEXT'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Letter Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604640048029598897)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>86
,p_column_identifier=>'BP'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604369613240912560)
,p_db_column_name=>'MAINTENANCEPLANTNO'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Maintenanceplantno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604373202940912561)
,p_db_column_name=>'MAJORTASKSNO'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Majortasksno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604376000386912565)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Nature Of Supply'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604379984374912567)
,p_db_column_name=>'PAIDAMOUNT'
,p_display_order=>57
,p_column_identifier=>'BE'
,p_column_label=>'Paidamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604640506595598902)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>136
,p_column_identifier=>'BU'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604382821248912568)
,p_db_column_name=>'PAYMENTADVICELOCATIONCODE'
,p_display_order=>64
,p_column_identifier=>'BL'
,p_column_label=>'Paymentadvicelocationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604375558193912565)
,p_db_column_name=>'PAYMENTBYLC'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Paymentbylc'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(283824263573470510)
,p_db_column_name=>'PRINT'
,p_display_order=>146
,p_column_identifier=>'BV'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604371981170912560)
,p_db_column_name=>'PROJECTTNO'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Projecttno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604382368893912568)
,p_db_column_name=>'PURCHASEORDERTNO'
,p_display_order=>63
,p_column_identifier=>'BK'
,p_column_label=>'Purchaseordertno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604368760725912559)
,p_db_column_name=>'RATECONTRACTTNO'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Ratecontracttno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604376830801912565)
,p_db_column_name=>'RECEIPTOFBIDTNO'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Receiptofbidtno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604364787671912558)
,p_db_column_name=>'REFERENCETEXT'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Reference Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604365967368912559)
,p_db_column_name=>'REMARK'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604383561915912569)
,p_db_column_name=>'REPAIRINGREQUISITIONSNO'
,p_display_order=>66
,p_column_identifier=>'BN'
,p_column_label=>'Repairingrequisitionsno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604380393441912568)
,p_db_column_name=>'REPAIRINGREQUISITIONTNO'
,p_display_order=>58
,p_column_identifier=>'BF'
,p_column_label=>'Repairingrequisitiontno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604378426793912566)
,p_db_column_name=>'RETENTIONMONEYPERCANTAGE'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Retentionmoneypercantage'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604373639069912564)
,p_db_column_name=>'REVISIONEFFECTIVEFROMDATE'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Revisioneffectivefromdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604372810045912561)
,p_db_column_name=>'REVISIONJOBORDERTNO'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Revisionjobordertno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604377623619912566)
,p_db_column_name=>'RFQSERVICETNO'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Rfqservicetno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604368024872912559)
,p_db_column_name=>'SCRAPALLOWEDPERCENT'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Scrapallowedpercent'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604379184610912566)
,p_db_column_name=>'SHIPTOPARTYCODE'
,p_display_order=>55
,p_column_identifier=>'BC'
,p_column_label=>'Shiptopartycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604364437500912558)
,p_db_column_name=>'SUBJECTTEXT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Subject Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604374376784912564)
,p_db_column_name=>'SUBSIDERYPURCHASEDBYSP'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Subsiderypurchasedbysp'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604363219093912558)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Sum Of Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604363613777912558)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Sum Of Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604371176414912560)
,p_db_column_name=>'TASKSNO'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Tasksno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604365615692912558)
,p_db_column_name=>'TITLETEXT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Title Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604357651677912549)
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
 p_id=>wwv_flow_imp.id(604374823468912564)
,p_db_column_name=>'TRANCTIONTYPECODE'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Tranctiontypecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604375162082912565)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Transaction Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604377963739912566)
,p_db_column_name=>'TYPEOFWORKCODE'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Typeofworkcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604370834357912560)
,p_db_column_name=>'WCT'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Wct'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604367196137912559)
,p_db_column_name=>'WITHMATERIAL'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Withmaterial'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604362390635912557)
,p_db_column_name=>'WORKORDERTNO'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Workordertno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(604384536182955754)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1715397'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:COMPANYNAME:LOCATIONNAME:DOCTYPENAME:PARTYNAME:JOBORDERNO:JOBORDERDATE:DEPARTMENTNAME:EMPLOYEENAME:SUMOFAMOUNT:SUMOFFOOTERAMOUNT:JOBORDERAMOUNT:ISFULLADVANCE:JOBORDERADVANCEAMOUNT:CREDITDAYS:TRANSACTIONTYPECODE:NATUREOFSUPPLYCODE:SUBJECTTEXT:RE'
||'FERENCETEXT:LETTERTEXT:TITLETEXT:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(604384146686912569)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(604357070511912536)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:179:&APP_SESSION.::&DEBUG.:179::'
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
 p_id=>wwv_flow_imp.id(603799222544014385)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(604357070511912536)
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
 p_id=>wwv_flow_imp.id(604688671681869557)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(604357070511912536)
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
 p_id=>wwv_flow_imp.id(447179563566634192)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454963823971083225)
,p_name=>'P178_BIREPORTURL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(464727498497796559)
,p_name=>'P178_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_prompt=>'Company'
,p_placeholder=>'Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.'''))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
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
 p_id=>wwv_flow_imp.id(464727610944796560)
,p_name=>'P178_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_prompt=>'DocType'
,p_placeholder=>'Enter DocType Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      dt.DocTypeName d,',
'      dt.DocTypeCode r',
'From  ModulePrivilege a, ModulePrivilegeDocType b, DocType dt, BossUser bu, ModuleDocType md, ModuleDocTypeDetail mdd',
'Where a.TNo = b.TNo(+)',
'  and (b.DocTypeCode = dt.DocTypeCode or b.DocTypeCode is null)',
'  and a.ModuleCode = md.ModuleCode',
'  and md.TNo = mdd.TNo',
'  and mdd.DocTypeCode = dt.DocTypeCode',
'  and a.ModuleCode = getmodulecodeforpageno(:APP_PAGE_ID)',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and instr('':''||:P178_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order by 1',
';'))
,p_lov_cascade_parent_items=>'P178_COMPANY'
,p_ajax_items_to_submit=>'P178_LOCATION,P178_DOCTYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(464700509901755142)
,p_name=>'P178_FROMDATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_item_default=>'Trunc(sysdate-7)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
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
 p_id=>wwv_flow_imp.id(446889735022276162)
,p_name=>'P178_JOBTYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_prompt=>'Jobtype'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'SELECT JOBTYPENAME D, JOBTYPECODE R FROM JOBTYPE ORDER BY 1'
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(464702117107755145)
,p_name=>'P178_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
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
' /* and a.CompanyCode = :P178_COMPANY */',
' and instr('':''||:P178_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P178_COMPANY'
,p_ajax_items_to_submit=>'P178_LOCATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(446889962127276164)
,p_name=>'P178_PARTY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_prompt=>'Party'
,p_placeholder=>'Enter DocType Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT B.PARTYNAME D,A.PARTYCODE R',
'FROM JOBORDER A, PARTY B',
'WHERE A.PARTYCODE = B.PARTYCODE(+)'))
,p_lov_cascade_parent_items=>'P178_COMPANY'
,p_ajax_items_to_submit=>'P178_LOCATION,P178_DOCTYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
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
 p_id=>wwv_flow_imp.id(440421339370799556)
,p_name=>'P178_TNO'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(535888481198896310)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(453981160270292737)
,p_name=>'P178_TNO_1'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(464700888494755143)
,p_name=>'P178_TODATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(475375325798177155)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(604688825332869559)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(604688671681869557)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604688890068869560)
,p_event_id=>wwv_flow_imp.id(604688825332869559)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(605152917115389590)
,p_name=>'Hide Nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(605153290390389590)
,p_event_id=>wwv_flow_imp.id(605152917115389590)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(604639692065598894)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604639799097598895)
,p_event_id=>wwv_flow_imp.id(604639692065598894)
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
