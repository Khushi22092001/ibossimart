prompt --application/pages/page_00520
begin
--   Manifest
--     PAGE: 00520
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
 p_id=>520
,p_name=>'Account Dashboard'
,p_alias=>'ACCOUNT-DASHBOARD'
,p_step_title=>'Account Dashboard'
,p_autocomplete_on_off=>'OFF'
,p_javascript_code=>'var orig = "x";'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.mycardtext{color:white;}',
'.mycardsize{font-size: 15px;font-weight:bold;}',
'.mycardbluetext{color:blue}',
':mycardsubtitlesize{font-size: 20px;font-weight:bold;}'))
,p_step_template=>4072355960268175073
,p_page_template_options=>'#DEFAULT#'
,p_page_component_map=>'23'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(461203292285233128)
,p_plug_name=>'Account  Payable'
,p_static_id=>'account-payable'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''SUPPLIER'' || '':'' || ''TRANSPORTER''||'':'' || ''CONTRACTOR:'' AS PARTYTYPE,',
'''No Of Party  : '' || to_char(Count(Distinct XX.AccountCode)) As NoofParty,',
'       ''No of Bills  : '' || to_char(Count(Distinct XX.Voucherno)) As NoofBills,',
unistr('       ''\20B9 '' ||'),
'       to_number(Round(Sum(XX.TotalBalance) / 100000, 2), ''99999999999.99'') ||',
'       '' Lac'' Value,',
'''Total Payable'' as Text,',
'''u-color-14'' as card_color',
'From ',
'(With t_Allocated as (',
'	select ',
'		aa.DrVoucherTNo as VoucherTNo,',
'		aa.DrVoucherSNo as VoucherSNo,',
'		-1 * sum(aa.Amount) as AllocatedAmount ',
'	from DrCrAllocation aa, Voucher bb, Voucher cc ',
'	where aa.DrVoucherTNo = bb.TNo',
'		and aa.CrVoucherTNo = cc.TNo',
'        and bb.VoucherDate <= :P520_ASONDATE',
'        and cc.VoucherDate <= :P520_ASONDATE',
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
'        and bb.VoucherDate <= :P520_ASONDATE',
'        and cc.VoucherDate <= :P520_ASONDATE',
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
'/*	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from CashPurchase aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from MiscellaneousExpense aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.BillNo AS PartyBillNo,',
'		aa.BillDate as PartyBillDate',
'	from ExternalServicesEntry aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from NecessityCompletion aa',
'    */',
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
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, AccountOpening d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and a.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo = ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= :P520_ASONDATE',
'            and ( :P520_LOCATION IS NULL OR instr('':''||:P520_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'            and ( :P520_PARTY IS NULL OR instr('':''||:P520_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )    ',
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
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, t_Bill d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and b.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo != ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= :P520_ASONDATE',
'            and ( :P520_LOCATION IS NULL OR instr('':''||:P520_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'            and ( :P520_PARTY IS NULL OR instr('':''||:P520_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )  ',
')',
'select ',
'    x.LocationCode,',
'    y.PartyName,',
'    x.voucherno,',
'    x.partybillNo as BillNo,',
'    sum(case when x.BillAge <= 15 then x.BalanceAmount else 0 end) as Balance0to15,',
'    sum(case when x.BillAge between 16 and 30  then x.BalanceAmount else 0 end) as Balance15to30,',
'    sum(case when x.BillAge between 31 and 45  then x.BalanceAmount else 0 end) as Balance31to45,',
'    sum(case when x.BillAge between 46 and 60  then x.BalanceAmount else 0 end) as Balance46to60,',
'    sum(case when x.BillAge between 61 and 90  then x.BalanceAmount else 0 end) as Balance61to90,',
'    sum(case when x.BillAge between 91 and 120  then x.BalanceAmount else 0 end) as Balance91to120,',
'    sum(case when x.BillAge between 121 and 150  then x.BalanceAmount else 0 end) as Balance121to150,',
'    sum(case when x.BillAge between 151 and 180  then x.BalanceAmount else 0 end) as Balance151to180,',
'    sum(case when x.BillAge >= 181  then x.BalanceAmount else 0 end) as BalanceAbove180,',
'    sum(x.BalanceAmount) as TotalBalance,',
'    X.AccountCode',
'from t_Balance x, Party y',
'where x.AccountCode = y.PartyCode',
'    and y.PartyTypeCode IN (''SUPPLIER'',''CONTRACTOR'',''TRANSPORTER'') --''CUSTOMER''',
'    and ( :P520_PARTYTYPE IS NULL OR instr('':''||:P520_PARTYTYPE||'':'','':''||y.PARTYTYPECODE||'':'') > 0 )',
'group by  x.LocationCode,',
'    y.PartyName,',
'    x.AccountCode,',
'    x.voucherno,',
'    x.Partybillno',
'having round(sum(x.BalanceAmount), 3) != 0',
'order by y.PartyName, x.LocationCode',
') XX'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433982465501462192)
,p_region_id=>wwv_flow_imp.id(461203292285233128)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_body_column_name=>'NOOFPARTY'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'NOOFBILLS'
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433982891806462193)
,p_card_id=>wwv_flow_imp.id(433982465501462192)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP,210:P210_ASONDATE,P210_PARTYTYPE,P210_LOCATION:&P520_ASONDATE.,&PARTYTYPE.,HO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(453838591219764942)
,p_plug_name=>'Account payble Party Wise'
,p_static_id=>'account-payble-party-wise'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433957362852462165)
,p_region_id=>wwv_flow_imp.id(453838591219764942)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'slideToLeft'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433957872155462166)
,p_chart_id=>wwv_flow_imp.id(433957362852462165)
,p_static_id=>'payable-party-wise'
,p_seq=>10
,p_name=>'PAYABLE PARTY WISE'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select xx.accountcode,xx.partyname,sum(xx.totalbalance) as TotalBalance',
'From ',
'(With t_Allocated as (',
'	select ',
'		aa.DrVoucherTNo as VoucherTNo,',
'		aa.DrVoucherSNo as VoucherSNo,',
'		-1 * sum(aa.Amount) as AllocatedAmount ',
'	from DrCrAllocation aa, Voucher bb, Voucher cc ',
'	where aa.DrVoucherTNo = bb.TNo',
'		and aa.CrVoucherTNo = cc.TNo',
'        and bb.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
'        and cc.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
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
'        and bb.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
'        and cc.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
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
'/*	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from CashPurchase aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from MiscellaneousExpense aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.BillNo AS PartyBillNo,',
'		aa.BillDate as PartyBillDate',
'	from ExternalServicesEntry aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from NecessityCompletion aa',
'  */',
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
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, AccountOpening d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and a.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo = ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
'         --   and ( :P520_LOCATION IS NULL OR instr('':''||:P520_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'         --   and ( :P520_PARTY IS NULL OR instr('':''||:P520_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )    ',
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
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, t_Bill d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and b.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo != ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
'         --   and ( :P520_LOCATION IS NULL OR instr('':''||:P520_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'         --   and ( :P520_PARTY IS NULL OR instr('':''||:P520_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )  ',
')',
'select ',
'    x.LocationCode,',
'    y.PartyName,',
'    x.voucherno,',
'    x.partybillNo as BillNo,',
'    sum(x.BalanceAmount) as TotalBalance,',
'    X.AccountCode',
'from t_Balance x, Party y',
'where x.AccountCode = y.PartyCode',
'    and y.PartyTypeCode IN (''SUPPLIER'',''CONTRACTOR'',''TRANSPORTER'') --''CUSTOMER''',
'  --  and ( :P520_PARTYTYPE IS NULL OR instr('':''||:P520_PARTYTYPE||'':'','':''||y.PARTYTYPECODE||'':'') > 0 )',
'group by  x.LocationCode,',
'    y.PartyName,',
'    x.AccountCode,',
'    x.voucherno,',
'    x.Partybillno',
'having round(sum(x.BalanceAmount), 3) != 0',
'order by y.PartyName, x.LocationCode',
') XX ',
'group by xx.accountcode,xx.partyname',
'order by 3 desc'))
,p_series_type=>'pie'
,p_items_value_column_name=>'TOTALBALANCE'
,p_items_label_column_name=>'PARTYNAME'
,p_items_short_desc_column_name=>'PARTYNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'ALL'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP,210:P210_ASONDATE,P210_PARTY:&P520_ASONDATE.,&ACCOUNTCODE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(453838060414764937)
,p_plug_name=>'Account  Receivable'
,p_static_id=>'account-receivable'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'''No Of Party  : '' || to_char(Count(Distinct XX.AccountCode)) As NoofParty,',
'       ''No of Bills  : '' || to_char(Count(Distinct XX.Voucherno)) As NoofBills,',
unistr('       ''\20B9 '' ||'),
'       to_number(Round(Sum(XX.TotalBalance) / 100000, 2), ''99999999999.99'') ||',
'       '' Lac'' Value,',
'''Total Receivable'' as Text,',
'''u-color-22'' as card_color',
'From ',
'(With t_Allocated as (',
'	select ',
'		aa.DrVoucherTNo as VoucherTNo,',
'		aa.DrVoucherSNo as VoucherSNo,',
'		-1 * sum(aa.Amount) as AllocatedAmount ',
'	from DrCrAllocation aa, Voucher bb, Voucher cc ',
'	where aa.DrVoucherTNo = bb.TNo',
'		and aa.CrVoucherTNo = cc.TNo',
'        and bb.VoucherDate <= :P520_ASONDATE',
'        and cc.VoucherDate <= :P520_ASONDATE',
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
'        and bb.VoucherDate <= :P520_ASONDATE',
'        and cc.VoucherDate <= :P520_ASONDATE',
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
'/*	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from CashPurchase aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from MiscellaneousExpense aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.BillNo AS PartyBillNo,',
'		aa.BillDate as PartyBillDate',
'	from ExternalServicesEntry aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from NecessityCompletion aa',
'  */',
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
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, AccountOpening d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and a.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo = ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= :P520_ASONDATE',
'            and ( :P520_LOCATION IS NULL OR instr('':''||:P520_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'            and ( :P520_PARTY IS NULL OR instr('':''||:P520_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )    ',
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
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, t_Bill d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and b.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo != ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= :P520_ASONDATE',
'            and ( :P520_LOCATION IS NULL OR instr('':''||:P520_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'            and ( :P520_PARTY IS NULL OR instr('':''||:P520_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )  ',
')',
'select ',
'    x.LocationCode,',
'    y.PartyName,',
'    x.voucherno,',
'    x.partybillNo as BillNo,',
'    sum(case when x.BillAge <= 15 then x.BalanceAmount else 0 end) as Balance0to15,',
'    sum(case when x.BillAge between 16 and 30  then x.BalanceAmount else 0 end) as Balance15to30,',
'    sum(case when x.BillAge between 31 and 45  then x.BalanceAmount else 0 end) as Balance31to45,',
'    sum(case when x.BillAge between 46 and 60  then x.BalanceAmount else 0 end) as Balance46to60,',
'    sum(case when x.BillAge between 61 and 90  then x.BalanceAmount else 0 end) as Balance61to90,',
'    sum(case when x.BillAge between 91 and 120  then x.BalanceAmount else 0 end) as Balance91to120,',
'    sum(case when x.BillAge between 121 and 150  then x.BalanceAmount else 0 end) as Balance121to150,',
'    sum(case when x.BillAge between 151 and 180  then x.BalanceAmount else 0 end) as Balance151to180,',
'    sum(case when x.BillAge >= 181  then x.BalanceAmount else 0 end) as BalanceAbove180,',
'    sum(x.BalanceAmount) as TotalBalance,',
'    X.AccountCode',
'from t_Balance x, Party y',
'where x.AccountCode = y.PartyCode',
'    and y.PartyTypeCode IN (''CUSTOMER'') --,''SUPPLIER'',''CONTRACTOR'',''TRANSPORTER'')',
'    and ( :P520_PARTYTYPE IS NULL OR instr('':''||:P520_PARTYTYPE||'':'','':''||y.PARTYTYPECODE||'':'') > 0 )',
'group by  x.LocationCode,',
'    y.PartyName,',
'    x.AccountCode,',
'    x.voucherno,',
'    x.Partybillno',
'having round(sum(x.BalanceAmount), 3) != 0',
'order by y.PartyName, x.LocationCode',
') XX'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433966259081462175)
,p_region_id=>wwv_flow_imp.id(453838060414764937)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_body_column_name=>'NOOFPARTY'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'NOOFBILLS'
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433966715250462176)
,p_card_id=>wwv_flow_imp.id(433966259081462175)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP,210:P210_ASONDATE,P210_PARTYTYPE,P210_LOCATION:&P520_ASONDATE.,CUSTOMER,HO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(453839277022764949)
,p_plug_name=>'Account  Receivable Party Wise'
,p_static_id=>'account-receivable-party-wise'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>70
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433958752725462168)
,p_region_id=>wwv_flow_imp.id(453839277022764949)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'slideToLeft'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433959199869462169)
,p_chart_id=>wwv_flow_imp.id(433958752725462168)
,p_static_id=>'receivable-party-wise'
,p_seq=>10
,p_name=>'RECEIVABLE PARTY WISE'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select xx.accountcode,xx.partyname,sum(xx.totalbalance) as TotalBalance',
'From ',
'(With t_Allocated as (',
'	select ',
'		aa.DrVoucherTNo as VoucherTNo,',
'		aa.DrVoucherSNo as VoucherSNo,',
'		-1 * sum(aa.Amount) as AllocatedAmount ',
'	from DrCrAllocation aa, Voucher bb, Voucher cc ',
'	where aa.DrVoucherTNo = bb.TNo',
'		and aa.CrVoucherTNo = cc.TNo',
'        and bb.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
'        and cc.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
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
'        and bb.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
'        and cc.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
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
'/*	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from CashPurchase aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from MiscellaneousExpense aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.BillNo AS PartyBillNo,',
'		aa.BillDate as PartyBillDate',
'	from ExternalServicesEntry aa',
'	union all',
'	select ',
'		aa.TNo,',
'		aa.PartyBillNo,',
'		aa.PartyBillDate',
'	from NecessityCompletion aa',
'*/',
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
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, AccountOpening d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and a.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo = ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
'         --   and ( :P520_LOCATION IS NULL OR instr('':''||:P520_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'         --   and ( :P520_PARTY IS NULL OR instr('':''||:P520_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )    ',
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
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, t_Bill d ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and b.ModuleTNo = d.TNo(+)',
'            and b.VoucherNo != ''OPENING''',
'            and round(a.Amount - nvl(c.AllocatedAmount, 0), 0) != 0',
'            and a.VoucherDate <= NVL(:P520_ASONDATE,TRUNC(SYSDATE))',
'         --   and ( :P520_LOCATION IS NULL OR instr('':''||:P520_LOCATION||'':'','':''||a.LocationCode||'':'') > 0 )',
'         --   and ( :P520_PARTY IS NULL OR instr('':''||:P520_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )  ',
')',
'select ',
'    x.LocationCode,',
'    y.PartyName,',
'    x.voucherno,',
'    x.partybillNo as BillNo,',
'    sum(x.BalanceAmount) as TotalBalance,',
'    X.AccountCode',
'from t_Balance x, Party y',
'where x.AccountCode = y.PartyCode',
'    and y.PartyTypeCode IN (''CUSTOMER'') --''SUPPLIER'',''CONTRACTOR'',''TRANSPORTER'') --''CUSTOMER''',
'  --  and ( :P520_PARTYTYPE IS NULL OR instr('':''||:P520_PARTYTYPE||'':'','':''||y.PARTYTYPECODE||'':'') > 0 )',
'group by  x.LocationCode,',
'    y.PartyName,',
'    x.AccountCode,',
'    x.voucherno,',
'    x.Partybillno',
'having round(sum(x.BalanceAmount), 3) != 0',
'order by y.PartyName, x.LocationCode',
') XX ',
'group by xx.accountcode,xx.partyname',
'order by 3 desc'))
,p_series_type=>'pie'
,p_items_value_column_name=>'TOTALBALANCE'
,p_items_label_column_name=>'PARTYNAME'
,p_items_short_desc_column_name=>'PARTYNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'ALL'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:RP,210:P210_ASONDATE,P210_PARTY,P210_LOCATION:&P520_ASONDATE.,&ACCOUNTCODE.,CO'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454117699007899028)
,p_plug_name=>'Bank Balance'
,p_static_id=>'bank-balance'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>140
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(c.financialyearbegin,''DD-MM-YYYY'') AS FromDate,',
'       A.PARTYCODE,',
'       GETPARTYNAME(A.PARTYCODE),',
'       B.BRANCHCODE,',
'       B.BSRCODE,',
unistr('    --   ''Opening  : \20B9  ''|| getaccountbalancewithdrcr(a.partycode, nvl((to_date(:P520_ASONDATE,''dd-mon-YYYY'') - 1), sysdate - 1), ''CO'', ''1'') As OPENING,'),
unistr('    --   ''Closing  : \20B9  ''|| getaccountbalancewithdrcr(a.partycode, nvl(:P520_ASONDATE,Sysdate), ''CO'', ''1'') As CLOSING,'),
unistr('    --   ''Transaction    Cr. : \20B9  ''||getaccountcreditduring(A.PARTYCODE, ''1'',nvl(:P520_ASONDATE,Sysdate), nvl(:P520_ASONDATE,Sysdate))||''  Dr. ''||'),
unistr('    --   '' \20B9  ''||getaccountdebitduring(A.PARTYCODE, ''1'', nvl(:P520_ASONDATE,Sysdate),nvl(:P520_ASONDATE,Sysdate)) As Transaction,'),
'       ''BANK BALANCE'' As Text,',
'       ''u-color-18'' As card_color',
'',
'  From party a, BANK B, Financialyear c',
' Where a.partytypecode = ''BANK''',
'   And A.BANKCODE = B.BANKCODE',
'   and nvl(:P520_ASONDATE,Sysdate) between c.financialyearbegin and c.financialyearend',
'',
'/*Select ''No Of Party  : '' || to_char(Count(Distinct A.partyCode)) As NoofParty,',
'       ''No of Bills  : '' || to_char(Count(Distinct A.ReferenceModuleTno)) As NoofBills,',
unistr('       ''\20B9 '' || to_number(Round(Sum(a.creditnoteamount) / 100000, 2),'),
'                         ''99999999999.99'') || '' Lac'' Value,',
'       ''Total Debit Note'' As Text,',
'       ''u-color-18'' As card_color',
'',
'  From CREDITNOTE A',
' Where a.creditnotedate <= Nvl(:P520_ASONDATE, Trunc(Sysdate));',
' */'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433967700496462177)
,p_region_id=>wwv_flow_imp.id(454117699007899028)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'GETPARTYNAME(A.PARTYCODE)'
,p_sub_title_adv_formatting=>false
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433968231437462177)
,p_card_id=>wwv_flow_imp.id(433967700496462177)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:252:&SESSION.::&DEBUG.:RP,252:P252_FROMDATE,P252_TODATE,P252_LOCATIONCODE,P252_PARTYCODE:&P520_ASONDATE.,&P520_ASONDATE.,HO,&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(461724870304539186)
,p_plug_name=>'Button'
,p_static_id=>'button'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>2126429139436695430
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454117971022899031)
,p_plug_name=>'Cash Balance'
,p_static_id=>'cash-balance'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>150
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(c.financialyearbegin,''DD-MM-RRRR'') AS FromDate,',
'       A.PARTYCODE,',
'       GETPARTYNAME(A.PARTYCODE),',
unistr('        ''Opening  : \20B9  ''|| getaccountbalancewithdrcr(a.partycode, nvl((to_date(:P520_ASONDATE,''dd-MM-YYYY'') - 1), sysdate - 1), NULL, ''1'') As OPENING,'),
unistr('       ''Closing  : \20B9  ''|| getaccountbalancewithdrcr(a.partycode, nvl(:P520_ASONDATE,Sysdate), NULL, ''1'') As CLOSING,'),
unistr('       ''Transaction    Cr. : \20B9  ''||getaccountcreditduring(A.PARTYCODE, ''1'',nvl(:P520_ASONDATE,Sysdate), nvl(:P520_ASONDATE,Sysdate))||''  Dr. ''||'),
unistr('       '' \20B9  ''||getaccountdebitduring(A.PARTYCODE, ''1'', nvl(:P520_ASONDATE,Sysdate),nvl(:P520_ASONDATE,Sysdate)) As Transaction,'),
'       ''BANK BALANCE'' As Text,',
'       ''u-color-26'' As card_color',
'',
'  From party a, Financialyear c',
' Where a.partytypecode = ''CASH''',
'   and nvl(:P520_ASONDATE,Sysdate) between c.financialyearbegin and c.financialyearend',
'',
'/*Select ''No Of Party  : '' || to_char(Count(Distinct A.partyCode)) As NoofParty,',
'       ''No of Bills  : '' || to_char(Count(Distinct A.ReferenceModuleTno)) As NoofBills,',
unistr('       ''\20B9 '' || to_number(Round(Sum(a.creditnoteamount) / 100000, 2),'),
'                         ''99999999999.99'') || '' Lac'' Value,',
'       ''Total Debit Note'' As Text,',
'       ''u-color-30'' As card_color',
'',
'  From CREDITNOTE A',
' Where a.creditnotedate <= Nvl(:P520_ASONDATE, Trunc(Sysdate));',
' */'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433969533937462178)
,p_region_id=>wwv_flow_imp.id(454117971022899031)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'GETPARTYNAME(A.PARTYCODE)'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'OPENING'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_body_column_name=>'CLOSING'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'TRANSACTION'
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433970003872462178)
,p_card_id=>wwv_flow_imp.id(433969533937462178)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:252:&SESSION.::&DEBUG.:RP,252:P252_FROMDATE,P252_TODATE,P252_PARTYCODE:&P520_ASONDATE.,&P520_ASONDATE.,&PARTYCODE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(453841271511764969)
,p_plug_name=>'Credit Note'
,p_static_id=>'credit-note'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>120
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''No Of Party  : '' || to_char(Count(Distinct A.partyCode)) As NoofParty,',
'       ''No of Bills  : '' || to_char(Count(Distinct A.ReferenceModuleTno)) As NoofBills,',
unistr('       ''\20B9 '' || to_number(Round(Sum(a.creditnoteamount) / 100000, 2),'),
'                         ''99999999999.99'') || '' Lac'' Value,',
'       ''Total Credit Note'' As Text,',
'       ''u-color-18'' As card_color',
'',
'  From CREDITNOTE A',
' Where a.creditnotedate <= Nvl(:P520_ASONDATE, Trunc(Sysdate));'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433961772258462171)
,p_region_id=>wwv_flow_imp.id(453841271511764969)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_body_column_name=>'NOOFPARTY'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'NOOFBILLS'
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433962200324462171)
,p_card_id=>wwv_flow_imp.id(433961772258462171)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:RP,165:P165_FROMDATE,P165_PARTY,P165_LOCATION,P165_TODATE:&GLOBAL_FINANCIALYEARBEGIN.,CUSTOMER,HO,&P520_ASONDATE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454117395149899025)
,p_plug_name=>'Credit Note Party Wise'
,p_static_id=>'credit-note-party-wise'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>130
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433964731725462172)
,p_region_id=>wwv_flow_imp.id(454117395149899025)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'slideToLeft'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433965271920462172)
,p_chart_id=>wwv_flow_imp.id(433964731725462172)
,p_static_id=>'cr-note-party-wise'
,p_seq=>10
,p_name=>'CR NOTE PARTY WISE'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(b.financialyearbegin,''DD-MON-YYYY'') AS FromDate,',
'       a.partycode,',
'       getpartyname(a.partycode) As partyname,',
'       Sum(a.creditnoteamount) As Amount',
'       ',
'  From CREDITNOTE A, Financialyear b',
' Where a.creditnotedate <= Nvl(:P520_ASONDATE, Trunc(Sysdate))',
'   And a.creditnotedate Between b.financialyearbegin And b.financialyearend',
' Group By a.partycode, getpartyname(a.partycode), b.financialyearbegin',
' Order By 3 Desc',
''))
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_items_short_desc_column_name=>'PARTYNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'ALL'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:RP,159:P159_TODATE,P159_PARTYCODE,P159_LOCATION,P159_FROMDATE,P159_COMPANY:&P520_ASONDATE.,&PARTYCODE.,HO,&FROMDATE.,1'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(453840972881764966)
,p_plug_name=>'Debit Note'
,p_static_id=>'debit-note'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>90
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''No Of Party  : '' || to_char(Count(Distinct A.partyCode)) As NoofParty,',
'       ''No of Bills  : '' || to_char(Count(Distinct A.ReferenceModuleTno)) As NoofBills,',
unistr('       ''\20B9 '' || to_number(Round(Sum(a.debitnoteamount) / 100000, 2),'),
'                         ''99999999999.99'') || '' Lac'' Value,',
'       ''Total Debit Note'' As Text,',
'       ''u-color-10'' As card_color',
'',
'  From DEBITNOTE A',
' Where a.debitnotedate <= Nvl(:P520_ASONDATE, Trunc(Sysdate));'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433960194206462170)
,p_region_id=>wwv_flow_imp.id(453840972881764966)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'VALUE'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_body_column_name=>'NOOFPARTY'
,p_second_body_adv_formatting=>false
,p_second_body_column_name=>'NOOFBILLS'
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433960765192462170)
,p_card_id=>wwv_flow_imp.id(433960194206462170)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.:RP,158:P158_FROMDATE,P210_LOCATION,P158_TODATE:&GLOBAL_FINANCIALYEARBEGIN.,HO,&P520_ASONDATE.'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454117102078899022)
,p_plug_name=>'Debit Note Party Wise'
,p_static_id=>'debit-note-party-wise'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--accent1:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>110
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>8
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433963237579462172)
,p_region_id=>wwv_flow_imp.id(454117102078899022)
,p_chart_type=>'pie'
,p_height=>'250'
,p_animation_on_display=>'zoom'
,p_animation_on_data_change=>'slideToLeft'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hide_and_show_behavior=>'withRescale'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_value_format_type=>'decimal'
,p_value_decimal_places=>0
,p_value_format_scaling=>'none'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'on'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_pie_other_threshold=>0
,p_pie_selection_effect=>'highlightAndExplode'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433963743651462172)
,p_chart_id=>wwv_flow_imp.id(433963237579462172)
,p_static_id=>'dr-note-party-wise'
,p_seq=>10
,p_name=>'DR NOTE PARTY WISE'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(b.financialyearbegin,''DD-MON-RRRR'') AS FromDate,',
'       a.partycode,',
'       getpartyname(a.partycode) As partyname,',
'       Sum(a.debitnoteamount) As Amount',
'       ',
'  From DEBITNOTE A, Financialyear b',
' Where a.debitnotedate <= Nvl(:P520_ASONDATE, Trunc(Sysdate))',
'   And a.debitnotedate Between b.financialyearbegin And b.financialyearend',
' Group By a.partycode, getpartyname(a.partycode), b.financialyearbegin',
' Order By 3 Desc',
''))
,p_series_type=>'pie'
,p_items_value_column_name=>'AMOUNT'
,p_items_label_column_name=>'PARTYNAME'
,p_items_short_desc_column_name=>'PARTYNAME'
,p_items_label_rendered=>true
,p_items_label_position=>'outsideSlice'
,p_items_label_display_as=>'ALL'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.:RP,158:P158_TODATE,P158_PARTY,P158_LOCATION,P158_FROMDATE,P158_COMPANY:&P520_ASONDATE.,&PARTYCODE.,HO,&FROMDATE.,1'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454118278518899034)
,p_plug_name=>'GST INPUT'
,p_static_id=>'gst-input'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>160
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select K.FINANCIALYEARBEGIN,',
'       TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'') As FROMDATE,',
unistr('       ''\20B9  ''||Sum(NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0)) As TOTALTAX,'),
'       ''GST INPUT - ''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY'') AS TEXT,',
'''u-color-10'' As card_color',
'',
'  From gsttaxinoutdetail a,',
'       PARTY P,',
'       TAXREGISTRATIONTYPE TG,',
'       NATUREOFSUPPLY NS,',
'       ITEM I,',
'       JOBTYPE J,',
'       FINANCIALYEAR K,',
'       (Select ZZ.TNO          As BILLVOUCHERTNO,',
'               ZZ.MODULETNO,',
'               XX.CRVOUCHERTNO,',
'               YY.VOUCHERNO    As PAYMENTVOUCHERNO,',
'               YY.VOUCHERDATE  As PAYMENTVOUCHERDATE',
'          From DRCRALLOCATION XX, VOUCHER YY, VOUCHER ZZ',
'         Where XX.MODULETNO = YY.TNO',
'           And YY.DOCTYPECODE = ''PAYMENT''',
'           And XX.CRVOUCHERTNO = ZZ.TNO) PY',
'',
' Where a.type = ''INWARD''',
'   And A.PARTYCODE = P.PARTYCODE(+)',
'   And P.TAXREGISTRATIONTYPECODE = TG.TAXREGISTRATIONTYPECODE(+)',
'   And A.NatureOfSupplyCode = NS.NATUREOFSUPPLYCODE(+)',
'   And A.ITEMCODE = I.ITEMCODE(+)',
'   And A.JOBTYPECODE = J.JOBTYPECODE(+)',
'   And A.Vouchertno = PY.BILLVOUCHERTNO(+)',
'   And a.VoucherDate Between',
'       TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'') And',
'       :P520_ASONDATE',
'   And Nvl(:P520_ASONDATE, Sysdate) Between K.FINANCIALYEARBEGIN And',
'       K.FINANCIALYEAREND',
'',
' Group By K.FINANCIALYEARBEGIN ,',
'        TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'')',
'',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433971064204462179)
,p_region_id=>wwv_flow_imp.id(454118278518899034)
,p_layout_type=>'GRID'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'TOTALTAX'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433971546889462179)
,p_card_id=>wwv_flow_imp.id(433971064204462179)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:403:&SESSION.::&DEBUG.:RP,403:P403_FROMDATE,P403_TODATE,P403_LOCATION:&FROMDATE.,&P520_ASONDATE.,HO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454118549976899037)
,p_plug_name=>'GST OUTPUT'
,p_static_id=>'gst-output'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB:t-Form--labelsAbove'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>190
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select L.FINANCIALYEARBEGIN,',
'       TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'') As FROMDATE,',
unistr('       ''\20B9  ''||Sum(NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0)) As TOTALTAX,'),
'       ''GST OUTPUT - ''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY'') AS TEXT,',
'''u-color-8'' As card_color',
'',
'    From gsttaxinoutdetail a,',
'       PARTY P,',
'       TAXREGISTRATIONTYPE TG,',
'       NATUREOFSUPPLY NS,',
'       ITEM I,',
'       JOBTYPE J,',
'       EINVOICE K,',
'       FINANCIALYEAR l,',
'       (Select ZZ.TNO          As BILLVOUCHERTNO,',
'               ZZ.MODULETNO,',
'               XX.CRVOUCHERTNO,',
'               YY.VOUCHERNO    As PAYMENTVOUCHERNO,',
'               YY.VOUCHERDATE  As PAYMENTVOUCHERDATE',
'          From DRCRALLOCATION XX, VOUCHER YY, VOUCHER ZZ',
'         Where XX.MODULETNO = YY.TNO',
'           And YY.DOCTYPECODE In (''JOURNAL'', ''RECEIPT'')',
'           And XX.DRVOUCHERTNO = ZZ.TNO) PY',
'',
' Where a.type = ''OUTWARD''',
'   And A.PARTYCODE = P.PARTYCODE(+)',
'   And P.TAXREGISTRATIONTYPECODE = TG.TAXREGISTRATIONTYPECODE(+)',
'   And A.NatureOfSupplyCode = NS.NATUREOFSUPPLYCODE(+)',
'   And A.ITEMCODE = I.ITEMCODE(+)',
'   And A.JOBTYPECODE = J.JOBTYPECODE(+)',
'   And A.TNO = K.MODULETNO(+)',
'   And A.Vouchertno = PY.BILLVOUCHERTNO(+)',
'',
'   And Nvl(:P520_ASONDATE, Sysdate) Between l.FINANCIALYEARBEGIN And l.FINANCIALYEAREND',
'  and NVL(a.VoucherDate,A.ENTRYDATE) between TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'')  and :P520_ASONDATE',
' ',
'',
' Group By l.FINANCIALYEARBEGIN ,',
'        TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-mm-yyyy''),''MM-YYYY''),''DD-MM-YYYY'')',
'',
'',
'/*Select ''No Of Party  : '' || to_char(Count(Distinct A.partyCode)) As NoofParty,',
'       ''No of Bills  : '' || to_char(Count(Distinct A.ReferenceModuleTno)) As NoofBills,',
unistr('       ''\20B9 '' || to_number(Round(Sum(a.creditnoteamount) / 100000, 2),'),
'                         ''99999999999.99'') || '' Lac'' Value,',
'       ''Total Debit Note'' As Text,',
'       ''u-color-30'' As card_color',
'',
'  From CREDITNOTE A',
' Where a.creditnotedate <= Nvl(:P520_ASONDATE, Trunc(Sysdate));',
' */'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433972524202462182)
,p_region_id=>wwv_flow_imp.id(454118549976899037)
,p_layout_type=>'ROW'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'TOTALTAX'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433973070499462183)
,p_card_id=>wwv_flow_imp.id(433972524202462182)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:404:&SESSION.::&DEBUG.:RP,404:P404_FROMDATE,P404_TODATE,P167_LOCATION,P404_ALL:&FROMDATE.,&P520_ASONDATE.,HO,NO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454979055770629266)
,p_plug_name=>'MONTHLY GST INPUT'
,p_static_id=>'monthly-gst-input'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h240:t-Region--accent1:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--labelsAbove:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>170
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433977064734462187)
,p_region_id=>wwv_flow_imp.id(454979055770629266)
,p_chart_type=>'bar'
,p_height=>'240'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433978733821462188)
,p_chart_id=>wwv_flow_imp.id(433977064734462187)
,p_static_id=>'monthly-gst-input'
,p_seq=>10
,p_name=>'Monthly GST Input'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
' to_char(to_date(''01-'' ||',
'               to_char(NVL(a.voucherdate, A.ENTRYDATE), ''Mon-yyyy''),',
'               ''dd-mm-YYYY''),''DD-MM-YYYY'') As FromDate,',
'       to_char(last_day(to_date(''01-'' ||',
'                        to_char(NVL(a.voucherdate, A.ENTRYDATE), ''Mon-yyyy''),',
'                        ''dd-mm-rrrr'')),''DD-MM-YYYY'') As ToDate,',
' to_char(a.voucherdate, ''Mon-yyyy'') As Month,',
' Sum(NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0)) As TOTALTAX',
'  From gsttaxinoutdetail   a,',
'       PARTY               P,',
'       TAXREGISTRATIONTYPE TG,',
'       NATUREOFSUPPLY      NS,',
'       ITEM                I,',
'       JOBTYPE             J,',
'       FINANCIALYEAR       K,',
'       ',
'       (Select ZZ.TNO          As BILLVOUCHERTNO,',
'               ZZ.MODULETNO,',
'               XX.CRVOUCHERTNO,',
'               YY.VOUCHERNO    As PAYMENTVOUCHERNO,',
'               YY.VOUCHERDATE  As PAYMENTVOUCHERDATE',
'          From DRCRALLOCATION XX, VOUCHER YY, VOUCHER ZZ',
'         Where XX.MODULETNO = YY.TNO',
'           And YY.DOCTYPECODE = ''PAYMENT''',
'           And XX.CRVOUCHERTNO = ZZ.TNO) PY',
'',
' Where a.type = ''INWARD''',
'   And A.PARTYCODE = P.PARTYCODE(+)',
'   And P.TAXREGISTRATIONTYPECODE = TG.TAXREGISTRATIONTYPECODE(+)',
'   And A.NatureOfSupplyCode = NS.NATUREOFSUPPLYCODE(+)',
'   And A.ITEMCODE = I.ITEMCODE(+)',
'   And A.JOBTYPECODE = J.JOBTYPECODE(+)',
'   And A.Vouchertno = PY.BILLVOUCHERTNO(+)',
'   And a.VoucherDate Between K.FINANCIALYEARBEGIN And NVL(:P520_ASONDATE,SYSDATE)',
'',
' Group By K.FINANCIALYEARBEGIN, to_char(nvl(a.voucherdate,a.entrydate), ''Mon-yyyy''),to_char(a.voucherdate, ''Mon-yyyy'')'))
,p_series_type=>'bar'
,p_items_value_column_name=>'TOTALTAX'
,p_items_label_column_name=>'MONTH'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:403:&SESSION.::&DEBUG.:RP,403:P403_FROMDATE,P403_TODATE,P403_LOCATION:&FROMDATE.,&TODATE.,HO'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433977573429462187)
,p_chart_id=>wwv_flow_imp.id(433977064734462187)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433978174417462188)
,p_chart_id=>wwv_flow_imp.id(433977064734462187)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(455115358165325621)
,p_plug_name=>'MONTHLY GST OUTPUT'
,p_static_id=>'monthly-gst-output'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h240:t-Region--accent1:t-Region--hiddenOverflow:t-Form--slimPadding:t-Form--labelsAbove:margin-top-none:margin-bottom-none:margin-left-none:margin-right-none'
,p_escape_on_http_output=>'Y'
,p_plug_template=>4072358936313175081
,p_plug_display_sequence=>200
,p_plug_new_grid_row=>false
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(433979742079462188)
,p_region_id=>wwv_flow_imp.id(455115358165325621)
,p_chart_type=>'bar'
,p_height=>'240'
,p_animation_on_display=>'auto'
,p_animation_on_data_change=>'auto'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'dim'
,p_stack=>'off'
,p_stack_label=>'off'
,p_connect_nulls=>'Y'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>true
,p_show_value=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(433981458767462190)
,p_chart_id=>wwv_flow_imp.id(433979742079462188)
,p_static_id=>'monthly-gst-output'
,p_seq=>10
,p_name=>'Monthly GST Output'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
' to_char(to_date(''01-'' ||',
'               to_char(NVL(a.voucherdate, A.ENTRYDATE), ''Mon-yyyy''),',
'               ''dd-mm-YYYY''),''DD-MM-YYYY'') As FromDate,',
'       to_char(last_day(to_date(''01-'' ||',
'                        to_char(NVL(a.voucherdate, A.ENTRYDATE), ''Mon-yyyy''),',
'                        ''dd-mm-YYYY'')),''DD-MM-YYYY'') As ToDate,',
' to_char(NVL(a.voucherdate,A.ENTRYDATE), ''Mon-yyyy'') As Month,',
' Sum(NVL(A.IGST, 0) + NVL(A.CGST, 0) + NVL(A.SGST, 0)) As TOTALTAX',
'     From gsttaxinoutdetail a,',
'       PARTY P,',
'       TAXREGISTRATIONTYPE TG,',
'       NATUREOFSUPPLY NS,',
'       ITEM I,',
'       JOBTYPE J,',
'       EINVOICE K,',
'       FINANCIALYEAR l,',
'       (Select ZZ.TNO          As BILLVOUCHERTNO,',
'               ZZ.MODULETNO,',
'               XX.CRVOUCHERTNO,',
'               YY.VOUCHERNO    As PAYMENTVOUCHERNO,',
'               YY.VOUCHERDATE  As PAYMENTVOUCHERDATE',
'          From DRCRALLOCATION XX, VOUCHER YY, VOUCHER ZZ',
'         Where XX.MODULETNO = YY.TNO',
'           And YY.DOCTYPECODE In (''JOURNAL'', ''RECEIPT'')',
'           And XX.DRVOUCHERTNO = ZZ.TNO) PY',
'',
' Where a.type = ''OUTWARD''',
'   And A.PARTYCODE = P.PARTYCODE(+)',
'   And P.TAXREGISTRATIONTYPECODE = TG.TAXREGISTRATIONTYPECODE(+)',
'   And A.NatureOfSupplyCode = NS.NATUREOFSUPPLYCODE(+)',
'   And A.ITEMCODE = I.ITEMCODE(+)',
'   And A.JOBTYPECODE = J.JOBTYPECODE(+)',
'   And A.TNO = K.MODULETNO(+)',
'   And A.Vouchertno = PY.BILLVOUCHERTNO(+)',
'   And NVL(a.voucherdate,A.ENTRYDATE) Between L.FINANCIALYEARBEGIN And NVL(:P520_ASONDATE,SYSDATE)',
'',
' Group By L.FINANCIALYEARBEGIN, to_char(NVL(a.voucherdate,A.ENTRYDATE), ''Mon-yyyy'')'))
,p_series_type=>'bar'
,p_items_value_column_name=>'TOTALTAX'
,p_items_label_column_name=>'MONTH'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:404:&SESSION.::&DEBUG.:RP,404:P404_FROMDATE,P404_TODATE,P404_LOCATION,P404_ALL:&FROMDATE.,&TODATE.,HO,NO'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433980274115462189)
,p_chart_id=>wwv_flow_imp.id(433979742079462188)
,p_static_id=>'x'
,p_axis=>'x'
,p_is_rendered=>'on'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(433980836543462189)
,p_chart_id=>wwv_flow_imp.id(433979742079462188)
,p_static_id=>'y'
,p_axis=>'y'
,p_is_rendered=>'on'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454118895684899040)
,p_plug_name=>'TDS PAYBLE'
,p_static_id=>'tds-payble'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>210
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>1
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select L.FINANCIALYEARBEGIN,',
'       TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'') As FROMDATE,',
unistr('       ''\20B9  ''||Sum(A.TDSAMOUNT) As TOTALTAX,'),
'       ''TDS PAYBLE'' AS TEXT,',
'''u-color-15'' As card_color',
'',
'   FROM VOUCHERTDSDEDUCTED    A,',
'       VOUCHER               B,',
'       JBPASS                C,',
'       EXTERNALSERVICESENTRY D,',
'       PAYMENTADVICE         E,',
'       TDSNATURE             F,',
'       TDSTAXCATEGORY        G,',
'       PARTY                 H,',
'       FinancialYear         L,',
'       (SELECT A.CHALLANNO,',
'               A.CHALLANDATE,',
'               E.BSRCODE,',
'               D.MODULETNO,',
'               A.CHALLANAMOUNT',
'          FROM CHALLAN                  A,',
'               TDSCHALLAN               C,',
'               TDSCHALLANDEDUCTEEDETAIL D,',
'               BANK                     E',
'         WHERE  A.DOCTYPECODE = ''TDSCHALLAN''',
'           AND A.MODULETNO = C.TNO',
'           AND C.TNO = D.TNO',
'           AND A.TAXSECTIONCODE = D.TAXSECTIONCODE',
'           AND A.DEPOSITEDINBANKCODE = E.BANKCODE',
'       ) CHLN',
'   ',
' WHERE A.TNO = B.TNO(+)',
'   AND B.MODULETNO = C.TNO(+)',
'   AND B.MODULETNO = D.TNO(+)',
'   AND B.MODULETNO = E.TNO(+)',
'   AND A.TDSNATURECODE = F.TDSNATURECODE(+)',
'   AND A.TDSTAXCATEGORYCODE = G.TDSTAXCATEGORYCODE(+)',
'   AND A.PARTYCODE = H.PARTYCODE(+)',
'   AND B.MODULETNO = CHLN.MODULETNO(+)',
'',
'   And Nvl(:P520_ASONDATE, Sysdate) Between l.FINANCIALYEARBEGIN And l.FINANCIALYEAREND',
'  and B.VoucherDate between TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'')  and :P520_ASONDATE',
' ',
'',
' Group By l.FINANCIALYEARBEGIN ,',
'        TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'')',
'',
'',
'/*Select ''No Of Party  : '' || to_char(Count(Distinct A.partyCode)) As NoofParty,',
'       ''No of Bills  : '' || to_char(Count(Distinct A.ReferenceModuleTno)) As NoofBills,',
unistr('       ''\20B9 '' || to_number(Round(Sum(a.creditnoteamount) / 100000, 2),'),
'                         ''99999999999.99'') || '' Lac'' Value,',
'       ''Total Debit Note'' As Text,',
'       ''u-color-30'' As card_color',
'',
'  From CREDITNOTE A',
' Where a.creditnotedate <= Nvl(:P520_ASONDATE, Trunc(Sysdate));',
' */'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows_type=>'SCROLL'
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433974046478462184)
,p_region_id=>wwv_flow_imp.id(454118895684899040)
,p_layout_type=>'ROW'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'TOTALTAX'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433974508817462185)
,p_card_id=>wwv_flow_imp.id(433974046478462184)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:405:&SESSION.::&DEBUG.:RP,405:P405_FROMDATE,P405_TODATE,P405_LOCATION:&FROMDATE.,&P520_ASONDATE.,HO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(454119158199899043)
,p_plug_name=>'TDS RECEIVABLE'
,p_static_id=>'tds-receivable'
,p_region_template_options=>'#DEFAULT#:t-CardsRegion--styleB'
,p_plug_template=>2072724515482255512
,p_plug_display_sequence=>220
,p_plug_new_grid_row=>false
,p_plug_grid_column_span=>4
,p_plug_grid_column_css_classes=>'mycardsize'
,p_plug_display_column=>5
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select e.FINANCIALYEARBEGIN,',
'       TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'') As FROMDATE,',
unistr('       ''\20B9  ''||Sum(A.TDSAMOUNT) As TOTALTAX,'),
'       ''TDS RECEIVABLE'' AS TEXT,',
'''u-color-17'' As card_color',
'',
'   FROM DFREIGHTBILLRECEIPT       A,',
'       DFREIGHTBILLRECEIPTDETAIL B,',
'       VOUCHER                   C,',
'       PARTY                     D,',
'       FinancialYear             e',
' WHERE A.TNO = B.TNO',
'   AND A.TNO = C.MODULETNO(+)',
'   AND A.DEPOCODE = D.PARTYCODE(+)',
'   AND NVL(B.TDSAMOUNT, 0) > 0',
'',
'   And Nvl(:P520_ASONDATE, Sysdate) Between e.FINANCIALYEARBEGIN And e.FINANCIALYEAREND',
'  and C.VoucherDate between TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'')  and :P520_ASONDATE',
' ',
'',
' Group By e.FINANCIALYEARBEGIN ,',
'        TO_DATE(''01-''||to_char(to_date(:P520_ASONDATE,''DD-MM-yyyy''),''MM-YYYY''),''DD-MM-YYYY'')',
'',
''))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_CARDS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'SET'
,p_plug_query_no_data_found=>'No Record Found For TDS Receivable '
,p_show_total_row_count=>false
);
wwv_flow_imp_page.create_card(
 p_id=>wwv_flow_imp.id(433975507861462186)
,p_region_id=>wwv_flow_imp.id(454119158199899043)
,p_layout_type=>'ROW'
,p_card_css_classes=>'&CARD_COLOR!ATTR.'
,p_title_adv_formatting=>false
,p_title_column_name=>'TEXT'
,p_sub_title_adv_formatting=>false
,p_sub_title_column_name=>'TOTALTAX'
,p_sub_title_css_classes=>'mycardsize'
,p_body_adv_formatting=>false
,p_second_body_adv_formatting=>false
,p_second_body_css_classes=>'mycardsize'
,p_media_adv_formatting=>false
);
wwv_flow_imp_page.create_card_action(
 p_id=>wwv_flow_imp.id(433976032834462187)
,p_card_id=>wwv_flow_imp.id(433975507861462186)
,p_action_type=>'FULL_CARD'
,p_display_sequence=>10
,p_static_id=>'action'
,p_link_target_type=>'REDIRECT_PAGE'
,p_link_target=>'f?p=&APP_ID.:406:&SESSION.::&DEBUG.:RP,406:P406_FROMDATE,P406_TODATE,P406_LOCATION:&FROMDATE.,&P520_ASONDATE.,HO'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(433983885394462194)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(461724870304539186)
,p_button_name=>'CLEAR'
,p_static_id=>'clear'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#:t-Button--warning'
,p_button_template_id=>2349107722467437027
,p_button_image_alt=>'Clear'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
,p_grid_column_span=>1
,p_grid_column=>1
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(433984366033462194)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(461724870304539186)
,p_button_name=>'Submit'
,p_static_id=>'submit'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2349107722467437027
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit'
,p_icon_css_classes=>'fa-arrow-right-alt'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(453737704881670844)
,p_name=>'P520_ASONDATE'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(461724870304539186)
,p_item_default=>'SELECT TRUNC(SYSDATE) FROM DUAL;'
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'As on Date'
,p_placeholder=>'As on Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>2
,p_grid_label_column_span=>1
,p_field_template=>2040785906935475274
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433993493600462197)
,p_name=>'Change Region Name'
,p_static_id=>'change-region-name'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_CC'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433994078998462198)
,p_event_id=>wwv_flow_imp.id(433993493600462197)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    'if (orig == "x")',
    '    orig = $(''#MYID h1'').text();',
    '',
    '$(''#MYID h1'').text(orig + '' ('' + $(''#P520_CC option:selected'').text() + '')'');')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433996249552462198)
,p_name=>'CHANGE WORKCENTRECODE'
,p_static_id=>'change-workcentrecode'
,p_event_sequence=>100
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_WORKCENTRECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433988891893462196)
,p_name=>'Clear All Item available on PAGE'
,p_static_id=>'clear-all-item-available-on-page'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(433983885394462194)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433989387238462196)
,p_event_id=>wwv_flow_imp.id(433988891893462196)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_DEPARTMENTCODE,P520_COSTCENTERCODE,P520_DEPTMONTH,P520_CCMONTH,P520_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(434067416815542735)
,p_name=>'Hide Menu'
,p_static_id=>'hide-menu'
,p_event_sequence=>120
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(434067799091542736)
,p_event_id=>wwv_flow_imp.id(434067416815542735)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_static_id=>'native-javascript-code'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'js_code', wwv_flow_string.join(wwv_flow_t_varchar2(
    '$("body").removeClass("js-navExpanded").addClass("js-navCollapsed");',
    '//$("#t_Body_nav").hide();',
    '//$(this).treeView("collapse", n$)')))).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433996646889462198)
,p_name=>'REFRESH'
,p_static_id=>'refresh'
,p_event_sequence=>110
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_WCMONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433997111830462199)
,p_event_id=>wwv_flow_imp.id(433996646889462198)
,p_event_result=>'TRUE'
,p_action_sequence=>5
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_WCITEMGROUPCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433995363920462198)
,p_name=>'Refresh Month x Item (Department)'
,p_static_id=>'refresh-month-x-item-department'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_DEPTMONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433995855222462198)
,p_event_id=>wwv_flow_imp.id(433995363920462198)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_DPITEMGROUPCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433987993335462196)
,p_name=>'Refresh on Cost Center Region'
,p_static_id=>'refresh-on-cost-center-region'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_COSTCENTERCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433988511031462196)
,p_event_id=>wwv_flow_imp.id(433987993335462196)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_CCMONTH'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433989800191462196)
,p_name=>'Refresh on Department Region'
,p_static_id=>'refresh-on-department-region'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_DEPARTMENTCODE'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433985257564462195)
,p_name=>'Refresh on DocType Region'
,p_static_id=>'refresh-on-doctype-region'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_DOCTYPECODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433985712658462195)
,p_event_id=>wwv_flow_imp.id(433985257564462195)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_LOCATIONCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433986256234462195)
,p_event_id=>wwv_flow_imp.id(433985257564462195)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(461203292285233128)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433986618619462195)
,p_name=>'Refresh on Location Region'
,p_static_id=>'refresh-on-location-region'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_LOCATIONCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433987098529462195)
,p_event_id=>wwv_flow_imp.id(433986618619462195)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_DEPARTMENTCODE,P520_COSTCENTERCODE,P520_DEPTMONTH,P520_CCMONTH,P520_PARTYCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433987668390462196)
,p_event_id=>wwv_flow_imp.id(433986618619462195)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(461203292285233128)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433994462376462198)
,p_name=>'Refresh the Month x Item (Cost Centre)'
,p_static_id=>'refresh-the-month-x-item-cost-centre'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_CCMONTH'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433994943005462198)
,p_event_id=>wwv_flow_imp.id(433994462376462198)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_CCITEMGROUPCODE'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433991588329462197)
,p_name=>'Set Value for Cost Centre Month Region'
,p_static_id=>'set-value-for-cost-centre-month-region'
,p_event_sequence=>70
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_COSTCENTERCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433992176723462197)
,p_event_id=>wwv_flow_imp.id(433991588329462197)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_COSTCENTRENAME'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433993158125462197)
,p_event_id=>wwv_flow_imp.id(433991588329462197)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_static_id=>'native-refresh'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_COSTCENTRENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'maintain_pagination', 'N')).to_clob
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433992638797462197)
,p_event_id=>wwv_flow_imp.id(433991588329462197)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_COSTCENTRENAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'N',
  'items_to_submit', 'P520_COSTCENTERCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    'CostCentreName',
    'From CostCentre',
    'Where Tno = :P520_COSTCENTERCODE')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(433990237141462196)
,p_name=>'Set Value for Department Month region'
,p_static_id=>'set-value-for-department-month-region'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P520_DEPARTMENTCODE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433990772947462197)
,p_event_id=>wwv_flow_imp.id(433990237141462196)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_static_id=>'native-clear'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_DEPARTMENTNAME'
,p_client_condition_type=>'NOT_NULL'
,p_client_condition_element=>'P520_DEPARTMENTCODE'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(433991229165462197)
,p_event_id=>wwv_flow_imp.id(433990237141462196)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_static_id=>'native-set-value'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P520_DEPARTMENTNAME'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'escape_special_characters', 'Y',
  'items_to_submit', 'P520_DEPARTMENTCODE',
  'sql_query', wwv_flow_string.join(wwv_flow_t_varchar2(
    'Select',
    'DepartmentName',
    'From Department',
    'Where Tno = :P520_DEPARTMENTCODE')),
  'suppress_change_event', 'Y',
  'type', 'SQL_STATEMENT')).to_clob
,p_wait_for_result=>'Y'
);
wwv_flow_imp.component_end;
end;
/
