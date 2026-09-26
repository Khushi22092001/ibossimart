prompt --application/pages/page_00233
begin
--   Manifest
--     PAGE: 00233
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
 p_id=>233
,p_name=>'GST Output Report As Per Voucher'
,p_alias=>'GST-OUTPUT-REPORT-AS-PER-VOUCHER'
,p_step_title=>'GST Output Report As Per Voucher'
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
 p_id=>wwv_flow_imp.id(741468858935285614)
,p_plug_name=>'GST Output Report'
,p_static_id=>'gst-output-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
' Select',
'       row_number() over(order by a.vOUCHERDate) SerialNo,',
'       getlocationname(A.locationcode) AS NAMEOFSITE,',
'       getlocationattributevalue(A.LOCATIONCODE, ''STATE'') AS STATEOFSITE,',
'       CO.COMPANYNAME,',
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
'       A.Quantity1 AS QUANTITY,',
'       I.MEASURINGUNITCODE1 AS UNIT,',
'       A.BillNo AS INVOICENO,',
'       A.BILLDATE AS INVOICEDATE,',
'       NULL AS APPLICABILITYOFWAYBILL,',
'       NULL AS EWAYBILLNO,',
'       NVL(GETITEMNAME(A.ITEMCODE), getjobtypename(A.JOBTYPECODE)) AS PARTICULAROFITEMJOB,',
'       NULL AS BRODGROUPNAME,',
'       NVL(A.HSN, A.SAC) AS HSNSAC,',
'        A.TransactionTypeCode,',
'       A.footerpercent AS GSTTAXRATE,',
'       decode(a.ModuleCode, ''CREDITNOTE'', -1, 1) * A.TaxableAmount AS TAXABLEVALUEBEFORETAX,',
'       v.igst * decode(a.ModuleCode, ''CREDITNOTE'', -1, 1) * round(A.IGST,2) as IGST,',
'       v.cgst * decode(a.ModuleCode, ''CREDITNOTE'', -1, 1) * round(A.CGST,2) as CGST,',
'       v.sgst * decode(a.ModuleCode, ''CREDITNOTE'', -1, 1) * ROUND(A.SGST,2) as SGST,',
'       decode(a.ModuleCode, ''CREDITNOTE'', -1, 1) * ROUND(NVL(v.igst * A.IGST, 2) + NVL(v.igst * A.CGST, 2) + NVL(v.igst * A.SGST, 0),2) AS TOTALTAX,',
'       decode(a.ModuleCode, ''CREDITNOTE'', -1, 1) * ROUND((NVL(A.BILLAMOUNT, 2) - NVL((NVL(A.TaxableAmount,2) + NVL(v.igst * A.IGST, 2) + NVL(v.igst * A.CGST, 2) + NVL(v.igst * A.SGST, 2) ), 0) ),2) AS OTHERINCIDENTALAMOUNT,',
'       decode(a.ModuleCode, ''CREDITNOTE'', -1, 1) * ROUND(A.BILLAMOUNT,2) AS INVOICEAMOUNT,',
'       NULL AS REASONFORNONITCAVAILABLE,',
'       NULL AS ORIGINALINVOICEYESNO,',
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
'       K.IRN,',
'       L.SELLERDTLS_GSTIN,',
'       L.EWBNO,',
'       L.EWBDATE,',
'       L.VALIDTILLDATE,',
'       LO.LOCATIONNAME',
'  from gsttaxinoutdetail a,',
'       COMPANY CO,',
'       LOCATION LO,',
'       PARTY P,',
'       TAXREGISTRATIONTYPE TG,',
'       NATUREOFSUPPLY NS,',
'       ITEM I,',
'       JOBTYPE J,',
'       EINVOICE K,',
'       INVOICEFOREI0101REVISED L,',
'       --------------------------- --',
'        -- 06-may-2024',
'        (',
'            select ',
'                  aa.tno,',
'                  nvl(sum(decode(aa.AccountCode, ''238'', 1,''250'',1, 0 )),0)  as CGST,',
'                  nvl(sum(decode(aa.AccountCode, ''258'', 1,''252'',1, 0 )),0)  as SGST,',
'                  nvl(sum(decode(aa.AccountCode, ''245'', 1,''251'',1, 0 )),0)  as IGST,',
'                  sum(decode(aa.AccountCode, ''2816'', 1, 0 )) as CESS',
'            from VoucherDetail aa, Voucher bb ',
'            where aa.tno = bb.tno ',
'                and bb.ModuleTNo is not null',
'            group by aa.tno',
'            union all',
'            select ',
'                  aa.tno,',
'                  1 as CGST,',
'                  1 as SGST,',
'                  1 as IGST,',
'                  1 as CESS',
'            from Voucher aa',
'            where aa.ModuleTNo is null',
'        ) v',
'        --------------------------- --',
' where  EXISTS(',
'      SELECT ',
'          AA.TNO ',
'      FROM VOUCHERDETAIL AA ',
'      WHERE AA.ACCOUNTCODE IN (''238'',''252'',''251'',''250'',''258'',''245'')',
'          AND AA.TNO = A.VOUCHERTNO',
'   )',
'   AND A.COMPANYCODE = CO.COMPANYCODE(+)',
'   AND A.LOCATIONCODE = LO.LOCATIONCODE(+)',
'   AND A.PARTYCODE = P.PARTYCODE(+)',
'   AND P.TAXREGISTRATIONTYPECODE = TG.TAXREGISTRATIONTYPECODE(+)',
'   AND A.NatureOfSupplyCode = NS.NATUREOFSUPPLYCODE(+)',
'   AND A.ITEMCODE = I.ITEMCODE(+)',
'   and A.JOBTYPECODE = J.JOBTYPECODE(+)',
'   AND A.TNO = K.MODULETNO(+)',
'   AND A.TNO = L.TNO(+)',
'   AND A.VOUCHERTNO = V.TNO',
'   and ( :P233_COMPANY IS NULL OR instr('':''||:P233_COMPANY||'':'','':''||A.COMPANYCODE||'':'') > 0 )',
'   and NVL(a.VoucherDate,A.ENTRYDATE) between :P233_FROMDATE and :P233_TODATE',
'   and ( :P233_PARTY IS NULL OR instr('':''||:P233_PARTY||'':'','':''||a.PartyCode||'':'') > 0 )',
'   and ( :P233_MODULECODE IS NULL OR instr('':''||:P233_MODULECODE||'':'','':''||a.ModuleCode||'':'') > 0 )',
'  AND ( ',
'      ( NVL(A.IGST,0)   != 0 AND :P233_SER = ''IGST'' )',
'      OR ',
'      (  NVL(A.SGST,0) != 0 AND :P233_SER = ''SGST'' )',
'      OR',
'      :P233_SER IS NULL',
'  )',
'   and ( :P233_LOCATION IS NULL OR instr('':''||:P233_LOCATION||'':'','':''||A.LOCATIONCODE||'':'') > 0 )',
'   and ( :P233_COMPANYGSTIN IS NULL OR instr('':''||:P233_COMPANYGSTIN||'':'','':''||L.SELLERDTLS_GSTIN||'':'') > 0 )',
'   and NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0) != 0',
'   and A.ModuleCode <> ''PAYMENTADVICE''',
'   AND TYPE=''OUTWARD''',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P233_COMPANY,P233_FROMDATE,P233_TODATE,P233_PARTY,P233_MODULECODE,P233_SER,P233_LOCATION,P233_COMPANYGSTIN'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P233_FROMDATE'
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
 p_id=>wwv_flow_imp.id(720038253462886252)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'100'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
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
,p_internal_uid=>693878424319180304
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655589897836731633)
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
 p_id=>wwv_flow_imp.id(655589537156731633)
,p_db_column_name=>'ACKNO'
,p_display_order=>490
,p_column_identifier=>'DR'
,p_column_label=>'ACK NO'
,p_column_html_expression=>'<div style="display:block; width:120px">#ACKNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655574658301731624)
,p_db_column_name=>'ACTUALMONTHOFGSTR1'
,p_display_order=>120
,p_column_identifier=>'CG'
,p_column_label=>'ACTUAL MONTH IN GSTR 1'
,p_column_html_expression=>'<div style="display:block; width:110px">#ACTUALMONTHOFGSTR1#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655573895128731624)
,p_db_column_name=>'ACTUALMONTHOFGSTR3B'
,p_display_order=>100
,p_column_identifier=>'CE'
,p_column_label=>'ACTUAL MONTH OF GSTR 3B'
,p_column_html_expression=>'<div style="display:block; width:80px">#ACTUALMONTHOFGSTR3B#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655586689116731631)
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
 p_id=>wwv_flow_imp.id(655586299429731631)
,p_db_column_name=>'ADVANCERECEIPTVOUCHERNO'
,p_display_order=>410
,p_column_identifier=>'DJ'
,p_column_label=>'ADVANCE RECEIPT VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:80px">#ADVANCERECEIPTVOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655587064355731631)
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
 p_id=>wwv_flow_imp.id(655579048143731627)
,p_db_column_name=>'APPLICABILITYOFWAYBILL'
,p_display_order=>230
,p_column_identifier=>'CR'
,p_column_label=>'APPLICABILITY OF WAY BILL'
,p_column_html_expression=>'<div style="display:block; width:150px">#APPLICABILITYOFWAYBILL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655580265119731627)
,p_db_column_name=>'BRODGROUPNAME'
,p_display_order=>260
,p_column_identifier=>'CU'
,p_column_label=>'BROD GROUP OF PARTICULAR'
,p_column_html_expression=>'<div style="display:block; width:80px">#BRODGROUPNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655582723341731629)
,p_db_column_name=>'CGST'
,p_display_order=>320
,p_column_identifier=>'DA'
,p_column_label=>'CGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#CGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655587929411731632)
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
 p_id=>wwv_flow_imp.id(655590644086731633)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>560
,p_column_identifier=>'DU'
,p_column_label=>'COMPANY NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655573520355731624)
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
 p_id=>wwv_flow_imp.id(655573117987731623)
,p_db_column_name=>'CRACCOUNTINERP'
,p_display_order=>80
,p_column_identifier=>'CC'
,p_column_label=>'CR ACCOUNT IN ERP'
,p_column_html_expression=>'<div style="display:block; width:100px">#CRACCOUNTINERP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655576692823731625)
,p_db_column_name=>'CUSTOMERGSTIN'
,p_display_order=>170
,p_column_identifier=>'CL'
,p_column_label=>'CUSTOMER GSTIN'
,p_column_html_expression=>'<div style="display:block; width:110px">#CUSTOMERGSTIN#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655577079562731626)
,p_db_column_name=>'CUSTOMERPANNO'
,p_display_order=>180
,p_column_identifier=>'CM'
,p_column_label=>'CUSTOMER PAN NO'
,p_column_html_expression=>'<div style="display:block; width:110px">#CUSTOMERPANNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655589140043731633)
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
 p_id=>wwv_flow_imp.id(655572726373731623)
,p_db_column_name=>'DRACCOUNTINERP'
,p_display_order=>70
,p_column_identifier=>'CB'
,p_column_label=>'DR ACCOUNT IN ERP'
,p_column_html_expression=>'<div style="display:block; width:100px">#DRACCOUNTINERP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655579537908731627)
,p_db_column_name=>'EWAYBILLNO'
,p_display_order=>240
,p_column_identifier=>'CS'
,p_column_label=>'E WAY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#EWAYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655592330331731634)
,p_db_column_name=>'EWBDATE'
,p_display_order=>540
,p_column_identifier=>'DZ'
,p_column_label=>'EWB DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#EWBDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655591904729731634)
,p_db_column_name=>'EWBNO'
,p_display_order=>530
,p_column_identifier=>'DY'
,p_column_label=>'EWB NO.'
,p_column_html_expression=>'<div style="display:block; width:130px">#EWBNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655576337679731625)
,p_db_column_name=>'GSTSTATECODE'
,p_display_order=>160
,p_column_identifier=>'CK'
,p_column_label=>'GST STATE CODE'
,p_column_html_expression=>'<div style="display:block; width:110px">#GSTSTATECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655581500814731628)
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
 p_id=>wwv_flow_imp.id(655580690325731628)
,p_db_column_name=>'HSNSAC'
,p_display_order=>270
,p_column_identifier=>'CV'
,p_column_label=>'HSN/SAC'
,p_column_html_expression=>'<div style="display:block; width:80px">#HSNSAC#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655582341712731629)
,p_db_column_name=>'IGST'
,p_display_order=>310
,p_column_identifier=>'CZ'
,p_column_label=>'IGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#IGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655587512567731632)
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
 p_id=>wwv_flow_imp.id(655584283462731630)
,p_db_column_name=>'INVOICEAMOUNT'
,p_display_order=>360
,p_column_identifier=>'DE'
,p_column_label=>'INVOICE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#INVOICEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655578734587731627)
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
 p_id=>wwv_flow_imp.id(655578265802731626)
,p_db_column_name=>'INVOICENO'
,p_display_order=>210
,p_column_identifier=>'CP'
,p_column_label=>'INVOICE NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#INVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655590282056731633)
,p_db_column_name=>'IRN'
,p_display_order=>510
,p_column_identifier=>'DT'
,p_column_label=>'IRN'
,p_column_html_expression=>'<div style="display:block; width:100px">#IRN#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655591506200731634)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>570
,p_column_identifier=>'DX'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:120px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655571451375731623)
,p_db_column_name=>'MODULECODE'
,p_display_order=>40
,p_column_identifier=>'BY'
,p_column_label=>'MODULE '
,p_column_html_expression=>'<div style="display:block; width:80px">#MODULECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655575135721731625)
,p_db_column_name=>'NAMEOFCUSTOMER'
,p_display_order=>130
,p_column_identifier=>'CH'
,p_column_label=>'NAME OF CUSTOMER'
,p_column_html_expression=>'<div style="display:block; width:150px">#NAMEOFCUSTOMER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655570667613731622)
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
 p_id=>wwv_flow_imp.id(655585942635731631)
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
 p_id=>wwv_flow_imp.id(655583929312731629)
,p_db_column_name=>'OTHERINCIDENTALAMOUNT'
,p_display_order=>350
,p_column_identifier=>'DD'
,p_column_label=>'OTHER INCIDENTAL AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#OTHERINCIDENTALAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655579885009731627)
,p_db_column_name=>'PARTICULAROFITEMJOB'
,p_display_order=>250
,p_column_identifier=>'CT'
,p_column_label=>'PARTICULAR OF ITEM /JOB'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTICULAROFITEMJOB#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655577482252731626)
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
 p_id=>wwv_flow_imp.id(655585449922731630)
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
 p_id=>wwv_flow_imp.id(655591108867731634)
,p_db_column_name=>'SELLERDTLS_GSTIN'
,p_display_order=>520
,p_column_identifier=>'DW'
,p_column_label=>'COMPANY GSTIN NO.'
,p_column_html_expression=>'<div style="display:block; width:100px">#SELLERDTLS_GSTIN#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655570293801731622)
,p_db_column_name=>'SERIALNO'
,p_display_order=>580
,p_column_identifier=>'EB'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655583071924731629)
,p_db_column_name=>'SGST'
,p_display_order=>330
,p_column_identifier=>'DB'
,p_column_label=>'SGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#SGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655588251604731632)
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
 p_id=>wwv_flow_imp.id(655574248821731624)
,p_db_column_name=>'SHOWNINGSTR1'
,p_display_order=>110
,p_column_identifier=>'CF'
,p_column_label=>'SHOW IN GSTR 1'
,p_column_html_expression=>'<div style="display:block; width:130px">#SHOWNINGGSTR1#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655571097145731622)
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
 p_id=>wwv_flow_imp.id(655575491522731625)
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
 p_id=>wwv_flow_imp.id(655575925612731625)
,p_db_column_name=>'SUPPLIERSTATE'
,p_display_order=>150
,p_column_identifier=>'CJ'
,p_column_label=>'CUSTOMER STATE'
,p_column_html_expression=>'<div style="display:block; width:110px">#SUPPLIERSTATE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655581866304731628)
,p_db_column_name=>'TAXABLEVALUEBEFORETAX'
,p_display_order=>300
,p_column_identifier=>'CY'
,p_column_label=>'TAXABLE VALUE BEFORE TAX'
,p_column_html_expression=>'<div style="display:block; width:80px">#TAXABLEVALUEBEFORETAX#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655583463132731629)
,p_db_column_name=>'TOTALTAX'
,p_display_order=>340
,p_column_identifier=>'DC'
,p_column_label=>'TOTAL TAX'
,p_column_html_expression=>'<div style="display:block; width:80px">#TOTALTAX#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999999990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655588664640731632)
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
 p_id=>wwv_flow_imp.id(655581122337731628)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>280
,p_column_identifier=>'CW'
,p_column_label=>'TRANSACTION TYPE '
,p_column_html_expression=>'<div style="display:block; width:80px">#TRANSACTIONTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655577909896731626)
,p_db_column_name=>'UNIT'
,p_display_order=>200
,p_column_identifier=>'CO'
,p_column_label=>'UNIT'
,p_column_html_expression=>'<div style="display:block; width:70px">#UNIT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655592693135731634)
,p_db_column_name=>'VALIDTILLDATE'
,p_display_order=>550
,p_column_identifier=>'EA'
,p_column_label=>'VALID TILL DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#VALIDTILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(655572322369731623)
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
 p_id=>wwv_flow_imp.id(655571907626731623)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>50
,p_column_identifier=>'BZ'
,p_column_label=>'VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(720331262270696050)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'129952'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'SERIALNO:NAMEOFSITE:VOUCHERNO:VOUCHERDATE:MODULECODE:NAMEOFCUSTOMER:SUPPLIERSTATE:GSTSTATECODE:CUSTOMERGSTIN:INVOICENO:INVOICEDATE:PARTICULAROFITEMJOB:HSNSAC:QUANTITY:UNIT:TAXABLEVALUEBEFORETAX:TRANSACTIONTYPECODE:GSTTAXRATE:IGST:CGST:SGST:TOTALTAX:O'
||'THERINCIDENTALAMOUNT:INVOICEAMOUNT:ACKNO:ACKDATE:IRN:EWBNO:EWBDATE:VALIDTILLDATE'
,p_sort_column_1=>'VOUCHERDATE'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'QUANTITY:TAXABLEVALUEBEFORETAX:IGST:CGST:SGST:TOTALTAX:OTHERINCIDENTALAMOUNT:INVOICEAMOUNT'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(770619525508749454)
,p_plug_name=>'GST Output Report As Per Voucher'
,p_static_id=>'gst-output-report-as-per-voucher'
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
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(101635972748796268)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(770619525508749454)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(655630592126731729)
,p_name=>'P233_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(770619525508749454)
,p_prompt=>'Company'
,p_placeholder=>'Enter Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.CompanyName d,',
'       p.CompanyCode r',
'From  Company p',
'Order by 1',
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
 p_id=>wwv_flow_imp.id(655633424021731731)
,p_name=>'P233_COMPANYGSTIN'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(770619525508749454)
,p_prompt=>'Company GSTIN'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.SELLERDTLS_GSTIN d,',
'       p.SELLERDTLS_GSTIN r',
'From InvoiceForEI0101Revised p',
'Order By 1'))
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
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(655631004848731729)
,p_name=>'P233_FROMDATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(770619525508749454)
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
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
 p_id=>wwv_flow_imp.id(655633022103731731)
,p_name=>'P233_LOCATION'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(770619525508749454)
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
 p_id=>wwv_flow_imp.id(655632152253731730)
,p_name=>'P233_MODULECODE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(770619525508749454)
,p_prompt=>'Module'
,p_placeholder=>'Enter Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        A.modulecode as modulename,',
'        A.modulecode r',
'From gsttaxinoutdetail a',
'Where a.Type =''OUTWARD''',
'and A.modulecode <> ''PAYMENTADVICE'''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(655631806753731730)
,p_name=>'P233_PARTY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(770619525508749454)
,p_prompt=>'Vendor'
,p_placeholder=>'Enter Vendor'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From PaymentAdvice a, Party p',
'Where a.PartyCode = p.PartyCode',
'Order by 1',
'  '))
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
 p_id=>wwv_flow_imp.id(655632551771731731)
,p_name=>'P233_SER'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(770619525508749454)
,p_prompt=>'Only GST'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:IGST;IGST,SGST;SGST'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select List-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(655631424590731730)
,p_name=>'P233_TODATE'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(770619525508749454)
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>52
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(101638961488796269)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101639492066796269)
,p_event_id=>wwv_flow_imp.id(101638961488796269)
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
