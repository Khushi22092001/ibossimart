prompt --application/pages/page_00227
begin
--   Manifest
--     PAGE: 00227
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
 p_id=>227
,p_name=>'Outstanding Bills More Than 180 Days'
,p_alias=>'OUTSTANDING-BILLS-MORE-THAN-180-DAYS'
,p_step_title=>'Outstanding Bills More Than 180 Days'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
'<script id="hspl-sidebar-head-state">',
'(function(d){',
'  var state=''closed'';',
'  try {',
'    var saved=window.localStorage.getItem(''imart.sidebar.state.v1'');',
'    if(saved===''open''||saved===''closed'') state=saved;',
'  } catch(ignore) {}',
'  d.classList.remove(state===''open''?''hspl-nav-target-closed'':''hspl-nav-target-open'');',
'  d.classList.add(state===''open''?''hspl-nav-target-open'':''hspl-nav-target-closed'');',
'})(document.documentElement);',
'</script>',
'<style id="hspl-register-first-paint">',
'/* Match the application''s existing final register palette at parser time.',
'   These declarations intentionally duplicate (not replace) the final shared',
'   design-system values, preventing the older theme palette from becoming a',
'   visible intermediate frame during initial render or APEX IR refresh. */',
'body:not(.t-PageBody--login) .a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table th.a-IRR-header,',
'body:not(.t-PageBody--login) .a-IRR-table thead th,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-thead .a-IRR-header {',
'  background:#e6e8f7!important;',
'  color:#3f4a7a!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-toolbar,',
'body:not(.t-PageBody--login) .a-IRR-controlsContainer {',
'  background:#f4f3fd!important;',
'  border-color:#e6e4f7!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(even) td:not([style*="background"]) {',
'  background-color:#f3f6fc!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:nth-child(odd) td:not([style*="background"]) {',
'  background-color:#fff!important;',
'}',
'body:not(.t-PageBody--login) .a-IRR-table tbody tr:hover td:not([style*="background"]) {',
'  background-color:#eaf0fb!important;',
'}',
'body:not(.t-PageBody--login) .t-Region:has(.a-IRR),',
'body:not(.t-PageBody--login) .a-IRR,',
'body:not(.t-PageBody--login) .a-IRR-region,',
'body:not(.t-PageBody--login) .t-IRR-region,',
'body:not(.t-PageBody--login) .a-IRR-content,',
'body:not(.t-PageBody--login) .a-IRR-table,',
'body:not(.t-PageBody--login) .t-fht-wrapper,',
'body:not(.t-PageBody--login) .t-fht-thead,',
'body:not(.t-PageBody--login) .t-fht-tbody {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>',
'<style id="hspl-register-cell-paint-lock">',
'/* APEX/UT gives report cells a background/color transition. During an IR',
'   refresh the replacement rows therefore fade from the native palette into',
'   the application palette. Keep every existing colour and hover selector,',
'   but make their application atomic. */',
'body:not(.t-PageBody--login) .a-IRR-table th,',
'body:not(.t-PageBody--login) .a-IRR-table td,',
'body:not(.t-PageBody--login) .a-IRR-table .a-IRR-headerLink,',
'body:not(.t-PageBody--login) .t-fht-thead th,',
'body:not(.t-PageBody--login) .t-fht-tbody td {',
'  animation:none!important;',
'  transition:none!important;',
'}',
'</style>'))
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
 p_id=>wwv_flow_imp.id(225290506365926147)
,p_plug_name=>'Age Wise Summary'
,p_static_id=>'age-wise-summary'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
,p_plug_display_sequence=>30
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
'        and bb.VoucherDate <= :P227_ASONDATE',
'        and cc.VoucherDate <= :P227_ASONDATE',
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
'        and bb.VoucherDate <= :P227_ASONDATE',
'        and cc.VoucherDate <= :P227_ASONDATE',
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
'	/*union all',
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
'            b.doctypecode,',
'            a.LocationCode,',
'            e.LocationName,',
'            d.BillNo as PartyBillNo,',
'            d.BillDate as PartyBillDate,',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            --trunc(sysdate) - nvl(d.BillDate, a.VoucherDate) as BillAge,',
'            dl.DayDate - nvl(d.BillDate, a.VoucherDate) as BillAge,',
'            ----------------------- --',
'            a.AccountCode,',
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, AccountOpening d, Location e, ',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            DateList dl',
'            ----------------------- -- ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and a.ModuleTNo = d.TNo(+)',
'            and a.LocationCode = e.LocationCode',
'            and b.VoucherNo = ''OPENING''',
'            and a.VoucherDate <= :P227_ASONDATE',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            and dl.DayDAte = :P227_ASONDATE',
'            ----------------------- --',
'            and (:P227_LOCATION IS NULL OR instr('':''||:P227_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'            and ( :P227_PARTY IS NULL OR instr('':''||:P227_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )',
'            and ( :P227_COMPANY IS NULL OR instr('':''||:P227_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'        union all',
'        select ',
'            a.TNo,',
'            a.SNo,',
'            a.VoucherDate,',
'            b.VoucherNo,',
'            b.doctypecode,',
'            a.LocationCode,',
'            e.LocationName,',
'            d.PartyBillNo,',
'            d.PartyBillDate,',
'            ----------------------- --',
'            -- trunc(sysdate) - nvl(d.PartyBillDate, a.VoucherDate) as BillAge,',
'            dl.DayDate - nvl(d.PartyBillDate, a.VoucherDate) as BillAge,',
'            ----------------------- --',
'            a.AccountCode,',
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, t_Bill d, Location e, ',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            DateList dl',
'            ----------------------- --',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and b.ModuleTNo = d.TNo(+)',
'            and a.LOcationCode = e.LocationCode',
'            and b.VoucherNo != ''OPENING''',
'            and a.VoucherDate <= :P227_ASONDATE',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            and dl.DayDAte = :P227_ASONDATE',
'            ----------------------- --',
'            and (:P227_LOCATION IS NULL OR instr('':''||:P227_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'            and ( :P227_PARTY IS NULL OR instr('':''||:P227_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )',
'            and ( :P227_COMPANY IS NULL OR instr('':''||:P227_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
')',
'SELECT',
'    XX.PartyName,',
'    sum(xx.AgeUpTo30) as AgeUpto30,',
'    sum(xx.AgeBetween31_to_60) as AgeBetween31_to_60,',
'    sum(xx.AgeBetween61_to_90) as AgeBetween61_to_90,',
'    sum(xx.AgeBetween91_to_180) as AgeBetween91_to_180,',
'    sum(xx.AgeBetween181_to_365) as AgeBetween181_to_365,',
'    sum(xx.AgeAbove365) as AgeAbove365,',
'    sum(xx.BalanceAmount) as TotalBalance',
'FROM (',
'    select ',
'        x.LocationCode,',
'        x.LocationName,',
'        y.PartyName,',
'        x.VoucherNo,',
'        x.Doctypecode,',
'        x.VoucherDate,',
'        x.PartyBillNo,',
'        x.PartyBillDate,    ',
'        x.BalanceAmount,',
'        x.AccountCode,',
'        x.billage as Days,',
'        y.MSME,',
'        z.PartyName as ParentGroup,',
'        case when x.billage <= 30 then x.BalanceAmount else 0 end AgeUpTo30,',
'        case when x.billage between 31 and 60 then x.BalanceAmount else 0 end AgeBetween31_to_60,',
'        case when x.billage between 61 and 90 then x.BalanceAmount else 0 end AgeBetween61_to_90,',
'        case when x.billage between 91 and 180 then x.BalanceAmount else 0 end AgeBetween91_to_180,',
'        case when x.billage between 181 and 365 then x.BalanceAmount else 0 end AgeBetween181_to_365,',
'        case when x.billage > 365 then x.BalanceAmount else 0 end AgeAbove365',
'    from t_Balance x, Party y, Party z',
'    where x.AccountCode = y.PartyCode',
'        and y.ParentCode = z.PartyCode(+)',
'        /*and y.PartyTypeCode IN (''CUSTOMER'',''SUPPLIER'',''CONTRACTOR'',''TRANSPORTER'')*/',
'        and ( :P227_PARTYTYPE IS NULL OR instr('':''||:P227_PARTYTYPE||'':'','':''||y.PARTYTYPECODE||'':'') > 0 )',
'        and round(x.BalanceAmount, 3) != 0',
'        --  DT. 22.04.2024',
'        and x.BillAge >= NVL(TO_NUMBER(:P227_DAYS),0)',
'        -- dT. 08-05-2024',
'        and ( :P227_ISMSME = ''NO'' OR y.msme = :P227_ISMSME)',
'        -------------------------- --',
'        -- 11-MAY-2024 ',
'        and x.AccountCode in (',
'            select ',
'                a1a.PartyCode',
'            from Party a1a ',
'            start with a1a.PartyCode in ( ',
'                select ',
'                    a2a.PartyCode ',
'                from Party a2a ',
'                where   ( ',
'                    :P227_ACCOUNTGROUP IS NULL ',
'                    OR ',
'                    instr('':''||:P227_ACCOUNTGROUP||'':'','':''||a2a.PartyCode||'':'') > 0 ',
'                )  ',
'            )',
'            connect by prior a1a.PartyCode = a1a.ParentCode',
'        )',
'        -------------------------- --',
'    order by y.PartyName, x.LocationCode, x.VoucherDate, x.VoucherNo    ',
') XX',
'group by xx.PartyName'))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header=>'Age Wise Summary'
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
 p_id=>wwv_flow_imp.id(225290618188926148)
,p_max_row_count=>'1000000'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>57371599722798706
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225292615806926168)
,p_db_column_name=>'AGEABOVE365'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Age Above 365'
,p_column_html_expression=>'<div style="display:block; width:100px">#AGEABOVE365#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225292489383926167)
,p_db_column_name=>'AGEBETWEEN181_TO_365'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Age Between 181  To  365 Days'
,p_column_html_expression=>'<div style="display:block; width:100px">#AGEBETWEEN181_TO_365#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225292225668926164)
,p_db_column_name=>'AGEBETWEEN31_TO_60'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Age Between 31  To  60 Days'
,p_column_html_expression=>'<div style="display:block; width:100px">#AGEBETWEEN31_TO_60#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225292281444926165)
,p_db_column_name=>'AGEBETWEEN61_TO_90'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Age Between 61  To  90 Days'
,p_column_html_expression=>'<div style="display:block; width:100px">#AGEBETWEEN61_TO_90#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225292372805926166)
,p_db_column_name=>'AGEBETWEEN91_TO_180'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Age Between 91  To  180 Days'
,p_column_html_expression=>'<div style="display:block; width:100px">#AGEBETWEEN91_TO_180#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225292043661926163)
,p_db_column_name=>'AGEUPTO30'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Age Upto 30 Days'
,p_column_html_expression=>'<div style="display:block; width:90px">#AGEUPTO30#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225290975608926152)
,p_db_column_name=>'PARTYNAME'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Party Name'
,p_column_html_expression=>'<div style="display:block; width:160px">#PARTYNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(225292685142926169)
,p_db_column_name=>'TOTALBALANCE'
,p_display_order=>210
,p_column_identifier=>'U'
,p_column_label=>'Total Balance'
,p_column_html_expression=>'<div style="display:block; width:100px">#TOTALBALANCE#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(225530920987698166)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'236119'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PARTYNAME:AGEUPTO30:AGEBETWEEN31_TO_60:AGEBETWEEN61_TO_90:AGEBETWEEN91_TO_180:AGEBETWEEN181_TO_365:AGEABOVE365:TOTALBALANCE'
,p_sum_columns_on_break=>'AGEUPTO30:AGEBETWEEN31_TO_60:AGEBETWEEN61_TO_90:AGEBETWEEN91_TO_180:AGEBETWEEN181_TO_365:AGEABOVE365:TOTALBALANCE'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(473507538129429203)
,p_plug_name=>'Outstanding Bills More Than 180 Days'
,p_static_id=>'outstanding-bills-more-than-180-days'
,p_region_name=>'MYID'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(574763864839963122)
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
'        and bb.VoucherDate <= :P227_ASONDATE',
'        and cc.VoucherDate <= :P227_ASONDATE',
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
'        and bb.VoucherDate <= :P227_ASONDATE',
'        and cc.VoucherDate <= :P227_ASONDATE',
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
'	/*union all',
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
'            b.doctypecode,',
'            a.LocationCode,',
'            e.LocationName,',
'            d.BillNo as PartyBillNo,',
'            d.BillDate as PartyBillDate,',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            --trunc(sysdate) - nvl(d.BillDate, a.VoucherDate) as BillAge,',
'            dl.DayDate - nvl(d.BillDate, a.VoucherDate) as BillAge,',
'            ----------------------- --',
'            a.AccountCode,',
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, AccountOpening d, Location e, ',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            DateList dl',
'            ----------------------- -- ',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and a.ModuleTNo = d.TNo(+)',
'            and a.LocationCode = e.LocationCode',
'            and b.VoucherNo = ''OPENING''',
'            and a.VoucherDate <= :P227_ASONDATE',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            and dl.DayDAte = :P227_ASONDATE',
'            ----------------------- --',
'            and (:P227_LOCATION IS NULL OR instr('':''||:P227_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'            and ( :P227_PARTY IS NULL OR instr('':''||:P227_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )',
'            and ( :P227_COMPANY IS NULL OR instr('':''||:P227_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
'        union all',
'        select ',
'            a.TNo,',
'            a.SNo,',
'            a.VoucherDate,',
'            b.VoucherNo,',
'            b.doctypecode,',
'            a.LocationCode,',
'            e.LocationName,',
'            d.PartyBillNo,',
'            d.PartyBillDate,',
'            ----------------------- --',
'            -- trunc(sysdate) - nvl(d.PartyBillDate, a.VoucherDate) as BillAge,',
'            dl.DayDate - nvl(d.PartyBillDate, a.VoucherDate) as BillAge,',
'            ----------------------- --',
'            a.AccountCode,',
'            a.Amount as VoucherAmount,',
'            c.AllocatedAmount,',
'            a.Amount - nvl(c.AllocatedAmount, 0) as BalanceAmount',
'        from VoucherDetail a, Voucher b, t_Allocated c, t_Bill d, Location e, ',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            DateList dl',
'            ----------------------- --',
'        where a.TNo = b.TNo',
'            and a.TNO= c.VoucherTNo(+)',
'            and a.SNo = c.VoucherSNo(+)',
'            and b.ModuleTNo = d.TNo(+)',
'            and a.LOcationCode = e.LocationCode',
'            and b.VoucherNo != ''OPENING''',
'            and a.VoucherDate <= :P227_ASONDATE',
'            ----------------------- --',
'            -- 22-may-2024 ',
'            and dl.DayDAte = :P227_ASONDATE',
'            ----------------------- --',
'            and (:P227_LOCATION IS NULL OR instr('':''||:P227_LOCATION||'':'','':''||a.LocationCode||'':'') > 0)',
'            and ( :P227_PARTY IS NULL OR instr('':''||:P227_PARTY||'':'','':''||a.AccountCode||'':'') > 0 )',
'            and ( :P227_COMPANY IS NULL OR instr('':''||:P227_COMPANY||'':'','':''||a.CompanyCode||'':'') > 0 )',
')',
'SELECT ROWNUM AS SERIALNO,',
'XX.*',
'FROM ',
'(',
'select ',
' ',
'    x.LocationCode,',
'    x.LocationName,',
'    y.PartyName,',
'    x.VoucherNo,',
'    x.Doctypecode,',
'    x.VoucherDate,',
'    x.PartyBillNo,',
'    x.PartyBillDate,    ',
'    x.BalanceAmount,',
'    x.AccountCode,',
'    x.billage as Days,',
'    y.MSME,',
'    z.PartyName as ParentGroup',
'from t_Balance x, Party y, Party z',
'where x.AccountCode = y.PartyCode',
'    and y.ParentCode = z.PartyCode(+)',
'    /*and y.PartyTypeCode IN (''CUSTOMER'',''SUPPLIER'',''CONTRACTOR'',''TRANSPORTER'')*/',
'    and ( :P227_PARTYTYPE IS NULL OR instr('':''||:P227_PARTYTYPE||'':'','':''||y.PARTYTYPECODE||'':'') > 0 )',
'    and round(x.BalanceAmount, 3) != 0',
'    --  DT. 22.04.2024',
'    and x.BillAge >= NVL(TO_NUMBER(:P227_DAYS),0)',
'    -- dT. 08-05-2024',
'    and ( :P227_ISMSME = ''NO'' OR y.msme = :P227_ISMSME)',
'    -------------------------- --',
'    -- 11-MAY-2024 ',
'    and x.AccountCode in (',
'        select ',
'            a1a.PartyCode',
'        from Party a1a ',
'        start with a1a.PartyCode in ( ',
'            select ',
'                a2a.PartyCode ',
'            from Party a2a ',
'            where   ( ',
'                :P227_ACCOUNTGROUP IS NULL ',
'                OR ',
'                instr('':''||:P227_ACCOUNTGROUP||'':'','':''||a2a.PartyCode||'':'') > 0 ',
'            )  ',
'        )',
'        connect by prior a1a.PartyCode = a1a.ParentCode',
'    )',
'    -------------------------- --',
'order by y.PartyName, x.LocationCode, x.VoucherDate, x.VoucherNo    ',
') XX'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P227_ASONDATE,P227_LOCATION,P227_PARTYTYPE,P227_COMPANY,P227_PARTY,P227_DAYS,P227_ISMSME'
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
 p_id=>wwv_flow_imp.id(429561990141092567)
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
,p_show_notify=>'Y'
,p_show_flashback=>'N'
,p_show_reset=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_download_filename=>'Outstanding Bill More Than 180 Days'
,p_enable_mail_download=>'Y'
,p_supplemental_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'',
''))
,p_internal_uid=>261642971674965125
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237312544538943920)
,p_db_column_name=>'ACCOUNTCODE'
,p_display_order=>100
,p_column_identifier=>'AZ'
,p_column_label=>'Accountcode'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237311785391943918)
,p_db_column_name=>'BALANCEAMOUNT'
,p_display_order=>90
,p_column_identifier=>'AX'
,p_column_label=>'Balance Amount'
,p_column_html_expression=>'<div style="display:block; width:80px">#BALANCEAMOUNT#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237155031255307855)
,p_db_column_name=>'DAYS'
,p_display_order=>120
,p_column_identifier=>'BD'
,p_column_label=>'Days'
,p_column_html_expression=>'<div style="display:block; width:80px">#DAYS#</div>'
,p_column_type=>'NUMBER'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237313367823943922)
,p_db_column_name=>'DOCTYPECODE'
,p_display_order=>40
,p_column_identifier=>'BB'
,p_column_label=>'Voucher Type'
,p_column_html_expression=>'<div style="display:block; width:80px">#DOCTYPECODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237309784478943914)
,p_db_column_name=>'LOCATIONCODE'
,p_display_order=>10
,p_column_identifier=>'AJ'
,p_column_label=>'Location'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONCODE#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(229551352821554682)
,p_db_column_name=>'LOCATIONNAME'
,p_display_order=>130
,p_column_identifier=>'BE'
,p_column_label=>'Location Name'
,p_column_html_expression=>'<div style="display:block; width:100px">#LOCATIONNAME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205982723416834039)
,p_db_column_name=>'MSME'
,p_display_order=>140
,p_column_identifier=>'BF'
,p_column_label=>'MSME'
,p_column_html_expression=>'<div style="display:block; width:80px">#MSME#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(205982884177834041)
,p_db_column_name=>'PARENTGROUP'
,p_display_order=>150
,p_column_identifier=>'BG'
,p_column_label=>'Parent Group'
,p_column_html_expression=>'<div style="display:block; width:140px">#PARENTGROUP#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237310959176943917)
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
 p_id=>wwv_flow_imp.id(237310584682943916)
,p_db_column_name=>'PARTYBILLNO'
,p_display_order=>60
,p_column_identifier=>'AU'
,p_column_label=>'Party Bill No'
,p_column_html_expression=>'<div style="display:block; width:140px">#PARTYBILLNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(237310225522943915)
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
 p_id=>wwv_flow_imp.id(237309401698943913)
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
 p_id=>wwv_flow_imp.id(237312992009943921)
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
 p_id=>wwv_flow_imp.id(237312231560943919)
,p_db_column_name=>'VOUCHERNO'
,p_display_order=>30
,p_column_identifier=>'AY'
,p_column_label=>'Voucher No'
,p_column_html_expression=>'<div style="display:block; width:140px">#VOUCHERNO#</div>'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(429598145935188684)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'131208'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'SERIALNO:LOCATIONNAME:PARTYNAME:PARENTGROUP:MSME:VOUCHERNO:VOUCHERDATE:DOCTYPECODE:PARTYBILLNO:PARTYBILLDATE:BALANCEAMOUNT:DAYS'
,p_sum_columns_on_break=>'PENDINGAMT:BALANCEAMOUNT'
,p_count_columns_on_break=>'SERIALNO'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(502658204702893043)
,p_plug_name=>'Outstanding Bills More Than 180 Days'
,p_static_id=>'outstanding-bills-more-than-180-days-2'
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
 p_id=>wwv_flow_imp.id(184957957973006807)
,p_button_sequence=>140
,p_button_plug_id=>wwv_flow_imp.id(502658204702893043)
,p_button_name=>'REFRESH'
,p_static_id=>'refresh'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2082829544945815391
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Refresh'
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'N'
,p_grid_column_span=>3
,p_grid_column=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(207256993891986859)
,p_name=>'P227_ACCOUNTGROUP'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(502658204702893043)
,p_prompt=>'Account Group'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'a.PartyName as d ,',
'a.PartyCode as r',
'from Party a   ',
'where a.PartyTypeCode = ''ACCOUNTGROUP''',
'order by 1'))
,p_lov_display_null=>'YES'
,p_cSize=>30
,p_colspan=>4
,p_grid_column=>1
,p_grid_label_column_span=>1
,p_grid_column_css_classes=>'1'
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(237324780082943948)
,p_name=>'P227_ASONDATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(502658204702893043)
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'MONTH_AND_YEAR',
  'show', 'both',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(237325906385943950)
,p_name=>'P227_COMPANY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(502658204702893043)
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
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
 p_id=>wwv_flow_imp.id(268359220210585273)
,p_name=>'P227_DAYS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(502658204702893043)
,p_prompt=>'Pending Since Days'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(268361425278585295)
,p_name=>'P227_ISMSME'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(502658204702893043)
,p_prompt=>'MSME Only'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_label_column_span=>1
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'YES',
  'unchecked_value', 'NO',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(237325157389943949)
,p_name=>'P227_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(502658204702893043)
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
 p_id=>wwv_flow_imp.id(237326317368943951)
,p_name=>'P227_PARTY'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(502658204702893043)
,p_prompt=>'Vendor'
,p_placeholder=>'Enter Party Name'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select',
'       p.PartyName d,',
'       p.PartyCode r',
'From  Party p ',
'Order By 1'))
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>5
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
 p_id=>wwv_flow_imp.id(237325526845943949)
,p_name=>'P227_PARTYTYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(502658204702893043)
,p_prompt=>'Party Type'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'PLUGIN_PL.OSTROWSKIBARTOSZ.APEX.ENHANCEDLOVITEM'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT ',
'PARTYTYPECODE AS D,',
'PARTYTYPECODE AS R',
'FROM PARTYTYPE A',
'ORDER BY 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'-- Select Party Type --'
,p_cSize=>30
,p_begin_on_new_line=>'N'
,p_colspan=>4
,p_grid_column=>9
,p_grid_label_column_span=>2
,p_field_template=>2318601014859922299
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
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
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(184960933609006813)
,p_name=>'IR_Pagination'
,p_static_id=>'ir-pagination'
,p_event_sequence=>10
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(184961439685006813)
,p_event_id=>wwv_flow_imp.id(184960933609006813)
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
