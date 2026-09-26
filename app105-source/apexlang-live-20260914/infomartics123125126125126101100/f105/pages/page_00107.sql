prompt --application/pages/page_00107
begin
--   Manifest
--     PAGE: 00107
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
 p_id=>107
,p_name=>'Indent Register'
,p_alias=>'INDENT-REGISTER'
,p_step_title=>'Indent Register'
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
'  var bireporturl = $(''#P107_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/indentregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P107_FROMDATE'').val());',
'  var toDate = new Date($(''#P107_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P107_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P107_COMPANY'').val() ==="" || $(''#P107_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P107_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P107_COMPANY'').val();',
'       global_companycode= $(''#P107_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +  ',
'      ''&P_STATUS='' +$(''#P107_STATUS'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P107_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P107_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P107_LOCATION'').val() +',
'      ''&P_DEPARTMENT='' + $(''#P107_DEPARTMENT'').val() +',
'      ''&P_DOCTYPE='' +$(''#P107_DOCTYPE'').val() +',
'      ''&P_ITEMTYPE='' +$(''#P107_ITEMTYPE'').val() +',
'      ''&P_INDENTNO='' +$(''#P107_INDENTNO'').val() +',
'      ''&P_ITEM='' +$(''#P107_ITEM'').val() +',
'      ''&P_POSTATUS='' +$(''#P107_POSTATUS'').val() +',
'      ''&P_COSTCENTRE='' +$(''#P107_COSTCENTRE'').val() +',
'      ''&P_INDENTSTATUS='' +$(''#P107_INDENTSTATUS'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P107_ITEMSPECIFICATION'').val() +',
'      ''&P_CREATOR='' +$(''#P107_CREATOR'').val()  +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode;',
'      ',
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
'  var bireporturl = $(''#P107_BIREPORTURL'').val()',
'  var reportName =  ''indentregister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P107_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P107_COMPANY'').val() ==="" || $(''#P107_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P107_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P107_COMPANY'').val();',
'       global_companycode= $(''#P107_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P107_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'      ''"_paramsP_STATUS":"'' +$(''#P107_STATUS'').val() + ''",'' +    ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P107_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P107_TODATE'').val() + ''",'' + ',
'      ''"_paramsP_LOCATION":"'' + $(''#P107_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_DEPARTMENT":"'' +$(''#P107_DEPARTMENT'').val() + ''",'' + ',
'      ''"_paramsP_DOCTYPE":"'' +$(''#P107_DOCTYPE'').val() + ''",'' + ',
'      ''"_paramsP_ITEMTYPE":"'' +$(''#P107_ITEMTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_INDENTNO":"'' +$(''#P107_INDENTNO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' +$(''#P107_ITEM'').val() + ''",'' + ',
'      ''"_paramsP_POSTSTATUS":"'' +$(''#P107_POSTSTATUS'').val() + ''",'' + ',
'	  ''"_paramsP_COSTCENTRE":"'' +$(''#P107_COSTCENTRE'').val() + ''",'' + ',
'	  ''"_paramsP_INDENTSTATUS":"'' +$(''#P107_INDENTSTATUS'').val() + ''",'' + ',
'      ''"_paramsP_ITEMSPECIFICATION":"'' +$(''#P107_ITEMSPECIFICATION'').val() + ''",'' + ',
'      ''"_paramsP_CREATOR":"'' +$(''#P107_CREATOR'').val() + ''",'' + ',
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
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'#APP_FILES#mycss/MyIR (2)#MIN#.css'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.btn-success {',
'    background-color: #28a745;',
'    color: #fff;',
'}',
'.btn-danger {',
'    background-color: #dc3545;',
'    color: #fff;',
'}',
'',
'.kachha {',
'    background-color: rgb(250, 250, 200);',
'}',
'',
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'',
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important;',
'  ',
'}',
'',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(459639451638538198)
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
 p_id=>wwv_flow_imp.id(470361670316893314)
,p_plug_name=>'Indent Register Report'
,p_static_id=>'indent-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select xx.*,',
'  ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||xx.TNO||'',''||''Indent''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title="Action"></spa'
||'n</span></a>'' AS Print',
'',
' from ',
'(Select',
'      a.TNo,',
'      b.SNo,',
'      l.LocationName,',
'      dt.DocTypeName,',
'      dp.DepartmentName,',
'      a.IndentNo,',
'      a.IndentDate,',
'      a.Remark,',
'      e.ParentCode||'' ~ ''||GetItemname(e.ParentCode) as MaterialGroup,',
'      b.ItemCode,',
'      e.ItemName||'' ~ ''||ee.ItemSpecificationName as Material,',
'      e.MeasuringUnitCode1 as UOM1,',
'      round(b.IndentQuantity1,3) as IndentQuantity1,',
'      e.MeasuringUnitCode2 as UOM2,',
'      round(b.IndentQuantity2,3) as IndentQuantity2,',
'      round(B.Quantity1,3) as SanctionQuantity1,',
'      round(B.Quantity2,3) as SanctionQuantity2,',
'      NVL(round(b.IndentQuantity1 - b.Quantity1,3) ,0) as DiffSanctionandIndent,',
'      b.Remark as Purpose,',
'      b.DocumentStatusCode as DocumentStatus,',
'      case when po.indenttno = a.tno then',
'                ''PREPARED''',
'           when po.indenttno is null then',
'                ''PENDING''',
'       end POStatus,',
'     ',
'      po.Tno as POTNO,',
'      po.PurchaseOrderNo,',
'      po.PurchaseOrderDate,',
'      po.PartyName,',
'      round(po.POQuantity1,3) as POQuantity1,',
'      round(po.POQuantity2,3) as POQuantity2,',
'      NVL(round(b.Quantity1 - po.POQuantity1,3),0) as Variance1,',
'      NVL(round(b.Quantity2 - po.POQuantity2,3),0) as Variance2,',
'      bue.EmployeeName||'' ( ''||a.Creator||'' )'' as Creator,',
'      a.CreationTime,',
'      case When b.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
'           When b.DocumentStatusCode is null Then ''NON-ACTIVE''',
'           When b.DocumentStatusCode = ''PREPARING'' Then ''PREPARING''',
'           When b.DocumentStatusCode = ''PREPARED'' Then ''PREPARED''',
'           When b.DocumentStatusCode = ''AUTHORISED'' Then ''AUTHORISED''',
'           When b.DocumentStatusCode = ''CANCELED'' Then ''CANCELED''',
'           When b.DocumentStatusCode = ''ONHOLD'' Then ''ONHOLD''',
'           When b.DocumentStatusCode = ''SHORTCLOSED'' Then ''SHORTCLOSED''',
'           When b.DocumentStatusCode = ''CLOSED'' Then ''CLOSED''',
'           When b.DocumentStatusCode = ''DEPTAPPROVED'' Then ''DEPTAPPROVED''',
'           When b.DocumentStatusCode = ''STOREAPPROVED'' Then ''STOREAPPROVED''',
'      End as DocStatus,',
'      null AS tstatus',
'From  Indent a, IndentDetail b, Location l , Doctype dt, Department dp, Item e, ItemSpecification ee, MeasuringUnit mu, BossUser bu, Employee bue,',
'      (Select',
'            pp.TNo,',
'            qq.IndentTNo,',
'            pp.PurchaseOrderNo,',
'            pp.PurchaseOrderDate,',
'            ppp.PartyName,',
'            ppp.PartyCode,',
'            qq.ItemCode,',
'            qq.ItemSpecificationCode,',
'            qq.Quantity1 as POQuantity1,',
'            qq.Quantity2 as POQuantity2',
'      From  PurchaseOrder pp, PurchaseOrderDetailIndent qq, Party ppp',
'      Where pp.TNo = qq.TNo',
'        and pp.PartyCode = ppp.PartyCode ) po',
'Where a.TNo = b.TNo(+)',
'  and a.LocationCode = l.LocationCode(+)',
'  and a.DocTypeCode = dt.DocTypeCode(+)',
'  and a.DepartmentCode = dp.DepartmentCode(+)',
'  and b.ItemCode = e.ItemCode(+)',
'  and B.Itemspecificationcode = ee.ItemSpecificationCode(+)',
'  and E.Measuringunitcode1 = Mu.Measuringunitcode(+)',
'  and b.Tno = po.IndentTNo(+)',
'  and b.ItemCode = Po.Itemcode(+)',
'  and b.Itemspecificationcode = po.ItemSpecificationCode(+)',
'',
'  and a.Creator = bu.LoginName(+)',
'  and bu.EmployeeCode = bue.EmployeeCode(+)',
'  and a.IndentDate between :P107_FROMDATE and :P107_TODATE',
'  and ( :P107_DOCTYPE IS NULL OR instr('':''||:P107_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 ) ',
'  and ( :P107_LOCATION IS NULL OR instr('':''||:P107_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'  and ( :P107_COMPANY IS NULL OR instr('':''||:P107_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'   and ( :P107_ITEM IS NULL OR instr('':''||:P107_ITEM||'':'','':''||e.ItemCode||'':'') > 0 ) ',
'  and ( :P107_ITEMSPECIFICATION IS NULL OR instr('':''||:P107_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 ) ',
' -- and ( :P107_GROUP IS NULL OR instr('':''||:P107_GROUP||'':'','':''||e.ParentCode||'':'') > 0 ) ',
'  and ( :P107_DEPARTMENT IS NULL OR instr('':''||:P107_DEPARTMENT||'':'','':''||a.DepartmentCode||'':'') > 0 ) ',
'  and a.IndentNo like nvl(:P107_INDENTNO,''%'')',
'  -- Added on 28-May-2022',
'  and ( :P107_ITEMTYPE IS NULL or instr('':''||:P107_ITEMTYPE||'':'','':''||e.ItemType||'':'') > 0 )',
'',
'   and getcompanyprivilege(A.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'',
' ',
'  and case When b.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
'           When b.DocumentStatusCode is null Then ''NON-ACTIVE''',
'           When b.DocumentStatusCode = ''PREPARING'' Then ''PREPARING''',
'           When b.DocumentStatusCode = ''PREPARED'' Then ''PREPARED''',
'           When b.DocumentStatusCode = ''AUTHORISED'' Then ''AUTHORISED''',
'           When b.DocumentStatusCode = ''CANCELED'' Then ''CANCELED''',
'           When b.DocumentStatusCode = ''ONHOLD'' Then ''ONHOLD''',
'           When b.DocumentStatusCode = ''SHORTCLOSED'' Then ''SHORTCLOSED''',
'           When b.DocumentStatusCode = ''CLOSED'' Then ''CLOSED''',
'           When b.DocumentStatusCode = ''DEPTAPPROVED'' Then ''DEPTAPPROVED''',
'           When b.DocumentStatusCode = ''STOREAPPROVED'' Then ''STOREAPPROVED''',
'      End  like nvl(:P107_STATUS,''%'') ',
' ',
') xx',
'where xx.postatus like nvl(:P107_POSTATUS,''%'')',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P107_TNO'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Indent Register Report'
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
 p_id=>wwv_flow_imp.id(494875410567856021)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:108:P108_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>63432031176860787
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448978015735116205)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'CREATION TIME'
,p_column_html_expression=>'<div style="display:block; width:80px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448977611497116205)
,p_db_column_name=>'CREATOR'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'CREATOR'
,p_column_html_expression=>'<div style="display:block; width:150px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448969592883116201)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'DEPARTMENT'
,p_column_html_expression=>'<div style="display:block; width:100px">#DEPARTMENTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448973614169116203)
,p_db_column_name=>'DIFFSANCTIONANDINDENT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'VARIANCE'
,p_column_html_expression=>'<div style="display:block; width:60px">#DIFFSANCTIONANDINDENT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448978822265116205)
,p_db_column_name=>'DOCSTATUS'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'DOC STATUS'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCSTATUS#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_static_id=>'DOCSTATUS'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448969201793116200)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'DOCTYPE'
,p_column_html_expression=>'<div style="display:block; width:150px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448974461314116203)
,p_db_column_name=>'DOCUMENTSTATUS'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'STATUS'
,p_column_html_expression=>'<div style="display:block; width:100px">#DOCUMENTSTATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448970437347116201)
,p_db_column_name=>'INDENTDATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'INDENT DATE'
,p_column_html_expression=>'<div style="display:block; width:75px">#INDENTDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448970036381116201)
,p_db_column_name=>'INDENTNO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'INDENT NO'
,p_column_html_expression=>'<div style="display:block; width:180px">#INDENTNO#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448972837354116202)
,p_db_column_name=>'INDENTQUANTITY1'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'P INDENT QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#INDENTQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449876630212403218)
,p_db_column_name=>'INDENTQUANTITY2'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'S INDENT QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#INDENTQUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448971662293116202)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'MATERIAL CODE'
,p_column_html_expression=>'<div style="display:block; width:60px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448968856989116200)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:120px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448972033984116202)
,p_db_column_name=>'MATERIAL'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:300px">#MATERIAL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448971240160116202)
,p_db_column_name=>'MATERIALGROUP'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'MATERIAL GROUP'
,p_column_html_expression=>'<div style="display:block; width:150px">#MATERIALGROUP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448976477639116204)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449876933084403221)
,p_db_column_name=>'POQUANTITY1'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'P PO QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#POQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(484842522705148928)
,p_db_column_name=>'POQUANTITY2'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'Poquantity2'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448974783820116203)
,p_db_column_name=>'POSTATUS'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'PO STATUS'
,p_column_html_expression=>'<div style="display:block; width:60px">#POSTATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448975198415116204)
,p_db_column_name=>'POTNO'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Potno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(293797355261835721)
,p_db_column_name=>'PRINT'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448976057547116204)
,p_db_column_name=>'PURCHASEORDERDATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'PURCHASE ORDER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PURCHASEORDERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448975600249116204)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'PURCHASE ORDER NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#PURCHASEORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448973982335116203)
,p_db_column_name=>'PURPOSE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'PURPOSE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448970878553116201)
,p_db_column_name=>'REMARK'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'REMARK'
,p_column_html_expression=>'<div style="display:block; width:120px">#REMARK#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449876745063403219)
,p_db_column_name=>'SANCTIONQUANTITY1'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'P SANCTION QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#SANCTIONQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449876795352403220)
,p_db_column_name=>'SANCTIONQUANTITY2'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'S SANCTION QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#SANCTIONQUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448968434982116200)
,p_db_column_name=>'SNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(448968042040116198)
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
 p_id=>wwv_flow_imp.id(104456503269662588)
,p_db_column_name=>'TSTATUS'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Tstatus'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449876411736403216)
,p_db_column_name=>'UOM1'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449876488509403217)
,p_db_column_name=>'UOM2'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449877173386403223)
,p_db_column_name=>'VARIANCE1'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'P VARIANCE QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#VARIANCE1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449877241247403224)
,p_db_column_name=>'VARIANCE2'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'S VARIANCE QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#VARIANCE2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(494961916929676496)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'36976'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:DOCSTATUS:LOCATIONNAME:DOCTYPENAME:DEPARTMENTNAME:INDENTDATE:INDENTNO:ITEMCODE:MATERIAL:UOM1:INDENTQUANTITY1:SANCTIONQUANTITY1:UOM2:INDENTQUANTITY2:SANCTIONQUANTITY2:DIFFSANCTIONANDINDENT:PURPOSE:POSTATUS:PURCHASEORDERNO:PURCHASEORDERDATE:PARTY'
||'NAME:POQUANTITY1:VARIANCE1:VARIANCE2:REMARK:CREATOR:CREATIONTIME'
,p_sort_column_1=>'INDENTDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DEPARTMENTNAME'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'INDENTQUANTITY1:SANCTIONQUANTITY:POQUANTITY:SANCTIONQUANTITY1:INDENTQUANTITY2:SANCTIONQUANTITY2:DIFFSANCTIONANDINDENT:POQUANTITY1:VARIANCE1:VARIANCE2'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(108890765963664019)
,p_report_id=>wwv_flow_imp.id(494961916929676496)
,p_static_id=>'ir-condition'
,p_name=>'Short'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DIFFSANCTIONANDINDENT'
,p_operator=>'>'
,p_expr=>'0'
,p_condition_sql=>' (case when ("DIFFSANCTIONANDINDENT" > to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# > #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#FF2946'
,p_column_font_color=>'#FFFFFF'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(108891189309664019)
,p_report_id=>wwv_flow_imp.id(494961916929676496)
,p_static_id=>'ir-condition-2'
,p_name=>'Equal'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DIFFSANCTIONANDINDENT'
,p_operator=>'='
,p_expr=>'0'
,p_condition_sql=>' (case when ("DIFFSANCTIONANDINDENT" = to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#4AFF7A'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(108891562352664021)
,p_report_id=>wwv_flow_imp.id(494961916929676496)
,p_static_id=>'ir-condition-3'
,p_name=>'Excess Sanction'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'DIFFSANCTIONANDINDENT'
,p_operator=>'<'
,p_expr=>'0'
,p_condition_sql=>' (case when ("DIFFSANCTIONANDINDENT" < to_number(#APXWS_EXPR#)) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# < #APXWS_EXPR_NUMBER#  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#FF24FF'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438445707088317259)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(470361670316893314)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:108::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438437391305305685)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(470361670316893314)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'PDF'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'P107_STATUS'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438445475454316031)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(470361670316893314)
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
 p_id=>wwv_flow_imp.id(108899789179609650)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(470361670316893314)
,p_button_name=>'KACHHA'
,p_static_id=>'kachha'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--success'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'Kachha'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(108899858458609651)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(470361670316893314)
,p_button_name=>'PACKKA'
,p_static_id=>'packka'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>4072362960822175091
,p_button_image_alt=>'PACKKA'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438437810252305686)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(470361670316893314)
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
 p_id=>wwv_flow_imp.id(438420847653305625)
,p_button_sequence=>180
,p_button_plug_id=>wwv_flow_imp.id(459639451638538198)
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
 p_id=>wwv_flow_imp.id(439227225156444267)
,p_name=>'P107_BIREPORTURL'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448990899683157601)
,p_name=>'P107_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'Company'
,p_placeholder=>'Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''INDENT''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and upper(bu.BossUserName) =  upper(''&APP_USER.'')',
'  and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES'''))
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
 p_id=>wwv_flow_imp.id(448966357846116187)
,p_name=>'P107_COSTCENTRE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(498895226411585209)
,p_name=>'P107_CREATOR'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'Creator'
,p_placeholder=>'Enter Creator Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'bue.EmployeeName||'' ( ''||a.Creator||'' )'' d,',
'bue.EmployeeName||'' ( ''||a.Creator||'' )'' r',
'FROM Indent a, BossUser bu, Employee bue',
'where a.Creator = bu.LoginName(+)',
'and bu.EmployeeCode = bue.EmployeeCode(+)'))
,p_lov_cascade_parent_items=>'P107_COMPANY'
,p_ajax_items_to_submit=>'P107_LOCATION,P107_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(448965122747116186)
,p_name=>'P107_DEPARTMENT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'Department'
,p_placeholder=>'Department List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'DepartmentName d,',
'DepartmentCode r',
'From Department',
''))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448991012130157602)
,p_name=>'P107_DOCTYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
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
'  and a.ModuleCode = ''INDENT''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and instr('':''||:P107_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order by 1',
';'))
,p_lov_cascade_parent_items=>'P107_COMPANY'
,p_ajax_items_to_submit=>'P107_LOCATION,P107_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(448963911087116184)
,p_name=>'P107_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_item_default=>'Trunc(sysdate-3)'
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
 p_id=>wwv_flow_imp.id(448967537962116188)
,p_name=>'P107_INDENTNO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'Indent No'
,p_placeholder=>'Enter Indent No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select IndentNo ',
'From Indent ',
'Where instr('':''||:P107_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and indentDate Between :P107_FROMDATE and :P107_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P107_LOCATION'
,p_ajax_items_to_submit=>'P107_INDENTNO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448966729884116187)
,p_name=>'P107_INDENTSTATUS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448967145524116187)
,p_name=>'P107_ITEM'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'Material'
,p_placeholder=>'Material List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo'))
,p_cSize=>79
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
 p_id=>wwv_flow_imp.id(448967926661116188)
,p_name=>'P107_ITEMSPECIFICATION'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo',
'  and e.ItemCode = :P107_ITEM'))
,p_lov_cascade_parent_items=>'P107_ITEM'
,p_ajax_items_to_submit=>'P107_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>79
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
 p_id=>wwv_flow_imp.id(448965877562116187)
,p_name=>'P107_ITEMTYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'Item Type'
,p_placeholder=>'Item Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'select ItemTypeName d, ItemTypeCode r from ItemType order by 1'
,p_cSize=>79
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
 p_id=>wwv_flow_imp.id(104455990983662583)
,p_name=>'P107_KACHHA'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(470361670316893314)
,p_item_display_point=>'ORDER_BY_ITEM'
,p_item_default=>'NVL(GETMYPARAMETERVALUE(''BLACKTRANSACTION''),''NO'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448965518293116187)
,p_name=>'P107_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
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
'  and a.ModuleCode = ''INDENT''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
' /* and a.CompanyCode = :P107_COMPANY */',
' and instr('':''||:P107_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P107_COMPANY'
,p_ajax_items_to_submit=>'P107_LOCATION'
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
 p_id=>wwv_flow_imp.id(448968274357116188)
,p_name=>'P107_POSTATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'PO Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PENDING;PENDING,PREPARED;PREPARED,CASHPURCHASE;CASHPURCHASE'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select PO Status --'
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
 p_id=>wwv_flow_imp.id(448964671058116186)
,p_name=>'P107_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ACTIVE,Non-Active;NON-ACTIVE,Canceled;CANCELED,Closed;CLOSED,Preparing;PREPARING,Prepared;PREPARED,Authorised;AUTHORISED,On Hold;ONHOLD,Short Closed;SHORTCLOSED,Dept Approved;DEPTAPPROVED,Store Approval;STOREAPPROVED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Indent Status--'
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
 p_id=>wwv_flow_imp.id(438244561455653779)
,p_name=>'P107_TNO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448964289680116185)
,p_name=>'P107_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(459639451638538198)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(439248602767518535)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(438437810252305686)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(439248708373518536)
,p_event_id=>wwv_flow_imp.id(439248602767518535)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(438454697993420121)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(438455120109420122)
,p_event_id=>wwv_flow_imp.id(438454697993420121)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(108900626237609658)
,p_name=>'hide show kachha packka btn'
,p_static_id=>'hide-show-kachha-packka-btn'
,p_event_sequence=>80
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108900682923609659)
,p_event_id=>wwv_flow_imp.id(108900626237609658)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899789179609650)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'GETMYPARAMETERVALUE(''BLACKTRANSACTION'')=''NO'''
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901197949609664)
,p_event_id=>wwv_flow_imp.id(108900626237609658)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899858458609651)
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'GETMYPARAMETERVALUE(''BLACKTRANSACTION'')=''YES'''
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(108901844052609671)
,p_name=>'hide show kachha packka btn_1'
,p_static_id=>'hide-show-kachha-packka-btn-2'
,p_event_sequence=>90
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901988233609672)
,p_event_id=>wwv_flow_imp.id(108901844052609671)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P107_KACHHA'
,p_server_condition_type=>'EXPRESSION'
,p_server_condition_expr1=>'GETMYPARAMETERVALUE(''BLACKTRANSACTION'')=''NO'''
,p_server_condition_expr2=>'PLSQL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(183301893629456402)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183302313738456409)
,p_event_id=>wwv_flow_imp.id(183301893629456402)
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
 p_id=>wwv_flow_imp.id(438438857585305686)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(438437391305305685)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(438439292444305686)
,p_event_id=>wwv_flow_imp.id(438438857585305686)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/indentregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1","_pa'
||'ramsP107_COMPANY":"&P107_COMPANY.","_paramsP107_LOCATION":"&P107_LOCATION.","_paramsP107_FROMDATE":"&P107_FROMDATE.","_paramsP107_TODATE":"&P107_TODATE.","_paramsP107_DEPARTMENT":"&P107_DEPARTMENT.","_paramsP107_DOCTYPE":"&P107_DOCTYPE.","_paramsP107'
||'_GROUP":"&P107_GROUP.","_paramsP107_COSTCENTRE":"&P107_COSTCENTRE.","_paramsP107_ITEM":"&P107_ITEM.","_paramsP107_ISSUENO":"&P107_ISSUENO.","_paramsP107_ITEMSPECIFICATION":"&P107_ITEMSPECIFICATION."}'');')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(104456090203662584)
,p_name=>'New_1'
,p_static_id=>'new-2'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P107_KACHHA'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(104456191195662585)
,p_event_id=>wwv_flow_imp.id(104456090203662584)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P107_KACHHA',
  'language', 'PLSQL',
  'plsql_code', 'update myparameter set myparametervalue = :P107_KACHHA WHERE MYPARAMETERCODE = ''BLACKTRANSACTION'';',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901464641609667)
,p_event_id=>wwv_flow_imp.id(104456090203662584)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899858458609651)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P107_KACHHA'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901646386609669)
,p_event_id=>wwv_flow_imp.id(104456090203662584)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide-2'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899789179609650)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P107_KACHHA'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(104456276790662586)
,p_event_id=>wwv_flow_imp.id(104456090203662584)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(470361670316893314)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901577782609668)
,p_event_id=>wwv_flow_imp.id(104456090203662584)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899858458609651)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P107_KACHHA'
,p_client_condition_expression=>'NO'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901815746609670)
,p_event_id=>wwv_flow_imp.id(104456090203662584)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show-2'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899789179609650)
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P107_KACHHA'
,p_client_condition_expression=>'YES'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(108899992246609652)
,p_name=>'New_2'
,p_static_id=>'new-3'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(108899789179609650)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901026333609662)
,p_event_id=>wwv_flow_imp.id(108899992246609652)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', 'update myparameter set myparametervalue = ''NO'' WHERE MYPARAMETERCODE = ''BLACKTRANSACTION'';',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108900051188609653)
,p_event_id=>wwv_flow_imp.id(108899992246609652)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899789179609650)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901062488609663)
,p_event_id=>wwv_flow_imp.id(108899992246609652)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(470361670316893314)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901303225609665)
,p_event_id=>wwv_flow_imp.id(108899992246609652)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P107_KACHHA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'NO')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108900216041609654)
,p_event_id=>wwv_flow_imp.id(108899992246609652)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899858458609651)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(108900263327609655)
,p_name=>'New_2_1'
,p_static_id=>'new-4'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(108899858458609651)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108900825546609660)
,p_event_id=>wwv_flow_imp.id(108900263327609655)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', 'update myparameter set myparametervalue = ''YES'' WHERE MYPARAMETERCODE = ''BLACKTRANSACTION'';',
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108900375887609656)
,p_event_id=>wwv_flow_imp.id(108900263327609655)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-hide'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899858458609651)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108900843716609661)
,p_event_id=>wwv_flow_imp.id(108900263327609655)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(470361670316893314)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108901423765609666)
,p_event_id=>wwv_flow_imp.id(108900263327609655)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P107_KACHHA'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'suppress_change_event', 'N',
  'type', 'STATIC_ASSIGNMENT',
  'value', 'YES')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(108900526691609657)
,p_event_id=>wwv_flow_imp.id(108900263327609655)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-show'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(108899789179609650)
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(438438432804305686)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P107_INDENTNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P107_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P107_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>6995053413310452
);
wwv_flow_imp.component_end;
end;
/
