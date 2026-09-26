prompt --application/pages/page_00117
begin
--   Manifest
--     PAGE: 00117
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
 p_id=>117
,p_name=>'Purchase Order List'
,p_alias=>'PURCHASE-ORDER-LIST'
,p_step_title=>'Purchase Order List'
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
'  var bireporturl = $(''#P117_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/poregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P117_FROMDATE'').val());',
'  var toDate = new Date($(''#P117_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P117_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P117_COMPANY'').val() ==="" || $(''#P117_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P117_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P117_COMPANY'').val();',
'       global_companycode= $(''#P117_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +  ',
'      ''&P_STATUS='' +$(''#P117_STATUS'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P117_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P117_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P117_LOCATION'').val() +',
'      ''&P_PARTYNAME='' +$(''#P117_PARTYNAME'').val() +',
'      ''&P_DOCTYPE='' +$(''#P117_DOCTYPE'').val() +',
'      ''&P_ITEM='' +$(''#P117_ITEM'').val() +',
'      ''&P_GRNSTATUS='' +$(''#P117_GRNSTATUS'').val() +',
'      ''&P_ITEMSPECIFICATION='' +$(''#P117_ITEMSPECIFICATION'').val() +',
'      ''&P_PONO='' +$(''#P117_PONO'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode;',
'     ',
'       ',
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
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P117_BIREPORTURL'').val()',
'  var reportName =  ''poregister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P117_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P117_COMPANY'').val() ==="" || $(''#P117_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P117_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P117_COMPANY'').val();',
'       global_companycode= $(''#P117_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P118_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'     ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'      ''"_paramsP_STATUS":"'' +$(''#P117_STATUS'').val() + ''",'' +    ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P117_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P117_TODATE'').val() + ''",'' + ',
'      ''"_paramsP_LOCATION":"'' + $(''#P117_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_PARTYNAME":"'' +$(''#P117_PARTYNAME'').val() + ''",'' + ',
'      ''"_paramsP_DOCTYPE":"'' +$(''#P117_DOCTYPE'').val() + ''",'' + ',
'      ''"_paramsP_ITEM":"'' +$(''#P117_ITEM'').val() + ''",'' + ',
'      ''"_paramsP_GRNSTATUS":"'' +$(''#P117_GRNSTATUS'').val() + ''",'' + ',
'      ''"_paramsP_ITEMSPECIFICATION":"'' +$(''#P117_ITEMSPECIFICATION'').val() + ''",'' + ',
'      ''"_paramsP_PONO":"'' +$(''#P117_PONO'').val() + ''",'' + ',
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
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#APP_FILES#mycss/MyIR (2)#MIN#.css',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(944885759588366790)
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
 p_id=>wwv_flow_imp.id(944894414656371253)
,p_plug_name=>'Purchase Order Report'
,p_static_id=>'purchase-order-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      row_number() over(order by xxx.PurchaseOrderDate) SerialNo,',
'      xxx.TNo,',
'      xxx.SNo,',
'      xxx.LocationName,',
'      xxx.DocTypeName,',
'      xxx.PurchaseOrderNo,',
'      xxx.PurchaseOrderDate,',
'      xxx.PartyName,',
'      xxx.DeliveryDate,',
'      xxx.ItemCode,',
'      xxx.MaterialDetail,',
'      xxx.UOM,',
'      round(xxx.Quantity1,3) as Quantity1,',
'      xxx.UOM2,',
'      round(xxx.Quantity2,3) as Quantity2,',
'      xxx.AgentName,',
'      xxx.Rate,',
'      round(xxx.Amount,2) as Amount,',
'      xxx.CGST,',
'      xxx.SGST,',
'      xxx.IGST,',
'      xxx.TCS,',
'      round(xxx.FooterAmount,2) as FooterAmount,',
'      round((xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)),2) as OtherAmount,',
'      round(xxx.TotalAmount,2) as TotalAmount,',
'      round(xxx.GRNReceivedQty,3) as GRNReceivedQty,',
'      round(xxx.GRNReceivedQty2,3) as GRNReceivedQty2,',
'      round(xxx.WBAcceptedWeight,3) as WBAcceptedWeight,',
'      round(xxx.WBNetWeight,3) as WBNetWeight,',
'      round(xxx.balanceQty,3) as BalanceQty,',
'      xxx.DocumentStatusCode,',
'      xxx.DocStatus,',
'      xxx.FreightTypeCode,',
'      xxx.GRNStatus,',
'     -- xxx.POStatus,',
'      xxx.Creator,',
'      xxx.CreationTime,',
'      ''Attachment'' as Attachment,',
'      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||xxx.TNO||'',''||''PurchaseOrder''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title="A'
||'ction"></span</span></a>'' AS Print',
'From (',
'Select',
'      xx.TNo,',
'      xx.SNo,',
'      xx.LocationName,',
'      xx.DocTypeName,',
'      xx.PurchaseOrderNo,',
'      xx.PurchaseOrderDate,',
'      xx.PartyName,',
'      xx.DeliveryDate,',
'      xx.ItemCode,',
'      xx.MaterialDetail,',
'      xx.UOM,',
'      xx.Quantity1,',
'      xx.UOM2,',
'      xx.Quantity2,',
'      xx.AgentName,',
'      xx.Rate,',
'      xx.Amount,',
'      sum(xx.CGST)CGST,',
'      sum(xx.SGST)SGST,',
'      sum(xx.IGST)IGST,',
'      sum(xx.TCS)TCS,',
'      xx.FooterAmount,',
'      xx.TotalAmount,',
'      xx.GRNReceivedQty,',
'      xx.GRNReceivedQty2,',
'      xx.WBAcceptedWeight,',
'      xx.WBNetWeight,',
'      xx.balanceQty,',
'      xx.DocumentStatusCode,',
'      xx.DocStatus,',
'      xx.FreightTypeCode,',
'      xx.GRNStatus,',
'     -- xx.POStatus,',
'      xx.Creator,',
'      xx.CreationTime',
'From (',
'Select',
'      a.TNo,',
'      b.SNo,',
'      l.LocationName,',
'      d.DocTypeName,',
'      a.PurchaseOrderNo,',
'      a.PurchaseOrderDate,',
'      p.PartyCode,',
'      p.PartyName,',
'      a.DeliveryDate,',
'      e.ItemCode,',
'      e.ItemName,',
'      ee.ItemSpecificationName,',
'      e.ItemName||'' ( ''||ee.ItemSpecificationName||'' )'' as MaterialDetail,',
'      mu.MeasuringUnitName as UOM,',
'      b.Quantity1,',
'      e.MeasuringUnitCode2 as UOM2,',
'      b.Quantity2,',
'      GetPartyName(a.AgentCode) AgentName,',
'      B.Rate,',
'      b.Amount,',
'      Nvl(Decode(c.FooterHeadCode,''.CGST.'',c.FooterValue),0) as CGST,',
'      Nvl(Decode(c.FooterHeadCode,''.SGST.'',c.FooterValue),0) as SGST,',
'      Nvl(Decode(c.FooterHeadCode,''.IGST.'',c.FooterValue),0) as IGST,',
'      Nvl(Decode(c.FooterHeadCode,''.TCS.'',c.FooterValue),0) as TCS,',
'      b.FooterAmount,',
'      b.TotalAmount,',
'      g.GRNReceivedQuantity1 as GRNReceivedQty,',
'      g.GRNReceivedQuantity2 as GRNReceivedQty2,',
'      g.WBAcceptedWeight as WBAcceptedWeight,',
'      g.WBNetWeight as WBNetWeight,',
'      b.Quantity1 - g.GRNReceivedQuantity1 as balanceQty,',
'      dsd.DocumentStatusCode,',
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
'      ft.FreightTypeName as FreightTypeCode,',
'      Case --When g.GRNReceivedQuantity1 >= b.quantity1 - (b.quantity1 * b.lowertolerancepercent) / 100 Then ''DONE''--  g.GRNReceivedQuantity1 Then ''DONE''',
'           When g.GRNReceivedQuantity1 >= b.quantity1  Then ''DONE''',
'           When b.Quantity1 > g.GRNReceivedQuantity1 Then ''PARTIAL''',
'	       --When g.GRNReceivedQuantity1 is null or  b.Quantity1 > g.GRNReceivedQuantity1 Then ''PENDING''',
'           When g.GRNReceivedQuantity1 is null  Then ''PENDING''',
'      End as GRNStatus,',
'     -- nvl(decode(poc.PurchaseOrderTno,a.TNo,''SHORT-CLOSE''),''OPEN'') as POStatus,',
'      ''Attachment'' as Attachment,',
'      ''Details'' as Property,',
'      ''PURCHASEORDER'' as Module,',
'      bue.EmployeeName||''( ''||a.Creator||'' )'' as Creator,',
'      a.CreationTime',
'From  PurchaseOrder a, PurchaseOrderDetail b, PurchaseOrderDetailFooter c, Location l, DocType d, Party p,  Item e, ItemSpecification ee, MeasuringUnit mu, BossUser bu, Employee bue,',
'      (Select',
'            b.ItemCode,',
'            b.ItemSpecificationCode,',
'            a.PurchaseOrderTNo,',
'            sum(b.ReceivedQuantity1) as GRNReceivedQuantity1,',
'            sum(b.ReceivedQuantity2) as GRNReceivedQuantity2,',
'            sum(w.AcceptedWeight) as WBAcceptedWeight,',
'            sum(w.NetWeight) as WBNetWeight',
'      From  GRN a, GRNDetail b, Weighment w',
'      Where a.TNo = b.TNo',
'        and a.PurchaseOrderTNo is not null',
'        and a.WeighmentTNo = w.TNo(+)',
'      Group By b.ItemCode,',
'            b.ItemSpecificationCode,',
'            a.PurchaseOrderTNo',
'      ) g, DocumentStatusDetail dsd, --PurchaseOrderClose poc, ',
'      FreightType ft',
'Where a.TNo = b.TNo(+)',
'  and b.TNo = c.TNo(+)',
'  and b.SNo = c.SNo(+)',
'  and a.LocationCode = l.LocationCode(+)',
'  and a.DocTypeCode = d.DocTypeCode(+)',
'  and a.PartyCode = p.PartyCode(+)',
'  and e.TNo = ee.TNo',
'  and b.ItemCode = e.ItemCode(+)',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'  and e.MeasuringUnitCode1 = mu.MeasuringUnitCode(+)',
'  and nvl(e.ItemClassificationCode,''MATERIAL'') = ''MATERIAL''',
'  and b.TNo = g.PurchaseOrderTNo(+)',
'  and b.ItemCode = g.ItemCode(+)',
'  and b.ItemSpecificationCode = g.ItemSpecificationCode(+)',
'  and a.TNo = dsd.ModuleTno(+)',
'  --and a.TNo = poc.PurchaseOrderTNo(+)',
'  and a.Creator = bu.LoginName(+)',
'  and bu.EmployeeCode = bue.EmployeeCode(+)	',
'  and a.FreightTypeCode = ft.FreightTypeCode(+)',
'  and (:P117_TODOLIST = ''YES'' OR :P117_NEXTPROCESS = ''YES'' OR (a.PurchaseOrderDate between :P117_FROMDATE and :P117_TODATE))',
'  and (:P117_TODOLIST = ''YES'' OR :P117_NEXTPROCESS = ''YES'' OR :P117_COMPANY is null or (instr('':''||:P117_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0))',
'  and (:P117_TODOLIST = ''YES'' OR :P117_NEXTPROCESS = ''YES'' OR :P117_LOCATION is null or (instr('':''||:P117_LOCATION||'':'','':''||a.LocationCode||'':'') > 0))',
'  and (:P117_TODOLIST = ''YES'' OR :P117_NEXTPROCESS = ''YES'' OR :P117_DOCTYPE is null or (instr('':''||:P117_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0))',
'  and ( :P117_PARTYNAME IS NULL OR instr('':''||:P117_PARTYNAME||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P117_ITEM IS NULL OR instr('':''||:P117_ITEM||'':'','':''||e.ItemCode||'':'') > 0 ) ',
'  and ( :P117_ITEMSPECIFICATION IS NULL OR instr('':''||:P117_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'-- added on 20-may-2024 Previleage',
' and getlocationprivilege(a.locationcode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
' AND getdoctypeprivilege(a.doctypecode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
' and getcompanyprivilege(A.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
' -- and nvl(decode(poc.PurchaseOrderTno,a.TNo,''SHORT-CLOSE''),''OPEN'') like nvl(:P117_POSTATUS,''%'')',
' /*Case When g.GRNReceivedQuantity1 >= b.quantity1 - (b.quantity1 * b.lowertolerancepercent) / 100 Then ''DONE''--  g.GRNReceivedQuantity1 Then ''DONE''',
'           --When b.Quantity1 > g.GRNReceivedQuantity1 Then ''PARTIAL''',
'	       When g.GRNReceivedQuantity1 is null or  b.Quantity1 > g.GRNReceivedQuantity1 Then ''PENDING''',
'      End like nvl(:P117_GRNSTATUS,''%'')',
'*/',
'/*  and Case When b.Quantity1 <= g.GRNReceivedQuantity1 Then ''DONE''',
'           When b.Quantity1 > g.GRNReceivedQuantity1 Then ''PARTIAL''',
'	       When g.GRNReceivedQuantity1 is null Then ''PENDING''',
'      End like nvl(:P117_GRNSTATUS,''%'')',
'*/',
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
'      End  like nvl(:P117_STATUS,''%'')',
'  and a.PurchaseOrderNo like nvl(:P117_PONO,''%'')',
'  order by a.purchaseorderdate desc , a.purchaseorderno desc',
'  )xx',
'  --where xx.GRNSTATUS like nvl(:P117_GRNSTATUS,''%'')',
'  where ( :P117_GRNSTATUS IS NULL OR instr('':''||:P117_GRNSTATUS||'':'','':''||xx.GRNSTATUS||'':'') > 0 )',
'Group By ',
'        xx.TNo,',
'      xx.SNo,',
'      xx.LocationName,',
'      xx.DocTypeName,',
'      xx.PurchaseOrderNo,',
'      xx.PurchaseOrderDate,',
'      xx.PartyName,',
'      xx.DeliveryDate,',
'      xx.ItemCode,',
'      xx.MaterialDetail,',
'      xx.UOM,',
'      xx.Quantity1,',
'      xx.UOM2,',
'      xx.Quantity2,',
'      xx.AgentName,',
'      xx.Rate,',
'      xx.Amount,',
'      xx.FooterAmount,',
'      xx.TotalAmount,',
'      xx.GRNReceivedQty,',
'      xx.GRNReceivedQty2,',
'      xx.WBAcceptedWeight,',
'      xx.WBNetWeight,',
'      xx.balanceQty,',
'      xx.DocumentStatusCode,',
'      xx.DocStatus,',
'      xx.FreightTypeCode,',
'      xx.GRNStatus,',
'     -- xx.POStatus,',
'      xx.Creator,',
'      xx.CreationTime',
')xxx',
'where (:P117_TODOLIST=''NO'' OR  (:P117_TODOLIST=''YES'' AND EXISTS ( SELECT 1 FROM ONTHETABLE_APEX YY WHERE YY.TNO=XXX.TNO) ))',
'AND ( :P117_NEXTPROCESS=''NO'' OR (:P117_NEXTPROCESS = ''YES'' AND (  getdocumentstatuscode(''PURCHASEORDER'',XXX.TNO)=''ACTIVE''',
'                                    AND  NOT EXISTS (Select 1 From MaterialIn AA Where AA.Purchaseordertno = XXX.TNO)',
'                                ))',
'',
' )',
' '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Purchase Order Report'
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
 p_id=>wwv_flow_imp.id(980031260131412453)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_save_rpt_public=>'Y'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:118:&SESSION.::&DEBUG.::P118_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>539644914880485929
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936123951297035618)
,p_db_column_name=>'AGENTNAME'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'AGENT NAME'
,p_column_html_expression=>'<div style="display:block; width:150px">#AGENTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935340987512166850)
,p_db_column_name=>'AMOUNT'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:60px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935348653293166853)
,p_db_column_name=>'ATTACHMENT'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'ATTACHMENT'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935345375193166852)
,p_db_column_name=>'BALANCEQTY'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'BALANCE QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#BALANCEQTY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935341400961166850)
,p_db_column_name=>'CGST'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'CGST'
,p_column_html_expression=>'<div style="display:block; width:60px">#CGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935348168071166853)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'CREATION TIME'
,p_column_html_expression=>'<div style="display:block; width:140px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935347819050166853)
,p_db_column_name=>'CREATOR'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'CREATOR'
,p_column_html_expression=>'<div style="display:block; width:120px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935338652134166849)
,p_db_column_name=>'DELIVERYDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'DELIVERY DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#DELIVERYDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935346221548166852)
,p_db_column_name=>'DOCSTATUS'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'DOC STATUS'
,p_column_html_expression=>'<div style="display:block; width:60px">#DOCSTATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935337038173166848)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'DOCTYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935345813963166852)
,p_db_column_name=>'DOCUMENTSTATUSCODE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'DOCUMENT STATUS CODE'
,p_column_html_expression=>'<div style="display:block; width:60px">#DOCUMENTSTATUSCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935343031043166851)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'FOOTER AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:60px">#FOOTERAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935346630113166852)
,p_db_column_name=>'FREIGHTTYPECODE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'FREIGHT TYPE'
,p_column_html_expression=>'<div style="display:block; width:60px">#FREIGHTTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935344178184166851)
,p_db_column_name=>'GRNRECEIVEDQTY'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'GRN RECEIVED P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#GRNRECEIVEDQTY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936124008969035619)
,p_db_column_name=>'GRNRECEIVEDQTY2'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'GRN RECEIVED S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#GRNRECEIVEDQTY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935347059682166853)
,p_db_column_name=>'GRNSTATUS'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'GRN STATUS'
,p_column_html_expression=>'<div style="display:block; width:60px">#GRNSTATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935342220983166850)
,p_db_column_name=>'IGST'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'IGST'
,p_column_html_expression=>'<div style="display:block; width:60px">#IGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935339000554166849)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935336639202166847)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935339446839166849)
,p_db_column_name=>'MATERIALDETAIL'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:300px">#MATERIALDETAIL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935343388208166851)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'OTHER AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:60px">#OTHERAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935338229948166848)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(301339309731538476)
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
 p_id=>wwv_flow_imp.id(935337856857166848)
,p_db_column_name=>'PURCHASEORDERDATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'PURCHASE ORDER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PURCHASEORDERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935337396502166848)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'PURCHASE ORDER NO'
,p_column_html_expression=>'<div style="display:block; width:180px">#PURCHASEORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935340256772166849)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936123768253035617)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935340603270166850)
,p_db_column_name=>'RATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'RATE'
,p_column_html_expression=>'<div style="display:block; width:60px">#RATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(951515983814443513)
,p_db_column_name=>'SERIALNO'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Serialno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935341775956166850)
,p_db_column_name=>'SGST'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'SGST'
,p_column_html_expression=>'<div style="display:block; width:60px">#SGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935336241672166847)
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
 p_id=>wwv_flow_imp.id(935342598893166851)
,p_db_column_name=>'TCS'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'TCS'
,p_column_html_expression=>'<div style="display:block; width:60px">#TCS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935335821268166846)
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
 p_id=>wwv_flow_imp.id(935343774953166851)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'TOTAL AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:60px">#TOTALAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935339845702166849)
,p_db_column_name=>'UOM'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(936123664940035616)
,p_db_column_name=>'UOM2'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935344571522166851)
,p_db_column_name=>'WBACCEPTEDWEIGHT'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'WB ACCEPTED WEIGHT'
,p_column_html_expression=>'<div style="display:block; width:60px">#WBACCEPTEDWEIGHT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(935345000219166852)
,p_db_column_name=>'WBNETWEIGHT'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'WB NET WEIGHT'
,p_column_html_expression=>'<div style="display:block; width:60px">#WBNETWEIGHT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(44541716412851706)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'GROUPBY'
,p_report_seq=>10
,p_report_type=>'GROUP_BY'
,p_report_alias=>'270748'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:DOCSTATUS:LOCATIONNAME:DOCTYPENAME:PURCHASEORDERDATE:PARTYNAME:PURCHASEORDERNO:DELIVERYDATE:AGENTNAME:ITEMCODE:MATERIALDETAIL:UOM:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:FREIGHTTYPECODE:GRNSTATUS:GRNRECEI'
||'VEDQTY:GRNRECEIVEDQTY2:BALANCEQTY:CREATOR:CREATIONTIME'
,p_sort_column_1=>'PURCHASEORDERDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'SERIALNO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:GRNRECEIVEDQTY:BALANCEQTY:GRNRECEIVEDQTY2:QUANTITY2'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_worksheet_group_by(
 p_id=>wwv_flow_imp.id(44542168916851707)
,p_report_id=>wwv_flow_imp.id(44541716412851706)
,p_group_by_columns=>'PURCHASEORDERDATE:PARTYNAME:PURCHASEORDERNO:ITEMCODE:MATERIALDETAIL:UOM:QUANTITY1:AMOUNT'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(935203210233255823)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'PO VS ACTUAL RECEIVED QUANTITY'
,p_report_seq=>10
,p_report_alias=>'36764'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DOCSTATUS:DOCTYPENAME:PURCHASEORDERDATE:PARTYNAME:PURCHASEORDERNO:DELIVERYDATE:ITEMCODE:MATERIALDETAIL:QUANTITY1:UOM:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:FREIGHTTYPECODE:GRNSTATUS:GRNRECEIVEDQTY:BALANCEQTY:CREATOR:CREATIONTIME'
,p_sort_column_1=>'PURCHASEORDERDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PARTYNAME'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:GRNRECEIVEDQTY:BALANCEQTY'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(980063075416551381)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'38221'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:DOCSTATUS:LOCATIONNAME:DOCTYPENAME:PURCHASEORDERDATE:PARTYNAME:PURCHASEORDERNO:DELIVERYDATE:AGENTNAME:ITEMCODE:MATERIALDETAIL:UOM:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:FREIGHTTYPECODE:GRNSTATUS:GRNRECEI'
||'VEDQTY:GRNRECEIVEDQTY2:BALANCEQTY:CREATOR:CREATIONTIME'
,p_sort_column_1=>'PURCHASEORDERDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'SERIALNO'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'PARTYNAME'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:GRNRECEIVEDQTY:BALANCEQTY:GRNRECEIVEDQTY2:QUANTITY2'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(980074870854606855)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Last Purchase Rate'
,p_report_seq=>10
,p_report_alias=>'38225'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PURCHASEORDERDATE:PURCHASEORDERNO:PARTYNAME:ITEMCODE:MATERIALDETAIL:RATE:GRNSTATUS'
,p_sort_column_1=>'PURCHASEORDERDATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PARTYNAME'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:GRNRECEIVEDQTY:BALANCEQTY'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(586449346269723149)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(944894414656371253)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:118:&SESSION.::&DEBUG.:118::'
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
 p_id=>wwv_flow_imp.id(586449320404723148)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(944894414656371253)
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
 p_id=>wwv_flow_imp.id(604158852762542140)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(944894414656371253)
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
 p_id=>wwv_flow_imp.id(604140148408537596)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(944885759588366790)
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
 p_id=>wwv_flow_imp.id(446822102076280641)
,p_name=>'P117_BIREPORTURL'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(935232983690785564)
,p_name=>'P117_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_placeholder=>'Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
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
 p_id=>wwv_flow_imp.id(935233104985785565)
,p_name=>'P117_DOCTYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
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
'  and a.ModuleCode = ''PURCHASEORDER''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and instr('':''||:P117_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order by 1',
';',
''))
,p_lov_cascade_parent_items=>'P117_COMPANY'
,p_ajax_items_to_submit=>'P117_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(935327195941162403)
,p_name=>'P117_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
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
 p_id=>wwv_flow_imp.id(935329584826162404)
,p_name=>'P117_GRNSTATUS'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_prompt=>'GRN Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PENDING;PENDING,DONE;DONE,PARTIAL;PARTIAL'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select GRN Status-'
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
 p_id=>wwv_flow_imp.id(935329189033162404)
,p_name=>'P117_ITEM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||''( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From PurchaseOrderDetail a,Item e',
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
 p_id=>wwv_flow_imp.id(935330035088162404)
,p_name=>'P117_ITEMSPECIFICATION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P117_ITEM',
'  and e.TNo = ee.TNO'))
,p_lov_cascade_parent_items=>'P117_ITEM'
,p_ajax_items_to_submit=>'P117_ITEMSPECIFICATION'
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
 p_id=>wwv_flow_imp.id(935328868906162404)
,p_name=>'P117_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
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
'  and instr('':''||:P117_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P117_COMPANY'
,p_ajax_items_to_submit=>'P117_LOCATION'
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
 p_id=>wwv_flow_imp.id(955485722509540981)
,p_name=>'P117_NEXTPROCESS'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(935328465450162404)
,p_name=>'P117_PARTYNAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From PurchaseOrder a, Party p',
'Where a.PartyCode = p.PartyCode',
'Order by 1'))
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
 p_id=>wwv_flow_imp.id(935330394595162404)
,p_name=>'P117_PONO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_prompt=>'PoNo'
,p_placeholder=>'Enter Purchase Order No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select PurchaseOrderNo From PurchaseOrder ',
'Where instr('':''||:P117_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and PurchaseOrderDate Between :P117_FROMDATE and :P117_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P117_LOCATION'
,p_ajax_items_to_submit=>'P117_PONO'
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
 p_id=>wwv_flow_imp.id(935328065813162403)
,p_name=>'P117_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ACTIVE,Non-Active;NONACTIVE,Canceled;CANCELED,Closed;CLOSED,Preparing;PREPARING,Prepared;PREPARED,Authorised;AUTHORISED,On Hold;ONHOLD,Short Closed;SHORTCLOSED,Dept Approved;DEPTAPPROVED,Store Approval;STOREAPPROVED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Status--'
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
 p_id=>wwv_flow_imp.id(447055782998861599)
,p_name=>'P117_TNO'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(935327613134162403)
,p_name=>'P117_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
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
 p_id=>wwv_flow_imp.id(955485409896539317)
,p_name=>'P117_TODOLIST'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(944885759588366790)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(446790306369221287)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(604158852762542140)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(446790418473221288)
,p_event_id=>wwv_flow_imp.id(446790306369221287)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(445914584271617193)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(445914763580617194)
,p_event_id=>wwv_flow_imp.id(445914584271617193)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(603656383786893034)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(603656481918893035)
,p_event_id=>wwv_flow_imp.id(603656383786893034)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp.component_end;
end;
/
