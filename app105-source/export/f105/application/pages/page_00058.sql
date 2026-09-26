prompt --application/pages/page_00058
begin
--   Manifest
--     PAGE: 00058
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
 p_id=>58
,p_name=>'Item Master List'
,p_alias=>'ITEM-MASTER-LIST'
,p_step_title=>'Item Master List'
,p_autocomplete_on_off=>'OFF'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(473065840532273534)
,p_plug_name=>'Filter'
,p_static_id=>'filter'
,p_region_template_options=>'#DEFAULT#:is-collapsed:t-Region--accent15:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(473065967489273535)
,p_plug_name=>'Item Master'
,p_static_id=>'item-master'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'E.TNO,',
'it.itemtypeName As MaterialGroup,',
'--||'' ~ ''||e.ParentCode',
'e.ItemCode,',
'e.ItemName,',
'e.ItemClassificationCode,',
'GETMEASURINGUNITNAME(e.MeasuringUnitCode1) AS MeasuringUnitCode1,',
'GETMEASURINGUNITNAME(e.MeasuringUnitCode2) AS MeasuringUnitCode2,',
'itn.ItemNatureName,',
'sa.PartyName as StockAccount,',
'ca.PartyName as ConsumptionAccount,',
'cw.PartyName as CWIPAccount,',
'e.BulkDensity,',
'ee.MultiPlyingFactor,',
'e.IsEquipment,',
'e.SerialNoRequired,',
'ee.ItemSpecificationCode,',
'ee.ItemSpecificationName,',
'ee.HSNCODE,',
'ee.QualityRequired,',
'ee.IsWeighmentRequired,',
'GetEmployeeName(bu.employeecode)||'' ( ''||e.Creator||'' )'' as ItemCreator,',
'e.CreationTime as ItemCreationTime,',
'GetEmployeeName(bu2.employeecode)||'' ( ''||ee.Creator||'' )'' as ItemSpecificationCreator,',
'ee.CreatedOn as ItemSpecificationCreationTime,',
'e.Remark,',
'ic.ItemClassName,',
'icat.ItemCategoryName,',
'GETDOCUMENTSTATUSCODE(''ITEM'',E.TNO) AS Status,',
'ee.Sku',
'From Item e, ItemSpecification ee, ItemNature itn, Party sa, Party ca, Party cw, BossUser bu, BossUser bu2, ItemType it, ItemClass ic, ItemCategory icat',
'Where e.TNo = ee.TNo(+)',
'  and e.ItemNatureCode = itn.ItemNatureCode(+)',
'  and e.StockAccountCode = sa.PartyCode(+)',
'  and e.ConsumptionAccountCode = ca.PartyCode(+)',
'  and e.CWIPAccountCode = cw.PartyCode(+)',
'  and e.itemtype = it.itemtypecode(+)',
'  and e.itemclasscode = ic.itemclasscode(+)',
'  and e.itemcategorycode = icat.ItemCategoryCode(+)',
'  and ( :P58_Company is NUll or instr('':''||:P58_COMPANY||'':'','':''||e.CompanyCode||'':'') > 0)',
' -- and e.CompanyCode = :P58_COMPANY',
'  and e.Creator = bu.LoginName(+)',
'  and ee.Creator = bu2.LoginName(+)',
'  --and instr('':''||:P58_ITEMTYPE||'':'','':''||e.ItemType||'':'') > 0',
' -- changed on 28-may-2022',
' -- and (:P58_GROUP IS NULL OR instr('':''||:P58_GROUP||'':'','':''||e.ParentCode||'':'') > 0 ) ',
'  and (:P58_ITEMNATURE is null or e.ItemNatureCode = :P58_ITEMNATURE)',
'  and (:P58_ITEMCATEGORY is null or e.ITEMCATEGORYCODE = :P58_ITEMCATEGORY)',
'  and ( :P58_ITEMTYPE is null or e.itemtype = :P58_ITEMTYPECODE)'))
,p_plug_source_type=>'NATIVE_IR'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(473146202732821686)
,p_max_row_count=>'1000000'
,p_max_rows_per_page=>'1000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'TOP_AND_BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_rows_per_page=>'N'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>'Y'
,p_email_from=>'erp@pbsoil.com'
,p_detail_link=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:59:P59_TNO:#TNO#'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>34161333533123702
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457796373840325913)
,p_db_column_name=>'BULKDENSITY'
,p_display_order=>120
,p_column_identifier=>'T'
,p_column_label=>'BULK DENSITY'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454912908137881183)
,p_db_column_name=>'CONSUMPTIONACCOUNT'
,p_display_order=>90
,p_column_identifier=>'G'
,p_column_label=>'CONSUMPTION ACCOUNT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454913294193881183)
,p_db_column_name=>'CWIPACCOUNT'
,p_display_order=>100
,p_column_identifier=>'H'
,p_column_label=>'CWIP ACCOUNT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454914927971881183)
,p_db_column_name=>'HSNCODE'
,p_display_order=>160
,p_column_identifier=>'L'
,p_column_label=>'HSNCODE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454913683762881183)
,p_db_column_name=>'ISEQUIPMENT'
,p_display_order=>110
,p_column_identifier=>'I'
,p_column_label=>'IS EQUIPMENT'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454915733912881188)
,p_db_column_name=>'ISWEIGHMENTREQUIRED'
,p_display_order=>180
,p_column_identifier=>'N'
,p_column_label=>'WEIGHMENT REQUIRED'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445784424094356513)
,p_db_column_name=>'ITEMCATEGORYNAME'
,p_display_order=>270
,p_column_identifier=>'AA'
,p_column_label=>'ITEM CATEGORY'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457796549328325915)
,p_db_column_name=>'ITEMCLASSIFICATIONCODE'
,p_display_order=>40
,p_column_identifier=>'V'
,p_column_label=>'ITEM TYPE'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445784314092356512)
,p_db_column_name=>'ITEMCLASSNAME'
,p_display_order=>260
,p_column_identifier=>'Z'
,p_column_label=>'ITEM CLASS'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454910874988881182)
,p_db_column_name=>'ITEMCODE'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'MATERIAL CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(456604207979600574)
,p_db_column_name=>'ITEMCREATIONTIME'
,p_display_order=>210
,p_column_identifier=>'Q'
,p_column_label=>'ITEM CREATION TIME'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(456604095876600573)
,p_db_column_name=>'ITEMCREATOR'
,p_display_order=>200
,p_column_identifier=>'P'
,p_column_label=>'ITEM CREATOR'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454911246867881182)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'MATERIAL_NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454912091081881182)
,p_db_column_name=>'ITEMNATURENAME'
,p_display_order=>70
,p_column_identifier=>'E'
,p_column_label=>'ITEM_NATURE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454910115387881182)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>190
,p_column_identifier=>'O'
,p_column_label=>'ITEM SPECIFICATION CODE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(456604375984600576)
,p_db_column_name=>'ITEMSPECIFICATIONCREATIONTIME'
,p_display_order=>230
,p_column_identifier=>'S'
,p_column_label=>'ITEM SPECIFICATION CREATION TIME'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MON-YYYY HH:MIPM'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(456604252512600575)
,p_db_column_name=>'ITEMSPECIFICATIONCREATOR'
,p_display_order=>220
,p_column_identifier=>'R'
,p_column_label=>'ITEM SPECIFICATION CREATOR'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454914465193881183)
,p_db_column_name=>'ITEMSPECIFICATIONNAME'
,p_display_order=>150
,p_column_identifier=>'K'
,p_column_label=>'SPECIFICATION NAME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454910492505881182)
,p_db_column_name=>'MATERIALGROUP'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'ITEM_TYPE'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454911732641881182)
,p_db_column_name=>'MEASURINGUNITCODE1'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'BASE UNIT'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(464928741097399000)
,p_db_column_name=>'MEASURINGUNITCODE2'
,p_display_order=>60
,p_column_identifier=>'X'
,p_column_label=>'ISSUE UNIT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457796492882325914)
,p_db_column_name=>'MULTIPLYINGFACTOR'
,p_display_order=>130
,p_column_identifier=>'U'
,p_column_label=>'MULTI PLYING FACTOR'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454915302354881184)
,p_db_column_name=>'QUALITYREQUIRED'
,p_display_order=>170
,p_column_identifier=>'M'
,p_column_label=>'QUALITY REQUIRED'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(457796688497325916)
,p_db_column_name=>'REMARK'
,p_display_order=>240
,p_column_identifier=>'W'
,p_column_label=>'REMARK'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454914034762881183)
,p_db_column_name=>'SERIALNOREQUIRED'
,p_display_order=>140
,p_column_identifier=>'J'
,p_column_label=>'SERIALNO REQUIRED'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(34682171027667067)
,p_db_column_name=>'SKU'
,p_display_order=>290
,p_column_identifier=>'AC'
,p_column_label=>'SKU'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(304946503831107971)
,p_db_column_name=>'STATUS'
,p_display_order=>280
,p_column_identifier=>'AB'
,p_column_label=>'STATUS'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(454912531788881183)
,p_db_column_name=>'STOCKACCOUNT'
,p_display_order=>80
,p_column_identifier=>'F'
,p_column_label=>'STOCK  ACCOUNT'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(445784175103356511)
,p_db_column_name=>'TNO'
,p_display_order=>250
,p_column_identifier=>'Y'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(473156364305824993)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21697'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STATUS:MATERIALGROUP:ITEMCODE:ITEMNAME:ITEMCLASSIFICATIONCODE:MEASURINGUNITCODE1:MEASURINGUNITCODE2:ITEMSPECIFICATIONCODE:ITEMSPECIFICATIONNAME:SKU:HSNCODE:MULTIPLYINGFACTOR:ITEMNATURENAME:STOCKACCOUNT:CONSUMPTIONACCOUNT:CWIPACCOUNT:ITEMCREATOR:ITEMC'
||'REATIONTIME:ITEMSPECIFICATIONCREATOR:ITEMSPECIFICATIONCREATIONTIME:ITEMCATEGORYNAME:ITEMCLASSNAME:REMARK'
,p_sort_column_1=>'MATERIALGROUP'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'ITEMCODE'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(445987853420024179)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(473065967489273535)
,p_button_name=>'CREATE'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:59::'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(445987489899023068)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(473065967489273535)
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
 p_id=>wwv_flow_imp.id(445885630733519001)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(473065840532273534)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>2
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454834289676362490)
,p_name=>'P58_COMPANY'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(473065840532273534)
,p_prompt=>'Company'
,p_placeholder=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''ITEM''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.'''))
,p_cSize=>30
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', '%D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(454909237226881183)
,p_name=>'P58_ITEMCATEGORY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(473065840532273534)
,p_prompt=>'Item Category'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'SELECT ITEMCATEGORYNAME D, ITEMCATEGORYCODE R FROM ITEMCATEGORY ORDER BY 1 '
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--Item Category--'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(454909589780881183)
,p_name=>'P58_ITEMNATURE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(473065840532273534)
,p_prompt=>'Item Nature'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'SELECT ITEMNATURENAME d, ITEMNATURECODE r FROM ITEMNATURE ORDER BY 1'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'--  Item Nature --'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(454908825214881183)
,p_name=>'P58_ITEMTYPE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(473065840532273534)
,p_prompt=>'Item Type'
,p_placeholder=>'Item Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>'select itemtypename d, itemtypecode r from itemtype order by 1'
,p_cSize=>75
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
  'attribute_14', '20',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(445924434235657064)
,p_name=>'hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(445924828897657064)
,p_event_id=>wwv_flow_imp.id(445924434235657064)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");')).to_clob
);
wwv_flow_imp.component_end;
end;
/
