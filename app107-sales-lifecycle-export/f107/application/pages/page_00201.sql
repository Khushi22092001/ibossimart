prompt --application/pages/page_00201
begin
--   Manifest
--     PAGE: 00201
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>107
,p_default_id_offset=>9480203831466364
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>201
,p_name=>'BOM List'
,p_alias=>'BOM-LIST'
,p_step_title=>'BOM List'
,p_autocomplete_on_off=>'OFF'
,p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(453019846812134486)
,p_plug_name=>'BOM List'
,p_static_id=>'bom-list'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select A.TNO,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          GetCompanyName(A.COMPANYCODE)',
'         Else',
'          Null',
'       End companyname,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          GetLocationName(A.LOCATIONCODE)',
'         Else',
'          Null',
'       End locationname,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          A.BOMCODE',
'         Else',
'          Null',
'       End BOMCODE,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          A.BOMNAME',
'         Else',
'          Null',
'       End BOMNAME,',
'        Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          C.BOMTYPENAME',
'         Else',
'          Null',
'       End BOMTYPENAME,',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          A.BOMTYPECODE',
'         Else',
'          Null',
'       End BOMTYPECODE,',
'',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          GetItemName(A.ITEMCODE)',
'         Else',
'          Null',
'       End itemname,',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          GetItemSpecificationName(A.itemcode , A.ITEMSPECIFICATIONCODE)',
'         Else',
'          Null',
'       End specificationname,',
'      Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          A.EFFECTIVEDATE',
'         Else',
'          Null',
'       End EFFECTIVEDATE,',
'      Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          A.REMARK',
'         Else',
'          Null',
'       End REMARK,',
'     Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          A.CREATOR',
'         Else',
'          Null',
'       End CREATOR,',
'       Case',
'         When ROW_NUMBER()',
'          Over(Partition By A.TNO Order By A.TNO) = 1 Then',
'          A.CREATIONTIME',
'         Else',
'          Null',
'       End CREATIONTIME,',
'    --   A.BOMTYPECODE,',
'    --   C.BOMTYPENAME,',
' ',
'     --  GetItemName(A.ITEMCODE) itemname,',
'     --  GetItemSpecificationName(A.itemcode , A.ITEMSPECIFICATIONCODE) specificationname,',
'      ',
'     --  A.EFFECTIVEDATE,',
'      -- A.REMARK,',
'      -- A.CREATOR,',
'     --  A.CREATIONTIME,',
'       GETITEMNAME(B.ITEMCODE) AS DETAILITEM,',
'       GETITEMSPECIFICATIONNAME(B.ITEMCODE,B.ITEMSPECIFICATIONCODE) AS DETAILITEMSPECIFICATION,',
'       B.VALUEPERCENT,',
'       B.QUANTITY1,',
'       B.QUANTITY2',
'  from BOM A, BOMDETAIL B, BOMTYPE C ',
'  WHERE A.TNO = B.TNO',
'  AND A.BOMTYPECODE = C.BOMTYPECODE(+)',
'  and ((:P201_FROMDATE is null and :P201_TODATE is null ) or (a.effectiveDate between :P201_FROMDATE and :P201_TODATE))',
'  and (:P201_BOMTYPE is null or (instr('':''||:P201_BOMTYPE||'':'','':''||a.BOMTypeCode||'':'') > 0))',
'  and (:P201_LOCATION is null or (instr('':''||:P201_LOCATION||'':'','':''||a.LocationCode||'':'') > 0))',
'  and (:P201_COMPANY is null or (instr('':''||:P201_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0))',
'   and ( :P201_ITEM IS NULL OR instr('':''||:P201_ITEM||'':'','':''||a.ItemCode||'':'') > 0 ) ',
'  and ( :P201_ITEMSPECIFICATION IS NULL OR instr('':''||:P201_ITEMSPECIFICATION||'':'','':''||a.ItemSpecificationCode||'':'') > 0 ) ',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'BOM List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(453019875569134486)
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
,p_detail_link=>'f?p=&APP_ID.:202:&APP_SESSION.::&DEBUG.:RP:P202_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>4554802537970138
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(453020757414134488)
,p_db_column_name=>'BOMCODE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'BOM Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(453021104454134488)
,p_db_column_name=>'BOMNAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'BOM Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463910809886445270)
,p_db_column_name=>'BOMTYPECODE'
,p_display_order=>121
,p_column_identifier=>'AE'
,p_column_label=>'BOM Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463910328020445265)
,p_db_column_name=>'BOMTYPENAME'
,p_display_order=>71
,p_column_identifier=>'Z'
,p_column_label=>'BOM Type'
,p_column_html_expression=>'<div style="display:block; width:180px">#BOMTYPENAME#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461289382508149190)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>51
,p_column_identifier=>'X'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(453027511294134495)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>19
,p_column_identifier=>'S'
,p_column_label=>'Creation Time'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(453023110482134489)
,p_db_column_name=>'CREATOR'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463910460381445266)
,p_db_column_name=>'DETAILITEM'
,p_display_order=>81
,p_column_identifier=>'AA'
,p_column_label=>'Detail Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463910572212445267)
,p_db_column_name=>'DETAILITEMSPECIFICATION'
,p_display_order=>91
,p_column_identifier=>'AB'
,p_column_label=>'Detail Item Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(453026718206134494)
,p_db_column_name=>'EFFECTIVEDATE'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Effective Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461289203901149188)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>31
,p_column_identifier=>'V'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461289567911149191)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>61
,p_column_identifier=>'Y'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463910614250445268)
,p_db_column_name=>'QUANTITY1'
,p_display_order=>101
,p_column_identifier=>'AC'
,p_column_label=>'Primary Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(463910730651445269)
,p_db_column_name=>'QUANTITY2'
,p_display_order=>111
,p_column_identifier=>'AD'
,p_column_label=>'Primary Qty'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(453022687997134489)
,p_db_column_name=>'REMARK'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(461289324724149189)
,p_db_column_name=>'SPECIFICATIONNAME'
,p_display_order=>41
,p_column_identifier=>'W'
,p_column_label=>'Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(453020278842134486)
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
 p_id=>wwv_flow_imp.id(453028304357134495)
,p_db_column_name=>'VALUEPERCENT'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Value Percent'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(453032721840171408)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'45677'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COMPANYNAME:LOCATIONNAME:BOMCODE:BOMNAME:BOMTYPECODE:ITEMNAME:SPECIFICATIONNAME:EFFECTIVEDATE:DETAILITEM:DETAILITEMSPECIFICATION:QUANTITY1:QUANTITY2:VALUEPERCENT:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(492340367049940260)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--scrollBody:t-Form--slimPadding'
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
 p_id=>wwv_flow_imp.id(453028801184134495)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(453019846812134486)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:202:&APP_SESSION.::&DEBUG.:202::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(452693242003079986)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(453019846812134486)
,p_button_name=>'Home'
,p_static_id=>'home'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Home'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1::'
,p_icon_css_classes=>'fa-window-close-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(464144610696397306)
,p_button_sequence=>150
,p_button_plug_id=>wwv_flow_imp.id(492340367049940260)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(481692699146559686)
,p_name=>'P201_BOMTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(492340367049940260)
,p_prompt=>'BOM Type'
,p_placeholder=>'Enter DocType Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'Select BOMTypename D,BomTypecode R from BOMType order by 1'
,p_lov_cascade_parent_items=>'P201_COMPANY'
,p_ajax_items_to_submit=>'P201_LOCATION,P201_BOMTYPE'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(481692586699559685)
,p_name=>'P201_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(492340367049940260)
,p_prompt=>'Company'
,p_placeholder=>'Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = getmodulecodeforpageno(:APP_PAGE_ID)',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.'''))
,p_cSize=>30
,p_colspan=>8
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
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
 p_id=>wwv_flow_imp.id(481665598103518268)
,p_name=>'P201_FROMDATE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(492340367049940260)
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
 p_id=>wwv_flow_imp.id(481668832540518271)
,p_name=>'P201_ITEM'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(492340367049940260)
,p_prompt=>'Material'
,p_placeholder=>'Material List'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      e.ItemName||'' ( ''||e.ItemCode||'' )'' as d,',
'      e.ItemCode r',
'From Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo'))
,p_cSize=>79
,p_colspan=>8
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
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(481669613677518272)
,p_name=>'P201_ITEMSPECIFICATION'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(492340367049940260)
,p_prompt=>'Specification'
,p_placeholder=>'Material Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      Distinct',
'      ee.ItemSpecificationName as d,',
'      ee.ItemSpecificationCode as r',
'From Item e, ItemSpecification ee',
'Where e.TNo = ee.TNo',
'  and e.ItemCode = :P201_ITEM'))
,p_lov_cascade_parent_items=>'P201_ITEM'
,p_ajax_items_to_submit=>'P201_ITEMSPECIFICATION'
,p_ajax_optimize_refresh=>'Y'
,p_cSize=>79
,p_colspan=>8
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
  'attribute_09', '1',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(481667205309518271)
,p_name=>'P201_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(492340367049940260)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select distinct',
'      l.LocationName d,',
'      l.LocationCode r',
'From  ModulePrivilege a, ModulePrivilegeLocation b, Location l, BossUser bu, MODULELOCATION ML, MODULELOCATIONDETAIL MD',
'Where a.TNo = b.TNo(+)',
'  AND A.MODULECODE = ML.MODULECODE',
'  AND ML.TNO = MD.TNO',
'  AND (B.LOCATIONCODE = L.LOCATIONCODE OR B.LOCATIONCODE IS NULL)',
'  and (MD.LocationCode = l.LocationCode )',
'  and a.ModuleCode = GETMODULECODEFORPAGENO(:APP_PAGE_ID)',
'  and a.BossUserCode = bu.BossUserCode',
'  and bu.BossUserName =  ''&APP_USER.''',
' /* and a.CompanyCode = :P201_COMPANY */',
' and instr('':''||:P201_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0',
'Order By 1',
';',
''))
,p_lov_cascade_parent_items=>'P201_COMPANY'
,p_ajax_items_to_submit=>'P201_LOCATION'
,p_ajax_optimize_refresh=>'Y'
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
 p_id=>wwv_flow_imp.id(481665976696518269)
,p_name=>'P201_TODATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(492340367049940260)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>45
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(453219607630800250)
,p_name=>'New'
,p_static_id=>'new'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(453220026534800251)
,p_event_id=>wwv_flow_imp.id(453219607630800250)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
,p_server_condition_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
