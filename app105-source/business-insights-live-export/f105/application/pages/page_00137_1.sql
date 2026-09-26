prompt --application/pages/page_00137
begin
--   Manifest
--     PAGE: 00137
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
 p_id=>137
,p_name=>'Issue Register'
,p_alias=>'ISSUE-REGISTER'
,p_step_title=>'Issue Register'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
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
'  var bireporturl = $(''#P137_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/IssueRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P137_FROMDATE'').val());',
'  var toDate = new Date($(''#P137_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P137_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P137_COMPANY'').val() ==="" || $(''#P137_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P137_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P137_COMPANY'').val();',
'       global_companycode= $(''#P137_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +   ',
'      ''&P_FROMDATE='' +$(''#P137_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P137_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P137_LOCATION'').val() +  ',
'      ''&P_DEPARTMENT='' + $(''#P137_DEPARTMENT'').val() +',
'      ''&P_DOCTYPE='' +$(''#P137_DOCTYPE'').val() +',
'      ''&P_GROUP='' +$(''#P137_GROUP'').val() +',
'      ''&P_COSTCENTRE='' +$(''#P137_COSTCENTRE'').val() +',
'      ''&P_ITEM='' +$(''#P137_ITEM'').val() +',
'      ''&P_ISSUENO='' +$(''#P137_ISSUENO'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P137_ITEMSPECIFICATION'').val() +',
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
'  var bireporturl = $(''#P137_BIREPORTURL'').val()',
'  var reportName =  ''IssueRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P137_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P137_COMPANY'').val() ==="" || $(''#P137_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P137_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P137_COMPANY'').val();',
'       global_companycode= $(''#P137_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P137_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P137_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P137_TODATE'').val() + ''",'' +  ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P137_LOCATION'').val() + ''",'' + ',
'	  ''"_paramsP_DEPARTMENT":"'' + $(''#P137_DEPARTMENT'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' + $(''#P137_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_GROUP":"'' + $(''#P137_GROUP'').val() + ''",'' + ',
'	  ''"_paramsP_COSTCENTRE":"'' + $(''#P137_COSTCENTRE'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P137_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_ISSUENO":"'' + $(''#P137_ISSUENO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P137_ITEMSPECIFICATION'').val() + ''",'' + ',
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
'#MYID.a-GV-row.is-hover, .a-IRR-table tr:hover td{',
'    background-color: #FFFACD;',
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
 p_id=>wwv_flow_imp.id(468469046455039621)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(468469204151039622)
,p_plug_name=>'Material Issue Report'
,p_static_id=>'material-issue-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      a.TNo,',
'      b.SNo,',
'      l.LocationName,',
'      a.IssueNo,',
'      a.IssueDate,',
'      r.RequisitionNo,',
'      r.RequisitionDate,',
'      d.DepartmentName,',
'     -- w.WorkCentreName,',
'      e.ParentCode||'' ~ ''||GetItemName(e.Parentcode) as MaterialGroup,',
'      b.ItemCode,',
'      e.ItemName||'' ~ ''||ee.ItemSpecificationName as MaterialDetail,',
'      e.ItemName,',
'      gn.GRNNo,',
'      ee.ItemSpecificationName,',
'      --eg.EquipmentGroupName,',
'      e.MeasuringUnitCode1 as PUOM,',
'      e.MeasuringUnitCode2 as SUOM,',
'      nvl(c.Quantity1,b.Quantity1) as PIssueQuantity,',
'      nvl(c.Quantity2,b.Quantity2) as SIssueQuantity,',
'      --cc.CostCentreName as CostCentreName,',
'      --getcostcentrename(c.costcentrecode) as CostCentreName,',
'      r.PRequestQuantity,',
'      r.SRequestQuantity,',
'      r.PRequestQuantity - nvl(c.Quantity1,b.Quantity1) as DifferencePQuantity,',
'      r.SRequestQuantity - nvl(c.Quantity2,b.Quantity2) as DifferenceSQuantity,',
'      em.EmployeeName||''( ''||r.Creator||'' )''as Creator,',
'      a.CreationTime,',
'      ''Details'' as SerialNo,',
'      Round(nvl((stk.Amount/nvl(b.Quantity1,b.Quantity1)),0),2) as Rate,',
'      (nvl(c.Quantity1,b.Quantity1) * Round(nvl((stk.Amount/nvl(b.Quantity1,c.Quantity1)),0),2)) as Amount,',
'      nvl(r.partyName,r.EmployeeName) as IssuedTo,',
'                ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''Issue''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title="A'
||'ction"></span</span></a>'' AS Print',
'',
'From Issue a, IssueDetail b, Location l, Item e, itemSpecification ee, Department d,IssueCostCentreDetail c,  IssueStockStorageDetail iss,Stock s, GRN gn,',
'--CostCentre cc, ',
'      (Select',
'            aa.TNo,',
'            aa.DepartmentCode,',
'            aa.WorkcentreCode,',
'            aa.RequisitionNo,',
'            aa.RequisitionDate,',
'            bb.ItemCode,',
'            bb.ItemSpecificationCode,',
'            nvl(cd.Quantity1,bb.Quantity1) as PRequestQuantity,',
'            nvl(cd.Quantity2,bb.Quantity2) as SRequestQuantity,',
'            aa.Creator,',
'            p.PartyName,',
'            emp.EmployeeName,',
'            cd.CostCentreCode',
'      From  Requisition aa, RequisitionDetail bb, RequisitionCostCentreDetail cd,Party p, Employee emp',
'      Where aa.TNo = bb.TNo(+)',
'        and aa.PartyCode = p.PartyCode(+)',
'        and bb.TNo = cd.TNo(+)',
'        and bb.SNo = cd.Sno(+)',
'        and aa.IssueToEmployeeCode = emp.EmployeeCode(+)',
'        --and (:P137_PROJECT Is Null Or :P137_PROJECT = aa.projecttno)',
'        ) r, Employee em, BossUser bu,',
'      (Select',
'        aa.ItemCode,',
'        aa.ItemSpecificationCode,',
'        bb.ModuleCode,',
'        bb.ModuleTNo,',
'      sum(aa.Rate * bb.UsedStockQuantity1) as Amount',
'      From  Stock aa, UsedStock bb',
'      Where aa.Tno = bb.StockTNo',
'        and bb.ModuleCode = ''ISSUE''',
'      Group By aa.ItemCode,',
'              aa.ItemSpecificationCode,',
'              bb.ModuleCode,',
'              bb.ModuleTNo )stk',
'Where a.TNo = b.TNo(+)',
'  and a.locationCode = l.LocationCode(+)',
'  and b.TNo = c.TNo(+)',
'  and b.SNo = c.Sno(+)',
'  --and c.CostCentreCode = cc.CostCentreCode(+)',
'  --and c.CostCentreCode = r.CostCentreCode(+)',
'  and a.RequisitionTNo = r.TNo',
'  and b.RequisitionTNo = r.TNo',
'  and b.ItemCode = e.ItemCode(+)',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'  and b.ItemCode = r.ItemCode',
'  and b.ItemSpecificationCode = r.ItemSpecificationCode',
'  and r.DepartmentCode = d.DepartmentCode(+)',
'  --and r.WorkcentreCode = w.WorkCentreCode(+)',
' -- and c.CostCentreCode = eq.CostCentreCode(+)',
' -- and eq.EquipmentGroupCode = eg.EquipmentGroupCode(+)',
'  and b.Tno = iss.Tno(+)',
'  and b.Sno = iss.Sno(+)',
'  and iss.StockTno = s.Tno(+)',
'  and s.GRNTno = gn.Tno(+)',
'  and b.TNo = stk.ModuleTNo(+)',
'  and b.ItemCode = stk.ItemCode(+)',
'  and b.ItemSpecificationCode = stk.ItemSpecificationCode(+)',
'  and a.IssueDate Between :P137_FROMDATE and :P137_TODATE',
'  and ( :P137_COMPANY IS NULL OR instr('':''||:P137_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'  and ( :P137_DOCTYPE IS NULL OR instr('':''||:P137_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 ) ',
'  --and instr('':''||:P137_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and ( :P137_LOCATION IS NULL OR instr('':''||:P137_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'  --and instr('':''||:P137_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  --and instr('':''||:P137_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0',
'  and ( :P137_ITEM IS NULL OR instr('':''||:P137_ITEM||'':'','':''||b.ItemCode||'':'') > 0 ) ',
'  and ( :P137_ITEMSPECIFICATION IS NULL OR instr('':''||:P137_ITEMSPECIFICATION||'':'','':''||b.ItemSpecificationCode||'':'') > 0 ) ',
'  and ( :P137_GROUP IS NULL OR instr('':''||:P137_GROUP||'':'','':''||e.itemtype||'':'') > 0 ) ',
'  and ( :P137_DEPARTMENT IS NULL OR instr('':''||:P137_DEPARTMENT||'':'','':''||r.DepartmentCode||'':'') > 0 ) ',
'  and ( :P137_COSTCENTRE IS NULL OR instr('':''||:P137_COSTCENTRE||'':'','':''||c.CostCentreCode||'':'') > 0 ) ',
'  and a.IssueNo like nvl(:P137_ISSUENO,''%'')',
' -- and ( :P137_EQUIPMENT IS NULL OR instr('':''||:P137_EQUIPMENT||'':'','':''||eg.EquipmentGroupCode||'':'') > 0 )',
'  and bu.EmployeeCode = em.EmployeeCode(+)',
'  and r.Creator = bu.LoginName(+)',
'  /*and ( :P137_GROUP IS NULL',
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
'                                    instr('':''||:P137_GROUP||'':'','':''||xx.ItemCode||'':'') > 0)',
'                                    ',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x where x.itemcode = e.itemcode',
'        )',
'  )*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P137_COMPANY'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Material Issue Report'
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
 p_id=>wwv_flow_imp.id(479396396626284814)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_report_saving=>'N'
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
,p_detail_link=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.::P138_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>40411527426586830
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457531019192530332)
,p_db_column_name=>'AMOUNT'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457531828858530332)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'TIMESTAMP'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457529779253530331)
,p_db_column_name=>'CREATOR'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'USER (RAISED BY)'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457525382559530328)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'DEPARTMENT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457459999746180277)
,p_db_column_name=>'DIFFERENCEPQUANTITY'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'DIFFERENCE PRIMARY QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457460085055180278)
,p_db_column_name=>'DIFFERENCESQUANTITY'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'DIFFERENCE SECONDARY QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(507216999849378306)
,p_db_column_name=>'GRNNO'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'GRN No.'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457524232141530328)
,p_db_column_name=>'ISSUEDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'ISSUE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#ISSUEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457531386764530332)
,p_db_column_name=>'ISSUEDTO'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'ISSUED TO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457523800008530327)
,p_db_column_name=>'ISSUENO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'ISSUE NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#ISSUENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457526248183530329)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457526993700530329)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'ITEM NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457527399436530330)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'SPECIFICATION NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457523461813530327)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457526616484530329)
,p_db_column_name=>'MATERIALDETAIL'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:200px">#MATERIALDETAIL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457525819631530328)
,p_db_column_name=>'MATERIALGROUP'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'MATERIAL GROUP'
,p_column_html_expression=>'<div style="display:block; width:200px">#MATERIALGROUP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457459591696180273)
,p_db_column_name=>'PISSUEQUANTITY'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'PRIMARY ISSUE QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457459777958180275)
,p_db_column_name=>'PREQUESTQUANTITY'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'PRIMARY REQUEST QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291366611847173269)
,p_db_column_name=>'PRINT'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457459463715180271)
,p_db_column_name=>'PUOM'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'PRIMARY UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457530614532530331)
,p_db_column_name=>'RATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457525031385530328)
,p_db_column_name=>'REQUISITIONDATE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'REQUISITION DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457524586479530328)
,p_db_column_name=>'REQUISITIONNO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'REQUISITION NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#REQUISITIONNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457530180965530331)
,p_db_column_name=>'SERIALNO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'SERIALNO'
,p_column_link=>'f?p=&APP_ID.:157:&SESSION.::&DEBUG.::P157_TNO,P157_SNO:#TNO#,#SNO#'
,p_column_linktext=>'#SERIALNO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457459700860180274)
,p_db_column_name=>'SISSUEQUANTITY'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'SECONDARY ISSUE QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457523017591530327)
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
 p_id=>wwv_flow_imp.id(457459912220180276)
,p_db_column_name=>'SREQUESTQUANTITY'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'SECONDARY REQUEST QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457459534458180272)
,p_db_column_name=>'SUOM'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'SECONDARY UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457522627663530325)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(479524017502026423)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'39315'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:LOCATIONNAME:ISSUEDATE:ISSUENO:REQUISITIONNO:DEPARTMENTNAME:ISSUEDTO:GRNNO:MATERIALDETAIL:PREQUESTQUANTITY:PISSUEQUANTITY:PUOM:SREQUESTQUANTITY:SISSUEQUANTITY:SUOM:RATE:AMOUNT:DIFFERENCEPQUANTITY:DIFFERENCESQUANTITY:CREATOR:CREATIONTIME'
,p_sort_column_1=>'ISSUEDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DEPARTMENTNAME'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'PISSUEQUANTITY:PREQUESTQUANTITY:AMOUNT'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(458071109347729159)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Group by Item/Department'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'44705'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DEPARTMENTNAME:ISSUEDATE:ISSUENO:REQUISITIONNO:ISSUEDTO:MATERIALGROUP:ITEMCODE:MATERIALDETAIL:PUOM:PREQUESTQUANTITY:PISSUEQUANTITY:SUOM:SREQUESTQUANTITY:SISSUEQUANTITY:RATE:AMOUNT:DIFFERENCEPQUANTITY:DIFFERENCESQUANTITY:CREATOR:CREATIONTIME'
,p_sort_column_1=>'DEPARTMENTNAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ISSUEDATE'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(446754413465098741)
,p_report_id=>wwv_flow_imp.id(458071109347729159)
,p_group_by_columns=>'MATERIALDETAIL:DEPARTMENTNAME'
,p_function_01=>'SUM'
,p_function_column_01=>'PISSUEQUANTITY'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Total Primary Qty'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'SISSUEQUANTITY'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Total Secondary Qty'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'AVG'
,p_function_column_03=>'RATE'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'Avg Rate'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'AMOUNT'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'Total Amount'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(445916725612617214)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(468469204151039622)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:138:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(445916631785617213)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(468469204151039622)
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
 p_id=>wwv_flow_imp.id(446755158845098748)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(468469204151039622)
,p_button_name=>'ISSUEREGISTER'
,p_static_id=>'issueregister'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Issue Register'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(446739967120098687)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(468469046455039621)
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
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(447390148466084624)
,p_name=>'P137_BIREPORTURL'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457460252467180271)
,p_name=>'P137_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'Company'
,p_placeholder=>'Enter Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''ISSUE''',
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
 p_id=>wwv_flow_imp.id(473098584800437306)
,p_name=>'P137_COSTCENTRE'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'Cost Centre'
,p_placeholder=>'Enter Cost Centre Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'Distinct',
'a.costcentrename d,',
'a.costcentrecode r',
'from costcentre a, IssueCostCentreDetail b',
'Where a.CostCentreCode = b.CostCentreCode',
''))
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
 p_id=>wwv_flow_imp.id(457520493754530321)
,p_name=>'P137_DEPARTMENT'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'Department'
,p_placeholder=>'Department List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        Distinct',
'        d.DepartmentName d,',
'        d.DepartmentCode r',
'From Requisition a,Department d',
'Where a.DepartmentCode = d.DepartmentCode'))
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(457520909329530321)
,p_name=>'P137_DOCTYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
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
'  and a.ModuleCode = ''ISSUE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
';'))
,p_lov_cascade_parent_items=>'P137_COMPANY'
,p_ajax_items_to_submit=>'P137_DEPARTMENT'
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
 p_id=>wwv_flow_imp.id(507213894367378266)
,p_name=>'P137_EQUIPMENT'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'Equipment Group'
,p_placeholder=>'Material Description'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        Distinct',
'        ee.EquipmentGroupName as d,',
'        ee.EquipmentGroupCode as r',
'From IssueCostCentreDetail d,Equipment e, EquipmentGroup ee',
'Where d.CostCentreCode = e.CostCentreCode(+) ',
'and e.EquipmentGroupCode = ee.EquipmentGroupCode(+)'))
,p_cSize=>75
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(457519294743530318)
,p_name=>'P137_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_item_default=>'Trunc(sysdate) -7'
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
 p_id=>wwv_flow_imp.id(457521337585530321)
,p_name=>'P137_GROUP'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'Group'
,p_placeholder=>'Material Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'select itemtypename d , itemtypecode r from itemtype'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>75
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(457522530111530322)
,p_name=>'P137_ISSUENO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'IssueNo'
,p_placeholder=>'Enter Issue No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select IssueNo ',
'From Issue ',
'Where instr('':''||:P137_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and IssueDate Between :P137_FROMDATE and :P137_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P137_LOCATION'
,p_ajax_items_to_submit=>'P137_ISSUENO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>29
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
 p_id=>wwv_flow_imp.id(457522095798530321)
,p_name=>'P137_ITEM'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'Material'
,p_placeholder=>'Material '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        Distinct',
'        e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'        e.ItemCode r',
'From IssueDetail a, Item e',
'Where a.ItemCode = e.ItemCode'))
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
 p_id=>wwv_flow_imp.id(457522921393530322)
,p_name=>'P137_ITEMSPECIFICATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'Specification'
,p_placeholder=>'Material Description'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'        Distinct',
'        ee.ItemSpecificationName as d,',
'        ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo',
'  and e.ItemCode = :P137_ITEM'))
,p_lov_cascade_parent_items=>'P137_ITEM'
,p_ajax_items_to_submit=>'P137_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(457520082353530320)
,p_name=>'P137_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
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
'  and a.ModuleCode = ''ISSUE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'',
'Order BY 1',
';',
''))
,p_lov_cascade_parent_items=>'P137_COMPANY'
,p_ajax_items_to_submit=>'P137_LOCATION'
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
 p_id=>wwv_flow_imp.id(477390632778905096)
,p_name=>'P137_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_prompt=>'Project'
,p_placeholder=>'Select Project Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select A.PROJECTNAME,A.TNO',
'  From Project A',
' Where A.CompanyCode = :P137_Company',
'   And getdocumentstatuscode(''PROJECT'', A.TNO) = ''ACTIVE''',
''))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Select Project'
,p_lov_cascade_parent_items=>'P137_COMPANY'
,p_ajax_items_to_submit=>'P137_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_display_when_type=>'NEVER'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
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
 p_id=>wwv_flow_imp.id(457519690524530320)
,p_name=>'P137_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(468469046455039621)
,p_item_default=>'Trunc(sysdate)'
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
 p_id=>wwv_flow_imp.id(446756093202098750)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(446755158845098748)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(446756632466098750)
,p_event_id=>wwv_flow_imp.id(446756093202098750)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(448425440002282685)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(448425562605282686)
,p_event_id=>wwv_flow_imp.id(448425440002282685)
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
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(446755687091098748)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
'  if :P137_ISSUENO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P137_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P137_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>7770817891400764
);
wwv_flow_imp.component_end;
end;
/
