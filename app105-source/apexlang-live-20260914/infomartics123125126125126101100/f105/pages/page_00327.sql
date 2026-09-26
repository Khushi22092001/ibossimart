prompt --application/pages/page_00327
begin
--   Manifest
--     PAGE: 00327
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
 p_id=>327
,p_name=>'PURCHASE BILL LEDGER'
,p_alias=>'PURCHASE-BILL-LEDGER'
,p_step_title=>'PURCHASE BILL LEDGER'
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
'  var bireporturl = $(''#P327_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/poregister.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P327_FROMDATE'').val());',
'  var toDate = new Date($(''#P327_TODATE'').val());',
'  var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P327_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P327_COMPANY'').val() ==="" || $(''#P327_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P327_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P327_COMPANY'').val();',
'       global_companycode= $(''#P327_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +  ',
'      ''&P_STATUS='' +$(''#P327_STATUS'').val() +    ',
'      ''&P_FROMDATE='' +$(''#P327_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P327_TODATE'').val() + ',
'      ''&P_LOCATION='' + $(''#P327_LOCATION'').val() +',
'      ''&P_PARTYNAME='' +$(''#P327_PARTYNAME'').val() +',
'      ''&P_DOCTYPE='' +$(''#P327_DOCTYPE'').val() +',
'      ''&P_ITEM='' +$(''#P327_ITEM'').val() +',
'      ''&P_GRNSTATUS='' +$(''#P327_GRNSTATUS'').val() +',
'      ''&P_ITEMSPECIFICATION='' +$(''#P327_ITEMSPECIFICATION'').val() +',
'      ''&P_PONO='' +$(''#P327_PONO'').val() +',
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
'  var bireporturl = $(''#P327_BIREPORTURL'').val()',
'  var reportName =  ''PurchaseBillLedger.xdo'';',
'  var outputFormat = ''pdf'';',
'var companycode ,global_companycode;',
'  var arraCom = [];',
'  try',
'  {',
'  arraCom = $(''#P327_COMPANY'').val().split(":");',
'  }catch(ex){',
'',
'  }',
' ',
'  if($(''#P327_COMPANY'').val() ==="" || $(''#P327_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'     global_companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else if(arraCom.length>1)',
'  {',
'      companycode = $(''#P327_COMPANY'').val(); ',
'      global_companycode=''&GLOBAL_COMPANYCODE.'';',
'      ',
'  }',
'  else{',
'      companycode = $(''#P327_COMPANY'').val();',
'       global_companycode= $(''#P327_COMPANY'').val();',
'  }  ',
'',
'',
'//   var reportParams = ',
'//     ''"_paramsP_TNO":"'' + $(''#P118_TNO'').val() ',
'//       ;',
'',
'var reportParams = ',
'     ''"_paramsP_COMPANY":"''+ companycode + ''",'' +  ',
'      ''"_paramsP_FROMDATE":"'' +$(''#P327_FROMDATE'').val() + ''",'' + ',
'      ''"_paramsP_TODATE":"'' +$(''#P327_TODATE'').val() + ''",'' + ',
'      ''"_paramsP_LOCATION":"'' + $(''#P327_LOCATION'').val() + ''",'' + ',
'      ''"_paramsP_TRANSACTIONTYPE":"'' +$(''#P327_TRANSACTIONTYPE'').val() + ''",'' + ',
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
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(586125444431002119)
,p_plug_name=>'PURCHASE BILL LEDGER'
,p_static_id=>'purchase-bill-ledger'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'    a.PBPassNo,',
'    a.PBPassDate,',
'    c.PartyName,',
'    GetPartyAttributeValue(a.PartyCode,''GSTINNO'') as PartyGSTNO,',
'    d.VoucherNo,',
'    y.Quantity1,',
'    y.Amount,',
'    x.CGST,',
'    x.SGST,',
'    x.IGST,',
'    x.TCS,',
'    a.SumOfTDSAmount,',
'    a.RoundOff,',
'    a.AmountAfterTDS,',
'    e.PartyBillNo,',
'    e.PartyBillDate,',
'    nvl(y.Amount,0) + nvl(x.CGST,0) + nvl(x.SGST,0) + nvl(x.IGST,0) + nvl(x.TCS,0) as TotalPurchaseAmount,',
'    nvl((nvl(y.Amount,0) + nvl(x.CGST,0) + nvl(x.SGST,0) + nvl(x.IGST,0) + nvl(x.TCS,0)),0) - nvl(a.SumofTDSAmount,0) as GrossTotal',
'From PBPass a,',
' (Select',
'     aa.Tno,',
'     sum(nvl(Decode(bb.FooterHeadCode,''.CGST.'', bb.FooterValue),0)) as CGST,',
'     sum(nvl(Decode(bb.FooterHeadCode,''.SGST.'', bb.FooterValue),0)) as SGST,',
'     sum(nvl(Decode(bb.FooterHeadCode,''.IGST.'', bb.FooterValue),0))as IGST,',
'     sum(nvl(Decode(bb.FooterHeadCode,''.TCS.'', bb.FooterValue),0)) as TCS',
'    From PBPassDetail aa, PBPassDetailFooter bb',
'    Where aa.Tno = bb.Tno',
'      and aa.Sno = bb.Sno',
'      and bb.FooterHeadCode in (''.CGST.'',''.SGST.'',''.IGST.'')',
'    Group By aa.Tno',
'      )x,',
'  (Select',
'      aa.Tno,',
'      sum(aa.Quantity1) as Quantity1,',
'      sum(aa.Amount) as Amount',
'    From PBPassDetail aa',
'    Group By aa.Tno) y,',
'    Party c, Voucher d, PurchaseBill e',
'Where a.Tno = x.Tno(+) ',
'  and a.Tno = y.Tno(+)',
'  and a.PartyCode = c.PartyCode',
'  and a.Tno = d.ModuleTno(+)',
'  and d.ModuleTno is not null',
'  and a.PurchaseBillTno = e.Tno(+)',
'  and a.PBPassDate between :P327_FROMDATE and :P327_TODATE',
'  and ( :P327_COMPANY is null or instr('':''||:P327_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'   and ( :P327_LOCATION is null or instr('':''||:P327_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P327_TRANSACTIONTYPE is null or instr('':''||:P327_TRANSACTIONTYPE||'':'','':''|| a.TransactiontypeCode||'':'') > 0)',
'-- Group By a.tno,',
'--     a.PBPassNo,',
'--     a.PBPassDate,',
'--     c.PartyName,',
'--     a.PartyCode,',
'--     d.VoucherNo,',
'--     a.SumOfTDSAmount,',
'--     a.RoundOff,',
'--     a.AmountAfterTDS,',
'--     e.PartyBillNo,',
'--     e.PartyBillDate'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'TDS PAYBLE'
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
 p_id=>wwv_flow_imp.id(564694838958602757)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>404317310301178065
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185198217162856431)
,p_db_column_name=>'AMOUNT'
,p_display_order=>510
,p_column_identifier=>'FK'
,p_column_label=>'PURCHASE AMOUNT'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194523157843067293)
,p_db_column_name=>'AMOUNTAFTERTDS'
,p_display_order=>600
,p_column_identifier=>'FU'
,p_column_label=>'AMOUNTAFTERTDS'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185198299174856432)
,p_db_column_name=>'CGST'
,p_display_order=>520
,p_column_identifier=>'FL'
,p_column_label=>'CGST '
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194523729827067299)
,p_db_column_name=>'GROSSTOTAL'
,p_display_order=>640
,p_column_identifier=>'FY'
,p_column_label=>'GROSS TOTAL'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185198430423856434)
,p_db_column_name=>'IGST'
,p_display_order=>540
,p_column_identifier=>'FN'
,p_column_label=>'IGST '
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(182389126855974015)
,p_db_column_name=>'PARTYBILLDATE'
,p_display_order=>620
,p_column_identifier=>'FW'
,p_column_label=>'PARTY BILL DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194523311115067294)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>610
,p_column_identifier=>'FV'
,p_column_label=>'PARTY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:120px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185197841083856428)
,p_db_column_name=>'PARTYGSTNO'
,p_display_order=>480
,p_column_identifier=>'FH'
,p_column_label=>'PARTY GSTIN NO.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185197730109856427)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>470
,p_column_identifier=>'FG'
,p_column_label=>'PURCHASE PARTY'
,p_column_html_expression=>'<div style="display:block; width:210px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185197702929856426)
,p_db_column_name=>'PBPASSDATE'
,p_display_order=>460
,p_column_identifier=>'FF'
,p_column_label=>'PB PASS DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PBPASSDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(511407578437447603)
,p_db_column_name=>'PBPASSNO'
,p_display_order=>380
,p_column_identifier=>'EW'
,p_column_label=>'PB PASS NO'
,p_column_html_expression=>'<div style="display:block; width:170px">#PBPASSNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185198004312856429)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>490
,p_column_identifier=>'FI'
,p_column_label=>'QUANTITY'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185199248151856442)
,p_db_column_name=>'ROUNDOFF'
,p_display_order=>590
,p_column_identifier=>'FT'
,p_column_label=>'ROUND OFF'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185198336554856433)
,p_db_column_name=>'SGST'
,p_display_order=>530
,p_column_identifier=>'FM'
,p_column_label=>'SGST '
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185198862333856438)
,p_db_column_name=>'SUMOFTDSAMOUNT'
,p_display_order=>580
,p_column_identifier=>'FR'
,p_column_label=>'TDS PURCHASE'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(185198540320856435)
,p_db_column_name=>'TCS'
,p_display_order=>550
,p_column_identifier=>'FO'
,p_column_label=>'TCS '
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(194523695680067298)
,p_db_column_name=>'TOTALPURCHASEAMOUNT'
,p_display_order=>630
,p_column_identifier=>'FX'
,p_column_label=>'TOTAL PURCHASE AMOUNT'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(493220637771560853)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>50
,p_column_identifier=>'BZ'
,p_column_label=>'VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:180px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(564987847766412555)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131498'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>1000
,p_report_columns=>'PBPASSNO:PBPASSDATE:PARTYNAME:PARTYGSTNO:VOUCHERNO:PARTYBILLNO:PARTYBILLDATE:QUANTITY1:AMOUNT:CGST:SGST:IGST:TCS:TOTALPURCHASEAMOUNT:SUMOFTDSAMOUNT:ROUNDOFF:GROSSTOTAL'
,p_sum_columns_on_break=>'TDSAMOUNT:BASICAMOUNT:QUANTITY1:AMOUNT:CGST:SGST:IGST:TCS:SUMOFTDSAMOUNT:AMOUNTAFTERTDS'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(615276111004465959)
,p_plug_name=>'PURCHASE BILL LEDGER'
,p_static_id=>'purchase-bill-ledger-2'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(182389224070974016)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(586125444431002119)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(193853611379685596)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(615276111004465959)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(194582690730702875)
,p_name=>'P327_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(615276111004465959)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(185199162443856441)
,p_name=>'P327_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(615276111004465959)
,p_prompt=>'Company'
,p_placeholder=>'Enter Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = getModuleCodeForPageNo(:APP_PAGE_ID)',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and upper(bu.BossUserName) =  upper(''&APP_USER.'')',
'  and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES'''))
,p_cSize=>30
,p_colspan=>4
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
  'attribute_08', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(493249384112561010)
,p_name=>'P327_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(615276111004465959)
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(493250175365561010)
,p_name=>'P327_LOCATION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(615276111004465959)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select distinct',
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
'Order by 1',
';',
'  '))
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
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
 p_id=>wwv_flow_imp.id(493249815667561010)
,p_name=>'P327_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(615276111004465959)
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(194523403332067295)
,p_name=>'P327_TRANSACTIONTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(615276111004465959)
,p_prompt=>'Transaction Type '
,p_placeholder=>'Enter Transaction Type '
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      b.TransactiontypeName d,',
'      b.TransactiontypeCode r',
'From  PBPass a, Transactiontype b',
'Where a.TransactiontypeCode = b.TransactiontypeCode '))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(182389261901974017)
,p_name=>'GeneratePDF'
,p_static_id=>'generatepdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(182389224070974016)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(182389338071974018)
,p_event_id=>wwv_flow_imp.id(182389261901974017)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(193855369521685612)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(193855897815685613)
,p_event_id=>wwv_flow_imp.id(193855369521685612)
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
