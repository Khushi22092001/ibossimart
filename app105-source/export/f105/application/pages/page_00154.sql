prompt --application/pages/page_00154
begin
--   Manifest
--     PAGE: 00154
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
 p_id=>154
,p_name=>'Loading Advice List'
,p_alias=>'LOADING-ADVICE-LIST'
,p_step_title=>'Loading Advice List'
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
'  var bireporturl = $(''#P154_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/LoadingAdviceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P154_FROMDATE'').val());',
'  var toDate = new Date($(''#P154_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P154_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P154_COMPANY'').val() ==="" || $(''#P154_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P154_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P154_COMPANY'').val();',
'       global_companycode= $(''#P154_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +    ',
'      ''&P_LOCATION='' + $(''#P154_LOCATION'').val() +  ',
'      ''&P_FROMDATE='' +$(''#P154_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P154_TODATE'').val() + ',
'      ''&P_PARTYNAME='' +$(''#P154_PARTYNAME'').val() +',
'      ''&P_BYPARTYNAME='' +$(''#P154_BYPARTYNAME'').val() +',
'      ''&P_DOCTYPE='' +$(''#P154_DOCTYPE'').val() +',
'      ''&P_ITEM='' +$(''#P154_ITEM'').val() +',
'      ''&P_SONO='' +$(''#P154_SONO'').val() +',
'      ''&P_ITEMSPECIFICATION='' +$(''#P154_ITEMSPECIFICATION'').val() +',
'      ''&P_PONO='' +$(''#P154_PONO'').val() +',
'      ''&P_JONO='' +$(''#P154_JONO'').val() +',
'      ''&P_TODOLIST='' +$(''#P154_TODOLIST'').val() +',
'      ''&P_NEXTPROCESS='' +$(''#P154_NEXTPROCESS'').val() +',
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
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P154_BIREPORTURL'').val()',
'  var reportName =  ''LoadingAdviceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P154_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P154_COMPANY'').val() ==="" || $(''#P154_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P154_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P154_COMPANY'').val();',
'       global_companycode= $(''#P154_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P154_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P154_LOCATION'').val() + ''",'' +    ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P154_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P154_TODATE'').val() + ''",'' + ',
'      ''"_paramsP_PARTYNAME":"'' +$(''#P154_PARTYNAME'').val() + ''",'' + ',
'	  ''"_paramsP_BYPARTYNAME":"'' +$(''#P154_BYPARTYNAME'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' +$(''#P154_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' +$(''#P154_ITEM'').val() + ''",'' + ',
'      ''"_paramsP_SONO":"'' +$(''#P154_SONO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' +$(''#P154_ITEMSPECIFICATION'').val() + ''",'' + ',
'	  ''"_paramsP_PONO":"'' +$(''#P154_PONO'').val() + ''",'' + ',
'	  ''"_paramsP_JONO":"'' +$(''#P154_JONO'').val() + ''",'' + ',
'	  ''"_paramsP_TODOLIST":"'' +$(''#P154_TODOLIST'').val() + ''",'' + ',
'	  ''"_paramsP_NEXTPROCESS":"'' +$(''#P154_NEXTPROCESS'').val() + ''",'' + ',
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
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important;',
'  ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(952822659335874938)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(603956119249045018)
,p_plug_name=>'Loading Advice List'
,p_static_id=>'loading-advice-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'       A.LOADINGADVICEDATE AS LOADINGDATE,',
'       getcompanyname(A.COMPANYCODE) as company,',
'       A.FINANCIALYEARCODE,',
'       getlocationname(A.LOCATIONCODE) as location,',
'       getdoctypename(A.DOCTYPECODE) as doctype,',
'       A.LOADINGADVICEDATE,',
'       A.LOADINGADVICENO,',
'       nvl(GETemployeeNAME(A.ISSUEDBYemployeeCODE),GETpartyNAME(A.ISSUEDBYpartyCODE)) AS ISSUEDBYPARTYNAME,',
'       GETPARTYNAME(A.ISSUEDTOPARTYCODE) AS ISSUEDTOPARTY,',
'       GETCITYNAME(A.SOURCEPLACECODE) AS SOURCELOCATION,',
'       GETPARTYNAME(A.SUPPLIERCODE)AS SUPPLIERNAME,',
'       B.PURCHASEORDERNO,',
'       GETlocationNAME(A.DESTINATIONPLACECODE) DESTINATIONLOCATION,',
'       A.ISWAREHOUSE,',
'       A.ISPARTYLOCATION,',
'       C.SALESORDERNO,',
'       D.JOBORDERNO,',
'       E.FREIGHTTYPENAME,',
'       A.FREIGHTRATE,',
'       A.FREIGHTADVANCE,',
'       A.VEHICLENO,',
'       A.DRIVERMOBILENO,',
'       A.DRIVERNAME,',
'       A.EWAYBILLNO,',
'       A.CREATOR,',
'       TO_CHAR(A.CREATIONTIME, ''DD-MM-YYYY HH:MI'') AS CREATIONTIME,',
'       getdocumentstatuscode(getmodulecodeforpageno(:APP_PAGE_ID),A.TNO) AS STATUS,',
'       getitemname(f.itemcode) as itemname,',
'	   GetItemSpecificationName(f.itemcode , f.itemspecificationcode) as specification,',
'	   GetMeasuringUnitNameFromItem(f.itemcode) as PUOM,',
'	   f.quantity1 as PQty,',
'	   GetMeasuringUnit2NameFromItem(f.itemcode) as SUOM,',
'	   f.quantity2 as SQty',
'',
'  from LOADINGADVICE A, PURCHASEORDER B, SALESORDER C, JOBORDER D, FREIGHTTYPE E, LOADINGADVICEDETAIL F',
'  WHERE A.PURCHASEORDERTNO = B.TNO(+)',
'    AND A.SALESORDERTNO = C.TNO(+)',
'    AND A.JOBORDERTNO = D.TNO(+)',
'    AND A.TNO = F.TNO(+)',
'    AND A.FREIGHTTYPECODE = E.FREIGHTTYPECODE(+)',
'',
'    and a.LoadingAdviceDate between :P154_FROMDATE and :P154_TODATE',
'    and ( :P154_COMPANY IS NULL OR instr('':''||:P154_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'    and ( :P154_LOCATION IS NULL OR instr('':''||:P154_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'    and (:P154_DOCTYPE is null or instr('':''||:P154_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'    and (:P154_PARTYNAME is null or instr('':''||:P154_PARTYNAME||'':'','':''||a.IssuedtoPartyCode||'':'') > 0 )',
'    and (:P154_BYPARTYNAME is null or instr('':''||:P154_BYPARTYNAME||'':'','':''||a.IssuedbyPartyCode||'':'') > 0 )',
'    and (:P154_ITEM is null or instr('':''||:P154_ITEM||'':'','':''||F.ItemCode||'':'') > 0  )',
'    and (:P154_JONO is null or instr('':''||:P154_JONO||'':'','':''||D.JOBORDERNO||'':'') > 0  )',
'    and (:P154_PONO is null or instr('':''||:P154_PONO||'':'','':''||B.PURCHASEORDERNO||'':'') > 0  )',
'    and (:P154_SONO is null or instr('':''||:P154_PONO||'':'','':''||C.SALESORDERNO||'':'') > 0  )',
'    and ( :P154_ITEMSPECIFICATION IS NULL OR instr('':''||:P154_ITEMSPECIFICATION||'':'','':''||F.ItemSpecificationCode||'':'') > 0 )',
'    and getcompanyprivilege(a.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'    AND getlocationprivilege(a.locationcode,GETMODULECODEFORPAGENO(:APP_PAGE_ID),a.companycode,:global_loginname)=''YES''',
'    AND getdoctypeprivilege(a.doctypecode,GETMODULECODEFORPAGENO(:APP_PAGE_ID),a.companycode,:global_loginname)=''YES''',
'',
' --order by 2 DESC, 1 DESC'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P154_COMPANY,P154_LOCATION,P154_FROMDATE,P154_TODATE,P154_PARTYNAME,P154_DOCTYPE,P154_ITEM,P154_SONO,P154_ITEMSPECIFICATION,P154_PONO'
,p_prn_page_header=>'Loading Advice List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(603956216441045018)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_sort=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_show_help=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:155:&APP_SESSION.::&DEBUG.:RP:P155_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>163569871190118494
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604169838303634555)
,p_db_column_name=>'COMPANY'
,p_display_order=>35
,p_column_identifier=>'Z'
,p_column_label=>'Company'
,p_column_html_expression=>'<div style="display:block; width:180px">#COMPANY#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(446886391837094089)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>155
,p_column_identifier=>'AL'
,p_column_label=>'Creation Time'
,p_column_html_expression=>'<div style="display:block; width:100px">#CREATIONTIME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603965822956045037)
,p_db_column_name=>'CREATOR'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Creator'
,p_column_html_expression=>'<div style="display:block; width:120px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(446886043861094085)
,p_db_column_name=>'DESTINATIONLOCATION'
,p_display_order=>115
,p_column_identifier=>'AH'
,p_column_label=>'Destination Location'
,p_column_html_expression=>'<div style="display:block; width:250px">#DESTINATIONLOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604169994650634557)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>55
,p_column_identifier=>'AB'
,p_column_label=>'Doctype'
,p_column_html_expression=>'<div style="display:block; width:150px">#DOCTYPE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603964983179045037)
,p_db_column_name=>'DRIVERMOBILENO'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Driver Mobile No'
,p_column_html_expression=>'<div style="display:block; width:100px">#DRIVERMOBILENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461544633780383485)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>175
,p_column_identifier=>'AN'
,p_column_label=>'Driver Name'
,p_column_html_expression=>'<div style="display:block; width:130px">#DRIVERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603965402035045037)
,p_db_column_name=>'EWAYBILLNO'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'E-Way Bill No'
,p_column_html_expression=>'<div style="display:block; width:120px">#EWAYBILLNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603957385607045033)
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
 p_id=>wwv_flow_imp.id(603964186200045037)
,p_db_column_name=>'FREIGHTADVANCE'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Freight Advance'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTADVANCE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603963776582045037)
,p_db_column_name=>'FREIGHTRATE'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Freight Rate'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(446886349717094088)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>145
,p_column_identifier=>'AK'
,p_column_label=>'Freight Type Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#FREIGHTTYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603962161783045036)
,p_db_column_name=>'ISPARTYLOCATION'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Is Party Location'
,p_column_html_expression=>'<div style="display:block; width:100px">#ISPARTYLOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445786093989356530)
,p_db_column_name=>'ISSUEDBYPARTYNAME'
,p_display_order=>65
,p_column_identifier=>'AC'
,p_column_label=>'Issued By'
,p_column_html_expression=>'<div style="display:block; width:250px">#ISSUEDBYPARTYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445786212539356531)
,p_db_column_name=>'ISSUEDTOPARTY'
,p_display_order=>75
,p_column_identifier=>'AD'
,p_column_label=>'Issued To'
,p_column_html_expression=>'<div style="display:block; width:250px">#ISSUEDTOPARTY#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603961796219045036)
,p_db_column_name=>'ISWAREHOUSE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Is Warehouse'
,p_column_html_expression=>'<div style="display:block; width:80px">#ISWAREHOUSE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461548435625383523)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>185
,p_column_identifier=>'AO'
,p_column_label=>'Item Name'
,p_column_html_expression=>'<div style="display:block; width:120px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(446886229937094087)
,p_db_column_name=>'JOBORDERNO'
,p_display_order=>135
,p_column_identifier=>'AJ'
,p_column_label=>'Job Order No'
,p_column_html_expression=>'<div style="display:block; width:250px">#JOBORDERNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603958598591045034)
,p_db_column_name=>'LOADINGADVICEDATE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Loading Advice Date'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOADINGADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603958994356045034)
,p_db_column_name=>'LOADINGADVICENO'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Loading Advice No'
,p_column_html_expression=>'<div style="display:block; width:250px">#LOADINGADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(438070072886251869)
,p_db_column_name=>'LOADINGDATE'
,p_display_order=>245
,p_column_identifier=>'AU'
,p_column_label=>'Loadingdate'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(604169858571634556)
,p_db_column_name=>'LOCATION'
,p_display_order=>45
,p_column_identifier=>'AA'
,p_column_label=>'Location'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461548733515383526)
,p_db_column_name=>'PQTY'
,p_display_order=>215
,p_column_identifier=>'AR'
,p_column_label=>'Primary Qty'
,p_column_html_expression=>'<div style="display:block; width:100px">#PQTY#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461548590923383525)
,p_db_column_name=>'PUOM'
,p_display_order=>205
,p_column_identifier=>'AQ'
,p_column_label=>'Primary Unit'
,p_column_html_expression=>'<div style="display:block; width:100px">#PUOM#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445786488033356534)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>105
,p_column_identifier=>'AG'
,p_column_label=>'Purchase Order No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PURCHASEORDERNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(446886148791094086)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>125
,p_column_identifier=>'AI'
,p_column_label=>'Sales Order No'
,p_column_html_expression=>'<div style="display:block; width:250px">#SALESORDERNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445786362177356532)
,p_db_column_name=>'SOURCELOCATION'
,p_display_order=>85
,p_column_identifier=>'AE'
,p_column_label=>'Source Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461548535482383524)
,p_db_column_name=>'SPECIFICATION'
,p_display_order=>195
,p_column_identifier=>'AP'
,p_column_label=>'Specification'
,p_column_html_expression=>'<div style="display:block; width:120px">#SPECIFICATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461548879082383528)
,p_db_column_name=>'SQTY'
,p_display_order=>235
,p_column_identifier=>'AT'
,p_column_label=>'Secondary Qty'
,p_column_html_expression=>'<div style="display:block; width:100px">#SQTY#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(446886846732094093)
,p_db_column_name=>'STATUS'
,p_display_order=>165
,p_column_identifier=>'AM'
,p_column_label=>'Status'
,p_column_html_expression=>'<div style="display:block; width:130px">#STATUS#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461548778338383527)
,p_db_column_name=>'SUOM'
,p_display_order=>225
,p_column_identifier=>'AS'
,p_column_label=>'Secondary Unit'
,p_column_html_expression=>'<div style="display:block; width:100px">#SUOM#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445786417440356533)
,p_db_column_name=>'SUPPLIERNAME'
,p_display_order=>95
,p_column_identifier=>'AF'
,p_column_label=>'Supplier Name'
,p_column_html_expression=>'<div style="display:block; width:250px">#SUPPLIERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603956550021045026)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(603964635220045037)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Vehicle No'
,p_column_html_expression=>'<div style="display:block; width:90px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(603967784083052163)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1635815'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STATUS:LOCATION:DOCTYPE:LOADINGADVICENO:LOADINGADVICEDATE:ISSUEDBYPARTYNAME:ISSUEDTOPARTY:PURCHASEORDERNO:SALESORDERNO:JOBORDERNO:SOURCELOCATION:SUPPLIERNAME:DESTINATIONLOCATION:ISWAREHOUSE:ISPARTYLOCATION:ITEMNAME:SPECIFICATION:PUOM:PQTY:SUOM:SQTY:F'
||'REIGHTTYPENAME:FREIGHTRATE:FREIGHTADVANCE:VEHICLENO:DRIVERNAME:DRIVERMOBILENO:EWAYBILLNO:CREATOR:CREATIONTIME'
,p_sort_column_1=>'LOADINGADVICEDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'LOADINGADVICENO'
,p_sort_direction_2=>'DESC'
,p_sum_columns_on_break=>'PQTY:SQTY:FREIGHTADVANCE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(603966672648045037)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(603956119249045018)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:155:&APP_SESSION.::&DEBUG.:155::'
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
 p_id=>wwv_flow_imp.id(603656567360893036)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(603956119249045018)
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
 p_id=>wwv_flow_imp.id(612229772101572304)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(603956119249045018)
,p_button_name=>'Pdf'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(446921993199206132)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454759666738788791)
,p_name=>'P154_BIREPORTURL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454405731415940788)
,p_name=>'P154_BYPARTYNAME'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'Issue By Party'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From LoadingAdvice a, Party p',
'Where a.IssuedbyPartyCode = p.PartyCode',
'Order by 1'))
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(943170548353293714)
,p_name=>'P154_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'Company'
,p_placeholder=>'Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''LOADINGADVICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'  ;'))
,p_cSize=>30
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(943170669648293715)
,p_name=>'P154_DOCTYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'Doc Type'
,p_placeholder=>'Enter Doc Type Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      dt.DocTypeName d,',
'      dt.DocTypeCode r',
'From  ModulePrivilege a, ModulePrivilegeDocType b, DocType dt, BossUser bu, ModuleDocType md, ModuleDocTypeDetail mdd',
'Where a.TNo = b.TNo(+)',
'  and (b.DocTypeCode = dt.DocTypeCode or b.DocTypeCode is null)',
'  and a.ModuleCode = md.ModuleCode',
'  and md.TNo = mdd.TNo',
'  and mdd.DocTypeCode = dt.DocTypeCode',
'  and a.ModuleCode = ''LOADINGADVICE''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and instr('':''||:P154_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order by 1',
';',
''))
,p_lov_cascade_parent_items=>'P154_COMPANY'
,p_ajax_items_to_submit=>'P154_DOCTYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(943264760603670553)
,p_name=>'P154_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_item_default=>'Trunc(Sysdate)-3'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(943266753695670554)
,p_name=>'P154_ITEM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||''( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From LoadingAdviceDetail a,Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 1'))
,p_cSize=>74
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(943267599750670554)
,p_name=>'P154_ITEMSPECIFICATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P154_ITEM',
'  and e.TNo = ee.TNO'))
,p_lov_cascade_parent_items=>'P154_ITEM'
,p_ajax_items_to_submit=>'P154_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>74
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(454405793522940789)
,p_name=>'P154_JONO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'JONo'
,p_placeholder=>'Enter Job Order No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select JobOrderNo From JobOrder a, LoadingAdvice b',
'Where instr('':''||:P154_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and b.JobOrderTno = a.tno',
'  and JobOrderDate Between :P154_FROMDATE and :P154_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P154_LOCATION'
,p_ajax_items_to_submit=>'P154_PONO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_colspan=>8
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(943266433568670554)
,p_name=>'P154_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = ''PURCHASEORDER''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and instr('':''||:P154_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P154_COMPANY'
,p_ajax_items_to_submit=>'P154_LOCATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(963423287172049131)
,p_name=>'P154_NEXTPROCESS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(943266030112670554)
,p_name=>'P154_PARTYNAME'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'Issue To Party'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From LoadingAdvice a, Party p',
'Where a.IssuedtoPartyCode = p.PartyCode',
'Order by 1'))
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(943267959257670554)
,p_name=>'P154_PONO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'PoNo'
,p_placeholder=>'Enter Purchase Order No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select PurchaseOrderNo From PurchaseOrder a, LoadingAdvice b',
'Where instr('':''||:P154_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and b.PurchaseOrderTno = a.tno',
'  and PurchaseOrderDate Between :P154_FROMDATE and :P154_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P154_LOCATION'
,p_ajax_items_to_submit=>'P154_PONO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(446886488100094090)
,p_name=>'P154_SONO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_prompt=>'SoNo'
,p_placeholder=>'Enter Sales Order No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.SalesOrderno From SalesOrder a, LoadingAdvice b',
'Where  b.salesordertno = a.tno',
'  and  instr('':''||:P154_LOCATION||'':'','':''||b.LocationCode||'':'') > 0',
'  and a.SalesOrderDate Between :P154_FROMDATE and :P154_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P154_LOCATION'
,p_ajax_items_to_submit=>'P154_PONO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447055188641861593)
,p_name=>'P154_TNO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(943265177796670553)
,p_name=>'P154_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(963422974559047467)
,p_name=>'P154_TODOLIST'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(952822659335874938)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(612229914841572305)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(612229772101572304)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(612229969707572306)
,p_event_id=>wwv_flow_imp.id(612229914841572305)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(447065388529898722)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(447065861615898722)
,p_event_id=>wwv_flow_imp.id(447065388529898722)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(603656696346893037)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(603656844297893038)
,p_event_id=>wwv_flow_imp.id(603656696346893037)
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
 p_id=>wwv_flow_imp.id(446887273835094098)
,p_name=>'refresh'
,p_static_id=>'refresh'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(446921993199206132)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(446887452547094099)
,p_event_id=>wwv_flow_imp.id(446887273835094098)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(603956119249045018)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
