prompt --application/pages/page_00405
begin
--   Manifest
--     PAGE: 00405
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
 p_id=>405
,p_name=>'TDS PAYBLE '
,p_alias=>'TDS-PAYBLE'
,p_step_title=>'TDS PAYBLE '
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
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
 p_id=>wwv_flow_imp.id(560203891137444026)
,p_plug_name=>'TDS PAYBLE'
,p_static_id=>'tds-payble'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       row_number() over(order by b.VoucherDate) SerialNo,',
'       getlocationname(B.LOCATIONCODE) location,',
'       B.DOCTYPECODE,',
'       B.MODULECODE,',
'       B.VOUCHERNO,',
'       B.VOUCHERDATE,',
'       Null As ITEMNATUREONWHICHTDSDEDECTABLE,',
'       A.TDSPAYEECATEGORYCODE,',
'       Null As TDSDEDUCTABLERATE,',
'       F.TAXSECTIONCODE,',
'       GETPARTYNAME(A.PARTYCODE) As PARTY,',
'       A.PANNO,',
'       DECODE(H.ISCOMPANY, ''YES'', ''COMPANY'', Null) ISCOMPANY,',
'       F.TDSNATURENAME,',
'       A.TDSDEDUCTEDON As BASICAMOUNT,',
'       A.TDSPERCENT,',
'       A.TDSAMOUNT,',
'       A.CESSPERCENT,',
'       A.CESSAMOUNT,',
'       A.SURCHARGEPERCENT,',
'       A.SURCHARGEAMOUNT,',
'       CHLN.CHALLANNO As CHALLANNO,',
'       CHLN.CHALLANDATE As CHALLANDATE,',
'       CHLN.BSRCODE As CHALLANBSRCODE,',
'       CHLN.CHALLANAMOUNT As CHALLANAMOUNT,',
'       Case',
'         When C.JBPASSNO Is Not Null Then',
'          ''JBPASS''',
'         When D.EXTERNALSERVICESENTRYNO Is Not Null Then',
'          ''EXTERNAL SERVICE ENTRY ''',
'         When E.PAYMENTADVICENO Is Not Null Then',
'          ''PAYMENT ADVICE''',
'       End TRANSACTIONMODULE,',
'       Case',
'         When C.JBPASSNO Is Not Null Then',
'          C.JBPASSNO',
'         When D.EXTERNALSERVICESENTRYNO Is Not Null Then',
'          D.EXTERNALSERVICESENTRYNO',
'         When E.PAYMENTADVICENO Is Not Null Then',
'          E.PAYMENTADVICENO',
'       End TRANSACTIONNO,',
'       Case',
'         When C.JBPASSNO Is Not Null Then',
'          C.JBPASSDATE',
'         When D.EXTERNALSERVICESENTRYNO Is Not Null Then',
'          D.EXTERNALSERVICESENTRYDATE',
'         When E.PAYMENTADVICENO Is Not Null Then',
'          E.PAYMENTADVICEDATE',
'       End TRANSACTIONDATE,',
'       ',
'       C.JBPASSNO,',
'       c.JOBBILLNO,',
'       c.partybillno as JOBBILLPARTYBILLNO,',
'       D.EXTERNALSERVICESENTRYNO,',
'       E.PAYMENTADVICENO,',
'       i.Freightadviceno,',
'       i.vehicleno,',
'       p.pbpassno,',
'       P.PARTYBILLNO,',
'       P.PURCHASEBILLNO',
'',
'  From VOUCHERTDSDEDUCTED A,',
'       VOUCHER B,',
'       (  select xx.tno,',
'                 xx.jbpassno,',
'                 yy.partybillno,',
'                 xx.jbpassdate,',
'                 yy.jobbillno',
'            from jbpass xx, jobbill yy',
'            where xx.jobbilltno = yy.tno',
'       ) c,',
'       EXTERNALSERVICESENTRY D,',
'       PAYMENTADVICE E,',
'       TDSNATURE F,',
'       TDSTAXCATEGORY G,',
'       PARTY H,',
'       (Select Distinct aa.tno,',
'               aa.Freightadviceno,',
'               aa.FreightAdviceDate,',
'               Case',
'                 When bb.Modulecode = ''CCINVOICE'' Then',
'                  (Select yy.Vehicleno',
'                     From Invoice xx, Ccinvoice yy',
'                    Where xx.ModuleTno = yy.Tno',
'                      And yy.tno = bb.ModuleTno)',
'                 When bb.ModuleCode = ''GRN'' Then',
'                  (Select VehicleNo From Grn x Where x.tno = bb.ModuleTno)',
'                 Else',
'                  Null',
'               End VehicleNo',
'          From FreightAdvice aa, FreightAdviceDetail bb',
'         Where aa.tno = bb.tno) i,',
'       (Select A.CHALLANNO,',
'               A.CHALLANDATE,',
'               E.BSRCODE,',
'               D.MODULETNO,',
'               A.CHALLANAMOUNT',
'          From CHALLAN A, TDSCHALLAN C, TDSCHALLANDEDUCTEEDETAIL D, BANK E',
'         Where A.DOCTYPECODE = ''TDSCHALLAN''',
'           And A.MODULETNO = C.TNO',
'           And C.TNO = D.TNO',
'           And A.TAXSECTIONCODE = D.TAXSECTIONCODE',
'           And A.DEPOSITEDINBANKCODE = E.BANKCODE) CHLN,',
'       (  select xx.tno,',
'                 xx.pbpassno,',
'                 yy.partybillno,',
'                 xx.pbpassdate,',
'                 YY.PURCHASEBILLNO',
'            from pbpass xx, purchasebill yy',
'            where xx.purchasebilltno = yy.tno',
'       ) p',
'',
' Where A.TNO = B.TNO(+)',
'   And B.MODULETNO = C.TNO(+)',
'   And B.MODULETNO = D.TNO(+)',
'   And B.MODULETNO = E.TNO(+)',
'   And A.TDSNATURECODE = F.TDSNATURECODE(+)',
'   And A.TDSTAXCATEGORYCODE = G.TDSTAXCATEGORYCODE(+)',
'   And A.PARTYCODE = H.PARTYCODE(+)',
'   And B.MODULETNO = CHLN.MODULETNO(+)',
'   And b.Moduletno = i.tno(+)',
'   And b.ModuleTno = p.tno(+)',
'',
'  and instr('':''||:P405_LOCATION||'':'','':''||b.LocationCode||'':'') > 0',
'  and B.VoucherDate between :P405_FROMDATE and :P405_TODATE',
'  and B.ModuleCode like nvl(:P405_MODULECODE,''%'')',
''))
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
 p_id=>wwv_flow_imp.id(538773285665044664)
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
,p_internal_uid=>99788416465346680
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467292682936002757)
,p_db_column_name=>'BASICAMOUNT'
,p_display_order=>170
,p_column_identifier=>'EB'
,p_column_label=>'BASIC AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#BASICAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467294279978002758)
,p_db_column_name=>'CESSAMOUNT'
,p_display_order=>210
,p_column_identifier=>'EF'
,p_column_label=>'CESS AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#CESSAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467293849721002758)
,p_db_column_name=>'CESSPERCENT'
,p_display_order=>200
,p_column_identifier=>'EE'
,p_column_label=>'CESS PERCENT'
,p_column_html_expression=>'<div style="display:block; width:80px">#CESSPERCENT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467300251998002761)
,p_db_column_name=>'CHALLANAMOUNT'
,p_display_order=>350
,p_column_identifier=>'ET'
,p_column_label=>'CHALLAN AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#CHALLANAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467295908480002759)
,p_db_column_name=>'CHALLANBSRCODE'
,p_display_order=>260
,p_column_identifier=>'EK'
,p_column_label=>'CHALLAN BSR CODE'
,p_column_html_expression=>'<div style="display:block; width:90px">#CHALLANBSRCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467299905699002761)
,p_db_column_name=>'CHALLANDATE'
,p_display_order=>340
,p_column_identifier=>'ES'
,p_column_label=>'CHALLAN DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#CHALLANDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467295510136002759)
,p_db_column_name=>'CHALLANNO'
,p_display_order=>240
,p_column_identifier=>'EI'
,p_column_label=>'CHALLAN NO'
,p_column_html_expression=>'<div style="display:block; width:120px">#CHALLANNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467289146954002755)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>80
,p_column_identifier=>'DS'
,p_column_label=>'VOUCHER TYPE'
,p_column_html_expression=>'<div style="display:block; width:100px">#DOCTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467297868366002760)
,p_db_column_name=>'EXTERNALSERVICESENTRYNO'
,p_display_order=>320
,p_column_identifier=>'EQ'
,p_column_label=>'EXTERNAL SERVICE ENTRY  NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#EXTERNALSERVICESENTRYNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485485771736889508)
,p_db_column_name=>'FREIGHTADVICENO'
,p_display_order=>360
,p_column_identifier=>'EU'
,p_column_label=>'FREIGHT ADVICE NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#FREIGHTADVICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467291911164002757)
,p_db_column_name=>'ISCOMPANY'
,p_display_order=>150
,p_column_identifier=>'DZ'
,p_column_label=>'COMPANY / NON-COMPANY'
,p_column_html_expression=>'<div style="display:block; width:90px">#ISCOMPANY#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467289499114002756)
,p_db_column_name=>'ITEMNATUREONWHICHTDSDEDECTABLE'
,p_display_order=>90
,p_column_identifier=>'DT'
,p_column_label=>'ITEM NATURE ON WHICH TDS DEDUCTABLE'
,p_column_html_expression=>'<div style="display:block; width:90px">#ITEMNATUREONWHICHTDSDEDUCTABLE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467297523960002760)
,p_db_column_name=>'JBPASSNO'
,p_display_order=>310
,p_column_identifier=>'EP'
,p_column_label=>'JB PASS NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#JBPASSNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485486122794889511)
,p_db_column_name=>'JOBBILLNO'
,p_display_order=>390
,p_column_identifier=>'EX'
,p_column_label=>'JOB BILL NO'
,p_column_html_expression=>'<div style="display:block; width:180px">#JOBBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485486186244889512)
,p_db_column_name=>'JOBBILLPARTYBILLNO'
,p_display_order=>400
,p_column_identifier=>'EY'
,p_column_label=>'JOB BILL PARTY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#JOBBILLPARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189892811673436153)
,p_db_column_name=>'LOCATION'
,p_display_order=>440
,p_column_identifier=>'FC'
,p_column_label=>'LOCATION'
,p_column_html_expression=>'<div style="display:block; width:120px">#LOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467298726840002760)
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
 p_id=>wwv_flow_imp.id(467291456276002757)
,p_db_column_name=>'PANNO'
,p_display_order=>140
,p_column_identifier=>'DY'
,p_column_label=>'PAN'
,p_column_html_expression=>'<div style="display:block; width:90px">#PANNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467291098208002756)
,p_db_column_name=>'PARTY'
,p_display_order=>130
,p_column_identifier=>'DX'
,p_column_label=>'PARTY'
,p_column_html_expression=>'<div style="display:block; width:230px">#PARTY#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485486314361889513)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>410
,p_column_identifier=>'EZ'
,p_column_label=>'PARTY BILL NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467298281108002760)
,p_db_column_name=>'PAYMENTADVICENO'
,p_display_order=>330
,p_column_identifier=>'ER'
,p_column_label=>'PAYMENT ADVICE NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#PAYMENTADVICENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485486025143889510)
,p_db_column_name=>'PBPASSNO'
,p_display_order=>380
,p_column_identifier=>'EW'
,p_column_label=>'PB PASS NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#PBPASSNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485486357828889514)
,p_db_column_name=>'PURCHASEBILLNO'
,p_display_order=>420
,p_column_identifier=>'FA'
,p_column_label=>'PURCHASE BILL NO'
,p_column_html_expression=>'<div style="display:block; width:130px">#PURCHASEBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(189650048981099746)
,p_db_column_name=>'SERIALNO'
,p_display_order=>430
,p_column_identifier=>'FB'
,p_column_label=>'SERIAL NO'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467295048494002758)
,p_db_column_name=>'SURCHARGEAMOUNT'
,p_display_order=>230
,p_column_identifier=>'EH'
,p_column_label=>'SURCHARGE AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#SURCHARGEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467294699661002758)
,p_db_column_name=>'SURCHARGEPERCENT'
,p_display_order=>220
,p_column_identifier=>'EG'
,p_column_label=>'SURCHARGE PERCENT'
,p_column_html_expression=>'<div style="display:block; width:80px">#SURCHARGEPERCENT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467290745246002756)
,p_db_column_name=>'TAXSECTIONCODE'
,p_display_order=>120
,p_column_identifier=>'DW'
,p_column_label=>'SECTION '
,p_column_html_expression=>'<div style="display:block; width:90px">#TAXSECTIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467293482005002758)
,p_db_column_name=>'TDSAMOUNT'
,p_display_order=>190
,p_column_identifier=>'ED'
,p_column_label=>'TDS AMOUNT'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDSAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467290283711002756)
,p_db_column_name=>'TDSDEDUCTABLERATE'
,p_display_order=>110
,p_column_identifier=>'DV'
,p_column_label=>'TDS DEDUCTABLE RATE'
,p_column_html_expression=>'<div style="display:block; width:90px">#TDSDEDUCTABLERATE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467292254334002757)
,p_db_column_name=>'TDSNATURENAME'
,p_display_order=>160
,p_column_identifier=>'EA'
,p_column_label=>'NATURE OF ASSESEE'
,p_column_html_expression=>'<div style="display:block; width:160px">#TDSNATURENAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467289906184002756)
,p_db_column_name=>'TDSPAYEECATEGORYCODE'
,p_display_order=>100
,p_column_identifier=>'DU'
,p_column_label=>'TDS PAYEEE CATEGORY CODE'
,p_column_html_expression=>'<div style="display:block; width:90px">#TDSPAYEECATEGORYCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467293108168002757)
,p_db_column_name=>'TDSPERCENT'
,p_display_order=>180
,p_column_identifier=>'EC'
,p_column_label=>'TDS PERCENT'
,p_column_html_expression=>'<div style="display:block; width:80px">#TDSPERCENT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467297054608002759)
,p_db_column_name=>'TRANSACTIONDATE'
,p_display_order=>300
,p_column_identifier=>'EO'
,p_column_label=>'TRANSACTION DATE'
,p_column_html_expression=>'<div style="display:block; width:80px">#TRANSACTIONDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467296265753002759)
,p_db_column_name=>'TRANSACTIONMODULE'
,p_display_order=>280
,p_column_identifier=>'EM'
,p_column_label=>'TRANSACTION MODULE'
,p_column_html_expression=>'<div style="display:block; width:80px">#TRANSACTIONMODULE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467296657912002759)
,p_db_column_name=>'TRANSACTIONNO'
,p_display_order=>290
,p_column_identifier=>'EN'
,p_column_label=>'TRANSACTION NO'
,p_column_html_expression=>'<div style="display:block; width:120px">#TRANSACTIONNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(485485914624889509)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>370
,p_column_identifier=>'EV'
,p_column_label=>'VEHICLE NO'
,p_column_html_expression=>'<div style="display:block; width:90px">#VEHICLENO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(467299485002002760)
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
 p_id=>wwv_flow_imp.id(467299084478002760)
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
 p_id=>wwv_flow_imp.id(539066294472854462)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131498'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>1000
,p_report_columns=>'SERIALNO:LOCATION:VOUCHERNO:VOUCHERDATE:DOCTYPECODE:FREIGHTADVICENO:VEHICLENO:PBPASSNO:PURCHASEBILLNO:PARTYBILLNO:JBPASSNO:JOBBILLNO:JOBBILLPARTYBILLNO:TAXSECTIONCODE:PARTY:PANNO:ISCOMPANY:TDSPAYEECATEGORYCODE:TDSNATURENAME:BASICAMOUNT:TDSPERCENT:TDS'
||'AMOUNT:CESSPERCENT:CESSAMOUNT:SURCHARGEPERCENT:SURCHARGEAMOUNT:CHALLANNO:CHALLANDATE:CHALLANAMOUNT:CHALLANBSRCODE:TRANSACTIONMODULE:TRANSACTIONNO:TRANSACTIONDATE'
,p_sum_columns_on_break=>'TDSAMOUNT:BASICAMOUNT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(589354557710907866)
,p_plug_name=>'TDS PAYBLE'
,p_static_id=>'tds-payble-2'
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
 p_id=>wwv_flow_imp.id(452497112896776828)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(589354557710907866)
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
 p_id=>wwv_flow_imp.id(467314462221002855)
,p_name=>'P405_FROMDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(589354557710907866)
,p_item_default=>'Trunc(Sysdate)-7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
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
 p_id=>wwv_flow_imp.id(467315253474002855)
,p_name=>'P405_LOCATION'
,p_is_required=>true
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(589354557710907866)
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
 p_id=>wwv_flow_imp.id(467315661651002855)
,p_name=>'P405_MODULECODE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(589354557710907866)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT DISTINCT MODULECODE AS MODULENAME,MODULECODE FROM VOUCHERTDSDEDUCTED A, VOUCHER B',
'WHERE A.TNO = B.TNO'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Module--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(467314893776002855)
,p_name=>'P405_TODATE'
,p_is_required=>true
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(589354557710907866)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(189667125523277509)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(189667584503277512)
,p_event_id=>wwv_flow_imp.id(189667125523277509)
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
