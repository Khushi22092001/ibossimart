prompt --application/pages/page_00170
begin
--   Manifest
--     PAGE: 00170
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
 p_id=>170
,p_name=>'Sales Order Register'
,p_alias=>'SALES-ORDER-REGISTER'
,p_step_title=>'Sales Order Register'
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
'  var bireporturl = $(''#P170_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/SalesOrderRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P170_FROMDATE'').val());',
'  var toDate = new Date($(''#P170_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P170_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P170_COMPANY'').val() ==="" || $(''#P170_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P170_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P170_COMPANY'').val();',
'       global_companycode= $(''#P170_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode + ',
'      ''&P_LOCATION='' + $(''#P170_LOCATION'').val() +  ',
'      ''&P_FROMDATE='' +$(''#P170_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P170_TODATE'').val() + ',
'      ''&P_DOCTYPE='' +$(''#P170_DOCTYPE'').val() +',
'      ''&P_PARTY='' + $(''#P170_PARTY'').val() +',
'      ''&P_SONO='' +$(''#P170_SONO'').val() +',
'      ''&P_ITEM='' +$(''#P170_ITEM'').val() +',
'      ''&P_INVOICESTATUS='' +$(''#P170_INVOICESTATUS'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P170_ITEMSPECIFICATION'').val() +',
'      ''&P_STATUS='' +$(''#P170_STATUS'').val()  +',
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
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P170_BIREPORTURL'').val()',
'  var reportName =  ''SalesOrderRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P170_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P170_COMPANY'').val() ==="" || $(''#P170_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P170_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P170_COMPANY'').val();',
'       global_companycode= $(''#P170_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P170_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P170_LOCATION'').val() + ''",'' +  ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P170_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P170_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' +$(''#P170_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' +$(''#P170_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_SONO":"'' +$(''#P170_SONO'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P170_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_INVOICESTATUS":"'' + $(''#P170_INVOICESTATUS'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P170_ITEMSPECIFICATION'').val() + ''",'' +',
'	  ''"_paramsP_STATUS":"'' + $(''#P170_STATUS'').val() + ''",'' + ',
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
'  --a-treeview-node-font-size: 1.00rem !important; ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(587811906341276166)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--noBorder:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(578271541182137349)
,p_plug_name=>'Sales Order Register'
,p_static_id=>'sales-order-register'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),xxx.TNO),''STATUS'') AS Status ,',
'      xxx.TNo,',
'      xxx.SalesOrderNo,',
'      xxx.SalesOrderDate,',
'      xxx.locationname,',
'      xxx.doctypename,',
'      xxx.Vendor,',
'      xxx.Consignee,',
'      xxx.cityname,',
'      xxx.Agent,',
'      xxx.PartyPONo,',
'      xxx.PartyPODate,',
'      xxx.ValidityUptoDate,',
'      xxx.ItemCode,',
'      xxx.ItemName,',
'      xxx.Item,',
'      xxx.UOM,',
'      xxx.Quantity1,',
'      XXX.Quantity2,',
'      xxx.Rate,',
'      xxx.Amount,',
'      xxx.CGST,',
'      xxx.SGST,',
'      xxx.IGST,',
'      xxx.TCS,',
'      xxx.FooterAmount,',
'      (xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)) as OtherAmount,',
'      xxx.TotalAmount,',
'      xxx.Creator,',
'      xxx.CreationTime,',
'      xxx.DespatchQuantity,',
'      xxx.InvoiceQuantity,',
'      xxx.BalanceQuantity,',
'      xxx.freighttypename,',
'      xxx.duedays,',
'      xxx.CreditDays,',
'      xxx.TransactiontypeName,',
'      xxx.NatureOfSupplyName,',
'      xxx.POReceiptNo,',
'      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||XXX.Tno||'',''||''SalesOrder''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title="Acti'
||'on"></span</span></a>'' AS Print',
'',
'From ',
'    (Select',
'          xx.TNo,',
'          xx.SalesOrderNo,',
'          xx.SalesOrderDate,',
'          xx.locationname,',
'          xx.doctypename,',
'          xx.Vendor,',
'          xx.Consignee,',
'          xx.cityname,',
'          xx.Agent,',
'          xx.PartyPONo,',
'          xx.PartyPODate,',
'          xx.ValidityUptoDate,',
'          xx.ItemCode,',
'          xx.ItemName,',
'          xx.Item,',
'          xx.UOM,',
'          xx.Quantity1,',
'          xx.Quantity2,',
'          xx.Rate,',
'          xx.Amount,',
'          sum(xx.CGST) CGST,',
'          sum(xx.SGST) SGST,',
'          sum(xx.IGST) IGST,',
'          sum(xx.TCS) TCS,',
'          xx.FooterAmount,',
'          xx.TotalAmount,',
'          xx.Creator,',
'          xx.CreationTime,',
'          xx.DespatchQuantity,',
'          xx.InvoiceQuantity,',
'          xx.BalanceQuantity,',
'          xx.freighttypename,',
'          xx.duedays,',
'          xx.CreditDays,',
'          xx.TransactiontypeName,',
'          xx.NatureOfSupplyName,',
'          xx.POReceiptNo',
'    From ',
'        (Select',
'              a.Tno,',
'              a.SalesOrderNo,',
'              a.SalesOrderDate,',
'              getlocationname(a.locationcode) as locationname,',
'              getdoctypename(a.doctypecode) as doctypename,',
'              GetPartyName(a.PartyCode) as Vendor,',
'              GetPartyName(a.ConsigneeCode) as Consignee,',
'              ct.cityname,',
'              GetPartyName(a.AgentCode) as Agent,',
'              a.PartyPONo,',
'              a.PartyPODate,',
'              a.ValidityUptoDate,',
'              e.ItemCode,',
'              e.ItemName,',
'              e.ItemName||'' ~ ''||ee.ItemSpecificationName as Item,',
'              e.MeasuringUnitCode1 UOM,',
'              b.Quantity1,',
'              b.quantity2,',
'              b.Rate,',
'              b.Amount,',
'              nvl(Decode(c.FooterHeadCode,''.CGST.'', c.FooterValue),0) as CGST,',
'              nvl(Decode(c.FooterHeadCode,''.SGST.'', c.FooterValue),0) as SGST,',
'              nvl(Decode(c.FooterHeadCode,''.IGST.'', c.FooterValue),0) as IGST,',
'              nvl(Decode(c.FooterHeadCode,''.TCS.'', c.FooterValue),0) as TCS,',
'              b.FooterAmount,',
'              b.TotalAmount,',
'              bue.EmployeeName||'' ( ''||a.Creator||'')'' as Creator,',
'              a.CreationTime,',
'              da.DespatchQuantity,',
'              cc.InvoiceQuantity,',
'              NVL(b.Quantity1,0) - NVL(cc.InvoiceQuantity,0) as BalanceQuantity,',
'              getfreighttypename(a.freighttypecode) as freighttypename,',
'              case when NVL(b.Quantity1,0) - NVL(cc.InvoiceQuantity,0) > 0 then',
'                        trunc(sysdate) - a.validityuptodate ',
'                    else',
'                       0',
'              end duedays,',
'              Case  When b.Quantity1 <= cc.InvoiceQuantity Then ''DONE''',
'                    When b.Quantity1 > cc.InvoiceQuantity Then ''PARTIAL''',
'                    When cc.InvoiceQuantity is null Then ''PENDING''',
'             End as InvoiceStatus,',
'            case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
'                When dsd.DocumentStatusCode is null Then ''NONACTIVE''',
'                When dsd.DocumentStatusCode = ''PREPARING'' Then ''PREPARING''',
'                When dsd.DocumentStatusCode = ''PREPARED'' Then ''PREPARED''',
'                When dsd.DocumentStatusCode = ''AUTHORISED'' Then ''AUTHORISED''',
'                When dsd.DocumentStatusCode = ''CANCELED'' Then ''CANCELED''',
'                When dsd.DocumentStatusCode = ''ONHOLD'' Then ''ONHOLD''',
'                When dsd.DocumentStatusCode = ''SHORTCLOSED'' Then ''SHORTCLOSED''',
'                When dsd.DocumentStatusCode = ''CLOSED'' Then ''CLOSED''',
'                When dsd.DocumentStatusCode = ''DEPTAPPROVED'' Then ''DEPTAPPROVED''',
'                When dsd.DocumentStatusCode = ''STOREAPPROVED'' Then ''STOREAPPROVED''',
'            End as DocStatus,',
'            a.CreditDays,',
'            tt.TransactiontypeName,',
'            ns.NatureOfSupplyName,',
'            por.POReceiptNo',
'        From  SalesOrder a, SalesOrderDetail b, SalesOrderDetailFooter c, ',
'              Item e, ItemSpecification ee, ItemCategory ic, ',
'              BossUser bu, Employee bue, party p, city ct,',
'              DocumentStatusDetail dsd, Transactiontype tt, NatureOfSupply ns,',
'              (',
'              Select',
'                    da.ReferenceTNo,',
'                    dd.ItemCode,',
'                    dd.ItemSpecificationCode,',
'                    sum(dd.Quantity1) as DespatchQuantity',
'              From  DespatchAdvice da, DespatchAdviceDetail dd',
'              Where da.TNo = dd.TNo',
'                and da.DocTypeCode = ''SALE''',
'              Group By da.ReferenceTNo,',
'                    dd.ItemCode,',
'                    dd.ItemSpecificationCode',
'              )da,',
'              (',
'              Select',
'                    cc.SalesOrderTNo,',
'                    cd.ItemCode,',
'                    cd.ItemSpecificationCode,',
'                    sum(cd.Quantity1) as InvoiceQuantity',
'              From  CCInvoice cc, CCInvoiceDetail cd',
'              Where cc.Tno = cd.TNo',
'                and cc.DocTypeCode = ''CHALANCUMINVOICE''',
'              Group By cc.SalesOrderTNo,',
'                    cd.ItemCode,',
'                    cd.ItemSpecificationCode',
'              )cc, POReceipt por',
'        Where a.TNo = b.TNo(+)',
'          and b.TNo = c.TNo(+)',
'          and b.SNo = c.SNo(+)',
'          and b.ItemCode = e.ItemCode',
'          and e.ItemCategoryCode = ic.ItemCategoryCode(+)  ',
'          and b.ItemSpecificationCode = ee.ItemSpecificationCode',
'          and a.Creator = bu.LoginName(+)',
'          and nvl(a.consigneecode,a.partycode)=p.partycode(+)',
'          and nvl(p.workscitycode,p.officecitycode)=ct.citycode(+)',
'          and bu.EmployeeCode = bue.EMployeeCode(+)',
'          and b.TNo = da.ReferenceTNo(+)',
'          and b.ItemCode = da.ItemCode(+)',
'          and b.ItemSpecificationCode = da.ItemSpecificationCode(+)',
'          and b.TNo = cc.SalesOrderTNo(+)',
'          and b.ItemCode = cc.ItemCode(+)',
'          and b.ItemSpecificationCode = cc.ItemSpecificationCode(+)',
'          and a.tno = dsd.moduletno(+)',
'          and a.TransactiontypeCode = tt.TransactiontypeCode(+)',
'          and a.NatureOfSupplyCode = ns.NatureOfSupplyCode(+)',
'          and a.POReceiptTno = por.Tno(+)',
'          and a.SalesOrderDate between :P170_FROMDATE and :P170_TODATE',
'          and (:P170_COMPANY is null or (instr('':''||:P170_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0))',
'          and (:P170_LOCATION is null or (instr('':''||:P170_LOCATION||'':'','':''||a.LocationCode||'':'') > 0))',
'          and (:P170_DOCTYPE is null or (instr('':''||:P170_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0))',
'          and ( :P170_PARTY IS NULL OR instr('':''||:P170_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'          and ( :P170_ITEM IS NULL OR instr('':''||:P170_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'          and ( :P170_ITEMSPECIFICATION IS NULL OR instr('':''||:P170_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'          and ( :P170_ITEMCATEGORY IS NULL OR ic.ItemCategoryCode = :P170_ITEMCATEGORY ) ',
'          and a.SalesOrderNo like nvl(:P170_SONO,''%'')',
'          and Case  When b.Quantity1 <= cc.InvoiceQuantity Then ''DONE''',
'                    When b.Quantity1 > cc.InvoiceQuantity Then ''PARTIAL''',
'                    When cc.InvoiceQuantity is null Then ''PENDING''',
'             End like nvl(:P170_INVOICESTATUS,''%'')',
'           and case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
'                When dsd.DocumentStatusCode is null Then ''NONACTIVE''',
'                When dsd.DocumentStatusCode = ''PREPARING'' Then ''PREPARING''',
'                When dsd.DocumentStatusCode = ''PREPARED'' Then ''PREPARED''',
'                When dsd.DocumentStatusCode = ''AUTHORISED'' Then ''AUTHORISED''',
'                When dsd.DocumentStatusCode = ''CANCELED'' Then ''CANCELED''',
'                When dsd.DocumentStatusCode = ''ONHOLD'' Then ''ONHOLD''',
'                When dsd.DocumentStatusCode = ''SHORTCLOSED'' Then ''SHORTCLOSED''',
'                When dsd.DocumentStatusCode = ''CLOSED'' Then ''CLOSED''',
'                When dsd.DocumentStatusCode = ''DEPTAPPROVED'' Then ''DEPTAPPROVED''',
'                When dsd.DocumentStatusCode = ''STOREAPPROVED'' Then ''STOREAPPROVED''',
'          End like nvl(:P170_STATUS,''%'')',
'         )xx',
'    Group By xx.TNo,',
'          xx.SalesOrderNo,',
'          xx.SalesOrderDate,',
'          xx.locationname,',
'          xx.doctypename,',
'          xx.Vendor,',
'          xx.Consignee,',
'          xx.cityname,',
'          xx.Agent,',
'          xx.PartyPONo,',
'          xx.PartyPODate,',
'          xx.ValidityUptoDate,',
'          xx.ItemCode,',
'          xx.ItemName,',
'          xx.Item,',
'          xx.UOM,',
'          xx.Quantity1,',
'          XX.QUANTITY2,',
'          xx.Rate,',
'          xx.Amount,',
'          xx.FooterAmount,',
'          xx.TotalAmount,',
'          xx.Creator,',
'          xx.CreationTime,',
'          xx.DespatchQuantity,',
'          xx.InvoiceQuantity,',
'          xx.BalanceQuantity,',
'          xx.freighttypename,',
'          xx.duedays,',
'          xx.CreditDays,',
'          xx.TransactiontypeName,',
'          xx.NatureOfSupplyName,',
'          xx.POReceiptNo',
'    )xxx'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P170_COMPANY,P170_LOCATION,P170_FROMDATE,P170_TODATE,P170_DOCTYPE,P170_PARTY,P170_SONO,P170_ITEM,P170_INVOICESTATUS,P170_ITEMSPECIFICATION,P170_TRADETYPE,P170_STATUS,P170_BIREPORTURL,P170_TNO,P170_ITEMCATEGORY'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Dispatch Advice Register'
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
 p_id=>wwv_flow_imp.id(600574138869600376)
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
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.::P171_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>161589269669902392
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457663737309753746)
,p_db_column_name=>'AGENT'
,p_display_order=>670
,p_column_identifier=>'BX'
,p_column_label=>'AGENT'
,p_column_html_expression=>'<div style="display:block; width:180px">#AGENT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457681510868904282)
,p_db_column_name=>'AMOUNT'
,p_display_order=>400
,p_column_identifier=>'AV'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457677142129904279)
,p_db_column_name=>'BALANCEQUANTITY'
,p_display_order=>610
,p_column_identifier=>'BR'
,p_column_label=>'BALANCE QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457681949852904282)
,p_db_column_name=>'CGST'
,p_display_order=>410
,p_column_identifier=>'AW'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465369990637408959)
,p_db_column_name=>'CITYNAME'
,p_display_order=>680
,p_column_identifier=>'BY'
,p_column_label=>'CITY'
,p_column_html_expression=>'<div style="display:block; width:100px">#CITYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457677513537904280)
,p_db_column_name=>'CONSIGNEE'
,p_display_order=>620
,p_column_identifier=>'BS'
,p_column_label=>'CONSIGNEE'
,p_column_html_expression=>'<div style="display:block; width:190px">#CONSIGNEE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457685115074904284)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>550
,p_column_identifier=>'BK'
,p_column_label=>'TIMESTAMP'
,p_column_html_expression=>'<div style="display:block; width:130px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457684736330904283)
,p_db_column_name=>'CREATOR'
,p_display_order=>540
,p_column_identifier=>'BJ'
,p_column_label=>'USER (RAISED BY)'
,p_column_html_expression=>'<div style="display:block; width:120px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(192738225847559167)
,p_db_column_name=>'CREDITDAYS'
,p_display_order=>780
,p_column_identifier=>'CI'
,p_column_label=>'CREDIT DAYS'
,p_column_html_expression=>'<div style="display:block; width:70px">#CREDITDAYS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457676344667904279)
,p_db_column_name=>'DESPATCHQUANTITY'
,p_display_order=>590
,p_column_identifier=>'BP'
,p_column_label=>'DESPATCH QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462519115583715714)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>750
,p_column_identifier=>'CF'
,p_column_label=>'DOCTYPE'
,p_column_html_expression=>'<div style="display:block; width:100px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471355256605792441)
,p_db_column_name=>'DUEDAYS'
,p_display_order=>720
,p_column_identifier=>'CC'
,p_column_label=>'DUES DAYS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457683499843904283)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>450
,p_column_identifier=>'BA'
,p_column_label=>'FOOTERAMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(471355382939792442)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>730
,p_column_identifier=>'CD'
,p_column_label=>'FREIGHT TYPE'
,p_column_html_expression=>'<div style="display:block; width:100px">#FREIGHTTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457682672176904282)
,p_db_column_name=>'IGST'
,p_display_order=>430
,p_column_identifier=>'AY'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457676668382904279)
,p_db_column_name=>'INVOICEQUANTITY'
,p_display_order=>600
,p_column_identifier=>'BQ'
,p_column_label=>'INVOICE QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457680271474904281)
,p_db_column_name=>'ITEM'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:100px">#ITEM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457679470432904281)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457677903133904280)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>630
,p_column_identifier=>'BT'
,p_column_label=>'ITEM NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462519040713715713)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>740
,p_column_identifier=>'CE'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:130px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(192738460071559169)
,p_db_column_name=>'NATUREOFSUPPLYNAME'
,p_display_order=>800
,p_column_identifier=>'CK'
,p_column_label=>'NATURE OF SUPPLY'
,p_column_html_expression=>'<div style="display:block; width:100px">#NATUREOFSUPPLYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457683894996904283)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>460
,p_column_identifier=>'BB'
,p_column_label=>'OTHERAMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457663522805753744)
,p_db_column_name=>'PARTYPODATE'
,p_display_order=>650
,p_column_identifier=>'BV'
,p_column_label=>'PARTY PO DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYPODATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457663366174753743)
,p_db_column_name=>'PARTYPONO'
,p_display_order=>640
,p_column_identifier=>'BU'
,p_column_label=>'PARTY PO NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#PARTYPONO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(27909251617319333)
,p_db_column_name=>'PORECEIPTNO'
,p_display_order=>810
,p_column_identifier=>'CL'
,p_column_label=>'PO RECEIPT NO'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291365022232173253)
,p_db_column_name=>'PRINT'
,p_display_order=>760
,p_column_identifier=>'CG'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457679931378904281)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'P.QUANTITY'
,p_column_html_expression=>'<div style="display:block;width:20px">#QUANTITY1#</DIV>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(465370253362408961)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>700
,p_column_identifier=>'CA'
,p_column_label=>'S.QUANTITY'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457681104452904282)
,p_db_column_name=>'RATE'
,p_display_order=>390
,p_column_identifier=>'AU'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457678691635904280)
,p_db_column_name=>'SALESORDERDATE'
,p_display_order=>570
,p_column_identifier=>'BM'
,p_column_label=>'SALES ORDER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#SALESORDERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457678331565904280)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>560
,p_column_identifier=>'BL'
,p_column_label=>'SALES ORDER NO'
,p_column_html_expression=>'<div style="display:block; width:180px">#SALESORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457682309384904282)
,p_db_column_name=>'SGST'
,p_display_order=>420
,p_column_identifier=>'AX'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(187202309815143555)
,p_db_column_name=>'STATUS'
,p_display_order=>770
,p_column_identifier=>'CH'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457683083338904283)
,p_db_column_name=>'TCS'
,p_display_order=>440
,p_column_identifier=>'AZ'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457679154616904281)
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
 p_id=>wwv_flow_imp.id(457684327619904283)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>470
,p_column_identifier=>'BC'
,p_column_label=>'TOTALAMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(192738362002559168)
,p_db_column_name=>'TRANSACTIONTYPENAME'
,p_display_order=>790
,p_column_identifier=>'CJ'
,p_column_label=>'TRANSACTION TYPE'
,p_column_html_expression=>'<div style="display:block; width:90px">#TRANSACTIONTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457680742019904281)
,p_db_column_name=>'UOM'
,p_display_order=>380
,p_column_identifier=>'AT'
,p_column_label=>'P UNIT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457663571010753745)
,p_db_column_name=>'VALIDITYUPTODATE'
,p_display_order=>660
,p_column_identifier=>'BW'
,p_column_label=>'VALIDITY UPTO'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALIDITYUPTODATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457675907838904277)
,p_db_column_name=>'VENDOR'
,p_display_order=>580
,p_column_identifier=>'BO'
,p_column_label=>'CUSTOMER'
,p_column_html_expression=>'<div style="display:block; width:190px">#VENDOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(600637331321605910)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'38818'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'PRINT:STATUS:LOCATIONNAME:SALESORDERDATE:PORECEIPTNO:SALESORDERNO:VENDOR:CONSIGNEE:AGENT:CREDITDAYS:TRANSACTIONTYPENAME:NATUREOFSUPPLYNAME:FREIGHTTYPENAME:PARTYPONO:PARTYPODATE:VALIDITYUPTODATE:DUEDAYS:ITEMCODE:ITEM:UOM:QUANTITY1:QUANTITY2:RATE:AMOUN'
||'T:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATIONTIME:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY'
,p_sort_column_1=>'SALESORDERDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'TNO'
,p_sort_direction_2=>'DESC'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2:AMOUNT:CGST:SGST:IGST:TCS:TOTALAMOUNT:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(43294462634291508)
,p_report_id=>wwv_flow_imp.id(600637331321605910)
,p_group_by_columns=>'VENDOR'
,p_function_01=>'COUNT_DISTINCT'
,p_function_column_01=>'SALESORDERNO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Total Orders'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'QUANTITY1'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Total Quanity'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'SUM'
,p_function_column_03=>'AMOUNT'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'Total Item Amount'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'CGST'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'CGST %'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
,p_function_05=>'SUM'
,p_function_column_05=>'SGST'
,p_function_db_column_name_05=>'APXWS_GBFC_05'
,p_function_label_05=>'SGST %'
,p_function_format_mask_05=>'999G999G999G999G990D00'
,p_function_sum_05=>'Y'
,p_function_06=>'SUM'
,p_function_column_06=>'IGST'
,p_function_db_column_name_06=>'APXWS_GBFC_06'
,p_function_label_06=>'IGST %'
,p_function_format_mask_06=>'999G999G999G999G990D00'
,p_function_sum_06=>'Y'
,p_function_07=>'SUM'
,p_function_column_07=>'TCS'
,p_function_db_column_name_07=>'APXWS_GBFC_07'
,p_function_label_07=>'TCS %'
,p_function_format_mask_07=>'999G999G999G999G990D00'
,p_function_sum_07=>'Y'
,p_function_08=>'SUM'
,p_function_column_08=>'TOTALAMOUNT'
,p_function_db_column_name_08=>'APXWS_GBFC_08'
,p_function_label_08=>'Total Amount'
,p_function_format_mask_08=>'999G999G999G999G990D00'
,p_function_sum_08=>'Y'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(457712135461055446)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Group By Item'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'39070'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SALESORDERDATE:SALESORDERNO:VENDOR:CONSIGNEE:AGENT:PARTYPONO:PARTYPODATE:VALIDITYUPTODATE:ITEMCODE:ITEM:UOM:QUANTITY1:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATIONTIME:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY'
,p_sort_column_1=>'SALESORDERDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'SALESORDERNO'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(446954487224672231)
,p_report_id=>wwv_flow_imp.id(457712135461055446)
,p_group_by_columns=>'ITEM'
,p_function_01=>'COUNT_DISTINCT'
,p_function_column_01=>'SALESORDERNO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Total Orders'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'QUANTITY1'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Total Quanity'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'SUM'
,p_function_column_03=>'AMOUNT'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'Total Item Amount'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'CGST'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'CGST %'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
,p_function_05=>'SUM'
,p_function_column_05=>'SGST'
,p_function_db_column_name_05=>'APXWS_GBFC_05'
,p_function_label_05=>'SGST %'
,p_function_format_mask_05=>'999G999G999G999G990D00'
,p_function_sum_05=>'Y'
,p_function_06=>'SUM'
,p_function_column_06=>'IGST'
,p_function_db_column_name_06=>'APXWS_GBFC_06'
,p_function_label_06=>'IGST %'
,p_function_format_mask_06=>'999G999G999G999G990D00'
,p_function_sum_06=>'Y'
,p_function_07=>'SUM'
,p_function_column_07=>'TCS'
,p_function_db_column_name_07=>'APXWS_GBFC_07'
,p_function_label_07=>'TCS %'
,p_function_format_mask_07=>'999G999G999G999G990D00'
,p_function_sum_07=>'Y'
,p_function_08=>'SUM'
,p_function_column_08=>'TOTALAMOUNT'
,p_function_db_column_name_08=>'APXWS_GBFC_08'
,p_function_label_08=>'Total Amount'
,p_function_format_mask_08=>'999G999G999G999G990D00'
,p_function_sum_08=>'Y'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(457713540114085405)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Group By Party'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'39084'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'SALESORDERDATE:SALESORDERNO:VENDOR:CONSIGNEE:AGENT:PARTYPONO:PARTYPODATE:VALIDITYUPTODATE:ITEMCODE:ITEM:UOM:QUANTITY1:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATIONTIME:DESPATCHQUANTITY:INVOICEQUANTITY:BALANCEQUANTITY'
,p_sort_column_1=>'SALESORDERDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'SALESORDERNO'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(446955224037672236)
,p_report_id=>wwv_flow_imp.id(457713540114085405)
,p_group_by_columns=>'VENDOR'
,p_function_01=>'COUNT_DISTINCT'
,p_function_column_01=>'SALESORDERNO'
,p_function_db_column_name_01=>'APXWS_GBFC_01'
,p_function_label_01=>'Total Orders'
,p_function_format_mask_01=>'999G999G999G999G990D00'
,p_function_sum_01=>'Y'
,p_function_02=>'SUM'
,p_function_column_02=>'QUANTITY1'
,p_function_db_column_name_02=>'APXWS_GBFC_02'
,p_function_label_02=>'Total Quanity'
,p_function_format_mask_02=>'999G999G999G999G990D00'
,p_function_sum_02=>'Y'
,p_function_03=>'SUM'
,p_function_column_03=>'AMOUNT'
,p_function_db_column_name_03=>'APXWS_GBFC_03'
,p_function_label_03=>'Total Item Amount'
,p_function_format_mask_03=>'999G999G999G999G990D00'
,p_function_sum_03=>'Y'
,p_function_04=>'SUM'
,p_function_column_04=>'CGST'
,p_function_db_column_name_04=>'APXWS_GBFC_04'
,p_function_label_04=>'CGST %'
,p_function_format_mask_04=>'999G999G999G999G990D00'
,p_function_sum_04=>'Y'
,p_function_05=>'SUM'
,p_function_column_05=>'SGST'
,p_function_db_column_name_05=>'APXWS_GBFC_05'
,p_function_label_05=>'SGST %'
,p_function_format_mask_05=>'999G999G999G999G990D00'
,p_function_sum_05=>'Y'
,p_function_06=>'SUM'
,p_function_column_06=>'IGST'
,p_function_db_column_name_06=>'APXWS_GBFC_06'
,p_function_label_06=>'IGST %'
,p_function_format_mask_06=>'999G999G999G999G990D00'
,p_function_sum_06=>'Y'
,p_function_07=>'SUM'
,p_function_column_07=>'TCS'
,p_function_db_column_name_07=>'APXWS_GBFC_07'
,p_function_label_07=>'TCS %'
,p_function_format_mask_07=>'999G999G999G999G990D00'
,p_function_sum_07=>'Y'
,p_function_08=>'SUM'
,p_function_column_08=>'TOTALAMOUNT'
,p_function_db_column_name_08=>'APXWS_GBFC_08'
,p_function_label_08=>'Total Amount'
,p_function_format_mask_08=>'999G999G999G999G990D00'
,p_function_sum_08=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(445917928736617226)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(578271541182137349)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(446956307682672241)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(578271541182137349)
,p_button_name=>'CUSTOM2'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/ccinvoiceregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P170_FROMDATE=&P170_FROMDATE.&P170_TODATE=&P170_TODATE.&P170_LOCATION=&P170_LOCATION.&P170_DOCTYPE=&P170_DOCTYPE.&P170_PARTY=&P170_PARTY.&P170_TRANSPORTER=&P170_TRANSPORTER.&P170_ITEM=&P170_ITEM.&P170_ITEMSPECIFICATION=&P170_ITEMSPECIFICATION.&P170_CCINO=&P170_CCINO.&P170_VEHICLENO=&P170_VEHICLENO.&P170_VSTATUS=&P170_VSTATUS.&P170_MISTATUS=&P170_MISTATUS.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(445917833014617225)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(578271541182137349)
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
 p_id=>wwv_flow_imp.id(446956710177672242)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(578271541182137349)
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
 p_id=>wwv_flow_imp.id(446957517250672246)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(446997244253767967)
,p_name=>'P170_BIREPORTURL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(57100728459729221)
,p_name=>'P170_CALLED_FROM_PAGE_NO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457677376416753825)
,p_name=>'P170_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''SALESORDER''',
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
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(457704614124904381)
,p_name=>'P170_DOCTYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_prompt=>'DocType'
,p_placeholder=>'Enter DocType Name'
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
'  and a.ModuleCode = ''SALESORDER''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_lov_cascade_parent_items=>'P170_COMPANY'
,p_ajax_items_to_submit=>'P170_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(457703014489904379)
,p_name=>'P170_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_item_default=>'Trunc(Sysdate) -3'
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
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(475211609165662087)
,p_name=>'P170_INVOICESTATUS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_prompt=>'Invoice Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PARTIAL;PARTIAL,PENDING;PENDING,DONE;DONE'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select Invoice Status-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457705792368904382)
,p_name=>'P170_ITEM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From SALESORDERDetail a, Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 2'))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(59616928826387138)
,p_name=>'P170_ITEMCATEGORY'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457706163243904382)
,p_name=>'P170_ITEMSPECIFICATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
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
'Where e.ItemCode = :P170_ITEM',
'  and e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P170_ITEM'
,p_ajax_items_to_submit=>'P170_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(457703751327904381)
,p_name=>'P170_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_prompt=>'Location'
,p_placeholder=>'Enter  Location Name'
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
'  and a.ModuleCode = ''SALESORDER''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P170_COMPANY'
,p_ajax_items_to_submit=>'P170_LOCATION'
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
 p_id=>wwv_flow_imp.id(457704230515904381)
,p_name=>'P170_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From SalesOrder a, Party p',
'Where a.PartyCode = p.PartyCode',
'Order by 1'))
,p_cSize=>75
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(457705361916904382)
,p_name=>'P170_SONO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_prompt=>'Order No'
,p_placeholder=>'Enter Sales Order No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select SalesOrderNo ',
'From SalesOrder ',
'Where instr('':''||:P170_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and SalesOrderDate Between :P170_FROMDATE and :P170_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P170_LOCATION'
,p_ajax_items_to_submit=>'P170_SONO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>28
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
 p_id=>wwv_flow_imp.id(475493745359359350)
,p_name=>'P170_STATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ACTIVE,Non-Active;NONACTIVE,Canceled;CANCELED,Closed;CLOSED,Preparing;PREPARING,Prepared;PREPARED,Authorised;AUTHORISED,On Hold;ONHOLD,Short Closed;SHORTCLOSED,Dept Approved;DEPTAPPROVED,Store Approval;STOREAPPROVED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Sales Order Status--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(448426193167282693)
,p_name=>'P170_TNO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(457703342983904381)
,p_name=>'P170_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_item_default=>'Trunc(Sysdate)'
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
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(473316318296010866)
,p_name=>'P170_TRADETYPE'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(587811906341276166)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_display_when_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(446962122018672252)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(446956710177672242)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(446962571169672254)
,p_event_id=>wwv_flow_imp.id(446962122018672252)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/SalesOrderRegister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1'
||'","_paramsP_COMPANY":"&P170_COMPANY.","_paramsP_LOCATION":"&P170_LOCATION.","_paramsP_FROMDATE":"&P170_FROMDATE.","_paramsP_TODATE":"&P170_TODATE.","_paramsP_PARTY":"&P170_PARTY.","_paramsP_DOCTYPE":"&P170_DOCTYPE.","_paramsP_SONO":"&P170_SONO.","_pa'
||'ramsP_ITEM":"&P170_ITEM.","_paramsP_ITEMSPECIFICATION":"&P170_ITEMSPECIFICATION."}'');',
    '  */',
    '  generatePDF_new();                                                                                 ')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(461544700734383486)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(461544817821383487)
,p_event_id=>wwv_flow_imp.id(461544700734383486)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(191022561839237940)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(191022965386237941)
,p_event_id=>wwv_flow_imp.id(191022561839237940)
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
 p_id=>wwv_flow_imp.id(448072683365731894)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(446957517250672246)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(448072806023731895)
,p_event_id=>wwv_flow_imp.id(448072683365731894)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(578271541182137349)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(446961705521672251)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P170_CCINO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P170_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P170_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;',
''))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>7976836321974267
);
wwv_flow_imp.component_end;
end;
/
