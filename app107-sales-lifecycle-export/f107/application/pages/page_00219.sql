prompt --application/pages/page_00219
begin
--   Manifest
--     PAGE: 00219
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
 p_id=>219
,p_name=>'Creditors Aging Detail Report'
,p_alias=>'CREDITORS-AGING-DETAIL-REPORT1'
,p_step_title=>'Creditors Aging Detail Report'
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
 p_id=>wwv_flow_imp.id(820644927679391122)
,p_plug_name=>'Payable/Receivable Ageing Detail Report'
,p_static_id=>'payable-receivable-ageing-detail-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With t_Allocated as (',
'	select ',
'		aa.DrVoucherTNo as VoucherTNo,',
'		aa.DrVoucherSNo as VoucherSNo,',
'		-1 * sum(aa.Amount) as AllocatedAmount ',
'	from DrCrAllocation aa, Voucher bb, Voucher cc ',
'	where aa.DrVoucherTNo = bb.TNo',
'		and aa.CrVoucherTNo = cc.TNo',
'        and bb.VoucherDate <= :P219_ASONDATE',
'        and cc.VoucherDate <= :P219_ASONDATE',
'	group by ',
'		aa.DrVoucherTNo,',
'		aa.DrVoucherSNo',
'	union all',
'	select ',
'		aa.CrVoucherTNo as VoucherTNo,',
'		aa.CrVoucherSNo as VoucherSNo,',
'		sum(aa.Amount) as AllocatedAmount',
'	from DrCrAllocation aa, Voucher bb, Voucher cc ',
'	where aa.DrVoucherTNo = bb.TNo',
'		and aa.CrVoucherTNo = cc.TNo',
'        and bb.VoucherDate <= :P219_ASONDATE',
'        and cc.VoucherDate <= :P219_ASONDATE',
'	group by ',
'		aa.CrVoucherTNo,',
'		aa.CrVoucherSNo',
'), t_Bill as (',
'	select ',
'		aa.TNo,',
'		bb.PartyBillNo,',
'		bb.PartyBillDate',
'	from PBPass aa, PurchaseBill bb ',
'	where aa.PurchaseBillTNo = bb.TNo',
'	union all',
'	select ',
'		aa.TNo,',
'		bb.PartyBillNo,',
'		bb.PartyBillDate',
'	from JBPass aa, JobBill bb ',
'	where aa.JobBillTNo = bb.TNo',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from FreightAdvice aa',
'',
'  union all',
'	select ',
'		aa.TNo,',
'		aa.CCInvoiceNo,',
'		aa.CCInvoiceDate',
'	from CCInvoice aa',
'  union all',
'	select ',
'		aa.TNo,',
'		aa.ServiceBillNo,',
'		aa.ServiceBillDate',
'	from ServiceBill aa',
'  union all',
'	select ',
'		aa.TNo,',
'		aa.CreditNoteNo,',
'		aa.CreditNoteDate',
'	from CreditNote aa',
'), t_Balance as (',
'        select ',
'            a.TNo,',
'            a.SNo,',
'            a.VoucherDate,',
'            b.VoucherNo,',
'            b.doctypecode,',
'            a.LocationCode,',
'            getlocationname(a.LocationCode) as Location,',
'            d.BillNo as PartyBillNo,',
'            d.BillDate as PartyBillDate,',
'            trunc(sysdate) - nvl(d.BillDate, a.VoucherDate) as BillAge,',
'            a.AccountCode,',
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, AccountOpening d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and a.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo = ''OPENING''',
'            and a.VoucherDate <= :P219_ASONDATE',
'            and (:P219_LOCATION IS NULL OR instr('':''||:P219_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'            and ( :P219_PARTY IS NULL OR instr('':''||:P219_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )',
'            and ( :P219_COMPANY IS NULL OR instr('':''||:P219_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'        union all',
'        select ',
'            a.TNo,',
'            a.SNo,',
'            a.VoucherDate,',
'            b.VoucherNo,',
'            b.doctypecode,',
'            a.LocationCode,',
'            getlocationname(a.LocationCode) as Location,',
'            d.PartyBillNo,',
'            d.PartyBillDate,',
'            trunc(sysdate) - nvl(d.PartyBillDate, a.VoucherDate) as BillAge,',
'            a.AccountCode,',
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, t_Bill d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and b.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo != ''OPENING''',
'            and a.VoucherDate <= :P219_ASONDATE',
'            and (:P219_LOCATION IS NULL OR instr('':''||:P219_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'            and ( :P219_PARTY IS NULL OR instr('':''||:P219_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )',
'            and ( :P219_COMPANY IS NULL OR instr('':''||:P219_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
')',
'SELECT ROWNUM AS SERIALNO,',
'XX.*',
'FROM ',
'(',
'select ',
'    X.TNO,',
'    x.LocationCode,',
'    getlocationname(x.LocationCode) as Location,',
'    y.PartyName,',
'    Y.MSME,',
'    x.VoucherNo,',
'    x.Doctypecode,',
'    x.VoucherDate,',
'    x.PartyBillNo,',
'    x.PartyBillDate,    ',
'    case ',
'        when x.BillAge <= 30 then ''Up To 30''',
'        when x.BillAge between 31 and 60 then ''31-60''',
'        when x.BillAge between 61 and 90 then ''61-90''',
'        when x.BillAge between 91 and 120 then ''91-120''',
'        when x.BillAge between 121 and 150 then ''121-150''',
'        when x.BillAge between 151 and 180 then ''151-180''',
'        else ''Above 180'' ',
'    end as Age,',
'    case when y.partytypecode =''CUSTOMER'' then',
'               (-1) * x.balanceamount',
'         else x.BalanceAmount',
'     end BalanceAmount,',
'    x.AccountCode',
'from t_Balance x, Party y',
'where x.AccountCode = y.PartyCode',
'    and y.PartyTypeCode IN (''CUSTOMER'',''SUPPLIER'',''CONTRACTOR'',''TRANSPORTER'')',
'    and ( :P219_PARTYTYPE IS NULL OR instr('':''||:P219_PARTYTYPE||'':'','':''||y.PARTYTYPECODE||'':'') > 0 )',
'    and round(x.BalanceAmount, 3) != 0',
'    and ( :P219_MSME IS NULL OR NVL(Y.MSME,''NO'') = :P219_MSME )',
'order by y.PartyName, x.LocationCode, x.VoucherDate, x.VoucherNo    ',
'',
') XX'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Creditors Aging Report'
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
 p_id=>wwv_flow_imp.id(776699379691054486)
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
,p_internal_uid=>328234306659890138
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597565812404662893)
,p_db_column_name=>'ACCOUNTCODE'
,p_display_order=>100
,p_column_identifier=>'AZ'
,p_column_label=>'Accountcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597564595560662892)
,p_db_column_name=>'AGE'
,p_display_order=>80
,p_column_identifier=>'AW'
,p_column_label=>'Age'
,p_column_html_expression=>'<div style="display:block; width:80px">#AGE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597564996027662892)
,p_db_column_name=>'BALANCEAMOUNT'
,p_display_order=>90
,p_column_identifier=>'AX'
,p_column_label=>'Balance Amount'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597566608363662893)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>40
,p_column_identifier=>'BB'
,p_column_label=>'Voucher Type'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(198787626420792018)
,p_db_column_name=>'LOCATION'
,p_display_order=>140
,p_column_identifier=>'BF'
,p_column_label=>'Location'
,p_column_html_expression=>'<div style="display:block; width:110px">#LOCATION#</div>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597563058179662891)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>10
,p_column_identifier=>'AJ'
,p_column_label=>'Locationcode'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(650876333061780941)
,p_db_column_name=>'MSME'
,p_display_order=>120
,p_column_identifier=>'BD'
,p_column_label=>'Is MSME'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597564258364662892)
,p_db_column_name=>'PARTYBILLDATE'
,p_display_order=>70
,p_column_identifier=>'AV'
,p_column_label=>'Party Bill Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#PARTYBILLDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597563852930662892)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>60
,p_column_identifier=>'AU'
,p_column_label=>'Party Bill No'
,p_column_html_expression=>'<div style="display:block; width:180px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597563463608662891)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>20
,p_column_identifier=>'AK'
,p_column_label=>'Party Name'
,p_column_html_expression=>'<div style="display:block; width:180px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(595638127705044739)
,p_db_column_name=>'SERIALNO'
,p_display_order=>110
,p_column_identifier=>'BC'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(228896169946115734)
,p_db_column_name=>'TNO'
,p_display_order=>130
,p_column_identifier=>'BE'
,p_column_label=>'Tno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597566229894662893)
,p_db_column_name=>'VOUCHERDATE'
,p_display_order=>50
,p_column_identifier=>'BA'
,p_column_label=>'Voucher Date'
,p_column_html_expression=>'<div style="display:block; width:80px">#VOUCHERDATE#</div>'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597565432687662892)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>30
,p_column_identifier=>'AY'
,p_column_label=>'Voucher No'
,p_column_link=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.::P156_TNO,P156_CALLEDFROMPAGE,P156_PARTYCODE:#TNO#,219,#ACCOUNTCODE#'
,p_column_linktext=>'#VOUCHERNO#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(776735535485150603)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131208'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:LOCATION:PARTYNAME:VOUCHERNO:VOUCHERDATE:DOCTYPECODE:PARTYBILLNO:PARTYBILLDATE:AGE:BALANCEAMOUNT'
,p_sum_columns_on_break=>'PENDINGAMT:BALANCEAMOUNT'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(849795594252854962)
,p_plug_name=>'Payable/Receivable Ageing Detail Report'
,p_static_id=>'payable-receivable-ageing-detail-report-2'
,p_region_name=>'Creditors Aging Detail Report'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent1:t-Region--scrollBody'
,p_plug_template=>2664334895415463485
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_08'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(516498396122674367)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(849795594252854962)
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
 p_id=>wwv_flow_imp.id(597573452956662930)
,p_name=>'P219_ASONDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(849795594252854962)
,p_item_default=>'Trunc(Sysdate)'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'As On Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>15
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(610706258456074206)
,p_name=>'P219_COMPANY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(849795594252854962)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'Distinct',
'       p.CompanyName d,',
'       p.CompanyCode r',
'From Company p',
''))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
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
 p_id=>wwv_flow_imp.id(597573843856662930)
,p_name=>'P219_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(849795594252854962)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'  Select DISTINCT',
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
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(651717789133935945)
,p_name=>'P219_MSME'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(849795594252854962)
,p_prompt=>'Only MSME'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>'SELECT DISTINCT nvl(MSME,''NO'') FROM PARTY'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-Select -'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(615995549845795566)
,p_name=>'P219_PARTY'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(849795594252854962)
,p_prompt=>'Vendor'
,p_placeholder=>'Enter Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       p.PartyName d,',
'       p.PartyCode r',
'From  Party p ',
'Where P.PARTYTYPECODE IN (''CONTRACTOR'',''SUPPLIER'',''CUSTOMER'',''TRANSPORTER'')',
'Order By 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2526760615038828570
,p_item_template_options=>'#DEFAULT#'
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
 p_id=>wwv_flow_imp.id(597574260393662931)
,p_name=>'P219_PARTYTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(849795594252854962)
,p_prompt=>'Party Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'DISTINCT PARTYTYPECODE AS NAME,',
'PARTYTYPECODE',
'FROM PARTY where partytypecode in ',
'(''CONTRACTOR'',''SUPPLIER'',''TRANSPORTER'',''CUSTOMER'')',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select Party Type --'
,p_cHeight=>1
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(228896274554115735)
,p_name=>'P219_TNO'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(849795594252854962)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(516500863245674368)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(516501367599674368)
,p_event_id=>wwv_flow_imp.id(516500863245674368)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'plugin-ir-pagination'
,p_action=>'PLUGIN_IR.PAGINATION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'Total number of rows:',
  'attribute_02', 'First page',
  'attribute_03', 'Last page')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(228896293778115736)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'New'
,p_static_id=>'new'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :p156_partycode is not null then',
'    :P219_PARTY := :P156_PARTYCODE;',
'END IF;'))
,p_process_clob_language=>'PLSQL'
,p_internal_uid=>9875713746279003
);
wwv_flow_imp.component_end;
end;
/
