prompt --application/pages/page_00713
begin
--   Manifest
--     PAGE: 00713
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
 p_id=>713
,p_name=>'Rate Contract List'
,p_alias=>'RATE-CONTRACT-LIST'
,p_step_title=>'Rate Contract List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1061392829589730161)
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
 p_id=>wwv_flow_imp.id(238367991065946931)
,p_plug_name=>'Rate Contrat List'
,p_static_id=>'rate-contrat-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select a.TNO,',
'       a.COMPANYCODE,',
'       a.FINANCIALYEARCODE,',
'       a.LOCATIONCODE,',
'       getlocationname(a.locationcode) as Location,',
'       a.DOCTYPECODE,',
'       getdoctypename(a.DocTypeCode) as DocType,',
'       a.DEPARTMENTCODE,',
'       getdepartmentname(a.DepartmentCode) as Department,',
'       a.EMPLOYEECODE,',
'     --  d.EmployeeName,',
'       a.RATECONTRACTNO,',
'       a.RATECONTRACTDATE,',
'       a.CURRENCYUNITCODE,',
'       a.CURRENCYVALUE,',
'       a.WORKORDERTNO,',
'       a.PARTYCODE,',
'       getpartyname(a.partycode) as partyname,',
'      -- c.partyname,',
'       a.SUMOFAMOUNT,',
'       a.RATECONTRACTAMOUNT,',
'       a.SUBJECTTEXT,',
'       a.REFERENCETEXT,',
'       a.LETTERTEXT,',
'       a.TITLETEXT,',
'       a.REMARK,',
'       a.ITEMWISEFOOTER,',
'       a.EXPIRYDATE,',
'       a.SUMOFFOOTERAMOUNT,',
'       a.CREATOR,',
'       a.CREATIONTIME,',
'       a.TRANSACTIONTYPECODE,',
'       a.NATUREOFSUPPLYCODE',
'  from RATECONTRACT a, RateContractDetail b, DocumentStatusDetail dsd, Employee d',
'  WHERE a.tno = b.tno',
'    and a.tno = dsd.Moduletno(+)',
'',
'  and a.Employeecode = d.EmployeeCode',
' and a.RateContractDate between :P713_FROMDATE and :P713_TODATE',
' and ( :P713_COMPANY IS NULL OR instr('':''||:P713_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
' and ( :P713_LOCATION is null or instr('':''||:P713_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
' and ( :P713_DOCTYPE is null or instr('':''||:P713_DOCTYPE||'':'','':''||a.DocTypeCode||'':'') > 0)',
'  and ( :P713_PARTYNAME IS NULL OR instr('':''||:P713_PARTYNAME||'':'','':''||a.PartyCode||'':'') > 0 ) ',
'  and ( :P713_ITEM IS NULL OR instr('':''||:P713_ITEM||'':'','':''||b.ItemCode||'':'') > 0 ) ',
'  and ( :P713_ITEMSPECIFICATION IS NULL OR instr('':''||:P713_ITEMSPECIFICATION||'':'','':''||b.ItemSpecificationCode||'':'') > 0 )',
'-- added on 20-may-2024 Previleage',
' /*and getlocationprivilege(a.locationcode,getmodulecodeforpageno(:APP_PAGE_ID),A.COMPANYCODE,:GLOBAL_LOGINNAME)=''YES'' ',
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
'      End  like nvl(:P713_STATUS,''%'')',
'  and a.RateContractNo like nvl(:P713_RATECONTRACTNO,''%'')',
'  */',
'',
'order by a.ratecontractdate desc, a.ratecontractno desc'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Rate Contrat List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(238368077282946931)
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
,p_detail_link=>'f?p=&APP_ID.:714:&SESSION.::&DEBUG.::P714_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>130086543482564624
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238369153165946945)
,p_db_column_name=>'COMPANYCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Company Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238378356772946949)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238378007069946949)
,p_db_column_name=>'CREATOR'
,p_display_order=>24
,p_column_identifier=>'X'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238372401841946946)
,p_db_column_name=>'CURRENCYUNITCODE'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Currency Unit Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238372742750946946)
,p_db_column_name=>'CURRENCYVALUE'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Currency Value'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(273588203867073454)
,p_db_column_name=>'DEPARTMENT'
,p_display_order=>57
,p_column_identifier=>'AD'
,p_column_label=>'Department'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238370754316946945)
,p_db_column_name=>'DEPARTMENTCODE'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Department Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(273588067907073453)
,p_db_column_name=>'DOCTYPE'
,p_display_order=>47
,p_column_identifier=>'AC'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238370350488946945)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Doc Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238371230909946945)
,p_db_column_name=>'EMPLOYEECODE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Employee Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238377232414946948)
,p_db_column_name=>'EXPIRYDATE'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Expiry Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238369560961946945)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financial Year Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238376820862946948)
,p_db_column_name=>'ITEMWISEFOOTER'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Item Wise Footer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238375539357946948)
,p_db_column_name=>'LETTERTEXT'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Letter Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(273587976680073452)
,p_db_column_name=>'LOCATION'
,p_display_order=>37
,p_column_identifier=>'AB'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238369958386946945)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Location Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238379152869946949)
,p_db_column_name=>'NATUREOFSUPPLYCODE'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Nature Of Supply Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238373575160946946)
,p_db_column_name=>'PARTYCODE'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Party Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(273588377237073456)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>77
,p_column_identifier=>'AF'
,p_column_label=>'Party Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238374366388946946)
,p_db_column_name=>'RATECONTRACTAMOUNT'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Rate Contract Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238372023856946946)
,p_db_column_name=>'RATECONTRACTDATE'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Rate Contract Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238371558177946945)
,p_db_column_name=>'RATECONTRACTNO'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Rate Contract No'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238375164632946948)
,p_db_column_name=>'REFERENCETEXT'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Reference Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238376380343946948)
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
 p_id=>wwv_flow_imp.id(238374751341946948)
,p_db_column_name=>'SUBJECTTEXT'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Subject Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238373952578946946)
,p_db_column_name=>'SUMOFAMOUNT'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Sum Of Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238377620061946948)
,p_db_column_name=>'SUMOFFOOTERAMOUNT'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Sum Of Footer Amount'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238375947152946948)
,p_db_column_name=>'TITLETEXT'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Title Text'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238368799757946943)
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
 p_id=>wwv_flow_imp.id(238378786665946949)
,p_db_column_name=>'TRANSACTIONTYPECODE'
,p_display_order=>26
,p_column_identifier=>'Z'
,p_column_label=>'Transaction Type Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(238373182325946946)
,p_db_column_name=>'WORKORDERTNO'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Work Order Tno'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(239547540670548928)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'108092'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COMPANYCODE:FINANCIALYEARCODE:LOCATION:DOCTYPE:DEPARTMENT:RATECONTRACTNO:RATECONTRACTDATE:CURRENCYUNITCODE:CURRENCYVALUE:WORKORDERTNO:PARTYNAME:SUMOFAMOUNT:RATECONTRACTAMOUNT:SUBJECTTEXT:REFERENCETEXT:LETTERTEXT:TITLETEXT:REMARK:ITEMWISEFOOTER:EXPIRY'
||'DATE:SUMOFFOOTERAMOUNT:CREATOR:CREATIONTIME:TRANSACTIONTYPECODE:NATUREOFSUPPLYCODE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(169056450587902346)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(238367991065946931)
,p_button_name=>'AddNew'
,p_static_id=>'addnew'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:714:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(169056089194902346)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(238367991065946931)
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
 p_id=>wwv_flow_imp.id(169057270471902352)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
 p_id=>wwv_flow_imp.id(563342208120644071)
,p_name=>'P713_BIREPORTURL'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
,p_item_default=>'select getmyparametervalue(''BIREPORTURL'') FROM dual'
,p_item_default_type=>'SQL_QUERY'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1051753089735148994)
,p_name=>'P713_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
 p_id=>wwv_flow_imp.id(1051753211030148995)
,p_name=>'P713_DOCTYPE'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
'  and instr('':''||:P713_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order by 1',
';',
''))
,p_lov_cascade_parent_items=>'P713_COMPANY'
,p_ajax_items_to_submit=>'P713_DOCTYPE'
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
 p_id=>wwv_flow_imp.id(1051847301985525833)
,p_name=>'P713_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
 p_id=>wwv_flow_imp.id(1051849690870525834)
,p_name=>'P713_GRNSTATUS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1051849295077525834)
,p_name=>'P713_ITEM'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
 p_id=>wwv_flow_imp.id(1051850141132525834)
,p_name=>'P713_ITEMSPECIFICATION'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.ItemCode = :P713_ITEM',
'  and e.TNo = ee.TNO'))
,p_lov_cascade_parent_items=>'P713_ITEM'
,p_ajax_items_to_submit=>'P713_ITEMSPECIFICATION'
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
 p_id=>wwv_flow_imp.id(1051848974950525834)
,p_name=>'P713_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
'  and instr('':''||:P713_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P713_COMPANY'
,p_ajax_items_to_submit=>'P713_LOCATION'
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
 p_id=>wwv_flow_imp.id(1072005828553904411)
,p_name=>'P713_NEXTPROCESS'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1051848571494525834)
,p_name=>'P713_PARTYNAME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
 p_id=>wwv_flow_imp.id(1051850500639525834)
,p_name=>'P713_RATECONTRACTNO'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
,p_prompt=>'PoNo'
,p_placeholder=>'Enter Rate Contract No'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select PurchaseOrderNo From PurchaseOrder ',
'Where instr('':''||:P713_LOCATION||'':'','':''||LocationCode||'':'') > 0',
'  and PurchaseOrderDate Between :P713_FROMDATE and :P713_TODATE',
'Order by 1'))
,p_lov_cascade_parent_items=>'P713_LOCATION'
,p_ajax_items_to_submit=>'P713_RATECONTRACTNO'
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
 p_id=>wwv_flow_imp.id(1051848171857525833)
,p_name=>'P713_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
 p_id=>wwv_flow_imp.id(239048375616472042)
,p_name=>'P713_TNO'
,p_item_sequence=>20
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(563575889043225029)
,p_name=>'P713_TNO_1'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(1051847719178525833)
,p_name=>'P713_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
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
 p_id=>wwv_flow_imp.id(1072005515940902747)
,p_name=>'P713_TODOLIST'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(1061392829589730161)
,p_item_default=>'NO'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp.component_end;
end;
/
