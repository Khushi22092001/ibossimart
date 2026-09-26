prompt --application/pages/page_00196
begin
--   Manifest
--     PAGE: 00196
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
 p_id=>196
,p_name=>'Production List'
,p_alias=>'PRODUCTION-LIST'
,p_step_title=>'Production List'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(30097906923581762)
,p_plug_name=>'Production'
,p_static_id=>'production'
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--hiddenOverflow'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(443319794454722752)
,p_plug_name=>'Production List'
,p_static_id=>'production-list'
,p_region_name=>'ProdListIR'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>20
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'WITH filtered_prod AS (',
'    -- Pre-filter the main transaction table to reduce the workload',
'    SELECT * FROM Production',
'    WHERE ProductionDate BETWEEN :P196_FROMDATE AND :P196_TODATE',
'      AND (:P196_COMPANY IS NULL OR CompanyCode = :P196_COMPANY) -- Simplified for performance',
'      AND (:P196_LOCATION IS NULL OR LocationCode = :P196_LOCATION)',
'      AND (:P196_DOCTYPE IS NULL OR DocTypeCode = :P196_DOCTYPE)',
')',
'SELECT ',
'    a.Tno, ',
'    (SELECT Companyname FROM Company WHERE CompanyCode = a.CompanyCode) as Companyname,',
'    a.Financialyearcode, ',
'    (SELECT Locationname FROM Location WHERE LocationCode = a.LocationCode) as Locationname,',
'    (SELECT Doctypename FROM DocType WHERE DocTypeCode = a.DocTypeCode) as Doctypename,',
'    a.Productionno, a.Productiondate, a.Remark, ',
'    (SELECT Productioncentrename FROM ProductionCentre WHERE ProductionCentreCode = a.ProductionCentreCode) as Productioncentrename,',
'    (SELECT Shiftname FROM Shift WHERE ShiftCode = a.ShiftCode) as Shiftname,',
'    (SELECT Employeename FROM Employee WHERE EmployeeCode = a.ShiftInChargeCode) AS ShiftInCharge,',
'    (SELECT ItemName FROM Item WHERE ItemCode = a.ItemCode) as ItemName,',
'    a.ITEMSPECIFICATIONCODE,',
'    (SELECT Partyname FROM Party WHERE PartyCode = a.ContractorCode) AS Contractor,',
'    (SELECT JobOrderNo FROM JobOrder WHERE Tno = a.JobOrderTno) as JobOrderNo,',
'    a.CREATIONTIME, a.CREATOR,',
'    -- Raw Material Data',
'    l.ItemName AS InputItem, ',
'    iss.ItemSpecificationName AS InputSpecificationName, ',
'    b.Description AS Inputdescription, ',
'    b.Quantity1 AS InputQty1, b.Quantity2 AS InputQty2, ',
'    b.LossPercent, b.LossQuantity1, b.LossQuantity2,',
'    -- Finished Goods Data',
'    m.ItemName AS Outputitem, ',
'    isf.ItemSpecificationName AS OutputSpecs, ',
'    c.Description AS Outputdescription, ',
'    c.Quantity1 AS OutputQty1, c.Quantity2 AS OutputQty2,',
'    NVL(dsd.DocumentStatusCode, ''STATUS'') as Status',
'FROM filtered_prod a',
'JOIN ProductionRaw b ON a.Tno = b.Tno',
'JOIN ProductionFinished c ON a.Tno = c.Tno',
'LEFT JOIN Item l ON b.ItemCode = l.ItemCode',
'LEFT JOIN Item m ON c.ItemCode = m.ItemCode',
'LEFT JOIN ItemSpecification iss ON b.ItemSpecificationCode = iss.ItemSpecificationCode',
'LEFT JOIN ItemSpecification isf ON c.ItemSpecificationCode = isf.ItemSpecificationCode',
'LEFT JOIN DocumentStatusDetail dsd ON a.Tno = dsd.ModuleTno',
'WHERE ',
'    -- Filtering on Item/Specs via the child tables',
'    (:P196_ITEM IS NULL OR b.ItemCode = :P196_ITEM OR c.ItemCode = :P196_ITEM)',
'    AND (:P196_ITEMSPECIFICATION IS NULL OR b.ItemSpecificationCode = :P196_ITEMSPECIFICATION OR c.ItemSpecificationCode = :P196_ITEMSPECIFICATION);'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Production List'
,p_ai_enabled=>false
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(443319931421722752)
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
,p_detail_link=>'f?p=&APP_ID.:197:&APP_SESSION.::&DEBUG.:RP:P197_TNO:\#TNO#\'
,p_detail_link_text=>'<span role="img" aria-label="Edit" class="fa fa-edit" title="Edit"></span>'
,p_internal_uid=>4335062222024768
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30095691041581740)
,p_db_column_name=>'COMPANYNAME'
,p_display_order=>185
,p_column_identifier=>'BG'
,p_column_label=>'Company'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30096385664581747)
,p_db_column_name=>'CONTRACTOR'
,p_display_order=>255
,p_column_identifier=>'BN'
,p_column_label=>'Contractor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443335556049722771)
,p_db_column_name=>'CREATIONTIME'
,p_display_order=>39
,p_column_identifier=>'AM'
,p_column_label=>'Creationtime'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443337946344722772)
,p_db_column_name=>'CREATOR'
,p_display_order=>45
,p_column_identifier=>'AS'
,p_column_label=>'Creator'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30095894560581742)
,p_db_column_name=>'DOCTYPENAME'
,p_display_order=>205
,p_column_identifier=>'BI'
,p_column_label=>'Doc Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443321074409722766)
,p_db_column_name=>'FINANCIALYEARCODE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Financialyearcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097095170581754)
,p_db_column_name=>'INPUTDESCRIPTION'
,p_display_order=>325
,p_column_identifier=>'BU'
,p_column_label=>'Input Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30096902050581752)
,p_db_column_name=>'INPUTITEM'
,p_display_order=>305
,p_column_identifier=>'BS'
,p_column_label=>'Input Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30096669611581750)
,p_db_column_name=>'INPUTQTY1'
,p_display_order=>285
,p_column_identifier=>'BQ'
,p_column_label=>'Input Qty 1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30096746447581751)
,p_db_column_name=>'INPUTQTY2'
,p_display_order=>295
,p_column_identifier=>'BR'
,p_column_label=>'Input Qty 2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097009777581753)
,p_db_column_name=>'INPUTSPECIFICATIONNAME'
,p_display_order=>315
,p_column_identifier=>'BT'
,p_column_label=>'Input Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097766641581761)
,p_db_column_name=>'ITEMNAME'
,p_display_order=>395
,p_column_identifier=>'CB'
,p_column_label=>'Item'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097666005581760)
,p_db_column_name=>'ITEMSPECIFICATIONCODE'
,p_display_order=>385
,p_column_identifier=>'CA'
,p_column_label=>'Itemspecificationcode'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30096433655581748)
,p_db_column_name=>'JOBORDERNO'
,p_display_order=>265
,p_column_identifier=>'BO'
,p_column_label=>'Job Order No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30095736702581741)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>195
,p_column_identifier=>'BH'
,p_column_label=>'Location'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(460483483044791292)
,p_db_column_name=>'LOSSPERCENT'
,p_display_order=>105
,p_column_identifier=>'AY'
,p_column_label=>'Losspercent'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443323911404722767)
,p_db_column_name=>'LOSSQUANTITY1'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Loss Quantity 1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443324367984722767)
,p_db_column_name=>'LOSSQUANTITY2'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Loss Quantity 2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097369581581757)
,p_db_column_name=>'OUTPUTDESCRIPTION'
,p_display_order=>355
,p_column_identifier=>'BX'
,p_column_label=>'Output Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097128142581755)
,p_db_column_name=>'OUTPUTITEM'
,p_display_order=>335
,p_column_identifier=>'BV'
,p_column_label=>'Output Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097428767581758)
,p_db_column_name=>'OUTPUTQTY1'
,p_display_order=>365
,p_column_identifier=>'BY'
,p_column_label=>'Output Qty1'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097604074581759)
,p_db_column_name=>'OUTPUTQTY2'
,p_display_order=>375
,p_column_identifier=>'BZ'
,p_column_label=>'Output Qty2'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999999999.999'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30097231165581756)
,p_db_column_name=>'OUTPUTSPECS'
,p_display_order=>345
,p_column_identifier=>'BW'
,p_column_label=>'Output Specification'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30095989643581743)
,p_db_column_name=>'PRODUCTIONCENTRENAME'
,p_display_order=>215
,p_column_identifier=>'BJ'
,p_column_label=>'Production Centre'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443322764226722767)
,p_db_column_name=>'PRODUCTIONDATE'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Production Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443322273310722767)
,p_db_column_name=>'PRODUCTIONNO'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Production No.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443326330103722768)
,p_db_column_name=>'REMARK'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Remark'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30096171353581745)
,p_db_column_name=>'SHIFTINCHARGE'
,p_display_order=>235
,p_column_identifier=>'BL'
,p_column_label=>'Shift In Charge'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(30096049708581744)
,p_db_column_name=>'SHIFTNAME'
,p_display_order=>225
,p_column_identifier=>'BK'
,p_column_label=>'Shift'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(46395202808862922)
,p_db_column_name=>'STATUS'
,p_display_order=>405
,p_column_identifier=>'CC'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(443320269616722759)
,p_db_column_name=>'TNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(443340357254727947)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'43555'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'COMPANYNAME:STATUS:LOCATIONNAME:DOCTYPENAME:PRODUCTIONNO:PRODUCTIONDATE:PRODUCTIONCENTRENAME:SHIFTNAME:SHIFTINCHARGE:CONTRACTOR:JOBORDERNO:INPUTITEM:INPUTSPECIFICATIONNAME:INPUTDESCRIPTION:INPUTQTY1:INPUTQTY2:OUTPUTITEM:OUTPUTSPECS:OUTPUTDESCRIPTION:'
||'OUTPUTQTY1:OUTPUTQTY2:LOSSQUANTITY1:LOSSQUANTITY2:LOSSPERCENT:REMARK:CREATOR:CREATIONTIME'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(443341680277749555)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(443319794454722752)
,p_button_name=>'Create'
,p_static_id=>'create'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--primary:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add New'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_redirect_url=>'f?p=&APP_ID.:197:&SESSION.::&DEBUG.:197::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'  tModuleFlow number;',
'  tmp         number;',
'  tmp1        number;',
'BEGIN',
'   select count(*) into tmp1 from ModuleFlow a where a.modulecode = getmodulecodeforpageno(:APP_PAGE_ID);',
'   if nvl(tmp1,0) > 0 then',
'        select ',
'            count(*) into tModuleFlow',
'        from ModuleFlow a, ModuleFlowUser b, Bossuser c',
'        where a.tno = b.tno',
'          and b.bossusercode = c.bossusercode',
'          and a.Modulecode = getmodulecodeforpageno(:APP_PAGE_ID)',
'          and c.bossusername = :APP_USER',
'          ;',
'',
'          if nvl(tModuleFlow,0) > 0 then',
'             return(TRUE) ;',
'          else',
'             return(FALSE);',
'          end if;',
'     else',
'            Select',
'            	COUNT(*) into tmp ',
'            From Module a, ModulePrivilege b, BossUser c',
'            Where a.ModuleCode = b.ModuleCode',
'            	and b.BossUsercode = c.BossUserCode',
'            	and c.LoginName = :GLOBAL_LOGINNAME',
'                and a.ModuleCode= getmodulecodeforpageno(:APP_PAGE_ID)',
'            	and b.CompanyCode = :GLOBAL_COMPANYCODE',
'            	and b.InsertPrivilege = ''YES'' ;',
'            if nvl(tmp,0) > 0 then',
'               return(TRUE);',
'            else',
'               return(FALSE);',
'            end if;',
'      end if;',
'              ',
'END;'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'FUNCTION_BODY'
,p_icon_css_classes=>'fa-plus-square-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(443341408703748245)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(443319794454722752)
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
 p_id=>wwv_flow_imp.id(33900062807875402)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(30097906923581762)
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
 p_id=>wwv_flow_imp.id(33916570651224651)
,p_name=>'P196_COMPANY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(30097906923581762)
,p_prompt=>'Company'
,p_placeholder=>'Select Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct',
'      c.CompanyName d,',
'      a.CompanyCode r',
'From  ModulePrivilege a, BossUser bu, Company c',
'Where a.ModuleCode = ''CCINVOICE''',
'  and a.viewprivilege = ''YES''',
'  and a.BossUserCode = bu.BossUserCode',
'  and a.CompanyCode = c.CompanyCode',
'  and bu.BossUserName =  ''&APP_USER.''',
'Order by 1',
'  ;',
''))
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'RS',
  'attribute_04', 'D%',
  'attribute_05', 'AUTOCOMPLETE:POPOUP_REPORT:MS',
  'attribute_06', 'CORSI:RESIZABLE:DRAGGABLE:COE:RPP:SIAC',
  'attribute_10', 'DDC',
  'attribute_12', '720',
  'attribute_13', '541',
  'attribute_14', '200',
  'attribute_15', '20')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(30098101008581764)
,p_name=>'P196_DOCTYPE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(30097906923581762)
,p_prompt=>'Doc Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.DoctypeName as d, ',
'                a.DoctypeCode as r',
'    From Production b',
'    JOIN Doctype a ON a.DoctypeCode = b.DoctypeCode'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>1
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
 p_id=>wwv_flow_imp.id(33900335043887385)
,p_name=>'P196_FROMDATE'
,p_is_required=>true
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(30097906923581762)
,p_item_default=>'trunc(sysdate) - 4'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'From Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>6
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(33893166098825717)
,p_name=>'P196_ITEM'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(30097906923581762)
,p_prompt=>'Item'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.ItemName as d,',
'                a.ItemCode as r',
'        From Item a;',
'               '))
,p_cSize=>30
,p_colspan=>6
,p_grid_column=>1
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
 p_id=>wwv_flow_imp.id(33893276823825718)
,p_name=>'P196_ITEMSPECIFICATION'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(30097906923581762)
,p_prompt=>'Item Specification'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.ItemSpecificationName as d,',
'                a.ItemSpecificationCode as r',
'        From ItemSpecification a;'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
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
 p_id=>wwv_flow_imp.id(30097942845581763)
,p_name=>'P196_LOCATION'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(30097906923581762)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.LocationName as d, ',
'                a.LocationCode as r',
'    From Location a, Production b',
'    Where a.LocationCode = b.LocationCode (+)'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
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
 p_id=>wwv_flow_imp.id(33893328892825719)
,p_name=>'P196_SHIFT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(30097906923581762)
,p_prompt=>'Shift'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select Distinct a.ShiftName as d,',
'                a.ShiftCode as r',
'       From Shift a, Production b',
'       Where a.ShiftCode = b.ShiftCode (+)'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
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
 p_id=>wwv_flow_imp.id(33899781641873536)
,p_name=>'P196_TODATE'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(30097906923581762)
,p_item_default=>'trunc(sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_placeholder=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_grid_column=>7
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(443338765471722774)
,p_name=>'Edit Report - Dialog Closed'
,p_static_id=>'edit-report-dialog-closed'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(443319794454722752)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(443339178894722774)
,p_event_id=>wwv_flow_imp.id(443338765471722774)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(443319794454722752)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(444157155285553192)
,p_name=>'Hide nav'
,p_static_id=>'hide-nav'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(444157248507553193)
,p_event_id=>wwv_flow_imp.id(444157155285553192)
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
