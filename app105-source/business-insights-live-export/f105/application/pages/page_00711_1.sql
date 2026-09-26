prompt --application/pages/page_00711
begin
--   Manifest
--     PAGE: 00711
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
 p_id=>711
,p_name=>'Comparative Statement Register'
,p_alias=>'COMPARATIVE-STATEMENT-REGISTER'
,p_step_title=>'Comparative Statement Register'
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
'  var reportName = ''CMPL/REPORT/cs.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P76_FROMDATE'').val());',
'  var toDate = new Date($(''#P76_TODATE'').val());',
'',
'var reportParams = ',
'      ''&P_COMPANY=''+ $(''#P76_COMPANY'').val() +  ',
'      ''&P_LOCATION='' + $(''#P76_LOCATION'').val() +  ',
'      ''&P_PARTY='' +$(''#P76_PARTY'').val() +  ',
'      ''&P_FROMDATE='' +$(''#P76_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P76_TODATE'').val() + ',
'      ''&P_ITEM='' +$(''#P76_ITEM'').val() +',
'	  ''&P_ITEMSPECIFICATION='' +$(''#P76_ITEMSPECIFICATION'').val() ',
'      ',
'      ;',
' ',
'      ',
'  ',
'  //var reportURL = ''http://192.168.1.202:7001/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/'' + reportName +',
'  //var reportURL = ''http://192.168.1.202:7001/xmlpserver/CMPL/REPORT/PCReport.xdo?id=weblogic&passwd=webboss123&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  var reportURL = ''http://115.242.138.210:7001/xmlpserver/''+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}',
''))
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'#MYID.a-GV-row.is-hover, .a-IRR-table tr:hover td{',
'    background-color: #FFFACD;',
'}',
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
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(462028106178989296)
,p_plug_name=>'Comparative Statement Register'
,p_static_id=>'comparative-statement-register'
,p_region_css_classes=>'hspl-drawer'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent1:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(462028200917989297)
,p_plug_name=>'Comparative Statement Report'
,p_static_id=>'comparative-statement-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2100526641005906379
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select row_number() over(order by xx.comparativeStatementDate) SerialNo,',
'xx.*',
'from (',
'Select',
'--      row_number() over(order by a.comparativeStatementDate) SerialNo,',
'      a.TNo,',
'      l.LocationName,',
'      a.ComparativeStatementNo,',
'      a.ComparativeStatementDate,',
'      i.IndentNo,',
'      i.IndentDate,',
'      enq.EnquiryNo,',
'      enq.EnquiryDate,',
'      dp.DepartmentName,',
'      q.QuotationNo,',
'      q.QuotationDate,',
'      v.VendorName,',
'      q.PartyQuotationNo,',
'      q.PartyQuotationDate,',
'      e.ItemCode,',
'      e.ItemName,',
'      ee.ItemSpecificationName,',
'      e.ItemName||'' ~ ''||ee.ItemSpecificationName as Item,',
'      e.MeasuringUnitCode1 as UOM1,',
'      round(b.Quantity1,3) as Quantity1, ',
'      e.MeasuringUnitCode2 as UOM2,',
'      round(b.Quantity2,3) as Quantity2,',
'      q.Rate,',
'      round(q.Amount,2) as Amount,',
'     -- b.Quantity1 * q.Rate as Amount,',
'      q.CGST,',
'      q.SGST,',
'      q.IGST,',
'      q.TCS,',
'      round((q.FooterAmount - (CGST + SGST + IGST + TCS)),2) as OtherAmount,',
'      round(q.TotalAmount,2) as TotalAmount,',
'      bue.EmployeeName||'' ( ''||a.Creator||'' )'' as Creator,',
'      a.CreationTime,',
'      (Select',
'           count(cd.QuotationTNo)',
'      From ComparativeStatementDetail cd',
'      Where cd.TNo = a.TNo',
'      Group by cd.TNo) as Participants',
'From  ComparativeStatement a, ComparativeStatementItem b, Location l, Indent i, Enquiry enq, Department dp, Item e, ItemSpecification ee, Vendor v,',
'      (',
'          Select',
'            x.TNo,',
'            x.QuotationNo,',
'            x.QuotationDate,',
'            x.PartyCode,',
'            x.partyQuotationNo,',
'            x.PartyQuotationDate,',
'            x.ItemCode,',
'            x.ItemSpecificationCode,',
'            x.Quantity1,',
'            x.Quantity2,',
'            x.Rate,',
'            sum(CGST) as CGST,',
'            sum(SGST) as SGST,',
'            sum(IGST) as IGST,',
'            sum(TCS) as TCS,',
'            x.FooterAmount,',
'            x.Amount,',
'            x.TotalAmount',
'       From',
'            (Select',
'                    aa.TNo,',
'                    aa.QuotationNo,',
'                    aa.QuotationDate,',
'                    aa.PartyCode,',
'                    aa.partyQuotationNo,',
'                    aa.PartyQuotationDate,',
'                    bb.ItemCode,',
'                    bb.ItemSpecificationCode,',
'                    bb.Quantity1,',
'                    bb.Quantity2,',
'                    bb.Rate,',
'                    nvl(Decode(cc.FooterHeadCode,''.CGST.'',cc.FooterValue),0) as CGST,',
'                    nvl(Decode(cc.FooterHeadCode,''.SGST.'',cc.FooterValue),0) as SGST,',
'                    nvl(Decode(cc.FooterHeadCode,''.IGST.'',cc.FooterValue),0) as IGST,',
'                    nvl(Decode(cc.FooterHeadCode,''.TCS.'',cc.FooterValue),0) as TCS,',
'                    bb.FooterAmount,',
'                    bb.Amount,',
'                    bb.TotalAmount',
'            From    Quotation aa, QuotationDetail bb, QuotationDetailFooter cc',
'            Where   aa.TNo = bb.TNo',
'              and   bb.TNo = cc.TNo(+)',
'              and   bb.SNo = cc.SNo(+)',
'       )x',
'       Group By ',
'            x.TNo,',
'            x.QuotationNo,',
'            x.QuotationDate,',
'            x.PartyCode,',
'            x.partyQuotationNo,',
'            x.PartyQuotationDate,',
'            x.ItemCode,',
'            x.ItemSpecificationCode,',
'            x.Quantity1,',
'            x.Quantity2,',
'            x.Rate,',
'            x.FooterAmount,',
'            x.Amount,',
'            x.TotalAmount',
'      )q, BossUser bu, Employee bue',
'Where a.TNo = b.TNo(+)',
'  and a.LocationCode = l.LocationCode(+)',
'  and a.IndentTNo = i.TNo(+)',
'  and a.EnquiryTNo = enq.TNo(+)',
'  and a.DepartmentCode = dp.DepartmentCode(+)',
'  and b.QuotationTNo = q.TNo(+)',
'  and b.ItemCode = q.ItemCode(+)',
'  and b.ItemSpecificationCode = q.ItemSpecificationCode(+)',
'  and q.PartyCode = v.VendorCode(+)',
'  and b.ItemCode = e.ItemCode(+)',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'  and a.Creator = bu.LoginName(+)',
'  and bu.EmployeeCode = bue.EmployeeCode(+)',
'  and ((:P711_TODOLIST = ''YES'') OR (:P711_NEXTPROCESS = ''YES'') OR (a.ComparativeStatementDate between :P711_FROMDATE and :P711_TODATE))',
'  and ((:P711_TODOLIST = ''YES'') OR (:P711_NEXTPROCESS = ''YES'')OR (instr('':''||:P711_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0))',
'  and ((:P711_TODOLIST = ''YES'') OR (:P711_NEXTPROCESS = ''YES'') OR (instr('':''||:P711_LOCATION||'':'','':''||a.LocationCode||'':'') > 0))',
'  and ( :P711_PARTY IS NULL OR instr('':''||:P711_PARTY||'':'','':''||v.VendorCode||'':'') > 0 ) ',
'  and ( :P711_ITEM IS NULL OR instr('':''||:P711_ITEM||'':'','':''||e.ItemCode||'':'') > 0 ) ',
'  and ( :P711_ITEMSPECIFICATION IS NULL OR instr('':''||:P711_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'  and q.QuotationNo like nvl(:P711_QUOTATIONNO,''%'')',
'  and enq.EnquiryNo like nvl(:P711_ENQUIRYNO,''%'')',
'  and a.ComparativeStatementNo like nvl(:P711_CSNO,''%'')',
'  ',
') xx',
'where (:P711_TODOLIST=''NO'' OR  (:P711_TODOLIST=''YES'' AND EXISTS ( SELECT 1 FROM ONTHETABLE_APEX YY WHERE YY.TNO=XX.TNO) ))',
'/*AND ( :P711_NEXTPROCESS=''NO'' OR (:P711_NEXTPROCESS = ''YES'' AND (  getdocumentstatuscode(''COMPARATIVESTATEMENT'',XX.TNO)=''ACTIVE''',
'                                    AND  NOT EXISTS (Select 1 From PurchaseOrder AA Where AA.Comparativestatementtno = XX.TNO)',
'                                )',
'                                )',
'         ',
'',
' )*/'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P711_COMPANY,P711_LOCATION,P711_FROMDATE,P711_TODATE,P711_PARTY,P711_ITEM'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Comparative Statement Report'
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
 p_id=>wwv_flow_imp.id(331096620882246040)
,p_max_row_count=>'1000'
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
,p_detail_link=>'f?p=&APP_ID.:712:&SESSION.::&DEBUG.::P712_TNO:#TNO#'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>',
''))
,p_internal_uid=>222815087081863733
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286755165760637312)
,p_db_column_name=>'AMOUNT'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286752829903637311)
,p_db_column_name=>'CGST'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286744815777637307)
,p_db_column_name=>'COMPARATIVESTATEMENTDATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'CS DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#COMPARATIVESTATEMENTDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286744411916637307)
,p_db_column_name=>'COMPARATIVESTATEMENTNO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'CS NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#COMPARATIVESTATEMENTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286752409669637311)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'CREATION TIME'
,p_column_html_expression=>'<div style="display:block; width:80px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286752026311637311)
,p_db_column_name=>'CREATOR'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'CREATOR'
,p_column_html_expression=>'<div style="display:block; width:100px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286746823199637308)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'DEPARTMENT'
,p_column_html_expression=>'<div style="display:block; width:80px">#DEPARTMENTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286746426389637308)
,p_db_column_name=>'ENQUIRYDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'ENQUIRY DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#ENQUIRYDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286745957851637308)
,p_db_column_name=>'ENQUIRYNO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'ENQUIRY NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#ENQUIRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286753573117637312)
,p_db_column_name=>'IGST'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286745648641637308)
,p_db_column_name=>'INDENTDATE'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'INDENT DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#INDENTDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286745197668637308)
,p_db_column_name=>'INDENTNO'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'INDENT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#INDENTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286754849305637312)
,p_db_column_name=>'ITEM'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'MATERIAL DETAIL'
,p_column_html_expression=>'<div style="display:block; width:300px">#ITEM#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286749221986637310)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286749652695637310)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'ITEM NAME'
,p_column_html_expression=>'<div style="display:block; width:150px">#ITEMNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286750016676637310)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'ITEM SPECIFICATION NAME'
,p_column_html_expression=>'<div style="display:block; width:150px">#ITEMSPECIFICATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286743975823637307)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286754403115637312)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'OTHER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286976394672599529)
,p_db_column_name=>'PARTICIPANTS'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'PARTICIPANTS'
,p_column_html_expression=>'<div style="display:block; width:60px">#PARTICIPANTS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286748758373637309)
,p_db_column_name=>'PARTYQUOTATIONDATE'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'PARTY QUOTATION DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYQUOTATIONDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286748405718637309)
,p_db_column_name=>'PARTYQUOTATIONNO'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'PARTY QUOTATION NO'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286750763990637310)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286649873348388208)
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
 p_id=>wwv_flow_imp.id(286747599060637309)
,p_db_column_name=>'QUOTATIONDATE'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'QUOTATION DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUOTATIONDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286747187044637309)
,p_db_column_name=>'QUOTATIONNO'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'QUOTATION NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#QUOTATIONNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286751211486637310)
,p_db_column_name=>'RATE'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(293574836867440737)
,p_db_column_name=>'SERIALNO'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286753184167637311)
,p_db_column_name=>'SGST'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286754002245637312)
,p_db_column_name=>'TCS'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286743650087637307)
,p_db_column_name=>'TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'TNO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286751569466637311)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'TOTAL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286649748908388206)
,p_db_column_name=>'UOM1'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM1#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286649760022388207)
,p_db_column_name=>'UOM2'
,p_display_order=>320
,p_column_identifier=>'AF'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#UOM2#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286747968871637309)
,p_db_column_name=>'VENDORNAME'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:250px">#VENDORNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(331213616606150428)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'43756'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:COMPARATIVESTATEMENTDATE:VENDORNAME:COMPARATIVESTATEMENTNO:ENQUIRYNO:DEPARTMENTNAME:PARTICIPANTS:QUOTATIONNO:PARTYQUOTATIONNO:ITEMCODE:ITEM:UOM1:QUANTITY1:UOM2:QUANTITY2:RATE:AMOUNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATION'
||'TIME'
,p_sort_column_1=>'SERIALNO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'COMPARATIVESTATEMENTDATE'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'VENDORNAME'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:AMOUNT:CGST:SGST:IGST:TOTALAMOUNT:OTHERAMOUNT:TCS'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168936311693348155)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(462028200917989297)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:712:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168935920148348155)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(462028200917989297)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168921312516348136)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(462028106178989296)
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
 p_id=>wwv_flow_imp.id(286652583326388210)
,p_name=>'P711_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PURCHASEORDER''',
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
,p_field_template=>2526760615038828570
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
 p_id=>wwv_flow_imp.id(286742316659637309)
,p_name=>'P711_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_item_default=>'Trunc(Sysdate)'
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
 p_id=>wwv_flow_imp.id(286745828802637311)
,p_name=>'P711_GROUP'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286744312330637310)
,p_name=>'P711_ITEM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_prompt=>'Material'
,p_placeholder=>'Material List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select    Distinct',
'          e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'          e.ItemCode r',
'From ComparativeStatementItem a, Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 2'))
,p_cSize=>70
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
 p_id=>wwv_flow_imp.id(286745025950637311)
,p_name=>'P711_ITEMSPECIFICATION'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select    ',
'          ee.ItemSpecificationName as d,',
'          ee.ItemSpecificationCode as r',
'',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P711_ITEM',
' and e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P711_ITEM'
,p_ajax_items_to_submit=>'P711_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(286743110884637310)
,p_name=>'P711_LOCATION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
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
'  and a.ModuleCode = ''COMPARATIVESTATEMENT''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
';',
''))
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
 p_id=>wwv_flow_imp.id(306342961924024563)
,p_name=>'P711_NEXTPROCESS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(286743489957637310)
,p_name=>'P711_PARTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'	Distinct',
'	p.VendorName d,',
'	p.VendorCode r',
'From Quotation a, Vendor p',
'Where a.PartyCode = p.VendorCode'))
,p_cSize=>45
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
 p_id=>wwv_flow_imp.id(286742709336637310)
,p_name=>'P711_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_item_default=>'Trunc(Sysdate)'
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(306342643056022128)
,p_name=>'P711_TODOLIST'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(462028106178989296)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168938230358348157)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168935920148348155)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168938723481348157)
,p_event_id=>wwv_flow_imp.id(168938230358348157)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF()')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168937263318348155)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168937778495348157)
,p_event_id=>wwv_flow_imp.id(168937263318348155)
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
 p_id=>wwv_flow_imp.id(168936884155348155)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P711_CSNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P711_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P711_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;',
'',
'',
'begin',
'  if :P711_QUOTATIONNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P711_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P711_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;',
'',
'begin',
'  if :P711_ENQUIRYNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P711_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P711_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>60655350354965848
);
wwv_flow_imp.component_end;
end;
/
