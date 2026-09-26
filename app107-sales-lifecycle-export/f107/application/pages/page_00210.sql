prompt --application/pages/page_00210
begin
--   Manifest
--     PAGE: 00210
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
 p_id=>210
,p_name=>'Payable/Receivable Aging Report'
,p_alias=>'PAYABLE-RECEIVABLE-AGING-REPORT'
,p_step_title=>'Payable/Receivable Aging Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#MYID .t-fht-thead{',
'  overflow: auto !important;',
'}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_is_public_y_n=>'Y'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(755776801205146640)
,p_plug_name=>'Creditors Aging Report'
,p_static_id=>'creditors-aging-report'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(584244068671429486)
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With t_Allocated as (',
'	select ',
'		aa.DrVoucherTNo as VoucherTNo,',
'		aa.DrVoucherSNo as VoucherSNo,',
'		round(-1 * sum(aa.Amount),2) as AllocatedAmount ',
'	from DrCrAllocation aa, Voucher bb, Voucher cc ',
'	where aa.DrVoucherTNo = bb.TNo',
'		and aa.CrVoucherTNo = cc.TNo',
'        and bb.VoucherDate <= :P210_ASONDATE',
'        and cc.VoucherDate <= :P210_ASONDATE',
'	group by ',
'		aa.DrVoucherTNo,',
'		aa.DrVoucherSNo',
'	union all',
'	select ',
'		aa.CrVoucherTNo as VoucherTNo,',
'		aa.CrVoucherSNo as VoucherSNo,',
'		round(sum(aa.Amount),2) as AllocatedAmount',
'	from DrCrAllocation aa, Voucher bb, Voucher cc ',
'	where aa.DrVoucherTNo = bb.TNo',
'		and aa.CrVoucherTNo = cc.TNo',
'        and bb.VoucherDate <= :P210_ASONDATE',
'        and cc.VoucherDate <= :P210_ASONDATE',
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
'	',
'	-- select ',
'	-- 	aa.TNo,',
'	-- 	aa.PartyBillNo,',
'	-- 	aa.PartyBillDate',
'	-- from CashPurchase aa',
'	-- union all',
'	-- select ',
'	-- 	aa.TNo,',
'	-- 	aa.PartyBillNo,',
'	-- 	aa.PartyBillDate',
'	-- from MiscellaneousExpense aa',
'	-- union all',
'	-- select ',
'	-- 	aa.TNo,',
'	-- 	aa.BillNo AS PartyBillNo,',
'	-- 	aa.BillDate as PartyBillDate',
'	-- from ExternalServicesEntry aa',
'	-- union all',
'	-- select ',
'	-- 	aa.TNo,',
'	-- 	aa.PartyBillNo,',
'	-- 	aa.PartyBillDate',
'	-- from NecessityCompletion aa',
'---- Dt.22-May-2023',
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
'            a.LocationCode,',
'            d.BillNo as PartyBillNo,',
'            d.BillDate as PartyBillDate,',
'            trunc(sysdate) - nvl(d.BillDate, a.VoucherDate) as BillAge,',
'            a.AccountCode,',
'            round(a.Amount,2) as VoucherAmount,',
'            round(c.AllocatedAmount,2) as AllocatedAmount,',
'            round(a.Amount - nvl(c.AllocatedAmount, 0),2) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, AccountOpening d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and a.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo = ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= :P210_ASONDATE',
'            and ( :P210_LOCATION IS NULL OR instr('':''||:P210_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'            and ( :P210_PARTY IS NULL OR instr('':''||:P210_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )',
'             and ( :P210_COMPANY IS NULL OR instr('':''||:P210_COMPANY||'':'','':''||B.CompanyCode||'':'') > 0 )',
'             and a.LocationCode is not null   ',
'        union all',
'        select ',
'            a.TNo,',
'            a.SNo,',
'            a.VoucherDate,',
'            b.VoucherNo,',
'            a.LocationCode,',
'            d.PartyBillNo,',
'            d.PartyBillDate,',
'            trunc(sysdate) - nvl(d.PartyBillDate, a.VoucherDate) as BillAge,',
'            a.AccountCode,',
'            round(a.Amount,2) as VoucherAmount,',
'            round(c.AllocatedAmount,2) as AllocatedAmount,',
'            round(a.Amount - nvl(c.AllocatedAmount, 0),2) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, t_Bill d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and b.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo != ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= :P210_ASONDATE',
'            and ( :P210_LOCATION IS NULL OR instr('':''||:P210_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'            and ( :P210_PARTY IS NULL OR instr('':''||:P210_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )',
'            and ( :P210_COMPANY IS NULL OR instr('':''||:P210_COMPANY||'':'','':''||B.CompanyCode||'':'') > 0 )',
'            and a.LocationCode is not null',
')  ',
'select rownum as serialno, xx.* from (',
'select ',
'   --rownum as serialno,',
'    --x.LocationCode,',
'    y.PartyName,',
'    Y.MSME, ',
'    case when y.PARTYTYPECODE = ''CUSTOMER''THEN ',
'              sum(case when x.BillAge <= 30 then (-1) * x.BalanceAmount else 0 end) ',
'         ELSE sum(case when x.BillAge <= 30 then x.BalanceAmount else 0 end)',
'     END as Balance0t30,',
'     case when y.PARTYTYPECODE = ''CUSTOMER''THEN ',
'                sum(case when x.BillAge between 31 and 60  then (-1) * x.BalanceAmount else 0 end) ',
'           ELSE sum(case when x.BillAge between 31 and 60  then  x.BalanceAmount else 0 end)  ',
'     END as Balance31to60,',
'    case when y.PARTYTYPECODE = ''CUSTOMER''THEN ',
'              sum(case when x.BillAge between 61 and 90  then (-1) * x.BalanceAmount else 0 end) ',
'         else sum(case when x.BillAge between 61 and 90  then x.BalanceAmount else 0 end)',
'    END as Balance61to90,',
'    ',
'    case when y.PARTYTYPECODE = ''CUSTOMER''THEN ',
'                sum(case when x.BillAge between 91 and 120  then (-1) * x.BalanceAmount else 0 end)',
'         else sum(case when x.BillAge between 91 and 120  then x.BalanceAmount else 0 end)',
'    end as Balance91to120,',
'    ',
'    case when y.PARTYTYPECODE = ''CUSTOMER''THEN ',
'                sum(case when x.BillAge between 121 and 150  then (-1) * x.BalanceAmount else 0 end) ',
'         else sum(case when x.BillAge between 121 and 150  then x.BalanceAmount else 0 end) ',
'    end as Balance121to150,',
'',
'    case when y.PARTYTYPECODE = ''CUSTOMER''THEN',
'              sum(case when x.BillAge between 151 and 180  then (-1) * x.BalanceAmount else 0 end) ',
'         else sum(case when x.BillAge between 151 and 180  then x.BalanceAmount else 0 end)',
'    end as Balance151to180,',
'',
'    case when y.PARTYTYPECODE = ''CUSTOMER''THEN',
'              sum(case when x.BillAge > 180 then (-1) * x.BalanceAmount else 0 end) ',
'         else sum(case when x.BillAge > 180 then x.BalanceAmount else 0 end) ',
'    end as BalanceAbove180,',
'',
'    case when y.PARTYTYPECODE = ''CUSTOMER''THEN',
'            (-1) * round(sum(x.BalanceAmount),2) ',
'         else round(sum(x.BalanceAmount),2)',
'    end as TotalBalance,',
'      X.AccountCode',
'from t_Balance x, Party y',
'where x.AccountCode = y.PartyCode',
'    and y.PartyTypeCode IN (''CUSTOMER'',''SUPPLIER'',''CONTRACTOR'',''TRANSPORTER'',''AGENT'')',
'    and ( :P210_PARTYTYPE IS NULL OR instr('':''||:P210_PARTYTYPE||'':'','':''||y.PARTYTYPECODE||'':'') > 0 )',
'    and :P210_ASONDATE is not null',
'   and ( :P210_MSME IS NULL OR NVL(Y.MSME,''NO'') = :P210_MSME )',
'group by  --x.LocationCode,',
'    y.PartyName,',
'    x.AccountCode,',
'    y.PARTYTYPECODE,',
'    Y.MSME',
'    --rownum',
'having round(sum(x.BalanceAmount), 3) != 0',
'order by y.PartyName --, x.LocationCode',
')  xx',
'',
''))
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
 p_id=>wwv_flow_imp.id(711831253216810004)
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
,p_internal_uid=>263366180185645656
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597540420793603608)
,p_db_column_name=>'ACCOUNTCODE'
,p_display_order=>40
,p_column_identifier=>'AU'
,p_column_label=>'Accountcode'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(619669747039498601)
,p_db_column_name=>'BALANCE0T30'
,p_display_order=>50
,p_column_identifier=>'BY'
,p_column_label=>'Balance 0 TO 30'
,p_column_html_expression=>'<div style="display:block; width:100px">#BALANCE0T30#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(619670146354498605)
,p_db_column_name=>'BALANCE121TO150'
,p_display_order=>90
,p_column_identifier=>'CC'
,p_column_label=>'Balance 121 TO 150'
,p_column_html_expression=>'<div style="display:block; width:100px">#BALANCE121TO150#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(619670302475498606)
,p_db_column_name=>'BALANCE151TO180'
,p_display_order=>100
,p_column_identifier=>'CD'
,p_column_label=>'Balance 151 TO 180'
,p_column_html_expression=>'<div style="display:block; width:100px">#BALANCE151TO180#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(619669923889498602)
,p_db_column_name=>'BALANCE31TO60'
,p_display_order=>60
,p_column_identifier=>'BZ'
,p_column_label=>'Balance 31 TO 60'
,p_column_html_expression=>'<div style="display:block; width:100px">#BALANCE31TO60#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(619669991826498603)
,p_db_column_name=>'BALANCE61TO90'
,p_display_order=>70
,p_column_identifier=>'CA'
,p_column_label=>'Balance 61 TO 90'
,p_column_html_expression=>'<div style="display:block; width:100px">#BALANCE61TO90#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(619670072537498604)
,p_db_column_name=>'BALANCE91TO120'
,p_display_order=>80
,p_column_identifier=>'CB'
,p_column_label=>'Balance 91 TO 120'
,p_column_html_expression=>'<div style="display:block; width:100px">#BALANCE91TO120#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(619670367615498607)
,p_db_column_name=>'BALANCEABOVE180'
,p_display_order=>110
,p_column_identifier=>'CE'
,p_column_label=>'Balance Above 180'
,p_column_html_expression=>'<div style="display:block; width:100px">#BALANCEABOVE180#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(650864568707776003)
,p_db_column_name=>'MSME'
,p_display_order=>20
,p_column_identifier=>'CG'
,p_column_label=>'Is MSME'
,p_column_html_expression=>'<div style="display:block; width:80px">#MSME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(597536790843603606)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>30
,p_column_identifier=>'AK'
,p_column_label=>'Party Name'
,p_column_link=>'f?p=&APP_ID.:219:&SESSION.::&DEBUG.:219:P219_PARTY,P219_ASONDATE,P219_COMPANY,P219_LOCATION,P219_MSME:#ACCOUNTCODE#,&P170_ASONDATE.,&P170_COMPANY.,&P170_LOCATION.,#MSME##LOCATIONCODE#,#ACCOUNTCODE#,&P170_ASONDATE.'
,p_column_linktext=>'#PARTYNAME#'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(608698772936841610)
,p_db_column_name=>'SERIALNO'
,p_display_order=>10
,p_column_identifier=>'BL'
,p_column_label=>'Serial No'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(619670477158498608)
,p_db_column_name=>'TOTALBALANCE'
,p_display_order=>120
,p_column_identifier=>'CF'
,p_column_label=>'Total Balance'
,p_column_html_expression=>'<div style="display:block; width:100px">#TOTALBALANCE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(711867409010906121)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131069'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:PARTYNAME:MSME:BALANCE0T30:BALANCE31TO60:BALANCE61TO90:BALANCE91TO120:BALANCE121TO150:BALANCE151TO180:BALANCEABOVE180:TOTALBALANCE'
,p_sort_column_1=>'SERIALNO'
,p_sort_direction_1=>'ASC'
,p_sum_columns_on_break=>'PENDINGAMT:TOTALBALANCE:BALANCE0T30:BALANCE31TO60:BALANCE61TO90:BALANCE91TO120:BALANCE121TO150:BALANCE151TO180:BALANCEABOVE180'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(784927467778610480)
,p_plug_name=>'Payble/Receivable Aging Report'
,p_static_id=>'payble-receivable-aging-report'
,p_region_name=>'Bill Age Summary'
,p_region_template_options=>'#DEFAULT#:t-Region--hideShowIconsMath:is-collapsed:t-Region--accent15:t-Region--scrollBody'
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
 p_id=>wwv_flow_imp.id(516487206320669506)
,p_button_sequence=>110
,p_button_plug_id=>wwv_flow_imp.id(784927467778610480)
,p_button_name=>'ALL'
,p_static_id=>'all'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'All'
,p_button_redirect_url=>'f?p=&APP_ID.:306:&SESSION.::&DEBUG.:306:P306_ASONDATE,P306_LOCATION,P306_PARTY,P306_PARTYTYPE:&P210_ASONDATE.,&P210_LOCATION.,&P210_PARTY.,&P210_PARTYTYPE.'
,p_icon_css_classes=>'fa-all'
,p_grid_new_row=>'N'
,p_grid_column=>11
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(516486785666669506)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(784927467778610480)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>4072362960822175091
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column=>9
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(597548688291603721)
,p_name=>'P210_ASONDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(784927467778610480)
,p_prompt=>'As On Date'
,p_placeholder=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>15
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
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
 p_id=>wwv_flow_imp.id(656922711205265707)
,p_name=>'P210_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(784927467778610480)
,p_prompt=>'Company'
,p_placeholder=>'Enter Company Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'Distinct',
'       p.CompanyName d,',
'       p.CompanyCode r',
'From VoucherDetail a, Company p',
'Where a.CompanyCode = p.CompanyCode',
'',
'',
'',
'',
'',
'',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(597549064505603721)
,p_name=>'P210_LOCATION'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(784927467778610480)
,p_prompt=>'Location'
,p_placeholder=>'Enter Location Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ',
'distinct',
'  a.LocationName D,',
'  a.LocationCode R',
'From Location a',
'',
'',
'',
'',
'',
''))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
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
 p_id=>wwv_flow_imp.id(650870277569776115)
,p_name=>'P210_MSME'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(784927467778610480)
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(658315490346632550)
,p_name=>'P210_PARTY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(784927467778610480)
,p_prompt=>'Vendor'
,p_placeholder=>'Enter Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'distinct',
'       p.PartyName d,',
'       p.PartyCode r',
'From  Party p ',
'Where P.PARTYTYPECODE IN (''CONTRACTOR'',''SUPPLIER'',''CUSTOMER'',''TRANSPORTER'')',
'Order By 1',
'',
'',
'',
'',
'',
''))
,p_cSize=>30
,p_colspan=>4
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
 p_id=>wwv_flow_imp.id(597549473970603722)
,p_name=>'P210_PARTYTYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(784927467778610480)
,p_prompt=>'Party Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'DISTINCT PARTYTYPECODE AS NAME,',
'PARTYTYPECODE',
'FROM PARTY where partytypecode in ',
'(''CONTRACTOR'',''SUPPLIER'',''TRANSPORTER'',''CUSTOMER'')',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select Party Type --'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_warn_on_unsaved_changes=>'I'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'N',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(199229019375260050)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>20
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(199229398977260050)
,p_event_id=>wwv_flow_imp.id(199229019375260050)
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
