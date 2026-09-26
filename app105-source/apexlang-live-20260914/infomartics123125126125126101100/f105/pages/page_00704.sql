prompt --application/pages/page_00704
begin
--   Manifest
--     PAGE: 00704
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
 p_id=>704
,p_name=>'Sales Quotation List'
,p_alias=>'SALES-QUOTATION-LIST'
,p_step_title=>'Sales Quotation List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1170457860528560354)
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
 p_id=>wwv_flow_imp.id(20368522549616591)
,p_plug_name=>'reason'
,p_static_id=>'reason'
,p_region_name=>'reason'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_plug_template=>2672673746673652531
,p_plug_display_sequence=>40
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(224479840527034381)
,p_plug_name=>'Sales Quotation List'
,p_static_id=>'sales-quotation-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(567222375031260372)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       getcompanyname(a.COMPANYCODE) companyname,',
'       a.FINANCIALYEARCODE,',
'       getlocationname(a.LOCATIONCODE) locationname,',
'       getdoctypename(a.DOCTYPECODE) doctypename,',
'       a.PARTYQUOTATIONNO,',
'       a.PARTYQUOTATIONDATE,',
'       getpartyname(a.PARTYCODE) partyname,',
'       getemployeename(a.EMPLOYEECODE) employeename,',
'       a.VALIDITYDATE,',
'       getcurrencyunitname(a.CURRENCYUNITCODE) CURRENCYUNIT ,',
'       a.CURRENCYVALUE,',
'       a.SUMOFAMOUNT,',
'       a.SUMOFFOOTER,',
'       a.SUBJECTTEXT,',
'       a.REFERENCETEXT,',
'       a.LETTERTEXT,',
'       a.TITLETEXT,',
'       a.ITEMWISEFOOTER,',
'       a.REMARK,',
'       a.SUMOFFOOTERAMOUNT,',
'       a.SALESQUOTATIONNO,',
'       a.SALESQUOTATIONDATE,',
'       a.SALESQUOTATIONAMOUNT,',
'       a.SALESENQUIRYTNO,',
'       a.AGENTCODE,',
'       a.CONSIGNEECODE,',
'       a.VALIDITYUPTODATE,',
'       a.CREATIONTIME,',
'       a.CREATOR,',
'        case when dsd.DocumentStatusCode = ''LOOSE'' then',
'        ''LOOSE''',
'        when dsd.DocumentStatusCode = ''ACTIVE'' and nvl(por.porno,0) > 0 then',
'        ''WIN''',
'        when nvl(por.porno,0) = 0 then',
'        -- ''<B>''||''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':''||164||'':''||:APP_SESSION||'':::::YES:NO'')||''">''||''PENDING''||''</a>''||''</b>''',
'        ''<a class="t-Button t-Button--simple t-Button--hot t-Button--stretch" href="'' ||',
'        APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':164:''||:APP_SESSION||''::::P164_TNO:''||A.TNO) || ''">'' ||',
'        ''PENDING'' || ''</a>''',
'',
'',
'        --      ''<a href="''||APEX_UTIL.PREPARE_URL(''f?p=''||:APP_ID||'':11:''||:APP_SESSION||''::''||''P11_fromdate:''|| c.fromdate||'':''||''P11_PARTY:''||a.partycode,NULL,''SESSION'' )||''">''||A.PARTYNAME||''</a>''',
'',
'',
'',
'        end winloss,',
'          a.reasonofloss',
'  from SALESQUOTATION a, salesquotationdetail b, DocumentStatusDetail dsd,',
'    ( ',
'    select salesquotationtno,count(*) porno',
'    from poreceipt',
'    group by salesquotationtno',
'  ) por',
'  where a.tno = b.tno(+)',
'    and a.tno = dsd.ModuleTno(+)',
'    and a.tno = por.salesquotationtno(+)',
'   --- Filter',
'    and TRUNC(a.SalesQuotationDate) between :P704_FROMDATE and :P704_TODATE',
'  and   (:P704_COMPANY is null or instr('':''||:P704_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0)',
'  and   (:P704_LOCATION is null or instr('':''||:P704_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'  and   (:P704_DOCTYPE is null or instr('':''||:P704_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P704_PARTYNAME IS NULL OR instr('':''||:P704_PARTYNAME||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P704_ITEM IS NULL OR instr('':''||:P704_ITEM||'':'','':''||b.ItemCode||'':'') > 0 ) ',
'  and ( :P704_ITEMSPECIFICATION IS NULL OR instr('':''||:P704_ITEMSPECIFICATION||'':'','':''||b.ItemSpecificationCode||'':'') > 0 )',
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
'           When dsd.DocumentStatusCode = ''LOOSE'' Then ''LOOSE''',
'           When dsd.DocumentStatusCode = ''WIN'' Then ''WIN''',
'      End  like nvl(:P704_STATUS,''%'')',
'  and a.SalesQuotationNo like nvl(:P704_SalesQuotationNO,''%'')',
'order by a.SalesQuotationDate desc , a.SalesQuotationNo desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P704_STATUS,P704_FROMDATE,P704_TODATE,P704_DOCTYPE,P704_PARTYNAME,P704_COMPANY,P704_LOCATION,P704_GRNSTATUS,P704_ITEMSPECIFICATION'
,p_prn_page_header=>'Sales Quotation List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(224479960199034381)
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:705:&SESSION.::&DEBUG.:RP,:P705_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>123739916207354824
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224490656812034392)
,p_db_column_name=>'AGENTCODE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Agent'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237887873503551909)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>40
,p_column_identifier=>'AE'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224491045264034392)
,p_db_column_name=>'CONSIGNEECODE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Consignee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224491921207034392)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224492274112034392)
,p_db_column_name=>'CREATOR'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237888344303551914)
,p_db_column_name=>'CURRENCYUNIT'
,p_display_order=>120
,p_column_identifier=>'AJ'
,p_column_label=>'Currency Unit'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224485041605034388)
,p_db_column_name=>'CURRENCYVALUE'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Currency Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237888119768551911)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>90
,p_column_identifier=>'AG'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237888271499551913)
,p_db_column_name=>'EMPLOYEENAME'
,p_display_order=>110
,p_column_identifier=>'AI'
,p_column_label=>'Employee'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224481436319034385)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financial Year'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224487860870034390)
,p_db_column_name=>'ITEMWISEFOOTER'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Item Wise Footer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224487060108034388)
,p_db_column_name=>'LETTERTEXT'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Letter Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237888028485551910)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>50
,p_column_identifier=>'AF'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237888195057551912)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>100
,p_column_identifier=>'AH'
,p_column_label=>'Party'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224483058141034387)
,p_db_column_name=>'PARTYQUOTATIONDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Party Quotation Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224482660144034387)
,p_db_column_name=>'PARTYQUOTATIONNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Party Quotation No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20368814337616593)
,p_db_column_name=>'REASONOFLOSS'
,p_display_order=>140
,p_column_identifier=>'AL'
,p_column_label=>'Reason Of Loss'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224486660498034388)
,p_db_column_name=>'REFERENCETEXT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Reference Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224488249499034390)
,p_db_column_name=>'REMARK'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224490247914034392)
,p_db_column_name=>'SALESENQUIRYTNO'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Sales Enquiry No'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224489907404034390)
,p_db_column_name=>'SALESQUOTATIONAMOUNT'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Sales Quotation Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224489440874034390)
,p_db_column_name=>'SALESQUOTATIONDATE'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Sales Quotation Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224489081118034390)
,p_db_column_name=>'SALESQUOTATIONNO'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Sales Quotation No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224486271228034388)
,p_db_column_name=>'SUBJECTTEXT'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Subject Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224485444523034388)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Sum Of Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224485925011034388)
,p_db_column_name=>'SUMOFFOOTER'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Sum Of Footer'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224488735715034390)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Sum Of Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9,99,99,99,999.99'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224487440351034390)
,p_db_column_name=>'TITLETEXT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Title Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224480653836034384)
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
 p_id=>wwv_flow_imp.id(224484335400034387)
,p_db_column_name=>'VALIDITYDATE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Validity Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(224491531210034392)
,p_db_column_name=>'VALIDITYUPTODATE'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Validity Upto Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20368274254616588)
,p_db_column_name=>'WINLOSS'
,p_display_order=>130
,p_column_identifier=>'AK'
,p_column_label=>'Winloss'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(233977879621830201)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'135426'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'WINLOSS:COMPANYNAME:SALESQUOTATIONNO:SALESQUOTATIONDATE:CURRENCYUNIT:DOCTYPENAME:EMPLOYEENAME:LOCATIONNAME:PARTYNAME:FINANCIALYEARCODE:PARTYQUOTATIONNO:PARTYQUOTATIONDATE:VALIDITYDATE:CURRENCYVALUE:SUMOFAMOUNT:SUMOFFOOTER:SUBJECTTEXT:ITEMWISEFOOTER:R'
||'EMARK:SUMOFFOOTERAMOUNT:SALESQUOTATIONAMOUNT:SALESENQUIRYTNO:AGENTCODE:CONSIGNEECODE:VALIDITYUPTODATE:CREATIONTIME:CREATOR:REASONOFLOSS'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(37334591728968466)
,p_report_id=>wwv_flow_imp.id(233977879621830201)
,p_static_id=>'ir-condition'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'WINLOSS'
,p_operator=>'='
,p_expr=>'LOOSE'
,p_condition_sql=>' (case when ("WINLOSS" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''LOOSE''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#fa3c3c'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(37334959532968466)
,p_report_id=>wwv_flow_imp.id(233977879621830201)
,p_static_id=>'ir-condition-2'
,p_condition_type=>'HIGHLIGHT'
,p_allow_delete=>'Y'
,p_column_name=>'WINLOSS'
,p_operator=>'='
,p_expr=>'WIN'
,p_condition_sql=>' (case when ("WINLOSS" = #APXWS_EXPR#) then #APXWS_HL_ID# end) '
,p_condition_display=>'#APXWS_COL_NAME# = ''WIN''  '
,p_enabled=>'Y'
,p_highlight_sequence=>10
,p_row_bg_color=>'#92f965'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20370590229616611)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(20368522549616591)
,p_button_name=>'Back'
,p_static_id=>'back'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Back'
,p_button_position=>'CLOSE'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(160752888231566442)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(224479840527034381)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:705:&SESSION.::&DEBUG.:705::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(160752482579566442)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(224479840527034381)
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
 p_id=>wwv_flow_imp.id(166260628039725355)
,p_button_sequence=>160
,p_button_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
 p_id=>wwv_flow_imp.id(672409675343474240)
,p_name=>'P704_BIREPORTURL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160820556957979163)
,p_name=>'P704_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
 p_id=>wwv_flow_imp.id(20370905449616614)
,p_name=>'P704_DOCSTSTUS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160820678252979164)
,p_name=>'P704_DOCTYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
'  and instr('':''||:P704_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order by 1',
';',
''))
,p_lov_cascade_parent_items=>'P704_COMPANY'
,p_ajax_items_to_submit=>'P704_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(1160914769208356002)
,p_name=>'P704_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
 p_id=>wwv_flow_imp.id(1160917158093356003)
,p_name=>'P704_GRNSTATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160916762300356003)
,p_name=>'P704_ITEM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
 p_id=>wwv_flow_imp.id(1160917608355356003)
,p_name=>'P704_ITEMSPECIFICATION'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P704_ITEM',
'  and e.TNo = ee.TNO'))
,p_lov_cascade_parent_items=>'P704_ITEM'
,p_ajax_items_to_submit=>'P704_ITEMSPECIFICATION'
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
 p_id=>wwv_flow_imp.id(1160916442173356003)
,p_name=>'P704_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
'  and instr('':''||:P704_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P704_COMPANY'
,p_ajax_items_to_submit=>'P704_LOCATION'
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
 p_id=>wwv_flow_imp.id(1181073295776734580)
,p_name=>'P704_NEXTPROCESS'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160916038717356003)
,p_name=>'P704_PARTYNAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
 p_id=>wwv_flow_imp.id(20368637285616592)
,p_name=>'P704_REASONOFLOOSE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20368522549616591)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Reason of Loss'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cHeight=>5
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'Y',
  'character_counter', 'Y',
  'resizable', 'Y',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160917967862356003)
,p_name=>'P704_SALESQUOTATIONNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_prompt=>'Sales Quotation No'
,p_placeholder=>'Enter Sales Quotation No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select PurchaseOrderNo From PurchaseOrder ',
'Where instr('':''||:P704_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and PurchaseOrderDate Between :P704_FROMDATE and :P704_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P704_LOCATION'
,p_ajax_items_to_submit=>'P704_SALESQUOTATIONNO'
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
 p_id=>wwv_flow_imp.id(1160915639080356002)
,p_name=>'P704_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
 p_id=>wwv_flow_imp.id(233389058130715311)
,p_name=>'P704_TNO'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(672643356266055198)
,p_name=>'P704_TNO_1'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1160915186401356002)
,p_name=>'P704_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
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
 p_id=>wwv_flow_imp.id(1181072983163732916)
,p_name=>'P704_TODOLIST'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1170457860528560354)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20370693022616612)
,p_name=>'Hide'
,p_static_id=>'hide'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(20370590229616611)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37064565501490867)
,p_event_id=>wwv_flow_imp.id(20370693022616612)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-close-region'
,p_action=>'NATIVE_CLOSE_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(20368522549616591)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20370974977616615)
,p_event_id=>wwv_flow_imp.id(20370693022616612)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(224479840527034381)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20370747257616613)
,p_event_id=>wwv_flow_imp.id(20370693022616612)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_name=>'SET DOCUMENT STATUS'
,p_static_id=>'set-document-status'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'items_to_submit', 'P704_TNO,P704_DOCSTSTUS,P704_REASONOFLOOSE',
  'language', 'PLSQL',
  'plsql_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'BEGIN',
    'UPDATE SALESQUOTATION A SET A.REASONOFLOSS = :P704_REASONOFLOOSE',
    'WHERE TNO = :P704_TNO;',
    'commit;',
    'SetDocumentStatusCode(''SALESQUOTATION'',:P704_TNO,:P704_DOCSTSTUS);',
    '',
    '',
    'END;')),
  'show_processing', 'N')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37065107197490872)
,p_name=>'refresh report'
,p_static_id=>'refresh-report'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(224479840527034381)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37065186804490873)
,p_event_id=>wwv_flow_imp.id(37065107197490872)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(20368522549616591)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(37064702121490868)
,p_name=>'set value and open reason'
,p_static_id=>'set-value-and-open-reason'
,p_event_sequence=>20
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(224479840527034381)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37065014784490871)
,p_event_id=>wwv_flow_imp.id(37064702121490868)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', 'javascript:openModal(''reason'')')).to_clob
,p_client_condition_type=>'EQUALS'
,p_client_condition_element=>'P704_DOCSTSTUS'
,p_client_condition_expression=>'LOOSE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37064789613490869)
,p_event_id=>wwv_flow_imp.id(37064702121490868)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P704_DOCSTSTUS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_DOCUMENTSTATUSCODE',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(37064913351490870)
,p_event_id=>wwv_flow_imp.id(37064702121490868)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value-2'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P704_TNO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'return_item', 'P164_TNO',
  'suppress_change_event', 'N',
  'type', 'DIALOG_RETURN_ITEM')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
