prompt --application/pages/page_00142
begin
--   Manifest
--     PAGE: 00142
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
 p_id=>142
,p_name=>'Purchase Bill Register'
,p_alias=>'PURCHASE-BILL-REGISTER'
,p_step_title=>'Purchase Bill Register'
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
'  var bireporturl = $(''#P142_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/PurchaseBillRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P142_FROMDATE'').val());',
'  var toDate = new Date($(''#P142_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P142_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P142_COMPANY'').val() ==="" || $(''#P142_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P142_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P142_COMPANY'').val();',
'       global_companycode= $(''#P142_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +     ',
'      ''&P_LOCATION='' + $(''#P142_LOCATION'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P142_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P142_TODATE'').val() + ',
'      ''&P_PBPSTATUS='' +$(''#P142_PBPSTATUS'').val() +',
'      ''&P_PARTY='' +$(''#P142_PARTY'').val() +',
'      ''&P_ITEM='' +$(''#P142_ITEM'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P142_ITEMSPECIFICATION'').val() +',
'       ''&GLOBAL_COMPANYCODE='' +global_companycode ',
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
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P142_BIREPORTURL'').val()',
'  var reportName =  ''PurchaseBillRegister.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P142_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P142_COMPANY'').val() ==="" || $(''#P142_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P142_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P142_COMPANY'').val();',
'       global_companycode= $(''#P142_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P142_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'      ''"_paramsP_COMPANY":"''+ companycode + ''",'' + ',
'	  ''"_paramsP_LOCATION":"'' + $(''#P142_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P142_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P142_TODATE'').val() + ''",'' + ',
'	  ''"_paramsP_PBSTATUS":"'' + $(''#P142_PBSTATUS'').val() + ''",'' + ',
'	  ''"_paramsP_PARTY":"'' + $(''#P142_PARTY'').val() + ''",'' + ',
'	  ''"_paramsP_ITEM":"'' + $(''#P142_ITEM'').val() + ''",'' + ',
'	  ''"_paramsP_ITEMSPECIFICATION":"'' + $(''#P142_ITEMSPECIFICATION'').val() + ''",'' + ',
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
'  --a-treeview-node-font-size: 1.00rem !important;',
'  ',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(476809456542715590)
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
 p_id=>wwv_flow_imp.id(476809551281715591)
,p_plug_name=>'Purchase Bill Register Report'
,p_static_id=>'purchase-bill-register-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select   NVL(getdocumentstatuscode(GetModuleCodeForPageNo(:APP_PAGE_ID),xxx.TNO),''STATUS'') AS Status ,',
'          xxx.TNo,',
'          xxx.SNo,',
'          xxx.LocationName,',
'          xxx.PurchaseBillNo,',
'          xxx.PurchaseBillDate,',
'          xxx.Vendor,',
'          xxx.PartyBillNo,',
'          xxx.partyBillDate,',
'          xxx.ItemCode,',
'          xxx.Item,',
'          xxx.UOM1,',
'          round(xxx.Quantity1,3) as Quantity1,',
'          xxx.UOM2,',
'          round(xxx.Quantity2,3) as Quantity2,',
'          xxx.Rate,',
'          xxx.UOM,',
'          round(xxx.Amount,2) as Amount,',
'          xxx.CGST,',
'          xxx.SGST,',
'          xxx.IGST,',
'          xxx.TCS,',
'          round(xxx.FooterAmount,2) as FooterAmount,',
'          round((xxx.FooterAmount - (xxx.CGST + xxx.SGST + xxx.IGST + xxx.TCS)),2) as OtherAmount,',
'          round(xxx.TotalAmount,2) as TotalAmount,',
'          xxx.PBPASS_STATUS,',
'          xxx.PBPassNo,',
'          xxx.PBPassDate,',
'		    xxx.locationcode,',
'		    xxx.vendoraddress,',
'          (SELECT SUM(footerpercent)',
'                  FROM Purchasebilldetailfooter',
'                 WHERE tno = xxx.tno',
'                   AND sno = xxx.sno',
'                   AND footerheadcode IN (''.CGST.'', ''.SGST.'', ''.IGST.'')',
'          ) as footerpercent,',
'		  xxx.hsncode,',
'          xxx.creator,',
'          xxx.creationtime,',
'          xxx.purchaseordertno',
'',
'        From (Select',
'                      xx.TNo,',
'                      xx.SNo,',
'                      xx.LocationName,',
'                      xx.PurchaseBillNo,',
'                      xx.PurchaseBillDate,',
'                      xx.Vendor,',
'                      xx.PartyBillNo,',
'                      xx.partyBillDate,',
'                      xx.ItemCode,',
'                      xx.Item,',
'                      xx.UOM1,',
'                      xx.Quantity1,',
'                      xx.UOM2,',
'                      xx.Quantity2,',
'                      xx.Rate,',
'                      xx.RateMeasuringUnitCode UOM,',
'                      xx.Amount,',
'                      sum(xx.CGST) CGST,',
'                      sum(xx.SGST) SGST,',
'                      sum(xx.IGST) IGST,',
'                      sum(xx.TCS) TCS,',
'                      xx.FooterAmount,',
'                      xx.TotalAmount,',
'                      xx.PBPASS_STATUS,',
'                      xx.PBPassNo,',
'                      xx.PBPassDate,',
'					  xx.locationcode,',
'					  xx.vendoraddress,',
'					  max(xx.footerpercent) as footerpercent,',
'					  xx.hsncode,',
'                      xx.creator,',
'                      xx.creationtime,',
'                      xx.purchaseordertno',
'              From (Select',
'                      a.TNo,',
'                      b.SNo,',
'					  a.locationcode,',
'                      l.LocationName,',
'                      a.PurchaseBillNo,',
'                      a.PurchaseBillDate,',
'                      p.PartyName as Vendor,',
'					  (p.officeaddress ||',
'                      decode(p.officeaddress2, NULL, NULL, '','' || p.officeaddress2) ||',
'                       decode(p.officeaddress3, NULL, NULL, '','' || p.officeaddress3) ||',
'                       decode(p.officeaddress4, NULL, NULL, '','' || p.officeaddress4) ||',
'                       decode(p.officecitycode,',
'                               NULL,',
'                               NULL,',
'                               '','' || getcityname(p.officecitycode)) ||',
'                       decode(p.officestatecode,',
'                               NULL,',
'                               NULL,',
'                               '','' || getstatename(p.officestatecode)) ||',
'                       decode(p.officepincode,',
'                               NULL,',
'                               NULL,',
'                               '', PIN CODE -'' || p.officepincode)',
'',
'                       ) as vendoraddress,',
'                      a.PartyBillNo,',
'                      a.partyBillDate,',
'                      e.ItemCode,',
'                      e.ItemName||'' ~ ''||ee.ItemSpecificationName as Item,',
'					  ee.hsncode,',
'                      e.MeasuringUnitCode1 as UOM1,',
'                      Case When  e.ItemClassificationCode != ''SERVICE'' then b.Quantity1 ',
'                      end as Quantity1,',
'                      e.MeasuringUnitCode2 as UOM2,',
'                      Case When  e.ItemClassificationCode != ''SERVICE'' then b.Quantity2 ',
'                      end as Quantity2,',
'                      b.Rate,',
'                      b.RateMeasuringUnitCode,',
'                      b.Amount,',
'					  c.footerpercent,',
'                      nvl(Decode(c.FooterHeadCode,''.CGST.'', c.FooterValue),0) as CGST,',
'                      nvl(Decode(c.FooterHeadCode,''.SGST.'', c.FooterValue),0) as SGST,',
'                      nvl(Decode(c.FooterHeadCode,''.IGST.'', c.FooterValue),0) as IGST,',
'                      nvl(Decode(c.FooterHeadCode,''.TCS.'', c.FooterValue),0) as TCS,',
'                      b.FooterAmount,',
'                      b.TotalAmount,',
'                      nvl(Decode(pbp.PurchaseBillTNo,a.TNo,''PREPARED''),''PENDING'') as PBPASS_STATUS,',
'                      pbp.PBPassNo,',
'                      pbp.PBPassDate,',
'                      a.creator,',
'                      a.creationtime,',
'                      GetPurchaseorderNo(a.purchaseordertno) as purchaseordertno',
'                From  PurchaseBill a, PurchaseBillDetail b, PurchaseBillDetailFooter c, Location l, Item e, ItemSpecification ee, Party p, PurchaseOrder po, PBPass pbp',
'                Where a.TNo = b.TNo',
'                  and b.TNo = c.TNO(+)',
'                  and b.SNo = c.SNo(+)',
'                  and a.LocationCode = l.LocationCode',
'                  and b.ItemCode = e.ItemCode(+)',
'                  and b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'                  and a.PartyCode = p.PartyCode(+)',
'                  and a.PurchaseOrderTNo = po.TNo(+)',
'                  and a.PurchaseBillDate between :P142_FROMDATE and :P142_TODATE',
'                  and ( :P142_COMPANY is null or instr('':''||:P142_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'                  and ( :P142_LOCATION is null or instr('':''||:P142_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'                  and ( :P142_PARTY IS NULL OR instr('':''||:P142_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'                  and ( :P142_ITEM IS NULL OR instr('':''||:P142_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'                  and ( :P142_ITEMSPECIFICATION IS NULL OR instr('':''||:P142_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'                  and nvl(Decode(pbp.PurchaseBillTNo,a.TNo,''PREPARED''),''PENDING'') like nvl(:P142_PBPSTATUS,''%'')',
'                  and a.TNo = pbp.PurchaseBillTNo(+)',
'                  and a.PurchaseBillNo like nvl(:P142_PBNO,''%'')',
'                 -- and ( :P142_ITEMGROUP IS NULL OR instr('':''||:P142_ITEMGROUP||'':'','':''||e.ParentCode||'':'') > 0 )       ',
'                 ',
'                 and getlocationprivilege(a.locationcode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
'                 AND getdoctypeprivilege(a.doctypecode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES''               ',
'                  ',
'                    )xx  ',
'                Group By',
'                       xx.TNo,',
'                       xx.SNo,',
'                       xx.LocationName,',
'                       xx.PurchaseBillNo,',
'                       xx.PurchaseBillDate,',
'                       xx.Vendor,',
'                       xx.PartyBillNo,',
'                       xx.partyBillDate,',
'                       xx.ItemCode,',
'                       xx.Item,',
'                       xx.UOM1,',
'                       xx.Quantity1,',
'                       xx.UOM2,',
'                       xx.Quantity2,',
'                       xx.Rate,',
'                       xx.RateMeasuringUnitCode,',
'                       xx.FooterAmount,',
'                       xx.Amount,',
'                       xx.TotalAmount,',
'                       xx.PBPASS_STATUS,',
'                       xx.PBPassNo,',
'                       xx.PBPassDate,',
'					  xx.locationcode,',
'					  xx.vendoraddress,',
'					  xx.hsncode,',
'                      xx.creator,',
'                      xx.creationtime,',
'                      xx.purchaseordertno',
'                )xxx'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Purchase Bill Register Report'
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
 p_id=>wwv_flow_imp.id(495300155774231493)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_show_nulls_as=>'0'
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
,p_detail_link=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.:143:P143_TNO,P143_FORMSTATUS:#TNO#,EDITRECORD'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>63856776383236259
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450235647098053416)
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
 p_id=>wwv_flow_imp.id(450238856414053418)
,p_db_column_name=>'CGST'
,p_display_order=>250
,p_column_identifier=>'Z'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454974766609012935)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>380
,p_column_identifier=>'AM'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454008037409680784)
,p_db_column_name=>'CREATOR'
,p_display_order=>370
,p_column_identifier=>'AL'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450236052579053416)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'FOOTER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450241690667053420)
,p_db_column_name=>'FOOTERPERCENT'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'TAX PERCENT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450242070938053420)
,p_db_column_name=>'HSNCODE'
,p_display_order=>330
,p_column_identifier=>'AH'
,p_column_label=>'HSN CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450239667894053419)
,p_db_column_name=>'IGST'
,p_display_order=>270
,p_column_identifier=>'AB'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450238042414053418)
,p_db_column_name=>'ITEM'
,p_display_order=>230
,p_column_identifier=>'X'
,p_column_label=>'MATERIAL DESCRIPTION'
,p_column_html_expression=>'<div style="display:block; width:300px">#ITEM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450234405018053415)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450240794953053419)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>300
,p_column_identifier=>'AE'
,p_column_label=>'LOCATION CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450232020485053414)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450240458270053419)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>290
,p_column_identifier=>'AD'
,p_column_label=>'OTHER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450234090672053415)
,p_db_column_name=>'PARTYBILLDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'PARTY BILL DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450233692910053415)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'PARTY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450237635222053417)
,p_db_column_name=>'PBPASSDATE'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'PBPASS DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PBPASSDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450237249054053417)
,p_db_column_name=>'PBPASSNO'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'PBPASS NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#PBPASSNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450236876684053416)
,p_db_column_name=>'PBPASS_STATUS'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'PBPASS STATUS'
,p_column_html_expression=>'<div style="display:block; width:80px">#PBPASS_STATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450232881348053414)
,p_db_column_name=>'PURCHASEBILLDATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'PURCHASE BILL DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PURCHASEBILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450232416358053414)
,p_db_column_name=>'PURCHASEBILLNO'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'PURCHASE BILL NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#PURCHASEBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454974799231012936)
,p_db_column_name=>'PURCHASEORDERTNO'
,p_display_order=>390
,p_column_identifier=>'AN'
,p_column_label=>'Purchase Order No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450234855659053415)
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
 p_id=>wwv_flow_imp.id(450249413982055123)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>360
,p_column_identifier=>'AK'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450235266820053416)
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
 p_id=>wwv_flow_imp.id(450239237415053418)
,p_db_column_name=>'SGST'
,p_display_order=>260
,p_column_identifier=>'AA'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450231625673053414)
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
 p_id=>wwv_flow_imp.id(179660990655440807)
,p_db_column_name=>'STATUS'
,p_display_order=>400
,p_column_identifier=>'AO'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450240017586053419)
,p_db_column_name=>'TCS'
,p_display_order=>280
,p_column_identifier=>'AC'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450231279928053411)
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
 p_id=>wwv_flow_imp.id(450236450638053416)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'TOTAL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450238449049053418)
,p_db_column_name=>'UOM'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'UOM'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450249241827055121)
,p_db_column_name=>'UOM1'
,p_display_order=>340
,p_column_identifier=>'AI'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450249353771055122)
,p_db_column_name=>'UOM2'
,p_display_order=>350
,p_column_identifier=>'AJ'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450233257144053415)
,p_db_column_name=>'VENDOR'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:200px">#VENDOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(450241256859053420)
,p_db_column_name=>'VENDORADDRESS'
,p_display_order=>310
,p_column_identifier=>'AF'
,p_column_label=>'VENDOR ADDRESS'
,p_column_html_expression=>'<div style="display:block; width:300px">#VENDORADDRESS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(495321815373240993)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'42621'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STATUS:LOCATIONNAME:VENDOR:PURCHASEBILLDATE:PURCHASEBILLNO:PARTYBILLNO:PARTYBILLDATE:PURCHASEORDERTNO:HSNCODE:ITEMCODE:ITEM:UOM1:QUANTITY1:UOM2:QUANTITY2:RATE:UOM:AMOUNT:FOOTERPERCENT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:PBPASS_STATUS:PBPASSNO:'
||'PBPASSDATE:CREATOR:CREATIONTIME'
,p_sort_column_1=>'PURCHASEBILLDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'VENDOR'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:CGST:SGST:IGST:OTHERAMOUNT:TOTALAMOUNT:TCS:AMOUNT:QUANTITY2'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439140647596180149)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(476809551281715591)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.:143:P143_FORMSTATUS:NEWRECORD'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439132997947168913)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(476809551281715591)
,p_button_name=>'CUSTOM'
,p_static_id=>'custom'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_image_alt=>'Custom'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'http://15.207.2.208:9704/xmlpserver/PRA/purchasebillregister.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&P142_FROMDATE=&P142_FROMDATE.&P142_TODATE=&P142_TODATE.&P142_PBPSTATUS=&P142_PBPSTATUS.&P142_ITEMSPECIFICATION=&P142_ITEMSPECIFICATION.&P142_ITEM=&P142_ITEM.&P142_LOCATION=&P142_LOCATION.&P142_PARTY=&P142_PARTY.&P142_PBNO=&P142_PBNO.'
,p_button_condition=>'1'
,p_button_condition2=>'1'
,p_button_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_icon_css_classes=>'fa-file-excel-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(439140286168179135)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(476809551281715591)
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
 p_id=>wwv_flow_imp.id(439132673988168913)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(476809551281715591)
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
 p_id=>wwv_flow_imp.id(439119671522168846)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(476809456542715590)
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
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(438244081569653775)
,p_name=>'P142_BIREPORTURL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(456772829520227599)
,p_name=>'P142_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PURCHASEBILL''',
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
 p_id=>wwv_flow_imp.id(450228409361053406)
,p_name=>'P142_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
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
 p_id=>wwv_flow_imp.id(450230407895053409)
,p_name=>'P142_ITEM'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From PurchaseBillDetail a, Item e',
'Where a.ItemCode = e.ItemCode'))
,p_cSize=>74
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(450231572392053409)
,p_name=>'P142_ITEMSPECIFICATION'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
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
'Where e.ItemCode = :P142_ITEM',
'  and e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P142_ITEM'
,p_ajax_items_to_submit=>'P142_ITEMSPECIFICATION'
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
 p_id=>wwv_flow_imp.id(450229177373053408)
,p_name=>'P142_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
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
'  and a.ModuleCode = ''PURCHASEBILL''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(450229578138053408)
,p_name=>'P142_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From PurchaseBill a, Party p',
'Where a.PartyCode = p.PartyCode'))
,p_cSize=>46
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(450229988588053408)
,p_name=>'P142_PBPSTATUS'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
,p_prompt=>'PBP Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:PREPARED;PREPARED,PENDING;PENDING'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select PBPass Status--'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(439817132591540383)
,p_name=>'P142_TNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(450228789501053407)
,p_name=>'P142_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(476809456542715590)
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
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(439134007923168916)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(439132673988168913)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(439134525615168917)
,p_event_id=>wwv_flow_imp.id(439134007923168916)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/purchasebillregister.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_xpt":'
||'"1","_paramsP_COMPANY":"&P142_COMPANY.","_paramsP_LOCATION":"&P142_LOCATION.","_paramsP_FROMDATE":"&P142_FROMDATE.","_paramsP_TODATE":"&P142_TODATE.","_paramsP_PARTY":"&P142_PARTY.","_paramsP_ITEM":"&P142_ITEM.","_paramsP_PBSTATUS":"&P142_PBSTATUS.",'
||'"_paramsP_ITEMSPECIFICATION":"&P142_ITEMSPECIFICATION.","_paramsP_ITEMGROUP":"&P142_ITEMGROUP."}'');',
    '*/',
    'generatePDF_new();')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(439139431365175523)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(439139800241175525)
,p_event_id=>wwv_flow_imp.id(439139431365175523)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(183358989004187794)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(183359358821187795)
,p_event_id=>wwv_flow_imp.id(183358989004187794)
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
 p_id=>wwv_flow_imp.id(439133591534168914)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'begin',
'  if :P142_PBNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P142_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P142_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>7690212143173680
);
wwv_flow_imp.component_end;
end;
/
