prompt --application/pages/page_00129
begin
--   Manifest
--     PAGE: 00129
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
 p_id=>129
,p_name=>'Requisition Register'
,p_alias=>'REQUISITION-REGISTER'
,p_step_title=>'Requisition Register'
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
'  var bireporturl = $(''#P129_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/RequisitionRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P129_FROMDATE'').val());',
'  var toDate = new Date($(''#P129_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P129_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P129_COMPANY'').val() ==="" || $(''#P129_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P129_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P129_COMPANY'').val();',
'       global_companycode= $(''#P129_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +     ',
'      ''&P_STATUS='' +$(''#P129_STATUS'').val() + ',
'      ''&P_FROMDATE='' +$(''#P129_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P129_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P129_LOCATION'').val() + ',
'      ''&P_GROUP='' + $(''#P129_GROUP'').val() + ',
'      ''&P_DEPARTMENT='' + $(''#P129_DEPARTMENT'').val() + ',
'      ''&P_DOCTYPE='' +$(''#P129_DOCTYPE'').val() +',
'      ''&P_ITEM='' +$(''#P129_ITEM'').val() +',
'      ''&P_COSTCENTRE='' +$(''#P129_COSTCENTRE'').val() +',
'      ''&P_ITEMSPECIFICATION='' +$(''#P129_ITEMSPECIFICATION'').val() +',
'      ''&P_ISSUESTATUS='' +$(''#P129_ISSUESTATUS'').val()  +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode ',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P129_BIREPORTURL'').val()',
'  var reportName =  ''RequisitionRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P129_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P129_COMPANY'').val() ==="" || $(''#P129_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P129_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P129_COMPANY'').val();',
'       global_companycode= $(''#P129_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P129_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_STATUS":"'' + $(''#P129_STATUS'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P129_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P129_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P129_LOCATION'').val() + ''",'' + ',
'	  ''"_paramsP_GROUP":"'' + $(''#P129_GROUP'').val() + ''",'' + ',
'	  ''"_paramsP_DEPARTMENT":"'' + $(''#P129_DEPARTMENT'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' + $(''#P129_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P129_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_COSTCENTRE":"'' + $(''#P129_COSTCENTRE'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P129_ITEMSPECIFICATION'').val() + ''",'' + ',
'	  ''"_paramsP_ISSUESTATUS":"'' + $(''#P129_ISSUESTATUS'').val() + ''",'' + ',
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
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'.t-TreeNav--styleA .a-TreeView-node--topLevel ul,',
'.t-TreeNav--styleB .a-TreeView-node--topLevel ul {',
'  --a-treeview-node-padding-y: 0.40rem !important;',
'  --a-treeview-node-font-size: 1.00rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(506518816557513000)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(506518988521513001)
,p_plug_name=>'Material Requisition Register'
,p_static_id=>'material-requisition-register'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'      a.TNo,',
'      b.Sno,',
'      l.LocationName,',
'      GetItemName(e.ItemCode)||'' ~ ''||e.ItemCode as MaterialGroup,',
'      Upper(d.DocTypeName) as DocTypeName,',
'      a.RequisitionNo,',
'      a.RequisitionDate,',
'      dp.DepartmentName,',
'      w.WorkCentreName,',
'      e.ItemCode,',
'      e.ItemName||'' ~ ''||ee.ItemSpecificationName as Material,',
'      b.MeasuringUnitCode1 as UOM1,',
'      b.MeasuringUnitCode2 as UOM2,',
'      b.Quantity1 as PQuantity,',
'      b.Quantity2 as Squantity,',
'      case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
'           When dsd.DocumentStatusCode is null Then ''NONACTIVE''',
'           When dsd.DocumentStatusCode = ''PREPARING'' Then ''PREPARING''',
'           When dsd.DocumentStatusCode = ''PREPARED'' Then ''PREPARED''',
'           When dsd.DocumentStatusCode = ''AUTHORISED'' Then ''AUTHORISED''',
'           When dsd.DocumentStatusCode = ''CANCELED'' Then ''CANCELED''',
'           When dsd.DocumentStatusCode = ''ONHOLD'' Then ''ONHOLD''',
'           When dsd.DocumentStatusCode = ''SHORTCLOSED'' Then ''SHORTCLOSED''',
'           When dsd.DocumentStatusCode = ''CLOSED'' Then ''CLOSED''',
'           When dsd.DocumentStatusCode = ''DEPTAPPROVED'' Then ''DEPTAPPROVED''',
'           When dsd.DocumentStatusCode = ''STOREAPPROVED'' Then ''STOREAPPROVED''',
'      End as DocStatus,',
'      dsd.DocumentStatusCode,',
'      cc.CostCentrename as CostCenter,',
'      P.PartyCode,',
'      p.PartyName,',
'      bue.EmployeeName||''( ''||a.Creator||'' )'' as Creator,',
'      a.CreationTime,',
'      b.Remark,',
'      (sysdate) - (RequisitionDate) as PendingSInce,',
'      nvl(decode(i.RequisitionTno,a.TNo,''ISSUED''),''PENDING'') as IssueStatus,',
'                  ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''Requisition''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" '
||'title="Action"></span</span></a>'' AS Print',
'',
'From  Requisition a, RequisitionDetail b, RequisitionCostCentreDetail C, CostCentre cc, Location l, DocType d, Item e, ItemSpecification ee, Department dp, DocumentStatusDetail dsd, Party p, BossUser bu, Employee bue',
',Issue i, WorkCentre w',
'Where a.TNo = b.TNo',
'  and b.TNo = c.TNo(+)',
'  and b.SNo = c.SNo(+)',
'  and c.CostCentreCode = cc.CostCentreCode(+)',
'  and a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = d.DocTypeCode',
'  and a.DepartmentCode = dp.DepartmentCode(+)',
'  and a.WorkcentreCode = w.Workcentrecode(+)',
'  and e.TNo = ee.TNo',
'  and b.ItemCode = e.ItemCode',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode',
'  and a.Creator = bu.LoginName(+)',
'  and bu.EmployeeCode = bue.EmployeeCode(+)	',
'  and a.TNo = dsd.ModuleTNo(+)',
'  and a.PartyCode = p.PartyCode(+)',
'  and a.RequisitionDate Between :P129_FROMDATE and :P129_TODATE',
'  and ( :P129_COMPANY IS NULL OR instr('':''||:P129_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'  and ( :P129_LOCATION IS NULL OR instr('':''||:P129_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'  --and instr('':''||:P129_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  --and instr('':''||:P129_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and ( :P129_ITEM IS NULL OR instr('':''||:P129_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'  and ( :P129_ITEMSPECIFICATION IS NULL OR instr('':''||:P129_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'  and ( :P129_DEPARTMENT IS NULL OR instr('':''||:P129_DEPARTMENT||'':'','':''||a.DepartmentCode||'':'') > 0 )',
'  and ( :P129_DOCTYPE IS NULL OR instr('':''||:P129_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 )',
'  and ( :P129_COSTCENTRE IS NULL OR instr('':''||:P129_COSTCENTRE||'':'','':''||cc.CostCentreCode||'':'') > 0 )',
'',
'  and ( :P129_GROUP IS NULL OR instr('':''||:P129_GROUP||'':'','':''||e.itemtype||'':'') > 0 )',
'',
'/*  and ( :P129_GROUP IS NULL',
'      or',
'      exists (select 1 from (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode in ( select itemcode from item xx where',
'                                    instr('':''||:P129_GROUP||'':'','':''||xx.ItemCode||'':'') > 0)',
'                                    ',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x where x.itemcode = e.itemcode',
'        )',
'  )  */',
'',
'  and case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
'           When dsd.DocumentStatusCode is null Then ''NONACTIVE''',
'           When dsd.DocumentStatusCode = ''PREPARING'' Then ''PREPARING''',
'           When dsd.DocumentStatusCode = ''PREPARED'' Then ''PREPARED''',
'           When dsd.DocumentStatusCode = ''AUTHORISED'' Then ''AUTHORISED''',
'           When dsd.DocumentStatusCode = ''CANCELED'' Then ''CANCELED''',
'           When dsd.DocumentStatusCode = ''ONHOLD'' Then ''ONHOLD''',
'           When dsd.DocumentStatusCode = ''SHORTCLOSED'' Then ''SHORTCLOSED''',
'           When dsd.DocumentStatusCode = ''CLOSED'' Then ''CLOSED''',
'           When dsd.DocumentStatusCode = ''DEPTAPPROVED'' Then ''DEPTAPPROVED''',
'           When dsd.DocumentStatusCode = ''STOREAPPROVED'' Then ''STOREAPPROVED''',
'      End like nvl(:P129_STATUS,''%'')',
'   and a.TNo = i.RequisitionTNo(+)',
'   and nvl(decode(i.RequisitionTno,a.TNo,''ISSUED''),''PENDING'') like nvl(:P129_ISSUESTATUS,''%'')',
'   order by a.RequisitionDate desc',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(497072985563643620)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_report_saving=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.::P130_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>65629606172648386
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449999202709839531)
,p_db_column_name=>'COSTCENTER'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'COST CENTER'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450000807291839532)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'TIME STAMP'
,p_column_html_expression=>'<div style="display:block; width:80px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450000428048839531)
,p_db_column_name=>'CREATOR'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'USER (RAISED BY)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449995960059839529)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'DEPARTMENT'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449993243299839528)
,p_db_column_name=>'DOCSTATUS'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Docstatus'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449992371923839528)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'DOCTYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449998833371839531)
,p_db_column_name=>'DOCUMENTSTATUSCODE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'DOCUMENT STATUS'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449891847308360814)
,p_db_column_name=>'ISSUESTATUS'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'ISSUE STATUS'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449996421775839529)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449994405761839529)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449996767770839530)
,p_db_column_name=>'MATERIAL'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:200px">#MATERIAL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449994762996839529)
,p_db_column_name=>'MATERIALGROUP'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'MATERIAL_GROUP'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450000035399839531)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'VENDOR_CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449999594841839531)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'VENDOR_NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449992797866839528)
,p_db_column_name=>'PENDINGSINCE'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'PENDING SINCE (IN DAYS)'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999G999G999G999G999G999G990'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449891305259360809)
,p_db_column_name=>'PQUANTITY'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'PRIMARY QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(283825630443470524)
,p_db_column_name=>'PRINT'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450001586051839532)
,p_db_column_name=>'REMARK'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'REMARK'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449995593564839529)
,p_db_column_name=>'REQUISITIONDATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'MR_DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#REQUISITIONDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449995217173839529)
,p_db_column_name=>'REQUISITIONNO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'MR_NO'
,p_column_html_expression=>'<div style="display:block; width:200px">#REQUISITIONNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449993955316839528)
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
 p_id=>wwv_flow_imp.id(449891443451360810)
,p_db_column_name=>'SQUANTITY'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'SECONDARY QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449993548092839528)
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
 p_id=>wwv_flow_imp.id(449891501314360811)
,p_db_column_name=>'UOM1'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'PRIMARY UOM'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(449891598975360812)
,p_db_column_name=>'UOM2'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'SECONDARY UOM'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(468213822104112493)
,p_db_column_name=>'WORKCENTRENAME'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'WORK CENTRE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(497099573499800974)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'39703'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:DOCUMENTSTATUSCODE:LOCATIONNAME:DOCTYPENAME:REQUISITIONDATE:REQUISITIONNO:DEPARTMENTNAME:COSTCENTER:MATERIAL:PQUANTITY:UOM1:SQUANTITY:UOM2:CREATOR:CREATIONTIME:REMARK:ISSUESTATUS'
,p_sort_column_1=>'REQUISITIONDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DEPARTMENTNAME'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'DOCTYPENAME'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'REQUISITIONNO'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'COSTCENTER'
,p_sort_direction_5=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438374956599914461)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(506518988521513001)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:130:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439183468450279352)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(506518988521513001)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/mrregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P129_FROMDATE=&P129_FROMDATE.&P129_TODATE=&P129_TODATE.&P129_LOCATION=&P129_LOCATION.&P129_STATUS=&P129_STATUS.&P129_BREAKUPAS=&P129_BREAKUPAS.&P129_BREAKUP=&P129_BREAKUP.&P129_DEPARTMENT=&P129_DEPARTMENT.&P129_GROUPLEVEL=&P129_GROUPLEVEL.&P129_GROUP=&P129_GROUP.&P129_ITEM=&P129_ITEM.&P129_ITEMSPECIFICATION=&P129_ITEMSPECIFICATION.&P129_COSTCENTRE=&P129_COSTCENTRE.&P129_PARTY=&P129_PARTY.'
,p_button_condition=>'1'
,p_button_condition2=>'2'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438374982678914462)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(506518988521513001)
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
 p_id=>wwv_flow_imp.id(439183064277279351)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(506518988521513001)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439170956667279215)
,p_button_sequence=>130
,p_button_plug_id=>wwv_flow_imp.id(506518816557513000)
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
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(439793429652186768)
,p_name=>'P129_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449892180769360810)
,p_name=>'P129_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_placeholder=>'Enter Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''REQUISITION''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  ;'))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
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
 p_id=>wwv_flow_imp.id(449992215137839528)
,p_name=>'P129_COSTCENTRE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_prompt=>'Cost Center'
,p_placeholder=>'Cost Center'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      cc.CostCentreName d,',
'      cc.CostCentreCode r',
'From  RequisitionCostCentreDetail a, CostCentre cc',
'Where a.CostCentreCode = cc.CostCentreCode'))
,p_cSize=>22
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449991417250839528)
,p_name=>'P129_DEPARTMENT'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_prompt=>'Department'
,p_placeholder=>'Department'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      d.DepartmentName d,',
'      d.DepartmentCode r',
'from  Requisition a, Department d',
'Where a.DepartmentCode = d.DepartmentCode'))
,p_cSize=>22
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'LDT:MIL:RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_08', '1',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(456740557789686896)
,p_name=>'P129_DOCTYPE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_prompt=>'Doc Type'
,p_placeholder=>'Select Doc Type'
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
'  and a.ModuleCode = ''REQUISITION''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(449989041563839527)
,p_name=>'P129_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_item_default=>'Trunc(sysdate)-7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>14
,p_colspan=>4
,p_grid_column=>1
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
 p_id=>wwv_flow_imp.id(449990229180839528)
,p_name=>'P129_GROUP'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_prompt=>'Group'
,p_placeholder=>'Material Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'select itemtypename d  , itemtypecode r from itemtype'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>40
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(449892698450360815)
,p_name=>'P129_ISSUESTATUS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_prompt=>'Issue Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PENDING;PENDING,ISSUED;ISSUED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Issue Status--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449991104329839528)
,p_name=>'P129_ITEM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||''~''||e.ItemCode as d,',
'      e.ItemCode as r',
'From Item e ,RequisitionDetail a',
'Where e.ItemCode = a.ItemCode'))
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
 p_id=>wwv_flow_imp.id(449991847354839528)
,p_name=>'P129_ITEMSPECIFICATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_prompt=>'Specification'
,p_placeholder=>'Material Description'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo',
'  and e.ItemCode = :P129_ITEM'))
,p_lov_cascade_parent_items=>'P129_ITEM'
,p_ajax_items_to_submit=>'P129_ITEMSPECIFICATION'
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
 p_id=>wwv_flow_imp.id(449990698659839528)
,p_name=>'P129_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
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
'  and a.ModuleCode = ''REQUISITION''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
'  ',
''))
,p_lov_cascade_parent_items=>'P129_COMPANY'
,p_ajax_items_to_submit=>'P129_LOCATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(449989881673839528)
,p_name=>'P129_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ACTIVE,Non-Active;NONACTIVE,Canceled;CANCELED,Closed;CLOSED,Preparing;PREPARING,Prepared;PREPARED,Authorised;AUTHORISED,On Hold;ONHOLD,Short Closed;SHORTCLOSED,Dept Approved;DEPTAPPROVED,Store Approval;STOREAPPROVED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select  Status --'
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
 p_id=>wwv_flow_imp.id(449989467434839527)
,p_name=>'P129_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(506518816557513000)
,p_item_default=>'Trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>14
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(439184059605279352)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(439183064277279351)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(439184540881279352)
,p_event_id=>wwv_flow_imp.id(439184059605279352)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/mrregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1","_para'
||'msP_COMPANY":"&P129_COMPANY.","_paramsP_LOCATION":"&P129_LOCATION.","_paramsP_FROMDATE":"&P129_FROMDATE.","_paramsP_TODATE":"&P129_TODATE.","_paramsP_GROUP":"&P129_GROUP.","_paramsP_ITEM":"&P129_ITEM.","_paramsP_ISSUESTATUS":"&P129_ISSUESTATUS.","_pa'
||'ramsP_ITEMSPECIFICATION":"&P129_ITEMSPECIFICATION.","_paramsP_DEPARTMENT":"&P129_DEPARTMENT.","_paramsP_DOCTYPE":"&P129_DOCTYPE.","_paramsP_COSTCENTRE":"&P129_COSTCENTRE."}'');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(440422451389799567)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(440422480450799568)
,p_event_id=>wwv_flow_imp.id(440422451389799567)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
