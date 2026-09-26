prompt --application/pages/page_00220
begin
--   Manifest
--     PAGE: 00220
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
 p_id=>220
,p_name=>'Service Bill Pass Register'
,p_alias=>'JOB-BILL-PASS-REGISTER'
,p_step_title=>'Service Bill Pass Register'
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
'  var bireporturl = $(''#P220_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/JobBillPassRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P220_FROMDATE'').val());',
'  var toDate = new Date($(''#P220_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P220_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P220_COMPANY'').val() ==="" || $(''#P220_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P220_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P220_COMPANY'').val();',
'       global_companycode= $(''#P220_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +   ',
'      ''&P_LOCATION='' + $(''#P220_LOCATION'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P220_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P220_TODATE'').val() + ',
'      ''&P_VSTATUS='' +$(''#P220_VSTATUS'').val() +',
'      ''&P_JOBTYPE='' +$(''#P220_JOBTYPE'').val() +',
'      ''&P_PARTYNAME='' +$(''#P220_PARTYNAME'').val() +',
'      ''&P_ITEMGROUP='' +$(''#P220_ITEMGROUP'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P220_ITEMSPECIFICATION'').val()  +',
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
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P220_BIREPORTURL'').val()',
'  var reportName =  ''JobBillPassRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P220_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P220_COMPANY'').val() ==="" || $(''#P220_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P220_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P220_COMPANY'').val();',
'       global_companycode= $(''#P220_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P220_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' +',
'	  ''"_paramsP_LOCATION":"'' + $(''#P220_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P220_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P220_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_VSTATUS":"'' +$(''#P220_VSTATUS'').val() + ''",'' +',
'	  ''"_paramsP_JOBTYPE":"'' + $(''#P220_JOBTYPE'').val() + ''",'' + ',
'	  ''"_paramsP_PARTYNAME":"'' +$(''#P220_PARTYNAME'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMGROUP":"'' +$(''#P220_ITEMGROUP'').val() + ''",'' +',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P220_ITEMSPECIFICATION'').val() + ''",'' + ',
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
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
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
 p_id=>wwv_flow_imp.id(533487387673150142)
,p_plug_name=>'Service Bill Pass Register'
,p_static_id=>'service-bill-pass-register'
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
 p_id=>wwv_flow_imp.id(533487482412150143)
,p_plug_name=>'Service Bill Pass Register Report'
,p_static_id=>'service-bill-pass-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select xxx.TNo,',
'       xxx.LocationName,',
'       xxx.JBPassNo,',
'       xxx.JBPassDate,',
'       xxx.PartyName,',
'       xxx.PartyBillNo,',
'       xxx.PartyBillDate,',
'       xxx.JobOrderNo,',
'       xxx.PartyAmount,',
'       xxx.JobTypeCode,',
'       xxx.JobTypeName,',
'       --xxx.UOM1,',
'       xxx.Quantity1,',
'       --xxx.UOM2,',
'       xxx.Quantity2,',
'       xxx.Rate,',
'       xxx.UOM,',
'       xxx.Amount,',
'       xxx.CGST,',
'       xxx.SGST,',
'       xxx.IGST,',
'       xxx.TCS,',
'       xxx.FooterAmount,',
'       (xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)) OtherAmount,',
'       xxx.TotalAmount,',
'       xxx.VoucherNo,',
'       xxx.VoucherDate,',
'       xxx.DebitNoteNo,',
'       --  xxx.DebitNoteDate,',
'       xxx.DebitNoteVoucher,',
'       xxx.DebitNoteVoucherDate,',
'       xxx.Attachment,',
'       xxx.VSTATUS,',
'                 ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||XXX.Tno||'',''||''JobBillPass''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true"'
||' title="Action"></span</span></a>'' AS Print',
'',
'  From (Select xx.TNo,',
'               xx.LocationName,',
'               xx.JBPassNo,',
'               xx.JBPassDate,',
'               xx.PartyName,',
'               xx.PartyBillNo,',
'               xx.PartyBillDate,',
'               xx.JobOrderNo,',
'               xx.PartyAmount,',
'               xx.JobTypeCode,',
'               xx.JobTypename As JobTypeName,',
'               --xx.UOM1,',
'               xx.Quantity1,',
'               --xx.UOM2,',
'               xx.Quantity2,',
'               xx.Rate,',
'               xx.RateMeasuringUnitCode As UOM,',
'               xx.Amount,',
'               Sum(xx.CGST) CGST,',
'               Sum(xx.SGST) SGST,',
'               Sum(xx.IGST) IGST,',
'               Sum(xx.TCS) TCS,',
'               xx.FooterAmount,',
'               xx.TotalAmount,',
'               xx.VoucherNo,',
'               xx.VoucherDate,',
'               xx.DebitNoteNo,',
'               -- xx.DebitNoteDate,',
'               xx.DebitNoteVoucher,',
'               xx.DebitNoteVoucherDate,',
'               xx.Attachment,',
'               xx.VSTATUS',
'          From (Select a.TNo,',
'                       l.LocationName,',
'                       a.JBPassNo,',
'                       a.JBPassDate,',
'                       p.PartyName,',
'                       pb.PartyBillNo,',
'                       pb.PartyBillDate,',
'                       po.JobOrderNo,',
'                       pb.SUMOFAMOUNT As PartyAmount,',
'                       e.JobTypeCode,',
'                       e.JobTypeName,',
'                       --e.MeasuringUnitCode1 As UOM1,',
'                       b.Quantity1,',
'                       --e.MeasuringUnitCode2 As UOM2,',
'                       b.Quantity2,',
'                       b.Rate,',
'                       b.RateMeasuringUnitCode,',
'                       b.Amount,',
'                       nvl(Decode(c.FooterHeadCode, ''.CGST.'', c.FooterValue),',
'                           0) As CGST,',
'                       nvl(Decode(c.FooterHeadCode, ''.SGST.'', c.FooterValue),',
'                           0) As SGST,',
'                       nvl(Decode(c.FooterHeadCode, ''.IGST.'', c.FooterValue),',
'                           0) As IGST,',
'                       nvl(Decode(c.FooterHeadCode, ''.TCS.'', c.FooterValue),',
'                           0) As TCS,',
'                       b.FooterAmount,',
'                       b.TotalAmount,',
'                       vv.VoucherNo,',
'                       vv.VoucherDate,',
'                       (Select Distinct dn.DebitNoteNo',
'                          From DebitNote Dn',
'                         Where dn.ReferenceModuleTNo = A.TNo',
'                           And Rownum = 1) As DebitNoteNo,',
'                       --dn.DebitNoteNo,',
'                       -- dn.DebitNoteDate,',
'                       dv.VoucherNo As DebitNoteVoucher,',
'                       dv.VoucherDate As DebitNoteVoucherDate,',
'                       ''Attachment'' As Attachment,',
'                       nvl(Decode(vv.ModuleTNo, a.TNo, ''PREPARED''), ''PENDING'') As VSTATUS',
'                  From JBPass             a,',
'                       JBPassDetail       b,',
'                       JBPassDetailFooter c,',
'                       Location           l,',
'                       JobBill       pb,',
'                       JobType            e,',
'                       Party              p,',
'                       JobOrder           po,',
'                       /*(Select dn.ReferenceModuleTNo,',
'                             dn.DebitNoteNo,',
'                             dn.DebitNoteDate,',
'                             dd.JobTypeCode,',
'                             dd.ItemSpecificationCode',
'                        From DebitNote dn, DebitNoteDetail dd',
'                       Where dn.TNo = dd.TNo) dn,*/',
'                       (Select V.TNo, v.ModuleTNo, v.VoucherNo, v.VoucherDate',
'                          From Voucher v',
'                         Where v.DocTypeCode = ''JOURNAL'') vv,',
'                       (Select V.TNo, v.ModuleTNo, v.VoucherNo, v.VoucherDate',
'                          From Voucher v',
'                         Where v.DocTypeCode = ''DEBITNOTE'') dv',
'                 Where a.TNo = b.TNo(+)',
'                   And b.TNo = c.TNo(+)',
'                   And b.SNo = c.SNo(+)',
'                   And a.LocationCode = l.LocationCode(+)',
'                   And a.JobBillTNo = pb.TNo(+)',
'                   And b.JobOrderTNo = po.TNo(+)',
'                   And b.JobTypeCode = e.JobTypeCode(+)',
'                   And pb.PartyCode = p.PartyCode(+)',
'                   And a.TNo = vv.ModuleTno(+)',
'                      --And b.TNo = dn.ReferenceModuleTNo(+)',
'                      --And b.JobTypeCode = dn.JobTypeCode(+)',
'                      --And b.ItemSpecificationCode = dn.ItemSpecificationCode(+)',
'                   And a.TNo = dv.ModuleTNo(+)',
'                     and a.JBPassDate between :P220_FROMDATE and :P220_TODATE',
'                     and ( :P220_COMPANY IS NULL OR instr('':''||:P220_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'                     and ( :P220_LOCATION IS NULL OR instr('':''||:P220_LOCATION||'':'','':''||a.locationcode||'':'') > 0 )',
'                         --and instr('':''||:P220_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'                        -- and instr('':''||:P220_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'                         and ( :P220_PARTYNAME IS NULL OR instr('':''||:P220_PARTYNAME||'':'','':''||pb.PartyCode||'':'') > 0 )',
'                         and ( :P220_JobType IS NULL OR instr('':''||:P220_JobType||'':'','':''||e.JobTypeCode||'':'') > 0 )',
'                         and nvl(Decode(vv.ModuleTNo,a.TNo,''PREPARED''),''PENDING'') like nvl(:P220_VSTATUS,''%'')',
'                         and a.JBPassNo like nvl(:P220_JBPassNO,''%'')',
'                ',
'                ) xx',
'         Group By xx.TNo,',
'                  xx.LocationName,',
'                  xx.JBPassNo,',
'                  xx.JBPassDate,',
'                  xx.PartyName,',
'                  xx.PartyBillNo,',
'                  xx.PartyBillDate,',
'                  xx.JobOrderNo,',
'                  xx.PartyAmount,',
'                  xx.JobTypeCode,',
'                  xx.JobTypeName,',
'                  --xx.UOM1,',
'                  xx.Quantity1,',
'                  --xx.UOM2,',
'                  xx.Quantity2,',
'                  xx.Rate,',
'                  xx.RateMeasuringUnitCode,',
'                  xx.Amount,',
'                  xx.FooterAmount,',
'                  xx.TotalAmount,',
'                  xx.VoucherNo,',
'                  xx.VoucherDate,',
'                  xx.DebitNoteNo,',
'                  --xx.DebitNoteDate,',
'                  xx.DebitNoteVoucher,',
'                  xx.DebitNoteVoucherDate,',
'                  xx.Attachment,',
'                  xx.VSTATUS) xxx',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Purchase Bill Pass Register Report'
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
 p_id=>wwv_flow_imp.id(534949183039247577)
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
,p_detail_link=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.::P221_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>95964313839549593
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482608190932101871)
,p_db_column_name=>'AMOUNT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482613330727101874)
,p_db_column_name=>'ATTACHMENT'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'ATTACHMENT'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482608561688101872)
,p_db_column_name=>'CGST'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482612124615101873)
,p_db_column_name=>'DEBITNOTENO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'DEBITNOTE NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#DEBITNOTENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482612549592101874)
,p_db_column_name=>'DEBITNOTEVOUCHER'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'DEBITNOTE VOUCHER'
,p_column_html_expression=>'<div style="display:block; width:150px">#DEBITNOTEVOUCHER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482612955294101874)
,p_db_column_name=>'DEBITNOTEVOUCHERDATE'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'DEBITNOTE VOUCHER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEBITNOTEVOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482610128260101872)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'FOOTER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482609330018101872)
,p_db_column_name=>'IGST'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482432173297456149)
,p_db_column_name=>'JBPASSDATE'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'PASSING DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482432083853456148)
,p_db_column_name=>'JBPASSNO'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'PASSING NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482432289470456150)
,p_db_column_name=>'JOBORDERNO'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'SERVICE ORDER NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482432389492456151)
,p_db_column_name=>'JOBTYPECODE'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'SERVICE TYPE CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482432483994456152)
,p_db_column_name=>'JOBTYPENAME'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'SERVICE TYPE NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482602972178101869)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482610506551101873)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'OTHER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482605704166101870)
,p_db_column_name=>'PARTYAMOUNT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'BILL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482604925042101870)
,p_db_column_name=>'PARTYBILLDATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'PARTY BILL DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482604570162101869)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'PARTY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482604167317101869)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(291365986010173263)
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
 p_id=>wwv_flow_imp.id(482606899365101871)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482602110390101868)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>330
,p_column_identifier=>'AG'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482607386150101871)
,p_db_column_name=>'RATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482608963885101872)
,p_db_column_name=>'SGST'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482609784880101872)
,p_db_column_name=>'TCS'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482602556236101868)
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
 p_id=>wwv_flow_imp.id(482610941953101873)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'TOTAL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482607699309101871)
,p_db_column_name=>'UOM'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482611761857101873)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'VOUCHER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482611382463101873)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:200px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(482613794885101874)
,p_db_column_name=>'VSTATUS'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'VOUCHER STATUS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(534990412424710298)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'239686'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:LOCATIONNAME:JBPASSNO:JBPASSDATE:PARTYNAME:PARTYBILLNO:PARTYBILLDATE:JOBTYPENAME:QUANTITY1:QUANTITY2:RATE:UOM:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:VSTATUS:VOUCHERNO:VOUCHERDATE:DEBITNOTENO:DEBITNOTEVOUCHER'
,p_sort_column_1=>'PARTYNAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PBPASSDATE'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(451584634051315433)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(533487482412150143)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(451797958220649915)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(533487482412150143)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/purchasebillpassregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P220_FROMDATE=&P220_FROMDATE.&P220_TODATE=&P220_TODATE.&P220_PBPASSNO=&P220_PBPASSNO.&P220_VSTATUS=&P220_VSTATUS.&P220_ITEMSPECIFICATION=&P220_ITEMSPECIFICATION.&P220_ITEM=&P220_ITEM.&P220_LOCATION=&P220_LOCATION.&P220_PARTYNAME=&P220_PARTYNAME.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(451584742582315434)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(533487482412150143)
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
 p_id=>wwv_flow_imp.id(451797471837649915)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(533487482412150143)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition=>'1 != 1'
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(612229038302572296)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(533487482412150143)
,p_button_name=>'PDF1'
,p_static_id=>'pdf-2'
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
 p_id=>wwv_flow_imp.id(451784724473649825)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(533487387673150142)
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
 p_id=>wwv_flow_imp.id(452747094907772215)
,p_name=>'P220_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482598378514101929)
,p_name=>'P220_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PBPASS''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;',
''))
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
 p_id=>wwv_flow_imp.id(482599252570101930)
,p_name=>'P220_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_item_default=>'Trunc(Sysdate-7)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
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
 p_id=>wwv_flow_imp.id(482601252360101931)
,p_name=>'P220_ITEMGROUP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482601644919101931)
,p_name=>'P220_ITEMSPECIFICATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482600432470101930)
,p_name=>'P220_JOBTYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.JobTypeName as d,',
'      e.JobTypeCode r',
'From JBPassDetail a, JobType e',
'Where a.JobTypeCode = e.JobTypeCode'))
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
 p_id=>wwv_flow_imp.id(482598833281101930)
,p_name=>'P220_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
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
'  and a.ModuleCode = ''JBPASS''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(482600865725101931)
,p_name=>'P220_PARTYNAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_prompt=>'Partyname'
,p_placeholder=>'Vendor'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      p.PartyName d,',
'      p.PartyCode r',
'From JobBill a, Party p',
'Where a.PartyCode  = p.PartyCode'))
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(451584562842315432)
,p_name=>'P220_TNO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(482599664485101930)
,p_name=>'P220_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
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
 p_id=>wwv_flow_imp.id(482600057675101930)
,p_name=>'P220_VSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(533487387673150142)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:PREPARED;PREPARED,PENDING;PENDING'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Voucher Status--'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(612229144776572297)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(612229038302572296)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(612229214507572298)
,p_event_id=>wwv_flow_imp.id(612229144776572297)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451805084717682785)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451805219608682786)
,p_event_id=>wwv_flow_imp.id(451805084717682785)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(451798859932649919)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(451797471837649915)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(451799323377649922)
,p_event_id=>wwv_flow_imp.id(451798859932649919)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/purchasebillpassregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt'
||'":"1","_paramsP_COMPANY":"&P220_COMPANY.","_paramsP_LOCATION":"&P220_LOCATION.","_paramsP_FROMDATE":"&P220_FROMDATE.","_paramsP_TODATE":"&P220_TODATE.","_paramsP_PARTYNAME":"&P220_PARTYNAME.","_paramsP_ITEM":"&P220_ITEM.","_paramsP_PBSTATUS":"&P220_V'
||'STATUS.","_paramsP_ITEMSPECIFICATION":"&P220_ITEMSPECIFICATION.","_paramsP_PBPASSNO":"&P220_PBPASSNO."}'');',
    '',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(451798549924649917)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P220_PBPASSNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P220_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P220_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>12813680724951933
);
wwv_flow_imp.component_end;
end;
/
