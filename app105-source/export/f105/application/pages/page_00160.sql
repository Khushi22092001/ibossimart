prompt --application/pages/page_00160
begin
--   Manifest
--     PAGE: 00160
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
 p_id=>160
,p_name=>'Despatch Advice Register'
,p_alias=>'DESPATCH-ADVICE-REGISTER'
,p_step_title=>'Despatch Advice Register'
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
'  var bireporturl = $(''#P160_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/Dispatchadviceregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P160_FROMDATE'').val());',
'  var toDate = new Date($(''#P160_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P160_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P160_COMPANY'').val() ==="" || $(''#P160_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P160_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P160_COMPANY'').val();',
'       global_companycode= $(''#P160_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +',
'      ''&P_LOCATION='' + $(''#P160_LOCATION'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P160_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P160_TODATE'').val() + ',
'      ''&P_DOCTYPE='' +$(''#P160_DOCTYPE'').val() +',
'      ''&P_PARTY='' +$(''#P160_PARTY'').val() +',
'      ''&P_VEHICLENO='' +$(''#P160_VEHICLENO'').val() +',
'      ''&P_TRANSPORTER='' +$(''#P160_TRANSPORTER'').val() +',
'      ''&P_MSTATUS='' +$(''#P160_MSTATUS'').val() +',
'      ''&P_ITEM='' +$(''#P160_ITEM'').val() +',
'      ''&P_WSTATUS='' +$(''#P160_WSTATUS'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P160_ITEMSPECIFICATION'').val() +',
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
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P160_BIREPORTURL'').val()',
'  var reportName =  ''Dispatchadviceregister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P160_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P160_COMPANY'').val() ==="" || $(''#P160_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P160_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P160_COMPANY'').val();',
'       global_companycode= $(''#P160_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P160_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P160_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P160_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P160_TODATE'').val() + ''",'' +  ',
'	  ''"_paramsP_DOCTYPE":"'' + $(''#P160_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' + $(''#P160_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_VEHICLENO":"'' + $(''#P160_VEHICLENO'').val() + ''",'' + ',
'	  ''"_paramsP_TRANSPORTER":"'' + $(''#P160_TRANSPORTER'').val() + ''",'' + ',
'	  ''"_paramsP_MSTATUS":"'' + $(''#P160_MSTATUS'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P160_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_WSTATUS":"'' + $(''#P160_WSTATUS'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P160_ITEMSPECIFICATION'').val() + ''",'' + ',
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
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(604865642406184046)
,p_plug_name=>'Dispatch Advice Register Report'
,p_static_id=>'dispatch-advice-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--- Sales Order ---',
'Select',
'      a.TNo,',
'      l.LocationName,',
'      dt.DocTypeName,',
'      a.DespatchAdviceNo,',
'      a.DespatchAdviceDate,',
'      iut.SalesOrderNo as ReferenceNo,',
'      iut.SalesOrderDate as ReferenceDate,',
'      ''Sales Order'' as Reference,',
'      p.PartyName,',
'      t.PartyName as Transporter,',
'      e.EmployeeName||'' ( ''||e.EmployeeID||'' )'' as Employee,',
'      a.Drivername,',
'      a.VehicleNo,',
'      e.ItemCode,',
'      e.Itemname||'' ~ ''||ee.itemSpecificationName as Item,',
'      e.MeasuringUnitCode1,',
'      b.Quantity1,',
'      nvl(pt.PackingTypeName,e.MeasuringUnitCode2) as MeasuringUnitCode2 ,',
'      b.Quantity2,',
'      nvl(Decode(mo.ReferenceTNo,a.TNo,''PREPARED''),''PENDING'') as MSTATUS,',
'      mo.MaterialOutNo,',
'      mo.MaterialOutDate,',
'      nvl(Decode(w.ReferenceTNo,a.TNo,''PREPARED''),''PENDING'') as WSTATUS,',
'      w.WeighmentNo,',
'      w.WeighmentDate,',
'      bue.EmployeeName||'' ( ''||a.Creator||'' )'' as Creator,',
'      a.CreationTime,',
'                  ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''DespatchAdvice''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="tru'
||'e" title="Action"></span</span></a>'' AS Print',
'',
'From  DespatchAdvice a, DespatchAdviceDetail b, Location l, DocType dt, Party p, Party t, Employee e, BossUser bu, Employee bue, Item e, itemSpecification ee, SalesOrder iut,',
'      MaterialOut mo, Weighment w, PackingType pt',
'Where a.TNo = b.TNo(+)',
'  and a.Locationcode = l.LocationCode(+)',
'  and a.DocTypeCode = dt.DocTypeCode(+)',
'  and a.PartyCode = p.PartyCode(+)',
'  and a.TransporterCode = t.PartyCode(+)',
'  and a.EmployeeCode = e.EmployeeCode(+)',
'  and a.Creator = bu.LoginName(+)',
'  and bu.EmployeeCode = bue.EmployeeCode(+)',
'  and b.ItemCode = e.ItemCode(+)',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'  and a.ReferenceTNo = iut.TNo(+)',
'  and a.TNo = mo.ReferenceTNo(+)',
'  and a.TNo = w.ReferenceTNo(+)',
'  and b.PackingTypeCode = pt.PackingTypeCode(+)',
'  and trunc(a.DespatchAdviceDate) between :P160_FROMDATE and :P160_TODATE',
'  and ( :P160_COMPANY IS NULL OR instr('':''||:P160_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'  and ( :P160_LOCATION IS NULL OR instr('':''||:P160_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'  and ( :P160_DOCTYPE IS NULL OR instr('':''||:P160_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 ) ',
'  --and instr('':''||:P160_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  --and instr('':''||:P160_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  --and instr('':''||:P160_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0',
'  and ( :P160_PARTY IS NULL OR instr('':''||:P160_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P160_TRANSPORTER IS NULL OR instr('':''||:P160_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 ) ',
'  and ( :P160_ITEM IS NULL OR instr('':''||:P160_ITEM||'':'','':''||e.ItemCode||'':'') > 0 ) ',
'  and ( :P160_ITEMSPECIFICATION IS NULL OR instr('':''||:P160_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 ) ',
'  --and a.DespatchAdviceNo like nvl(:P160_DANO,''%'')',
'  and (:P160_VEHICLENO is null or a.VehicleNo = :P160_VEHICLENO)',
'  and nvl(Decode(w.ReferenceTNo,a.TNo,''PREPARED''),''PENDING'') like nvl(:P160_WSTATUS,''%'')',
'  and nvl(Decode(mo.ReferenceTNo,a.TNo,''PREPARED''),''PENDING'') like nvl(:P160_MSTATUS,''%'')',
'  and getcompanyprivilege(a.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'  AND getlocationprivilege(a.locationcode,GETMODULECODEFORPAGENO(:APP_PAGE_ID),a.companycode,:global_loginname)=''YES''',
'  AND getdoctypeprivilege(a.doctypecode,GETMODULECODEFORPAGENO(:APP_PAGE_ID),a.companycode,:global_loginname)=''YES'''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Dispatch Advice Register Report'
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
 p_id=>wwv_flow_imp.id(627168240093647073)
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
,p_detail_link=>'f?p=&APP_ID.:161:&SESSION.::&DEBUG.:161:P161_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>609701227968417757
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533452811864857457)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'TIMESTAMP'
,p_column_html_expression=>'<div style="display:block; width:80px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533452447625857457)
,p_db_column_name=>'CREATOR'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'USER (RAISED BY)'
,p_column_html_expression=>'<div style="display:block; width:100px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533446795030857454)
,p_db_column_name=>'DESPATCHADVICEDATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'DESPATCH ADVICE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#DESPATCHADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533446379440857454)
,p_db_column_name=>'DESPATCHADVICENO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'DESPATCH ADVICE NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#DESPATCHADVICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533446029987857454)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'DOCTYPE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533449162443857455)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'DRIVER'
,p_column_html_expression=>'<div style="display:block; width:100px">#DRIVERNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533448810950857455)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'EMPLOYEE'
,p_column_html_expression=>'<div style="display:block; width:100px">#EMPLOYEE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533455203293857459)
,p_db_column_name=>'ITEM'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:300px">#ITEM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533453965818857458)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533445618417857453)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533450763586857456)
,p_db_column_name=>'MATERIALOUTDATE'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'MATERIAL OUT DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#MATERIALOUTDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533450365764857456)
,p_db_column_name=>'MATERIALOUTNO'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'MATERIALOUT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#MATERIALOUTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533454358466857458)
,p_db_column_name=>'MEASURINGUNITCODE1'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#MEASURINGUNITCODE1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533315985234438332)
,p_db_column_name=>'MEASURINGUNITCODE2'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#MEASURINGUNITCODE2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533450018058857456)
,p_db_column_name=>'MSTATUS'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'MATERIAL OUT STATUS'
,p_column_html_expression=>'<div style="display:block; width:100px">#MSTATUS#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533448371917857455)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(366577365928977129)
,p_db_column_name=>'PRINT'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533454813544857458)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533316109694438333)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533448031876857455)
,p_db_column_name=>'REFERENCE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'REFERENCE'
,p_column_html_expression=>'<div style="display:block; width:100px">#REFERENCE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533447619046857455)
,p_db_column_name=>'REFERENCEDATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'REFERENCE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#REFERENCEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533447246410857454)
,p_db_column_name=>'REFERENCENO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'REFERENCE NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#REFERENCENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533453243147857458)
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
 p_id=>wwv_flow_imp.id(533453558248857458)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'TRANSPORTER'
,p_column_html_expression=>'<div style="display:block; width:200px">#TRANSPORTER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533449630067857456)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'VEHICLE NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533451958838857457)
,p_db_column_name=>'WEIGHMENTDATE'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'WEIGHMENT DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#WEIGHMENTDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533451581978857457)
,p_db_column_name=>'WEIGHMENTNO'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'WEIGHMENT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#WEIGHMENTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(533451183438857457)
,p_db_column_name=>'WSTATUS'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'WEIGHMENT STATUS'
,p_column_html_expression=>'<div style="display:block; width:100px">#WSTATUS#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(627231432545652607)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'44097'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:LOCATIONNAME:DOCTYPENAME:DESPATCHADVICEDATE:DESPATCHADVICENO:PARTYNAME:TRANSPORTER:REFERENCE:REFERENCENO:REFERENCEDATE:VEHICLENO:DRIVERNAME:ITEMCODE:ITEM:MEASURINGUNITCODE1:QUANTITY1:MEASURINGUNITCODE2:QUANTITY2:MSTATUS:MATERIALOUTNO:CREATOR:CR'
||'EATIONTIME'
,p_sort_column_1=>'DESPATCHADVICEDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'DESPATCHADVICENO'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(614406007565322863)
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(57173497021429440)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(604865642406184046)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:161:&SESSION.::&DEBUG.:161::'
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
 p_id=>wwv_flow_imp.id(57173823021429441)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(604865642406184046)
,p_button_name=>'CUSTOM2'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/despatchadviceregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P160_FROMDATE=&P160_FROMDATE.&P160_TODATE=&P160_TODATE.&P160_LOCATION=&P160_LOCATION.&P160_DOCTYPE=&P160_DOCTYPE.&P160_PARTY=&P160_PARTY.&P160_TRANSPORTER=&P160_TRANSPORTER.&P160_ITEM=&P160_ITEM.&P160_ITEMSPECIFICATION=&P160_ITEMSPECIFICATION.&P160_DANO=&P160_DANO.&P160_VEHICLENO=&P160_VEHICLENO.&P160_WSTATUS=&P160_WSTATUS.&P160_MSTATUS=&P160_MSTATUS.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(57173097343429440)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(604865642406184046)
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
 p_id=>wwv_flow_imp.id(57172695690429440)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(604865642406184046)
,p_button_name=>'PDF2'
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
 p_id=>wwv_flow_imp.id(57174621497429444)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>2
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(522357340726480956)
,p_name=>'P160_BIREPORTURL'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(533338318919438392)
,p_name=>'P160_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''DESPATCHADVICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'Order by 1',
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
 p_id=>wwv_flow_imp.id(533481953427857522)
,p_name=>'P160_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
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
'  and a.ModuleCode = ''DESPATCHADVICE''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';'))
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
 p_id=>wwv_flow_imp.id(57141122314331827)
,p_name=>'P160_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_item_default=>'trunc(sysdate) - 4'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(533483958077857522)
,p_name=>'P160_ITEM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d ,',
'      e.ItemCode r',
'From DespatchAdviceDetail a, Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 2'))
,p_cSize=>75
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
 p_id=>wwv_flow_imp.id(533484367682857523)
,p_name=>'P160_ITEMSPECIFICATION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'     ee.ItemSpecificationName as d,',
'     ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P160_ITEM',
'  and e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P160_ITEM'
,p_ajax_items_to_submit=>'P160_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>75
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
 p_id=>wwv_flow_imp.id(533480757666857521)
,p_name=>'P160_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
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
'  and a.ModuleCode = ''DESPATCHADVICE''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
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
 p_id=>wwv_flow_imp.id(533481604372857522)
,p_name=>'P160_MSTATUS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_prompt=>'MO Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:PENDING;PENDING,PREPARED;PREPARED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Material Out Status--'
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
 p_id=>wwv_flow_imp.id(533482378865857522)
,p_name=>'P160_PARTY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From DespatchAdvice a, Party p',
'Where a.PartyCode = p.PartyCode'))
,p_cSize=>75
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(522746797916694255)
,p_name=>'P160_TNO'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(533480372136857521)
,p_name=>'P160_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_item_default=>'trunc(sysdate)'
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
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(533483195655857522)
,p_name=>'P160_TRANSPORTER'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_prompt=>'Transporter'
,p_placeholder=>'Transporter Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From DESPATCHADVICE a, Party p',
'Where a.TransporterCode = p.PartyCode'))
,p_cSize=>75
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
 p_id=>wwv_flow_imp.id(533483545866857522)
,p_name=>'P160_VEHICLENO'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_prompt=>'VehicleNo'
,p_placeholder=>'Enter Vehicle No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'Select Distinct VehicleNo From DespatchAdvice order by 1'
,p_cSize=>28
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(533481174417857521)
,p_name=>'P160_WSTATUS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(614406007565322863)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(57179866401429450)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(57172695690429440)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(57180382253429451)
,p_event_id=>wwv_flow_imp.id(57179866401429450)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/despatchadviceregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt'
||'":"1","_paramsP_COMPANY":"&P160_COMPANY.","_paramsP_LOCATION":"&P160_LOCATION.","_paramsP_FROMDATE":"&P160_FROMDATE.","_paramsP_TODATE":"&P160_TODATE.","_paramsP_DOCTYPE":"&P160_DOCTYPE.","_paramsP_ITEM":"&P160_ITEM.","_paramsP_VEHICLENO":"&P160_VEHI'
||'CLENO.","_paramsP_ITEMSPECIFICATION":"&P160_ITEMSPECIFICATION.","_paramsP_TRANSPORTER":"&P160_TRANSPORTER.","_paramsP_MSTATUS":"&P160_MSTATUS.","_paramsP_WSTATUS":"&P160_WSTATUS."}'');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(57180802293429451)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(57181311652429451)
,p_event_id=>wwv_flow_imp.id(57180802293429451)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(57179414982429450)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P160_DANO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P160_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P160_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>39712402857200134
);
wwv_flow_imp.component_end;
end;
/
