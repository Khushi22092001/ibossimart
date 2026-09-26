prompt --application/pages/page_00151
begin
--   Manifest
--     PAGE: 00151
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
 p_id=>151
,p_name=>'Purchase Bill Pass Register'
,p_alias=>'PURCHASE-BILL-PASS-REGISTER'
,p_step_title=>'Purchase Bill Pass Register'
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
'  var bireporturl = $(''#P151_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/purchasebillpassregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P151_FROMDATE'').val());',
'  var toDate = new Date($(''#P151_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P151_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P151_COMPANY'').val() ==="" || $(''#P151_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P151_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P151_COMPANY'').val();',
'       global_companycode= $(''#P151_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +     ',
'      ''&P_LOCATION='' + $(''#P151_LOCATION'').val() +  ',
'      ''&P_FROMDATE='' +$(''#P151_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P151_TODATE'').val() + ',
'      ''&P_VSTATUS='' +$(''#P151_VSTATUS'').val() +',
'      ''&P_ITEM='' +$(''#P151_ITEM'').val() +',
'      ''&P_PARTYNAME='' + $(''#P151_PARTYNAME'').val() +',
'      ''&P_ITEMGROUP='' +$(''#P151_ITEMGROUP'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P151_ITEMSPECIFICATION'').val() +',
'      ''&GLOBAL_COMPANYCODE='' +global_companycode',
'        ',
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
'  var bireporturl = $(''#P151_BIREPORTURL'').val()',
'  var reportName =  ''purchasebillpassregister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P151_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P151_COMPANY'').val() ==="" || $(''#P151_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P151_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P151_COMPANY'').val();',
'       global_companycode= $(''#P151_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P151_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P151_LOCATION'').val() + ''",'' +  ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P151_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P151_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_VSTATUS":"'' + $(''#P151_VSTATUS'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P151_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_PARTYNAME":"'' +$(''#P151_PARTYNAME'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMGROUP":"'' + $(''#P151_ITEMGROUP'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P151_ITEMSPECIFICATION'').val() + ''",'' +',
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
'}',
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
 p_id=>wwv_flow_imp.id(513919018895235686)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--noBorder:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'Y',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(513919113634235687)
,p_plug_name=>'Purchase Bill Pass Register Report'
,p_static_id=>'purchase-bill-pass-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select  NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),xxx.TNO),''STATUS'') AS Status ,',
'              xxx.TNo,',
'              ',
'              xxx.LocationName,',
'              xxx.PBPassNo,',
'              xxx.PBPassDate,',
'              xxx.PartyName,',
'              xxx.PartyBillNo,',
'              xxx.PartyBillDate,',
'              xxx.PurchaseOrderNo,',
'              xxx.PartyAmount,',
'              xxx.ItemCode,',
'              xxx.Item,',
'              xxx.UOM1,',
'              round(xxx.Quantity1,3) as Quantity1,',
'              xxx.UOM2,',
'              round(xxx.Quantity2,3) as Quantity2,',
'              xxx.Rate,',
'              xxx.UOM,',
'              round(xxx.Amount,2) as Amount,',
'              xxx.CGST,',
'              xxx.SGST,',
'              xxx.Creator,',
'              xxx.IGST,',
'              xxx.TCS,',
'              round(xxx.FooterAmount,2) as FooterAmount,',
'              round((xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)),2) as OtherAmount,',
'              round(xxx.TotalAmount,2) as TotalAmount,',
'              xxx.VoucherNo,',
'              xxx.VoucherDate,',
'              xxx.DebitNoteNo,',
'              xxx.DebitNoteVoucher,',
'              xxx.DebitNoteVoucherDate,',
'              xxx.VSTATUS,',
'                        ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||XXX.Tno||'',''||''PurchaseBillPass1''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-'
||'hidden="true" title="Action"></span</span></a>'' AS Print,',
'              xxx.TDSDEDUCTABLEAMOUNT,',
'              xxx.SUMOFTDSAMOUNT,',
'              xxx.NETPAYABLEAMOUNT',
'',
'From (',
'Select',
'              xx.TNo,',
'              xx.LocationName,',
'              xx.PBPassNo,',
'              xx.PBPassDate,',
'              xx.PartyName,',
'              xx.PartyBillNo,',
'              xx.PartyBillDate,',
'              xx.PurchaseOrderNo,',
'              xx.PartyAmount,',
'              xx.ItemCode,',
'              xx.ItemName||'' ~ ''||xx.ItemSpecificationName as Item,',
'              xx.UOM1,',
'              xx.Quantity1,',
'              xx.UOM2,',
'              xx.Quantity2,',
'              xx.Rate,',
'              xx.RateMeasuringUnitCode as UOM,',
'              xx.Amount,',
'              sum(xx.CGST) CGST,',
'              sum(xx.SGST) SGST,',
'              sum(xx.IGST) IGST,',
'              sum(xx.TCS) TCS,',
'              xx.FooterAmount,',
'              xx.TotalAmount,',
'              xx.VoucherNo,',
'              xx.VoucherDate,',
'              xx.DebitNoteNo,',
'              xx.DebitNoteVoucher,',
'              xx.DebitNoteVoucherDate,',
'              xx.VSTATUS,',
'              xx.creator,',
'              Case When ROW_NUMBER()',
'              Over(Partition By xx.Tno Order  By xx.Tno) = 1 Then',
'              xx.TDSDEDUCTABLEAMOUNT Else  Null End TDSDEDUCTABLEAMOUNT,',
'              Case When ROW_NUMBER()',
'              Over(Partition By xx.Tno Order  By xx.Tno) = 1 Then',
'              xx.SUMOFTDSAMOUNT Else  Null End SUMOFTDSAMOUNT,',
'              Case When ROW_NUMBER()',
'              Over(Partition By xx.Tno Order  By xx.Tno) = 1 Then',
'              xx.NETPAYABLEAMOUNT Else  Null End NETPAYABLEAMOUNT',
'From (',
'        Select a.TNo,',
'                       l.LocationName,',
'                       a.PBPassNo,',
'                       a.PBPassDate,',
'                       p.PartyName,',
'                       pb.PartyBillNo,',
'                       pb.PartyBillDate,',
'                       po.PurchaseOrderNo,',
'                       pb.SUMOFAMOUNT As PartyAmount,',
'                       e.ItemCode,',
'                       e.ItemName,',
'                       ee.ItemSpecificationName,',
'                       e.MeasuringUnitCode1 As UOM1,',
'                       Case When  e.ItemNatureCode != ''SERVICES'' then b.Quantity1 ',
'                      end as Quantity1,',
'                       e.MeasuringUnitCode2 As UOM2,',
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
'                       a.Creator,',
'                       (Select Distinct dn.DebitNoteNo',
'                          From DebitNote Dn',
'                         Where dn.ReferenceModuleTNo = A.TNo',
'                           And Rownum = 1) As DebitNoteNo,',
'                       --dn.DebitNoteNo,',
'                       -- dn.DebitNoteDate,',
'                       dv.VoucherNo As DebitNoteVoucher,',
'                       dv.VoucherDate As DebitNoteVoucherDate,',
'                       nvl(Decode(vv.ModuleTNo, a.TNo, ''PREPARED''), ''PENDING'') As VSTATUS,',
'                       nvl(a.TDSDEDUCTABLEAMOUNT,0) TDSDEDUCTABLEAMOUNT,',
'                        nvl(a.SUMOFTDSAMOUNT,0) SUMOFTDSAMOUNT,',
'                        --nvl(a.PBPASSAMOUNT,0) - nvl(a.PAIDINADVANCE,0) as NETPAYABLEAMOUNT',
'                        nvl(a.amountaftertds,0) as NETPAYABLEAMOUNT',
'                  From PBPass             a,',
'                       PBPassDetail       b,',
'                       PBPassDetailFooter c,',
'                       Location           l,',
'                       PurchaseBill       pb,',
'                       Item               e,',
'                       ItemSpecification  ee,',
'                       Party              p,',
'                       PurchaseOrder      po,',
'                       /*(Select dn.ReferenceModuleTNo,',
'                             dn.DebitNoteNo,',
'                             dn.DebitNoteDate,',
'                             dd.itemCode,',
'                             dd.ItemSpecificationCode',
'                        From DebitNote dn, DebitNoteDetail dd',
'                       Where dn.TNo = dd.TNo) dn,*/',
'                       (Select V.TNo, v.ModuleTNo, v.VoucherNo, v.VoucherDate',
'                          From Voucher v',
'                         Where v.DocTypeCode = ''PURCHASE'') vv,',
'                       (Select V.TNo, v.ModuleTNo, v.VoucherNo, v.VoucherDate',
'                          From Voucher v',
'                         Where v.DocTypeCode = ''DEBITNOTE'') dv',
'                 Where a.TNo = b.TNo(+)',
'                   And b.TNo = c.TNo(+)',
'                   And b.SNo = c.SNo(+)',
'                   And a.LocationCode = l.LocationCode(+)',
'                   And a.PurchaseBillTNo = pb.TNo(+)',
'                   And b.PurchaseOrderTNo = po.TNo(+)',
'                   And b.ItemCode = e.ItemCode(+)',
'                   And b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'                   And pb.PartyCode = p.PartyCode(+)',
'                   And a.TNo = vv.ModuleTno(+)',
'                      --And b.TNo = dn.ReferenceModuleTNo(+)',
'                      --And b.ItemCode = dn.ItemCode(+)',
'                      --And b.ItemSpecificationCode = dn.ItemSpecificationCode(+)',
'                   And a.TNo = dv.ModuleTNo(+)',
'          and a.PBPassDate between :P151_FROMDATE and :P151_TODATE',
'          and ( :P151_COMPANY is null or instr('':''||:P151_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'          and ( :P151_LOCATION is null or instr('':''||:P151_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'          and ( :P151_PARTYNAME IS NULL OR instr('':''||:P151_PARTYNAME||'':'','':''||pb.PartyCode||'':'') > 0 )',
'          and ( :P151_ITEM IS NULL OR instr('':''||:P151_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'          and ( :P151_ITEMSPECIFICATION IS NULL OR instr('':''||:P151_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'          and nvl(Decode(vv.ModuleTNo,a.TNo,''PREPARED''),''PENDING'') like nvl(:P151_VSTATUS,''%'')',
'          -- added on 20-may-2024 Previleage',
'         and getlocationprivilege(a.locationcode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
'         AND getdoctypeprivilege(a.doctypecode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
'          ',
'         and ( :P151_ITEMGROUP IS NULL',
'                or',
'                exists (select 1 from (Select ITEMCODE,',
'                        parentcode,',
'                        RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'                        Level,',
'                        CONNECT_BY_ROOT itemcode As root_id,',
'                        ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'                        CONNECT_BY_ISLEAF As leaf',
'                    From item a',
'                    Start With parentcode in ( select itemcode from item xx where',
'                                                instr('':''||:P151_ITEMGROUP||'':'','':''||xx.ItemCode||'':'') > 0)',
'                                                ',
'                    Connect By parentcode = Prior itemcode',
'                    Order Siblings By itemcode) x where x.itemcode = e.itemcode',
'                    )',
'            )',
' )xx',
'Group By ',
'              xx.TNo,',
'              xx.LocationName,',
'              xx.PBPassNo,',
'              xx.PBPassDate,',
'              xx.PartyName,',
'              xx.PartyBillNo,',
'              xx.PartyBillDate,',
'              xx.PurchaseOrderNo,',
'              xx.PartyAmount,',
'              xx.ItemCode,',
'              xx.ItemName||'' ~ ''||xx.ItemSpecificationName,',
'              xx.UOM1,',
'              xx.Quantity1,',
'              xx.UOM2,',
'              xx.Quantity2,',
'              xx.Rate,',
'              xx.RateMeasuringUnitCode,',
'              xx.Amount,',
'              xx.FooterAmount,',
'              xx.TotalAmount,',
'              xx.VoucherNo,',
'              xx.VoucherDate,',
'              xx.DebitNoteNo,',
'              --xx.DebitNoteDate,',
'              xx.DebitNoteVoucher,',
'              xx.DebitNoteVoucherDate,',
'              xx.VSTATUS,',
'              xx.Creator,',
'               xx.TDSDEDUCTABLEAMOUNT,',
'              xx.SUMOFTDSAMOUNT,',
'              xx.NETPAYABLEAMOUNT',
')xxx              '))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P151_COMPANY,P151_LOCATION,P151_FROMDATE,P151_TODATE,P151_VSTATUS,P151_ITEM,P151_PARTYNAME,P151_ITEMGROUP,P151_ITEMSPECIFICATION'
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
 p_id=>wwv_flow_imp.id(515380814261333121)
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
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.::P152_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>66915741230168773
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467357171987396758)
,p_db_column_name=>'AMOUNT'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467357613971396759)
,p_db_column_name=>'CGST'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(43376173612292109)
,p_db_column_name=>'CREATOR'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467361223569396760)
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
 p_id=>wwv_flow_imp.id(467361977154396761)
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
 p_id=>wwv_flow_imp.id(467362349678396761)
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
 p_id=>wwv_flow_imp.id(467359219008396759)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'FOOTER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467358382675396759)
,p_db_column_name=>'IGST'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467355626858396758)
,p_db_column_name=>'ITEM'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:300px">#ITEM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467355169943396757)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467352115493396756)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205572307290828913)
,p_db_column_name=>'NETPAYABLEAMOUNT'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'Net Payable Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467359616972396760)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'OTHER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467354783248396757)
,p_db_column_name=>'PARTYAMOUNT'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'BILL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467354081483396757)
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
 p_id=>wwv_flow_imp.id(467353664493396757)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'PARTY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467353269070396756)
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
 p_id=>wwv_flow_imp.id(467352863557396756)
,p_db_column_name=>'PBPASSDATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'PBPASS DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PBPASSDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467352501920396756)
,p_db_column_name=>'PBPASSNO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'PBPASS NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#PBPASSNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(300846170939639626)
,p_db_column_name=>'PRINT'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467354372515396757)
,p_db_column_name=>'PURCHASEORDERNO'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'PURCHASE ORDER NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#PURCHASEORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467356033321396758)
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
 p_id=>wwv_flow_imp.id(467297564769273813)
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
 p_id=>wwv_flow_imp.id(467356394991396758)
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
 p_id=>wwv_flow_imp.id(467358032493396759)
,p_db_column_name=>'SGST'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(196682779289609922)
,p_db_column_name=>'STATUS'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205572207751828912)
,p_db_column_name=>'SUMOFTDSAMOUNT'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'Sum Of TDS Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467358774474396759)
,p_db_column_name=>'TCS'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205572048344828911)
,p_db_column_name=>'TDSDEDUCTABLEAMOUNT'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'TDS Deductable Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467351680754396755)
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
 p_id=>wwv_flow_imp.id(467359960671396760)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'TOTAL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467356800771396758)
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
 p_id=>wwv_flow_imp.id(467297339834273811)
,p_db_column_name=>'UOM1'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467297467228273812)
,p_db_column_name=>'UOM2'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467360830136396760)
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
 p_id=>wwv_flow_imp.id(467360350794396760)
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
 p_id=>wwv_flow_imp.id(467363145895396761)
,p_db_column_name=>'VSTATUS'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'VOUCHER STATUS'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(515422043646795842)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'43355'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:STATUS:LOCATIONNAME:PBPASSNO:PBPASSDATE:PARTYNAME:PARTYBILLNO:PARTYBILLDATE:PURCHASEORDERNO:ITEMCODE:ITEM:UOM1:QUANTITY1:UOM2:QUANTITY2:RATE:UOM:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:TDSDEDUCTABLEAMOUNT:SUMOFTDSAMOUNT:NETPAYABLEAMOU'
||'NT:VSTATUS:VOUCHERNO:VOUCHERDATE:DEBITNOTENO:DEBITNOTEVOUCHER'
,p_sort_column_1=>'PBPASSDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PARTYNAME'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:TDSDEDUCTABLEAMOUNT:SUMOFTDSAMOUNT:NETPAYABLEAMOUNT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(455396496873083574)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(513919113634235687)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(456181007785387642)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(513919113634235687)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/purchasebillpassregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P151_FROMDATE=&P151_FROMDATE.&P151_TODATE=&P151_TODATE.&P151_PBPASSNO=&P151_PBPASSNO.&P151_VSTATUS=&P151_VSTATUS.&P151_ITEMSPECIFICATION=&P151_ITEMSPECIFICATION.&P151_ITEM=&P151_ITEM.&P151_LOCATION=&P151_LOCATION.&P151_PARTYNAME=&P151_PARTYNAME.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(456536112630327964)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(513919113634235687)
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
 p_id=>wwv_flow_imp.id(456180622160387641)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(513919113634235687)
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
 p_id=>wwv_flow_imp.id(456167335456387533)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_static_id=>'REFRESH'
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
 p_id=>wwv_flow_imp.id(456448960877147205)
,p_name=>'P151_BIREPORTURL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467298321767273813)
,p_name=>'P151_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
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
 p_id=>wwv_flow_imp.id(467349215816396756)
,p_name=>'P151_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_item_default=>'select sysdate-3 from dual'
,p_item_default_type=>'SQL_QUERY'
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
 p_id=>wwv_flow_imp.id(467351195856396757)
,p_name=>'P151_ITEM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.itemCode||'' )'' as d,',
'      e.ItemCode r',
'From PBPassDetail a, Item e',
'Where a.ItemCode = e.ItemCode'))
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
 p_id=>wwv_flow_imp.id(480890210968509134)
,p_name=>'P151_ITEMGROUP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467352032838396757)
,p_name=>'P151_ITEMSPECIFICATION'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
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
'Where e.ItemCode = :P151_ITEM',
'  and e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P151_ITEM'
,p_ajax_items_to_submit=>'P151_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(467350019318396756)
,p_name=>'P151_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
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
'  and a.ModuleCode = ''PBPASS''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';',
''))
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
 p_id=>wwv_flow_imp.id(467350388952396757)
,p_name=>'P151_PARTYNAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      p.PartyName d,',
'      p.PartyCode r',
'From PurchaseBill a, Party p',
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
 p_id=>wwv_flow_imp.id(469966544139257684)
,p_name=>'P151_PBPASSNO'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(456537057746327973)
,p_name=>'P151_TNO'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(467349594846396756)
,p_name=>'P151_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
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
 p_id=>wwv_flow_imp.id(467350805133396757)
,p_name=>'P151_VSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(513919018895235686)
,p_prompt=>'Voucher Status'
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
 p_id=>wwv_flow_imp.id(218883584001152080)
,p_name=>'click refresh'
,p_static_id=>'click-refresh'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(218883685219152081)
,p_event_id=>wwv_flow_imp.id(218883584001152080)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '//alert(''fired'');  ',
    'var button = document.getElementById(''REFRESH'');',
    '')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(456181998924387642)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(456180622160387641)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(456182545718387645)
,p_event_id=>wwv_flow_imp.id(456181998924387642)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(455396340843083572)
,p_name=>'Hide Nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(455396458968083573)
,p_event_id=>wwv_flow_imp.id(455396340843083572)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(200382835057418629)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>40
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(200383264317418629)
,p_event_id=>wwv_flow_imp.id(200382835057418629)
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
 p_id=>wwv_flow_imp.id(218883728111152082)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(456167335456387533)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(218883830614152083)
,p_event_id=>wwv_flow_imp.id(218883728111152082)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(513919113634235687)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(456181579834387642)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P151_PBPASSNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P151_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P151_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_internal_uid=>7716506803223294
);
wwv_flow_imp.component_end;
end;
/
