prompt --application/pages/page_00707
begin
--   Manifest
--     PAGE: 00707
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
 p_id=>707
,p_name=>'Enquiry Register'
,p_alias=>'ENQUIRY-REGISTER'
,p_step_title=>'Enquiry Register'
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
'  var bireporturl = $(''#P310_BIREPORTURL'').val()',
'  var reportName = ''Enquiry.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P310_FROMDATE'').val());',
'  var toDate = new Date($(''#P310_TODATE'').val());',
'  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY='' +$(''#P310_COMPANY'').val() +  ',
'     ''&P_LOCATION='' +$(''#P310_LOCATION'').val() +  ',
'     ''&P_FROMDATE='' +$(''#P310_FROMDATE'').val() +  ',
'     ''&P_TODATE='' +$(''#P310_TODATE'').val() +  ',
'     ''&P_PARTY='' +$(''#P310_PARTY'').val() +  ',
'     ''&P_QSTATUS='' +$(''#P310_QSTATUS'').val() +  ',
'     ''&P_GROUP='' +$(''#P310_GROUP'').val() +  ',
'     ''&P_ITEM='' +$(''#P310_ITEM'').val() +  ',
'     ''&P_ITEMSPECIFICATION='' +$(''#P310_ITEMSPECIFICATION'').val() ;',
'     ',
'       ',
'        var reportURL = bireporturl+ reportName +',
'              ''?id=''+ username +',
'              ''&passwd=''+ password +',
'              ''&_xpt=0&_xmode=1&_xf=pdf''+reportParams',
'  window.open(reportURL, ''_blank'');',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'#MYID.a-GV-row.is-hover, .a-IRR-table tr:hover td{',
'    background-color: #FFFACD;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(416786445827841741)
,p_plug_name=>'Enquiry Register'
,p_static_id=>'enquiry-register'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:is-collapsed:t-Region--accent1:t-Region--scrollBody:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(416786540566841742)
,p_plug_name=>'Enquiry Report'
,p_static_id=>'enquiry-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' Select',
'      row_number() over(order by A.Tno) SerialNo,',
'      a.tno,',
'      ei.SNo,',
'      l.LocationName,',
'      a.EnquiryNo,',
'      a.EnquiryDate,',
'      (Select',
'            Listagg(i.IndentNo||'' /  '')',
'      From  EnquiryIndentDetail eid, Indent i',
'      Where eid.IndentTNo = i.TNo',
'        and eid.TNo = a.TNo) as IndentNo,',
'      em.EmployeeName||'' ( ''||em.EmployeeID||'' )'' as Employee,',
'      e.ParentCode||'' ~ ''||GetitemName(e.ParentCode) as materialGroup,',
'      e.ItemCode,',
'      e.ItemName,',
'      ee.ItemSpecificationName,',
'      e.ItemName||'' ~ ''||ee.ItemSpecificationName as MaterialDetail,',
'      e.MeasuringUnitCode1,',
'      round(ei.Quantity1,3) as Quantity1,',
'      e.MeasuringUnitCode2,',
'      round(ei.Quantity2,3) as Quantity2,',
'      bue.EmployeeName||'' ( ''||a.Creator||'' )'' as Creator,',
'      a.CreationTime,',
'      nvl(decode(qq.EnquiryTNo,a.TNo,''PREPARED''),''PENDING'') as QuotationStatus,',
'      (Select',
'            Listagg(v.VendorName||'' /  '')',
'      From  EnquiryPartyDetail epd, Vendor v',
'      Where epd.PartyCode = v.VendorCode',
'        and epd.TNo = a.TNo) as VendorName,',
'      (Select',
'            Listagg(q.QuotationNo||'' /  '')',
'      From Quotation q',
'      Where a.TNo = q.EnquiryTNo(+)) as QuotationNo,',
'      (Select',
'            Listagg(q.QuotationDate||'' /  '')',
'      From Quotation q',
'      Where a.TNo = q.EnquiryTNo(+)) as QuotationDate,',
'            ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||9993||'':''||:APP_SESSION||''::::''||''P9993_TNO,P9993_REPNAME''||'':''||A.TNO||'',''||''PurchaseEnquiry''||'':NO'')||''"><span aria-label="Action"><span class="fa fa-print"  aria-hidden="true" ti'
||'tle="Action"></span</span></a>'' AS Print',
'',
'From  Enquiry a, Location l, Employee em, EnquiryItemDetail ei, Item e, ItemSpecification ee,  BossUser bu, Employee bue, Quotation qq',
'Where a.LocationCode = l.LocationCode(+)',
'  and a.EmployeeCode = em.EmployeeCode(+)',
'  and a.TNo = ei.TNo(+)',
'  and ei.ItemCode = e.ItemCode(+)',
'  and ei.ItemSpecificationCode = ee.ItemSpecificationCode(+)',
'  and a.Creator = bu.LoginName(+)',
'  and bu.EmployeeCode = bue.EmployeeCode(+)',
'  and a.TNo = qq.EnquiryTNo(+)',
'  and ( :P707_TODOLIST = ''YES'' OR :P707_NEXTPROCESS = ''YES'' OR a.EnquiryDate between :P707_FROMDATE and :P707_TODATE)',
'  --and ( :P707_TODOLIST = ''YES'' OR :P707_NEXTPROCESS =''YES''  OR instr('':''||:P707_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  --and ( :P707_TODOLIST = ''YES'' OR :P707_NEXTPROCESS =''YES'' OR instr('':''||:P707_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and ( :P707_COMPANY IS NULL OR instr('':''||:P707_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 ) ',
'  and ( :P707_LOCATION IS NULL OR instr('':''||:P707_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 ) ',
'  and ( :P707_PARTY IS NULL OR instr('':''||:P707_PARTY||'':'','':''||(Select p.PartyCode From EnquiryPartyDetail p Where p.TNo = a.TNo AND P.PARTYCODE=:P707_PARTY)||'':'') > 0 ) ',
'  and ( :P707_ITEM IS NULL OR instr('':''||:P707_ITEM||'':'','':''||e.ItemCode||'':'') > 0 ) ',
'  and ( :P707_ITEMSPECIFICATION IS NULL OR instr('':''||:P707_ITEMSPECIFICATION||'':'','':''||ee.ItemSpecificationCode||'':'') > 0 )',
'  --and ( :P707_GROUP IS NULL OR instr('':''||:P707_GROUP||'':'','':''||e.ParentCode||'':'') > 0 )',
'  and nvl(decode(qq.EnquiryTNo,a.TNo,''PREPARED''),''PENDING'') like nvl(:P707_QSTATUS,''%'')',
'  -- Added on 28-may-2022',
'  and ( :P707_GROUP IS NULL',
'      or',
'      exists (select 1 from (Select ITEMCODE,',
'               parentcode,',
'               RPAD(''.'', (Level - 1) * 2, ''.'') || itemcode As tree,',
'               Level,',
'               CONNECT_BY_ROOT itemcode As root_id,',
'               ''-'' || LTRIM(SYS_CONNECT_BY_PATH(itemcode, ''-''), ''-'') || ''-'' As path,',
'               CONNECT_BY_ISLEAF As leaf',
'          From item a',
'         Start With parentcode in ( select itemcode from item xx where',
'                                    instr('':''||:P707_GROUP||'':'','':''||xx.ItemCode||'':'') > 0)',
'                                    ',
'        Connect By parentcode = Prior itemcode',
'         Order Siblings By itemcode) x where x.itemcode = e.itemcode',
'        )',
'  )',
'  AND (:P707_TODOLIST=''NO'' OR  (:P707_TODOLIST=''YES'' AND EXISTS ( SELECT 1 FROM ONTHETABLE_APEX YY WHERE YY.TNO=A.TNO) ))',
'  AND (:P707_NEXTPROCESS=''NO'' OR (:P707_NEXTPROCESS = ''YES'' AND (  getdocumentstatuscode(''ENQUIRY'',A.TNO)=''ACTIVE''',
'                                    AND  NOT EXISTS (Select 1 From Quotation AA Where AA.EnquiryTno = A.TNO)',
'                                ))',
'',
' )'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Enquiry Report'
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
 p_id=>wwv_flow_imp.id(330007743936108756)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_report_saving=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:XLSX'
,p_enable_mail_download=>'N'
,p_detail_link=>'f?p=&APP_ID.:708:&SESSION.::&DEBUG.::P708_TNO:#TNO#'
,p_detail_link_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
' <span role="img" aria-label="Edit"><span class="fa fa-edit" aria-hidden="true" title="Edit"></span></span>',
''))
,p_internal_uid=>221726210135726449
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285562569815607436)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'CREATION TIME'
,p_column_html_expression=>'<div style="display:block; width:100px">#CREATIONTIME#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285562197522607436)
,p_db_column_name=>'CREATOR'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'CREATOR'
,p_column_html_expression=>'<div style="display:block; width:100px">#CREATOR#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285558559156607434)
,p_db_column_name=>'EMPLOYEE'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'EMPLOYEE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285558210316607434)
,p_db_column_name=>'ENQUIRYDATE'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'ENQUIRY DATE'
,p_column_html_expression=>'<div style="display:block; width:65px">#ENQUIRYDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285557814056607434)
,p_db_column_name=>'ENQUIRYNO'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'ENQUIRY NO'
,p_column_html_expression=>'<div style="display:block; width:140px">#ENQUIRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285902964530945490)
,p_db_column_name=>'INDENTNO'
,p_display_order=>200
,p_column_identifier=>'X'
,p_column_label=>'INDENT NO'
,p_column_html_expression=>'<div style="display:block; width:170px">#INDENTNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285559813403607435)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285560192983607435)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'ITEM NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285560588646607435)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'ITEM SPECIFICATION NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285557426390607434)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'LOCATION'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285561025278607435)
,p_db_column_name=>'MATERIALDETAIL'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'MATERIAL DETAIL'
,p_column_html_expression=>'<div style="display:block; width:250px">#MATERIALDETAIL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285559372783607434)
,p_db_column_name=>'MATERIALGROUP'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'MATERIAL GROUP'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285561421804607435)
,p_db_column_name=>'MEASURINGUNITCODE1'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'P UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#MEASURINGUNITCODE1#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285903186977945492)
,p_db_column_name=>'MEASURINGUNITCODE2'
,p_display_order=>220
,p_column_identifier=>'Z'
,p_column_label=>'S UOM'
,p_column_html_expression=>'<div style="display:block; width:60px">#MEASURINGUNITCODE2#</div>'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(113109741502329199)
,p_db_column_name=>'PRINT'
,p_display_order=>290
,p_column_identifier=>'AG'
,p_column_label=>'Print'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285561764211607435)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'P QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY1#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285903326970945493)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>230
,p_column_identifier=>'AA'
,p_column_label=>'S QTY'
,p_column_html_expression=>'<div style="display:block; width:60px">#QUANTITY2#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286396588450360392)
,p_db_column_name=>'QUOTATIONDATE'
,p_display_order=>260
,p_column_identifier=>'AD'
,p_column_label=>'QUOTATION DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUOTATIONDATE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286396383045360390)
,p_db_column_name=>'QUOTATIONNO'
,p_display_order=>240
,p_column_identifier=>'AB'
,p_column_label=>'QUOTATION NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#QUOTATIONNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(286396479110360391)
,p_db_column_name=>'QUOTATIONSTATUS'
,p_display_order=>250
,p_column_identifier=>'AC'
,p_column_label=>'QUOTATION STATUS'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUOTATIONSTATUS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(301713490780337407)
,p_db_column_name=>'SERIALNO'
,p_display_order=>270
,p_column_identifier=>'AE'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285557023563607433)
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
 p_id=>wwv_flow_imp.id(272921311096496896)
,p_db_column_name=>'TNO'
,p_display_order=>280
,p_column_identifier=>'AF'
,p_column_label=>'TNO'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(285903114960945491)
,p_db_column_name=>'VENDORNAME'
,p_display_order=>210
,p_column_identifier=>'Y'
,p_column_label=>'VENDOR NAME'
,p_column_html_expression=>'<div style="display:block; width:160px">#VENDORNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(330110672743946005)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'37635'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PRINT:SERIALNO:ENQUIRYDATE:ENQUIRYNO:INDENTNO:VENDORNAME:ITEMCODE:MATERIALDETAIL:MEASURINGUNITCODE1:QUANTITY1:MEASURINGUNITCODE2:QUANTITY2:CREATOR:CREATIONTIME:QUOTATIONSTATUS:QUOTATIONNO:QUOTATIONDATE'
,p_sort_column_1=>'SERIALNO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ENQUIRYDATE'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY1:QUANTITY2'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168644663382314361)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(416786540566841742)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:708:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168644234556314360)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(416786540566841742)
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
 p_id=>wwv_flow_imp.id(168632415006314349)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(274597075888381875)
,p_name=>'P707_BIREPORTURL'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285520954774114808)
,p_name=>'P707_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
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
'Where a.ModuleCode = ''ENQUIRY''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.'''))
,p_cSize=>30
,p_colspan=>8
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
 p_id=>wwv_flow_imp.id(33896342884825749)
,p_name=>'P707_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_item_default=>'trunc(sysdate) - 3'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(321515087882410795)
,p_name=>'P707_GROUP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_prompt=>'Group'
,p_placeholder=>'Enter Item Group Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select Upper(a.ItemName || '' ( '' || a.ItemCode || '' )'') As d,',
'       a.ItemCode As r',
'  From Item a',
' Where a.ItemType = ''GROUP''',
' order by 2',
' ',
'/*Select ',
'     Distinct',
'a.ItemName as d,',
'     a.Itemcode r',
'From Item a',
'Where a.ItemType = ''GROUP''',
'Order by 2',
'*/'))
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
 p_id=>wwv_flow_imp.id(285565705344607462)
,p_name=>'P707_ITEM'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_prompt=>'Material'
,p_placeholder=>'Material List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select    Distinct',
'          e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'          e.ItemCode r',
'From EnquiryItemDetail a, Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 2'))
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
 p_id=>wwv_flow_imp.id(285566578215607462)
,p_name=>'P707_ITEMSPECIFICATION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select    Distinct',
'          ee.ItemSpecificationName as d,',
'          ee.ItemSpecificationCode as r',
'',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P707_ITEM',
' and e.TNo = ee.TNo'))
,p_lov_cascade_parent_items=>'P707_ITEM'
,p_ajax_items_to_submit=>'P707_ITEMSPECIFICATION'
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
 p_id=>wwv_flow_imp.id(285564505335607461)
,p_name=>'P707_LOCATION'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location  Name'
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
'  and a.ModuleCode = ''ENQUIRY''',
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
 p_id=>wwv_flow_imp.id(301800062772768324)
,p_name=>'P707_NEXTPROCESS'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(316903863248185844)
,p_name=>'P707_PARTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_prompt=>'Vendor'
,p_placeholder=>'Enter Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'	Distinct',
'	p.VendorName d,',
'	p.VendorCode r',
'From EnquiryPartyDetail a, Vendor p',
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
 p_id=>wwv_flow_imp.id(286407342320360423)
,p_name=>'P707_QSTATUS'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:PENDING;PENDING,PREPARED;PREPARED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Quotation Status--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(285564196066607461)
,p_name=>'P707_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(301799981885768323)
,p_name=>'P707_TODOLIST'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(416786445827841741)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168645717936314361)
,p_name=>'Generate PDF'
,p_static_id=>'generate-pdf'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(168644234556314360)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168646148775314361)
,p_event_id=>wwv_flow_imp.id(168645717936314361)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'generatePDF();')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168646628040314361)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168647132736314361)
,p_event_id=>wwv_flow_imp.id(168646628040314361)
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
 p_id=>wwv_flow_imp.id(168645289104314361)
,p_process_sequence=>10
,p_process_point=>'BEFORE_BOX_BODY'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'  if :P707_ENQUIRYNO IS NOT NULL THEN',
'      SELECT X.FINANCIALYEARBEGIN INTO :P707_FROMDATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'      SELECT X.FINANCIALYEAREND INTO :P707_TODATE FROM FINANCIALYEAR X WHERE TRUNC(SYSDATE) BETWEEN X.FINANCIALYEARBEGIN AND X.FINANCIALYEAREND ;',
'  END IF;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>60363755303932054
);
wwv_flow_imp.component_end;
end;
/
