prompt --application/pages/page_00709
begin
--   Manifest
--     PAGE: 00709
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
 p_id=>709
,p_name=>'Quotation Register'
,p_alias=>'QUOTATION-REGISTER'
,p_step_title=>'Quotation Register'
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
'  var reportName = ''quotation.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P72_FROMDATE'').val());',
'  var toDate = new Date($(''#P72_TODATE'').val());',
'',
'  var reportParams = ',
'    ''"_paramsP_COMPANY":'' + ''"'' + $(''#P72_COMPANY'').val() + ''"'' + '','' +',
'    ''"_paramsP_LOCATION":'' + ''"'' +  $(''#P72_LOCATION'').val() + ''"'' + '','' +',
'    ''"_paramsP_FROMDATE":'' + ''"'' +  formatDate(fromDate) + ''"'' + '','' +',
'    ''"_paramsP_TODATE":'' + ''"'' +  formatDate(toDate) + ''"'' + '','' +',
'    ''"_paramsP_PARTY":'' + ''"'' + $(''#P72_PARTY'').val() + ''"'' + '','' +',
'    ''"_paramsP_ENQUIRY":'' + ''"'' + $(''#P72_ENQUIRY'').val() + ''"'' + '','' +',
'    ''"_paramsP_GROUP":'' + ''"'' + $(''#P72_GROUP'').val() + ''"'' + '','' +',
'    ''"_paramsP_ITEM":'' + ''"'' + $(''#P72_ITEM'').val() + ''"'' + '','' +',
'    ''"_paramsP_ITEMSPECIFICATION":'' + ''"'' + $(''#P72_ITEMSPECIFICATION'').val() + ''"'' ',
'      ;',
'  ',
'  var reportURL = ''http://115.242.138.210:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/'' + reportName +',
'    ''&nQUser='' + username +',
'    ''&nQPassword='' + password +',
'    ''&bipParams={"_xmode":"3","_xpt":"1","_xf":'' + ''"'' + outputFormat +''"'' + '',''',
'    + reportParams',
'    + ''}'';',
'  window.open(reportURL, ''_blank'');',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
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
 p_id=>wwv_flow_imp.id(439473481555649697)
,p_plug_name=>'Quotation Register'
,p_static_id=>'quotation-register'
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
 p_id=>wwv_flow_imp.id(439473576294649698)
,p_plug_name=>'Quotation Report'
,p_static_id=>'quotation-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        row_number() over(order by xxx.Tno) SerialNo,',
'        xxx.TNo,',
'        xxx.SNo,',
'        xxx.LocationName,',
'        xxx.QuotationNo,',
'        xxx.QuotationDate,',
'        xxx.EnquiryNo,',
'        ROUND(xxx.DifferenceDays,0) AS DifferenceDays,',
'        ROUND(xxx.ValidDays,0) AS ValidDays,',
'        xxx.PartyName,',
'        xxx.PartyQuotationNo,',
'        xxx.PartyQuotationDate,',
'        xxx.ValidityDate,',
'        xxx.MaterialGroup,',
'        xxx.ItemCode,',
'        xxx.MaterialDetail,',
'        xxx.UOM,',
'        round(xxx.Quantity1,3) as Quantity1,',
'        xxx.UOM2,',
'        round(xxx.Quantity2,3) as Quantity2,',
'        xxx.WithoutDiscountRate,',
'        xxx.DiscountPercentage,',
'        xxx.DiscountRate,',
'        xxx.Rate,',
'        xxx.RateUOM,',
'        round(xxx.Amount,2) as Amount,',
'        CGST,',
'        SGST,',
'        IGST,',
'        TCS,',
'        round(xxx.FooterAmount,2) as FooterAmount,',
'        round((xxx.FooterAmount - (CGST + SGST + IGST + TCS)),2) as OtherAmount,',
'        round(xxx.TotalAmount,2) as TotalAmount,',
'        xxx.Creator,',
'        xxx.CreationTime',
'From (',
'Select',
'        xx.TNo,',
'        xx.SNo,',
'        xx.LocationName,',
'        xx.QuotationNo,',
'        xx.QuotationDate,',
'        xx.EnquiryNo,',
'        xx.DifferenceDays,',
'        xx.ValidDays,',
'        xx.PartyName,',
'        xx.PartyQuotationNo,',
'        xx.PartyQuotationDate,',
'        xx.ValidityDate,',
'        xx.MaterialGroup,',
'        xx.ItemCode,',
'        xx.MaterialDetail,',
'        xx.UOM,',
'        xx.Quantity1,',
'        xx.UOM2,',
'        xx.Quantity2,',
'        xx.WithoutDiscountRate,',
'        xx.DiscountPercentage,',
'        xx.DiscountRate,',
'        xx.Rate,',
'        xx.RateUOM,',
'        xx.Amount,',
'        sum(xx.CGST) CGST,',
'        sum(xx.SGST) SGST,',
'        sum(xx.IGST) IGST,',
'        sum(xx.TCS) TCS,',
'        xx.FooterAmount,',
'        xx.TotalAmount,',
'        xx.Creator,',
'        xx.CreationTime',
'From (',
'    Select',
'      a.TNo,',
'      b.SNo,',
'      l.Locationname,',
'      a.QuotationNo,',
'      a.QuotationDate,',
'      enq.EnquiryNo,',
'      (a.QuotationDate - enq.EnquiryDate) as DifferenceDays,',
'      (a.ValidityDate - a.QuotationDate) as ValidDays,',
'      p.VendorName as PartyName,',
'      a.PartyQuotationno,',
'      a.PartyQuotationDate,',
'      a.ValidityDate,',
'      e.ParentCode||'' ~ ''||GetItemName(e.ParentCode) as MaterialGroup,',
'      e.ItemCode,',
'      e.ItemName,',
'      ee.ItemSpecificationname,',
'      e.ItemName||'' ~ ''||ee.ItemSpecificationname as MaterialDetail,',
'      e.MeasuringUnitCode1 as UOM,',
'      b.Quantity1,',
'      e.MeasuringUnitCode2 as UOM2,',
'      b.Quantity2,',
'      b.WithoutDiscountRate,',
'      b.DiscountPercentage,',
'      b.DiscountRate,',
'      b.Rate,',
'      b.RateMeasuringUnitCode as RateUOM,',
'      b.Amount,',
'      Nvl(Decode(c.FooterHeadCode,''.CGST.'',c.FooterValue),0) as CGST,',
'      Nvl(Decode(c.FooterHeadCode,''.SGST.'',c.FooterValue),0) as SGST,',
'      Nvl(Decode(c.FooterHeadCode,''.IGST.'',c.FooterValue),0) as IGST,',
'      Nvl(Decode(c.FooterHeadCode,''.TCS.'',c.FooterValue),0) as TCS,',
'      b.FooterAmount,',
'      b.TotalAmount,',
'      bue.EmployeeName||'' ( ''||a.Creator||'' )'' as Creator,',
'      a.CreationTime,',
'      ''Details'' as Property,',
'      ''QUOTATION'' as Module',
'From  Quotation a,',
'      QuotationDetail b,',
'      QuotationDetailFooter c,',
'      Enquiry enq,',
'      Location l,',
'      Vendor p,                ',
'      Item e,',
'      ItemSpecification ee,',
'      BossUser bu,',
'      Employee bue',
'Where a.TNo = b.TNo',
'  and b.TNo = c.TNo(+)',
'  and b.SNo = c.SNo(+)',
'  and a.Locationcode = l.LocationCode(+)',
'  and a.EnquiryTNo = enq.TNo',
'  and a.PartyCode = p.VendorCode(+)  ',
'  and b.ItemCode = e.ItemCode(+)',
'  and b.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'  and a.Creator = bu.LoginName(+)',
'  and bu.EmployeeCode = bue.EmployeeCode(+)',
'  and ((:P709_TODOLIST = ''YES'') OR (:P709_NEXTPROCESS = ''YES'') OR (a.QuotationDate between :P709_FROMDATE and :P709_TODATE))',
'  and ( :P709_COMPANY IS NULL OR instr('':''||:P709_COMPANY||'':'','':''||a.companyCode||'':'') > 0 )',
'  and ( :P709_LOCATION IS NULL OR instr('':''||:P709_LOCATION||'':'','':''||a.locationCode||'':'') > 0 )',
'  and ( :P709_PARTY IS NULL OR instr('':''||:P709_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'  and ( :P709_ITEM IS NULL OR instr('':''||:P709_ITEM||'':'','':''||e.ItemCode||'':'') > 0 )',
'  and ( :P709_ITEMSPECIFICATION IS NULL OR instr('':''||:P709_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'  and ( :P709_ENQUIRY IS NULL OR instr('':''||:P709_ENQUIRY||'':'','':''||a.EnquiryTNo||'':'') > 0 )',
'  and ( :P709_GROUP IS NULL',
'        or',
'        exists (select 1 from (',
'                Select ITEMCODE,',
'                       parentcode,',
'                       RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'                       Level,',
'                       CONNECT_BY_ROOT itemcode As root_id,',
'                       ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'                       CONNECT_BY_ISLEAF As leaf',
'                From item a',
'                Start With parentcode in ( select itemcode from item xx',
'                                           where instr('':''||:P709_GROUP||'':'','':''||xx.ItemCode||'':'') > 0)',
'                Connect By parentcode = Prior itemcode',
'                Order Siblings By itemcode',
'            ) x where x.itemcode = e.itemcode',
'        )',
'    )',
') xx',
'Group By',
'        xx.TNo,',
'        xx.SNo,',
'        xx.LocationName,',
'        xx.QuotationNo,',
'        xx.QuotationDate,',
'        xx.EnquiryNo,',
'        xx.DifferenceDays,',
'        xx.ValidDays,',
'        xx.PartyName,',
'        xx.PartyQuotationNo,',
'        xx.PartyQuotationDate,',
'        xx.ValidityDate,',
'        xx.MaterialGroup,',
'        xx.ItemCode,',
'        xx.MaterialDetail,',
'        xx.UOM,',
'        xx.Quantity1,',
'        xx.UOM2,',
'        xx.Quantity2,',
'        xx.WithoutDiscountRate,',
'        xx.DiscountPercentage,',
'        xx.DiscountRate,',
'        xx.Rate,',
'        xx.RateUOM,',
'        xx.Amount,',
'        xx.FooterAmount,',
'        xx.TotalAmount,',
'        xx.Creator,',
'        xx.CreationTime',
') xxx',
'where ( :P709_TODOLIST=''NO'' OR (:P709_TODOLIST=''YES'' AND EXISTS ( SELECT 1 FROM ONTHETABLE_APEX YY WHERE YY.TNO=XXX.TNO) ))',
'AND   (:P709_NEXTPROCESS = ''NO'' OR (:P709_NEXTPROCESS = ''YES'' AND (  getdocumentstatuscode(''QUOTATION'',XXX.TNO)=''ACTIVE''',
'                                    AND  Not Exists (Select 1',
'                                                        From ComparativeStatementdetail AA',
'                                                       Where AA.Quotationtno = XXX.TNO)',
'                                 ))',
')'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P709_COMPANY,P709_LOCATION,P709_FROMDATE,P709_TODATE,P709_PARTY,P709_ITEM,P709_GROUP,P709_ITEMSPECIFICATION,P709_ENQUIRY,P709_TODOLIST,P709_NEXTPROCESS'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Quotation Report'
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
 p_id=>wwv_flow_imp.id(330444257046810927)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_report_saving=>'N'
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
,p_detail_link=>'f?p=&APP_ID.:710:&SESSION.::&DEBUG.::P710_TNO:#TNO#'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>',
''))
,p_internal_uid=>222162723246428620
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286237865165829804)
,p_db_column_name=>'AMOUNT'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286239923016829805)
,p_db_column_name=>'CGST'
,p_display_order=>340
,p_column_identifier=>'AH'
,p_column_label=>'CGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286239540386829805)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'CREATION TIME'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:100px">#CREATIONTIME#</div>',
''))
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286239136690829804)
,p_db_column_name=>'CREATOR'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'CREATOR'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:100px">#CREATOR#</div>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(292759930851819909)
,p_db_column_name=>'DIFFERENCEDAYS'
,p_display_order=>430
,p_column_identifier=>'AU'
,p_column_label=>'DIFFERENCE DAYS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286236751880829803)
,p_db_column_name=>'DISCOUNTPERCENTAGE'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'DISCOUNT %'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286237147448829803)
,p_db_column_name=>'DISCOUNTRATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'DISCOUNT RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286232745733829801)
,p_db_column_name=>'ENQUIRYNO'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'ENQUIRY NO'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:160px">#ENQUIRYNO#</div>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286238303444829804)
,p_db_column_name=>'FOOTERAMOUNT'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'FOOTER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286240662410829805)
,p_db_column_name=>'IGST'
,p_display_order=>360
,p_column_identifier=>'AJ'
,p_column_label=>'IGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286235105912829802)
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
 p_id=>wwv_flow_imp.id(286231538932829800)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286235503537829803)
,p_db_column_name=>'MATERIALDETAIL'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'MATERIAL DETAIL'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:250px">#MATERIALDETAIL#</div>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286234723590829802)
,p_db_column_name=>'MATERIALGROUP'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'MATERIAL GROUP'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:200px">#MATERIALGROUP#</div>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286242284573829806)
,p_db_column_name=>'OTHERAMOUNT'
,p_display_order=>400
,p_column_identifier=>'AN'
,p_column_label=>'OTHER AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(44670874900762169)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>460
,p_column_identifier=>'AX'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:160px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286233885433829802)
,p_db_column_name=>'PARTYQUOTATIONDATE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'PARTY QUOTATION DATE'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:100px">#PARTYQUOTATIONDATE#</div>',
''))
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286233529324829801)
,p_db_column_name=>'PARTYQUOTATIONNO'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'PARTY QUOTATION NO'
,p_column_html_expression=>'<div style="display:block; width:200px">#PARTYQUOTATIONNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286235958394829803)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'P QTY'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:50px">#QUANTITY1#</div>',
''))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286155132787094938)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>420
,p_column_identifier=>'AP'
,p_column_label=>'S QTY'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:50px">#QUANTITY2#</div>',
''))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286232320436829801)
,p_db_column_name=>'QUOTATIONDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'QUOTATION DATE'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286231947702829800)
,p_db_column_name=>'QUOTATIONNO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'QUOTATION NO'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:160px">#QUOTATIONNO#</div>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286237467859829804)
,p_db_column_name=>'RATE'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286241862878829806)
,p_db_column_name=>'RATEUOM'
,p_display_order=>390
,p_column_identifier=>'AM'
,p_column_label=>'UOM (RATE)'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:50px">#RATEUOM#</div>',
''))
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(301965124408486850)
,p_db_column_name=>'SERIALNO'
,p_display_order=>450
,p_column_identifier=>'AW'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286240353324829805)
,p_db_column_name=>'SGST'
,p_display_order=>350
,p_column_identifier=>'AI'
,p_column_label=>'SGST'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286231129785829800)
,p_db_column_name=>'SNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'SNO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286241149398829806)
,p_db_column_name=>'TCS'
,p_display_order=>370
,p_column_identifier=>'AK'
,p_column_label=>'TCS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286230737852829799)
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
 p_id=>wwv_flow_imp.id(286238719674829804)
,p_db_column_name=>'TOTALAMOUNT'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'TOTAL AMOUNT'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286241516659829806)
,p_db_column_name=>'UOM'
,p_display_order=>380
,p_column_identifier=>'AL'
,p_column_label=>'P UOM'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:50px">#UOM#</div>',
''))
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286154960092094937)
,p_db_column_name=>'UOM2'
,p_display_order=>410
,p_column_identifier=>'AO'
,p_column_label=>'S UOM'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:50px">#UOM2#</div>',
''))
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(292759984906819910)
,p_db_column_name=>'VALIDDAYS'
,p_display_order=>440
,p_column_identifier=>'AV'
,p_column_label=>'VALID DAYS'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286234276073829802)
,p_db_column_name=>'VALIDITYDATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'VALIDITY DATE'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:block; width:100px">#VALIDITYDATE#</div>',
''))
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286236286064829803)
,p_db_column_name=>'WITHOUTDISCOUNTRATE'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'WITHOUT DISCOUNT RATE'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(330610111849438825)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'41905'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:QUOTATIONNO:QUOTATIONDATE:ENQUIRYNO:PARTYQUOTATIONNO:PARTYQUOTATIONDATE:PARTYNAME:DIFFERENCEDAYS:VALIDDAYS:VALIDITYDATE:ITEMCODE:MATERIALDETAIL:UOM:QUANTITY1:UOM2:QUANTITY2:WITHOUTDISCOUNTRATE:DISCOUNTPERCENTAGE:DISCOUNTRATE:RATE:RATEUOM:AMO'
||'UNT:CGST:SGST:IGST:TCS:OTHERAMOUNT:TOTALAMOUNT:CREATOR:CREATIONTIME'
,p_sort_column_1=>'VENDORNAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'SERIALNO'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'QUOTATIONDATE'
,p_sort_direction_3=>'ASC'
,p_sum_columns_on_break=>'TCS:OTHERAMOUNT:FOOTERAMOUNT:TOTALAMOUNT:QUANTITY1:QUANTITY2:AMOUNT:CGST:SGST:IGST'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168770937434329027)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(439473576294649698)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:710:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168770604611329027)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(439473576294649698)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--danger'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168755417578329011)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'DEFINED_BY_DA'
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
 p_id=>wwv_flow_imp.id(286157819078094941)
,p_name=>'P709_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'    a.CompanyName d,',
'    a.CompanyCode r',
'From Company a',
'Where exists',
'(Select ',
'  b.Tno',
'  From Quotation b',
'  Where b.CompanyCode = a.CompanyCode)',
'Order by 1',
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
 p_id=>wwv_flow_imp.id(286651415956509843)
,p_name=>'P709_ENQUIRY'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_prompt=>'Enquiry No'
,p_placeholder=>'Select Enquiry No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      a.EnquiryNo d,',
'      a.TNo r',
'From  Enquiry a',
'Order by 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(286230105221829798)
,p_name=>'P709_FROMDATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_item_default=>'Trunc(Sysdate-3)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>52
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
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
 p_id=>wwv_flow_imp.id(321759028259560214)
,p_name=>'P709_GROUP'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_prompt=>'Group'
,p_placeholder=>'Enter Item Group Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Upper(a.ItemName || '' ( '' || a.ItemCode || '' )'') As d,',
'       a.ItemCode As r',
'  From Item a',
' Where a.ItemType = ''GROUP''',
' order by 2'))
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
 p_id=>wwv_flow_imp.id(286232079446829800)
,p_name=>'P709_ITEM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_prompt=>'Material'
,p_placeholder=>'Material List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select    Distinct',
'          e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'          e.ItemCode r',
'From QuotationDetail a, Item e',
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
 p_id=>wwv_flow_imp.id(286232920085829801)
,p_name=>'P709_ITEMSPECIFICATION'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'          ee.ItemSpecificationName as d,',
'          ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P709_ITEM',
' and e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P709_ITEM'
,p_ajax_items_to_submit=>'P709_ITEMSPECIFICATION'
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
 p_id=>wwv_flow_imp.id(286230846516829799)
,p_name=>'P709_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
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
'  and a.ModuleCode = ''QUOTATION''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order By 1',
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
 p_id=>wwv_flow_imp.id(306010468412831335)
,p_name=>'P709_NEXTPROCESS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(321758864210560213)
,p_name=>'P709_PARTY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_prompt=>'Vendor'
,p_placeholder=>'Enter Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'	Distinct',
'	p.VendorName d,',
'	p.VendorCode r',
'From Quotation a, Vendor p',
'Where a.PartyCode = p.VendorCode'))
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
 p_id=>wwv_flow_imp.id(286230528822829799)
,p_name=>'P709_TODATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>52
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
 p_id=>wwv_flow_imp.id(306010093391827268)
,p_name=>'P709_TODOLIST'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(439473481555649697)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(7711000000001701)
,p_name=>'Apply Quotation Filters'
,p_static_id=>'apply-quotation-filters'
,p_event_sequence=>5
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168755417578329011)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(7711000000001702)
,p_event_id=>wwv_flow_imp.id(7711000000001701)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'refresh-quotation-report'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(439473576294649698)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168772024915329027)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168770604611329027)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168772456071329027)
,p_event_id=>wwv_flow_imp.id(168772024915329027)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168772907809329028)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168773399718329028)
,p_event_id=>wwv_flow_imp.id(168772907809329028)
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
 p_id=>wwv_flow_imp.id(168771570182329027)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Quotation No'
,p_static_id=>'quotation-no'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P709_QUOTATIONNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P709_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P709_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>60490036381946720
);
wwv_flow_imp.component_end;
end;
/
