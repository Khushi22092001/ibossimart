prompt --application/pages/page_00701
begin
--   Manifest
--     PAGE: 00701
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
 p_id=>701
,p_name=>'Sales Enquiry List'
,p_alias=>'SALES-ENQUIRY-LIST'
,p_step_title=>'Sales Enquiry List'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1112479127035217306)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--stretchInputs'
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
 p_id=>wwv_flow_imp.id(231408634368176212)
,p_plug_name=>'Sales Enquiry List'
,p_static_id=>'sales-enquiry-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select a.Tno,',
'       a.FinancialYearCode,',
'       a.PartySalesEnquiryNo,',
'       a.PartySalesEnquiryDate,',
'       a.SumOfAmount,',
'       a.SumOfFooterAmount,',
'       a.SalesEnquiryAmount,',
'       a.SubjectText,',
'       a.ReferenceText,',
'       a.LetterText,',
'       a.TitleText,',
'       a.Remark,',
'       a.AgentCode,',
'       a.CreationTime,',
'       a.Creator,',
'       a.DeliveryOrderTno,',
'       a.WorkOrderTno,',
'       a.ValidityUptoDate,',
'       a.CurrencyValue,',
'       a.ItemWiseFooter,',
'	   b.LocationName,',
'	   c.CompanyName,',
'	   d.DocTypeName,',
'       de.DepartmentName,',
'	   e.EmployeeName,',
'	   a.SalesEnquiryNo,',
'	   a.SalesEnquiryDate,',
'	   a.DeliveryDate,',
'	   f.QuotationNo,',
'	   p.PartyName,',
'       pa.PartyName as ConsigneeName,',
'       rc.RateContractNo,',
'	   cu.CurrencyUnitName,',
'       i.IndentNo',
' From SalesEnquiry a,Location b,Company c,DocType d,Department de,Employee e,Quotation f,CurrencyUnit cu,Party p, Indent i,RateContract rc,Party pa,',
'      DocumentStatusDetail dsd, SalesEnquiryDetail b1',
'  where a.LocationCode = b.LocationCode(+)',
'    and a.CompanyCode = c.CompanyCode(+)',
'    and a.DocTypeCode = d.DocTypeCode (+)',
'	and a.DepartmentCode = de.DepartmentCode(+)',
'    and a.EmployeeCode = e.EmployeeCode(+)',
'	and a.QuotationTno = f.Tno(+)',
'	and a.CurrencyUnitCode = cu.CurrencyUnitCode (+)',
'	and a.PartyCode = p.PartyCode (+)',
'    and a.IndentTno = i.Tno (+)',
'    and a.RateContractTno = rc.Tno(+)',
'    and a.ConsigneeCode = pa.PartyCode (+)',
'    and a.tno = dsd.Moduletno(+)',
'    and a.tno = b1.tno(+)',
'  ',
'  --- Filter',
'    and a.SalesEnquiryDate between :P701_FROMDATE and :P701_TODATE',
'  and   (:P701_COMPANY is null or instr('':''||:P701_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and   (:P701_LOCATION is null or instr('':''||:P701_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and   (:P701_DOCTYPE is null or instr('':''||:P701_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P701_PARTYNAME IS NULL OR instr('':''||:P701_PARTYNAME||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P701_ITEM IS NULL OR instr('':''||:P701_ITEM||'':'','':''||b1.ItemCode||'':'') > 0 ) ',
'  and ( :P701_ITEMSPECIFICATION IS NULL OR instr('':''||:P701_ITEMSPECIFICATION||'':'','':''||b1.ItemSpecificationCode||'':'') > 0 )',
'-- added on 20-may-2024 Previleage',
' and getlocationprivilege(a.locationcode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
' AND getdoctypeprivilege(a.doctypecode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
' and getcompanyprivilege(A.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
' and case When dsd.DocumentStatusCode = ''ACTIVE'' Then ''ACTIVE''',
'           When dsd.DocumentStatusCode is null Then ''NONACTIVE''',
'           When dsd.DocumentStatusCode = ''PREPARING'' Then ''PREPARING''',
'           When dsd.DocumentStatusCode = ''PREPARED'' Then ''PREPARED''',
'           When dsd.DocumentStatusCode = ''AUTHORISED'' Then ''AUTHORISED''',
'           When dsd.DocumentStatusCode = ''CANCELED'' Then ''CANCELED''',
'           When dsd.DocumentStatusCode = ''ONHOLD'' Then ''ONHOLD''',
'           When dsd.DocumentStatusCode = ''SHORTCLOSED'' Then ''SHORTCLOSED''',
'           When dsd.DocumentStatusCode = ''CLOSED'' Then ''CLOSED''',
'           When dsd.DocumentStatusCode = ''DEPTAPPROVED'' Then ''DEPTAPPROVED''',
'           When dsd.DocumentStatusCode = ''STOREAPPROVED'' Then ''STOREAPPROVED''',
'      End  like nvl(:P701_STATUS,''%'')',
' -- and a.SalesEnquiryNo like nvl(:P701_SalesEnquiryNO,''%'')',
'order by a.SalesEnquiryDate desc , a.SalesEnquiryNo desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P701_COMPANY,P701_TNO,P701_STATUS,P701_FROMDATE,P701_TODATE,P701_LOCATION,P701_PARTYNAME,P701_DOCTYPE,P701_ITEM,P701_SALESENQUIRYNO,P701_GRNSTATUS,P701_ITEMSPECIFICATION,P701_TODOLIST,P701_NEXTPROCESS,P701_BIREPORTURL,P701_TNO_1'
,p_prn_page_header=>'Sales Enquiry List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(231408744187176212)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:702:&SESSION.::&DEBUG.:RP,:P702_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>123127210386793905
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611622314377671)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>250
,p_column_identifier=>'BF'
,p_column_label=>'Agent Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277609419625377649)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>30
,p_column_identifier=>'AJ'
,p_column_label=>'Company Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277612264360377677)
,p_db_column_name=>'CONSIGNEENAME'
,p_display_order=>310
,p_column_identifier=>'BL'
,p_column_label=>'Consignee Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611051822377665)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>190
,p_column_identifier=>'AZ'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611177925377666)
,p_db_column_name=>'CREATOR'
,p_display_order=>200
,p_column_identifier=>'BA'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277609948373377654)
,p_db_column_name=>'CURRENCYUNITNAME'
,p_display_order=>80
,p_column_identifier=>'AO'
,p_column_label=>'Currency Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611772422377672)
,p_db_column_name=>'CURRENCYVALUE'
,p_display_order=>260
,p_column_identifier=>'BG'
,p_column_label=>'Currency Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(231413073203176220)
,p_db_column_name=>'DELIVERYDATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Delivery Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611418287377669)
,p_db_column_name=>'DELIVERYORDERTNO'
,p_display_order=>230
,p_column_identifier=>'BD'
,p_column_label=>'Delivery Order Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611840884377673)
,p_db_column_name=>'DEPARTMENTNAME'
,p_display_order=>270
,p_column_identifier=>'BH'
,p_column_label=>'Department Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277609562705377650)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>40
,p_column_identifier=>'AK'
,p_column_label=>'Doc Type Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277609663769377651)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>50
,p_column_identifier=>'AL'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(231410235891176217)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financial Year '
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611215491377667)
,p_db_column_name=>'INDENTNO'
,p_display_order=>210
,p_column_identifier=>'BB'
,p_column_label=>'Indent No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277612115673377676)
,p_db_column_name=>'ITEMWISEFOOTER'
,p_display_order=>300
,p_column_identifier=>'BK'
,p_column_label=>'Item Wise Footer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610750598377662)
,p_db_column_name=>'LETTERTEXT'
,p_display_order=>160
,p_column_identifier=>'AW'
,p_column_label=>'Letter Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277609381129377648)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>20
,p_column_identifier=>'AI'
,p_column_label=>'Location Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277609884244377653)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>70
,p_column_identifier=>'AN'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610118128377656)
,p_db_column_name=>'PARTYSALESENQUIRYDATE'
,p_display_order=>100
,p_column_identifier=>'AQ'
,p_column_label=>'Party Sales Enquiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277609989962377655)
,p_db_column_name=>'PARTYSALESENQUIRYNO'
,p_display_order=>90
,p_column_identifier=>'AP'
,p_column_label=>'Party Sales Enquiry No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277609725430377652)
,p_db_column_name=>'QUOTATIONNO'
,p_display_order=>60
,p_column_identifier=>'AM'
,p_column_label=>'Quotation No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611316995377668)
,p_db_column_name=>'RATECONTRACTNO'
,p_display_order=>220
,p_column_identifier=>'BC'
,p_column_label=>'Rate Contract No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610653997377661)
,p_db_column_name=>'REFERENCETEXT'
,p_display_order=>150
,p_column_identifier=>'AV'
,p_column_label=>'Reference Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610961939377664)
,p_db_column_name=>'REMARK'
,p_display_order=>180
,p_column_identifier=>'AY'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610419813377659)
,p_db_column_name=>'SALESENQUIRYAMOUNT'
,p_display_order=>130
,p_column_identifier=>'AT'
,p_column_label=>'Sales Enquiry Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(231412597750176220)
,p_db_column_name=>'SALESENQUIRYDATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Sales Enquiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(231412229290176218)
,p_db_column_name=>'SALESENQUIRYNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Sales Enquiry No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610537822377660)
,p_db_column_name=>'SUBJECTTEXT'
,p_display_order=>140
,p_column_identifier=>'AU'
,p_column_label=>'Subject Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610270022377657)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>110
,p_column_identifier=>'AR'
,p_column_label=>'Sum Of Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610357863377658)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>120
,p_column_identifier=>'AS'
,p_column_label=>'Sum Of Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277610816044377663)
,p_db_column_name=>'TITLETEXT'
,p_display_order=>170
,p_column_identifier=>'AX'
,p_column_label=>'Title Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(231409459646176217)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277612005167377675)
,p_db_column_name=>'VALIDITYUPTODATE'
,p_display_order=>290
,p_column_identifier=>'BJ'
,p_column_label=>'Validity Upto Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(277611542296377670)
,p_db_column_name=>'WORKORDERTNO'
,p_display_order=>240
,p_column_identifier=>'BE'
,p_column_label=>'Work Order Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(231636267221607440)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'39129'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COMPANYNAME:FINANCIALYEARCODE:LOCATIONNAME:DOCTYPENAME:DEPARTMENTNAME:EMPLOYEENAME:SALESENQUIRYNO:SALESENQUIRYDATE:DELIVERYDATE:CURRENCYUNITNAME:CURRENCYVALUE:WORKORDERTNO:PARTYNAME:AGENTCODE:QUOTATIONNO:RATECONTRACTNO:DELIVERYORDERTNO:INDENTNO:SUMOF'
||'AMOUNT:SUMOFFOOTERAMOUNT:SALESENQUIRYAMOUNT:SUBJECTTEXT:REFERENCETEXT:LETTERTEXT:TITLETEXT:REMARK:ITEMWISEFOOTER:CONSIGNEENAME:PARTYSALESENQUIRYDATE:PARTYSALESENQUIRYNO:VALIDITYUPTODATE:CREATIONTIME:CREATOR'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168042379272243533)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(231408634368176212)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:702:&SESSION.::&DEBUG.:702::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168042003138243533)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(231408634368176212)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168041542818243533)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(231408634368176212)
,p_button_name=>'PDF'
,p_static_id=>'pdf'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Pdf'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_warn_on_unsaved_changes=>null
,p_button_condition_type=>'NEVER'
,p_icon_css_classes=>'fa-file-pdf-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(168043150217243535)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(1112479127035217306)
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
 p_id=>wwv_flow_imp.id(614430226325131190)
,p_name=>'P701_BIREPORTURL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102841107939636113)
,p_name=>'P701_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_item_default=>'GLOBAL_COMPANYCODE'
,p_item_default_type=>'ITEM'
,p_prompt=>'Company'
,p_placeholder=>'Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''PURCHASEORDER''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'   and getcompanyprivilege(C.COMPANYCODE,GETMODULECODEFORPAGENO(:APP_PAGE_ID),:GLOBAL_LOGINNAME)=''YES''',
'  ;'))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102841229234636114)
,p_name=>'P701_DOCTYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_prompt=>'Doc Type'
,p_placeholder=>'Enter Doc Type Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      dt.DocTypeName d,',
'      dt.DocTypeCode r',
'From  ModulePrivilege a, ModulePrivilegeDocType b, DocType dt, BossUser bu, ModuleDocType md, ModuleDocTypeDetail mdd',
'Where a.TNo = b.TNo(+)',
'  and (b.DocTypeCode = dt.DocTypeCode or b.DocTypeCode is null)',
'  and a.ModuleCode = md.ModuleCode',
'  and md.TNo = mdd.TNo',
'  and mdd.DocTypeCode = dt.DocTypeCode',
'  and a.ModuleCode = ''PURCHASEORDER''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and instr('':''||:P701_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order by 1',
';',
''))
,p_lov_cascade_parent_items=>'P701_COMPANY'
,p_ajax_items_to_submit=>'P701_DOCTYPE'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102935320190012952)
,p_name=>'P701_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_item_default=>'Trunc(Sysdate)-3'
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
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(1102937709075012953)
,p_name=>'P701_GRNSTATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102937313282012953)
,p_name=>'P701_ITEM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_prompt=>'Material'
,p_placeholder=>'Material'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||''( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From PurchaseOrderDetail a,Item e',
'Where a.ItemCode = e.ItemCode',
'Order by 1'))
,p_cSize=>74
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102938159337012953)
,p_name=>'P701_ITEMSPECIFICATION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P701_ITEM',
'  and e.TNo = ee.TNO'))
,p_lov_cascade_parent_items=>'P701_ITEM'
,p_ajax_items_to_submit=>'P701_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>74
,p_colspan=>8
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102936993155012953)
,p_name=>'P701_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
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
'  and a.ModuleCode = ''PURCHASEORDER''',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'  and instr('':''||:P701_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P701_COMPANY'
,p_ajax_items_to_submit=>'P701_LOCATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1123093846758391530)
,p_name=>'P701_NEXTPROCESS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102936589699012953)
,p_name=>'P701_PARTYNAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_prompt=>'Vendor'
,p_placeholder=>'Vendor Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       Distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From PurchaseOrder a, Party p',
'Where a.PartyCode = p.PartyCode',
'Order by 1'))
,p_cSize=>74
,p_colspan=>8
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC:DRC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102938518844012953)
,p_name=>'P701_SALESENQUIRYNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_prompt=>'PoNo'
,p_placeholder=>'Enter Rate Contract No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select PurchaseOrderNo From PurchaseOrder ',
'Where instr('':''||:P701_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and PurchaseOrderDate Between :P701_FROMDATE and :P701_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P701_LOCATION'
,p_ajax_items_to_submit=>'P701_SALESENQUIRYNO'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'infinite_scroll', 'N',
  'match_type', 'CONTAINS_IGNORE',
  'use_cache', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102936190062012952)
,p_name=>'P701_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_prompt=>'Status'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Active;ACTIVE,Non-Active;NONACTIVE,Canceled;CANCELED,Closed;CLOSED,Preparing;PREPARING,Prepared;PREPARED,Authorised;AUTHORISED,On Hold;ONHOLD,Short Closed;SHORTCLOSED,Dept Approved;DEPTAPPROVED,Store Approval;STOREAPPROVED'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Select Status--'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(231611529422185589)
,p_name=>'P701_TNO'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(614663907247712148)
,p_name=>'P701_TNO_1'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1102935737383012952)
,p_name=>'P701_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(1123093534145389866)
,p_name=>'P701_TODOLIST'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1112479127035217306)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(168048677916243538)
,p_name=>'Pagination'
,p_static_id=>'pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(168049137596243538)
,p_event_id=>wwv_flow_imp.id(168048677916243538)
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
