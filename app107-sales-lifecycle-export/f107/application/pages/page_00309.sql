prompt --application/pages/page_00309
begin
--   Manifest
--     PAGE: 00309
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
 p_id=>309
,p_name=>'Balance Freight Settlement '
,p_alias=>'BALANCE-FREIGHT-SETTLEMENT'
,p_step_title=>'Balance Freight Settlement '
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
'  var reportName = ''IRONMART/REPORT/BalanceFreightSettlement.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P309_FROMDATE'').val());',
'',
'  var reportParams = ',
'  ''&P_COMPANY='' +  $(''#P309_COMPANY'').val() +',
'    ''&P_LOCATION='' +  $(''#P309_LOCATION'').val() +',
'    ''&P_FROMDATE=''  +  $(''#P309_FROMDATE'').val() +',
'    ''&P_TODATE='' + $(''#P309_TODATE'').val() +',
'    ''&P_CCINVOICE='' + $(''#P309_CCINVOICE'').val() +',
'    ''&P_BALANCEPAYMENT='' + $(''#P309_BALANCEPAYMENT'').val() +',
'    ''&P_TRANSPORTER='' +  $(''#P309_TRANSPORTER'').val() ',
'    ;',
' ',
'//alert($v(''P309_PARTY''));',
'  var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
'',
'',
'',
'function generatePDF_new() {',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P309_BIREPORTURL'').val()',
'  var reportName =  ''BalanceFreightSettlement.xdo'';',
'  var outputFormat = ''pdf'';',
'',
'',
'var reportParams = ',
'         ''"_paramsP_COMPANY":"'' +$(''#P309_COMPANY'').val() + ''",'' +',
'         ''"_paramsP_LOCATION":"'' +$(''#P309_LOCATION'').val() + ''",'' +',
'         ''"_paramsP_FROMDATE":"'' +$(''#P309_FROMDATE'').val() + ''",'' + ',
'         ''"_paramsP_TODATE":"'' +$(''#P309_TODATE'').val() + ''",'' + ',
'         ''"_paramsP_CCINVOICE":"'' +$(''#P309_CCINVOICE'').val() + ''",'' + ',
'         ''"_paramsP_BALANCEPAYMENT":"'' +$(''#P309_BALANCEPAYMENT'').val() + ''",'' +',
'	     ''"_paramsP_TRANSPORTER":"'' + $(''#P309_TRANSPORTER'').val() ;',
'         ',
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
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(250650210873861371)
,p_plug_name=>'Balance Freight Settlement'
,p_static_id=>'balance-freight-settlement'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'     a.FreightAdviceNo,',
'     a.FreightAdviceDate,',
'     b.PartyName as TransporterName,',
'     aa.VehicleNo,',
'     getcityname(d.sourceplacecode) as SourceLocation,',
'     pa.PartyName as ShipTo,',
'     getcityname(d.destinationplacecode) as DestinationLocation,',
'     c.CCInvoiceNo as RefNo,',
'     c.CCInvoiceDate as RefDate,',
'     c.LorryNo as GRNo,',
'     aa.Quantity1,',
'     aa.Rate,',
'     aa.Amount,',
'     aa.AdvanceAmount,',
'',
'     ',
'     x.CGSTAmount,',
'     y.SGSTAmount,',
'     z.IGSTAmount,',
'     aa.TDSAmount,',
'     aa.ShortageQuantity1,',
'     aa.DeductionAmount,',
'     aa.NetPayableAmount,',
'     aa.Remark,',
'     pr.PaymentStatus',
'From FreightAdvice a, FreightAdviceDetail aa, Party b, CCInvoice c, Loadingadvice d, Party pa,',
'(Select',
'     aa.Tno,',
'    Case When a.ReferenceModuleTno is not null then ''PREPAIRED''',
'       When a.ReferenceModuleTno is null then ''PENDING''',
'        End as PaymentStatus',
'    From FreightAdvice aa, PaymentAdviceReference a',
'    Where aa.Tno = a.ReferenceModuleTno(+))pr,',
'(',
' Select',
' a.FooterValue as CGSTAmount,',
' a.Tno,',
' a.Sno',
'From FreightAdviceDetailFooter a',
'Where a.FooterHeadCode = ''.CGST.'') x,',
'(',
' Select',
' a.FooterValue as SGSTAmount,',
' a.Tno,',
' a.Sno',
'From FreightAdviceDetailFooter a',
'Where a.FooterHeadCode = ''.SGST.'') y,',
'(',
' Select',
' a.FooterValue as IGSTAmount,',
' a.Tno,',
' a.Sno',
'From FreightAdviceDetailFooter a',
'Where a.FooterHeadCode = ''.IGST.'') z',
'-- Where not exists ',
'--  (Select',
'--      r.ReferenceModuleTno',
'--    From PaymentAdviceReference r',
'--    Where r.ReferenceModuleTno = a.Tno)  ',
'WHERE a.Tno = aa.Tno (+)',
' and a.TransporterCode = b.PartyCode(+)',
' and aa.ModuleTno = c.Tno(+)',
' and c.LoadingAdviceTno = d.Tno(+)',
' and c.ConsigneeCode = pa.PartyCode(+)',
' and a.Tno = pr.Tno(+)',
' and aa.Tno = x.Tno(+)',
' and aa.Sno = x.Sno(+)',
' and aa.Tno = y.Tno(+)',
' and aa.Sno = y.Sno(+)',
' and aa.Tno = z.Tno(+)',
' and aa.Sno = z.Sno(+)',
' and aa.ModuleCode = ''CCINVOICE''',
' and a.FreightAdvicedate between :P309_FROMDATE and :P309_TODATE',
'and ( :P309_LOCATION IS NULL OR instr('':''||:P309_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'and ( :P309_COMPANY IS NULL OR instr('':''||:P309_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'and ( :P309_TRANSPORTER IS NULL OR instr('':''||:P309_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 )',
'and ( :P309_CCINVOICE IS NULL OR instr('':''||:P309_CCINVOICE||'':'','':''||c.Tno||'':'') > 0 )',
'and ( :P309_BALANCEPAYMENT IS NULL OR instr('':''||:P309_BALANCEPAYMENT||'':'','':''||pr.PaymentStatus||'':'') > 0 )',
'',
'UNION ALL',
'',
'',
'Select',
'     a.FreightAdviceNo,',
'     a.FreightAdviceDate,',
'     b.PartyName as TransporterName,',
'     aa.VehicleNo,',
'     getcityname(d.sourceplacecode) as SourceLocation,',
'      null as ShipTo,',
'     getcityname(d.destinationplacecode) as DestinationLocation,',
'     c.GRNNo as RefNo,',
'     c.GRNDate as RefDate,',
'     c.LRNo as GRNo,',
'     aa.Quantity1,',
'     aa.Rate,',
'     aa.Amount,',
'     aa.AdvanceAmount,',
'     x.CGSTAmount,',
'     y.SGSTAmount,',
'     z.IGSTAmount,',
'     aa.TDSAmount,',
'     aa.ShortageQuantity1,',
'     aa.DeductionAmount,',
'     aa.NetPayableAmount,',
'     aa.Remark,',
'     pr.PaymentStatus',
'From FreightAdvice a, FreightAdviceDetail aa, Party b, GRN c, Loadingadvice d,',
'(Select',
'     aa.Tno,',
'    Case When a.ReferenceModuleTno is not null then ''PREPAIRED''',
'       When a.ReferenceModuleTno is null then ''PENDING''',
'        End as PaymentStatus',
'    From FreightAdvice aa, PaymentAdviceReference a',
'    Where aa.Tno = a.ReferenceModuleTno(+))pr,',
'(',
' Select',
' a.FooterValue as CGSTAmount,',
' a.Tno,',
' a.Sno',
'From FreightAdviceDetailFooter a',
'Where a.FooterHeadCode = ''.CGST.'') x,',
'(',
' Select',
' a.FooterValue as SGSTAmount,',
' a.Tno,',
' a.Sno',
'From FreightAdviceDetailFooter a',
'Where a.FooterHeadCode = ''.SGST.'') y,',
'(',
' Select',
' a.FooterValue as IGSTAmount,',
' a.Tno,',
' a.Sno',
'From FreightAdviceDetailFooter a',
'Where a.FooterHeadCode = ''.IGST.'') z',
'-- Where not exists ',
'--  (Select',
'--      r.ReferenceModuleTno',
'--    From PaymentAdviceReference r',
'--    Where r.ReferenceModuleTno = a.Tno) ',
' WHERE a.Tno = aa.Tno(+) ',
' and a.TransporterCode = b.PartyCode(+)',
' and aa.ModuleTno = c.Tno(+)',
' and c.LoadingAdviceTno = d.Tno(+)',
' and a.Tno = pr.Tno(+)',
' and aa.Tno = x.Tno(+)',
' and aa.Sno = x.Sno(+)',
' and aa.Tno = y.Tno(+)',
' and aa.Sno = y.Sno(+)',
' and aa.Tno = z.Tno(+)',
' and aa.Sno = z.Sno(+)',
' and aa.ModuleCode = ''GRN''',
' and a.FreightAdviceDate between :P309_FROMDATE and :P309_TODATE',
'and ( :P309_LOCATION IS NULL OR instr('':''||:P309_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'and ( :P309_COMPANY IS NULL OR instr('':''||:P309_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'and ( :P309_TRANSPORTER IS NULL OR instr('':''||:P309_TRANSPORTER||'':'','':''||a.TransporterCode||'':'') > 0 )',
'and ( :P309_BALANCEPAYMENT IS NULL OR instr('':''||:P309_BALANCEPAYMENT||'':'','':''||pr.PaymentStatus||'':'') > 0 )'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Freight Advance Register'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(250650326170861371)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>73251103873267565
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133085388566138)
,p_db_column_name=>'ADVANCEAMOUNT'
,p_display_order=>63
,p_column_identifier=>'W'
,p_column_label=>'Advance Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#ADVANCEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199132988150566137)
,p_db_column_name=>'AMOUNT'
,p_display_order=>53
,p_column_identifier=>'V'
,p_column_label=>'Freight Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#AMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133179111566139)
,p_db_column_name=>'CGSTAMOUNT'
,p_display_order=>73
,p_column_identifier=>'X'
,p_column_label=>'CGST Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#CGSTAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133680730566144)
,p_db_column_name=>'DEDUCTIONAMOUNT'
,p_display_order=>123
,p_column_identifier=>'AC'
,p_column_label=>'Shortage Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEDUCTIONAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(250655803223861380)
,p_db_column_name=>'DESTINATIONLOCATION'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'TO'
,p_column_html_expression=>'<div style="display:block; width:100px">#DESTINATIONLOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199132782949566135)
,p_db_column_name=>'FREIGHTADVICEDATE'
,p_display_order=>33
,p_column_identifier=>'T'
,p_column_label=>'Freight Advice Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#FREIGHTADVICEDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199132680159566134)
,p_db_column_name=>'FREIGHTADVICENO'
,p_display_order=>23
,p_column_identifier=>'S'
,p_column_label=>'Freight Advice No.'
,p_column_html_expression=>'<div style="display:block; width:130px">#FREIGHTADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211545874825236417)
,p_db_column_name=>'GRNO'
,p_display_order=>173
,p_column_identifier=>'AH'
,p_column_label=>'GR No.'
,p_column_html_expression=>'<div style="display:block; width:100px">#GRNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133365950566141)
,p_db_column_name=>'IGSTAMOUNT'
,p_display_order=>93
,p_column_identifier=>'Z'
,p_column_label=>'IGST Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#IGSTAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133815497566145)
,p_db_column_name=>'NETPAYABLEAMOUNT'
,p_display_order=>133
,p_column_identifier=>'AD'
,p_column_label=>'Balance Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#NETPAYABLEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211546213873236420)
,p_db_column_name=>'PAYMENTSTATUS'
,p_display_order=>183
,p_column_identifier=>'AI'
,p_column_label=>'Balance Payment Status'
,p_column_html_expression=>'<div style="display:block; width:80px">#PAYMENTSTATUS#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(250653062975861378)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(250653463950861379)
,p_db_column_name=>'RATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Rate'
,p_column_html_expression=>'<div style="display:block; width:80px">#RATE#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211545733419236416)
,p_db_column_name=>'REFDATE'
,p_display_order=>163
,p_column_identifier=>'AG'
,p_column_label=>'SB Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#REFDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199132917839566136)
,p_db_column_name=>'REFNO'
,p_display_order=>43
,p_column_identifier=>'U'
,p_column_label=>'SB No.'
,p_column_html_expression=>'<div style="display:block; width:130px">#REFNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133890574566146)
,p_db_column_name=>'REMARK'
,p_display_order=>143
,p_column_identifier=>'AE'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133265900566140)
,p_db_column_name=>'SGSTAMOUNT'
,p_display_order=>83
,p_column_identifier=>'Y'
,p_column_label=>'SGST Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#SGSTAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(211545656426236415)
,p_db_column_name=>'SHIPTO'
,p_display_order=>153
,p_column_identifier=>'AF'
,p_column_label=>'Ship To'
,p_column_html_expression=>'<div style="display:block; width:330px">#SHIPTO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133599248566143)
,p_db_column_name=>'SHORTAGEQUANTITY1'
,p_display_order=>113
,p_column_identifier=>'AB'
,p_column_label=>'Shortage Qty'
,p_column_html_expression=>'<div style="display:block; width:130px">#SHORTAGEQUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(250655066040861379)
,p_db_column_name=>'SOURCELOCATION'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'From'
,p_column_html_expression=>'<div style="display:block; width:110px">#SOURCELOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(199133444931566142)
,p_db_column_name=>'TDSAMOUNT'
,p_display_order=>103
,p_column_identifier=>'AA'
,p_column_label=>'TDS Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDSAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(250652257724861378)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Name Of Transporter'
,p_column_html_expression=>'<div style="display:block; width:210px">#TRANSPORTERNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(250652638262861378)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Vehicle No'
,p_column_html_expression=>'<div style="display:block; width:80px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(250657612773862261)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'160350'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'FREIGHTADVICENO:FREIGHTADVICEDATE:REFNO:REFDATE:TRANSPORTERNAME:VEHICLENO:SOURCELOCATION:SHIPTO:DESTINATIONLOCATION:GRNO:QUANTITY1:RATE:AMOUNT:ADVANCEAMOUNT:TDSAMOUNT:IGSTAMOUNT:CGSTAMOUNT:SGSTAMOUNT:SHORTAGEQUANTITY1:DEDUCTIONAMOUNT:NETPAYABLEAMOUNT'
||':REMARK:PAYMENTSTATUS'
,p_sum_columns_on_break=>'QUANTITY1:AMOUNT:ADVANCEAMOUNT:IGSTAMOUNT:CGSTAMOUNT:SGSTAMOUNT:TDSAMOUNT:DEDUCTIONAMOUNT:NETPAYABLEAMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(248470200785566998)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody:t-Form--slimPadding'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(201357733064039969)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(250650210873861371)
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
 p_id=>wwv_flow_imp.id(201348637536039952)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>12
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211546041074236419)
,p_name=>'P309_BALANCEPAYMENT'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_prompt=>'Balance Payment Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:PENDING;PENDING,PREPAIRED;PREPAIRED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select List-'
,p_cHeight=>1
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(235464587487468465)
,p_name=>'P309_BIREPORTURL'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(211545970359236418)
,p_name=>'P309_CCINVOICE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_prompt=>'CC Invoice No.'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'     Distinct ',
'     c.CCInvoiceNo d,',
'     c.Tno r',
'From FreightAdvice a,FreightAdviceDetail b, CCInvoice c',
'Where a.Tno = b.Tno(+)',
'  and b.ModuleTno = c.Tno(+)',
'Order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(248473415605567016)
,p_name=>'P309_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'     Distinct ',
'     b.CompanyName d,',
'     b.CompanyCode r',
'From FreightAdvice a,Company b',
'Where a.CompanyCode = b.CompanyCode(+)',
'Order by 1'))
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(248473632758567018)
,p_name=>'P309_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_item_default=>'sysdate-7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(248473524445567017)
,p_name=>'P309_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'     Distinct ',
'     b.LocationName d,',
'     b.LocationCode r',
'From FreightAdvice a,Location b',
'Where a.LocationCode = b.LocationCode(+)',
'Order by 1'))
,p_lov_cascade_parent_items=>'P309_COMPANY'
,p_ajax_items_to_submit=>'P309_COMPANY'
,p_ajax_optimize_refresh=>'N'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(248473684913567019)
,p_name=>'P309_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'max_date', 'NONE',
  'min_date', 'NONE',
  'multiple_months', 'N',
  'show_time', 'N',
  'use_defaults', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(248473767140567020)
,p_name=>'P309_TRANSPORTER'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(248470200785566998)
,p_prompt=>'Transporter'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'     Distinct ',
'     b.PartyName d,',
'     b.PartyCode r',
'From FreightAdvice a,Party b',
'Where a.TransPorterCode = b.PartyCode(+)',
'Order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select-'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(201358385868039977)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(201357733064039969)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201358865232039978)
,p_event_id=>wwv_flow_imp.id(201358385868039977)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF_new();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(201359296510039978)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(201359746459039978)
,p_event_id=>wwv_flow_imp.id(201359296510039978)
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
