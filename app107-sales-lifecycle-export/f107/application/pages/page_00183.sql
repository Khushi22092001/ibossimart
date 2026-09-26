prompt --application/pages/page_00183
begin
--   Manifest
--     PAGE: 00183
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>183
,p_name=>'Sales GRN List'
,p_alias=>'SALES-GRN-LIST'
,p_step_title=>'Sales GRN List'
,p_warn_on_unsaved_changes=>'N'
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
'  var bireporturl = $(''#P183_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/SalesGRNRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P183_FROMDATE'').val());',
'  var toDate = new Date($(''#P183_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P183_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P183_COMPANY'').val() ==="" || $(''#P183_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P183_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P183_COMPANY'').val();',
'       global_companycode= $(''#P183_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +   ',
'      ''&P_FROMDATE='' +$(''#P183_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P183_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P183_LOCATION'').val() +',
'      ''&P_DOCTYPE='' +$(''#P183_DOCTYPE'').val() +',
'      ''&P_PARTY='' +$(''#P183_PARTY'').val() +',
'      ''&P_GRNNO='' +$(''#P183_CCINO'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
'      ',
'     ',
'       ;',
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
'  var bireporturl = $(''#P183_BIREPORTURL'').val()',
'  var reportName =  ''SalesGRNRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P183_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P183_COMPANY'').val() ==="" || $(''#P183_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P183_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P183_COMPANY'').val();',
'       global_companycode= $(''#P183_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P183_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' +',
'      ''"_paramsP_FROMDATE":"'' +$(''#P183_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P183_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P183_LOCATION'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' +$(''#P183_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' +$(''#P183_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_CCINO":"'' +$(''#P183_CCINO'').val() + ''",'' + ',
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
'',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(621711188481038680)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(622607851186302318)
,p_plug_name=>'Sales GRN List'
,p_static_id=>'sales-grn-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       GetCompanyName(a.COMPANYCODE) as companyname,',
'       a.FINANCIALYEARCODE,',
'       GetLocationName(a.LOCATIONCODE) as locationname,',
'       GetDoctypeName(a.DOCTYPECODE) as doctypename,',
'       GetDEPARTMENTName(a.DEPARTMENTCODE) as departmntname,',
'       a.EMPLOYEECODE,',
'       getemployeename(a.employeecode) as EmployeeName,',
'       a.SALESGRNNO,',
'       a.SALESGRNDATE,',
'       a.CCINVOICETNO,',
'       b.ccinvoiceno,',
'       b.ccinvoicedate,',
'       a.DELIVERYDATE,',
'       a.CURRENCYUNITCODE,',
'       a.CURRENCYVALUE,',
'       a.PARTYCODE,',
'       getpartyname(a.partycode) as PartyName,',
'       a.SUMOFAMOUNT,',
'       a.SUMOFFOOTERAMOUNT,',
'       a.SALESGRNAMOUNT,',
'       a.REMARK,',
'       a.AGENTCODE,',
'       getpartyname(a.agentcode) as AgentName,',
'       getpartyname(a.CONSIGNEECODE) as consignee,',
'       a.transportercode,',
'       getpartyname(a.TRANSPORTERCODE) as TransporterName,',
'       a.CREATOR,',
'       a.CREATIONTIME,',
'       getDocumentStatusCode(getmodulecodeforpageno(:APP_PAGE_ID),a.tno) AS Status,',
'                 ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''SalesGRN''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" titl'
||'e="Action"></span</span></a>'' AS Print',
'---Lob locator',
'  from SALESGRN a, ccinvoice b',
'  where a.ccinvoicetno = b.tno(+)',
'   and a.salesgrndate between :P183_FROMDATE and :P183_TODATE',
'    and ( :P183_COMPANY is null or instr('':''||:P183_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'    and (:P183_LOCATION is null or instr('':''||:P183_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'    and (:P183_DOCTYPE is null or instr('':''||:P183_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'    and (:P183_PARTY is null or instr('':''||:P183_PARTY||'':'','':''||a.partyCode||'':'') > 0)',
'    and (:P183_ccino is null or instr('':''||:P183_CCINO||'':'','':''||b.tno||'':'') > 0)',
'  '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P183_COMPANY,P183_FROMDATE,P183_TODATE,P183_LOCATION,P183_DOCTYPE,P183_PARTY,P183_CCINO'
,p_prn_page_header=>'Sales GRN List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(622607981953302318)
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
,p_detail_link=>'f?p=&APP_ID.:184:&APP_SESSION.::&DEBUG.:RP:P184_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>172741432870909430
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622619066582302326)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Agentcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467268260334423181)
,p_db_column_name=>'AGENTNAME'
,p_display_order=>166
,p_column_identifier=>'BF'
,p_column_label=>'Agent'
,p_column_html_expression=>'<div style="display:block; width:140px">#AGENTNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467268028667423179)
,p_db_column_name=>'CCINVOICEDATE'
,p_display_order=>146
,p_column_identifier=>'BD'
,p_column_label=>'CCinvoice Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#CCINVOICEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467267912479423178)
,p_db_column_name=>'CCINVOICENO'
,p_display_order=>136
,p_column_identifier=>'BC'
,p_column_label=>'CCinvoice No'
,p_column_html_expression=>'<div style="display:block; width:130px">#CCINVOICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622611941407302321)
,p_db_column_name=>'CCINVOICETNO'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Ccinvoicetno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467242216398253972)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>86
,p_column_identifier=>'AX'
,p_column_label=>'Company'
,p_column_html_expression=>'<div style="display:block; width:130px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467268316741423182)
,p_db_column_name=>'CONSIGNEE'
,p_display_order=>176
,p_column_identifier=>'BG'
,p_column_label=>'Consignee'
,p_column_html_expression=>'<div style="display:block; width:140px">#CONSIGNEE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622623533747302328)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Creation Time'
,p_column_html_expression=>'<div style="display:block; width:130px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622622659554302328)
,p_db_column_name=>'CREATOR'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Creator'
,p_column_html_expression=>'<div style="display:block; width:110px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622612722767302323)
,p_db_column_name=>'CURRENCYUNITCODE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Currencyunitcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622613051332302323)
,p_db_column_name=>'CURRENCYVALUE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Currencyvalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'990D0'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622612332163302321)
,p_db_column_name=>'DELIVERYDATE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Deliverydate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467242556924253975)
,p_db_column_name=>'DEPARTMNTNAME'
,p_display_order=>116
,p_column_identifier=>'BA'
,p_column_label=>'Departmnt'
,p_column_html_expression=>'<div style="display:block; width:120px">#DEPARTMNTNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467242377578253974)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>106
,p_column_identifier=>'AZ'
,p_column_label=>'Doc  Type'
,p_column_html_expression=>'<div style="display:block; width:180px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622610763629302321)
,p_db_column_name=>'EMPLOYEECODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Employee Code'
,p_column_html_expression=>'<div style="display:block; width:100px">#EMPLOYEECODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467267805296423177)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>126
,p_column_identifier=>'BB'
,p_column_label=>'Employee'
,p_column_html_expression=>'<div style="display:block; width:130px">#EMPLOYEENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622609230887302319)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financial Year'
,p_column_html_expression=>'<div style="display:block; width:80px">#FINANCIALYEARCODE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467242304187253973)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>96
,p_column_identifier=>'AY'
,p_column_label=>'Location'
,p_column_html_expression=>'<div style="display:block; width:120px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622613460987302324)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467268168430423180)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>156
,p_column_identifier=>'BE'
,p_column_label=>'Party'
,p_column_html_expression=>'<div style="display:block; width:250px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(300846083911639625)
,p_db_column_name=>'PRINT'
,p_display_order=>206
,p_column_identifier=>'BJ'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622617517501302326)
,p_db_column_name=>'REMARK'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Remark'
,p_column_html_expression=>'<div style="display:block; width:140px">#REMARK#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622615520804302325)
,p_db_column_name=>'SALESGRNAMOUNT'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Sales GRN Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#SALESGRNAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622611494732302321)
,p_db_column_name=>'SALESGRNDATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Sales GRN Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#SALESGRNDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622611238269302321)
,p_db_column_name=>'SALESGRNNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Sales GRN No'
,p_column_html_expression=>'<div style="display:block; width:130px">#SALESGRNNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475067382469572756)
,p_db_column_name=>'STATUS'
,p_display_order=>196
,p_column_identifier=>'BI'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622614732083302325)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#SUMOFAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622615145939302325)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Footer Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#SUMOFFOOTERAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(622608411010302319)
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
 p_id=>wwv_flow_imp.id(622621498283302327)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Transportercode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467268450141423183)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>186
,p_column_identifier=>'BH'
,p_column_label=>'Transporter'
,p_column_html_expression=>'<div style="display:block; width:250px">#TRANSPORTERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(622765687827049004)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1728992'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:STATUS:LOCATIONNAME:DOCTYPENAME:SALESGRNNO:SALESGRNDATE:CCINVOICENO:CCINVOICEDATE:PARTYNAME:AGENTNAME:TRANSPORTERNAME:CONSIGNEE:DEPARTMNTNAME:SUMOFAMOUNT:SUMOFFOOTERAMOUNT:SALESGRNAMOUNT:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(622626782676302329)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(622607851186302318)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:184:&APP_SESSION.::&DEBUG.:184::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(623449561209987889)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(622607851186302318)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(621712046327038688)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(622607851186302318)
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
 p_id=>wwv_flow_imp.id(469310459919367950)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_warn_on_unsaved_changes=>null
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(469753774770233513)
,p_name=>'P183_BIREPORTURL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(621711898865038687)
,p_name=>'P183_CCINO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_prompt=>'Invoice No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ccinvoiceno d, tno r from ccinvoice',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(621711355570038681)
,p_name=>'P183_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'       b.CompanyName as d,',
'       b.CompanyCode as r',
'From   SalesGRN a,',
'       Company  b',
'Where  a.CompanyCode = b.CompanyCode(+)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_colspan=>4
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
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(621711700452038685)
,p_name=>'P183_DOCTYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_prompt=>'DocType'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'       b.DocTypeName as r,',
'       b.DocTypeCode as d',
'From   SalesGRN a,',
'       DocType  b',
'Where  a.DocTypeCode = b.DocTypeCode(+)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(621711470952038682)
,p_name=>'P183_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_item_default=>'trunc(sysdate) - 3'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(621711653602038684)
,p_name=>'P183_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'       b.LocationName as d,',
'       b.LocationCode as r',
'From   SalesGRN a,',
'       Location b',
'Where  a.LocationCode = b.LocationCode(+)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(621711776750038686)
,p_name=>'P183_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select Distinct ',
'       b.PartyName d,',
'       b.PartyCode r',
'From   SalesGRN a,',
'       Party b',
'Where  a.PartyCode = b.PartyCode(+)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(621711493746038683)
,p_name=>'P183_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(621711188481038680)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(621712152359038689)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(621712046327038688)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(621712174019038690)
,p_event_id=>wwv_flow_imp.id(621712152359038689)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(471999457262182079)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(471999529479182080)
,p_event_id=>wwv_flow_imp.id(471999457262182079)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(200370986136159586)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(200371393089159587)
,p_event_id=>wwv_flow_imp.id(200370986136159586)
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
 p_id=>wwv_flow_imp.id(469310513375367951)
,p_name=>'refresh'
,p_static_id=>'refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(469310459919367950)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(469310626033367952)
,p_event_id=>wwv_flow_imp.id(469310513375367951)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(622607851186302318)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
