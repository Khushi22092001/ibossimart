prompt --application/pages/page_00280
begin
--   Manifest
--     PAGE: 00280
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
 p_id=>280
,p_name=>'E Way Bill'
,p_alias=>'E-WAY-BILL'
,p_step_title=>'E Way Bill'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(205245398657002347)
,p_plug_name=>'E Way Bill'
,p_static_id=>'e-way-bill'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select TNO,',
'       COMPANYCODE,',
'       LOCATIONCODE,',
'       MODULETNO,',
'       MODULECODE,',
'       INVOICENO,',
'       INVOICEDATE,',
'       INVOICEAMOUNT,',
'       PARTYCODE,',
'       CONSIGNEECODE,',
'       TRANSPORTERCODE,',
'       SUPPLYTYPE,',
'       SUBSUPPLYTYPE,',
'       DOCTYPE,',
'       DOCNO,',
'       DOCDATE,',
'       TRANSTYPE,',
'       FROMGSTIN,',
'       FROMTRDNAME,',
'       FROMADDR1,',
'       FROMADDR2,',
'       FROMPLACE,',
'       FROMPINCODE,',
'       FROMSTATECODE,',
'       ACTUALFROMSTATECODE,',
'       TOTRDNAME,',
'       TOGSTIN,',
'       TOADDR1,',
'       TOADDR2,',
'       TOPLACE,',
'       TOPINCODE,',
'       TOSTATECODE,',
'       ACTUALTOSTATECODE,',
'       TOTALVALUE,',
'       IGSTVALUE,',
'       CGSTVALUE,',
'       SGSTVALUE,',
'       CESSVALUE,',
'       TOTNONADVOLVAL,',
'       OTHVALUE,',
'       TRANSMODE,',
'       TRANSDISTANCE,',
'       TRANSPORTERNAME,',
'       TRANSPORTERID,',
'       TRANSDOCNO,',
'       TRANSDOCDATE,',
'       VEHICLENO,',
'       VEHICLETYPE,',
'       TOTINVVALUE,',
'       MAINHSNCODE,',
'       EWBNO,',
'       EWBDATE,',
'       VALIDTILLDATE',
'  from INVOICEFOREWAYBILL',
'  where INVOICEDATE between :P280_FROMDATE and :P280_TODATE',
'and ( :P280_LOCATION IS NULL OR instr('':''||:P280_LOCATION||'':'','':''||LOCATIONCODE||'':'') > 0 )',
'and ( :P280_MODULE IS NULL OR instr('':''||:P280_MODULE||'':'','':''||MODULECODE||'':'') > 0 )',
'and ( :P280_INVOICE IS NULL OR instr('':''||:P280_INVOICE||'':'','':''||TNO||'':'') > 0 )'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'E Way Bill'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(205245424696002347)
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
,p_internal_uid=>13263508431298426
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205255620283002401)
,p_db_column_name=>'ACTUALFROMSTATECODE'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Actualfromstatecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205258889186002403)
,p_db_column_name=>'ACTUALTOSTATECODE'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Actualtostatecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205260851593002403)
,p_db_column_name=>'CESSVALUE'
,p_display_order=>38
,p_column_identifier=>'AL'
,p_column_label=>'Cessvalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205260108755002403)
,p_db_column_name=>'CGSTVALUE'
,p_display_order=>36
,p_column_identifier=>'AJ'
,p_column_label=>'Cgstvalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205246495197002397)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Companycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205249659191002398)
,p_db_column_name=>'CONSIGNEECODE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Consigneecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205252078656002399)
,p_db_column_name=>'DOCDATE'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Docdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205251669202002399)
,p_db_column_name=>'DOCNO'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Docno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205251225105002399)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Doctype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205266417424002406)
,p_db_column_name=>'EWBDATE'
,p_display_order=>52
,p_column_identifier=>'AZ'
,p_column_label=>'Ewbdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205266062094002406)
,p_db_column_name=>'EWBNO'
,p_display_order=>51
,p_column_identifier=>'AY'
,p_column_label=>'Ewbno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205253644561002400)
,p_db_column_name=>'FROMADDR1'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Fromaddr1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205254107210002400)
,p_db_column_name=>'FROMADDR2'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Fromaddr2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205252873073002400)
,p_db_column_name=>'FROMGSTIN'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Fromgstin'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205254859319002401)
,p_db_column_name=>'FROMPINCODE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Frompincode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205254467085002400)
,p_db_column_name=>'FROMPLACE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Fromplace'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205255274316002401)
,p_db_column_name=>'FROMSTATECODE'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Fromstatecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205253303790002400)
,p_db_column_name=>'FROMTRDNAME'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Fromtrdname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205259686463002403)
,p_db_column_name=>'IGSTVALUE'
,p_display_order=>35
,p_column_identifier=>'AI'
,p_column_label=>'Igstvalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205248908226002398)
,p_db_column_name=>'INVOICEAMOUNT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Invoiceamount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205248508247002398)
,p_db_column_name=>'INVOICEDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Invoicedate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205248038629002398)
,p_db_column_name=>'INVOICENO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Invoiceno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205246912748002397)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205265679589002406)
,p_db_column_name=>'MAINHSNCODE'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'Mainhsncode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205247640278002397)
,p_db_column_name=>'MODULECODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Modulecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205247229058002397)
,p_db_column_name=>'MODULETNO'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Moduletno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205261699914002404)
,p_db_column_name=>'OTHVALUE'
,p_display_order=>40
,p_column_identifier=>'AN'
,p_column_label=>'Othvalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205249287741002398)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Partycode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205260456051002403)
,p_db_column_name=>'SGSTVALUE'
,p_display_order=>37
,p_column_identifier=>'AK'
,p_column_label=>'Sgstvalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205250857315002399)
,p_db_column_name=>'SUBSUPPLYTYPE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Subsupplytype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205250515241002399)
,p_db_column_name=>'SUPPLYTYPE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Supplytype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205246063579002396)
,p_db_column_name=>'TNO'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205256898606002402)
,p_db_column_name=>'TOADDR1'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Toaddr1'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205257266521002402)
,p_db_column_name=>'TOADDR2'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Toaddr2'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205256467815002401)
,p_db_column_name=>'TOGSTIN'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Togstin'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205258115859002402)
,p_db_column_name=>'TOPINCODE'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Topincode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205257665184002402)
,p_db_column_name=>'TOPLACE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Toplace'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205258480888002402)
,p_db_column_name=>'TOSTATECODE'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Tostatecode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205259294270002403)
,p_db_column_name=>'TOTALVALUE'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Totalvalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205265275957002406)
,p_db_column_name=>'TOTINVVALUE'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'Totinvvalue'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205261265057002404)
,p_db_column_name=>'TOTNONADVOLVAL'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Totnonadvolval'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205256068318002401)
,p_db_column_name=>'TOTRDNAME'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Totrdname'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205262484991002404)
,p_db_column_name=>'TRANSDISTANCE'
,p_display_order=>42
,p_column_identifier=>'AP'
,p_column_label=>'Transdistance'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205264046571002405)
,p_db_column_name=>'TRANSDOCDATE'
,p_display_order=>46
,p_column_identifier=>'AT'
,p_column_label=>'Transdocdate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205263650287002405)
,p_db_column_name=>'TRANSDOCNO'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Transdocno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205262088222002404)
,p_db_column_name=>'TRANSMODE'
,p_display_order=>41
,p_column_identifier=>'AO'
,p_column_label=>'Transmode'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205250092459002398)
,p_db_column_name=>'TRANSPORTERCODE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Transportercode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205263311977002405)
,p_db_column_name=>'TRANSPORTERID'
,p_display_order=>44
,p_column_identifier=>'AR'
,p_column_label=>'Transporterid'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205262875542002404)
,p_db_column_name=>'TRANSPORTERNAME'
,p_display_order=>43
,p_column_identifier=>'AQ'
,p_column_label=>'Transportername'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205252458139002399)
,p_db_column_name=>'TRANSTYPE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Transtype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205266863580002406)
,p_db_column_name=>'VALIDTILLDATE'
,p_display_order=>53
,p_column_identifier=>'BA'
,p_column_label=>'Validtilldate'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205264498170002405)
,p_db_column_name=>'VEHICLENO'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'Vehicleno'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205264848763002405)
,p_db_column_name=>'VEHICLETYPE'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'Vehicletype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(205267470216003057)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'132856'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'TNO:COMPANYCODE:LOCATIONCODE:MODULETNO:MODULECODE:INVOICENO:INVOICEDATE:INVOICEAMOUNT:PARTYCODE:CONSIGNEECODE:TRANSPORTERCODE:SUPPLYTYPE:SUBSUPPLYTYPE:DOCTYPE:DOCNO:DOCDATE:TRANSTYPE:FROMGSTIN:FROMTRDNAME:FROMADDR1:FROMADDR2:FROMPLACE:FROMPINCODE:FRO'
||'MSTATECODE:ACTUALFROMSTATECODE:TOTRDNAME:TOGSTIN:TOADDR1:TOADDR2:TOPLACE:TOPINCODE:TOSTATECODE:ACTUALTOSTATECODE:TOTALVALUE:IGSTVALUE:CGSTVALUE:SGSTVALUE:CESSVALUE:TOTNONADVOLVAL:OTHVALUE:TRANSMODE:TRANSDISTANCE:TRANSPORTERNAME:TRANSPORTERID:TRANSDOC'
||'NO:TRANSDOCDATE:VEHICLENO:VEHICLETYPE:TOTINVVALUE:MAINHSNCODE:EWBNO:EWBDATE:VALIDTILLDATE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(204548453371193839)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204549107122193845)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(204548453371193839)
,p_button_name=>'Refresh'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(204549118990193846)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(204548453371193839)
,p_button_name=>'UploadEWBNo'
,p_static_id=>'uploadewbno'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Upload EWB No'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-upload'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(204548837331193843)
,p_name=>'P280_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(204548453371193839)
,p_item_default=>'sysdate-7'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_colspan=>3
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
 p_id=>wwv_flow_imp.id(204548642883193841)
,p_name=>'P280_INVOICE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(204548453371193839)
,p_prompt=>'Invoice'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'a.InvoiceNo,',
'a.tno ',
'from InvoiceForEWayBill a, Party b',
'where a.PartyCode = b.PartyCode',
'and a.InvoiceDate between :P280_FROMDATE and :P280_TODATE',
'and a.InvoiceNo like nvl(:P280_INVOICE, ''%'')',
'and a.LocationCode like nvl(:P280_LOCATION, ''%'')',
'and a.ModuleCode = :P280_MODULE',
'order by 1'))
,p_lov_cascade_parent_items=>'P280_FROMDATE,P280_TODATE,P280_MODULE,P280_LOCATION'
,p_ajax_items_to_submit=>'P280_MODULE,P280_LOCATION,P280_FROMDATE,P280_TODATE,P280_INVOICE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(204548937893193844)
,p_name=>'P280_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(204548453371193839)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	a.LocationName as d,',
'	a.LocationCode as r',
'from Location a, ModuleLocationDetail b , ModuleLocation c, Module d ',
'where a.LocationCode = b.LocationCode',
'	and b.tno = c.tno',
'	and c.ModuleCode = d.ModuleCode --''DELIVERYCHALLANRETURN''',
'	and c.CompanyCode = :global_CompanyCode',
'    and d.EntryPageNo = :APP_PAGE_ID'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
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
 p_id=>wwv_flow_imp.id(204548604116193840)
,p_name=>'P280_MODULE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(204548453371193839)
,p_prompt=>'Module'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.ModuleName,',
'a.ModuleCode',
'from Module a',
'where a.ModuleCode in (''CCINVOICE'')',
'order by 1'))
,p_cSize=>30
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
 p_id=>wwv_flow_imp.id(204548815560193842)
,p_name=>'P280_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(204548453371193839)
,p_item_default=>'sysdate'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(204548184022193836)
,p_name=>'pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204548315293193837)
,p_event_id=>wwv_flow_imp.id(204548184022193836)
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
 p_id=>wwv_flow_imp.id(204549265682193847)
,p_name=>'upload'
,p_static_id=>'upload'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(204549118990193846)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204549346422193848)
,p_event_id=>wwv_flow_imp.id(204549265682193847)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-execute-plsql-code'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'for i in (',
    '    select ',
    '       MODULETNO,',
    '       MODULECODE,',
    '       SUPPLYTYPE,       ',
    '       DOCNO,',
    '       DOCDATE,      ',
    '       FROMGSTIN,    ',
    '       EWBNO,',
    '       EWBDATE,',
    '       VALIDTILLDATE',
    '  from INVOICEFOREWAYBILL',
    '  where INVOICEDATE between :P280_FROMDATE and :P280_TODATE',
    'and ( :P280_LOCATION IS NULL OR instr('':''||:P280_LOCATION||'':'','':''||LOCATIONCODE||'':'') > 0 )',
    'and ( :P280_MODULE IS NULL OR instr('':''||:P280_MODULE||'':'','':''||MODULECODE||'':'') > 0 )',
    'and ( :P280_INVOICE IS NULL OR instr('':''||:P280_INVOICE||'':'','':''||TNO||'':'') > 0 )',
    ')',
    '',
    'loop',
    '    UpdateEWBNo(i.ModuleCode, i.ModuleTNo, i.SupplyType, i.DocNo, i.DocDate, i.FROMGSTIN, i.EWBNo, i.EWBDate, i.ValidTillDate);',
    'end loop;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(204549484334193849)
,p_event_id=>wwv_flow_imp.id(204549265682193847)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'alert(''Uploaded!'');')).to_clob
);
wwv_flow_imp.component_end;
end;
/
