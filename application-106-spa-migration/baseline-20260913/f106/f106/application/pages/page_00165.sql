prompt --application/pages/page_00165
begin
--   Manifest
--     PAGE: 00165
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
 p_id=>165
,p_name=>'Credit Note List'
,p_alias=>'CREDIT-NOTE-LIST'
,p_step_title=>'Credit Note List'
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
'  var bireporturl = $(''#P165_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/CreditNoteRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P165_FROMDATE'').val());',
'  var toDate = new Date($(''#P165_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P165_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P165_COMPANY'').val() ==="" || $(''#P165_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P165_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P165_COMPANY'').val();',
'       global_companycode= $(''#P165_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'      ''&P_COMPANY=''+ companycode +  ',
'      ''&P_PARTY='' +$(''#P165_PARTY'').val() +   ',
'      ''&P_FROMDATE='' +$(''#P165_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P165_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P165_LOCATION'').val() + ',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode;',
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
'  var bireporturl = $(''#P165_BIREPORTURL'').val()',
'  var reportName =  ''CreditNoteRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P165_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P165_COMPANY'').val() ==="" || $(''#P165_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P165_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P165_COMPANY'').val();',
'       global_companycode= $(''#P165_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P165_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' +$(''#P165_PARTY'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P165_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P165_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P165_LOCATION'').val() + ''",'' +    ',
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
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(863589971090883140)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(801384753786481411)
,p_plug_name=>'Report'
,p_static_id=>'report'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.COMPANYCODE,',
'       a.FINANCIALYEARCODE,',
'       a.LOCATIONCODE,',
'       a.DOCTYPECODE,',
'       a.DEPARTMENTCODE,',
'       a.EMPLOYEECODE,',
'       a.CREDITNOTENO,',
'       a.CREDITNOTEDATE,',
'       a.DELIVERYDATE,',
'       a.CURRENCYUNITCODE,',
'       a.CURRENCYVALUE,',
'       a.PARTYCODE,',
'       a.SUMOFAMOUNT,',
'       a.SUMOFFOOTERAMOUNT,',
'       a.CREDITNOTEAMOUNT,',
'       a.SUBJECTTEXT,',
'       a.REFERENCETEXT,',
'       a.LETTERTEXT,',
'       a.TITLETEXT,',
'       a.REMARK,',
'       a.ITEMWISEFOOTER,',
'       a.WORKORDERTNO,',
'       a.AGENTCODE,',
'       a.CONSIGNEECODE,',
'       a.REFERENCETNO,',
'       a.VALIDITYUPTODATE,',
'       a.CREDITDAYS,',
'       a.COMMISSIONRATE,',
'       a.TRANSPORTERCODE,',
'       a.FREIGHTTYPECODE,',
'       a.DESPATCHCATEGORYCODE,',
'       a.CREATOR,',
'       a.CREATIONTIME,',
'       a.TRANSACTIONTYPECODE,',
'       a.REFERENCEMODULETNO,',
'       a.REFERENCEMODULECODE,',
'       a.PARTYDEBITNOTENO,',
'       a.PARTYDEBITNOTEDATE,',
'       a.REASONFORISSUINGNOTECODE,',
'       a.PREGST,',
'       a.PARTYINVOICENO,',
'       a.PARTYINVOICEDATE,',
'       a.PARTYINVOICEVALUE,',
'       a.MODULECODE,',
'       a.MODULETNO,',
'       a.INCLUDEINGSTR2,',
'       a.NATUREOFSUPPLYCODE,',
'       a.REFDATE,',
'       a.DUEDATE,',
'       a.FORDAYS,',
'       b.LOCATIONNAME,',
'       c.DOCTYPENAME,',
'       d.DEPARTMENTNAME,',
'       e.EMPLOYEENAME , ',
'       f.partyname,',
'                 ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||a.Tno||'',''||''CreditNote1''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" t'
||'itle="Action"></span</span></a>'' AS Print',
'',
'  from CREDITNOTE a , LOCATION b , DOCTYPE c, DEPARTMENT d , EMPLOYEE e ,',
'  party f',
'  where a.LOCATIONCODE = b.LOCATIONCODE(+)',
'  and a.DOCTYPECODE = c.DOCTYPECODE(+)',
'  and a.DEPARTMENTCODE = d.DEPARTMENTCODE(+)',
'  and a.EMPLOYEECODE = e.EMPLOYEECODE(+)',
'  and a.partycode = f.partycode(+)',
'  and a.CREDITNOTEDATE between :P165_FROMDATE and :P165_TODATE',
'  and ( :P165_COMPANY IS NULL OR instr('':''||:P165_COMPANY||'':'','':''||A.companyCODE||'':'') > 0 )',
'  and ( :P165_LOCATION IS NULL OR instr('':''||:P165_LOCATION||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
'  and ( :P165_PARTY IS NULL OR instr('':''||:P165_PARTY||'':'','':''||A.PARTYCODE||'':'') > 0 )',
'  order by a.CREDITNOTEDATE desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Report'
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
 p_id=>wwv_flow_imp.id(801384939766481412)
,p_max_row_count=>'1000000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:166:&SESSION.::&DEBUG.:166:P166_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>360998594515554888
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801387243040481436)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801415182547935391)
,p_db_column_name=>'COMMISSIONRATE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Commission Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385137072481414)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801387403800481437)
,p_db_column_name=>'CONSIGNEECODE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Consignee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801415662722935396)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801415573889935395)
,p_db_column_name=>'CREATOR'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801387674297481440)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Credit Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386493213481428)
,p_db_column_name=>'CREDITNOTEAMOUNT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Credit Note Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385817996481421)
,p_db_column_name=>'CREDITNOTEDATE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Credit Note Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385696833481420)
,p_db_column_name=>'CREDITNOTENO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Credit Note No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385959781481423)
,p_db_column_name=>'CURRENCYUNITCODE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Currency Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386117999481424)
,p_db_column_name=>'CURRENCYVALUE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Currency Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385917568481422)
,p_db_column_name=>'DELIVERYDATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Delivery Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385455414481418)
,p_db_column_name=>'DEPARTMENTCODE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(861222522441121734)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'Department Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801415487368935394)
,p_db_column_name=>'DESPATCHCATEGORYCODE'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'Despatch Category'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385422776481417)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(861222340961121733)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'Doctype Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801417269834935412)
,p_db_column_name=>'DUEDATE'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385549616481419)
,p_db_column_name=>'EMPLOYEECODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(861222541599121735)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385166179481415)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801417372336935413)
,p_db_column_name=>'FORDAYS'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'For Days'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801415357878935393)
,p_db_column_name=>'FREIGHTTYPECODE'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Freight Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416944575935409)
,p_db_column_name=>'INCLUDEINGSTR2'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'Includeingstr2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801387072171481434)
,p_db_column_name=>'ITEMWISEFOOTER'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Item Wise Footer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386743065481431)
,p_db_column_name=>'LETTERTEXT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Letter Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801385260790481416)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(861222263246121732)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416770328935407)
,p_db_column_name=>'MODULECODE'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'Module'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416861219935408)
,p_db_column_name=>'MODULETNO'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'Module Tno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801417056517935410)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'Nature of Supply'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386158071481425)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416155944935401)
,p_db_column_name=>'PARTYDEBITNOTEDATE'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Party Debit Note Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416059309935400)
,p_db_column_name=>'PARTYDEBITNOTENO'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Party Debit Note No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416624986935405)
,p_db_column_name=>'PARTYINVOICEDATE'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Party Invoice Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416534682935404)
,p_db_column_name=>'PARTYINVOICENO'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Party Invoice No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416683517935406)
,p_db_column_name=>'PARTYINVOICEVALUE'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'Party Invoice Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(864154038795163396)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416377675935403)
,p_db_column_name=>'PREGST'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Pregst'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291366180170173264)
,p_db_column_name=>'PRINT'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416245736935402)
,p_db_column_name=>'REASONFORISSUINGNOTECODE'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Reason for issuing note '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801417181682935411)
,p_db_column_name=>'REFDATE'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'Ref Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801416030906935399)
,p_db_column_name=>'REFERENCEMODULECODE'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Reference Module'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801415937770935398)
,p_db_column_name=>'REFERENCEMODULETNO'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'Reference Module Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386690749481430)
,p_db_column_name=>'REFERENCETEXT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Reference Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801387446860481438)
,p_db_column_name=>'REFERENCETNO'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Reference Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386964555481433)
,p_db_column_name=>'REMARK'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386561644481429)
,p_db_column_name=>'SUBJECTTEXT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Subject Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386300304481426)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Sum Of Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386428133481427)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Sum of Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801386932500481432)
,p_db_column_name=>'TITLETEXT'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Title Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801384944809481413)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801415791800935397)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Transaction Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801415309939935392)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Transporter'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801387554159481439)
,p_db_column_name=>'VALIDITYUPTODATE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Validity Upto Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(801387142484481435)
,p_db_column_name=>'WORKORDERTNO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Work Order Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(801435945920939318)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'390132'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOCATIONNAME:DEPARTMENTNAME:DOCTYPENAME:EMPLOYEENAME:FINANCIALYEARCODE:CREDITNOTENO:CREDITNOTEDATE:DELIVERYDATE:CURRENCYUNITCODE:CURRENCYVALUE:PARTYNAME:SUMOFAMOUNT:SUMOFFOOTERAMOUNT:CREDITNOTEAMOUNT:SUBJECTTEXT:REFERENCETEXT:LETTERTEXT:TITLETEXT:REM'
||'ARK:ITEMWISEFOOTER:WORKORDERTNO:AGENTCODE:CONSIGNEECODE:REFERENCETNO:VALIDITYUPTODATE:CREDITDAYS:COMMISSIONRATE:TRANSPORTERCODE:FREIGHTTYPECODE:DESPATCHCATEGORYCODE:CREATOR:CREATIONTIME:TRANSACTIONTYPECODE:REFERENCEMODULETNO:REFERENCEMODULECODE:PARTY'
||'DEBITNOTENO:PARTYDEBITNOTEDATE:REASONFORISSUINGNOTECODE:PREGST:PARTYINVOICENO:PARTYINVOICEDATE:PARTYINVOICEVALUE:MODULECODE:MODULETNO:INCLUDEINGSTR2:NATUREOFSUPPLYCODE:REFDATE:DUEDATE:FORDAYS'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(608511594943865908)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(801384753786481411)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_static_id=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:166:&SESSION.::&DEBUG.:166::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(608140496641356469)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(801384753786481411)
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
 p_id=>wwv_flow_imp.id(444423999902994253)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(801384753786481411)
,p_button_name=>'Pdf'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(608512432066865917)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(863589971090883140)
,p_button_name=>'Refresh'
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
 p_id=>wwv_flow_imp.id(444464115795248899)
,p_name=>'P165_BIREPORTURL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(863589971090883140)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(444402398978359077)
,p_name=>'P165_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(863589971090883140)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PURCHASEORDER''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'   and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'  ;'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(864172691839163505)
,p_name=>'P165_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(863589971090883140)
,p_item_default=>'select trunc(sysdate-7) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(864172853824163507)
,p_name=>'P165_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(863589971090883140)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select locationname , locationcode',
'from location  ',
'where locationcode in (',
'    select distinct locationcode from creditnote',
')'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(864172986047163508)
,p_name=>'P165_PARTY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(863589971090883140)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select partyname , partycode',
'from party  ',
'where partycode in (',
'    select distinct partycode from creditnote',
')'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(452588681422166925)
,p_name=>'P165_TNO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(863589971090883140)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(864172717646163506)
,p_name=>'P165_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(863589971090883140)
,p_item_default=>'select trunc(sysdate) from dual'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(444424073438994254)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(444423999902994253)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(444424152796994255)
,p_event_id=>wwv_flow_imp.id(444424073438994254)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp.component_end;
end;
/
