prompt --application/pages/page_00403
begin
--   Manifest
--     PAGE: 00403
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
 p_id=>403
,p_name=>'GST Input Report As Per Transaction'
,p_alias=>'GST-INPUT-REPORT-AS-PER-TRANSACTION'
,p_step_title=>'GST Input Report As Per Transaction'
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
 p_id=>wwv_flow_imp.id(528658648610933206)
,p_plug_name=>'GST Input Report'
,p_static_id=>'gst-input-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'      row_number() over(order by a.VOUCHERDATE) SerialNo,',
'      getlocationname(A.locationcode) AS NAMEOFSITE,',
'       getlocationattributevalue(A.LOCATIONCODE, ''STATE'') AS STATEOFSITE,',
'       A.entryno,',
'       getmodulename(A.ModuleCode) as module,',
'       A.Voucherno,',
'       A.VOUCHERDATE,',
'       NULL AS DRACCOUNTINERP,',
'       A.PARTYNAME AS CRACCOUNTINERP,',
'       NULL AS CONSIDEREDINGSTR3B,',
'       NULL AS ACTUALMONTHOFGSTR3B,',
'       NULL AS SHOWNINGSTR2A,',
'       NULL AS ACTUALMONTHOFGSTR2A,',
'       TG.TAXREGISTRATIONTYPENAME AS DEALERTYPE,',
'       TG.TAXMECHANISM AS TYPEOFREGISTRATION,',
'       NS.NatureOfSupplyName AS GSTRATEAPPLICABILITY,',
'       a.FooterNatureName as ITCAVAILABILITY,',
'       A.PartyName AS NAMEOFSUPPLIER,',
'       getpartyaddress(A.PARTYCODE) AS SUPPLIERADDRESS,',
'       A.StateName AS SUPPLIERSTATE,',
'       A.gststatecode,',
'       getpartyattributevalue(A.PARTYCODE, ''GSTINNO'') AS SUPPLIERGSTIN,',
'       getpartyattributevalue(A.PARTYCODE, ''PANNO'') AS SUPPLIERPANNO,',
'      -- A.GRNNO,',
'      -- A.GRNDATE,',
'       A.Quantity1 AS QUANTITY,',
'       I.MEASURINGUNITCODE1 AS UNIT,',
'       A.BillNo AS INVOICENO,',
'       A.BILLDATE AS INVOICEDATE,',
'       NULL AS APPLICABILITYOFWAYBILL,',
'       NULL AS EWAYBILLNO,',
'       decode(a.ByModuleCode, ''MISCELLANEOUSEXPENSE'', getPartyName(a.ItemCode),  NVL(GETITEMNAME(A.ITEMCODE), getjobtypename(A.JOBTYPECODE))) AS PARTICULAROFITEMJOB,',
'       NULL AS BRODGROUPNAME,',
'       NVL(A.HSN, A.SAC) AS HSNSAC,',
'       A.TransactionTypeCode,',
'       A.footerpercent AS GSTTAXRATE,',
'       A.TaxableAmount AS TAXABLEVALUEBEFORETAX,',
'       A.IGST,',
'       A.CGST,',
'       A.SGST,',
'       NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0) AS TOTALTAX,',
'       NVL(A.billamount, 0) -',
'       NVL(nvl(a.taxableamount,0) + (NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0)), 0) AS OTHERINCIDENTALAMOUNT,',
'       A.billamount AS INVOICEAMOUNT,',
'       PY.PAYMENTVOUCHERDATE AS ACTUALPAYMENTDAYS,',
'       PY.PAYMENTVOUCHERNO AS PAYMENTVOUCHERNO,',
'       NULL AS REASONFORNONITCAVAILABLE,',
'       NULL AS ORIGINALINVOICEYESNO,',
'       A.PURCHASEACCOUNTNAME,',
'       A.PURCHASEGROUPNAME',
'  from gsttaxinoutdetail a,',
'       PARTY P,',
'       TAXREGISTRATIONTYPE TG,',
'       NATUREOFSUPPLY NS,',
'       ITEM I,',
'       JOBTYPE J,',
'       (SELECT ZZ.TNO          AS BILLVOUCHERTNO,',
'               ZZ.MODULETNO,',
'               XX.CRVOUCHERTNO,',
'               YY.VOUCHERNO    AS PAYMENTVOUCHERNO,',
'               YY.VOUCHERDATE  AS PAYMENTVOUCHERDATE',
'          FROM DRCRALLOCATION XX, VOUCHER YY, VOUCHER ZZ',
'         WHERE XX.MODULETNO = YY.TNO',
'           AND YY.DOCTYPECODE = ''PAYMENT''',
'           AND XX.CRVOUCHERTNO = ZZ.TNO) PY',
'',
' where a.type = ''INWARD''',
'   AND A.PARTYCODE = P.PARTYCODE(+)',
'   AND P.TAXREGISTRATIONTYPECODE = TG.TAXREGISTRATIONTYPECODE(+)',
'   AND A.NatureOfSupplyCode = NS.NATUREOFSUPPLYCODE(+)',
'   AND A.ITEMCODE = I.ITEMCODE(+)',
'   and A.JOBTYPECODE = J.JOBTYPECODE(+)',
'   AND A.Vouchertno = PY.BILLVOUCHERTNO(+)',
' /*  AND ( NVL(A.IGST,0) > 0 OR NVL(A.CGST,0) > 0)*/',
'  and instr('':''||:P403_LOCATION||'':'','':''||a.LocationCode||'':'') > 0',
'  and a.VoucherDate between :P403_FROMDATE and :P403_TODATE',
'  and ( :P403_PARTY IS NULL OR instr('':''||:P403_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P403_MODULECODE IS NULL OR instr('':''||:P403_MODULECODE||'':'','':''||a.MODULECODE||'':'') > 0 ) ',
'  ',
'/*  and a.ModuleCode like  nvl(:P403_BANK,''%'')*/',
';'))
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
 p_id=>wwv_flow_imp.id(507228043138533844)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_save_rpt_public=>'Y'
,p_show_nulls_as=>'0'
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
,p_download_formats=>'CSV:HTML:XLSX'
,p_enable_mail_download=>'N'
,p_internal_uid=>481068213994827896
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475566308911376731)
,p_db_column_name=>'ACTUALMONTHOFGSTR2A'
,p_display_order=>230
,p_column_identifier=>'AH'
,p_column_label=>'ACTUAL MONTH OF GSTR2A'
,p_column_html_expression=>'<div style="display:block; width:100px">#ACTUALMONTHOFGSTR2A#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475565513903376731)
,p_db_column_name=>'ACTUALMONTHOFGSTR3B'
,p_display_order=>210
,p_column_identifier=>'AF'
,p_column_label=>'ACTUAL MONTH OF GSTR3B'
,p_column_html_expression=>'<div style="display:block; width:100px">#ACTUALMONTHOFGSTR3B#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475579465822376738)
,p_db_column_name=>'ACTUALPAYMENTDAYS'
,p_display_order=>540
,p_column_identifier=>'BM'
,p_column_label=>'ACTUAL PAYMENT DAYS'
,p_column_html_expression=>'<div style="display:block; width:80px">#ACTUALPAYMENTDAYS#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475573107900376735)
,p_db_column_name=>'APPLICABILITYOFWAYBILL'
,p_display_order=>400
,p_column_identifier=>'AY'
,p_column_label=>'APPLICABILITY OF WAYBILL'
,p_column_html_expression=>'<div style="display:block; width:110px">#APPLICABILITYOFWAYBILL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475574311020376735)
,p_db_column_name=>'BRODGROUPNAME'
,p_display_order=>430
,p_column_identifier=>'BB'
,p_column_label=>'BROD GROUP NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#BRODGROUPNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475576729186376736)
,p_db_column_name=>'CGST'
,p_display_order=>490
,p_column_identifier=>'BH'
,p_column_label=>'CGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#CGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475565089494376731)
,p_db_column_name=>'CONSIDEREDINGSTR3B'
,p_display_order=>200
,p_column_identifier=>'AE'
,p_column_label=>'CONSIDEREDIN GSTR3B'
,p_column_html_expression=>'<div style="display:block; width:100px">#CONSIDEREDINGSTR3B#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475564690955376731)
,p_db_column_name=>'CRACCOUNTINERP'
,p_display_order=>190
,p_column_identifier=>'AD'
,p_column_label=>'CR ACCOUNT IN ERP'
,p_column_html_expression=>'<div style="display:block; width:100px">#CRACCOUNTINERP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475566706134376732)
,p_db_column_name=>'DEALERTYPE'
,p_display_order=>240
,p_column_identifier=>'AI'
,p_column_label=>'DEALER TYPE'
,p_column_html_expression=>'<div style="display:block; width:100px">#DEALERTYPE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475564290980376731)
,p_db_column_name=>'DRACCOUNTINERP'
,p_display_order=>180
,p_column_identifier=>'AC'
,p_column_label=>'DR ACCOUNT IN ERP'
,p_column_html_expression=>'<div style="display:block; width:100px">#DRACCOUNTINERP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475563500765376730)
,p_db_column_name=>'ENTRYNO'
,p_display_order=>160
,p_column_identifier=>'AA'
,p_column_label=>'ENTRY NO'
,p_column_html_expression=>'<div style="display:block; width:140px">#ENTRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475573449604376735)
,p_db_column_name=>'EWAYBILLNO'
,p_display_order=>410
,p_column_identifier=>'AZ'
,p_column_label=>'EWAYBILL NO'
,p_column_html_expression=>'<div style="display:block; width:110px">#EWAYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475567528036376732)
,p_db_column_name=>'GSTRATEAPPLICABILITY'
,p_display_order=>260
,p_column_identifier=>'AK'
,p_column_label=>'GST RATE APPLICABILITY'
,p_column_html_expression=>'<div style="display:block; width:100px">#GSTRATEAPPLICABILITY#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475569479766376733)
,p_db_column_name=>'GSTSTATECODE'
,p_display_order=>310
,p_column_identifier=>'AP'
,p_column_label=>'GST STATE CODE'
,p_column_html_expression=>'<div style="display:block; width:100px">#GSTSTATECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475575438986376736)
,p_db_column_name=>'GSTTAXRATE'
,p_display_order=>460
,p_column_identifier=>'BE'
,p_column_label=>'GST TAX RATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#GSTTAXRATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475574679427376735)
,p_db_column_name=>'HSNSAC'
,p_display_order=>440
,p_column_identifier=>'BC'
,p_column_label=>'HSN/SAC'
,p_column_html_expression=>'<div style="display:block; width:80px">#HSNSAC#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475576313879376736)
,p_db_column_name=>'IGST'
,p_display_order=>480
,p_column_identifier=>'BG'
,p_column_label=>'IGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#IGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475579048376376737)
,p_db_column_name=>'INVOICEAMOUNT'
,p_display_order=>530
,p_column_identifier=>'BL'
,p_column_label=>'INVOICE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#INVOICEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475572716445376734)
,p_db_column_name=>'INVOICEDATE'
,p_display_order=>390
,p_column_identifier=>'AX'
,p_column_label=>'INVOICE DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#INVOICEDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475572319400376734)
,p_db_column_name=>'INVOICENO'
,p_display_order=>380
,p_column_identifier=>'AW'
,p_column_label=>'INVOICE NO'
,p_column_html_expression=>'<div style="display:block; width:110px">#INVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475567880142376732)
,p_db_column_name=>'ITCAVAILABILITY'
,p_display_order=>270
,p_column_identifier=>'AL'
,p_column_label=>'ITC AVAILABILITY'
,p_column_html_expression=>'<div style="display:block; width:100px">#ITCAVAILABILITY#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(198400300169054344)
,p_db_column_name=>'MODULE'
,p_display_order=>610
,p_column_identifier=>'BT'
,p_column_label=>'MODULE'
,p_column_html_expression=>'<div style="display:block; width:140px">#MODULE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475562632528376729)
,p_db_column_name=>'NAMEOFSITE'
,p_display_order=>140
,p_column_identifier=>'Y'
,p_column_label=>'BRANCH'
,p_column_html_expression=>'<div style="display:block; width:100px">#NAMEOFSITE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475568326231376732)
,p_db_column_name=>'NAMEOFSUPPLIER'
,p_display_order=>280
,p_column_identifier=>'AM'
,p_column_label=>'NAME OF SUPPLIER'
,p_column_html_expression=>'<div style="display:block; width:240px">#NAMEOFSUPPLIER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475580703876376738)
,p_db_column_name=>'ORIGINALINVOICEYESNO'
,p_display_order=>570
,p_column_identifier=>'BP'
,p_column_label=>'ORIGINAL INVOICE YES/NO'
,p_column_html_expression=>'<div style="display:block; width:80px">#ORIGNALINVOICEYESNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475577834497376737)
,p_db_column_name=>'OTHERINCIDENTALAMOUNT'
,p_display_order=>520
,p_column_identifier=>'BK'
,p_column_label=>'OTHER INCIDENTAL AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#OTHERINCIDENTALAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475573917266376735)
,p_db_column_name=>'PARTICULAROFITEMJOB'
,p_display_order=>420
,p_column_identifier=>'BA'
,p_column_label=>'PARTICULAR OF ITEM JOB'
,p_column_html_expression=>'<div style="display:block; width:100px">#PARTICULAROFITEMJOB#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475579930775376738)
,p_db_column_name=>'PAYMENTVOUCHERNO'
,p_display_order=>550
,p_column_identifier=>'BN'
,p_column_label=>'PAYMENT VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#PAYMENTVOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475581124494376738)
,p_db_column_name=>'PURCHASEACCOUNTNAME'
,p_display_order=>580
,p_column_identifier=>'BQ'
,p_column_label=>'EXPENSE ACCOUNT'
,p_column_html_expression=>'<div style="display:block; width:100px">#PURCHASEACCOUNTNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475581471315376739)
,p_db_column_name=>'PURCHASEGROUPNAME'
,p_display_order=>590
,p_column_identifier=>'BR'
,p_column_label=>'EXPENSE GROUP'
,p_column_html_expression=>'<div style="display:block; width:100px">#PURCHASEGROUPNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475571457456376734)
,p_db_column_name=>'QUANTITY'
,p_display_order=>360
,p_column_identifier=>'AU'
,p_column_label=>'QUANTITY'
,p_column_html_expression=>'<div style="display:block; width:80px">#QUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475580317206376738)
,p_db_column_name=>'REASONFORNONITCAVAILABLE'
,p_display_order=>560
,p_column_identifier=>'BO'
,p_column_label=>'REASON FOR NON-ITC AVAILABLE'
,p_column_html_expression=>'<div style="display:block; width:80px">#REASONFORNONITCAVAILABLE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(198158448226717945)
,p_db_column_name=>'SERIALNO'
,p_display_order=>600
,p_column_identifier=>'BS'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475577040068376736)
,p_db_column_name=>'SGST'
,p_display_order=>500
,p_column_identifier=>'BI'
,p_column_label=>'SGST'
,p_column_html_expression=>'<div style="display:block; width:80px">#SGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475565839830376731)
,p_db_column_name=>'SHOWNINGSTR2A'
,p_display_order=>220
,p_column_identifier=>'AG'
,p_column_label=>'SHOWNIN GSTR2A'
,p_column_html_expression=>'<div style="display:block; width:100px">#SHOWNINGSTR2A#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475563073252376730)
,p_db_column_name=>'STATEOFSITE'
,p_display_order=>150
,p_column_identifier=>'Z'
,p_column_label=>'STATE OF SITE'
,p_column_html_expression=>'<div style="display:block; width:100px">#STATEOFSITE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475568642120376733)
,p_db_column_name=>'SUPPLIERADDRESS'
,p_display_order=>290
,p_column_identifier=>'AN'
,p_column_label=>'SUPPLIER ADDRESS'
,p_column_html_expression=>'<div style="display:block; width:250px">#SUPPLIERADDRESS#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475569843541376733)
,p_db_column_name=>'SUPPLIERGSTIN'
,p_display_order=>320
,p_column_identifier=>'AQ'
,p_column_label=>'SUPPLIER GSTIN'
,p_column_html_expression=>'<div style="display:block; width:100px">#SUPPLIERGSTIN#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475570309349376733)
,p_db_column_name=>'SUPPLIERPANNO'
,p_display_order=>330
,p_column_identifier=>'AR'
,p_column_label=>'SUPPLIER PANNO'
,p_column_html_expression=>'<div style="display:block; width:110px">#SUPPLIERPANNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475569088799376733)
,p_db_column_name=>'SUPPLIERSTATE'
,p_display_order=>300
,p_column_identifier=>'AO'
,p_column_label=>'SUPPLIER STATE'
,p_column_html_expression=>'<div style="display:block; width:100px">#SUPPLIERSTATE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475575856874376736)
,p_db_column_name=>'TAXABLEVALUEBEFORETAX'
,p_display_order=>470
,p_column_identifier=>'BF'
,p_column_label=>'TAXABLE VALUE BEFORE TAX'
,p_column_html_expression=>'<div style="display:block; width:80px">#TAXABLEVALUEBEFORETAX#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475577477390376737)
,p_db_column_name=>'TOTALTAX'
,p_display_order=>510
,p_column_identifier=>'BJ'
,p_column_label=>'TOTAL TAX'
,p_column_html_expression=>'<div style="display:block; width:90px">#TOTALTAX#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475575035937376736)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>450
,p_column_identifier=>'BD'
,p_column_label=>'TRANSACTION TYPE'
,p_column_html_expression=>'<div style="display:block; width:80px">#TRANSACTIONTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475567131025376732)
,p_db_column_name=>'TYPEOFREGISTRATION'
,p_display_order=>250
,p_column_identifier=>'AJ'
,p_column_label=>'TYPE OF REGISTRATION'
,p_column_html_expression=>'<div style="display:block; width:110px">#TYPEOFREGISTRATION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475571892232376734)
,p_db_column_name=>'UNIT'
,p_display_order=>370
,p_column_identifier=>'AV'
,p_column_label=>'UNIT'
,p_column_html_expression=>'<div style="display:block; width:80px">#UNIT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475578679053376737)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'VOUCHER DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(475578237751376737)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:180px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(507521051946343642)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'129683'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:NAMEOFSITE:VOUCHERNO:VOUCHERDATE:MODULE:ENTRYNO:DEALERTYPE:TYPEOFREGISTRATION:GSTRATEAPPLICABILITY:ITCAVAILABILITY:NAMEOFSUPPLIER:SUPPLIERSTATE:GSTSTATECODE:SUPPLIERGSTIN:SUPPLIERPANNO:INVOICENO:INVOICEDATE:PARTICULAROFITEMJOB:HSNSAC:QUANTIT'
||'Y:UNIT:TRANSACTIONTYPECODE:GSTTAXRATE:TAXABLEVALUEBEFORETAX:IGST:CGST:SGST:TOTALTAX:OTHERINCIDENTALAMOUNT:INVOICEAMOUNT'
,p_sort_column_1=>'VOUCHERDATE'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'QUANTITY:TAXABLEVALUEBEFORETAX:IGST:CGST:SGST:TOTALTAX:INVOICEAMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(557809315184397046)
,p_plug_name=>'GST Input Report As Per Transaction'
,p_static_id=>'gst-input-report-as-per-transaction'
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
 p_id=>wwv_flow_imp.id(101915964069816652)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(557809315184397046)
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
 p_id=>wwv_flow_imp.id(475615149764376859)
,p_name=>'P403_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(557809315184397046)
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
 p_id=>wwv_flow_imp.id(475615994928376860)
,p_name=>'P403_LOCATION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(557809315184397046)
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
';'))
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
 p_id=>wwv_flow_imp.id(475616824097376861)
,p_name=>'P403_MODULECODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(557809315184397046)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'        Distinct',
'        A.modulecode as modulename,',
'        A.modulecode',
'From gsttaxinoutdetail a',
'Where a.Type =''INWARD'''))
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
 p_id=>wwv_flow_imp.id(475616330754376861)
,p_name=>'P403_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(557809315184397046)
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
'Order By 1'))
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
  'attribute_09', '3',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(475615564152376860)
,p_name=>'P403_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(557809315184397046)
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
 p_id=>wwv_flow_imp.id(101918047570816654)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(101918588963816654)
,p_event_id=>wwv_flow_imp.id(101918047570816654)
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
