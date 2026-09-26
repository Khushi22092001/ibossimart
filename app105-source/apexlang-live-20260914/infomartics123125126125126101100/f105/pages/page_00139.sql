prompt --application/pages/page_00139
begin
--   Manifest
--     PAGE: 00139
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
 p_id=>139
,p_name=>'Payment Advice Register'
,p_alias=>'PAYMENT-ADVICE-REGISTER'
,p_step_title=>'Payment Advice Register'
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
'    ',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P139_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/PaymentAdviceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P139_FROMDATE'').val());',
'  var toDate = new Date($(''#P139_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P139_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P139_COMPANY'').val() ==="" || $(''#P139_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P139_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P139_COMPANY'').val();',
'       global_companycode= $(''#P139_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +  ',
'      ''&P_LOCATION='' + $(''#P139_LOCATION'').val() + ',
'      ''&P_FROMDATE='' +$(''#P139_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P139_TODATE'').val() + ',
'       ''&P_DOCTYPE='' +$(''#P139_DOCTYPE'').val() +',
'       ''&P_PARTY='' +$(''#P139_PARTY'').val() +',
'       ''&P_REFERENCECODE='' +$(''#P139_REFERENCECODE'').val() +',
'       ''&P_STATUSS='' +$(''#P139_STATUSS'').val() +',
'       ''&P_BANK='' +$(''#P139_BANK'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode;',
'    ',
'         var reportURL = bireporturl+ reportName +',
'               ''?id=''+ username +',
'               ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'   window.open(reportURL, ''_blank'');',
' ',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P139_BIREPORTURL'').val()',
'  var reportName =  ''PaymentAdviceRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P139_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P139_COMPANY'').val() ==="" || $(''#P139_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P139_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P139_COMPANY'').val();',
'       global_companycode= $(''#P139_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P139_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P139_LOCATION'').val() + ''",'' +  ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P139_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P139_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_DOCTYPE":"'' + $(''#P139_DOCTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' +$(''#P139_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_REFERENCECODE":"'' + $(''#P139_REFERENCECODE'').val() + ''",'' + ',
'	  ''"_paramsP_STATUSS":"'' + $(''#P139_STATUSS'').val() + ''",'' + ',
'	  ''"_paramsP_BANK":"'' + $(''#P139_BANK'').val() + ''",'' + ',
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
 p_id=>wwv_flow_imp.id(513926947997457733)
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
 p_id=>wwv_flow_imp.id(463430634868142478)
,p_plug_name=>'New'
,p_static_id=>'new'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT X.*  FROM ',
'(',
'Select   NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,   ',
'      a.tno,     ',
'      a.paymentAdviceNo,',
'      a.PaymentAdviceDate,',
'      p.PartyName as Party,',
'      dt.DocTypeName,',
'      tp.TDSPayeeCategoryName,',
'      td.TDSNatureName,',
'      a.TDSLOWERRATE,',
'      a.TDSCERTIFICATENO as CertificateNo ,',
'      a.TDSOnOverAndAbove,',
'      ''PURCHASEORDER'' as Reference,',
'      po.PurchaseOrderNo as ReferenceNo,',
'      po.PurchaseOrderDate as ReferenceDate,',
'      b.Amount,',
'      a.amountdr,',
'      a.TDSPERCENT as TdsRate,',
'      a.TDSAmount as TdsAmount,',
'      a.ROUNDINGAMOUNT as RoundOff,',
'      v.MoneyTransferReferenceNo as ChecknoorDDno,',
'      Initcap(v.MoneyTransferModeCode) as Modeoftransaction,',
'      ac.PartyName as BankAccount,',
'      GetLocationName(nvl(po.LocationCode,a.locationcode)) as ReferenceLocation,',
'      v.VoucherNo,',
'      v.VoucherDate,',
'      a.Creator,',
'      l.LocationName,',
'      co.companyname,',
'      a.Narration,',
'',
'      ',
'      ds.DocumentStatusName',
'From  paymentAdvice a, PaymentAdviceReference b, Location l , DocType dt, Employee e, Party p, Party ac, ',
'      Voucher v, PurchaseOrder po,TDSPayeeCategory tp, TDSNature td, company co,',
'      DocumentStatusDetail dsd,DocumentStatus ds',
'Where a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.AccountCode = ac.PartyCode(+)',
'  and a.TNo = v.ModuleTNo(+)',
'  and a.TNo = b.TNo(+)',
'  and a.TDSPayeeCategoryCode = tp.TDSPayeeCategoryCode(+)',
'  and a.TDSNatureCode = td.TDSNatureCode(+)',
'  and a.Companycode = co.CompanyCode(+)',
'  and a.Tno = dsd.ModuleTno(+)',
'  and dsd.DOCUMENTSTATUSCODE = ds.DOCUMENTSTATUSCODE(+)',
'  and b.ReferenceModuleTNo = po.TNo(+)',
'  and b.ReferenceModuleCode = ''PURCHASEORDER''',
'  and ( :P139_COMPANY IS NULL OR instr('':''||:P139_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and ( :P139_LOCATION IS NULL OR instr('':''||:P139_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P139_DOCTYPE IS NULL OR instr('':''||:P139_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P139_STATUSS IS NULL OR instr('':''||:P139_STATUSS||'':'','':''||ds.DocumentStatusCode||'':'') > 0)',
'  and a.PaymentAdviceDate between :P139_FROMDATE and :P139_TODATE',
'  and ( :P139_PARTY IS NULL OR instr('':''||:P139_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P139_BANK IS NULL OR instr('':''||:P139_BANK||'':'','':''||a.AccountCode||'':'') > 0 )',
'  and case When b.ReferenceModuleCode = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When b.ReferenceModuleCode = ''JOBORDER'' Then ''JOBORDER''',
'           When b.ReferenceModuleCode = ''JOBBILL'' Then ''JOBBILL''',
'           When b.ReferenceModuleCode = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When b.ReferenceModuleCode = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When b.ReferenceModuleCode = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When b.ReferenceModuleCode = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When b.ReferenceModuleCode is null  Then ''OTHER''',
'      End like nvl(:P139_REFERENCECODE,''%'')',
'union all',
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,   ',
'      a.tno,',
'      a.paymentAdviceNo,',
'      a.PaymentAdviceDate,',
'      p.PartyName as Party,',
'      dt.DocTypeName,',
'      tp.TDSPayeeCategoryName,',
'      td.TDSNatureName,',
'      a.TDSLOWERRATE,',
'      a.TDSCERTIFICATENO as CertificateNo ,',
'      a.TDSOnOverAndAbove,',
'      ''GRN'' as Reference,',
'      po.grnNo as ReferenceNo,',
'      po.grnDate as ReferenceDate,',
'      b.Amount,',
'      a.amountdr,',
'      a.TaxRate as TdsRate,',
'      a.TaxAmount as TdsAmount,',
'      a.ROUNDINGAMOUNT as RoundOff,',
'      v.MoneyTransferReferenceNo as ChecknoorDDno,',
'      Initcap(v.MoneyTransferModeCode) as Modeoftransaction,',
'      ac.PartyName as BankAccount,',
'      GetLocationName(nvl(po.LocationCode,a.locationcode)) as ReferenceLocation,',
'      v.VoucherNo,',
'      v.VoucherDate,',
'      a.Creator,',
'      l.LocationName,',
'      co.companyname,',
'      a.Narration,',
'      ds.DocumentStatusName',
'From  paymentAdvice a, PaymentAdviceReference b, Location l , DocType dt, Employee e, Party p, Party ac, ',
'      Voucher v, grn po,TDSPayeeCategory tp, TDSNature td, company co,',
'      DocumentStatusDetail dsd,DocumentStatus ds',
'Where a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.AccountCode = ac.PartyCode(+)',
'  and a.TNo = v.ModuleTNo(+)',
'  and a.TNo = b.TNo(+)',
'  and a.TDSPayeeCategoryCode = tp.TDSPayeeCategoryCode(+)',
'  and a.TDSNatureCode = td.TDSNatureCode(+)',
'  and a.Companycode = co.CompanyCode(+)',
'  and a.Tno = dsd.ModuleTno(+)',
'  and dsd.DOCUMENTSTATUSCODE = ds.DOCUMENTSTATUSCODE(+)',
'  and b.ReferenceModuleTNo = po.TNo(+)',
'  and b.ReferenceModuleCode = ''GRN''',
'   and ( :P139_COMPANY IS NULL OR instr('':''||:P139_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and ( :P139_LOCATION IS NULL OR instr('':''||:P139_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P139_DOCTYPE IS NULL OR instr('':''||:P139_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and a.PaymentAdviceDate between :P139_FROMDATE and :P139_TODATE',
'  and ( :P139_PARTY IS NULL OR instr('':''||:P139_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P139_BANK IS NULL OR instr('':''||:P139_BANK||'':'','':''||a.AccountCode||'':'') > 0 )',
'  and case When b.ReferenceModuleCode = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When b.ReferenceModuleCode = ''GRN'' Then ''GRN''',
'           When b.ReferenceModuleCode = ''JOBORDER'' Then ''JOBORDER''',
'           When b.ReferenceModuleCode = ''JOBBILL'' Then ''JOBBILL''',
'           When b.ReferenceModuleCode = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When b.ReferenceModuleCode = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When b.ReferenceModuleCode = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When b.ReferenceModuleCode = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When b.ReferenceModuleCode is null  Then ''OTHER''',
'      End like nvl(:P139_REFERENCECODE,''%'')',
'           ',
'Union All',
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,   ',
'      a.tno,',
'      a.paymentAdviceNo,',
'      a.PaymentAdviceDate,',
'      p.PartyName as Party,',
'      dt.DocTypeName,',
'      tp.TDSPayeeCategoryName,',
'      td.TDSNatureName,',
'      a.TDSLOWERRATE,',
'      a.TDSCERTIFICATENO as CertificateNo ,',
'      a.TDSOnOverAndAbove,',
'      ''JOBORDER'' as Reference,',
'      jo.JobOrderNo as ReferenceNo,',
'      jo.JobOrderDate as ReferenceDate,',
'      b.Amount,',
'      a.amountdr,',
'      a.TaxRate as TdsRate,',
'      a.TaxAmount as TdsAmount,',
'      a.ROUNDINGAMOUNT as RoundOff,',
'      v.MoneyTransferReferenceNo as ChecknoorDDno,',
'      Initcap(v.MoneyTransferModeCode) as Modeoftransaction,',
'      ac.PartyName as BankAccount,',
'      GetLocationName(nvl(jo.LocationCode,a.locationcode)) as ReferenceLocation,',
'      v.VoucherNo,',
'      v.VoucherDate,',
'      a.Creator,',
'      l.LocationName,',
'      co.companyname,',
'      a.Narration,',
'      ds.DocumentStatusName',
'From  paymentAdvice a, PaymentAdviceReference b, Location l , DocType dt, Employee e, Party p, Party ac, ',
'      Voucher v, JobOrder jo , TDSPayeeCategory tp, TDSNature td, company co,',
'    DocumentStatusDetail dsd, DocumentStatus ds',
'Where a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.AccountCode = ac.PartyCode(+)',
'  and a.TNo = v.ModuleTNo(+)',
'  and a.TNo = b.TNo(+)',
'  and a.TDSPayeeCategoryCode = tp.TDSPayeeCategoryCode(+)',
'  and a.TDSNatureCode = td.TDSNatureCode(+)',
'  and a.Companycode = co.CompanyCode(+)',
'  and a.Tno = dsd.ModuleTno(+)',
'  and dsd.DOCUMENTSTATUSCODE = ds.DOCUMENTSTATUSCODE(+)',
'  and b.ReferenceModuleTNo = jo.TNo(+)',
'  and b.ReferenceModuleCode = ''JOBORDER''',
'   and ( :P139_COMPANY IS NULL OR instr('':''||:P139_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and ( :P139_LOCATION IS NULL OR instr('':''||:P139_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P139_DOCTYPE IS NULL OR instr('':''||:P139_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P139_STATUSS IS NULL OR instr('':''||:P139_STATUSS||'':'','':''||ds.DocumentStatusCode||'':'') > 0)',
'  and a.PaymentAdviceDate between :P139_FROMDATE and :P139_TODATE',
'  and ( :P139_PARTY IS NULL OR instr('':''||:P139_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P139_BANK IS NULL OR instr('':''||:P139_BANK||'':'','':''||a.AccountCode||'':'') > 0 )',
'  and case When b.ReferenceModuleCode = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When b.ReferenceModuleCode = ''JOBORDER'' Then ''JOBORDER''',
'           When b.ReferenceModuleCode = ''JOBBILL'' Then ''JOBBILL''',
'           When b.ReferenceModuleCode = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When b.ReferenceModuleCode = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When b.ReferenceModuleCode = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When b.ReferenceModuleCode = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When b.ReferenceModuleCode is null  Then ''OTHER''',
'      End like nvl(:P139_REFERENCECODE,''%'')',
'Union All',
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,   ',
'      a.tno,',
'      a.paymentAdviceNo,',
'      a.PaymentAdviceDate,',
'      p.PartyName as Party,',
'      dt.DocTypeName,',
'      tp.TDSPayeeCategoryName,',
'      td.TDSNatureName,',
'      a.TDSLOWERRATE,',
'      a.TDSCERTIFICATENO as CertificateNo ,',
'      a.TDSOnOverAndAbove,',
'      ''JOBBILL'' as Reference,',
'      Jb.JOBBILLNo as ReferenceNo,',
'      Jb.JOBBILLDate as ReferenceDate,',
'      b.Amount,',
'      a.amountdr,',
'      a.TaxRate as TdsRate,',
'      a.TaxAmount as TdsAmount,',
'      a.ROUNDINGAMOUNT as RoundOff,',
'      v.MoneyTransferReferenceNo as ChecknoorDDno,',
'      Initcap(v.MoneyTransferModeCode) as Modeoftransaction,',
'      ac.PartyName as BankAccount,',
'      GetLocationName(nvl(jb.LocationCode,a.locationcode)) as ReferenceLocation,',
'      v.VoucherNo,',
'      v.VoucherDate,',
'      a.Creator,',
'      l.LocationName,',
'      co.companyname,',
'      a.Narration,',
'      ds.DocumentStatusName',
'From  paymentAdvice a, PaymentAdviceReference b, Location l , DocType dt, Employee e, Party p, Party ac, ',
'      Voucher v, JobBill  jb, TDSPayeeCategory tp, TDSNature td, company co,',
'      DocumentStatusDetail dsd, DocumentStatus ds',
'Where a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.AccountCode = ac.PartyCode(+)',
'  and a.TNo = v.ModuleTNo(+)',
'  and a.TNo = b.TNo(+)',
'  and a.TDSPayeeCategoryCode = tp.TDSPayeeCategoryCode(+)',
'  and a.TDSNatureCode = td.TDSNatureCode(+)',
'  and a.Companycode = co.CompanyCode(+)',
'  and a.Tno = dsd.ModuleTno(+)',
'  and dsd.DOCUMENTSTATUSCODE = ds.DOCUMENTSTATUSCODE(+)',
'  and b.ReferenceModuleTNo = jb.TNo(+)',
'  and b.ReferenceModuleCode = ''JOBBILL''',
'   and ( :P139_COMPANY IS NULL OR instr('':''||:P139_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and ( :P139_LOCATION IS NULL OR instr('':''||:P139_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P139_DOCTYPE IS NULL OR instr('':''||:P139_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P139_STATUSS IS NULL OR instr('':''||:P139_STATUSS||'':'','':''||ds.DocumentStatusCode||'':'') > 0)',
'  and a.PaymentAdviceDate between :P139_FROMDATE and :P139_TODATE',
'  and ( :P139_PARTY IS NULL OR instr('':''||:P139_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P139_BANK IS NULL OR instr('':''||:P139_BANK||'':'','':''||a.AccountCode||'':'') > 0 )',
'  and case When b.ReferenceModuleCode = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When b.ReferenceModuleCode = ''JOBORDER'' Then ''JOBORDER''',
'           When b.ReferenceModuleCode = ''JOBBILL'' Then ''JOBBILL''',
'           When b.ReferenceModuleCode = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When b.ReferenceModuleCode = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When b.ReferenceModuleCode = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When b.ReferenceModuleCode = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When b.ReferenceModuleCode is null  Then ''OTHER''',
'      End like nvl(:P139_REFERENCECODE,''%'')',
'Union All',
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,   ',
'      a.tno,',
'      a.paymentAdviceNo,',
'      a.PaymentAdviceDate,',
'      p.PartyName as Party,',
'      dt.DocTypeName,',
'      tp.TDSPayeeCategoryName,',
'      td.TDSNatureName,',
'      a.TDSLOWERRATE,',
'      a.TDSCERTIFICATENO as CertificateNo ,',
'      a.TDSOnOverAndAbove,',
'      ''PURCHASEBILL'' as Reference,',
'      pb.PURCHASEBILLNo as ReferenceNo,',
'      pb.PURCHASEBILLDate as ReferenceDate,',
'      b.Amount,',
'      a.amountdr,',
'      a.TaxRate as TdsRate,',
'      a.TaxAmount as TdsAmount,',
'      a.ROUNDINGAMOUNT as RoundOff,',
'      v.MoneyTransferReferenceNo as ChecknoorDDno,',
'      Initcap(v.MoneyTransferModeCode) as Modeoftransaction,',
'      ac.PartyName as BankAccount,',
'      GetLocationName(nvl(pb.LocationCode,a.locationcode)) as ReferenceLocation,',
'      v.VoucherNo,',
'      v.VoucherDate,',
'      a.Creator,',
'      l.LocationName,',
'      co.companyname,',
'      a.Narration,',
'      ds.DocumentStatusName',
'From  paymentAdvice a, PaymentAdviceReference b, Location l , DocType dt, Employee e, Party p, Party ac,',
'      Voucher v, PurchaseBill  pb, TDSPayeeCategory tp, TDSNature td, company co,',
'      DocumentStatusDetail dsd, DocumentStatus ds',
'Where a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.AccountCode = ac.PartyCode(+)',
'  and a.TNo = v.ModuleTNo(+)',
'  and a.TNo = b.TNo(+)',
'  and a.TDSPayeeCategoryCode = tp.TDSPayeeCategoryCode(+)',
'  and a.TDSNatureCode = td.TDSNatureCode(+)',
'  and a.Companycode = co.CompanyCode(+)',
'  and a.Tno = dsd.ModuleTno (+)',
'  and dsd.DOCUMENTSTATUSCODE = ds.DOCUMENTSTATUSCODE(+)',
'  and b.ReferenceModuleTNo = pb.TNo(+)',
'  and b.ReferenceModuleCode = ''PURCHASEBILL''',
'   and ( :P139_COMPANY IS NULL OR instr('':''||:P139_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and ( :P139_LOCATION IS NULL OR instr('':''||:P139_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P139_DOCTYPE IS NULL OR instr('':''||:P139_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P139_STATUSS IS NULL OR instr('':''||:P139_STATUSS||'':'','':''||ds.DocumentStatusCode||'':'') > 0)',
'  and a.PaymentAdviceDate between :P139_FROMDATE and :P139_TODATE',
'  and ( :P139_PARTY IS NULL OR instr('':''||:P139_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P139_BANK IS NULL OR instr('':''||:P139_BANK||'':'','':''||a.AccountCode||'':'') > 0 )',
'  and case When b.ReferenceModuleCode = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When b.ReferenceModuleCode = ''JOBORDER'' Then ''JOBORDER''',
'           When b.ReferenceModuleCode = ''JOBBILL'' Then ''JOBBILL''',
'           When b.ReferenceModuleCode = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When b.ReferenceModuleCode = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When b.ReferenceModuleCode = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When b.ReferenceModuleCode = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When b.ReferenceModuleCode is null  Then ''OTHER''',
'      End like nvl(:P139_REFERENCECODE,''%'')',
'Union all',
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,   ',
'      a.tno,',
'      a.paymentAdviceNo,',
'      a.PaymentAdviceDate,',
'      p.PartyName as Party,',
'      dt.DocTypeName,',
'      tp.TDSPayeeCategoryName,',
'      td.TDSNatureName,',
'      a.TDSLOWERRATE,',
'      a.TDSCERTIFICATENO as CertificateNo ,',
'      a.TDSOnOverAndAbove,',
'      ''ACCOUNTOPENING'' as Reference,',
'      ao.ACCOUNTOPENINGNo as ReferenceNo,',
'      ao.ACCOUNTOPENINGDate as ReferenceDate,',
'      b.Amount,',
'      a.amountdr,',
'      a.TaxRate as TdsRate,',
'      a.TaxAmount as TdsAmount,',
'      a.ROUNDINGAMOUNT as RoundOff,',
'      v.MoneyTransferReferenceNo as ChecknoorDDno,',
'      Initcap(v.MoneyTransferModeCode) as Modeoftransaction,',
'      ac.PartyName as BankAccount,',
'      GetLocationName(nvl(Ao.LocationCode,a.locationcode)) as ReferenceLocation,',
'      v.VoucherNo,',
'      v.VoucherDate,',
'      a.Creator,',
'      l.LocationName,',
'      co.companyname,',
'      a.Narration,',
'      ds.DocumentStatusName',
'From  paymentAdvice a, PaymentAdviceReference b, Location l , DocType dt, Employee e, Party p, Party ac, ',
'Voucher v, AccountOpening  ao , TDSPayeeCategory tp, TDSNature td, company co, DocumentStatusDetail dsd, DocumentStatus ds',
'Where a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.AccountCode = ac.PartyCode(+)',
'  and a.TNo = v.ModuleTNo(+)',
'  and a.TNo = b.TNo(+)',
'  and a.TDSPayeeCategoryCode = tp.TDSPayeeCategoryCode(+)',
'  and a.TDSNatureCode = td.TDSNatureCode(+)',
'  and a.Companycode = co.CompanyCode(+)',
'  and a.Tno = dsd.ModuleTno(+)',
'  and dsd.DOCUMENTSTATUSCODE = ds.DOCUMENTSTATUSCODE(+)',
'  and b.ReferenceModuleTNo = ao.TNo(+)',
'  and b.ReferenceModuleCode = ''ACCOUNTOPENING''',
'   and ( :P139_COMPANY IS NULL OR instr('':''||:P139_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and ( :P139_LOCATION IS NULL OR instr('':''||:P139_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P139_DOCTYPE IS NULL OR instr('':''||:P139_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P139_STATUSS IS NULL OR instr('':''||:P139_STATUSS||'':'','':''||ds.DocumentStatusCode||'':'') > 0)',
'  and a.PaymentAdviceDate between :P139_FROMDATE and :P139_TODATE',
'  and ( :P139_PARTY IS NULL OR instr('':''||:P139_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P139_BANK IS NULL OR instr('':''||:P139_BANK||'':'','':''||a.AccountCode||'':'') > 0 )',
'  and case When b.ReferenceModuleCode = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When b.ReferenceModuleCode = ''JOBORDER'' Then ''JOBORDER''',
'           When b.ReferenceModuleCode = ''JOBBILL'' Then ''JOBBILL''',
'           When b.ReferenceModuleCode = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When b.ReferenceModuleCode = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When b.ReferenceModuleCode = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When b.ReferenceModuleCode = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When b.ReferenceModuleCode is null  Then ''OTHER''',
'      End like nvl(:P139_REFERENCECODE,''%'')',
'Union all',
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,   ',
'      a.tno,',
'      a.paymentAdviceNo,',
'      a.PaymentAdviceDate,',
'      p.PartyName as Party,',
'      dt.DocTypeName,',
'      tp.TDSPayeeCategoryName,',
'      td.TDSNatureName,',
'      a.TDSLOWERRATE,',
'      a.TDSCERTIFICATENO as CertificateNo ,',
'      a.TDSOnOverAndAbove,',
'      ''ON ACCOUNT'' as Reference,',
'       null  as ReferenceNo,',
'       null as ReferenceDate,',
'      b.Amount,',
'      a.amountdr,',
'      a.TaxRate as TdsRate,',
'      a.TaxAmount as TdsAmount,',
'      a.ROUNDINGAMOUNT as RoundOff,',
'      v.MoneyTransferReferenceNo as ChecknoorDDno,',
'      Initcap(v.MoneyTransferModeCode) as Modeoftransaction,',
'      ac.PartyName as BankAccount,',
'      GetLocationName(a.locationcode) as ReferenceLocation,',
'      v.VoucherNo,',
'      v.VoucherDate,',
'      a.Creator,',
'      l.LocationName,',
'      co.companyname,',
'      a.Narration,',
'      ds.DocumentStatusName ',
'From  paymentAdvice a, PaymentAdviceReference b, Location l , DocType dt, Employee e, Party p, Party ac, Voucher v',
'      , TDSPayeeCategory tp, TDSNature td, company co,',
'     DocumentStatusDetail dsd, DocumentStatus ds',
'Where a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.AccountCode = ac.PartyCode(+)',
'  and a.TNo = v.ModuleTNo(+)',
'  and a.TNo = b.TNo(+)',
'  and a.TDSPayeeCategoryCode = tp.TDSPayeeCategoryCode(+)',
'  and a.TDSNatureCode = td.TDSNatureCode(+)',
'  and a.Companycode = co.CompanyCode(+)',
'  and a.Tno = dsd.ModuleTno(+)',
'  and dsd.DOCUMENTSTATUSCODE = ds.DOCUMENTSTATUSCODE(+)',
'  and b.ReferenceModuleTNo is null',
'   and ( :P139_COMPANY IS NULL OR instr('':''||:P139_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and ( :P139_LOCATION IS NULL OR instr('':''||:P139_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P139_DOCTYPE IS NULL OR instr('':''||:P139_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P139_STATUSS IS NULL OR instr('':''||:P139_STATUSS||'':'','':''||ds.DocumentStatusCode||'':'') > 0)',
'  and a.PaymentAdviceDate between :P139_FROMDATE and :P139_TODATE',
'  and ( :P139_PARTY IS NULL OR instr('':''||:P139_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P139_BANK IS NULL OR instr('':''||:P139_BANK||'':'','':''||a.AccountCode||'':'') > 0 )',
'  and case When b.ReferenceModuleCode = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When b.ReferenceModuleCode = ''JOBORDER'' Then ''JOBORDER''',
'           When b.ReferenceModuleCode = ''JOBBILL'' Then ''JOBBILL''',
'           When b.ReferenceModuleCode = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When b.ReferenceModuleCode = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When b.ReferenceModuleCode = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When b.ReferenceModuleCode = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When b.ReferenceModuleCode is null  Then ''OTHER''',
'      End like nvl(:P139_REFERENCECODE,''%'')',
'Union all',
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),A.TNO),''STATUS'') AS Status ,   ',
'      a.tno,',
'      a.paymentAdviceNo,',
'      a.PaymentAdviceDate,',
'      p.PartyName as Party,',
'      dt.DocTypeName,',
'      tp.TDSPayeeCategoryName,',
'      td.TDSNatureName,',
'      a.TDSLOWERRATE,',
'      a.TDSCERTIFICATENO as CertificateNo ,',
'      a.TDSOnOverAndAbove,',
'      ''LOADINGADVICE'' as Reference,',
'       LD.LoadingAdviceNo as ReferenceNo,',
'       ld.LoadingAdviceDate as ReferenceDate,',
'      b.Amount,',
'      a.amountdr,',
'      a.TaxRate as TdsRate,',
'      a.TaxAmount as TdsAmount,',
'      a.ROUNDINGAMOUNT as RoundOff,',
'      v.MoneyTransferReferenceNo as ChecknoorDDno,',
'      Initcap(v.MoneyTransferModeCode) as Modeoftransaction,',
'      ac.PartyName as BankAccount,',
'      GetLocationName(nvl(ld.LocationCode,a.locationcode)) as ReferenceLocation,',
'      v.VoucherNo,',
'      v.VoucherDate,',
'      a.Creator,',
'      l.LocationName,',
'      co.companyname,',
'      a.Narration,',
'      ds.DocumentStatusName',
'From  paymentAdvice a, PaymentAdviceReference b, Location l , DocType dt, Employee e, Party p,',
' Party ac, Voucher v, LOADINGADVICE  ld, TDSPayeeCategory tp, TDSNature td, company co,',
'     DocumentStatusDetail dsd, DocumentStatus ds',
'Where a.LocationCode = l.LocationCode',
'  and a.DocTypeCode = dt.DocTypeCode',
'  and a.PartyCode = p.PartyCode',
'  and a.AccountCode = ac.PartyCode(+)',
'  and a.TNo = v.ModuleTNo(+)',
'  and a.TNo = b.TNo(+)',
'  and a.TDSPayeeCategoryCode = tp.TDSPayeeCategoryCode(+)',
'  and a.TDSNatureCode = td.TDSNatureCode(+)',
'  and a.Companycode = co.CompanyCode(+)',
'  and a.Tno = dsd.ModuleTno(+)',
'  and dsd.DOCUMENTSTATUSCODE = ds.DOCUMENTSTATUSCODE(+)',
'  and b.ReferenceModuleTNo = ld.TNo(+)',
'  and b.ReferenceModuleCode = ''LOADINGADVICE''',
'   and ( :P139_COMPANY IS NULL OR instr('':''||:P139_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and ( :P139_LOCATION IS NULL OR instr('':''||:P139_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P139_DOCTYPE IS NULL OR instr('':''||:P139_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P139_STATUSS IS NULL OR instr('':''||:P139_STATUSS||'':'','':''||ds.DocumentStatusCode||'':'') > 0)',
'  and a.PaymentAdviceDate between :P139_FROMDATE and :P139_TODATE',
'  and ( :P139_PARTY IS NULL OR instr('':''||:P139_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P139_BANK IS NULL OR instr('':''||:P139_BANK||'':'','':''||a.AccountCode||'':'') > 0 )',
' and case When b.ReferenceModuleCode = ''PURCHASEORDER'' Then ''PURCHASEORDER''',
'           When b.ReferenceModuleCode = ''JOBORDER'' Then ''JOBORDER''',
'           When b.ReferenceModuleCode = ''JOBBILL'' Then ''JOBBILL''',
'           When b.ReferenceModuleCode = ''PURCHASEBILL'' Then ''PURCHASEBILL''',
'           When b.ReferenceModuleCode = ''ACCOUNTOPENING'' Then ''ACCOUNTOPENING''',
'           When b.ReferenceModuleCode = ''EXTERNALSERVICESENTRY'' Then ''EXTERNALSERVICESENTRY''',
'           When b.ReferenceModuleCode = ''LOADINGADVICE'' Then ''LOADINGADVICE''',
'           When b.ReferenceModuleCode is null  Then ''OTHER''',
'      End like nvl(:P139_REFERENCECODE,''%'') ',
') X',
';',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'New'
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
 p_id=>wwv_flow_imp.id(463430879589142480)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.::P140_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>31987500198147246
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(433263613654690622)
,p_db_column_name=>'AMOUNT'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463432328527142495)
,p_db_column_name=>'AMOUNTDR'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Amount Dr'
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNTDR#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463433059579142502)
,p_db_column_name=>'BANKACCOUNT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Bank Account'
,p_column_html_expression=>'<div style="display:block; width:130px">#BANKACCOUNT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431611272142488)
,p_db_column_name=>'CERTIFICATENO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Certificate No'
,p_column_html_expression=>'<div style="display:block; width:100px">#CERTIFICATENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463432825692142500)
,p_db_column_name=>'CHECKNOORDDNO'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Check No /DD No'
,p_column_html_expression=>'<div style="display:block; width:100px">#CHECKNOORDDNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463433639421142508)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Company Name'
,p_column_html_expression=>'<div style="display:block; width:130px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463433449421142506)
,p_db_column_name=>'CREATOR'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431217752142484)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Doctype Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#DOCTYPENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(478441873244816106)
,p_db_column_name=>'DOCUMENTSTATUSNAME'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'Status '
,p_column_html_expression=>'<div style="display:block; width:100px">#DOCUMENTSTATUSNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463433535597142507)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Location Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463432938939142501)
,p_db_column_name=>'MODEOFTRANSACTION'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Mode of Transaction'
,p_column_html_expression=>'<div style="display:block; width:100px">#MODEOFTRANSACTION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463433768528142509)
,p_db_column_name=>'NARRATION'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Narration'
,p_column_html_expression=>'<div style="display:block; width:300px">#NARRATION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431176220142483)
,p_db_column_name=>'PARTY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Party'
,p_column_html_expression=>'<div style="display:block; width:180px">#PARTY#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431003819142482)
,p_db_column_name=>'PAYMENTADVICEDATE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Payment Advice Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PAYMENTADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463430904201142481)
,p_db_column_name=>'PAYMENTADVICENO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Payment Advice No'
,p_column_html_expression=>'<div style="display:block; width:150px">#PAYMENTADVICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431944897142491)
,p_db_column_name=>'REFERENCE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Reference'
,p_column_html_expression=>'<div style="display:block; width:100px">#REFERENCE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463432171085142493)
,p_db_column_name=>'REFERENCEDATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Reference Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#REFERENCEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463433196275142503)
,p_db_column_name=>'REFERENCELOCATION'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Reference Location'
,p_column_html_expression=>'<div style="display:block; width:100px">#REFERENCELOCATION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463432065170142492)
,p_db_column_name=>'REFERENCENO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Reference No'
,p_column_html_expression=>'<div style="display:block; width:150px">#REFERENCENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463432784105142499)
,p_db_column_name=>'ROUNDOFF'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Round off'
,p_column_html_expression=>'<div style="display:block; width:80px">#ROUNDOFF#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(179661339521440811)
,p_db_column_name=>'STATUS'
,p_display_order=>330
,p_column_identifier=>'AH'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463432626653142498)
,p_db_column_name=>'TDSAMOUNT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'TDS Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDSAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431540085142487)
,p_db_column_name=>'TDSLOWERRATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'TDS lower Rate'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSLOWERRATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431440739142486)
,p_db_column_name=>'TDSNATURENAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'TDS Nature'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSNATURENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431748075142489)
,p_db_column_name=>'TDSONOVERANDABOVE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'TDS on Over and Above'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSONOVERANDABOVE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463431308512142485)
,p_db_column_name=>'TDSPAYEECATEGORYNAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'TDS Payee Category '
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSPAYEECATEGORYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463432510072142497)
,p_db_column_name=>'TDSRATE'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'TDS Rate'
,p_column_html_expression=>'<div style="display:block; width:100px">#TDSRATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(439513302957158839)
,p_db_column_name=>'TNO'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463433333396142505)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Voucher Date'
,p_column_html_expression=>'<div style="display:block; width:100px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463433205437142504)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Voucher No'
,p_column_html_expression=>'<div style="display:block; width:140px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(463450525570198388)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'170970'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STATUS:COMPANYNAME:LOCATIONNAME:DOCTYPENAME:PAYMENTADVICENO:PAYMENTADVICEDATE:TDSNATURENAME:TDSPAYEECATEGORYNAME:PARTY:REFERENCE:REFERENCENO:REFERENCEDATE:AMOUNT:TDSRATE:TDSAMOUNT:ROUNDOFF:MODEOFTRANSACTION:BANKACCOUNT:CHECKNOORDDNO:NARRATION:DOCUMEN'
||'TSTATUSNAME:VOUCHERNO:VOUCHERDATE:CREATOR'
,p_sort_column_1=>'PAYMENTADVICEDATE'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'TDSLOWERRATE:AMOUNTDR:AMOUNTCR:TDSRATE:TDSAMOUNT:ROUNDOFF:AMOUNT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439513247611158838)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(463430634868142478)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439513056852158836)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(463430634868142478)
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
 p_id=>wwv_flow_imp.id(439512959957158835)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(463430634868142478)
,p_button_name=>'Pdf'
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
 p_id=>wwv_flow_imp.id(439502388463119173)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_button_position=>'NEXT'
,p_icon_css_classes=>'fa-refresh'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449558394915451978)
,p_name=>'P139_BANK'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_prompt=>'Bank '
,p_placeholder=>'Bank Account'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From PaymentAdvice a, Party p',
'Where a.AccountCode = p.PartyCode',
'  and p.PartyTypeCode IN (''BANK'',''CASH'');'))
,p_cSize=>75
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>2
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
 p_id=>wwv_flow_imp.id(450807350894713382)
,p_name=>'P139_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449502769527981650)
,p_name=>'P139_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PAYMENTADVICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;',
''))
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
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
 p_id=>wwv_flow_imp.id(449557979749451978)
,p_name=>'P139_DOCTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
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
'  and a.ModuleCode = ''PAYMENTADVICE''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';'))
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
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
 p_id=>wwv_flow_imp.id(449556433967451978)
,p_name=>'P139_FROMDATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_item_default=>'Trunc(Sysdate-3)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449557142314451978)
,p_name=>'P139_LOCATION'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
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
'  and a.ModuleCode = ''PAYMENTADVICE''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
'  ',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>2
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
 p_id=>wwv_flow_imp.id(449557606181451978)
,p_name=>'P139_PARTY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From PaymentAdvice a, Party p',
'Where a.PartyCode = p.PartyCode'))
,p_cSize=>75
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>2
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
 p_id=>wwv_flow_imp.id(449558829322451979)
,p_name=>'P139_REFERENCECODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_prompt=>'Reference'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Purchase Order;PURCHASEORDER,Purchase Bill;PURCHASEBILL,Job Order;JOBORDER,Job Bill;JOBBILL,Account Opening;ACCOUNTOPENING,External Service Entry Sheet;EXTERNALSERVICESENTRY,On Account;OTHER'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Any Referance--'
,p_cHeight=>1
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(484032912164780418)
,p_name=>'P139_STATUSS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'DISTINCT',
'C.DOCUMENTSTATUSNAME d,',
'C.DOCUMENTSTATUSCODE r',
'FROM DOCUMENTSTATUSDETAIL B, DOCUMENTSTATUS C,PAYMENTADVICE A',
'WHERE B.DOCUMENTSTATUSCODE = C.DOCUMENTSTATUSCODE(+)',
'AND B.MODULETNO = A.TNO(+)',
'AND B.MODULECODE = ''PAYMENTADVICE''',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'2'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(444264009308980039)
,p_name=>'P139_TNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(449556780098451978)
,p_name=>'P139_TODATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(513926947997457733)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(604689371543869564)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(439512959957158835)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(604689434937869565)
,p_event_id=>wwv_flow_imp.id(604689371543869564)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(438377112585914483)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(438377185430914484)
,p_event_id=>wwv_flow_imp.id(438377112585914483)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(183461268721476605)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183461662545476610)
,p_event_id=>wwv_flow_imp.id(183461268721476605)
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
