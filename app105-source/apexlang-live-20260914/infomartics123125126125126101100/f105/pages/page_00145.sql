prompt --application/pages/page_00145
begin
--   Manifest
--     PAGE: 00145
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
 p_id=>145
,p_name=>'GRN Register'
,p_alias=>'GRN-REGISTER'
,p_step_title=>'GRN Register'
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
'  var bireporturl = $(''#P145_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/grnregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P145_FROMDATE'').val());',
'  var toDate = new Date($(''#P145_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P145_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P145_COMPANY'').val() ==="" || $(''#P145_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P145_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P145_COMPANY'').val();',
'       global_companycode= $(''#P145_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode + ',
'      ''&P_STATUS='' +$(''#P145_STATUS'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P145_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P145_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P145_LOCATION'').val() +',
'      ''&P_ITEMTYPE='' +$(''#P145_ITEMTYPE'').val() +',
'      ''&P_DOCTYPE='' +$(''#P145_DOCTYPE'').val() +',
'      ''&P_ITEM='' +$(''#P145_ITEM'').val() +',
'      ''&P_INSPECTIONSTATUS='' +$(''#P145_INSPECTIONSTATUS'').val() +',
'      ''&P_SPECIFICATION='' +$(''#P145_SPECIFICATION'').val() +',
'      ''&P_GRNNO='' +$(''#P145_GRNNO'').val() +',
'      ''&P_PARTY='' +$(''#P145_PARTY'').val() +',
'      ''&P_CREATOR='' +$(''#P145_CREATOR'').val() +',
'      ''&P_TRANSPORTER='' +$(''#P145_TRANSPORTER'').val() +',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P145_BIREPORTURL'').val()',
'  var reportName =  ''grnregister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P145_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P145_COMPANY'').val() ==="" || $(''#P145_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P145_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P145_COMPANY'').val();',
'       global_companycode= $(''#P145_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P145_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_STATUS":"'' +$(''#P145_STATUS'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P145_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P145_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P145_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_ITEMTYPE":"'' +$(''#P145_ITEMTYPE'').val() + ''",'' + 	',
'      ''"_paramsP_DOCTYPE":"'' +$(''#P145_DOCTYPE'').val() + ''",'' + ',
'      ''"_paramsP_ITEM":"'' +$(''#P145_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_INSPECTIONSTATUS":"'' +$(''#P145_INSPECTIONSTATUS'').val() + ''",'' +	  ',
'      ''"_paramsP_SPECIFICATION":"'' +$(''#P145_SPECIFICATION'').val() + ''",'' +	  ',
'	  ''"_paramsP_GRNNO":"'' +$(''#P145_GRNNO'').val() + ''",'' + ',
'      ''"_paramsP_PARTY":"'' +$(''#P145_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_CREATOR":"'' +$(''#P145_CREATOR'').val() + ''",'' + ',
'	  ''"_paramsP_TRANSPORTER":"'' +$(''#P145_TRANSPORTER'').val() + ''",'' +',
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
 p_id=>wwv_flow_imp.id(459778363635701838)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'BELOW'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(459778434951701839)
,p_plug_name=>'GRN Report'
,p_static_id=>'grn-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'    a.TNo,',
'    b.SNo,',
'    l.LocationName,',
'    d.DocTypeName,',
'    a.GRNNo,',
'    a.GRNDate,',
'    p.PartyName,',
'    a.RefDocNo as PartyInvoiceNo,',
'    a.RefDocDate as PartyInvoiceDate,',
'    a.RefDocAmount as PartyInvoiceAmount,',
'    mi.MaterialInNo,',
'    mi.MaterialInDate,',
'    la.LoadingAdviceNo,',
'    la.LoadingAdviceDate,',
'    ''PurchaseOrder'' as Reference,',
'    po.TNo as ReferenceTNO,',
'    po.PurchaseOrderNo as ReferenceNo,',
'    po.PurchaseOrderDate as ReferenceDate,',
'    w.TNo as WeighmentTNo,',
'    w.WeighmentNo,',
'    w.WeighmentDate,',
'    W.Netweight,',
'    ROUND(nvl(b.acceptedquantity1,w.acceptedweight),3) as AcceptedWeight,    ',
'    t.PartyName as Transporter,',
'    a.VehicleNo,',
'    a.LRNO,',
'    a.LRDATE,',
'    e.ItemCode,',
'    e.ItemName||'' ~ ''||ee.ItemSpecificationName as Material,',
'    b.Description,',
'    e.MeasuringUnitCode1 as UOM,',
'    ROUND(b.ChalanQuantity1,3) AS ChalanQuantity1,',
'    ROUND(b.ReceivedQuantity1,3) AS ReceivedQuantity1,',
'    e.MeasuringUnitCode2 as UOM2,',
'    ROUND(b.ChalanQuantity2,3) AS ChalanQuantity2,',
'    ROUND(b.ReceivedQuantity2,3) AS ReceivedQuantity2,',
'    ROUND((ReceivedQuantity1- b.ChalanQuantity1),3) as Difference,',
'    ROUND((ReceivedQuantity2- b.ChalanQuantity2),3) as Difference2,',
'    Case When b.ChalanQuantity1 > b.ReceivedQuantity1 Then ''Shortage'' ',
'         When b.ChalanQuantity1 < b.ReceivedQuantity1 Then ''Excess''',
'         When b.ChalanQuantity1 = b.ReceivedQuantity1 Then ''Equal''',
'    End As ShortageExcess,',
' ',
'    dsd.DocumentStatusCode,',
'    b.WarrantyUpTo,',
'  --  ''Details'' as SerialNo,',
'    case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
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
'      b.Rate,',
'      b.Amount,',
'      GetDepartmentName(ii.DepartmentCode) as Department,',
'      GetEmployeeName(bu.EmployeeCode)||''(''||a.Creator||'')'' as Creator,',
'      a.CreationTime,',
'      GETDINSPECTIONNO(a.TNO) as DINSPECTIONNO,',
'      GETDINSPECTIONDATE(a.TNO) as DINSPECTIONDATE,',
'      b.ACCEPTEDQUANTITY1 as PAcceptedQty,',
'      b.ACCEPTEDQUANTITY2 as SAcceptedQty,',
'      decode(GETDINSPECTIONNO(a.TNO),null,''PENDING'' , ''PREPARED'') as DStatus,',
'      ft.FreighttypeName,',
'      nvl(a.FreightRate,0) * nvl(b.ReceivedQuantity1,0) as FreightAmount,',
'            ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.Tno||'',''||''GRN''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" title="Action"'
||'></span</span></a>'' AS Print',
'From GRN a, GRNDetail b, Location l, DocType d, Party p, MaterialIn mi, Weighment w, PurchaseOrder po, Party t, DocumentStatusDetail dsd,',
'    Item e, ItemSpecification ee,LoadingAdvice la, -- StorageLocation sl, Inspection i, ',
'    DInspectionDetail did, indent ii, BossUser bu, Freighttype ft',
'Where a.TNo = b.TNo(+)',
'  and a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = d.DocTypeCode',
'  --and a.DocTypeCode = ''PURCHASE''',
'  and a.PartyCode = p.PartyCode',
'  and a.MaterialINTNo = mi.TNo(+)',
'  and a.LoadingAdviceTno = la.tno(+)',
'  and a.PurchaseOrderTNo = po.TNo(+)',
'  and a.WeighmentTNo = w.TNo(+)',
'  and a.TransporterCode = t.PartyCode(+)',
'  and a.TNo = dsd.ModuleTNo(+)',
'  and e.TNo = ee.TNo(+)',
'  and b.ItemCode = e.ItemCode(+)',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'  --and b.StorageLocationCode = sl.StorageLocationCode(+)',
'  --and a.TNo = i.GRNTNo(+)',
'  and b.TNo = did.GRNTNo(+)',
'  and b.ItemCode = did.ItemCode(+)',
'  and b.ItemSpecificationCode = did.ItemSpecificationCode(+)',
'  and did.IndentTNo = ii.TNo(+)',
'  and a.Creator = bu.LoginName(+)',
'  and a.FreighttypeCode = ft.FreighttypeCode(+)',
'  and getlocationprivilege(a.locationcode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
' AND getdoctypeprivilege(a.doctypecode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
' and getcompanyprivilege(A.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'  and a.GRNDate Between :P145_FROMDATE and :P145_TODATE',
'  --and instr('':''||:P145_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and ( :P145_COMPANY IS NULL OR instr('':''||:P145_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'  --and instr('':''||:P145_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and ( :P145_LOCATION IS NULL OR instr('':''||:P145_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'  --and instr('':''||:P145_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0',
'  and ( :P145_DOCTYPE IS NULL OR instr('':''||:P145_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0 )',
'  --and nvl(decode(I.GRNTno,a.TNo,''PREPARED''),''PENDING'') like nvl(:P145_INSPECTIONSTATUS,''%'')',
'  and ( :P145_PARTY IS NULL OR instr('':''||:P145_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'  and ( :P145_TRANSPORTER IS NULL OR instr('':''||:P145_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 )',
'  and ( :P145_ITEM IS NULL OR instr('':''||:P145_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'  and ( :P145_SPECIFICATION IS NULL OR instr('':''||:P145_SPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'  and ( :P145_ITEMTYPE IS NULL OR instr('':''||:P145_ITEMTYPE||'':'','':''||e.itemtype||'':'') > 0 )',
'--   and ( :P145_DINSPECTIONSTATUS IS NULL OR instr('':''||:P145_DINSPECTIONSTATUS||'':'','':''||decode(GETDINSPECTIONNO(a.TNO),null,''PENDING'' , ''PREPARED'')||'':'') > 0 )',
'  and a.GRNNo like nvl(:P145_GRNNO,''%'')',
'-- aDDED ON 28-MAY-2022',
'-- and ( :P145_ITEMGROUP IS NULL',
'--       or',
'--       exists (select 1 from (Select ITEMCODE,',
'--                parentcode,',
'--                RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'--                Level,',
'--                CONNECT_BY_ROOT itemcode As root_id,',
'--                ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'--                CONNECT_BY_ISLEAF As leaf',
'--           From item a',
'--          Start With parentcode in ( select itemcode from item xx where',
'--                                     instr('':''||:P145_ITEMGROUP||'':'','':''||xx.ItemCode||'':'') > 0)',
'                                    ',
'--         Connect By parentcode = Prior itemcode',
'--          Order Siblings By itemcode) x where x.itemcode = e.itemcode',
'--         )',
'--   )',
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
'      End like nvl(:P145_STATUS,''%'')',
'order by a.GRNNo desc, a.GRNDate desc',
'/*Union All',
'Select',
'    a.TNo,',
'    b.SNo,',
'    l.LocationName,',
'    d.DocTypeName,',
'    a.GRNNo,',
'    a.GRNDate,',
'    p.PartyName,',
'    a.RefDocNo as PartyInvoiceNo,',
'    a.RefDocDate as PartyInvoiceDate,',
'    a.RefDocAmount as PartyInvoiceAmount,',
'    mi.MaterialInNo,',
'    mi.MaterialInDate,',
'    ''CCInvoice'' as Reference,',
'    cc.TNo as ReferenceTNO,',
'    cc.CCInvoiceNo as ReferenceNo,',
'    cc.CCInvoiceDate as ReferenceDate,',
'    w.TNo as WeighmentTNo,',
'    w.WeighmentNo,',
'    w.WeighmentDate,',
'    W.Netweight,',
'    nvl(b.acceptedquantity1,w.AcceptedWeight) as AcceptedWeight,',
'    t.PartyName as Transporter,',
'    a.VehicleNo,',
'    a.LRNO,',
'    a.LRDATE,',
'    e.ItemCode,',
'    e.ItemName||'' ~ ''||ee.ItemSpecificationName as Material,',
'    b.Description,',
'    e.MeasuringUnitCode1 as UOM,',
'    b.ChalanQuantity1,',
'    b.ReceivedQuantity1,',
'    ReceivedQuantity1- b.ChalanQuantity1  as Difference,',
'    Case When b.ChalanQuantity1 > b.ReceivedQuantity1 Then ''Shortage'' ',
'         When b.ChalanQuantity1 < b.ReceivedQuantity1 Then ''Excess''',
'         When b.ChalanQuantity1 = b.ReceivedQuantity1 Then ''Equal''',
'    End As ShortageExcess,',
'    sl.StorageLocationName,',
'    nvl(decode(I.GRNTno,a.TNo,''PREPARED''),''PENDING'') as InspectionStatus,',
'    i.InspectionNo,',
'    i.InspectionDate,    ',
'    case When i.InspectionDate is not null Then null',
'         When i.InspectionDate is null Then (Sysdate - a.GrnDate)-1',
'    End as DaysPending,',
'    dsd.DocumentStatusCode,',
'    b.WarrantyUpTo,',
'    ''Details'' as SerialNo,',
'    case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
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
'      b.Rate,',
'      b.Amount,',
'      GetDepartmentName(di.DepartmentCode) as Department',
'From GRN a, GRNDetail b, Location l, DocType d, Party p, MaterialIn mi, Weighment w, CCInvoice cc, Party t, DocumentStatusDetail dsd,',
'    Item e, ItemSpecification ee, StorageLocation sl, Inspection i, Dinspection di',
'Where a.TNo = b.TNo',
'  and a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = d.DocTypeCode',
'  and a.DocTypeCode IN (''INTRAUNITTRANSFER'',''INTERUNITTRANSFER'')',
'  and a.PartyCode = p.PartyCode',
'  and a.MaterialINTNo = mi.TNo',
'  and a.InterUnitTransferCCInvoiceTNo = cc.TNo',
'  and a.WeighmentTNo = w.TNo(+)',
'  and a.TransporterCode = t.PartyCode(+)',
'  and a.TNo = dsd.ModuleTNo(+)',
'  and e.TNo = ee.TNo',
'  and b.ItemCode = e.ItemCode',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode',
'  and b.StorageLocationCode = sl.StorageLocationCode(+)',
'  and a.TNo = i.GRNTNo(+)',
'  and a.TNo = di.GRNTNo(+)',
'  and a.GRNDate Between :P145_FROMDATE and :P145_TODATE',
'  and instr('':''||:P145_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and instr('':''||:P145_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and instr('':''||:P145_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0',
'  and nvl(decode(I.GRNTno,a.TNo,''PREPARED''),''PENDING'') like nvl(:P145_INSPECTIONSTATUS,''%'')',
'  and ( :P145_PARTY IS NULL OR instr('':''||:P145_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'  and ( :P145_TRANSPORTER IS NULL OR instr('':''||:P145_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 )',
'  and ( :P145_ITEM IS NULL OR instr('':''||:P145_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'  and ( :P145_SPECIFICATION IS NULL OR instr('':''||:P145_SPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'  and ( :P145_ITEMGROUP IS NULL OR instr('':''||:P145_ITEMGROUP||'':'','':''||e.ParentCode||'':'') > 0 )',
'  and a.GRNNo like nvl(:P145_GRNNO,''%'')',
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
'      End like nvl(:P145_STATUS,''%'')',
'Union All',
'Select',
'    a.TNo,',
'    b.SNo,',
'    l.LocationName,',
'    d.DocTypeName,',
'    a.GRNNo,',
'    a.GRNDate,',
'    p.PartyName,',
'    a.RefDocNo as PartyInvoiceNo,',
'    a.RefDocDate as PartyInvoiceDate,',
'    a.RefDocAmount as PartyInvoiceAmount,',
'    mi.MaterialInNo,',
'    mi.MaterialInDate,',
'    ''EquipmentTransfer'' as Reference,',
'    etn.TNo as ReferenceTNO,',
'    etn.EquipmentTransferNoteNo as ReferenceNo,',
'    etn.EquipmentTransferNoteDate as ReferenceDate,',
'    w.TNo as WeighmentTNo,',
'    w.WeighmentNo,',
'    w.WeighmentDate,',
'    W.Netweight,',
'    nvl(b.acceptedquantity1,w.acceptedweight) as AcceptedWeight,',
'    t.PartyName as Transporter,',
'    a.VehicleNo,',
'    a.LRNO,',
'    a.LRDATE,',
'    e.ItemCode,',
'    e.ItemName||'' ~ ''||ee.ItemSpecificationName as Material,',
'    b.Description,',
'    e.MeasuringUnitCode1 as UOM,',
'    b.ChalanQuantity1,',
'    b.ReceivedQuantity1,',
'    ReceivedQuantity1- b.ChalanQuantity1  as Difference,',
'    Case When b.ChalanQuantity1 > b.ReceivedQuantity1 Then ''Shortage'' ',
'         When b.ChalanQuantity1 < b.ReceivedQuantity1 Then ''Excess''',
'         When b.ChalanQuantity1 = b.ReceivedQuantity1 Then ''Equal''',
'    End As ShortageExcess,',
'    sl.StorageLocationName,',
'    nvl(decode(I.GRNTno,a.TNo,''PREPARED''),''PENDING'') as InspectionStatus,',
'    i.InspectionNo,',
'    i.InspectionDate,    ',
'    case When i.InspectionDate is not null Then null',
'         When i.InspectionDate is null Then (Sysdate - a.GrnDate)-1 ',
'    End as DaysPending,',
'    dsd.DocumentStatusCode,',
'    b.WarrantyUpTo,',
'    ''Details'' as SerialNo,',
'    case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
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
'      b.Rate,',
'      b.Amount,',
'      GetDepartmentName(di.DepartmentCode) as Department',
'From GRN a, GRNDetail b, Location l, DocType d, Party p, MaterialIn mi, Weighment w, EquipmentTransferNote etn, Party t, DocumentStatusDetail dsd,',
'    Item e, ItemSpecification ee, StorageLocation sl, Inspection i, DInspection di',
'Where a.TNo = b.TNo',
'  and a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = d.DocTypeCode',
'  and a.DocTypeCode = ''EQUIPMENTTRANSFER''',
'  and a.PartyCode = p.PartyCode',
'  and a.MaterialINTNo = mi.TNo',
'  and mi.equipmenttransfernotetno = etn.TNo',
'  and a.WeighmentTNo = w.TNo(+)',
'  and a.TransporterCode = t.PartyCode(+)',
'  and a.TNo = dsd.ModuleTNo(+)',
'  and e.TNo = ee.TNo',
'  and b.ItemCode = e.ItemCode',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode',
'  and b.StorageLocationCode = sl.StorageLocationCode(+)',
'  and a.TNo = i.GRNTNo(+)',
'  and a.TNo = di.GRNTNo(+)',
'  and a.GRNDate Between :P145_FROMDATE and :P145_TODATE',
'  and instr('':''||:P145_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and instr('':''||:P145_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and instr('':''||:P145_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0',
'  and nvl(decode(I.GRNTno,a.TNo,''PREPARED''),''PENDING'') like nvl(:P145_INSPECTIONSTATUS,''%'')',
'  and ( :P145_PARTY IS NULL OR instr('':''||:P145_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'  and ( :P145_TRANSPORTER IS NULL OR instr('':''||:P145_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 )',
'  and ( :P145_ITEM IS NULL OR instr('':''||:P145_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'  and ( :P145_SPECIFICATION IS NULL OR instr('':''||:P145_SPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'  and ( :P145_ITEMGROUP IS NULL OR instr('':''||:P145_ITEMGROUP||'':'','':''||e.ParentCode||'':'') > 0 )',
'  and a.GRNNo like nvl(:P145_GRNNO,''%'')',
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
'      End like nvl(:P145_STATUS,''%'')',
'Union All',
'Select',
'    a.TNo,',
'    b.SNo,',
'    l.LocationName,',
'    d.DocTypeName,',
'    a.GRNNo,',
'    a.GRNDate,',
'    p.PartyName,',
'    a.RefDocNo as PartyInvoiceNo,',
'    a.RefDocDate as PartyInvoiceDate,',
'    a.RefDocAmount as PartyInvoiceAmount,',
'    mi.MaterialInNo,',
'    mi.MaterialInDate,',
'    ''Gatepass'' as Reference,',
'    gp.TNo as ReferenceTNO,',
'    gp.GatePassNo as ReferenceNo,',
'    gp.GatePassDate as ReferenceDate,',
'    w.TNo as WeighmentTNo,',
'    w.WeighmentNo,',
'    w.WeighmentDate,',
'    W.Netweight,',
'    nvl(b.acceptedquantity1,w.AcceptedWeight) as AcceptedWeight,',
'    t.PartyName as Transporter,',
'    a.VehicleNo,',
'    a.LRNO,',
'    a.LRDATE,',
'    e.ItemCode,',
'    e.ItemName||'' ~ ''||ee.ItemSpecificationName as Material,',
'    b.Description,',
'    e.MeasuringUnitCode1 as UOM,',
'    b.ChalanQuantity1,',
'    b.ReceivedQuantity1,',
'    e.MeasuringUnitCode1 as UOM2,',
'    b.ChalanQuantity2,',
'    b.ReceivedQuantity2,',
'    ReceivedQuantity1- b.ChalanQuantity1  as Difference,',
'    ReceivedQuantity2- b.ChalanQuantity2  as Difference2,',
'    Case When b.ChalanQuantity1 > b.ReceivedQuantity1 Then ''Shortage'' ',
'         When b.ChalanQuantity1 < b.ReceivedQuantity1 Then ''Excess''',
'         When b.ChalanQuantity1 = b.ReceivedQuantity1 Then ''Equal''',
'    End As ShortageExcess,',
'    sl.StorageLocationName,',
'    nvl(decode(I.GRNTno,a.TNo,''PREPARED''),''PENDING'') as InspectionStatus,',
'    i.InspectionNo,',
'    i.InspectionDate,    ',
'    case When i.InspectionDate is not null Then null',
'         When i.InspectionDate is null Then (Sysdate - a.GrnDate)-1',
'    End as DaysPending,',
'    dsd.DocumentStatusCode,',
'    b.WarrantyUpTo,',
'    ''Details'' as SerialNo,',
'    case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
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
'      b.Rate,',
'      b.Amount,',
'      GetDepartmentName(di.DepartmentCode) as Department,',
'      GetEmployeeName(bu.EmployeeCode)||''(''||a.Creator||'')'' as Creator,',
'      a.CreationTime',
'From GRN a, GRNDetail b, Location l, DocType d, Party p, MaterialIn mi, Weighment w, GatePass gp, Party t, DocumentStatusDetail dsd,',
'    Item e, ItemSpecification ee, StorageLocation sl, Inspection i, Dinspection di, Bossuser bu',
'Where a.TNo = b.TNo',
'  and a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = d.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.MaterialINTNo = mi.TNo',
'  and a.GatePassTNo = gp.TNo',
'  and a.WeighmentTNo = w.TNo(+)',
'  and a.TransporterCode = t.PartyCode(+)',
'  and a.TNo = dsd.ModuleTNo(+)',
'  and e.TNo = ee.TNo',
'  and b.ItemCode = e.ItemCode',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode',
'  and b.StorageLocationCode = sl.StorageLocationCode(+)',
'  and a.TNo = i.GRNTNo(+)',
'  and a.TNo = di.GRNTNo(+)',
'  and a.Creator = bu.LoginName(+)',
'  and a.GRNDate Between :P145_FROMDATE and :P145_TODATE',
'  and instr('':''||:P145_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'  and instr('':''||:P145_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and instr('':''||:P145_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0',
'  and nvl(decode(I.GRNTno,a.TNo,''PREPARED''),''PENDING'') like nvl(:P145_INSPECTIONSTATUS,''%'')',
'  and ( :P145_PARTY IS NULL OR instr('':''||:P145_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'  and ( :P145_TRANSPORTER IS NULL OR instr('':''||:P145_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 )',
'  and ( :P145_ITEM IS NULL OR instr('':''||:P145_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'  and ( :P145_SPECIFICATION IS NULL OR instr('':''||:P145_SPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'  and ( :P145_ITEMGROUP IS NULL OR instr('':''||:P145_ITEMGROUP||'':'','':''||e.ParentCode||'':'') > 0 )',
'  and a.GRNNo like nvl(:P145_GRNNO,''%'')',
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
'      End like nvl(:P145_STATUS,''%'')*/',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GRN Report'
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
 p_id=>wwv_flow_imp.id(470757280483253519)
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
,p_detail_link=>'f?p=&APP_ID.:146:&SESSION.::&DEBUG.::P146_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>39313901092258285
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450234461027497417)
,p_db_column_name=>'ACCEPTEDWEIGHT'
,p_display_order=>450
,p_column_identifier=>'AS'
,p_column_label=>'ACCEPTED WEIGHT'
,p_column_html_expression=>'<div style="display:block; width:80px">#ACCEPTEDWEIGHT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450585726308942984)
,p_db_column_name=>'AMOUNT'
,p_display_order=>470
,p_column_identifier=>'AU'
,p_column_label=>'AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450228876040497414)
,p_db_column_name=>'CHALANQUANTITY1'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'CHALAN P QTY'
,p_column_html_expression=>'<div style="display:block; width:100px">#CHALANQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450545232014240826)
,p_db_column_name=>'CHALANQUANTITY2'
,p_display_order=>500
,p_column_identifier=>'AX'
,p_column_label=>'CHALAN S QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#CHALANQUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450545624527240830)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>540
,p_column_identifier=>'BB'
,p_column_label=>'CREATION TIME'
,p_column_html_expression=>'<div style="display:block; width:130px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450545587994240829)
,p_db_column_name=>'CREATOR'
,p_display_order=>530
,p_column_identifier=>'BA'
,p_column_label=>'CREATOR'
,p_column_html_expression=>'<div style="display:block; width:160px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450585820864942985)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>480
,p_column_identifier=>'AV'
,p_column_label=>'DEPARTMENT'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPARTMENT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450228094421497414)
,p_db_column_name=>'DESCRIPTION'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'EXTRA DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:180px">#DESCRIPTION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450229705171497415)
,p_db_column_name=>'DIFFERENCE'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'VARIANCE P QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#DIFFERENCE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450545453459240828)
,p_db_column_name=>'DIFFERENCE2'
,p_display_order=>520
,p_column_identifier=>'AZ'
,p_column_label=>'VARIANCE S QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#DIFFERENCE2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454974996044012938)
,p_db_column_name=>'DINSPECTIONDATE'
,p_display_order=>580
,p_column_identifier=>'BF'
,p_column_label=>'Dinspection Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#DINSPECTIONDATE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454974952342012937)
,p_db_column_name=>'DINSPECTIONNO'
,p_display_order=>570
,p_column_identifier=>'BE'
,p_column_label=>'Dinspection No'
,p_column_html_expression=>'<div style="display:block; width:180px">#DINSPECTIONNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450233711106497417)
,p_db_column_name=>'DOCSTATUS'
,p_display_order=>430
,p_column_identifier=>'AQ'
,p_column_label=>'DOC STATUS'
,p_column_html_expression=>'<div style="display:block; width:100px">#DOCSTATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450219288771497408)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'DOCTYPE'
,p_column_html_expression=>'<div style="display:block; width:120px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450232462701497416)
,p_db_column_name=>'DOCUMENTSTATUSCODE'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'Documentstatuscode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454975349543012941)
,p_db_column_name=>'DSTATUS'
,p_display_order=>610
,p_column_identifier=>'BI'
,p_column_label=>'DInspection Status'
,p_column_html_expression=>'<div style="display:block; width:80px">#DSTATUS#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(37325881187771225)
,p_db_column_name=>'FREIGHTAMOUNT'
,p_display_order=>640
,p_column_identifier=>'BL'
,p_column_label=>'FREIGHT AMOUNT'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20367826717616584)
,p_db_column_name=>'FREIGHTTYPENAME'
,p_display_order=>630
,p_column_identifier=>'BK'
,p_column_label=>'FREIGHT TYPE NAME'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450220056948497409)
,p_db_column_name=>'GRNDATE'
,p_display_order=>90
,p_column_identifier=>'I'
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
 p_id=>wwv_flow_imp.id(450219675024497409)
,p_db_column_name=>'GRNNO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'GRN NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#GRNNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450227306978497413)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'MATERIAL CODE'
,p_column_html_expression=>'<div style="display:block; width:100px">#ITEMCODE#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441798549447964058)
,p_db_column_name=>'LOADINGADVICEDATE'
,p_display_order=>560
,p_column_identifier=>'BD'
,p_column_label=>'LOADING ADVICE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#LOADINGADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(441798478271964057)
,p_db_column_name=>'LOADINGADVICENO'
,p_display_order=>550
,p_column_identifier=>'BC'
,p_column_label=>'LOADING ADVICE NO'
,p_column_html_expression=>'<div style="display:block; width:140px">#LOADINGADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450218849589497405)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:120px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450226885565497413)
,p_db_column_name=>'LRDATE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'LR DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#LRDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450226480750497413)
,p_db_column_name=>'LRNO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'LR NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#LRNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450227662768497414)
,p_db_column_name=>'MATERIAL'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:300px">#MATERIAL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450222469876497411)
,p_db_column_name=>'MATERIALINDATE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'MATERIALIN DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#MATERIALINDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450222089548497410)
,p_db_column_name=>'MATERIALINNO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'MATERIALIN NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#MATERIALINNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450234031080497417)
,p_db_column_name=>'NETWEIGHT'
,p_display_order=>440
,p_column_identifier=>'AR'
,p_column_label=>'NET WEIGHT'
,p_column_html_expression=>'<div style="display:block; width:80px">#NETWEIGHT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454975129443012939)
,p_db_column_name=>'PACCEPTEDQTY'
,p_display_order=>590
,p_column_identifier=>'BG'
,p_column_label=>'Primary Accepted Qty'
,p_column_html_expression=>'<div style="display:block; width:80px">#PACCEPTEDQTY#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450221689164497410)
,p_db_column_name=>'PARTYINVOICEAMOUNT'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'PARTY INVOICE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYINVOICEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450221222241497410)
,p_db_column_name=>'PARTYINVOICEDATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'PARTY INVOICE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYINVOICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450220841515497409)
,p_db_column_name=>'PARTYINVOICENO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'PARTY INVOICE NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#PARTYINVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450220449987497409)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(283823723199470505)
,p_db_column_name=>'PRINT'
,p_display_order=>620
,p_column_identifier=>'BJ'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450585675706942983)
,p_db_column_name=>'RATE'
,p_display_order=>460
,p_column_identifier=>'AT'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450229230041497415)
,p_db_column_name=>'RECEIVEDQUANTITY1'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'RECEIVED P QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#RECEIVEDQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450545398071240827)
,p_db_column_name=>'RECEIVEDQUANTITY2'
,p_display_order=>510
,p_column_identifier=>'AY'
,p_column_label=>'RECEIVED S QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#RECEIVEDQUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450222863275497411)
,p_db_column_name=>'REFERENCE'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'REFERENCE'
,p_column_html_expression=>'<div style="display:block; width:80px">#REFERENCE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450224061228497412)
,p_db_column_name=>'REFERENCEDATE'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'REFERENCE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#REFERENCEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450223662503497411)
,p_db_column_name=>'REFERENCENO'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'REFERENCE NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#REFERENCENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450223273162497411)
,p_db_column_name=>'REFERENCETNO'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Referencetno'
,p_column_html_expression=>'<div style="display:block; width:10px">#REFERENCETNO#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454975203979012940)
,p_db_column_name=>'SACCEPTEDQTY'
,p_display_order=>600
,p_column_identifier=>'BH'
,p_column_label=>'Secondary Accepted Qty'
,p_column_html_expression=>'<div style="display:block; width:80px">#SACCEPTEDQTY#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450230089102497415)
,p_db_column_name=>'SHORTAGEEXCESS'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'SHORTAGE / EXCESS'
,p_column_html_expression=>'<div style="display:block; width:100px">#SHORTAGEEXCESS#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450218469398497405)
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
 p_id=>wwv_flow_imp.id(450218051613497405)
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
 p_id=>wwv_flow_imp.id(450225704089497413)
,p_db_column_name=>'TRANSPORTER'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'TRANSPORTER'
,p_column_html_expression=>'<div style="display:block; width:150px">#TRANSPORTER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450228460614497414)
,p_db_column_name=>'UOM'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:80px">#UOM#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450545154337240825)
,p_db_column_name=>'UOM2'
,p_display_order=>490
,p_column_identifier=>'AW'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:80px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450226034312497413)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'VEHICLE NO'
,p_column_html_expression=>'<div style="display:block; width:80px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450232842882497417)
,p_db_column_name=>'WARRANTYUPTO'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'WARRANTY UP TO'
,p_column_html_expression=>'<div style="display:block; width:100px">#WARRANTYUPTO#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450225256177497412)
,p_db_column_name=>'WEIGHMENTDATE'
,p_display_order=>220
,p_column_identifier=>'V'
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
 p_id=>wwv_flow_imp.id(450224884011497412)
,p_db_column_name=>'WEIGHMENTNO'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'WEIGHMENT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#WEIGHMENTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450224466888497412)
,p_db_column_name=>'WEIGHMENTTNO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Weighmenttno'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(470812557394822160)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'42873'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'DOCSTATUS:PRINT:LOCATIONNAME:DOCTYPENAME:PARTYNAME:GRNDATE:GRNNO:MATERIALINNO:LOADINGADVICENO:REFERENCE:REFERENCENO:REFERENCEDATE:PARTYINVOICENO:PARTYINVOICEDATE:FREIGHTTYPENAME:VEHICLENO:LRNO:LRDATE:ITEMCODE:MATERIAL:DESCRIPTION:UOM:CHALANQUANTITY1:'
||'RECEIVEDQUANTITY1:DIFFERENCE:SHORTAGEEXCESS:RATE:AMOUNT:FREIGHTAMOUNT:WARRANTYUPTO:NETWEIGHT:ACCEPTEDWEIGHT:UOM2:CHALANQUANTITY2:RECEIVEDQUANTITY2:DIFFERENCE2:PACCEPTEDQTY:CREATOR:CREATIONTIME'
,p_sort_column_1=>'GRNDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DEPARTMENT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'DOCTYPENAME'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'PARTYNAME'
,p_sort_direction_4=>'ASC'
,p_sum_columns_on_break=>'RECEIVEDQUANTITY1:DIFFERENCE:CHALANQUANTITY1:AMOUNT:NETWEIGHT:ACCEPTEDWEIGHT:CHALANQUANTITY2:RECEIVEDQUANTITY2:DIFFERENCE2:PACCEPTEDQTY'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(16504076168343591)
,p_report_id=>wwv_flow_imp.id(470812557394822160)
,p_static_id=>'ir-condition'
,p_name=>'Green'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'SHORTAGEEXCESS'
,p_operator=>'='
,p_expr=>'Equal'
,p_condition_sql=>' (case when ("SHORTAGEEXCESS" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Equal''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#47FF53'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(16504478314343592)
,p_report_id=>wwv_flow_imp.id(470812557394822160)
,p_static_id=>'ir-condition-2'
,p_name=>'Yellow'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'SHORTAGEEXCESS'
,p_operator=>'='
,p_expr=>'Excess'
,p_condition_sql=>' (case when ("SHORTAGEEXCESS" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Excess''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#FFFF00'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(16504860348343592)
,p_report_id=>wwv_flow_imp.id(470812557394822160)
,p_static_id=>'ir-condition-3'
,p_name=>'Red'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'SHORTAGEEXCESS'
,p_operator=>'='
,p_expr=>'Shortage'
,p_condition_sql=>' (case when ("SHORTAGEEXCESS" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''Shortage''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_column_bg_color=>'#FF0000'
,p_column_font_color=>'#FFFFFF'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(438374361222914455)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(459778434951701839)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:146:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439106877845143623)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(459778434951701839)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/mmgrnregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P145_FROMDATE=&P145_FROMDATE.&P145_TODATE=&P145_TODATE.&P145_BREAKUPAS=&P145_BREAKUPAS.&P145_BREAKUP=&P145_BREAKUP.&P145_STATUS=&P145_STATUS.&P145_ITEMGROUP=&P145_ITEMGROUP.&P145_SPECIFICATION=&P145_SPECIFICATION.&P145_ITEM=&P145_ITEM.&P145_TRANSPORTER=&P145_TRANSPORTER.&P145_PARTY=&P145_PARTY.&P145_INSPECTIONSTATUS=&P145_INSPECTIONSTATUS.&P145_DOCTYPE=&P145_DOCTYPE.&P145_LOCATION=&P145_LOCATION.&P145_GRNNO=&P145_GRNNO.'
,p_button_condition=>'1'
,p_button_condition2=>'2'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(497415165807237263)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(459778434951701839)
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
 p_id=>wwv_flow_imp.id(439106417653143622)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(459778434951701839)
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
 p_id=>wwv_flow_imp.id(439086832575143209)
,p_button_sequence=>170
,p_button_plug_id=>wwv_flow_imp.id(459778363635701838)
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
 p_id=>wwv_flow_imp.id(439296947979738141)
,p_name=>'P145_BIREPORTURL'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450029847036851926)
,p_name=>'P145_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
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
'Where a.ModuleCode = ''GRN''',
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
 p_id=>wwv_flow_imp.id(499561093857422792)
,p_name=>'P145_CREATOR'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'Creator'
,p_placeholder=>'Creator Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        GetEmployeeName(bu.EmployeeCode)||''(''||a.Creator||'')'' d,',
'        GetEmployeeName(bu.EmployeeCode)||''(''||a.Creator||'')'' r',
'From GRN a,BossUser bu',
'Where a.Creator = bu.LoginName(+)'))
,p_cSize=>40
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
  'attribute_08', '3',
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450216460146497406)
,p_name=>'P145_DOCTYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
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
'  and a.ModuleCode = ''GRN''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';'))
,p_lov_cascade_parent_items=>'P145_COMPANY'
,p_ajax_items_to_submit=>'P145_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(450213995082497405)
,p_name=>'P145_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_item_default=>'Trunc(Sysdate)-3'
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
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450218032125497406)
,p_name=>'P145_GRNNO'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'GRN No'
,p_placeholder=>'Enter GRN No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select GRNNo ',
'From GRN ',
'Where instr('':''||:P145_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and GRNDate Between :P145_FROMDATE and :P145_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P145_LOCATION'
,p_ajax_items_to_submit=>'P145_GRNNO'
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
 p_id=>wwv_flow_imp.id(450217204635497406)
,p_name=>'P145_INSPECTIONSTATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:PREPARED;PREPARED,PENDING;PENDING'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Inspection Status--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_display_when=>'1'
,p_display_when2=>'2'
,p_display_when_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450215997045497406)
,p_name=>'P145_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select    Distinct',
'          e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'          e.ItemCode r',
'',
'From GRNDetail a, Item e',
'Where a.ItemCode = e.ItemCode'))
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
 p_id=>wwv_flow_imp.id(450215211448497405)
,p_name=>'P145_ITEMTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'Item Type'
,p_placeholder=>'Material Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select Upper(a.ItemtypeName || '' ( '' || a.ItemtypeCode || '' )'') As d,',
'       a.ItemtypeCode As r',
'  From Itemtype a',
'',
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
 p_id=>wwv_flow_imp.id(450215677700497406)
,p_name=>'P145_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
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
'  and a.ModuleCode = ''GRN''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P145_COMPANY'
,p_ajax_items_to_submit=>'P145_LOCATION'
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
 p_id=>wwv_flow_imp.id(450217593263497406)
,p_name=>'P145_PARTY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        p.PartyName d,',
'        p.PartyCode r',
'From GRN a,party p',
'Where a.PartyCode = p.PartyCode'))
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
 p_id=>wwv_flow_imp.id(450216793556497406)
,p_name=>'P145_SPECIFICATION'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select    Distinct',
'          ee.ItemSpecificationName d,',
'          ee.ItemSpecificationCode r',
'',
'From Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo',
' and  e.itemCode = :P145_ITEM'))
,p_lov_cascade_parent_items=>'P145_ITEM'
,p_ajax_items_to_submit=>'P145_SPECIFICATION'
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
 p_id=>wwv_flow_imp.id(450214797585497405)
,p_name=>'P145_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ACTIVE,Non-Active;NONACTIVE,Canceled;CANCELED,Closed;CLOSED,Preparing;PREPARING,Prepared;PREPARED,Authorised;AUTHORISED,On Hold;ONHOLD,Short Closed;SHORTCLOSED,Dept Approved;DEPTAPPROVED,Store Approval;STOREAPPROVED'
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
 p_id=>wwv_flow_imp.id(450219330518084846)
,p_name=>'P145_TNO'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450214414824497405)
,p_name=>'P145_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
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
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450218416420497407)
,p_name=>'P145_TRANSPORTER'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(459778363635701838)
,p_prompt=>'Transporter'
,p_placeholder=>'Transporter Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        p.PartyName d,',
'        p.PartyCode r',
'From GRN a,party p',
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(439107792173143625)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(439106417653143622)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(439108339154143628)
,p_event_id=>wwv_flow_imp.id(439107792173143625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/grnregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":"1","_par'
||'amsP_COMPANY":"&P145_COMPANY.","_paramsP_LOCATION":"&P145_LOCATION.","_paramsP_FROMDATE":"&P145_FROMDATE.","_paramsP_TODATE":"&P145_TODATE.","_paramsP_ITEMGROUP":"&P145_ITEMGROUP.","_paramsP_DOCTYPE":"&P145_DOCTYPE.","_paramsP_GRNNO":"&P145_GRNNO.","'
||'_paramsP_PARTY":"&P145_PARTY.","_paramsP_TRANSPORTER":"&P145_TRANSPORTER.","_paramsP_ITEM":"&P145_ITEM.","_paramsP_STATUS":"&P145_STATUS.","_paramsP_ITEMSPECIFICATION":"&P145_ITEMSPECIFICATION.","_paramsP_INSPECTIONSTATUS":"&P145_IMSPECTIONSTATUS."}'''
||');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(438374402038914456)
,p_name=>'Hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(438374568622914457)
,p_event_id=>wwv_flow_imp.id(438374402038914456)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(183334524830896317)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183334918648896317)
,p_event_id=>wwv_flow_imp.id(183334524830896317)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(439107409612143623)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
'  if :P145_GRNNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P145_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P145_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>7664030221148389
);
wwv_flow_imp.component_end;
end;
/
