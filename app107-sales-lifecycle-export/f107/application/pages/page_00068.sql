prompt --application/pages/page_00068
begin
--   Manifest
--     PAGE: 00068
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
 p_id=>68
,p_name=>'Material In Register'
,p_alias=>'MATERIAL-IN-REGISTER'
,p_step_title=>'Material In Register'
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
'  var bireporturl = $(''#P68_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/materialinregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P68_FROMDATE'').val());',
'  var toDate = new Date($(''#P68_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P68_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P68_COMPANY'').val() ==="" || $(''#P68_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P68_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P68_COMPANY'').val();',
'       global_companycode= $(''#P68_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +    ',
'      ''&P_LOCATION='' + $(''#P68_LOCATION'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P68_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P68_TODATE'').val() + ',
'      ''&P_DOCTYPE='' +$(''#P68_DOCTYPE'').val() +',
'      ''&P_PARTY='' +$(''#P68_PARTY'').val() +',
'      ''&P_GRNSTATUS='' +$(''#P68_GRNSTATUS'').val() +',
'      ''&P_TRANSPORTER='' +$(''#P68_TRANSPORTER'').val() +',
'      ''&P_VEHICLENO='' +$(''#P68_VEHICLENO'').val() +',
'      ''&P_ITEM='' +$(''#P68_ITEM'').val() +',
'      ''&P_MINO='' +$(''#P68_MINO'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P68_ITEMSPECIFICATION'').val() +',
'      ''&P_CREATOR='' +$(''#P68_CREATOR'').val()  +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
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
'function sd() {',
'        // Get the modal element by ID',
'        if (apex.item(''P146_DOCTYPECODE'').getValue()==''CONVERSIONJOBOUTOFPREMISES'') {',
'                openModal(''StockStorageDetail'');',
'        }',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P68_BIREPORTURL'').val()',
'  var reportName =  ''materialinregister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P68_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P68_COMPANY'').val() ==="" || $(''#P68_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P68_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P68_COMPANY'').val();',
'       global_companycode= $(''#P68_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P68_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P68_LOCATION'').val() + ''",'' +  ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P68_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P68_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' +$(''#P68_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' +$(''#P68_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_GRNSTATUS":"'' + $(''#P68_GRNSTATUS'').val() + ''",'' + ',
'	  ''"_paramsP_TRANSPORTER":"'' +$(''#P68_TRANSPORTER'').val() + ''",'' + ',
'	  ''"_paramsP_VEHICLENO":"'' +$(''#P68_VEHICLENO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P68_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_MINO":"'' + $(''#P68_MINO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P68_ITEMSPECIFICATION'').val() + ''",'' +',
'	  ''"_paramsP_CREATOR":"'' +$(''#P68_CREATOR'').val() + ''",'' + ',
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
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important;',
'  ',
'}',
'',
'',
'/* WORKFLOW_LAYOUT_STANDARD_GAP_V1 */',
'/* Keep a clear separation between the title card and tabs/report content. */',
'#tabcontainer,',
'#MYID {',
'  margin-top: 16px !important;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476960282344826377)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_name=>'filter'
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
 p_id=>wwv_flow_imp.id(476960409734826378)
,p_plug_name=>'Report(Material In)'
,p_static_id=>'report-material-in'
,p_region_name=>'MYID'
,p_region_css_classes=>'t-Form--search'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,',
'       a.TNo,',
'       a.LOCATIONCODE,',
'       a.DOCTYPECODE,',
'       a.LOCATIONNAME,',
'       Upper(a.DOCTYPENAME) DOCTYPENAME,',
'       a.MATERIALINNO,',
'       a.MATERIALINDATE,',
'       a.PARTYCODE,',
'       a.PARTYNAME,',
'       a.REFDOCNO,',
'       a.REFDOCDATE,',
'       a.REFDOCAMOUNT,',
'       a.TRANSPORTERCODE,',
'       a.TRANSPORTER,',
'       a.VEHICLENO,',
'       a.VEHICLETYPENAME,',
'       a.DRIVERNAME,',
'       a.LRNO,',
'       a.LRDATE,',
'       a.ITEMCODE,',
'       a.ITEMNAME,',
'       a.ITEMSPECIFICATIONCODE,',
'       a.ITEMSPECIFICATIONNAME,',
'       a.ITEMNAME||'' ~ ''||a.ITEMSPECIFICATIONNAME as MATERIALDESCRIPTION,',
'       a.UOM,',
'       a.UOM2,',
'       round(a.QUANTITY1,3) as QUANTITY1,',
'       ROUND(a.Quantity2,3) AS Quantity2,',
'       a.PACKINGTYPENAME,',
'       Upper(a.MODULE) MODULE,',
'       a.MODULENO,',
'       a.MODULEDATE,',
'       a.WEIGHMENTTNO,',
'       a.WEIGHMENTNO,',
'       a.WEIGHMENTDATE,',
'       a.FIRSTWEIGHT,',
'       a.SECONDWEIGHT,',
'       a.NETWEIGHT,',
'       a.ACCEPTEDWEIGHT,',
'       a.Creator,',
'       a.CreationTime,',
'       a.CreatedFrom,',
'       Case When a.AcceptedWeight < a.Quantity1 then ''RED_COLOR''',
'            When a.AcceptedWeight = a.Quantity1 then ''GREEN_COLOR''',
'       Else ''YELLOW_COLOR''',
'       End as Color_Value,',
'       a.GRNStatus,',
'       a.GRNNO,',
'       a.GRNDate,',
'       GetEmployeeName(bu.EmployeeCode)||''( ''||g.Creator||'' )'' as GRNCreator,',
'       g.CreationTime as GRNCreationTime,',
'       a.purchaseorderno,',
'       a.purchaseorderdate,',
'                ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||a.TNO||'',''||''MaterialIN''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" tit'
||'le="Action"></span</span></a>'' AS Print',
'',
'       ',
'From GATEINREGISTER_VIEW a, Grn g, Bossuser bu',
'Where a.MaterialInDate between :P68_FROMDATE and :P68_TODATE',
' -- and instr('':''||:P68_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and (:P68_COMPANY IS NULL OR instr('':''||:P68_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
' -- and instr('':''||:P68_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and (:P68_LOCATION IS NULL OR instr('':''||:P68_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'  and (:P68_DOCTYPE IS NULL OR instr('':''||:P68_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 )',
'  and ( :P68_PARTY IS NULL OR instr('':''||:P68_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'  and ( :P68_TRANSPORTER IS NULL OR instr('':''||:P68_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 )',
'  and ( :P68_ITEM IS NULL OR instr('':''||:P68_ITEM||'':'','':''||a.ItemCode||'':'') > 0 ) ',
'  and ( :P68_ITEMSPECIFICATION IS NULL OR instr('':''||:P68_ITEMSPECIFICATION||'':'','':''||a.ItemSpecificationCode||'':'') > 0 ) ',
'  and a.VehicleNo like nvl(:P68_VEHICLENO,''%'')',
'  and a.GRNSTATUS like nvl(:P68_GRNSTATUS,''%'')',
'  and a.MaterialInNo like nvl(:P68_MINO,''%'')',
'  and ( :P68_CREATOR IS NULL OR instr('':''||:P68_CREATOR||'':'','':''||a.Creator||'':'') > 0 )',
'  and a.GRNTNo = g.TNo(+)',
'  and g.Creator = bu.LoginName(+)',
'  and getlocationprivilege(a.locationcode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
' AND getdoctypeprivilege(a.doctypecode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
' and getcompanyprivilege(A.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES'''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P68_COMPANY,P68_LOCATION,P68_FROMDATE,P68_TODATE,P68_DOCTYPE,P68_PARTY,P68_GRNSTATUS,P68_TRANSPORTER,P68_VEHICLENO,P68_ITEM,P68_MINO,P68_ITEMSPECIFICATION,P68_CREATOR,P68_BIREPORTURL,P68_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Report(Material In)'
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
 p_id=>wwv_flow_imp.id(511923319418523003)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:69:P69_TNO,P69_FORMSTATUS:#TNO#,EDITRECORD'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>63458246387358655
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467176648831468887)
,p_db_column_name=>'ACCEPTEDWEIGHT'
,p_display_order=>380
,p_column_identifier=>'AJ'
,p_column_label=>'ACCEPTED WEIGHT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467178232432468887)
,p_db_column_name=>'COLOR_VALUE'
,p_display_order=>420
,p_column_identifier=>'AN'
,p_column_label=>'Color Value'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467177842766468887)
,p_db_column_name=>'CREATEDFROM'
,p_display_order=>410
,p_column_identifier=>'AM'
,p_column_label=>'CREATED FROM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467177444457468887)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>400
,p_column_identifier=>'AL'
,p_column_label=>'TIMESTAMP'
,p_column_html_expression=>'<div style="display:block; width:80px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467177021152468887)
,p_db_column_name=>'CREATOR'
,p_display_order=>390
,p_column_identifier=>'AK'
,p_column_label=>'USER (RAISED BY)'
,p_column_html_expression=>'<div style="display:block; width:100px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467163399306468881)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Doctypecode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467164213960468881)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'DOCTYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467169017763468883)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'DRIVER'
,p_column_html_expression=>'<div style="display:block; width:140px">#DRIVERNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467175434160468886)
,p_db_column_name=>'FIRSTWEIGHT'
,p_display_order=>350
,p_column_identifier=>'AG'
,p_column_label=>'FIRST WEIGHT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467534440361314042)
,p_db_column_name=>'GRNCREATIONTIME'
,p_display_order=>480
,p_column_identifier=>'AT'
,p_column_label=>'GRN CREATION TIME'
,p_column_html_expression=>'<div style="display:block; width:80px">#GRNCREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467534312199314041)
,p_db_column_name=>'GRNCREATOR'
,p_display_order=>470
,p_column_identifier=>'AS'
,p_column_label=>'GRN CREATOR'
,p_column_html_expression=>'<div style="display:block; width:150px">#GRNCREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467179441670468888)
,p_db_column_name=>'GRNDATE'
,p_display_order=>450
,p_column_identifier=>'AQ'
,p_column_label=>'GRN DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#GRNDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467178988814468888)
,p_db_column_name=>'GRNNO'
,p_display_order=>440
,p_column_identifier=>'AP'
,p_column_label=>'GRN NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#GRNNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467178659140468887)
,p_db_column_name=>'GRNSTATUS'
,p_display_order=>430
,p_column_identifier=>'AO'
,p_column_label=>'GRN STATUS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467170200185468884)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467170650282468884)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Itemname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467171014704468884)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467171383929468884)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Itemspecificationname'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467163047359468881)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467163791967468881)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:140px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467169833667468883)
,p_db_column_name=>'LRDATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'LR DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#LRDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467169448013468883)
,p_db_column_name=>'LRNO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'LR NO'
,p_column_html_expression=>'<div style="display:block; width:80px">#LRNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467179857731468888)
,p_db_column_name=>'MATERIALDESCRIPTION'
,p_display_order=>460
,p_column_identifier=>'AR'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:300px">#MATERIALDESCRIPTION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467165044563468881)
,p_db_column_name=>'MATERIALINDATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'MATERIAL IN DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#MATERIALINDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467164593628468881)
,p_db_column_name=>'MATERIALINNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'MATERIAL IN NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#MATERIALINNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467172983811468885)
,p_db_column_name=>'MODULE'
,p_display_order=>290
,p_column_identifier=>'AA'
,p_column_label=>'REFERENCE'
,p_column_html_expression=>'<div style="display:block; width:120px">#MODULE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467173828506468885)
,p_db_column_name=>'MODULEDATE'
,p_display_order=>310
,p_column_identifier=>'AC'
,p_column_label=>'REFERENCE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#MODULEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467173447115468885)
,p_db_column_name=>'MODULENO'
,p_display_order=>300
,p_column_identifier=>'AB'
,p_column_label=>'REFERENCE NO'
,p_column_html_expression=>'<div style="display:block; width:180px">#MODULENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467176207443468886)
,p_db_column_name=>'NETWEIGHT'
,p_display_order=>370
,p_column_identifier=>'AI'
,p_column_label=>'NET WEIGHT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467172594013468884)
,p_db_column_name=>'PACKINGTYPENAME'
,p_display_order=>280
,p_column_identifier=>'Z'
,p_column_label=>'Packingtypename'
,p_column_html_expression=>'<div style="display:block; width:80px">#PACKINGTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467165400456468882)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467165770542468882)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:150px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(300845030372639615)
,p_db_column_name=>'PRINT'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(456367408044560461)
,p_db_column_name=>'PURCHASEORDERDATE'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'PURCHASE ORDER DATE'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(456367277948560460)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'PURCHASE ORDER NO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467172212336468884)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467534529495314043)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>260
,p_column_identifier=>'AU'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467167006340468882)
,p_db_column_name=>'REFDOCAMOUNT'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'BILL AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#REFDOCAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467166636662468882)
,p_db_column_name=>'REFDOCDATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'PARTY BILL DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#REFDOCDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467166224932468882)
,p_db_column_name=>'REFDOCNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'PARTY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#REFDOCNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467175863327468886)
,p_db_column_name=>'SECONDWEIGHT'
,p_display_order=>360
,p_column_identifier=>'AH'
,p_column_label=>'SECOND WEIGHT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196682567214609920)
,p_db_column_name=>'STATUS'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467162643478468880)
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
 p_id=>wwv_flow_imp.id(467167799656468883)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'TRANSPORTER'
,p_column_html_expression=>'<div style="display:block; width:150px">#TRANSPORTER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467167391157468882)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Transportercode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467171771043468884)
,p_db_column_name=>'UOM'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:80px">#UOM#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467534653413314044)
,p_db_column_name=>'UOM2'
,p_display_order=>270
,p_column_identifier=>'AV'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467168187262468883)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'VEHICLE NO'
,p_column_html_expression=>'<div style="display:block; width:80px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467168637951468883)
,p_db_column_name=>'VEHICLETYPENAME'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Vehicletypename'
,p_column_html_expression=>'<div style="display:block; width:80px">#VEHICLETYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467175020567468886)
,p_db_column_name=>'WEIGHMENTDATE'
,p_display_order=>340
,p_column_identifier=>'AF'
,p_column_label=>'WEIGHMENT DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#WEIGHMENTDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467174569293468886)
,p_db_column_name=>'WEIGHMENTNO'
,p_display_order=>330
,p_column_identifier=>'AE'
,p_column_label=>'WEIGHMENT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#WEIGHMENTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467174186878468885)
,p_db_column_name=>'WEIGHMENTTNO'
,p_display_order=>320
,p_column_identifier=>'AD'
,p_column_label=>'Weighmenttno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(512067684441327690)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'42431'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:STATUS:LOCATIONNAME:DOCTYPENAME:PARTYNAME:MATERIALINDATE:MATERIALINNO:MODULE:MODULENO:REFDOCNO:REFDOCDATE:REFDOCAMOUNT:TRANSPORTER:VEHICLENO:DRIVERNAME:LRNO:LRDATE:ITEMCODE:MATERIALDESCRIPTION:UOM:QUANTITY1:UOM2:QUANTITY2:FIRSTWEIGHT:SECONDWEIG'
||'HT:NETWEIGHT:CREATOR:CREATIONTIME:CREATEDFROM:GRNSTATUS:GRNNO:GRNDATE:GRNCREATOR:GRNCREATIONTIME'
,p_sort_column_1=>'MATERIALINDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DOCTYPENAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:FIRSTWEIGHT:SECONDWEIGHT:NETWEIGHT:ACCEPTEDWEIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(456137744587322874)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(476960409734826378)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:69::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(456096023052216643)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(476960409734826378)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/materialinregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P68_FROMDATE=&P68_FROMDATE.&P68_TODATE=&P68_TODATE.&P68_LOCATION=&P68_LOCATION.&P68_DOCTYPE=&P68_DOCTYPE.&P68_GRNSTATUS=&P68_GRNSTATUS.&P68_VEHICLENO=&P68_VEHICLENO.&P68_PARTY=&P68_PARTY.&P68_TRANSPORTER=&P68_TRANSPORTER.&P68_ITEM=&P68_ITEM.&P68_ITEMSPECIFICATION=&P68_ITEMSPECIFICATION.&P68_MINO=&P68_MINO.'
,p_button_condition=>'1'
,p_button_condition2=>'2'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(456137177451321277)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(476960409734826378)
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
 p_id=>wwv_flow_imp.id(456095668850216642)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(476960409734826378)
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
 p_id=>wwv_flow_imp.id(456076312556216493)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(456190243242439425)
,p_name=>'P68_BIREPORTURL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467019196599925213)
,p_name=>'P68_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''MATERIALIN''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  ;'))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
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
 p_id=>wwv_flow_imp.id(516550541048496079)
,p_name=>'P68_CREATOR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Creator'
,p_placeholder=>'Transporter Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      a.Creator d,',
'      a.Creator r',
'From GATEINREGISTER_VIEW a'))
,p_cSize=>74
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467160533871468948)
,p_name=>'P68_DOCTYPE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Doc Type'
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
'  and a.ModuleCode = ''MATERIALIN''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';'))
,p_lov_cascade_parent_items=>'P68_COMPANY'
,p_ajax_items_to_submit=>'P68_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(467158884075468947)
,p_name=>'P68_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Trunc(sysdate)-3'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'button',
  'show_other_months', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467161342839468949)
,p_name=>'P68_GRNSTATUS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'GRN Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:PREPARED;PREPARED,PENDING;PENDING'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select GRN Status--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467161750429468949)
,p_name=>'P68_ITEM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Material'
,p_placeholder=>'Material '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        e.ItemName||'' ( ''||e.ItemCode as d,',
'        e.ItemCode r',
'From MaterialInDetail a, Item e',
'Where a.ItemCode = e.itemCode',
'',
'Union',
'',
'Select',
'        Distinct',
'        e.ItemName||'' ( ''||e.ItemCode as ItemName,',
'        e.ItemCode',
'From MaterialOutDetail a, Item e',
'Where a.ItemCode = e.itemCode',
''))
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467162519803468949)
,p_name=>'P68_ITEMSPECIFICATION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        ee.ItemSpecificationName as d,',
'        ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P68_ITEM',
'and   e.TNo = ee.TNo',
'',
'Union',
'',
'Select',
'        Distinct',
'        ee.ItemSpecificationName as ItemName,',
'        ee.ItemSpecificationCode as ItemCode',
'From MaterialOutDetail a, Item e, ItemSpecification ee',
'Where e.ItemCode = :P68_ITEM',
'and   e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P68_ITEM'
,p_ajax_items_to_submit=>'P68_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467159692545468948)
,p_name=>'P68_LOCATION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
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
'  and a.ModuleCode = ''MATERIALIN''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P68_COMPANY'
,p_ajax_items_to_submit=>'P68_LOCATION'
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
 p_id=>wwv_flow_imp.id(467162950314468949)
,p_name=>'P68_MINO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Mi No'
,p_placeholder=>'Enter Material In No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select MaterialInNo ',
'From MaterialIn ',
'Where instr('':''||:P68_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'--  and instr('':''||:P114_DOCTYPE||'':'','':''||DocTypeCode||'':'') > 0',
'  and MaterialInDate Between :P68_FROMDATE and :P68_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P68_LOCATION'
,p_ajax_items_to_submit=>'P68_MINO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467160104088468948)
,p_name=>'P68_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      p.PartyName d,',
'      p.PartyCode r',
'From MaterialIn a, Party p',
'Where a.PartyCode = p.PartyCode',
''))
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(456535926404327962)
,p_name=>'P68_TNO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467159285418468948)
,p_name=>'P68_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'button',
  'show_other_months', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467160972936468948)
,p_name=>'P68_TRANSPORTER'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Transporter'
,p_placeholder=>'Transporter Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      p.PartyName d,',
'      p.PartyCode r',
'From MaterialIn a, Party p',
'Where a.TransporterCode = p.PartyCode'))
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467162128001468949)
,p_name=>'P68_VEHICLENO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(476960282344826377)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Vehicle No'
,p_placeholder=>'Vehicle No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        a.VehicleNo',
'From MaterialIn a',
'',
'Union',
'',
'Select',
'        Distinct',
'        a.VehicleNo',
'From MaterialOut a'))
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(456096997641216653)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(456095668850216642)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(456097523360216657)
,p_event_id=>wwv_flow_imp.id(456096997641216653)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/materialinregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1'
||'","_paramsP_COMPANY":"&P68_COMPANY.","_paramsP_LOCATION":"&P68_LOCATION.","_paramsP_FROMDATE":"&P68_FROMDATE.","_paramsP_TODATE":"&P68_TODATE.","_paramsP_GRNSTATUS":"&P68_GRNSTATUS.","_paramsP_DOCTYPE":"&P68_DOCTYPE.","_paramsP_VEHICLENO":"&P68_VEHIC'
||'LENO.","_paramsP_PARTY":"&P68_PARTY.","_paramsP_TRANSPORTER":"&P68_TRANSPORTER.","_paramsP_ITEM":"&P68_ITEM.","_paramsP_MINO":"&P68_MINO.","_paramsP_ITEMSPECIFICATION":"&P68_ITEMSPECIFICATION."}'');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(456103706218258887)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(456104145096258888)
,p_event_id=>wwv_flow_imp.id(456103706218258887)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(200385733044429166)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(200386152434429166)
,p_event_id=>wwv_flow_imp.id(200385733044429166)
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
 p_id=>wwv_flow_imp.id(457552615741198255)
,p_name=>'Refresh Report'
,p_static_id=>'refresh-report'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(456076312556216493)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(469312002325367966)
,p_event_id=>wwv_flow_imp.id(457552615741198255)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$(''#filter.a-Collapsible.is-expanded'').removeClass(''is-expanded'').addClass(''is-collapsed'');',
    '    $(''#filter.a-Collapsible .a-Collapsible-content'').hide();')))).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(457552751456198256)
,p_event_id=>wwv_flow_imp.id(457552615741198255)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(476960409734826378)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(456096666728216649)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P68_MINO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P68_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P68_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>7631593697052301
);
wwv_flow_imp.component_end;
end;
/
