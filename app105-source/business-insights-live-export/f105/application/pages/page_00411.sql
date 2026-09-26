prompt --application/pages/page_00411
begin
--   Manifest
--     PAGE: 00411
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
 p_id=>411
,p_name=>'Order vs Dispatch'
,p_alias=>'ORDER-VS-DISPATCH'
,p_step_title=>'Order vs Dispatch'
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
'    ',
'  var username = ''weblogic'';',
'  var password = ''webboss123'';',
'  var bireporturl = $(''#P411_BIREPORTURL'').val()',
'  var reportName = ''IRONMART/REPORT/OrderVsDispatch.xdo'';',
'  var outputFormat = ''pdf'';',
'  var fromDate = new Date($(''#P411_FROMDATE'').val());',
'  var toDate = new Date($(''#P411_TODATE'').val());',
'  var companycode ;',
' ',
'  if($(''#P411_COMPANY'').val() ==="" || $(''#P411_COMPANY'').val() ===null)',
'  {',
'     companycode=''&GLOBAL_COMPANYCODE.'';',
'  } else{',
'      companycode = $(''#P411_COMPANY'').val();',
'  }  ',
'',
'     var reportParams = ',
'     ''&P_COMPANY=''+ companycode +  ',
'      ''&P_LOCATION='' + $(''#P411_LOCATION'').val() + ',
'      ''&P_FROMDATE='' +$(''#P411_FROMDATE'').val() + ',
'      ''&P_TODATE='' +$(''#P411_TODATE'').val() + ',
'       ''&P_TRADETYPE='' +$(''#P411_TRADETYPE'').val() +',
'       ''&P_PARTY='' +$(''#P411_PARTY'').val() +',
'       ''&GLOBAL_COMPANYCODE='' +''&GLOBAL_COMPANYCODE.'';',
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
'}',
'',
'#S_ORDER_VS_SALE th{',
'    TEXT-TRANSFORM: uppercase;',
'    LETTER-SPACING: 0.75PX;',
'}',
''))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(473474204760640357)
,p_plug_name=>'Order vs Dispatch'
,p_static_id=>'order-vs-dispatch'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(473474319816640358)
,p_plug_name=>'Order vs Dispatch Report'
,p_static_id=>'order-vs-dispatch-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH dispatch_route_orders AS (',
'    -- 1. FAST INDEXED TRACKING',
'    SELECT DISTINCT da.referencetno AS salesordertno',
'      FROM despatchadvice da',
'     WHERE da.referencetno IS NOT NULL',
'     UNION',
'    SELECT DISTINCT c.salesordertno',
'      FROM ccinvoice c',
'     WHERE c.despatchadvicetno IS NOT NULL ',
'       AND c.salesordertno IS NOT NULL',
'),',
'so_details AS (',
'    -- 2. Pre-aggregate Sales Order Lines',
'    SELECT sod.tno,',
'           SUM(NVL(sod.quantity2, sod.quantity1)) AS poquantity,',
'           COUNT(sod.sno) AS noofsku',
'      FROM salesorderdetail sod',
'     INNER JOIN dispatch_route_orders dro ON sod.tno = dro.salesordertno',
'     GROUP BY sod.tno',
'),',
'invoice_summary AS (',
'    -- 3. Pre-aggregate Invoices with DISTINCT logic to stop repetitions',
'    SELECT ci.salesordertno,',
'           LISTAGG(DISTINCT ci.ccinvoicedate, '', '') WITHIN GROUP (ORDER BY ci.ccinvoicedate) AS invoicedate,',
'           LISTAGG(DISTINCT ci.ccinvoiceno, '', '') WITHIN GROUP (ORDER BY ci.ccinvoiceno) AS invoiceno,',
'           LISTAGG(DISTINCT ci.vehicleno, '', '') WITHIN GROUP (ORDER BY ci.vehicleno) AS vehicleno,',
'           SUM(NVL(cid.quantity2, cid.quantity1)) AS invoiceqty,',
'           SUM(cid.totalamount) AS invoiceamount',
'      FROM ccinvoice ci',
'     INNER JOIN dispatch_route_orders dro ON ci.salesordertno = dro.salesordertno',
'      LEFT JOIN ccinvoicedetail cid       ON ci.tno = cid.tno',
'     WHERE ci.despatchadvicetno IS NOT NULL',
'     GROUP BY ci.salesordertno',
'),',
'despatch_summary AS (',
'    -- 4. Aggregate Despatch & Material Out network with DISTINCT logic',
'    SELECT da.referencetno AS salesordertno,',
'           -- DISTINCT added here to clear duplicate dispatch data and driver names',
'           LISTAGG(DISTINCT mo.materialoutno, '', '') WITHIN GROUP (ORDER BY mo.materialoutno) AS materialoutno,',
'           LISTAGG(DISTINCT mo.materialoutdate, '', '') WITHIN GROUP (ORDER BY mo.materialoutdate) AS materialoutdate,',
'           UPPER(LISTAGG(DISTINCT mo.drivername, '', '') WITHIN GROUP (ORDER BY mo.drivername)) AS drivername,',
'           LISTAGG(DISTINCT mo.drivermobileno, '', '') WITHIN GROUP (ORDER BY mo.drivermobileno) AS drivermobileno,',
'           LISTAGG(DISTINCT da.despatchadviceno, '', '') WITHIN GROUP (ORDER BY da.despatchadviceno) AS despatchadviceno,',
'           LISTAGG(DISTINCT da.despatchadvicedate, '', '') WITHIN GROUP (ORDER BY da.despatchadvicedate) AS despatchadvicedate',
'      FROM despatchadvice da',
'     INNER JOIN dispatch_route_orders dro ON da.referencetno = dro.salesordertno',
'     INNER JOIN materialout mo            ON da.tno = mo.referencetno',
'     GROUP BY da.referencetno',
')',
'--,sales_grn_summary AS (',
'--    -- 5. Aggregate Sales GRN with DISTINCT logic',
'--    SELECT ci.salesordertno,',
'--           -- DISTINCT added here to clear duplicate GRN data',
'--           LISTAGG(DISTINCT sg.salesgrndate, '', '') WITHIN GROUP (ORDER BY sg.salesgrndate) AS salesgrndate,',
'--           LISTAGG(DISTINCT sg.salesgrnno, '', '') WITHIN GROUP (ORDER BY sg.salesgrnno) AS salesgrnno,',
'--           SUM(NVL(sgd.quantity2, sgd.quantity1)) AS reachedqty',
'--      FROM ccinvoice ci',
'--     INNER JOIN dispatch_route_orders dro ON ci.salesordertno = dro.salesordertno',
'--     INNER JOIN salesgrn sg               ON ci.tno = sg.ccinvoicetno',
'--      LEFT JOIN salesgrndetail sgd        ON sg.tno = sgd.tno',
'--     WHERE ci.despatchadvicetno IS NOT NULL',
'--     GROUP BY ci.salesordertno',
'--)',
'-- MAIN SELECT QUERY',
'SELECT ROW_NUMBER() OVER(ORDER BY a.tno) AS serialno,',
'       l.locationname,',
'       p.partyname,',
'       a.salesorderdate,',
'       a.salesorderno,',
'       a.partypono,',
'       a.partypodate,',
'       a.validityuptodate,',
'       (a.partypodate - a.validityuptodate) AS overduedays,',
'       ',
'       NVL(sod.poquantity, 0) AS poquantity,',
'       NVL(sod.noofsku, 0) AS noofsku,',
'       ',
'       CASE WHEN a.tno IS NOT NULL THEN ''NO'' ELSE ''YES'' END AS pocorrection,',
'       ',
'       RTRIM(inv.invoicedate, '', '') AS invoicedate,',
'       RTRIM(inv.invoiceno, '', '') AS invoiceno,',
'       RTRIM(inv.vehicleno, '', '') AS vehicleno,',
'       NVL(inv.invoiceqty, 0) AS invoiceqty,',
'       NVL(inv.invoiceamount, 0) AS invoiceamount,',
'       ',
'       RTRIM(dsp.materialoutno, '', '') AS materialoutno,',
'       RTRIM(dsp.materialoutdate, '', '') AS materialoutdate,',
'       RTRIM(dsp.drivername, '', '') AS drivername,',
'       RTRIM(dsp.drivermobileno, '', '') AS drivermobileno,',
'       RTRIM(dsp.despatchadviceno, '', '') AS despatchadviceno,',
'       RTRIM(dsp.despatchadvicedate, '', '') AS despatchadvicedate',
'       ',
'--       la.loadingadviceno, ',
'--       la.loadingadvicedate,',
'--       ',
'--       RTRIM(grn.salesgrndate, '', '') AS salesgrndate,',
'--       RTRIM(grn.salesgrnno, '', '') AS salesgrnno,',
'--       NVL(grn.reachedqty, 0) AS reachedqty        ',
'  FROM salesorder a',
'  ',
'  INNER JOIN dispatch_route_orders dro ON a.tno = dro.salesordertno',
'  ',
'  LEFT JOIN party p            ON a.partycode = p.partycode',
'  LEFT JOIN party cg           ON a.consigneecode = cg.partycode',
'  LEFT JOIN location l         ON a.locationcode = l.locationcode',
'  LEFT JOIN city fc            ON a.fromcitycode = fc.citycode',
'  LEFT JOIN city tc            ON a.tocitycode = tc.citycode ',
'--  LEFT JOIN loadingadvice la   ON a.tno = la.salesordertno',
'  ',
'  LEFT JOIN so_details sod     ON a.tno = sod.tno',
'  LEFT JOIN invoice_summary inv ON a.tno = inv.salesordertno',
'  LEFT JOIN despatch_summary dsp ON a.tno = dsp.salesordertno',
'--  LEFT JOIN sales_grn_summary grn ON a.tno = grn.salesordertno',
'  ',
' WHERE a.salesorderdate BETWEEN :P411_FROMDATE AND :P411_TODATE',
'   AND (:P411_COMPANY IS NULL OR INSTR('':'' || :P411_COMPANY || '':'', '':'' || a.companycode || '':'') > 0) ',
'   AND (:P411_LOCATION IS NULL OR INSTR('':'' || :P411_LOCATION || '':'', '':'' || a.locationcode || '':'') > 0) ',
'   AND (:P411_PARTY IS NULL OR INSTR('':'' || :P411_PARTY || '':'', '':'' || a.partycode || '':'') > 0);',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_display_condition_type=>'NEVER'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Order vs Dispatch Report'
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
 p_id=>wwv_flow_imp.id(473474589559640361)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>34489720359942377
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462521152949715734)
,p_db_column_name=>'DESPATCHADVICEDATE'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'DESPATCH ADVICE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#DESPATCHADVICEDATE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462521018862715733)
,p_db_column_name=>'DESPATCHADVICENO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'DESPATCH ADVICE NO'
,p_column_html_expression=>'<div style="display:block; width:120px">#DESPATCHADVICENO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473476491602640380)
,p_db_column_name=>'DRIVERMOBILENO'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'DRIVER MOBILE NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#DRIVERMOBILENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473476471983640379)
,p_db_column_name=>'DRIVERNAME'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'DRIVER NAME'
,p_column_html_expression=>'<div style="display:block; width:120px">#DRIVERNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473476300903640378)
,p_db_column_name=>'INVOICEAMOUNT'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'INVOICE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:90px">#INVOICEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473475919906640374)
,p_db_column_name=>'INVOICEDATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'INVOICE DATE'
,p_column_html_expression=>'<div style="display:block; width:90px">#INVOICEDATE#</div>'
,p_column_type=>'STRING'
,p_format_mask=>'DD-MM-YYYY'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473476036870640375)
,p_db_column_name=>'INVOICENO'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'INVOICE NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#INVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473476201512640377)
,p_db_column_name=>'INVOICEQTY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'INVOICE QTY'
,p_column_html_expression=>'<div style="display:block; width:80px">#INVOICEQTY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473474718517640362)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:140px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462520929443715732)
,p_db_column_name=>'MATERIALOUTDATE'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'MATERIAL OUT DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#MATERIALOUTDATE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(462520857764715731)
,p_db_column_name=>'MATERIALOUTNO'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'MATERIAL OUT NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#MATERIALOUTNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473475450952640369)
,p_db_column_name=>'NOOFSKU'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'NO OF SKU'
,p_column_html_expression=>'<div style="display:block; width:80px">#NOOFSKU#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473475195981640367)
,p_db_column_name=>'OVERDUEDAYS'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'OVERDUE DAYS'
,p_column_html_expression=>'<div style="display:block; width:80px">#OVERDUEDAYS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473474814893640363)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'PARTY NAME'
,p_column_html_expression=>'<div style="display:block; width:250px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473475070134640365)
,p_db_column_name=>'PARTYPODATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'PARTY PO DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYPODATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473474962268640364)
,p_db_column_name=>'PARTYPONO'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'PARTY PO NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#PARTYPONO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473475522440640370)
,p_db_column_name=>'POCORRECTION'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'PO CORRECTION'
,p_column_html_expression=>'<div style="display:block; width:120px">#POCORRECTION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473475346063640368)
,p_db_column_name=>'POQUANTITY'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'PO QUANTITY'
,p_column_html_expression=>'<div style="display:block; width:80px">#POQUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463761294148538487)
,p_db_column_name=>'SALESORDERDATE'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'SALES ORDER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#SALESORDERDATE#</div>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463761376299538488)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>300
,p_column_identifier=>'AD'
,p_column_label=>'SALES ORDER NO'
,p_column_html_expression=>'<div style="display:block; width:170px">#SALESORDERNO#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189650774123099753)
,p_db_column_name=>'SERIALNO'
,p_display_order=>310
,p_column_identifier=>'AE'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473475082957640366)
,p_db_column_name=>'VALIDITYUPTODATE'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'VALIDITY UPTO'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALIDITYUPTODATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-YYYY'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(473476108079640376)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'VEHICLE NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(473687151769099868)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'33532'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:LOCATIONNAME:PARTYNAME:SALESORDERNO:SALESORDERDATE:PARTYPONO:PARTYPODATE:POQUANTITY:VALIDITYUPTODATE:OVERDUEDAYS:DESPATCHADVICENO:DESPATCHADVICEDATE:VEHICLENO:DRIVERNAME:DRIVERMOBILENO:MATERIALOUTNO:MATERIALOUTDATE:INVOICENO:INVOICEDATE:INVO'
||'ICEQTY:INVOICEAMOUNT'
,p_sort_column_1=>'SALESORDERDATE'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PARTYPODATE'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'POQUANTITY:INVOICEQTY:INVOICEAMOUNT:REACHEDQTY'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(59660745800184918)
,p_plug_name=>'Order vs Sale'
,p_static_id=>'order-vs-sale'
,p_region_name=>'S_ORDER_VS_SALE'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH Sum_SO AS (',
'    SELECT ',
'         TNO, ',
'         SUM(NVL(QUANTITY1, 0)) AS TOTAL_SO_QTY,',
'         SUM(NVL(AMOUNT, 0)) AS TOTAL_SO_AMT',
'    FROM SALESORDERDETAIL',
'    GROUP BY TNO',
'),',
'Sum_DA AS (',
'    SELECT da.REFERENCETNO,',
'           COUNT(DISTINCT da.TNO) AS TOTAL_DESPATCH_ADVICE,',
'           SUM(NVL(dad.QUANTITY1, 0)) AS TOTAL_DESPATCH_QTY,',
'           LISTAGG(DISTINCT ''<a href="'' || ',
'                   CASE ',
'                       WHEN check_module_view_access(''DESPATCHADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                           APEX_PAGE.GET_URL(p_page => 161, p_items => ''P161_TNO'', p_values => TO_CHAR(da.TNO))',
'                       ELSE',
'                           APEX_PAGE.GET_URL(p_page => 411)',
'                   END || ''" class="apex-report-link">'' || da.DespatchAdviceNo || ''</a>'', '', '' ',
'                   ON OVERFLOW TRUNCATE ''...'' WITH COUNT) WITHIN GROUP (ORDER BY da.DespatchAdviceNo) AS DESPATCH_ADVICE_LIST',
'    FROM DespatchAdvice da',
'    LEFT JOIN DESPATCHADVICEDETAIL dad ON da.TNO = dad.TNO',
'    GROUP BY da.REFERENCETNO',
'),',
'Sum_LA AS (',
'    SELECT la.SALESORDERTNO,',
'           COUNT(DISTINCT la.TNO) AS TOTAL_LOADING_ADVICE,',
'           SUM(NVL(lad.QUANTITY1, 0)) AS TOTAL_LOADING_QTY,',
'           LISTAGG(DISTINCT ''<a href="'' || ',
'                   CASE ',
'                       WHEN check_module_view_access(''LOADINGADVICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                           APEX_PAGE.GET_URL(p_page => 155, p_items => ''P155_TNO'', p_values => TO_CHAR(la.TNO))',
'                       ELSE',
'                           APEX_PAGE.GET_URL(p_page => 411)',
'                   END || ''" class="apex-report-link">'' || la.LoadingAdviceNo || ''</a>'', '', ''',
'                   ON OVERFLOW TRUNCATE ''...'' WITH COUNT) WITHIN GROUP (ORDER BY la.LoadingAdviceNo) AS LOADING_ADVICE_LIST',
'    FROM LoadingAdvice la',
'    LEFT JOIN LOADINGADVICEDETAIL lad ON la.TNO = lad.TNO',
'    GROUP BY la.SALESORDERTNO',
'),',
'Sum_CI_DA_Path AS (',
'    SELECT da.REFERENCETNO AS SALESORDER_TNO,',
'           COUNT(DISTINCT ci.TNO) AS TOTAL_INVOICES,',
'           SUM(NVL(cid.QUANTITY1, 0)) AS TOTAL_INVOICE_QUANTITY,',
'           SUM(NVL(cid.TOTALAMOUNT, 0)) AS TOTAL_INVOICE_AMOUNT, ',
'           LISTAGG(DISTINCT ''<a href="'' || ',
'                   CASE ',
'                       WHEN check_module_view_access(''CCINVOICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                           APEX_PAGE.GET_URL(p_page => 175, p_items => ''P175_TNO'', p_values => TO_CHAR(ci.TNO))',
'                       ELSE',
'                           APEX_PAGE.GET_URL(p_page => 411)',
'                   END || ''" class="apex-report-link">'' || ci.CCINVOICENO || ''</a>'', '', ''',
'                   ON OVERFLOW TRUNCATE ''...'' WITH COUNT) WITHIN GROUP (ORDER BY ci.CCINVOICENO) AS INVOICE_LIST',
'    FROM CCINVOICE ci',
'    JOIN DespatchAdvice da ON ci.DESPATCHADVICETNO = da.TNO',
'    LEFT JOIN CCINVOICEDETAIL cid ON ci.TNO = cid.TNO',
'    GROUP BY da.REFERENCETNO',
'),',
'Sum_CI_LA_Path AS (',
'    SELECT la.SALESORDERTNO AS SALESORDER_TNO,',
'           COUNT(DISTINCT ci.TNO) AS TOTAL_INVOICES,',
'           SUM(NVL(cid.QUANTITY1, 0)) AS TOTAL_INVOICE_QUANTITY,',
'           SUM(NVL(cid.TOTALAMOUNT, 0)) AS TOTAL_INVOICE_AMOUNT, ',
'           LISTAGG(DISTINCT ''<a href="'' || ',
'                   CASE ',
'                       WHEN check_module_view_access(''CCINVOICE'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                           APEX_PAGE.GET_URL(p_page => 175, p_items => ''P175_TNO'', p_values => TO_CHAR(ci.TNO))',
'                       ELSE',
'                           APEX_PAGE.GET_URL(p_page => 411)',
'                   END || ''" class="apex-report-link">'' || ci.CCINVOICENO || ''</a>'', '', ''',
'                   ON OVERFLOW TRUNCATE ''...'' WITH COUNT) WITHIN GROUP (ORDER BY ci.CCINVOICENO) AS INVOICE_LIST',
'    FROM CCINVOICE ci',
'    JOIN LoadingAdvice la ON ci.LoadingAdviceTNo = la.TNO',
'    LEFT JOIN CCINVOICEDETAIL cid ON ci.TNO = cid.TNO',
'    GROUP BY la.SALESORDERTNO',
'),',
'Invoice_Chain_Map AS (',
'    SELECT ',
'        im.TNO AS INVOICE_TNO,',
'        COALESCE(da.REFERENCETNO, la.SALESORDERTNO) AS SALESORDER_TNO',
'    FROM INVOICE im',
'    JOIN CCINVOICE ci ON im.MODULETNO = ci.TNO AND im.MODULECODE = ''CCINVOICE''',
'    LEFT JOIN DespatchAdvice da ON ci.DESPATCHADVICETNO = da.TNO',
'    LEFT JOIN LoadingAdvice la ON ci.LoadingAdviceTNo = la.TNO',
'),',
'Sum_Receipts AS (',
'    SELECT ',
'        m.SALESORDER_TNO,',
'        COUNT(DISTINCT r.TNO) AS TOTAL_RECEIPTS,',
'        SUM(NVL(rd.AMOUNT, 0)) AS TOTAL_PAYMENT_RECEIVED,',
'        LISTAGG(DISTINCT ''<a href="'' || ',
'               CASE ',
'                   WHEN check_module_view_access(''BILLRECEIPT'', :APP_USER, :GLOBAL_COMPANYCODE) = 1 THEN',
'                       APEX_PAGE.GET_URL(p_page => 191, p_items => ''P191_TNO'', p_values => TO_CHAR(r.TNO))',
'                   ELSE',
'                       APEX_PAGE.GET_URL(p_page => 411)',
'               END || ''" class="apex-report-link">'' || r.DFREIGHTBILLRECEIPTNO || ''</a>'', '', ''',
'               ON OVERFLOW TRUNCATE ''...'' WITH COUNT) WITHIN GROUP (ORDER BY r.DFREIGHTBILLRECEIPTNO) AS RECEIPT_NO_LIST',
'    FROM dfreightbillreceiptdetail rd',
'    JOIN dfreightbillreceipt r ON rd.TNO = r.TNO',
'    JOIN Invoice_Chain_Map m ON rd.MODULETNO = m.INVOICE_TNO AND rd.MODULECODE = ''INVOICE''',
'    GROUP BY m.SALESORDER_TNO',
'),',
'Report_Base AS (',
'    SELECT ',
'         so.TNO AS SALESORDER_TNO,',
'         so.SalesOrderNo,',
'         so.SalesOrderDate,',
'         P.PARTYNAME,',
'         NVL(sso.TOTAL_SO_QTY, 0) AS TOTAL_SO_QTY,',
'         NVL(sso.TOTAL_SO_AMT, 0) AS TOTAL_SO_AMT,',
'         NVL(sda.TOTAL_DESPATCH_ADVICE, 0) AS TOTAL_DESPATCH_ADVICE,',
'         NVL(sda.TOTAL_DESPATCH_QTY, 0) AS TOTAL_DESPATCH_QTY,',
'         sda.DESPATCH_ADVICE_LIST,',
'         NVL(sla.TOTAL_LOADING_ADVICE, 0) AS TOTAL_LOADING_ADVICE,',
'         NVL(sla.TOTAL_LOADING_QTY, 0) AS TOTAL_LOADING_QTY,',
'         sla.LOADING_ADVICE_LIST,',
'         NVL(cid_da.TOTAL_INVOICES, 0) + NVL(cid_la.TOTAL_INVOICES, 0) AS TOTAL_INVOICES,',
'         NVL(cid_da.TOTAL_INVOICE_QUANTITY, 0) + NVL(cid_la.TOTAL_INVOICE_QUANTITY, 0) AS TOTAL_INVOICE_QUANTITY,',
'         NVL(cid_da.TOTAL_INVOICE_AMOUNT, 0) + NVL(cid_la.TOTAL_INVOICE_AMOUNT, 0) AS TOTAL_INVOICE_AMOUNT,',
'         NVL(sso.TOTAL_SO_QTY, 0) - (NVL(cid_da.TOTAL_INVOICE_QUANTITY, 0) + NVL(cid_la.TOTAL_INVOICE_QUANTITY, 0)) AS BALANCE_QTY,',
'         CASE ',
'            WHEN cid_da.INVOICE_LIST IS NOT NULL AND cid_la.INVOICE_LIST IS NOT NULL ',
'            THEN SUBSTR(cid_da.INVOICE_LIST || '', '' || cid_la.INVOICE_LIST, 1, 3900) || ''...''',
'            ELSE COALESCE(cid_da.INVOICE_LIST, cid_la.INVOICE_LIST)',
'         END AS INVOICE_LIST,',
'         NVL(rcpt.TOTAL_RECEIPTS, 0) AS TOTAL_RECEIPTS,',
'         NVL(rcpt.TOTAL_PAYMENT_RECEIVED, 0) AS TOTAL_PAYMENT_RECEIVED,',
'         rcpt.RECEIPT_NO_LIST AS DFREIGHTBILLRECEIPTNO_LIST,',
'         sda.REFERENCETNO AS DA_REF_CHECK,',
'         sla.SALESORDERTNO AS LA_REF_CHECK',
'    FROM SalesOrder so',
'    LEFT JOIN PARTY P ON P.PARTYCODE = SO.PARTYCODE',
'    LEFT JOIN Sum_SO sso ON so.TNO = sso.TNO',
'    LEFT JOIN Sum_DA sda ON so.TNO = sda.REFERENCETNO  ',
'    LEFT JOIN Sum_LA sla ON so.TNO = sla.SALESORDERTNO  ',
'    LEFT JOIN Sum_CI_DA_Path cid_da ON so.TNO = cid_da.SALESORDER_TNO',
'    LEFT JOIN Sum_CI_LA_Path cid_la ON so.TNO = cid_la.SALESORDER_TNO',
'    LEFT JOIN Sum_Receipts rcpt ON so.TNO = rcpt.SALESORDER_TNO',
'    WHERE SO.salesorderdate BETWEEN :P411_FROMDATE AND :P411_TODATE',
'       AND (:P411_COMPANY IS NULL OR INSTR('':'' || :P411_COMPANY || '':'', '':'' || SO.companycode || '':'') > 0) ',
'       AND (:P411_LOCATION IS NULL OR INSTR('':'' || :P411_LOCATION || '':'', '':'' || SO.locationcode || '':'') > 0) ',
'       AND (:P411_PARTY IS NULL OR INSTR('':'' || :P411_PARTY || '':'', '':'' || SO.partycode || '':'') > 0)',
'),',
'Status_Calculations AS (',
'    SELECT ',
'        rb.*,',
'        (TOTAL_INVOICE_AMOUNT - TOTAL_PAYMENT_RECEIVED) AS FINAL_BALANCE_AMOUNT_AGAINST_INV,',
'        (TOTAL_SO_AMT - TOTAL_PAYMENT_RECEIVED) AS FINAL_BALANCE_AMOUNT_AGAINST_SO,',
'        ',
'        CASE ',
'            WHEN DA_REF_CHECK IS NULL AND LA_REF_CHECK IS NULL THEN ''Fresh / Pending''',
'            WHEN BALANCE_QTY <= 0 THEN ''Fully Invoiced''',
'            ELSE ''Partially Processed''',
'        END AS DISPATCH_STATUS,',
'',
'        CASE ',
'            WHEN TOTAL_PAYMENT_RECEIVED <= 0 THEN ''Not Paid''',
'            WHEN (TOTAL_SO_AMT - TOTAL_PAYMENT_RECEIVED) <= 0 THEN ''Fully Paid''',
'            WHEN TOTAL_PAYMENT_RECEIVED > TOTAL_INVOICE_AMOUNT THEN ''Over Paid''',
'            ELSE ''Partially Paid''',
'        END AS PAYMENT_STATUS',
'    FROM Report_Base rb -- <--- FIXED: Explicit Anchor added here',
')',
'SELECT ',
'    SALESORDER_TNO, SalesOrderNo, SalesOrderDate, PARTYNAME,',
'    TOTAL_SO_QTY, TOTAL_SO_AMT, TOTAL_DESPATCH_ADVICE, TOTAL_DESPATCH_QTY,',
'    DESPATCH_ADVICE_LIST, TOTAL_LOADING_ADVICE, TOTAL_LOADING_QTY, LOADING_ADVICE_LIST,',
'    TOTAL_INVOICES, TOTAL_INVOICE_QUANTITY, TOTAL_INVOICE_AMOUNT, BALANCE_QTY, INVOICE_LIST,',
'    TOTAL_RECEIPTS, TOTAL_PAYMENT_RECEIVED, DFREIGHTBILLRECEIPTNO_LIST,',
'    FINAL_BALANCE_AMOUNT_AGAINST_INV, FINAL_BALANCE_AMOUNT_AGAINST_SO,',
'    DISPATCH_STATUS,',
'    ',
'    DECODE(DISPATCH_STATUS, ''Fresh / Pending'', ''#FEE2E2'', ''Partially Processed'', ''#FEF3C7'', ''Fully Invoiced'', ''#D1FAE5'') AS DISPATCH_BG,',
'    DECODE(DISPATCH_STATUS, ''Fresh / Pending'', ''#991B1B'', ''Partially Processed'', ''#92400E'', ''Fully Invoiced'', ''#065F46'') AS DISPATCH_FG,',
'    ',
'    PAYMENT_STATUS,',
'    ',
'    DECODE(PAYMENT_STATUS, ''Not Paid'', ''#FEE2E2'', ''Partially Paid'', ''#FEF3C7'', ''Fully Paid'', ''#D1FAE5'', ''Over Paid'', ''#E0F2FE'') AS PAYMENT_BG,',
'    DECODE(PAYMENT_STATUS, ''Not Paid'', ''#991B1B'', ''Partially Paid'', ''#92400E'', ''Fully Paid'', ''#065F46'', ''Over Paid'', ''#0369A1'') AS PAYMENT_FG',
'FROM Status_Calculations',
'ORDER BY SalesOrderDate DESC, SalesOrderNo;'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(59663982239184950)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:171:P171_TNO:#SALESORDER_TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>42196970113955634
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59727733402689617)
,p_db_column_name=>'BALANCE_QTY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Balance Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664896605184959)
,p_db_column_name=>'DESPATCH_ADVICE_LIST'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Despatch Advice List'
,p_column_html_expression=>'<div style="display:block; width: 175px">#DESPATCH_ADVICE_LIST#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59861714985688917)
,p_db_column_name=>'DFREIGHTBILLRECEIPTNO_LIST'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Receipt No''s'
,p_column_html_expression=>'<div style="display:block; width: 150px">#DFREIGHTBILLRECEIPTNO_LIST#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59862196736688921)
,p_db_column_name=>'DISPATCH_BG'
,p_display_order=>240
,p_column_identifier=>'X'
,p_column_label=>'Dispatch Bg'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59862253433688922)
,p_db_column_name=>'DISPATCH_FG'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Dispatch Fg'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59861947132688919)
,p_db_column_name=>'DISPATCH_STATUS'
,p_display_order=>220
,p_column_identifier=>'V'
,p_column_label=>'Dispatch Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="t-Badge t-Badge--medium t-Badge--pill" ',
'      style="font-weight: 600; width: 140px; display: inline-block; text-align: center; padding: 5px 12px;',
'             background-color: #DISPATCH_BG#;',
'             color: #DISPATCH_FG#;">',
'    #DISPATCH_STATUS#',
'</span>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59862585185688925)
,p_db_column_name=>'FINAL_BALANCE_AMOUNT_AGAINST_INV'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'Amount Due'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:flex; align-items:center; width: 150px; font-family: ''Segoe UI'', Roboto, sans-serif; font-size: 14px; color: #1e293b;">',
unistr('    <span style="padding: 2px 6px; background-color: #e2e8f0; color: #475569; border-radius: 4px; font-weight: bold; margin-right: 6px;">\20B9</span>'),
'    <span style="font-weight: 600;">#FINAL_BALANCE_AMOUNT_AGAINST_INV#</span>',
'</div>',
''))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59862677842688926)
,p_db_column_name=>'FINAL_BALANCE_AMOUNT_AGAINST_SO'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'Order Amount Due'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div style="display:flex; align-items:center; width: 150px; font-family: ''Segoe UI'', Roboto, sans-serif; font-size: 14px; color: #1e293b;">',
unistr('    <span style="padding: 2px 6px; background-color: #e2e8f0; color: #475569; border-radius: 4px; font-weight: bold; margin-right: 6px;">\20B9</span>'),
'    <span style="font-weight: 600;">#FINAL_BALANCE_AMOUNT_AGAINST_SO#</span>',
'</div>',
''))
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59665452235184965)
,p_db_column_name=>'INVOICE_LIST'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Invoice No''s'
,p_column_html_expression=>'<div style="display:block; width: 120px">#INVOICE_LIST#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59665130999184962)
,p_db_column_name=>'LOADING_ADVICE_LIST'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Loading Advice List'
,p_column_html_expression=>'<div style="display:block; width: 175px">#LOADING_ADVICE_LIST#</div>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664325279184954)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Party name'
,p_column_html_expression=>'<div style="display:block; width: 250px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59862388507688923)
,p_db_column_name=>'PAYMENT_BG'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'Payment Bg'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59862434913688924)
,p_db_column_name=>'PAYMENT_FG'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'Payment Fg'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59862026974688920)
,p_db_column_name=>'PAYMENT_STATUS'
,p_display_order=>230
,p_column_identifier=>'W'
,p_column_label=>'Payment Status'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="t-Badge t-Badge--medium t-Badge--pill" ',
'      style="font-weight: 600; width: 120px; display: inline-block; text-align: center; padding: 5px 12px;',
'             background-color: #PAYMENT_BG#;',
'             color: #PAYMENT_FG#;">',
'    #PAYMENT_STATUS#',
'</span>',
''))
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664212637184953)
,p_db_column_name=>'SALESORDERDATE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Sales order date'
,p_column_html_expression=>'<div style="display:block; width: 90px">#SALESORDERDATE#</div>'
,p_column_type=>'DATE'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664204894184952)
,p_db_column_name=>'SALESORDERNO'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Sales order no'
,p_column_html_expression=>'<div style="display:block; width: 120px">#SALESORDERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664103148184951)
,p_db_column_name=>'SALESORDER_TNO'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Salesorder Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664638098184957)
,p_db_column_name=>'TOTAL_DESPATCH_ADVICE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Total Despatch Advice'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664754356184958)
,p_db_column_name=>'TOTAL_DESPATCH_QTY'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Total Despatch Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59665232098184963)
,p_db_column_name=>'TOTAL_INVOICES'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Total Invoices'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59665573940184966)
,p_db_column_name=>'TOTAL_INVOICE_AMOUNT'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Total Invoice Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59665342094184964)
,p_db_column_name=>'TOTAL_INVOICE_QUANTITY'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Total Invoice Quantity'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664932866184960)
,p_db_column_name=>'TOTAL_LOADING_ADVICE'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Total Loading Advice'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59665052498184961)
,p_db_column_name=>'TOTAL_LOADING_QTY'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Total Loading Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59732675493689666)
,p_db_column_name=>'TOTAL_PAYMENT_RECEIVED'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Total Payment Received'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59732565493689665)
,p_db_column_name=>'TOTAL_RECEIPTS'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Total Receipts'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664521500184956)
,p_db_column_name=>'TOTAL_SO_AMT'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Total So Amt'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(59664452501184955)
,p_db_column_name=>'TOTAL_SO_QTY'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Total So Qty'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D000'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(59721265200664274)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'422543'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SALESORDERNO:SALESORDERDATE:PARTYNAME:TOTAL_SO_QTY:TOTAL_SO_AMT:TOTAL_DESPATCH_ADVICE:TOTAL_DESPATCH_QTY:DESPATCH_ADVICE_LIST:TOTAL_LOADING_ADVICE:TOTAL_LOADING_QTY:LOADING_ADVICE_LIST:TOTAL_INVOICES:TOTAL_INVOICE_QUANTITY:INVOICE_LIST:TOTAL_INVOICE_'
||'AMOUNT:BALANCE_QTY:DISPATCH_STATUS:TOTAL_RECEIPTS:TOTAL_PAYMENT_RECEIVED:DFREIGHTBILLRECEIPTNO_LIST:FINAL_BALANCE_AMOUNT_AGAINST_INV:PAYMENT_STATUS:FINAL_BALANCE_AMOUNT_AGAINST_SO'
,p_sum_columns_on_break=>'TOTAL_SO_QTY:TOTAL_SO_AMT:TOTAL_DESPATCH_ADVICE:TOTAL_DESPATCH_QTY:TOTAL_LOADING_ADVICE:TOTAL_LOADING_QTY:TOTAL_INVOICES:TOTAL_INVOICE_QUANTITY:BALANCE_QTY:TOTAL_RECEIPTS:TOTAL_PAYMENT_RECEIVED:FINAL_BALANCE_AMOUNT:TOTAL_INVOICE_AMOUNT:FINAL_BALANCE_'
||'AMOUNT_AGAINST_INV:FINAL_BALANCE_AMOUNT_AGAINST_SO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(463482767306777899)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(473474319816640358)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(463473246018777867)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(473474204760640357)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(441351581577550119)
,p_name=>'P411_BIREPORTURL'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(473474204760640357)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(473477809589640388)
,p_name=>'P411_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(473474204760640357)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''CCINVOICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;'))
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
 p_id=>wwv_flow_imp.id(473478053621640390)
,p_name=>'P411_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(473474204760640357)
,p_item_default=>'Trunc(sysdate-7)'
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
 p_id=>wwv_flow_imp.id(473477976362640389)
,p_name=>'P411_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(473474204760640357)
,p_prompt=>'Location'
,p_placeholder=>'Select Location name'
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
'  and a.ModuleCode = ''CCINVOICE''',
'  and a.ViewPrivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
';'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(473703947165202043)
,p_name=>'P411_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(473474204760640357)
,p_prompt=>'Party'
,p_placeholder=>'Select Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'GetPartyName(PartyCode) d,',
'PartyCode r',
'From SalesOrder ',
'Order by 1'))
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
 p_id=>wwv_flow_imp.id(473478177570640391)
,p_name=>'P411_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(473474204760640357)
,p_item_default=>'Trunc(sysdate)'
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
 p_id=>wwv_flow_imp.id(473478229841640392)
,p_name=>'P411_TRADETYPE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(473474204760640357)
,p_item_default=>'MT'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(462520583290715729)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(462520678401715730)
,p_event_id=>wwv_flow_imp.id(462520583290715729)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189772405544006270)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>30
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189772790987006270)
,p_event_id=>wwv_flow_imp.id(189772405544006270)
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
 p_id=>wwv_flow_imp.id(463483344346777899)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(463482767306777899)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(463483801698777900)
,p_event_id=>wwv_flow_imp.id(463483344346777899)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '/*javascript:window.open(''http://117.217.121.130:9502/analytics/saw.dll?bipublisherEntry&Action=open&itemType=.xdo&bipPath=/PBS/REPORTS/Order vs Dispatch Report.xdo&nQUser=consumer&nQPassword=Info123$&bipParams={"_xmode":"1","_xpf":"","_xf":"pdf","_x'
||'pt":"1","_paramsP_COMPANY":"&P411_COMPANY.","_paramsP_LOCATION":"&P411_LOCATION.","_paramsP_FROMDATE":"&P411_FROMDATE.","_paramsP_TODATE":"&P411_TODATE.","_paramsP_TRADETYPE":"&P411_TRADETYPE.","_paramsP_PARTY":"&P411_PARTY."}'');',
    '  */',
    '  generatePDF();                                                                                 ')))).to_clob
);
wwv_flow_imp.component_end;
end;
/
