prompt --application/pages/page_00231
begin
--   Manifest
--     PAGE: 00231
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>105
,p_default_id_offset=>8254719097899851
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>231
,p_name=>'GST Input Report As Per Voucher'
,p_alias=>'GST-INPUT-REPORT-AS-PER-VOUCHER'
,p_step_title=>'GST Input Report As Per Voucher'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
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
 p_id=>wwv_flow_imp.id(729079355961894289)
,p_plug_name=>'GST Input Report'
,p_static_id=>'gst-input-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'       row_number() over(order by a.VOUCHERDATE) SerialNo,',
'       getlocationname(A.locationcode) AS NAMEOFSITE,',
'       getlocationattributevalue(A.LOCATIONCODE, ''LOCATIONSTATE'') AS STATEOFSITE,',
'       CO.COMPANYNAME,',
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
'       --A.GRNNO,',
'       --A.GRNDATE,',
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
'       round(A.TaxableAmount,2) AS TAXABLEVALUEBEFORETAX,',
'       v.igst * decode(a.ModuleCode, ''DEBITNOTE'', -1, 1) * round(A.IGST,2) as IGST,',
'       v.cgst * decode(a.ModuleCode, ''DEBITNOTE'', -1, 1) * ROUND(A.CGST,2) AS CGST,',
'       v.sgst * decode(a.ModuleCode, ''DEBITNOTE'', -1, 1) * ROUND(A.SGST,2) AS SGST,',
'        decode(a.ModuleCode, ''DEBITNOTE'', -1, 1) * ',
'            ROUND(',
'                v.igst * NVL(A.IGST, 0) ',
'                + v.cgst * NVL(A.CGST, 0) ',
'                + v.sgst * NVL(A.SGST, 0),',
'                2',
'            ) ',
'        AS TOTALTAX,',
'       decode(a.ModuleCode, ''DEBITNOTE'', -1, 1) * ROUND(NVL(A.billamount, 0) -',
'       decode(a.ModuleCode, ''DEBITNOTE'', -1, 1) * NVL(nvl(a.taxableamount,0) + (NVL(v.igst * A.IGST, 0) + NVL(v.cgst * A.CGST, 0) + NVL(v.sgst * A.SGST, 0)), 0),2) AS OTHERINCIDENTALAMOUNT,',
'       decode(a.ModuleCode, ''DEBITNOTE'', -1, 1) * ROUND(A.billamount,2) AS INVOICEAMOUNT,',
'       NULL AS REASONFORNONITCAVAILABLE,',
'       NULL AS ORIGINALINVOICEYESNO,',
'       A.PURCHASEACCOUNTNAME,',
'       A.PURCHASEGROUPNAME,',
'       K.GSTINNO,',
'       LO.LOCATIONNAME',
'  from gsttaxinoutdetail a,',
'       PARTY P,',
'       COMPANY CO,',
'       LOCATION LO,',
'       TAXREGISTRATIONTYPE TG,',
'       NATUREOFSUPPLY NS,',
'       ITEM I,',
'       JOBTYPE J,',
'       LOCATIONGSTINDETAIL K,',
'        --------------------------- --',
'        -- 03-may-2024',
'        (',
'            select ',
'                  aa.tno,',
'                  nvl(sum(decode(aa.AccountCode, ''233'', 1,''247'',1, 0 )),0) as CGST,',
'                  nvl(sum(decode(aa.AccountCode, ''253'', 1,''249'',1, 0 )),0) as SGST,',
'                  nvl(sum(decode(aa.AccountCode, ''241'', 1,''248'',1, 0 )),0) as IGST,',
'                  sum(decode(aa.AccountCode, ''2814'', 1, 0 )) as CESS',
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
' where 1=1',
'   AND EXISTS(',
'      SELECT ',
'          AA.TNO ',
'      FROM VOUCHERDETAIL AA ',
'      WHERE AA.ACCOUNTCODE IN (''233'',''253'',''241'',''247'',''248'',''249'')--(''2805'', ''2807'', ''2808'', ''2814'')',
'          AND AA.TNO = A.VOUCHERTNO',
'   )',
'   AND A.PARTYCODE = P.PARTYCODE(+)',
'   and A.COMPANYCODE = CO.COMPANYCODE(+)',
'   AND A.LOCATIONCODE = LO.LOCATIONCODE(+)',
'   AND P.TAXREGISTRATIONTYPECODE = TG.TAXREGISTRATIONTYPECODE(+)',
'   AND A.NatureOfSupplyCode = NS.NATUREOFSUPPLYCODE(+)',
'   AND A.ITEMCODE = I.ITEMCODE(+)',
'   and A.JOBTYPECODE = J.JOBTYPECODE(+)',
'   AND A.LOCATIONCODE = K.LOCATIONCODE(+)',
'   and a.VoucherTNo = v.tno',
'   and ( :P231_COMPANY IS NULL OR instr('':''||:P231_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'   and a.VoucherDate between :P231_FROMDATE and :P231_TODATE ',
'   and ( :P231_LOCATION IS NULL OR instr('':''||:P231_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'   and ( :P231_PARTY IS NULL OR instr('':''||:P231_PARTY||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'   and ( :P231_MODULECODE IS NULL OR instr('':''||:P231_MODULECODE||'':'','':''||a.MODULECODE||'':'') > 0 )  ',
'   and ( :P231_COMPANYGSTIN IS NULL OR instr('':''||:P231_COMPANYGSTIN||'':'','':''||K.GSTINNO||'':'') > 0 ) ',
'   AND ( ',
'      ( NVL(A.IGST,0)   > 0 AND :P231_SER = ''IGST'' )',
'      OR ',
'      (  NVL(A.SGST,0) <= 0 AND :P231_SER = ''SGST'' )',
'      OR ',
'      :P231_SER IS NULL',
'  )',
'  AND A.TYPE=''INWARD''',
' /*  AND ( NVL(A.IGST,0) > 0 OR NVL(A.CGST,0) > 0)*/',
' -- ',
'/*  and a.ModuleCode like  nvl(:P231_BANK,''%'')*/',
';'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P231_COMPANY,P231_FROMDATE,P231_TODATE,P231_LOCATION,P231_PARTY,P231_MODULECODE,P231_COMPANYGSTIN,P231_SER'
,p_plug_display_condition_type=>'ITEM_IS_NOT_NULL'
,p_plug_display_when_condition=>'P231_FROMDATE'
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
 p_id=>wwv_flow_imp.id(707648750489494927)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_allow_report_saving=>'N'
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
,p_internal_uid=>673947431537086229
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663038887154371395)
,p_db_column_name=>'ACTUALMONTHOFGSTR2A'
,p_display_order=>230
,p_column_identifier=>'AH'
,p_column_label=>'ACTUAL MONTH OF GSTR2A'
,p_column_html_expression=>'<div style="display:block; width:110px">#ACTUALMONTHOFGSTR2A#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663038082722371395)
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
 p_id=>wwv_flow_imp.id(663045621422371398)
,p_db_column_name=>'APPLICABILITYOFWAYBILL'
,p_display_order=>400
,p_column_identifier=>'AY'
,p_column_label=>'APPLICABILITY OF WAYBILL'
,p_column_html_expression=>'<div style="display:block; width:100px">#APPLICABILITYOFWAYBILL#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663046870421371399)
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
 p_id=>wwv_flow_imp.id(663049278967371400)
,p_db_column_name=>'CGST'
,p_display_order=>490
,p_column_identifier=>'BH'
,p_column_label=>'CGST'
,p_column_html_expression=>'<div style="display:block; width:100px">#CGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663054458810371403)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>600
,p_column_identifier=>'BS'
,p_column_label=>'COMPANY NAME'
,p_column_html_expression=>'<div style="display:block; width:180px">#COMPANYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663037701206371394)
,p_db_column_name=>'CONSIDEREDINGSTR3B'
,p_display_order=>200
,p_column_identifier=>'AE'
,p_column_label=>'CONSIDEREDIN GSTR3B'
,p_column_html_expression=>'<div style="display:block; width:120px">#CONSIDEREDINGGSTR3B#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663037220184371394)
,p_db_column_name=>'CRACCOUNTINERP'
,p_display_order=>190
,p_column_identifier=>'AD'
,p_column_label=>'CR ACCOUNT IN ERP'
,p_column_html_expression=>'<div style="display:block; width:110px">#CRACCOUNTINERP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663039242134371395)
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
 p_id=>wwv_flow_imp.id(663036863438371394)
,p_db_column_name=>'DRACCOUNTINERP'
,p_display_order=>180
,p_column_identifier=>'AC'
,p_column_label=>'DR ACCOUNT IN ERP'
,p_column_html_expression=>'<div style="display:block; width:110px">#DRACCOUNTINERP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663036070584371393)
,p_db_column_name=>'ENTRYNO'
,p_display_order=>160
,p_column_identifier=>'AA'
,p_column_label=>'ENTRY NO'
,p_column_html_expression=>'<div style="display:block; width:180px">#ENTRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663046053254371399)
,p_db_column_name=>'EWAYBILLNO'
,p_display_order=>410
,p_column_identifier=>'AZ'
,p_column_label=>'EWAYBILL NO'
,p_column_html_expression=>'<div style="display:block; width:150px">#EWAYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663055241236371403)
,p_db_column_name=>'GSTINNO'
,p_display_order=>630
,p_column_identifier=>'BW'
,p_column_label=>'COMPANY GSTIN NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#GSTINNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663040026453371396)
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
 p_id=>wwv_flow_imp.id(663042071626371397)
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
 p_id=>wwv_flow_imp.id(663048045661371400)
,p_db_column_name=>'GSTTAXRATE'
,p_display_order=>460
,p_column_identifier=>'BE'
,p_column_label=>'GST TAX RATE'
,p_column_html_expression=>'<div style="display:block; width:100px">#GSTTAXRATE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663047299386371399)
,p_db_column_name=>'HSNSAC'
,p_display_order=>440
,p_column_identifier=>'BC'
,p_column_label=>'HSN/SAC'
,p_column_html_expression=>'<div style="display:block; width:100px">#HSNSAC#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663048883373371400)
,p_db_column_name=>'IGST'
,p_display_order=>480
,p_column_identifier=>'BG'
,p_column_label=>'IGST'
,p_column_html_expression=>'<div style="display:block; width:100px">#IGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663051623434371402)
,p_db_column_name=>'INVOICEAMOUNT'
,p_display_order=>530
,p_column_identifier=>'BL'
,p_column_label=>'INVOICE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:100px">#INVOICEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663045244069371398)
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
 p_id=>wwv_flow_imp.id(663044823939371398)
,p_db_column_name=>'INVOICENO'
,p_display_order=>380
,p_column_identifier=>'AW'
,p_column_label=>'INVOICE NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#INVOICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663040440926371396)
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
 p_id=>wwv_flow_imp.id(663054885263371403)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>620
,p_column_identifier=>'BU'
,p_column_label=>'LOCATION NAME'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205636415907733648)
,p_db_column_name=>'MODULE'
,p_display_order=>650
,p_column_identifier=>'BY'
,p_column_label=>'MODULE'
,p_column_html_expression=>'<div style="display:block; width:140px">#MODULE#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663035229322371393)
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
 p_id=>wwv_flow_imp.id(663040871621371396)
,p_db_column_name=>'NAMEOFSUPPLIER'
,p_display_order=>280
,p_column_identifier=>'AM'
,p_column_label=>'NAME OF SUPPLIER'
,p_column_html_expression=>'<div style="display:block; width:260px">#NAMEOFSUPPLIER#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663053215539371402)
,p_db_column_name=>'ORIGINALINVOICEYESNO'
,p_display_order=>570
,p_column_identifier=>'BP'
,p_column_label=>'ORIGINAL INVOICE YES/NO'
,p_column_html_expression=>'<div style="display:block; width:100px">#ORIGNALINVOICEYESNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663050503080371401)
,p_db_column_name=>'OTHERINCIDENTALAMOUNT'
,p_display_order=>520
,p_column_identifier=>'BK'
,p_column_label=>'OTHER INCIDENTAL AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:100px">#OTHERINCIDENTALAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663046438940371399)
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
 p_id=>wwv_flow_imp.id(663053680651371403)
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
 p_id=>wwv_flow_imp.id(663054106769371403)
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
 p_id=>wwv_flow_imp.id(663044101693371398)
,p_db_column_name=>'QUANTITY'
,p_display_order=>360
,p_column_identifier=>'AU'
,p_column_label=>'QUANTITY'
,p_column_html_expression=>'<div style="display:block; width:100px">#QUANTITY#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663052850829371402)
,p_db_column_name=>'REASONFORNONITCAVAILABLE'
,p_display_order=>560
,p_column_identifier=>'BO'
,p_column_label=>'REASON FOR NON-ITC AVAILABLE'
,p_column_html_expression=>'<div style="display:block; width:100px">#REASONFORNONITCAVAILABLE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663034904780371393)
,p_db_column_name=>'SERIALNO'
,p_display_order=>640
,p_column_identifier=>'BX'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663049701729371401)
,p_db_column_name=>'SGST'
,p_display_order=>500
,p_column_identifier=>'BI'
,p_column_label=>'SGST'
,p_column_html_expression=>'<div style="display:block; width:100px">#SGST#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663038447223371395)
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
 p_id=>wwv_flow_imp.id(663035655314371393)
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
 p_id=>wwv_flow_imp.id(663041229484371396)
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
 p_id=>wwv_flow_imp.id(663042440720371397)
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
 p_id=>wwv_flow_imp.id(663042842483371397)
,p_db_column_name=>'SUPPLIERPANNO'
,p_display_order=>330
,p_column_identifier=>'AR'
,p_column_label=>'SUPPLIER PANNO'
,p_column_html_expression=>'<div style="display:block; width:100px">#SUPPLIERPANNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663041660678371396)
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
 p_id=>wwv_flow_imp.id(663048429362371400)
,p_db_column_name=>'TAXABLEVALUEBEFORETAX'
,p_display_order=>470
,p_column_identifier=>'BF'
,p_column_label=>'TAXABLE VALUE BEFORE TAX'
,p_column_html_expression=>'<div style="display:block; width:130px">#TAXABLEVALUEBEFORETAX#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663050100001371401)
,p_db_column_name=>'TOTALTAX'
,p_display_order=>510
,p_column_identifier=>'BJ'
,p_column_label=>'TOTAL TAX'
,p_column_html_expression=>'<div style="display:block; width:100px">#TOTALTAX#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663047622614371399)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>450
,p_column_identifier=>'BD'
,p_column_label=>'TRANSACTION TYPE'
,p_column_html_expression=>'<div style="display:block; width:100px">#TRANSACTIONTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663039654003371395)
,p_db_column_name=>'TYPEOFREGISTRATION'
,p_display_order=>250
,p_column_identifier=>'AJ'
,p_column_label=>'TYPE OF REGISTRATION'
,p_column_html_expression=>'<div style="display:block; width:100px">#TYPEOFREGISTRATION#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663044422656371398)
,p_db_column_name=>'UNIT'
,p_display_order=>370
,p_column_identifier=>'AV'
,p_column_label=>'UNIT'
,p_column_html_expression=>'<div style="display:block; width:100px">#UNIT#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(663051254927371401)
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
 p_id=>wwv_flow_imp.id(663050819646371401)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'VOUCHER NO'
,p_column_html_expression=>'<div style="display:block; width:160px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(707941759297304725)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'129683'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'SERIALNO:NAMEOFSITE:VOUCHERNO:VOUCHERDATE:MODULE:ENTRYNO:DEALERTYPE:TYPEOFREGISTRATION:GSTRATEAPPLICABILITY:ITCAVAILABILITY:NAMEOFSUPPLIER:SUPPLIERSTATE:GSTSTATECODE:SUPPLIERGSTIN:SUPPLIERPANNO:INVOICENO:INVOICEDATE:PARTICULAROFITEMJOB:HSNSAC:QUANTIT'
||'Y:UNIT:TRANSACTIONTYPECODE:GSTTAXRATE:TAXABLEVALUEBEFORETAX:IGST:CGST:SGST:TOTALTAX:OTHERINCIDENTALAMOUNT:INVOICEAMOUNT'
,p_sort_column_1=>'SERIALNO'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'VOUCHERDATE'
,p_sort_direction_2=>'ASC'
,p_sum_columns_on_break=>'QUANTITY:IGST:CGST:SGST:TOTALTAX:OTHERINCIDENTALAMOUNT:TAXABLEVALUEBEFORETAX:INVOICEAMOUNT'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(758230022535358129)
,p_plug_name=>'GST Input Report As Per Voucher'
,p_static_id=>'gst-input-report-as-per-voucher'
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
 p_id=>wwv_flow_imp.id(109152313128495955)
,p_button_sequence=>120
,p_button_plug_id=>wwv_flow_imp.id(758230022535358129)
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
 p_id=>wwv_flow_imp.id(663089716031371476)
,p_name=>'P231_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(758230022535358129)
,p_prompt=>'Company'
,p_placeholder=>'Enter Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select ',
'     b.CompanyName d,',
'     b.CompanyCode r',
'  From Company b'))
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
 p_id=>wwv_flow_imp.id(663092130994371477)
,p_name=>'P231_COMPANYGSTIN'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(758230022535358129)
,p_prompt=>'Company GSTIN'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select getcompanyattributevalue(A.COMPANYCODE, ''GSTINNO'') d,',
'getcompanyattributevalue(A.COMPANYCODE, ''GSTINNO'') r',
' From COMPANY a',
'/*Select',
'       Distinct',
'       p.GSTINNO d,',
'       p.GSTINNO r',
'From LOCATIONGSTINDETAIL p',
'Order By 1',
'*/'))
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
 p_id=>wwv_flow_imp.id(663090066337371476)
,p_name=>'P231_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(758230022535358129)
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
 p_id=>wwv_flow_imp.id(663090877744371476)
,p_name=>'P231_LOCATION'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(758230022535358129)
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
 p_id=>wwv_flow_imp.id(663091734131371477)
,p_name=>'P231_MODULECODE'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(758230022535358129)
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
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(663091280443371476)
,p_name=>'P231_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(758230022535358129)
,p_prompt=>'Vendor'
,p_placeholder=>'Enter Party Name'
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
 p_id=>wwv_flow_imp.id(663092466008371477)
,p_name=>'P231_SER'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(758230022535358129)
,p_prompt=>'Only GST'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:IGST;IGST,SGST;SGST'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select List-'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(663090522319371476)
,p_name=>'P231_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(758230022535358129)
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
 p_id=>wwv_flow_imp.id(109155292802495957)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(109155742373495957)
,p_event_id=>wwv_flow_imp.id(109155292802495957)
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
