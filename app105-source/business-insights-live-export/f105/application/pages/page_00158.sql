prompt --application/pages/page_00158
begin
--   Manifest
--     PAGE: 00158
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
 p_id=>158
,p_name=>'Debit Note List'
,p_alias=>'DEBIT-NOTE-LIST'
,p_step_title=>'Debit Note List'
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
'  var bireporturl = $(''#P158_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/DebitNoteRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P158_FROMDATE'').val());',
'  var toDate = new Date($(''#P158_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P158_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P158_COMPANY'').val() ==="" || $(''#P158_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P158_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P158_COMPANY'').val();',
'       global_companycode= $(''#P158_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +     ',
'      ''&P_FROMDATE='' +$(''#P158_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P158_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P158_LOCATION'').val() + ',
'      ''&P_PARTY='' +$(''#P158_PARTY'').val() +',
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
'  var bireporturl = $(''#P158_BIREPORTURL'').val()',
'  var reportName =  ''DebitNoteRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P158_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P158_COMPANY'').val() ==="" || $(''#P158_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P158_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P158_COMPANY'').val();',
'       global_companycode= $(''#P158_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P158_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P158_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P158_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P158_LOCATION'').val() + ''",'' +    ',
'      ''"_paramsP_PARTY":"'' +$(''#P158_PARTY'').val() + ''",'' + ',
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
 p_id=>wwv_flow_imp.id(855475548046099083)
,p_plug_name=>'Debit Note List'
,p_static_id=>'debit-note-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.TNO,',
'       a.COMPANYCODE,',
'       a.FINANCIALYEARCODE,',
'       c.LOCATIONNAME AS LOCATIONCODE,',
'       d.DocTypeName as DOCTYPECODE,',
'       e.DepartmentName as DEPARTMENTCODE,',
'       f.Employeename as EMPLOYEECODE,',
'       a.DEBITNOTENO,',
'       a.DEBITNOTEDATE,',
'       a.DELIVERYDATE,',
'       a.CURRENCYUNITCODE,',
'       a.CURRENCYVALUE,',
'       g.PartyName as PARTYCODE,',
'--       a.DEBITQUOTATIONTNO,',
' --      a.DELIVERYORDERTNO,',
'       a.SUMOFAMOUNT,',
'       a.SUMOFFOOTERAMOUNT,',
'       a.DEBITNOTEAMOUNT,',
'       a.SUBJECTTEXT,',
'       a.REFERENCETEXT,',
'       a.LETTERTEXT,',
'       a.TITLETEXT,',
'       a.REMARK,',
'       a.ITEMWISEFOOTER,',
' --      a.WORKORDERTNO,',
'       a.PURCHASEORDERTNO,',
'       a.AGENTCODE,',
'       a.CONSIGNEECODE,',
'       a.REFERENCETNO,',
'       a.VALIDITYUPTODATE,',
'       a.CREDITDAYS,',
'       a.COMMISSIONRATE,',
'       a.TRANSPORTERCODE,',
'       a.FREIGHTTYPECODE,',
' --      a.DESPATCHCATEGORYCODE,',
'       a.CREATOR,',
' --      a.REVISIONDEBITNOTETNO,',
'       to_char(a.CREATIONTIME,''DD-MM-YYYY HH24:MI:SS'') as CREATIONTIME,',
'       a.FROMCITYCODE,',
'       a.TOCITYCODE,',
'       h.TransactionTypeName as TRANSACTIONTYPECODE,',
'       a.REFERENCEMODULETNO,',
'       a.REFERENCEMODULECODE,',
'       a.MODULECODE,',
'       a.MODULETNO,',
'       i.reasonforissuingnoteName as REASONFORISSUINGNOTECODE,',
' --      a.PREGST,',
'       a.PARTYINVOICEVALUE,',
'       a.PARTYINVOICENO,',
'       a.PARTYINVOICEDATE,',
'       a.PARTYCREDITNOTEDATE,',
'       a.PARTYCREDITNOTENO,',
'       b.NATUREOFSUPPLYNAME as NATUREOFSUPPLYCODE,',
'       a.REFDATE,',
' --      a.PARTYCREDITNOTEAMOUNT,',
'       --a.PODTNO,',
'       --a.PODSNO,',
'       a.DEDUCTEDAMOUNT,',
'       g.partyname , ',
'       j.QUANTITY1,',
'        j.RATE,',
'       j.AMOUNT,',
'       j.FOOTERAMOUNT,',
'       j.TOTALAMOUNT,',
'       a.PAIDAMOUNT,      ',
'       j.QUANTITY2,',
'       getitemname(j.itemcode) as itemname,',
'       getitemspecificationname(j.itemcode, j.itemspecificationcode) as specificationname,',
'       GetMeasuringUnitNameFromItem(j.itemcode) as unit1,',
'       GetMeasuringUnit2NameFromItem(j.itemcode) as unit2  ,',
'                 ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''DebitNote''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" tit'
||'le="Action"></span</span></a>'' AS Print',
'',
'  from DEBITNOTE a, NatureofSupply b, Location c, DocType d, ',
'  Department e, Employee f, Party g, Transactiontype h,',
'  reasonforissuingnote i , DEBITNOTEDETAIL j , item k',
'  where a.NatureOfSupplyCode = b.NatureOfSupplyCode(+)',
'  and a.LocationCode = c.LocationCode(+)',
'  and a.DocTypeCode = d.DocTypeCode(+) ',
'  and a.DepartmentCode = e.DepartmentCode(+)',
'  and a.EmployeeCode = f.EmployeeCode(+)',
'  and a.PartyCode = g.PartyCode (+)',
'  and a.Transactiontypecode = h.TransactionTypeCode(+) ',
'  and a.reasonforissuingnoteCode = i.reasonforissuingnotecode(+)',
'  and a.tno = j.tno (+)',
'  and j.itemcode = k.itemcode(+)',
'  AND a.DEBITNOTEDATE BETWEEN :P158_FROMDATE AND :P158_TODATE',
'  and ( :P158_LOCATION IS NULL OR instr('':''||:P158_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'  and ( :P158_PARTY IS NULL OR instr('':''||:P158_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'  and ( :P158_COMPANY IS NULL OR instr('':''||:P158_COMPANY||'':'','':''||a.companyCode||'':'') > 0 )',
'  --and a.companycode = :P158_COMPANY',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Debit Note List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(855475577838099083)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
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
,p_detail_link=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:RP,:P159_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>415089232587172559
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855486804930099102)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>276
,p_column_identifier=>'AB'
,p_column_label=>'Agentcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(799243100257824057)
,p_db_column_name=>'AMOUNT'
,p_display_order=>606
,p_column_identifier=>'BM'
,p_column_label=>'Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855488845677099103)
,p_db_column_name=>'COMMISSIONRATE'
,p_display_order=>326
,p_column_identifier=>'AG'
,p_column_label=>'Commissionrate'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855476858435099091)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855487182931099102)
,p_db_column_name=>'CONSIGNEECODE'
,p_display_order=>286
,p_column_identifier=>'AC'
,p_column_label=>'Consigneecode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(800815990088511741)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>636
,p_column_identifier=>'BP'
,p_column_label=>'Creation Time'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855490405028099103)
,p_db_column_name=>'CREATOR'
,p_display_order=>66
,p_column_identifier=>'AK'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855488401863099103)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>316
,p_column_identifier=>'AF'
,p_column_label=>'Creditdays'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855480435035099093)
,p_db_column_name=>'CURRENCYUNITCODE'
,p_display_order=>136
,p_column_identifier=>'L'
,p_column_label=>'Currencyunitcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855480803162099093)
,p_db_column_name=>'CURRENCYVALUE'
,p_display_order=>146
,p_column_identifier=>'M'
,p_column_label=>'Currencyvalue'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855483206707099094)
,p_db_column_name=>'DEBITNOTEAMOUNT'
,p_display_order=>196
,p_column_identifier=>'S'
,p_column_label=>'Debitnoteamount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855479642179099093)
,p_db_column_name=>'DEBITNOTEDATE'
,p_display_order=>26
,p_column_identifier=>'J'
,p_column_label=>'DebitNote Date'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855479270151099092)
,p_db_column_name=>'DEBITNOTENO'
,p_display_order=>16
,p_column_identifier=>'I'
,p_column_label=>'DebitNoteNo'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855499230416099106)
,p_db_column_name=>'DEDUCTEDAMOUNT'
,p_display_order=>546
,p_column_identifier=>'BG'
,p_column_label=>'Deductedamount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855480000925099093)
,p_db_column_name=>'DELIVERYDATE'
,p_display_order=>126
,p_column_identifier=>'K'
,p_column_label=>'Deliverydate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855478427497099092)
,p_db_column_name=>'DEPARTMENTCODE'
,p_display_order=>36
,p_column_identifier=>'G'
,p_column_label=>'Department '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855478046292099092)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855478834115099092)
,p_db_column_name=>'EMPLOYEECODE'
,p_display_order=>46
,p_column_identifier=>'H'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855477263846099092)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Financial Year'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(799243185491824058)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>616
,p_column_identifier=>'BN'
,p_column_label=>'Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855489632439099103)
,p_db_column_name=>'FREIGHTTYPECODE'
,p_display_order=>346
,p_column_identifier=>'AI'
,p_column_label=>'Freighttypecode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855491612898099104)
,p_db_column_name=>'FROMCITYCODE'
,p_display_order=>376
,p_column_identifier=>'AN'
,p_column_label=>'Fromcitycode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462517925128715702)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>656
,p_column_identifier=>'BR'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855485638294099100)
,p_db_column_name=>'ITEMWISEFOOTER'
,p_display_order=>246
,p_column_identifier=>'Y'
,p_column_label=>'Itemwisefooter'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855484377553099100)
,p_db_column_name=>'LETTERTEXT'
,p_display_order=>226
,p_column_identifier=>'V'
,p_column_label=>'Lettertext'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855477664559099092)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855493580803099104)
,p_db_column_name=>'MODULECODE'
,p_display_order=>416
,p_column_identifier=>'AS'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855493994541099104)
,p_db_column_name=>'MODULETNO'
,p_display_order=>426
,p_column_identifier=>'AT'
,p_column_label=>'Moduletno'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855497198941099105)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>96
,p_column_identifier=>'BB'
,p_column_label=>'Nature of Supply '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855499646095099106)
,p_db_column_name=>'PAIDAMOUNT'
,p_display_order=>556
,p_column_identifier=>'BH'
,p_column_label=>'Paidamount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855481210808099093)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>86
,p_column_identifier=>'N'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855496393236099105)
,p_db_column_name=>'PARTYCREDITNOTEDATE'
,p_display_order=>486
,p_column_identifier=>'AZ'
,p_column_label=>'Partycreditnotedate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855496822915099105)
,p_db_column_name=>'PARTYCREDITNOTENO'
,p_display_order=>496
,p_column_identifier=>'BA'
,p_column_label=>'Partycreditnoteno'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855495992424099105)
,p_db_column_name=>'PARTYINVOICEDATE'
,p_display_order=>476
,p_column_identifier=>'AY'
,p_column_label=>'Partyinvoicedate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855495673681099105)
,p_db_column_name=>'PARTYINVOICENO'
,p_display_order=>466
,p_column_identifier=>'AX'
,p_column_label=>'Partyinvoiceno'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855495183039099105)
,p_db_column_name=>'PARTYINVOICEVALUE'
,p_display_order=>456
,p_column_identifier=>'AW'
,p_column_label=>'Partyinvoicevalue'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(799242781936824054)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>576
,p_column_identifier=>'BJ'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291366225713173265)
,p_db_column_name=>'PRINT'
,p_display_order=>696
,p_column_identifier=>'BV'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855486477234099102)
,p_db_column_name=>'PURCHASEORDERTNO'
,p_display_order=>266
,p_column_identifier=>'AA'
,p_column_label=>'Purchaseordertno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(799242863717824055)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>586
,p_column_identifier=>'BK'
,p_column_label=>'P Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462517798359715701)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>646
,p_column_identifier=>'BQ'
,p_column_label=>'S Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(799243026331824056)
,p_db_column_name=>'RATE'
,p_display_order=>596
,p_column_identifier=>'BL'
,p_column_label=>'Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855494394482099104)
,p_db_column_name=>'REASONFORISSUINGNOTECODE'
,p_display_order=>106
,p_column_identifier=>'AU'
,p_column_label=>'Reason For issuing Note '
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855497588656099105)
,p_db_column_name=>'REFDATE'
,p_display_order=>506
,p_column_identifier=>'BC'
,p_column_label=>'Refdate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855493192875099104)
,p_db_column_name=>'REFERENCEMODULECODE'
,p_display_order=>406
,p_column_identifier=>'AR'
,p_column_label=>'Referencemodulecode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855492822550099104)
,p_db_column_name=>'REFERENCEMODULETNO'
,p_display_order=>396
,p_column_identifier=>'AQ'
,p_column_label=>'Referencemoduletno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855483994402099099)
,p_db_column_name=>'REFERENCETEXT'
,p_display_order=>216
,p_column_identifier=>'U'
,p_column_label=>'Referencetext'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855487583455099102)
,p_db_column_name=>'REFERENCETNO'
,p_display_order=>296
,p_column_identifier=>'AD'
,p_column_label=>'Referencetno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855485215847099100)
,p_db_column_name=>'REMARK'
,p_display_order=>116
,p_column_identifier=>'X'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462518021588715703)
,p_db_column_name=>'SPECIFICATIONNAME'
,p_display_order=>666
,p_column_identifier=>'BS'
,p_column_label=>'Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855483663019099094)
,p_db_column_name=>'SUBJECTTEXT'
,p_display_order=>206
,p_column_identifier=>'T'
,p_column_label=>'Subjecttext'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855482418098099094)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>176
,p_column_identifier=>'Q'
,p_column_label=>'Sumofamount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855482825457099094)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>186
,p_column_identifier=>'R'
,p_column_label=>'Sumoffooteramount'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855484866207099100)
,p_db_column_name=>'TITLETEXT'
,p_display_order=>236
,p_column_identifier=>'W'
,p_column_label=>'Titletext'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855476399727099091)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_column_identifier=>'B'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855492028108099104)
,p_db_column_name=>'TOCITYCODE'
,p_display_order=>386
,p_column_identifier=>'AO'
,p_column_label=>'Tocitycode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(799243258477824059)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>626
,p_column_identifier=>'BO'
,p_column_label=>'Total Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855492421957099104)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>56
,p_column_identifier=>'AP'
,p_column_label=>'Transaction Type Name'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855489228898099103)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>336
,p_column_identifier=>'AH'
,p_column_label=>'Transportercode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462518096980715704)
,p_db_column_name=>'UNIT1'
,p_display_order=>676
,p_column_identifier=>'BT'
,p_column_label=>'P Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462518203671715705)
,p_db_column_name=>'UNIT2'
,p_display_order=>686
,p_column_identifier=>'BU'
,p_column_label=>'S Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(855488021797099102)
,p_db_column_name=>'VALIDITYUPTODATE'
,p_display_order=>306
,p_column_identifier=>'AE'
,p_column_label=>'Validityuptodate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(855502510983100464)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'261513'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'LOCATIONCODE:DOCTYPECODE:PARTYCODE:DEBITNOTENO:DEBITNOTEDATE:DEPARTMENTCODE:ITEMNAME:SPECIFICATIONNAME:UNIT1:QUANTITY1:UNIT2:QUANTITY2:RATE:AMOUNT:FOOTERAMOUNT:TOTALAMOUNT:TRANSACTIONTYPECODE:NATUREOFSUPPLYCODE:REASONFORISSUINGNOTECODE:EMPLOYEECODE:C'
||'REATOR:CREATIONTIME:REMARK'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(800816174907511743)
,p_plug_name=>'FILTER'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(607862323056117118)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(855475548046099083)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'ADD NEW'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:159::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(504956927533940016)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(855475548046099083)
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
 p_id=>wwv_flow_imp.id(504956787793940015)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(855475548046099083)
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
 p_id=>wwv_flow_imp.id(607842971985117044)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(800816174907511743)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(444423397261980232)
,p_name=>'P158_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(800816174907511743)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(462517339401715696)
,p_name=>'P158_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(800816174907511743)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'select companyname d , companycode r from company'
,p_cSize=>30
,p_field_template=>2526760615038828570
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
 p_id=>wwv_flow_imp.id(800817284188511745)
,p_name=>'P158_FROMDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(800816174907511743)
,p_item_default=>'SELECT TRUNC(SYSDATE-3) FROM DUAL'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(800817456928511747)
,p_name=>'P158_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(800816174907511743)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT A.LOCATIONNAME d , ',
'A.LOCATIONCODE r',
'FROM LOCATION A , DEBITNOTE B',
'WHERE A.LOCATIONCODE=B.LOCATIONCODE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(800817660057511749)
,p_name=>'P158_PARTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(800816174907511743)
,p_prompt=>'Party'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT A.PARTYNAME d , A.PARTYCODE r',
'FROM PARTY A , DEBITNOTE B',
'WHERE A.PARTYCODE = B.PARTYCODE'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_colspan=>6
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
 p_id=>wwv_flow_imp.id(460486422545791321)
,p_name=>'P158_TNO'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(800816174907511743)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(800817348363511746)
,p_name=>'P158_TODATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(800816174907511743)
,p_item_default=>'SELECT TRUNC(SYSDATE) FROM DUAL'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(607862856275117122)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(855475548046099083)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(607863351978117122)
,p_event_id=>wwv_flow_imp.id(607862856275117122)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(855475548046099083)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(444423765460994251)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(504956787793940015)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(444423925643994252)
,p_event_id=>wwv_flow_imp.id(444423765460994251)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(462517449255715697)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(462517473687715698)
,p_event_id=>wwv_flow_imp.id(462517449255715697)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
