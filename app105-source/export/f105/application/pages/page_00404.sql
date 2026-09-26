prompt --application/pages/page_00404
begin
--   Manifest
--     PAGE: 00404
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
 p_id=>404
,p_name=>'GST Output Report As Per Transaction'
,p_alias=>'GST-OUTPUT-REPORT-AS-PER-TRANSACTION'
,p_step_title=>'GST Output Report As Per Transaction'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'#MYID1 .t-fht-thead{',
'  overflow: auto !important;',
'}',
'',
'.m-10::before {',
'    content: url(#APP_IMAGES#smallinfomaticslogo.png);',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(556095672323672456)
,p_plug_name=>'GST Output Report'
,p_static_id=>'gst-output-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'          row_number() over(order by a.VOUCHERDATE) SerialNo,',
'       getlocationname(A.locationcode) AS NAMEOFSITE,',
'       getlocationattributevalue(A.LOCATIONCODE, ''STATE'') AS STATEOFSITE,',
'       A.entryno,',
'       A.ModuleCode,',
'       A.Voucherno,',
'       A.VOUCHERDATE,',
'       NULL AS DRACCOUNTINERP,',
'       A.PARTYNAME AS CRACCOUNTINERP,',
'       NULL AS CONSIDEREDINGSTR3B,',
'       NULL AS ACTUALMONTHOFGSTR3B,',
'       NULL AS SHOWNINGSTR1,',
'       NULL AS ACTUALMONTHOFGSTR1,',
'       A.PartyName AS NAMEOFCUSTOMER,',
'       getpartyaddress(A.PARTYCODE) AS SUPPLIERADDRESS,',
'       A.StateName AS SUPPLIERSTATE,',
'       A.gststatecode,',
'       getpartyattributevalue(A.PARTYCODE, ''GSTINNO'') AS CUSTOMERGSTIN,',
'       getpartyattributevalue(A.PARTYCODE, ''PANNO'') AS CUSTOMERPANNO,',
'      A.Quantity1 AS QUANTITY,',
'       I.MEASURINGUNITCODE1 AS UNIT,',
'       A.BillNo AS INVOICENO,',
'       A.BILLDATE AS INVOICEDATE,',
'       Case',
'         When A.ModuleCode = ''INVOICE'' Then',
'          (Select bb.VehicleNO',
'             From Invoice aa, ccinvoice bb',
'            Where aa.Moduletno = bb.tno',
'              And aa.tno = a.tno)',
'         When A.ModuleCode = ''FREIGHTADVICE'' Then',
'          (Select Case',
'                    When AA.MODULECODE = ''GRN'' Then',
'                     (Select vehicleno From grn Where tno = aa.moduletno)',
'                    When aa.modulecode = ''CCINVOICE'' Then',
'                     (Select vehicleno From ccinvoice Where tno = aa.moduletno)',
'                    Else',
'                     Null',
'                  End VehicleNo',
'             From FREIGHTADVICEDETAIL AA',
'            Where aa.tno = a.tno',
'              And aa.sno = a.sno)',
'         Else',
'          Null',
'       End VehicleNo,',
'       NULL AS APPLICABILITYOFWAYBILL,',
'       NULL AS EWAYBILLNO,',
'       NVL(GETITEMNAME(A.ITEMCODE), getjobtypename(A.JOBTYPECODE)) AS PARTICULAROFITEMJOB,',
'       NULL AS BRODGROUPNAME,',
'       NVL(A.HSN, A.SAC) AS HSNSAC,',
'        A.TransactionTypeCode,',
'       A.footerpercent AS GSTTAXRATE,',
'       A.TaxableAmount AS TAXABLEVALUEBEFORETAX,',
'       A.IGST,',
'       A.CGST,',
'       A.SGST,',
'       NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0) AS TOTALTAX,',
'       (NVL(A.BILLAMOUNT, 0) - NVL((NVL(A.TaxableAmount,0) + NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0) ), 0) ) AS OTHERINCIDENTALAMOUNT,',
'       A.BILLAMOUNT AS INVOICEAMOUNT,',
'       PY.PAYMENTVOUCHERDATE AS ACTUALPAYMENTDAYS,',
'       PY.PAYMENTVOUCHERNO AS PAYMENTVOUCHERNO,',
'       NULL AS REASONFORNONITCAVAILABLE,',
'       NULL AS ORIGINALINVOICEYESNO,',
'       ',
'       NULL AS ADVANCERECEIPTVOUCHERNO,',
'       NULL AS ADVANCERECEIPTVOUCHERDATE,',
'       NULL AS ADVANCETAXABLEAMOUNT,',
'       NULL AS IGSTONADVANCE,',
'       NULL AS CGSTONADVANCE,',
'       NULL AS SGSTONADVANCE,',
'       NULL AS TOTALTAXONADVANCE,',
'       NULL AS DIFFERENCEAMOUNT,',
'       K.ACKNO,',
'       K.ACKDATE,',
'       K.IRN',
'',
'  from gsttaxinoutdetail a,',
'       PARTY P,',
'       TAXREGISTRATIONTYPE TG,',
'       NATUREOFSUPPLY NS,',
'       ITEM I,',
'       JOBTYPE J,',
'       EINVOICE K,',
'       (SELECT ZZ.TNO          AS BILLVOUCHERTNO,',
'               ZZ.MODULETNO,',
'               XX.CRVOUCHERTNO,',
'               YY.VOUCHERNO    AS PAYMENTVOUCHERNO,',
'               YY.VOUCHERDATE  AS PAYMENTVOUCHERDATE',
'          FROM DRCRALLOCATION XX, VOUCHER YY, VOUCHER ZZ',
'         WHERE XX.MODULETNO = YY.TNO',
'           AND YY.DOCTYPECODE IN (''JOURNAL'',''RECEIPT'')',
'           AND XX.DRVOUCHERTNO = ZZ.TNO) PY',
'',
' where a.type = ''OUTWARD''',
'   AND A.PARTYCODE = P.PARTYCODE(+)',
'   AND P.TAXREGISTRATIONTYPECODE = TG.TAXREGISTRATIONTYPECODE(+)',
'   AND A.NatureOfSupplyCode = NS.NATUREOFSUPPLYCODE(+)',
'   AND A.ITEMCODE = I.ITEMCODE(+)',
'   and A.JOBTYPECODE = J.JOBTYPECODE(+)',
'   AND A.TNO = K.MODULETNO(+)',
'   AND A.Vouchertno = PY.BILLVOUCHERTNO(+)',
'   AND ((( NVL(A.IGST,0) > 0 OR NVL(A.SGST,0) > 0) AND :P404_ALL = ''NO'')',
'        OR',
'       NVL(:P404_ALL,''NO'') = ''YES''',
'   )',
'  and instr('':''||:P404_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and NVL(a.VoucherDate,A.ENTRYDATE) between :P404_FROMDATE and :P404_TODATE',
'  and ( :P404_PARTY IS NULL OR instr('':''||:P404_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P404_MODULECODE IS NULL OR instr('':''||:P404_MODULECODE||'':'','':''||a.ModuleCode||'':'') > 0 ) ',
'  and A.ModuleCode <> ''PAYMENTADVICE''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'GST Input Report'
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
 p_id=>wwv_flow_imp.id(534665066851273094)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_computation=>'N'
,p_show_chart=>'N'
,p_show_group_by=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:XLSX:PDF'
,p_enable_mail_download=>'N'
,p_internal_uid=>500963747898864396
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483190921401091111)
,p_db_column_name=>'ACKDATE'
,p_display_order=>500
,p_column_identifier=>'DS'
,p_column_label=>'ACK DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#ACKDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483190544566091111)
,p_db_column_name=>'ACKNO'
,p_display_order=>490
,p_column_identifier=>'DR'
,p_column_label=>'ACK NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#ACKNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483175728900091104)
,p_db_column_name=>'ACTUALMONTHOFGSTR1'
,p_display_order=>120
,p_column_identifier=>'CG'
,p_column_label=>'ACTUAL MONTH IN GSTR 1'
,p_column_html_expression=>'<div style="display:block; width:100px">#ACTUALMONTHOFGSTR1#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483174884430091104)
,p_db_column_name=>'ACTUALMONTHOFGSTR3B'
,p_display_order=>100
,p_column_identifier=>'CE'
,p_column_label=>'ACTUAL MONTH OF GSTR 3B'
,p_column_html_expression=>'<div style="display:block; width:100px">#ACTUALMONTHOFGSTR3B#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483185740046091109)
,p_db_column_name=>'ACTUALPAYMENTDAYS'
,p_display_order=>370
,p_column_identifier=>'DF'
,p_column_label=>'ACTUAL RECEIPT'
,p_column_html_expression=>'<div style="display:block; width:80px">#ACTUALPAYMENTDAYS#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483187700061091110)
,p_db_column_name=>'ADVANCERECEIPTVOUCHERDATE'
,p_display_order=>420
,p_column_identifier=>'DK'
,p_column_label=>'ADVANCE RECEIPT VOUCHER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#ADVANCERECEIPTVOUCHERDATE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483187295322091110)
,p_db_column_name=>'ADVANCERECEIPTVOUCHERNO'
,p_display_order=>410
,p_column_identifier=>'DJ'
,p_column_label=>'ADVANCE RECEIPT VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#ADVANCERECEIPTVOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483188111883091110)
,p_db_column_name=>'ADVANCETAXABLEAMOUNT'
,p_display_order=>430
,p_column_identifier=>'DL'
,p_column_label=>'TAXABLE VALUE IN ADVANCE'
,p_column_html_expression=>'<div style="display:block; width:80px">#ADVANCETAXABLEAMOUNT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483180141257091106)
,p_db_column_name=>'APPLICABILITYOFWAYBILL'
,p_display_order=>230
,p_column_identifier=>'CR'
,p_column_label=>'APPLICABILITY OF WAY BILL'
,p_column_html_expression=>'<div style="display:block; width:80px">#APPLICABILITYOFWAYBILL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483181313743091107)
,p_db_column_name=>'BRODGROUPNAME'
,p_display_order=>260
,p_column_identifier=>'CU'
,p_column_label=>'BROD GROUP OF PARTICULAR'
,p_column_html_expression=>'<div style="display:block; width:100px">#BROADGROUPNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483183742268091108)
,p_db_column_name=>'CGST'
,p_display_order=>320
,p_column_identifier=>'DA'
,p_column_label=>'CGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#CGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483188891194091110)
,p_db_column_name=>'CGSTONADVANCE'
,p_display_order=>450
,p_column_identifier=>'DN'
,p_column_label=>'CGST ON ADVANCE'
,p_column_html_expression=>'<div style="display:block; width:80px">#CGSTONADVANCE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483174526091091104)
,p_db_column_name=>'CONSIDEREDINGSTR3B'
,p_display_order=>90
,p_column_identifier=>'CD'
,p_column_label=>'CONSIDERED IN GSTR 3B'
,p_column_html_expression=>'<div style="display:block; width:100px">#CONSIDEREDINGSTR3B#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483174124463091103)
,p_db_column_name=>'CRACCOUNTINERP'
,p_display_order=>80
,p_column_identifier=>'CC'
,p_column_label=>'CR ACCOUNT IN ERP'
,p_column_html_expression=>'<div style="display:block; width:200px">#CRACCOUNTINERP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483177718755091105)
,p_db_column_name=>'CUSTOMERGSTIN'
,p_display_order=>170
,p_column_identifier=>'CL'
,p_column_label=>'CUSTOMER GSTIN'
,p_column_html_expression=>'<div style="display:block; width:100px">#CUSTOMERGSTIN#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483178078778091105)
,p_db_column_name=>'CUSTOMERPANNO'
,p_display_order=>180
,p_column_identifier=>'CM'
,p_column_label=>'CUSTOMER PAN NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#CUSTOMERPANNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483190135225091111)
,p_db_column_name=>'DIFFERENCEAMOUNT'
,p_display_order=>480
,p_column_identifier=>'DQ'
,p_column_label=>'DIFFERENCE OF BILL AND ADVANCE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#DIFFERENCEAMOUNT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483173682456091103)
,p_db_column_name=>'DRACCOUNTINERP'
,p_display_order=>70
,p_column_identifier=>'CB'
,p_column_label=>'DR ACCOUNT IN ERP'
,p_column_html_expression=>'<div style="display:block; width:200px">#DRACCOUNTINERP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483172077724091102)
,p_db_column_name=>'ENTRYNO'
,p_display_order=>30
,p_column_identifier=>'BX'
,p_column_label=>'ENTRY NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#ENTRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483180551822091106)
,p_db_column_name=>'EWAYBILLNO'
,p_display_order=>240
,p_column_identifier=>'CS'
,p_column_label=>'E WAY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:120px">#EWAYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483177305204091105)
,p_db_column_name=>'GSTSTATECODE'
,p_display_order=>160
,p_column_identifier=>'CK'
,p_column_label=>'GST STATE CODE'
,p_column_html_expression=>'<div style="display:block; width:100px">#GSTSTATECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483182553488091107)
,p_db_column_name=>'GSTTAXRATE'
,p_display_order=>290
,p_column_identifier=>'CX'
,p_column_label=>'GST TAX RATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#GSTTAXRATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483181680428091107)
,p_db_column_name=>'HSNSAC'
,p_display_order=>270
,p_column_identifier=>'CV'
,p_column_label=>'HSN/SAC'
,p_column_html_expression=>'<div style="display:block; width:100px">#HSNSAC#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483183337853091108)
,p_db_column_name=>'IGST'
,p_display_order=>310
,p_column_identifier=>'CZ'
,p_column_label=>'IGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#IGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483188514472091110)
,p_db_column_name=>'IGSTONADVANCE'
,p_display_order=>440
,p_column_identifier=>'DM'
,p_column_label=>'IGST ON ADVANCE'
,p_column_html_expression=>'<div style="display:block; width:80px">#IGSTONADVANCE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483185345710091108)
,p_db_column_name=>'INVOICEAMOUNT'
,p_display_order=>360
,p_column_identifier=>'DE'
,p_column_label=>'INVOICE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#INVOICEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483179732562091106)
,p_db_column_name=>'INVOICEDATE'
,p_display_order=>220
,p_column_identifier=>'CQ'
,p_column_label=>'INVOICE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#INVOICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483179350244091106)
,p_db_column_name=>'INVOICENO'
,p_display_order=>210
,p_column_identifier=>'CP'
,p_column_label=>'INVOICE NO'
,p_column_html_expression=>'<div style="display:block; width:140px">#INVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483191365997091111)
,p_db_column_name=>'IRN'
,p_display_order=>510
,p_column_identifier=>'DT'
,p_column_label=>'IRN'
,p_column_html_expression=>'<div style="display:block; width:80px">#IRN#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483172496486091103)
,p_db_column_name=>'MODULECODE'
,p_display_order=>40
,p_column_identifier=>'BY'
,p_column_label=>'MODULE '
,p_column_html_expression=>'<div style="display:block; width:90px">#MODULECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483176071391091104)
,p_db_column_name=>'NAMEOFCUSTOMER'
,p_display_order=>130
,p_column_identifier=>'CH'
,p_column_label=>'NAME OF CUSTOMER'
,p_column_html_expression=>'<div style="display:block; width:240px">#NAMEOFCUSTOMER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483171348078091102)
,p_db_column_name=>'NAMEOFSITE'
,p_display_order=>10
,p_column_identifier=>'BV'
,p_column_label=>'NAME OF SITE'
,p_report_label=>'BRANCH'
,p_sync_form_label=>'N'
,p_column_html_expression=>'<div style="display:block; width:100px">#NAMEOFSITE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483186935965091109)
,p_db_column_name=>'ORIGINALINVOICEYESNO'
,p_display_order=>400
,p_column_identifier=>'DI'
,p_column_label=>'ORIGINAL INVOICE AVAILABLE OR NOT'
,p_column_html_expression=>'<div style="display:block; width:80px">#ORIGNALINVOICEYESNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483184936582091108)
,p_db_column_name=>'OTHERINCIDENTALAMOUNT'
,p_display_order=>350
,p_column_identifier=>'DD'
,p_column_label=>'OTHER INCIDENTAL AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#OTHERINCIDENTALAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483180928993091107)
,p_db_column_name=>'PARTICULAROFITEMJOB'
,p_display_order=>250
,p_column_identifier=>'CT'
,p_column_label=>'PARTICULAR OF ITEM /JOB'
,p_column_html_expression=>'<div style="display:block; width:100px">#PARTICULAROFITEMJOB#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483186132336091109)
,p_db_column_name=>'PAYMENTVOUCHERNO'
,p_display_order=>380
,p_column_identifier=>'DG'
,p_column_label=>'RECEIPT VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#PAYMENTVOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483178557928091105)
,p_db_column_name=>'QUANTITY'
,p_display_order=>190
,p_column_identifier=>'CN'
,p_column_label=>'QUANTITY'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483186563134091109)
,p_db_column_name=>'REASONFORNONITCAVAILABLE'
,p_display_order=>390
,p_column_identifier=>'DH'
,p_column_label=>'REASON FOR NO GST OUTPUT PAYBLE'
,p_column_html_expression=>'<div style="display:block; width:80px">#REASONFORNONITCAVAILABLE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205720891491423269)
,p_db_column_name=>'SERIALNO'
,p_display_order=>530
,p_column_identifier=>'DV'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483184166093091108)
,p_db_column_name=>'SGST'
,p_display_order=>330
,p_column_identifier=>'DB'
,p_column_label=>'SGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#SGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483189295223091111)
,p_db_column_name=>'SGSTONADVANCE'
,p_display_order=>460
,p_column_identifier=>'DO'
,p_column_label=>'SGST ON ADVANCE'
,p_column_html_expression=>'<div style="display:block; width:80px">#SGSTONADVANCE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483175288661091104)
,p_db_column_name=>'SHOWNINGSTR1'
,p_display_order=>110
,p_column_identifier=>'CF'
,p_column_label=>'SHOW IN GSTR 1'
,p_column_html_expression=>'<div style="display:block; width:80px">#SHOWNINGSTR1#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483171720570091102)
,p_db_column_name=>'STATEOFSITE'
,p_display_order=>20
,p_column_identifier=>'BW'
,p_column_label=>'STATE OF SITE'
,p_column_html_expression=>'<div style="display:block; width:100px">#STATEOFSITE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483176494570091105)
,p_db_column_name=>'SUPPLIERADDRESS'
,p_display_order=>140
,p_column_identifier=>'CI'
,p_column_label=>'CUSTOMER ADDRESS'
,p_column_html_expression=>'<div style="display:block; width:180px">#SUPPLIERADDRESS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483176870525091105)
,p_db_column_name=>'SUPPLIERSTATE'
,p_display_order=>150
,p_column_identifier=>'CJ'
,p_column_label=>'CUSTOMER STATE'
,p_column_html_expression=>'<div style="display:block; width:100px">#SUPPLIERSTATE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483182892154091107)
,p_db_column_name=>'TAXABLEVALUEBEFORETAX'
,p_display_order=>300
,p_column_identifier=>'CY'
,p_column_label=>'TAXABLE VALUE BEFORE TAX'
,p_column_html_expression=>'<div style="display:block; width:80px">#TAXABLEVALUEBEFORETAX#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483184558268091108)
,p_db_column_name=>'TOTALTAX'
,p_display_order=>340
,p_column_identifier=>'DC'
,p_column_label=>'TOTAL TAX'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALTAX#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483189701623091111)
,p_db_column_name=>'TOTALTAXONADVANCE'
,p_display_order=>470
,p_column_identifier=>'DP'
,p_column_label=>'TOTAL TAX ON ADVANCE'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALTAXONADVANCE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483182155917091107)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>280
,p_column_identifier=>'CW'
,p_column_label=>'TRANSACTION TYPE '
,p_column_html_expression=>'<div style="display:block; width:100px">#TRANSACTIONTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483178903097091106)
,p_db_column_name=>'UNIT'
,p_display_order=>200
,p_column_identifier=>'CO'
,p_column_label=>'UNIT'
,p_column_html_expression=>'<div style="display:block; width:100px">#UNIT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(501531308396906479)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>520
,p_column_identifier=>'DU'
,p_column_label=>'VEHICLE NO'
,p_column_html_expression=>'<div style="display:block; width:80px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483173341228091103)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>60
,p_column_identifier=>'CA'
,p_column_label=>'VOUCHER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(483172882488091103)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>50
,p_column_identifier=>'BZ'
,p_column_label=>'VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:140px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(534958075659082892)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'129952'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'SERIALNO:NAMEOFSITE:VOUCHERNO:VOUCHERDATE:MODULECODE:ENTRYNO:NAMEOFCUSTOMER:SUPPLIERSTATE:GSTSTATECODE:CUSTOMERGSTIN:CUSTOMERPANNO:INVOICENO:INVOICEDATE:PARTICULAROFITEMJOB:HSNSAC:QUANTITY:UNIT:TRANSACTIONTYPECODE:GSTTAXRATE:TAXABLEVALUEBEFORETAX:IGS'
||'T:CGST:SGST:TOTALTAX:OTHERINCIDENTALAMOUNT:INVOICEAMOUNT'
,p_sort_column_1=>'VOUCHERDATE'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'IGST:CGST:SGST:TOTALTAX:INVOICEAMOUNT:QUANTITY'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(585246338897136296)
,p_plug_name=>'GST Output Report As Per Transaction'
,p_static_id=>'gst-output-report-as-per-transaction'
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
 p_id=>wwv_flow_imp.id(109480327146521980)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(585246338897136296)
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
 p_id=>wwv_flow_imp.id(486999455130899698)
,p_name=>'P404_ALL'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(585246338897136296)
,p_item_default=>'YES'
,p_prompt=>'Only GST'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:YES;YES,NO;NO'
,p_lov_display_null=>'YES'
,p_cHeight=>1
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
 p_id=>wwv_flow_imp.id(483227809947091208)
,p_name=>'P404_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(585246338897136296)
,p_item_default=>'Trunc(Sysdate)-7'
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
 p_id=>wwv_flow_imp.id(483228659205091209)
,p_name=>'P404_LOCATION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(585246338897136296)
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
 p_id=>wwv_flow_imp.id(483229431096091209)
,p_name=>'P404_MODULECODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(585246338897136296)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        A.modulecode as modulename,',
'        A.modulecode',
'From gsttaxinoutdetail a',
'Where a.Type =''OUTWARD''',
'and a.modulecode not in (''PAYMENTADVICE'')'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Module--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483229098572091209)
,p_name=>'P404_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(585246338897136296)
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
'Where a.PartyCode = p.PartyCode',
'Order by 1'))
,p_cSize=>35
,p_colspan=>4
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
  'attribute_09', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(483228272307091209)
,p_name=>'P404_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(585246338897136296)
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(109483716681521982)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109484160696521982)
,p_event_id=>wwv_flow_imp.id(109483716681521982)
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
 p_id=>wwv_flow_imp.id(109482790554521982)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109483301592521982)
,p_event_id=>wwv_flow_imp.id(109482790554521982)
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
