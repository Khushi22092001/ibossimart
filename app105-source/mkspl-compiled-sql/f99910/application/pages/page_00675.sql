prompt --application/pages/page_00675
begin
--   Manifest
--     PAGE: 00675
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2026.03.30'
,p_release=>'26.1.2'
,p_default_workspace_id=>4744311978888504
,p_default_application_id=>99910
,p_default_id_offset=>0
,p_default_owner=>'IMART'
);
wwv_flow_imp_page.create_page(
 p_id=>675
,p_name=>'Trial Balance Intelligence'
,p_alias=>'TRIAL-BALANCE-INTELLIGENCE'
,p_step_title=>'Trial Balance Intelligence'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'OFF'
,p_group_id=>wwv_flow_imp.id(9965370353286257)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
unistr('/* Trial Balance visual hierarchy \2014 reinforces the shared ds-fintree-*'),
'   classes with a bolder root band, a stronger group weight, and a',
'   subtle hover trail. Scoped to this page so the shared styles used',
'   by other dashboards do not change. */',
'.a-IRR-table td .ds-fintree-l1 {',
'  background: linear-gradient(90deg, #FEF3C7 0%, #FEF3C7 92%, transparent 100%);',
'  color: #78350F;',
'  font-weight: 800;',
'  font-size: 14px;',
'  padding: 4px 8px 4px 4px;',
'  display: inline-block;',
'  border-left: 3px solid #F59E0B;',
'}',
'.a-IRR-table td .ds-fintree-l2 {',
'  color: #1E3A8A;',
'  font-weight: 700;',
'  font-size: 13.5px;',
'}',
'.a-IRR-table td .ds-fintree-l3 {',
'  color: #1E40AF;',
'  font-weight: 650;',
'}',
'.a-IRR-table td .ds-fintree-l4,',
'.a-IRR-table td .ds-fintree-l5 {',
'  color: #334155;',
'  font-weight: 600;',
'}',
'.a-IRR-table td .ds-fintree-leaf {',
'  color: #475569;',
'  font-weight: 400;',
'}',
'.a-IRR-table td .ds-fintree-grp a {',
'  text-decoration: none;',
'  color: inherit;',
'  border-bottom: 1px dashed rgba(30,58,138,.35);',
'}',
'.a-IRR-table td .ds-fintree-grp a:hover {',
'  border-bottom-color: #1E3A8A;',
'  color: #1E3A8A;',
'}',
'.a-IRR-table td .ds-fintree-code {',
'  display: inline-block;',
'  background: #F1F5F9;',
'  color: #64748B;',
'  font-family: "SFMono-Regular","Menlo",monospace;',
'  font-size: 10.5px;',
'  padding: 1px 6px;',
'  border-radius: 3px;',
'  margin-right: 8px;',
'  vertical-align: middle;',
'}',
'.a-IRR-table tbody tr:hover td {',
'  background: #F8FAFC !important;',
'}',
'',
'/* Totals band, sitting flush under the Trial Balance report.',
'   It is a region and not a row inside the report on purpose: a row',
'   belongs to whichever page its sequence falls on, so it vanished',
'   the moment the reader paged past it. A region is always on screen.',
'   `blank-with-attributes` already renders no region header; what did',
'   show was the classic report''s own column heading, hence the rule',
'   hiding it. */',
'/* A hairline grid. A trial balance is read ACROSS - "which of these six',
'   figures belongs to this account" - and with eleven columns and no',
'   vertical rules the eye drifts a row up or down on the wide ones. The',
'   line is deliberately faint: it should guide the eye, not box it in.',
'   tfoot is included so the total sits in the same grid as the rows it',
'   foots. */',
'.ds-register table.a-IRR-table th,',
'.ds-register table.a-IRR-table td {',
'  border-right: 1px solid #E3E6EA;',
'}',
'.ds-register table.a-IRR-table th:last-child,',
'.ds-register table.a-IRR-table td:last-child { border-right: 0; }',
'.ds-register table.a-IRR-table tbody td { border-bottom: 1px solid #F1F3F5; }',
'',
'/* Headings over their own figures.',
'',
'   The report definition already declares the right alignment per column',
'   and the live metadata confirms it - Opening Dr reads heading=RIGHT,',
'   data=RIGHT. It still rendered centred, because the theme centres the',
'   header link and that wins over the column attribute. So the alignment',
'   has to be restated in CSS, and CSS can only address a header by its',
'   position.',
'',
'   Columns 3 to 9 are the six amounts and Movement %, all right aligned;',
'   2, 10 and 11 are Kind, Last Posting and Position, all centred; 1 is',
'   Account, left, which is the default and needs no rule.',
'',
'   The position dependency is the price of overriding the theme. If a',
'   reader hides or reorders columns from the Actions menu the numbering',
'   shifts and the headings go back to centred - wrong, but only',
'   cosmetically, and only for that reader''s saved report. Scoped to this',
'   page''s CSS because .ds-register is shared with every other register in',
'   the app, whose column order is nothing like this one. */',
'.ds-register .a-IRR-table thead th:nth-child(n+3):nth-child(-n+9),',
'.ds-register .a-IRR-table thead th:nth-child(n+3):nth-child(-n+9) .a-IRR-headerLink {',
'  text-align: right;',
'  justify-content: flex-end;',
'}',
'.ds-register .a-IRR-table thead th:nth-child(2),',
'.ds-register .a-IRR-table thead th:nth-child(10),',
'.ds-register .a-IRR-table thead th:nth-child(11),',
'.ds-register .a-IRR-table thead th:nth-child(2) .a-IRR-headerLink,',
'.ds-register .a-IRR-table thead th:nth-child(10) .a-IRR-headerLink,',
'.ds-register .a-IRR-table thead th:nth-child(11) .a-IRR-headerLink {',
'  text-align: center;',
'  justify-content: center;',
'}',
'',
'/* Account frozen while the figures scroll under it. Eleven columns do not',
'   fit, and an amount three screens right of its account name is unreadable.',
'',
'   Every frozen cell needs an OPAQUE background of its own: a sticky cell',
'   is painted over the scrolling content, and anything transparent lets the',
'   figures slide through the text. Hence one rule per row state - header,',
'   odd row, even row, totals - each repeating the background that row',
'   already has. */',
'.ds-register .a-IRR-table th:first-child,',
'.ds-register .a-IRR-table td:first-child {',
'  position: sticky;',
'  left: 0;',
'  z-index: 2;',
'  box-shadow: 2px 0 0 rgba(15,23,42,.08);',
'}',
'.ds-register .a-IRR-table thead th:first-child { z-index: 4; background: #E7EDF6; }',
'.ds-register .a-IRR-table tbody td:first-child { background: #fff; }',
'.ds-register .a-IRR-table tbody tr:nth-child(even) td:first-child { background: #F4F5F6; }',
'.ds-register .a-IRR-table tfoot.ds-tb-foot td:first-child { background: #FFFBEB; z-index: 3; }',
'',
'/* The totals row is cloned into the report''s own table as a <tfoot>,',
'   so it inherits the column widths and needs no alignment of its own.',
'   These rules dress it once it is there. */',
'.ds-register table.a-IRR-table tfoot.ds-tb-foot td {',
'  background: #FFFBEB;',
'  border-top: 2px solid #F59E0B;',
'  padding: 9px 8px;',
'  font-weight: 700;',
'  color: #78350F;',
'  white-space: nowrap;',
'}',
'.ds-register table.a-IRR-table tfoot.ds-tb-foot td.ds-num {',
'  text-align: right;',
'  font-variant-numeric: tabular-nums;',
'  font-family: "SFMono-Regular","Menlo",monospace;',
'}',
'',
'/* The band below the report is the FALLBACK, shown by default and',
'   hidden only once the script confirms the row is in place. If the',
'   script never runs the totals are still on screen, just unaligned -',
'   which is strictly better than a page with no totals at all. */',
'.ds-tb-totals-region { margin-top: -14px; }',
'.ds-tb-totals-region .t-Report-colHead,',
'.ds-tb-totals-region thead.t-Report-colHead { display: none; }',
'.ds-tb-totals-region.ds-tb-placed .ds-tb-totals-wrap { display: none; }',
'.ds-tb-totals-wrap {',
'  overflow-x: auto;',
'  border: 1px solid #F59E0B;',
'  border-top: 0;',
'  border-radius: 0 0 6px 6px;',
'  background: #FFFBEB;',
'}',
'.ds-tb-totals {',
'  width: 100%;',
'  border-collapse: collapse;',
'  font-size: 12.5px;',
'}',
'.ds-tb-totals tbody td {',
'  padding: 8px 10px;',
'  font-weight: 700;',
'  color: #78350F;',
'  border-bottom: 0;',
'}',
'.ds-tb-totals td.ds-num {',
'  text-align: right;',
'  font-variant-numeric: tabular-nums;',
'  font-family: "SFMono-Regular","Menlo",monospace;',
'}',
'.ds-tb-badge {',
'  display: inline-block;',
'  padding: 2px 8px;',
'  border-radius: 999px;',
'  font-size: 11px;',
'  font-weight: 700;',
'  margin: 0 2px;',
'}',
'.ds-tb-badge--ok  { background: #DCFCE7; color: #166534; }',
'.ds-tb-badge--bad { background: #FEE2E2; color: #991B1B; }',
'/* Neither pass nor fail. Under a filter the balance check does not',
'   apply, and neither green nor red would be true, so it is stated in',
'   the page''s own slate rather than dressed as a verdict. */',
'.ds-tb-badge--flat { background: #E2E8F0; color: #334155; }'))
,p_step_template=>4073832297226169690
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'General-ledger command centre. The ledger is VoucherDetail, whose single signed Amount column stores a DEBIT as a NEGATIVE and a CREDIT as a POSITIVE - the ERP''s own APEXTRIALBALANCEREVISEDGROUP view splits the sides the same way. Opening is the Open'
||'ing table at the financial-year begin plus VoucherDetail movement from that date up to the day before From Date; the eleven carry-forward vouchers numbered OPENING are excluded from movement everywhere because they ARE the opening, not transactions. '
||'Debit and credit sides are decided at the posting account and only then summed up the hierarchy, so every parent row foots to its own children. Amounts are base currency only - this ERP holds no currency or exchange-rate column anywhere in the vouche'
||'r chain.'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12577539703300009)
,p_name=>'Balance Control'
,p_static_id=>'balance-control'
,p_template=>4502917002193490937
,p_display_sequence=>18
,p_region_css_classes=>'ds-finbalwrap'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Fy As (',
'       /* Always exactly one row. A From Date outside every defined',
'          financial year would otherwise empty this CTE and, with it,',
'          every aggregate downstream. Falling back to the From Date',
'          itself makes the opening nil and leaves movement intact; the',
'          header chip already says the date is outside any known year. */',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P675_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P675_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     /* The eleven vouchers numbered OPENING ARE the carry-forward; they',
'        are already inside the Opening table, so counting them again as',
'        movement would double the whole balance sheet. RefreshOpening in',
'        the ERP excludes them for exactly this reason. */',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Op As (',
'       Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt',
'         From Opening o, Fy',
'        Where o.OpeningDate = Fy.Fb',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P675_PANEL    Is Null Or o.Panel        = :P675_PANEL)',
'          And (:P675_COMPANY  Is Null Or o.CompanyCode  = :P675_COMPANY)',
'          And (:P675_LOCATION Is Null Or o.LocationCode = :P675_LOCATION)',
'        Group By o.AccountCode),',
'     Mv As (',
'       Select d.AccountCode Acct,',
'              Sum(Case When d.VoucherDate <  to_date(:P675_FROMDATE,''DD-MM-RRRR'') Then nvl(d.Amount,0) Else 0 End) Pre,',
'              Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'              Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr',
'         From VoucherDetail d, Fy',
'        Where d.VoucherDate >= Fy.Fb',
'          And d.VoucherDate <  to_date(:P675_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P675_PANEL    Is Null Or d.Panel        = :P675_PANEL)',
'          And (:P675_COMPANY  Is Null Or d.CompanyCode  = :P675_COMPANY)',
'          And (:P675_LOCATION Is Null Or d.LocationCode = :P675_LOCATION)',
'        Group By d.AccountCode),',
'     Bal As (',
'       Select nvl(o.Amt,0) + nvl(m.Pre,0) Opn, nvl(m.Dr,0) Dr, nvl(m.Cr,0) Cr',
'         From Op o Full Outer Join Mv m On m.Acct = o.Acct),',
'     T As (',
'       Select Sum(Greatest(-Opn,0)) OpDr, Sum(Greatest(Opn,0)) OpCr,',
'              Sum(Dr) PDr, Sum(Cr) PCr,',
'              Sum(Greatest(-(Opn-Dr+Cr),0)) ClDr, Sum(Greatest((Opn-Dr+Cr),0)) ClCr',
'         From Bal)',
'Select /* 1 - OPENING */',
'       ''<div class="ds-finbal ds-finbal--''',
'    || Case When Abs(t.OpDr-t.OpCr) < 0.005 Then ''ok''',
'            When Abs(t.OpDr-t.OpCr) < 1     Then ''warn'' Else ''bad'' End || ''">''',
'    || ''<div class="ds-finbal-t"><span class="fa fa-flag-o"></span>Opening as at '' || :P675_FROMDATE || ''</div>''',
'    || ''<div class="ds-finbal-pair">''',
'    || ''<dl class="ds-finbal-side ds-finbal-side--dr"><dt>Opening Debit</dt><dd>&#8377;''',
'       || Case When t.OpDr >= 10000000 Then to_char(t.OpDr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'               When t.OpDr >= 100000   Then to_char(t.OpDr/100000,''FM99G990D00'')||''<i>L</i>''',
'               Else to_char(t.OpDr,''FM99G99G990D00'') End || ''</dd></dl>''',
'    || ''<dl class="ds-finbal-side ds-finbal-side--cr"><dt>Opening Credit</dt><dd>&#8377;''',
'       || Case When t.OpCr >= 10000000 Then to_char(t.OpCr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'               When t.OpCr >= 100000   Then to_char(t.OpCr/100000,''FM99G990D00'')||''<i>L</i>''',
'               Else to_char(t.OpCr,''FM99G99G990D00'') End || ''</dd></dl>''',
'    || ''</div><div class="ds-finbal-foot"><span class="ds-finbal-diff">Difference <b>&#8377;''',
'       || to_char(Abs(t.OpDr-t.OpCr),''FM9G99G99G99G99G990D00'') || ''</b></span>''',
'    || Case When Abs(t.OpDr-t.OpCr) < 0.005',
'            Then ''<span class="ds-finbal-flag"><span class="fa fa-check"></span>In balance</span>''',
'            Else ''<span class="ds-finbal-flag"><span class="fa fa-exclamation-triangle"></span>Out of balance</span>'' End',
'    || ''</div></div>'' As BAL_OPENING,',
'',
'       /* 2 - MOVEMENT.  Always expected to balance: it is the sum of',
'          voucher lines, and every voucher in this ERP nets to zero. */',
'       ''<div class="ds-finbal ds-finbal--''',
'    || Case When Abs(t.PDr-t.PCr) < 0.005 Then ''ok''',
'            When Abs(t.PDr-t.PCr) < 1     Then ''warn'' Else ''bad'' End || ''">''',
'    || ''<div class="ds-finbal-t"><span class="fa fa-exchange"></span>Movement '' || :P675_FROMDATE || '' &ndash; '' || :P675_TODATE || ''</div>''',
'    || ''<div class="ds-finbal-pair">''',
'    || ''<dl class="ds-finbal-side ds-finbal-side--dr"><dt>Period Debit</dt><dd>&#8377;''',
'       || Case When t.PDr >= 10000000 Then to_char(t.PDr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'               When t.PDr >= 100000   Then to_char(t.PDr/100000,''FM99G990D00'')||''<i>L</i>''',
'               Else to_char(t.PDr,''FM99G99G990D00'') End || ''</dd></dl>''',
'    || ''<dl class="ds-finbal-side ds-finbal-side--cr"><dt>Period Credit</dt><dd>&#8377;''',
'       || Case When t.PCr >= 10000000 Then to_char(t.PCr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'               When t.PCr >= 100000   Then to_char(t.PCr/100000,''FM99G990D00'')||''<i>L</i>''',
'               Else to_char(t.PCr,''FM99G99G990D00'') End || ''</dd></dl>''',
'    || ''</div><div class="ds-finbal-foot"><span class="ds-finbal-diff">Difference <b>&#8377;''',
'       || to_char(Abs(t.PDr-t.PCr),''FM9G99G99G99G99G990D00'') || ''</b></span>''',
'    || Case When Abs(t.PDr-t.PCr) < 0.005',
'            Then ''<span class="ds-finbal-flag"><span class="fa fa-check"></span>In balance</span>''',
'            Else ''<span class="ds-finbal-flag"><span class="fa fa-exclamation-triangle"></span>Out of balance</span>'' End',
'    || ''</div></div>'' As BAL_MOVEMENT,',
'',
'       /* 3 - CLOSING */',
'       ''<div class="ds-finbal ds-finbal--''',
'    || Case When Abs(t.ClDr-t.ClCr) < 0.005 Then ''ok''',
'            When Abs(t.ClDr-t.ClCr) < 1     Then ''warn'' Else ''bad'' End || ''">''',
'    || ''<div class="ds-finbal-t"><span class="fa fa-balance-scale"></span>Closing as at '' || :P675_TODATE || ''</div>''',
'    || ''<div class="ds-finbal-pair">''',
'    || ''<dl class="ds-finbal-side ds-finbal-side--dr"><dt>Closing Debit</dt><dd>&#8377;''',
'       || Case When t.ClDr >= 10000000 Then to_char(t.ClDr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'               When t.ClDr >= 100000   Then to_char(t.ClDr/100000,''FM99G990D00'')||''<i>L</i>''',
'               Else to_char(t.ClDr,''FM99G99G990D00'') End || ''</dd></dl>''',
'    || ''<dl class="ds-finbal-side ds-finbal-side--cr"><dt>Closing Credit</dt><dd>&#8377;''',
'       || Case When t.ClCr >= 10000000 Then to_char(t.ClCr/10000000,''FM9G99G990D00'')||''<i>Cr</i>''',
'               When t.ClCr >= 100000   Then to_char(t.ClCr/100000,''FM99G990D00'')||''<i>L</i>''',
'               Else to_char(t.ClCr,''FM99G99G990D00'') End || ''</dd></dl>''',
'    || ''</div><div class="ds-finbal-foot"><span class="ds-finbal-diff">Difference <b>&#8377;''',
'       || to_char(Abs(t.ClDr-t.ClCr),''FM9G99G99G99G99G990D00'') || ''</b></span>''',
'    || Case When Abs(t.ClDr-t.ClCr) < 0.005',
'            Then ''<span class="ds-finbal-flag"><span class="fa fa-check"></span>In balance</span>''',
'            Else ''<span class="ds-finbal-flag"><span class="fa fa-exclamation-triangle"></span>Out of balance</span>'' End',
'    || ''</div></div>'' As BAL_CLOSING',
'  From T t'))
,p_display_when_condition=>'nvl(:P675_SHOWBC,''N'') = ''Y'''
,p_display_when_cond2=>'PLSQL'
,p_display_condition_type=>'EXPRESSION'
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL'
,p_lazy_loading=>true
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12577659167300009)
,p_query_column_id=>3
,p_column_alias=>'BAL_CLOSING'
,p_column_display_sequence=>30
,p_column_heading=>'Closing'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12577704247300009)
,p_query_column_id=>2
,p_column_alias=>'BAL_MOVEMENT'
,p_column_display_sequence=>20
,p_column_heading=>'Movement'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12577823304300009)
,p_query_column_id=>1
,p_column_alias=>'BAL_OPENING'
,p_column_display_sequence=>10
,p_column_heading=>'Opening'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12577944654300009)
,p_name=>'Balance Basis'
,p_static_id=>'balance-note'
,p_template=>4502917002193490937
,p_display_sequence=>19
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With X As (',
'       Select Count(*) N, nvl(Sum(Legs),0) Legs From (',
'         Select d.Tno, Count(Distinct d.LocationCode) Legs',
'           From VoucherDetail d',
'          Where d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'')',
'            And d.VoucherDate <  to_date(:P675_TODATE,''DD-MM-RRRR'') + 1',
'            And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'            And (:P675_COMPANY Is Null Or d.CompanyCode = :P675_COMPANY)',
'          Group By d.Tno',
'         Having Count(Distinct d.LocationCode) > 1))',
'Select ''<div class="ds-finnote">''',
'    || ''<span class="fa fa-info-circle"></span>''',
'    || ''<b>How these numbers are made.</b> Opening = the <code>Opening</code> table at the financial-year ''',
'    || ''begin (the ERP''''s own year-end close, which resets every Income and Expenditure account and carries ''',
'    || ''their net into <code>PROFITANDLOSSACCOUNT</code>) plus <code>VoucherDetail</code> movement from that ''',
'    || ''date to the day before From&nbsp;Date. Movement = <code>VoucherDetail</code> between From&nbsp;Date ''',
'    || ''and To&nbsp;Date. Closing = Opening + Movement. A debit is a negative <code>Amount</code> and a ''',
'    || ''credit a positive one. The eleven carry-forward vouchers numbered <code>OPENING</code> are excluded ''',
'    || ''from movement because they <em>are</em> the opening. Differences are compared at full precision, ''',
'    || ''never on the rounded figure shown.''',
'    || ''</div>''',
'    /* Only shown when a location filter is actually on, and only when',
'       cross-location vouchers actually exist in the chosen window. */',
'    || Case When :P675_LOCATION Is Not Null And x.N > 0 Then',
'            ''<div class="ds-finnote ds-finnote--warn">''',
'            || ''<span class="fa fa-exclamation-triangle"></span>''',
'            || ''<b>You have filtered to one location, so this trial balance may not balance &mdash; and that is not an error.</b> ''',
'            || to_char(x.N,''FM999G990'') || '' voucher(s) in this period post lines across more than one location, ''',
'            || ''so their other leg sits outside the location you selected. A trial balance is only guaranteed ''',
'            || ''to balance at company level or above; no voucher in this ledger crosses a company boundary. ''',
'            || ''Clear the Location filter to see the balanced position.''',
'            || ''</div>'' End As NOTE',
'  From X x'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12578041957300009)
,p_query_column_id=>1
,p_column_alias=>'NOTE'
,p_column_display_sequence=>10
,p_column_heading=>'NOTE'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12578137816300009)
,p_name=>'Trial Balance Intelligence'
,p_static_id=>'command-header'
,p_template=>4502917002193490937
,p_display_sequence=>5
,p_region_css_classes=>'ds-fin-headregion'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select ''<div class="ds-fin-head">''',
'    /* Analytics CTA, pinned to the top-right of the header band the',
'       same way page 703''s Purchase Analytics link is. Carries all six',
'       filter values so page 704 opens on the same Trial Balance scope. */',
'    || ''<a class="ds-head-cta" href="''',
'       || apex_page.get_url(',
'            p_page   => 704,',
'            p_clear_cache => ''704'',',
'            p_items  => ''P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION,P704_PANEL,P704_ACCOUNTGROUP'',',
'            p_values => :P675_FROMDATE||'',''||:P675_TODATE||'',''||:P675_COMPANY||'',''||:P675_LOCATION',
'                        ||'',''||:P675_PANEL||'',''||:P675_ACCOUNTGROUP)',
'       || ''"><span class="fa fa-bar-chart"></span>Trial Balance Analytics <b>&rarr;</b></a>''',
'    || ''<div class="ds-fin-eyebrow">Finance &middot; General Ledger</div>''',
'    || ''<h1 class="ds-fin-title">Trial Balance Intelligence</h1>''',
'    || ''<div class="ds-fin-sub">Opening balances, period movement, closing position, financial exceptions and complete voucher traceability</div>''',
'    || ''<div class="ds-fin-context">''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar"></span>Period <b>''',
'       || :P675_FROMDATE || '' &rarr; '' || :P675_TODATE || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-calendar-check-o"></span>Financial Year <b>''',
'       || nvl((Select f.FinancialYearCode From FinancialYear f',
'                Where to_date(:P675_FROMDATE,''DD-MM-RRRR'')',
'                      Between f.FinancialYearBegin And f.FinancialYearEnd),''outside any defined year'')',
'       || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-building-o"></span>Company <b>''',
'       || apex_escape.html(nvl((Select c.CompanyName From Company c Where c.CompanyCode = :P675_COMPANY),''All companies'')) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-map-marker"></span>Location <b>''',
'       || apex_escape.html(nvl((Select l.LocationName From Location l Where l.LocationCode = :P675_LOCATION),''All locations'')) || ''</b></span>''',
'    || ''<span class="ds-fin-chip"><span class="fa fa-shield"></span>Panel <b>''',
'       || Case When (Select GetUserPanelAB_apex() From dual) Is Not Null',
'               Then (Select GetUserPanelAB_apex() From dual) || '' (enforced)''',
'               When :P675_PANEL Is Not Null Then :P675_PANEL',
'               Else ''A + B'' End || ''</b></span>''',
'    || Case When :P675_ACCOUNTGROUP Is Not Null Then',
'            ''<span class="ds-fin-chip"><span class="fa fa-sitemap"></span>Group <b>''',
'            || apex_escape.html(nvl((Select p.PartyName From Party p Where p.PartyCode = :P675_ACCOUNTGROUP),:P675_ACCOUNTGROUP))',
'            || ''</b></span>'' End',
'    /* Arriving from a Profit and Loss line, the reader is not looking at',
'       a group and must not be told they are - the population is a P and L',
'       head, and Operating Expense in particular exists in no group at all.',
'       The chip names the line they came from instead. */',
'    || Case When :P675_PNLBUCKET Is Not Null Then',
'            ''<span class="ds-fin-chip ds-fin-chip--live"><span class="fa fa-crosshairs"></span>P and L line <b>''',
'            || Case :P675_PNLBUCKET',
'                    When ''REVENUE'' Then ''Revenue''',
'                    When ''DIRECT''  Then ''Direct Cost''',
'                    When ''OPEX''    Then ''Operating Expense''',
'                    When ''DEPN''    Then ''Depreciation''',
'                    When ''FIN''     Then ''Finance Cost''',
'                    When ''TAX''     Then ''Tax''',
'                    Else apex_escape.html(:P675_PNLBUCKET) End',
'            || ''</b> &mdash; posting accounts only, footing to that line</span>'' End',
'    /* Currency is stated explicitly rather than assumed: there is no',
'       currency column anywhere in the voucher chain, so every figure',
'       on this page is base currency and saying so is the honest form. */',
'    || ''<span class="ds-fin-chip"><span class="fa fa-money"></span>Currency <b>INR (base, single-currency ledger)</b></span>''',
'    /* Freshness is the newest posting THIS LOGIN may see, so the chip',
'       can never disclose a voucher outside the user''s panel or scope. */',
'    || ''<span class="ds-fin-chip ds-fin-chip--live"><span class="fa fa-clock-o"></span>Last posting <b>''',
'       || nvl((Select to_char(Max(d.VoucherDate),''DD-MM-RRRR'')',
'                 From VoucherDetail d',
'                Where ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'                  And (:P675_PANEL    Is Null Or d.Panel        = :P675_PANEL)',
'                  And (:P675_COMPANY  Is Null Or d.CompanyCode  = :P675_COMPANY)',
'                  And (:P675_LOCATION Is Null Or d.LocationCode = :P675_LOCATION)),''no postings'') || ''</b></span>''',
'    || ''</div></div>'' As HEAD',
'  From dual'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL,P675_ACCOUNTGROUP,P675_PNLBUCKET'
,p_lazy_loading=>false
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12578224769300010)
,p_query_column_id=>1
,p_column_alias=>'HEAD'
,p_column_display_sequence=>10
,p_column_heading=>'HEAD'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12578344798300010)
,p_plug_name=>'Filters'
,p_static_id=>'filter-bar'
,p_region_name=>'p675Filters'
,p_region_css_classes=>'ds-dash-filters'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>10
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12578468579300010)
,p_plug_name=>'Advanced Filters'
,p_static_id=>'filter-drawer'
,p_region_name=>'p675Drawer'
,p_region_css_classes=>'ds-filterdrawer js-dialog-class-t-Drawer--pullOutEnd'
,p_region_template_options=>'#DEFAULT#:t-Form--slimPadding:t-Form--stretchInputs'
,p_plug_template=>1662449473392619772
,p_plug_display_sequence=>12
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12578542115300010)
,p_plug_name=>'Balance Control'
,p_static_id=>'rule-balance'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>15
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-fin-section">',
'  <h2>Balance Control</h2>',
'  <p>Do the books balance? Opening, movement and closing are each proved separately, at full precision</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12578601579300010)
,p_plug_name=>'Trial Balance'
,p_static_id=>'rule-tb'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>30
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-fin-section">',
'  <h2>Trial Balance</h2>',
'  <p>Nature &rarr; group &rarr; subgroup &rarr; ledger account. Set Levels and Account in the filter bar; click a group to open it, or a ledger account to open its statement</p>',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12578798897300034)
,p_plug_name=>'Trial Balance Basis'
,p_static_id=>'tb-note'
,p_region_css_classes=>'ds-fin-sectionregion'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>4502917002193490937
,p_plug_display_sequence=>35
,p_plug_item_display_point=>'ABOVE'
,p_location=>null
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="ds-finnote">',
'  <span class="fa fa-info-circle"></span>',
'  <b>Reading this table.</b> Indentation is the account hierarchy; a parent row is the sum of every',
'  posting account beneath it, so the level&nbsp;1 rows add up to the Balance Control band above.',
'  <b>Kind</b> separates a group from a posting account &mdash; this ERP never posts to a group.',
'  <b>Movement&nbsp;%</b> is period movement over the absolute opening balance and is deliberately',
'  blank, not zero, where there is no opening to compare against. The last row is the total across posting accounts in scope, not the sum of the rows above it - a parent already contains its children. Zero-balance and',
'  no-movement inclusion are in <b>Advanced Filters</b>; Levels and Account are in the filter bar. Use the report''s Actions menu to download.',
'</div>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12578853273300035)
,p_plug_name=>'Trial Balance'
,p_static_id=>'trial-balance'
,p_region_css_classes=>'ds-dash-panel ds-register'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>2102002977963900996
,p_plug_display_sequence=>32
,p_plug_item_display_point=>'ABOVE'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'With Fy As (',
'       /* Always exactly one row. A From Date outside every defined',
'          financial year would otherwise empty this CTE and, with it,',
'          every aggregate downstream. Falling back to the From Date',
'          itself makes the opening nil and leaves movement intact; the',
'          header chip already says the date is outside any known year. */',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P675_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P675_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     /* BALANCE SHEET and PROFIT AND LOSS are not real structure. An',
'        end user created them so the two halves of the trial balance',
'        would print apart, and 40 other major groups were never put',
'        inside either - so starting the walk at those two names left',
'        most of the chart unreachable and 41 accounts in a bucket.',
'',
'        The statement a group belongs to is therefore derived from its',
'        NATURE, not from its parent: Assets and Liabilities hang under',
'        BALANCESHEET, Income and Expenditure under PROFITANDLOSS. The',
'        two containers carry no NatureOfAccountCode themselves, so for',
'        anything already inside one of them the nature comes from the',
'        level-2 node''s identity (ASSET / LIABILITY / INCOME /',
'        EXPENDITURES) instead. Nine roots have no nature set at all and',
'        collect under NOSTATEMENT rather than disappearing.',
'',
'        Seg is ranked over the GRAFTED parent, not ParentCode, so a',
'        group moved in by nature and one that was always there sort',
'        against each other by name instead of against two unrelated',
'        sequences. Sibling ordinals, not names, because account names',
'        contain slashes and would break the path. */',
'     Ord As (',
'       Select p.PartyCode, p.ParentCode, p.NatureOfAccountCode NatCode,',
'              lpad(to_char(Row_Number() Over (',
'                   Partition By Case When p.ParentCode Is Not Null Then p.ParentCode',
'                                     When p.NatureOfAccountCode In (''ASSETS'',''LIABILITIES'') Then ''BALANCESHEET''',
'                                     When p.NatureOfAccountCode In (''INCOME'',''EXPENSES'')    Then ''PROFITANDLOSS''',
'                                     Else ''NOSTATEMENT'' End',
'                   Order By p.PartyName, p.PartyCode)),4,''0'') Seg',
'         From Party p),',
'     Walk As (',
'       Select o.PartyCode Acct, Level Lvl,',
'              Connect_By_Root o.PartyCode Root,',
'              Connect_By_Root o.NatCode   RootNat,',
'              Sys_Connect_By_Path(o.PartyCode,''/'') Path,',
'              Sys_Connect_By_Path(o.Seg,''/'')       SortPath,',
'              regexp_substr(Sys_Connect_By_Path(o.PartyCode,''/''),''[^/]+'',1,2) L2',
'         From Ord o',
'        Start With o.ParentCode Is Null',
'      Connect By Prior o.PartyCode = o.ParentCode),',
'     Graft As (',
'       Select w.Acct, w.Lvl, w.Root, w.Path, w.SortPath,',
'              /* Which line of the Profit and Loss this account rolls into,',
'                 decided by the same rule page 705 uses, so a head clicked',
'                 there and the rows landed on here are the same population',
'                 by construction and not by coincidence.',
'',
'                 It travels as a bucket rather than as an account code',
'                 because Operating Expense is not a group and cannot be',
'                 named by one: it is EXPENDITURES less direct cost, less',
'                 depreciation, less finance cost, less tax. Passing the',
'                 EXPENDITURES group instead - which is what this page used',
'                 to receive - opened a total five times the size of the',
'                 line that was clicked. */',
'              Case When w.L2 = ''INCOME'' Or w.RootNat = ''INCOME''          Then ''REVENUE''',
'                   When regexp_substr(w.Path,''[^/]+'',1,3) = ''DIRECTCOST''   Then ''DIRECT''',
'                   When regexp_substr(w.Path,''[^/]+'',1,3) = ''DEPRECIATION'' Then ''DEPN''',
'                   When regexp_substr(w.Path,''[^/]+'',1,3) = ''4892''         Then ''FIN''',
'                   When regexp_substr(w.Path,''[^/]+'',1,3) = ''7481''         Then ''TAX''',
'                   When w.L2 = ''EXPENDITURES'' Or w.RootNat = ''EXPENSES''  Then ''OPEX''',
'              End Bkt,',
'              Case When w.RootNat In (''ASSETS'',''LIABILITIES'') Then ''BALANCESHEET''',
'                   When w.RootNat In (''INCOME'',''EXPENSES'')    Then ''PROFITANDLOSS''',
'                   When w.Root = ''BALANCESHEET''  And w.L2 In (''ASSET'',''LIABILITY'')     Then ''BALANCESHEET''',
'                   When w.Root = ''PROFITANDLOSS'' And w.L2 In (''INCOME'',''EXPENDITURES'') Then ''PROFITANDLOSS''',
'                   Else ''NOSTATEMENT'' End Stm,',
'              Case When w.RootNat = ''ASSETS''      Or (w.Root = ''BALANCESHEET''  And w.L2 = ''ASSET'')        Then ''1''',
'                   When w.RootNat = ''LIABILITIES'' Or (w.Root = ''BALANCESHEET''  And w.L2 = ''LIABILITY'')    Then ''2''',
'                   When w.RootNat = ''INCOME''      Or (w.Root = ''PROFITANDLOSS'' And w.L2 = ''INCOME'')       Then ''1''',
'                   When w.RootNat = ''EXPENSES''    Or (w.Root = ''PROFITANDLOSS'' And w.L2 = ''EXPENDITURES'') Then ''2''',
'                   Else ''9'' End NatSeg',
'         From Walk w),',
'     Tree As (',
'       Select g.Acct, g.Bkt,',
'              Case When g.Root In (''BALANCESHEET'',''PROFITANDLOSS'') Then g.Lvl Else g.Lvl + 1 End Lvl,',
'              Case When g.Root In (''BALANCESHEET'',''PROFITANDLOSS'') Then g.Path',
'                   Else ''/'' || g.Stm || g.Path End Path,',
'              /* Nature is folded INTO the level-2 ordinal rather than',
'                 added as its own segment, so a path still has exactly',
'                 one segment per displayed level and Sk below can keep',
'                 taking the first lv.L of them. */',
'              ''/'' || Case g.Stm When ''BALANCESHEET'' Then ''1'' When ''PROFITANDLOSS'' Then ''2'' Else ''3'' End',
'                  || ''/'' || g.NatSeg || ''-''',
'                  || substr(Case When g.Root In (''BALANCESHEET'',''PROFITANDLOSS'')',
'                                 Then substr(g.SortPath, instr(g.SortPath,''/'',1,2))',
'                                 Else g.SortPath End, 2) SortPath',
'         From Graft g',
'        Where g.Acct Not In (''BALANCESHEET'',''PROFITANDLOSS'')),',
'     Op As (',
'       Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt',
'         From Opening o, Fy',
'        Where o.OpeningDate = Fy.Fb',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P675_PANEL    Is Null Or o.Panel        = :P675_PANEL)',
'          And (:P675_COMPANY  Is Null Or o.CompanyCode  = :P675_COMPANY)',
'          And (:P675_LOCATION Is Null Or o.LocationCode = :P675_LOCATION)',
'        Group By o.AccountCode),',
'     Mv As (',
'       Select d.AccountCode Acct,',
'              Sum(Case When d.VoucherDate <  to_date(:P675_FROMDATE,''DD-MM-RRRR'') Then nvl(d.Amount,0) Else 0 End) Pre,',
'              Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'              Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr,',
'              Max(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') Then d.VoucherDate End) LastMove',
'         From VoucherDetail d, Fy',
'        Where d.VoucherDate >= Fy.Fb',
'          And d.VoucherDate <  to_date(:P675_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P675_PANEL    Is Null Or d.Panel        = :P675_PANEL)',
'          And (:P675_COMPANY  Is Null Or d.CompanyCode  = :P675_COMPANY)',
'          And (:P675_LOCATION Is Null Or d.LocationCode = :P675_LOCATION)',
'        Group By d.AccountCode),',
'     /* Debit and credit sides are settled HERE, at the posting account,',
'        and only then summed up the tree. Netting a group first and',
'        splitting the sides afterwards makes a parent stop footing to',
'        its own children, which is the classic trial-balance bug. */',
'     Bal As (',
'       Select nvl(o.Acct,m.Acct) Acct,',
'              Greatest(-(nvl(o.Amt,0)+nvl(m.Pre,0)),0) OpDr,',
'              Greatest( (nvl(o.Amt,0)+nvl(m.Pre,0)),0) OpCr,',
'              nvl(m.Dr,0) Dr, nvl(m.Cr,0) Cr,',
'              Greatest(-(nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),0) ClDr,',
'              Greatest( (nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),0) ClCr,',
'              m.LastMove',
'         From Op o Full Outer Join Mv m On m.Acct = o.Acct),',
'     /* Optional subtree filter, resolved against the GRAFTED path in',
'        Tree rather than by walking Party down from the chosen group.',
'        Two reasons. A statement header is synthetic - walking down from',
'        BALANCESHEET would find only what the end user happened to put',
'        inside it, so the drill would show less than the row it was',
'        clicked from. And a single pass over Tree costs one scan,',
'        whereas `:X Is Null Or acct In (Select ... Connect By ...)`',
'        cannot be unnested under an OR and re-walks the hierarchy once',
'        per row. */',
'     Scope As (',
'       Select t.Acct PartyCode From Tree t',
'        Where (:P675_ACCOUNTGROUP Is Not Null Or :P675_PNLBUCKET Is Not Null)',
'          And (:P675_ACCOUNTGROUP Is Null',
'               Or instr(t.Path || ''/'', ''/'' || :P675_ACCOUNTGROUP || ''/'') > 0)',
'          And (:P675_PNLBUCKET Is Null Or t.Bkt = :P675_PNLBUCKET)',
'       Union All',
'       Select p.PartyCode From Party p',
'        Where :P675_ACCOUNTGROUP Is Null And :P675_PNLBUCKET Is Null),',
'     Kept As (',
'       Select b.* From Bal b',
'        Where b.Acct In (Select PartyCode From Scope)',
'          And (:P675_ZERO = ''Y'' Or b.ClDr + b.ClCr > 0.005)',
'          And (:P675_NOMOVE = ''Y'' Or b.Dr + b.Cr > 0.005)),',
'     Node As (',
'       Select regexp_substr(t.SortPath,''^(/[^/]+){''||lv.L||''}'') Sk,',
'              regexp_substr(t.Path,''[^/]+'',1,lv.L) Node, lv.L Lvl,',
'              /* The grafted parent, so Parent Group names the row this',
'                 one is actually printed under. Party.ParentCode cannot',
'                 answer that any more: a group moved in by nature still',
'                 has no parent of its own in the master data. */',
'              Case When lv.L > 1 Then regexp_substr(t.Path,''[^/]+'',1,lv.L-1) End Pnt,',
'              b.OpDr, b.OpCr, b.Dr, b.Cr, b.ClDr, b.ClCr, b.LastMove',
'         From Kept b',
'         Join Tree t On t.Acct = b.Acct',
'        /* 12, not 8: grafting pushed every major group that was not',
'           already inside a container down one level, so the tree now',
'           reaches nine. Least() caps each row at its own depth, so a',
'           generous ceiling costs nothing and a user who types 10 gets',
'           what they asked for instead of silently getting 8.',
'',
'           The depth is typed by hand now rather than picked from a',
'           list, so it is read defensively: a blank, a zero or a stray',
'           character would otherwise empty the entire report instead of',
'           falling back to the default of one level. */',
'        Cross Join (Select Level L From dual Connect By Level <= 12) lv',
'        Where nvl(:P675_LEDGERONLY,''N'') = ''N''',
'          And lv.L <= Least(t.Lvl,',
'                            Greatest(nvl(to_number(:P675_LEVEL default 1 on conversion error),1),1))',
'       Union All',
'       /* Ledger Only. The tree is not flattened after the fact - it is',
'          simply never built: no explode, no ancestor rows, one row per',
'          posting account. Sk is the account NAME, which is what orders',
'          the list, in place of the sort path a hierarchy would need.',
'',
'          Pnt is the account''s real ParentCode rather than a grafted',
'          ancestor, so the Parent Group column earns its place here: in a',
'          flat list it is the only thing telling you where an account',
'          belongs. The totals do not move, because this is the same set',
'          of posting accounts the tree was summing all along. */',
'       Select nvl(p9.PartyName, b.Acct), b.Acct, 1,',
'              (Select p8.ParentCode From Party p8 Where p8.PartyCode = b.Acct),',
'              b.OpDr, b.OpCr, b.Dr, b.Cr, b.ClDr, b.ClCr, b.LastMove',
'         From Kept b',
'         Left Join Party p9 On p9.PartyCode = b.Acct',
'        Where nvl(:P675_LEDGERONLY,''N'') = ''Y''',
'          And Not Exists (Select 1 From Party c Where c.ParentCode = b.Acct)',
'       Union All',
'       /* Accounts hanging off no structural root would otherwise vanish',
'          and the page would stop footing. They are shown, labelled, and',
'          counted instead. Every account now reaches a root, so this',
'          branch is a guard against future master data, not a live case. */',
'       Select ''/ZZZZ'', ''UNCLASSIFIED'', 1, Cast(Null As Varchar2(4000)),',
'              b.OpDr, b.OpCr, b.Dr, b.Cr, b.ClDr, b.ClCr, b.LastMove',
'         From Kept b Where Not Exists (Select 1 From Tree t Where t.Acct = b.Acct)),',
'     Agg As (',
'       Select n.Node, n.Lvl, n.Sk, n.Pnt,',
'              Sum(n.OpDr) OpDr, Sum(n.OpCr) OpCr, Sum(n.Dr) PDr, Sum(n.Cr) PCr,',
'              Sum(n.ClDr) ClDr, Sum(n.ClCr) ClCr, Max(n.LastMove) LastMove',
'         From Node n Group By n.Node, n.Lvl, n.Sk, n.Pnt)',
'Select Row_Number() Over (Order By a.Sk) As SEQ,',
'       a.Lvl                            As LVL,',
'       /* ACCOUNT, TREECLASS and ACCOUNT_URL are all PLAIN values; the',
'          markup that assembles them lives in the column''s htmlExpression:',
'              <span class="#TREECLASS#"><a href="#ACCOUNT_URL#">#ACCOUNT#</a></span>',
'',
'          The markup CANNOT come from a column. A #COL# substitution inside',
'          an htmlExpression is always escaped - the expression is raw, the',
'          values put into it are not - so a column holding a <span> printed',
'          the tags as visible text. Every one of the 123 htmlExpressions',
'          elsewhere in this app substitutes a plain value, which is the same',
'          rule seen from the other side.',
'',
'          Escaping these three is not a problem, it is the point: a party',
'          name containing & or / is escaped exactly once and renders',
'          correctly, and the & separators in the URL become &amp;, which is',
'          what an href is supposed to contain.',
'',
'          Download exports a column''s value, so the spreadsheet now gets',
'          `CURRENT ASSETS` rather than the anchor that used to be the value. */',
'       Case When a.Node = ''UNCLASSIFIED'' Then ''Accounts outside the chart-of-accounts tree''',
'            When a.Node = ''NOSTATEMENT''  Then ''Nature not set in the ERP''',
'            Else nvl(p.PartyName, a.Node) End As ACCOUNT,',
'       /* The tree is drawn by this class - one server-side query, so sort,',
'          filter, paginate and Download all keep working with no client tree',
'          widget. Ledger Only gets no indent class: every row is a peer',
'          there, and ds-fintree-l1 would print the whole list in the heavy',
'          weight reserved for a statement heading. */',
'       Case When nvl(:P675_LEDGERONLY,''N'') = ''Y'' Then ''ds-fintree-flat''',
'            Else ''ds-fintree-l'' || a.Lvl End',
'       || Case When a.Node = ''UNCLASSIFIED'' Then '' ds-fintree-leaf''',
'               When a.Node = ''NOSTATEMENT''  Then '' ds-fintree-grp''',
'               When Exists (Select 1 From Party c Where c.ParentCode = a.Node) Then '' ds-fintree-grp''',
'               Else '' ds-fintree-leaf'' End',
'       /* Every account link opens in a new tab, so the trial balance',
'          stays put while a statement is read beside it. The two',
'          synthetic rows have no page to open, and an href of',
'          javascript:void(0) with target="_blank" makes some browsers',
'          open a blank tab - so those rows are marked here and the CSS',
'          switches their anchor off entirely. Marking the row is the',
'          only way to do it: the htmlExpression is one static string',
'          shared by every row. */',
'       || Case When a.Node In (''UNCLASSIFIED'',''NOSTATEMENT'') Then '' ds-nolink'' End As TREECLASS,',
'       /* A group opens the group page, a ledger account its own statement.',
'          The two synthetic rows get a dead href rather than a link to a',
'          page that cannot receive them: NOSTATEMENT is not a real account,',
'          so handing it to the Account Group picker would set that item to a',
'          value its list does not contain.',
'',
'          The depth travels with the drill - the clicked group''s OWN level',
'          plus three - so opening a group always shows three levels of what',
'          is inside it. Carrying the reader''s current setting was useless:',
'          drilling a level-3 group while the box said 3 reopened the page',
'          showing that one row and nothing under it. */',
'       Case When a.Node In (''UNCLASSIFIED'',''NOSTATEMENT'') Then ''javascript:void(0)''',
'            When Exists (Select 1 From Party c Where c.ParentCode = a.Node)',
'            Then apex_page.get_url(p_page => 675, p_clear_cache => '''',',
'                   p_items  => ''P675_ACCOUNTGROUP,P675_LEVEL,P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL'',',
'                   p_values => a.Node || '','' || to_char(a.Lvl + 3) || '','' || :P675_FROMDATE || '','' || :P675_TODATE || '',''',
'                               || :P675_COMPANY || '','' || :P675_LOCATION || '','' || :P675_PANEL)',
'            Else apex_page.get_url(p_page => 677, p_clear_cache => ''677'',',
'                   p_items  => ''P677_ACCOUNT,P677_FROMDATE,P677_TODATE,P677_COMPANY,P677_LOCATION,P677_PANEL'',',
'                   p_values => a.Node || '','' || :P675_FROMDATE || '','' || :P675_TODATE || '',''',
'                               || :P675_COMPANY || '','' || :P675_LOCATION || '','' || :P675_PANEL)',
'            End                          As ACCOUNT_URL,',
'       a.Node                           As ACCOUNT_CODE,',
'       Case When a.Node = ''NOSTATEMENT'' Then ''Group''',
'            When Exists (Select 1 From Party c Where c.ParentCode = a.Node) Then ''Group''',
'            Else ''Ledger'' End                As KIND,',
'       Case When a.Pnt = ''NOSTATEMENT'' Then ''Nature not set in the ERP''',
'            Else nvl(gp.PartyName, chr(8212)) End As PARENT_GROUP,',
'       Round(a.OpDr,2)                  As OPENING_DEBIT,',
'       Round(a.OpCr,2)                  As OPENING_CREDIT,',
'       Round(a.PDr,2)                   As PERIOD_DEBIT,',
'       Round(a.PCr,2)                   As PERIOD_CREDIT,',
'       Round(a.ClDr,2)                  As CLOSING_DEBIT,',
'       Round(a.ClCr,2)                  As CLOSING_CREDIT,',
'       /* Movement as a share of the opening position. Null, not zero,',
'          when there is no opening to compare against - a brand new',
'          account has no percentage change and printing 0% would lie. */',
'       Case When Abs(a.OpDr-a.OpCr) > 0.005',
'            Then Round((a.PDr-a.PCr) / Abs(a.OpDr-a.OpCr) * 100, 2) End As MOVEMENT_PCT,',
'       a.LastMove                       As LAST_POSTING,',
'       /* Plain word for the download, chip for the screen - the same',
'          split as ACCOUNT above. One Case decides the state so the two',
'          can never disagree. */',
'       Case When a.Node = ''UNCLASSIFIED''                             Then ''Off tree''',
'            When a.Node = ''NOSTATEMENT''                              Then ''No nature''',
'            When a.PDr + a.PCr < 0.005 And a.ClDr + a.ClCr > 0.005   Then ''Dormant''',
'            When a.ClDr + a.ClCr < 0.005                             Then ''Nil''',
'            When a.ClDr > a.ClCr                                     Then ''Debit''',
'            Else                                                          ''Credit'' End As POSITION,',
'       /* Plain word plus a plain class, assembled by the column''s',
'          htmlExpression: <span class="#POSITION_CLASS#">#POSITION#</span>.',
'          Same reason as ACCOUNT above - a column cannot carry markup into',
'          an htmlExpression, because the substitution is escaped. One Case',
'          decides the state and the other reads it, so the word and the',
'          colour can never disagree. */',
'       Case When a.Node = ''UNCLASSIFIED''                             Then ''ds-finchip ds-finchip--watch''',
'            When a.Node = ''NOSTATEMENT''                              Then ''ds-finchip ds-finchip--watch''',
'            When a.PDr + a.PCr < 0.005 And a.ClDr + a.ClCr > 0.005   Then ''ds-finchip ds-finchip--flat''',
'            When a.ClDr + a.ClCr < 0.005                             Then ''ds-finchip ds-finchip--flat''',
'            When a.ClDr > a.ClCr                                     Then ''ds-finchip ds-finchip--dr''',
'            Else                                                          ''ds-finchip ds-finchip--cr'' End As POSITION_CLASS',
'  From Agg a',
'  Left Join Party p  On p.PartyCode = a.Node',
'  Left Join Party gp On gp.PartyCode = a.Pnt',
' Order By a.Sk'))
,p_plug_source_type=>'NATIVE_IR'
,p_ajax_items_to_submit=>'P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL,P675_LEVEL,P675_ACCOUNTGROUP,P675_PNLBUCKET,P675_ZERO,P675_NOMOVE,P675_LEDGERONLY'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>11
,p_prn_height=>8.5
,p_prn_orientation=>'HORIZONTAL'
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
 p_id=>wwv_flow_imp.id(12578938210300035)
,p_no_data_found_message=>'No account has an opening balance or a movement in this period for the selected scope. Widen the dates, or raise Levels, or switch on zero-balance and no-movement accounts in Advanced Filters.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_show_display_row_count=>'Y'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>true
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_internal_uid=>43515614598737326
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579028071300035)
,p_db_column_name=>'ACCOUNT'
,p_display_order=>10
,p_column_identifier=>'C'
,p_column_label=>'Account'
,p_column_html_expression=>'<span class="#TREECLASS#"><a href="#ACCOUNT_URL#" target="_blank" rel="noopener">#ACCOUNT#</a></span>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579187385300035)
,p_db_column_name=>'ACCOUNT_CODE'
,p_display_order=>20
,p_column_identifier=>'D'
,p_column_label=>'Code'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579266819300035)
,p_db_column_name=>'ACCOUNT_URL'
,p_display_order=>13
,p_column_identifier=>'R'
,p_column_label=>'ACCOUNT_URL'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579380846300035)
,p_db_column_name=>'CLOSING_CREDIT'
,p_display_order=>80
,p_column_identifier=>'L'
,p_column_label=>'Closing Cr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579414940300035)
,p_db_column_name=>'CLOSING_DEBIT'
,p_display_order=>70
,p_column_identifier=>'K'
,p_column_label=>'Closing Dr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579572884300035)
,p_db_column_name=>'KIND'
,p_display_order=>25
,p_column_identifier=>'E'
,p_column_label=>'Kind'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579656270300035)
,p_db_column_name=>'LAST_POSTING'
,p_display_order=>100
,p_column_identifier=>'N'
,p_column_label=>'Last Posting'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'DD-MM-RRRR'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579759754300035)
,p_db_column_name=>'LVL'
,p_display_order=>8
,p_column_identifier=>'B'
,p_column_label=>'Level'
,p_column_type=>'NUMBER'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579880878300035)
,p_db_column_name=>'MOVEMENT_PCT'
,p_display_order=>90
,p_column_identifier=>'M'
,p_column_label=>'Movement %'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12579972905300035)
,p_db_column_name=>'OPENING_CREDIT'
,p_display_order=>40
,p_column_identifier=>'H'
,p_column_label=>'Opening Cr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12580064091300036)
,p_db_column_name=>'OPENING_DEBIT'
,p_display_order=>30
,p_column_identifier=>'G'
,p_column_label=>'Opening Dr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12580102546300036)
,p_db_column_name=>'PARENT_GROUP'
,p_display_order=>28
,p_column_identifier=>'F'
,p_column_label=>'Parent Group'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12580203543300036)
,p_db_column_name=>'PERIOD_CREDIT'
,p_display_order=>60
,p_column_identifier=>'J'
,p_column_label=>'Period Cr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12580365377300036)
,p_db_column_name=>'PERIOD_DEBIT'
,p_display_order=>50
,p_column_identifier=>'I'
,p_column_label=>'Period Dr'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'9G99G99G99G99G990D00'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12580472460300036)
,p_db_column_name=>'POSITION'
,p_display_order=>110
,p_column_identifier=>'O'
,p_column_label=>'Position'
,p_column_html_expression=>'<span class="#POSITION_CLASS#">#POSITION#</span>'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12580550597300036)
,p_db_column_name=>'POSITION_CLASS'
,p_display_order=>113
,p_column_identifier=>'P'
,p_column_label=>'POSITION_CLASS'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12580614857300036)
,p_db_column_name=>'SEQ'
,p_display_order=>5
,p_column_identifier=>'A'
,p_column_label=>'#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(12580747659300036)
,p_db_column_name=>'TREECLASS'
,p_display_order=>14
,p_column_identifier=>'Q'
,p_column_label=>'TREECLASS'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_use_as_row_header=>'N'
,p_available_clientside=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(12580872244300036)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'1'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'ACCOUNT:KIND:OPENING_DEBIT:OPENING_CREDIT:PERIOD_DEBIT:PERIOD_CREDIT:CLOSING_DEBIT:CLOSING_CREDIT:MOVEMENT_PCT:LAST_POSTING:POSITION'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12580910337300036)
,p_name=>'Trial Balance Totals'
,p_static_id=>'trial-balance-totals'
,p_template=>4502917002193490937
,p_display_sequence=>33
,p_region_css_classes=>'ds-tb-totals-region'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* Totals row footing the Trial Balance above. Summed at the POSTING',
'   account (Bal is one row per leaf) so a group''s balance is never',
'   double-counted through its own hierarchy. Reconciliation status',
'   compares Dr and Cr on each of the three columns: opening, period',
'   movement and closing. A trial balance that does not net to zero on',
'   any of the three is the loudest possible signal that a voucher was',
'   posted one-sided. Same CTE shape as the Trial Balance region above',
'   so both foot to identical numbers. */',
'With Fy As (',
'       Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                    Where to_date(:P675_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                  to_date(:P675_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'     Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'     Op As (',
'       Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt',
'         From Opening o, Fy',
'        Where o.OpeningDate = Fy.Fb',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P675_PANEL    Is Null Or o.Panel        = :P675_PANEL)',
'          And (:P675_COMPANY  Is Null Or o.CompanyCode  = :P675_COMPANY)',
'          And (:P675_LOCATION Is Null Or o.LocationCode = :P675_LOCATION)',
'        Group By o.AccountCode),',
'     Mv As (',
'       Select d.AccountCode Acct,',
'              Sum(Case When d.VoucherDate <  to_date(:P675_FROMDATE,''DD-MM-RRRR'') Then nvl(d.Amount,0) Else 0 End) Pre,',
'              Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'              Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr',
'         From VoucherDetail d, Fy',
'        Where d.VoucherDate >= Fy.Fb',
'          And d.VoucherDate <  to_date(:P675_TODATE,''DD-MM-RRRR'') + 1',
'          And d.Tno Not In (Select Tno From Carry)',
'          And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'          And (:P675_PANEL    Is Null Or d.Panel        = :P675_PANEL)',
'          And (:P675_COMPANY  Is Null Or d.CompanyCode  = :P675_COMPANY)',
'          And (:P675_LOCATION Is Null Or d.LocationCode = :P675_LOCATION)',
'        Group By d.AccountCode),',
'     Bal As (',
'       Select nvl(o.Acct,m.Acct) Acct,',
'              Greatest(-(nvl(o.Amt,0)+nvl(m.Pre,0)),0) OpDr,',
'              Greatest( (nvl(o.Amt,0)+nvl(m.Pre,0)),0) OpCr,',
'              nvl(m.Dr,0) Dr, nvl(m.Cr,0) Cr,',
'              Greatest(-(nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),0) ClDr,',
'              Greatest( (nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),0) ClCr',
'         From Op o Full Outer Join Mv m On m.Acct = o.Acct),',
'     /* The same grafted scope the report above resolves, restated here',
'        because this region does not build the tree. If the two ever',
'        drift apart the page contradicts itself - the totals line would',
'        foot to a different population than the rows it sits under.',
'        BALANCE SHEET and PROFIT AND LOSS are synthetic parents, so',
'        membership is decided by the nature of an account''s root, not by',
'        walking Party down from the chosen group. */',
'     Scope As (',
'       Select w.Acct PartyCode',
'         From (Select p.PartyCode Acct,',
'                      Connect_By_Root p.PartyCode           Root,',
'                      Connect_By_Root p.NatureOfAccountCode RootNat,',
'                      Sys_Connect_By_Path(p.PartyCode,''/'')  Path',
'                 From Party p',
'                Start With p.ParentCode Is Null',
'              Connect By Prior p.PartyCode = p.ParentCode) w',
'        Where (:P675_ACCOUNTGROUP Is Not Null Or :P675_PNLBUCKET Is Not Null)',
'          And (:P675_ACCOUNTGROUP Is Null',
'               Or instr(Case When w.Root In (''BALANCESHEET'',''PROFITANDLOSS'') Then w.Path',
'                             Else ''/'' || Case When w.RootNat In (''ASSETS'',''LIABILITIES'') Then ''BALANCESHEET''',
'                                              When w.RootNat In (''INCOME'',''EXPENSES'')    Then ''PROFITANDLOSS''',
'                                              Else ''NOSTATEMENT'' End || w.Path End || ''/'',',
'                        ''/'' || :P675_ACCOUNTGROUP || ''/'') > 0)',
'          /* The P and L bucket, restated to match the report''s own Graft',
'             exactly. Same order of tests, same level-3 codes: if these two',
'             ever disagree the totals band stops footing to the rows. */',
'          And (:P675_PNLBUCKET Is Null',
'               Or Case When regexp_substr(w.Path,''[^/]+'',1,2) = ''INCOME''',
'                         Or w.RootNat = ''INCOME''                              Then ''REVENUE''',
'                       When regexp_substr(w.Path,''[^/]+'',1,3) = ''DIRECTCOST''   Then ''DIRECT''',
'                       When regexp_substr(w.Path,''[^/]+'',1,3) = ''DEPRECIATION'' Then ''DEPN''',
'                       When regexp_substr(w.Path,''[^/]+'',1,3) = ''4892''         Then ''FIN''',
'                       When regexp_substr(w.Path,''[^/]+'',1,3) = ''7481''         Then ''TAX''',
'                       When regexp_substr(w.Path,''[^/]+'',1,2) = ''EXPENDITURES''',
'                         Or w.RootNat = ''EXPENSES''                            Then ''OPEX''',
'                  End = :P675_PNLBUCKET)',
'       Union All',
'       Select p.PartyCode From Party p',
'        Where :P675_ACCOUNTGROUP Is Null And :P675_PNLBUCKET Is Null),',
'     Agg As (',
'       Select Sum(b.OpDr) OpDr, Sum(b.OpCr) OpCr,',
'              Sum(b.Dr)   PDr,  Sum(b.Cr)   PCr,',
'              Sum(b.ClDr) ClDr, Sum(b.ClCr) ClCr',
'         From Bal b',
'        Where b.Acct In (Select PartyCode From Scope))',
'/* Eleven cells, in the interactive report''s own displayed-column',
'   order: Account, Kind, Opening Dr, Opening Cr, Period Dr, Period Cr,',
'   Closing Dr, Closing Cr, Movement %, Last Posting, Position.',
'',
'   Matching the count and the order is what lets the script below',
'   drop this row into the report''s own <table> as a <tfoot>. Once it',
'   is inside that table the browser aligns it with the columns for',
'   free - no width measuring, and it stays aligned when a column is',
'   resized, hidden or reordered from the Actions menu. Trying to line',
'   two separate tables up by CSS cannot survive any of that. */',
'Select ''<div class="ds-tb-totals-wrap">''',
'    || ''<table class="ds-tb-totals"><tbody>''',
'    || ''<tr class="ds-tb-totals-row">''',
'    || ''<td class="ds-tb-totlabel">Total &mdash; all posting accounts in scope</td>''',
'    || ''<td></td>''',
'    || ''<td class="ds-num">'' || to_char(nvl(a.OpDr,0),''FM9G99G99G99G99G990D00'') || ''</td>''',
'    || ''<td class="ds-num">'' || to_char(nvl(a.OpCr,0),''FM9G99G99G99G99G990D00'') || ''</td>''',
'    || ''<td class="ds-num">'' || to_char(nvl(a.PDr,0),''FM9G99G99G99G99G990D00'')  || ''</td>''',
'    || ''<td class="ds-num">'' || to_char(nvl(a.PCr,0),''FM9G99G99G99G99G990D00'')  || ''</td>''',
'    || ''<td class="ds-num">'' || to_char(nvl(a.ClDr,0),''FM9G99G99G99G99G990D00'') || ''</td>''',
'    || ''<td class="ds-num">'' || to_char(nvl(a.ClCr,0),''FM9G99G99G99G99G990D00'') || ''</td>''',
'    || ''<td></td>''',
'    || ''<td></td>''',
'    || ''<td>''',
'       /* The three checks assert that debits equal credits, which is only',
'          a meaningful claim about the WHOLE trial balance. Any filtered',
'          scope fails it by definition - Revenue on its own is all credit,',
'          Finance Cost all debit - so printing "Period not equal" there',
'          reads as the ledger being broken when it is only being looked at',
'          through one head. Under a filter the badge says so and shows the',
'          net instead, which is the figure the reader came for and the one',
'          that has to match the line they clicked. */',
'       || Case When :P675_ACCOUNTGROUP Is Null And :P675_PNLBUCKET Is Null Then',
'               Case When Abs(nvl(a.OpDr,0)-nvl(a.OpCr,0)) < 0.5',
'                    Then ''<span class="ds-tb-badge ds-tb-badge--ok">Opening OK</span>''',
'                    Else ''<span class="ds-tb-badge ds-tb-badge--bad">Opening &ne;</span>'' End',
'               || '' ''',
'               || Case When Abs(nvl(a.PDr,0)-nvl(a.PCr,0)) < 0.5',
'                       Then ''<span class="ds-tb-badge ds-tb-badge--ok">Period OK</span>''',
'                       Else ''<span class="ds-tb-badge ds-tb-badge--bad">Period &ne;</span>'' End',
'               || '' ''',
'               || Case When Abs(nvl(a.ClDr,0)-nvl(a.ClCr,0)) < 0.5',
'                       Then ''<span class="ds-tb-badge ds-tb-badge--ok">Closing OK</span>''',
'                       Else ''<span class="ds-tb-badge ds-tb-badge--bad">Closing &ne;</span>'' End',
'          Else ''<span class="ds-tb-badge ds-tb-badge--flat">Filtered scope &mdash; a part does not balance</span>''',
'               || '' <span class="ds-tb-badge ds-tb-badge--ok">Net movement ''',
'               || to_char(Abs(nvl(a.PCr,0)-nvl(a.PDr,0)),''FM9G99G99G99G99G990D00'')',
'               || Case When nvl(a.PCr,0) >= nvl(a.PDr,0) Then '' Cr'' Else '' Dr'' End',
'               || ''</span>'' End',
'    || ''</td>''',
'    || ''</tr>''',
'    || ''</tbody></table>''',
'    || ''</div>''',
'    /* The row is CLONED into the report''s table, never moved: an',
'       interactive report rebuilds its own table on every refresh,',
'       sort and page change, which would destroy the original and',
'       leave nothing to put back. The clone is re-made each time',
'       instead.',
'',
'       Everything is wrapped so a failure here can never take the',
'       page down - if the script does not run, the band below the',
'       report simply stays visible, which is where it was before.',
'       ds-tb-placed is what hides it once the row is in place, so',
'       the fallback is the default rather than the exception. */',
'    || ''<script>''',
'    || ''(function(){''',
'    || ''function place(){try{''',
'    || ''var box=document.querySelector(".ds-tb-totals-region");''',
'    || ''var src=box&&box.querySelector("tr.ds-tb-totals-row");''',
'    /* NOT querySelector. This report has Fixed Header = Page, so APEX',
'       renders a SECOND a-IRR-table holding a clone of the column',
'       headers and sticks it to the top of the viewport. Taking the',
'       first match appended the total to that clone, which pinned it',
'       above the data and buried the Balance Sheet row underneath it.',
'       Pick the table that actually holds rows - the last one, so a',
'       future third table changes nothing. */',
'    || ''var all=document.querySelectorAll(".ds-register table.a-IRR-table");''',
'    || ''var tbl=null;''',
'    || ''for(var i=0;i<all.length;i++){''',
'    || ''var tb=all[i].tBodies&&all[i].tBodies[0];''',
'    || ''if(tb&&tb.rows.length){tbl=all[i];}}''',
'    || ''if(!src||!tbl){return;}''',
'    || ''var head=tbl.querySelector("thead tr")||tbl.tBodies[0].rows[0];''',
'    || ''var want=head?head.cells.length:src.cells.length;''',
'    || ''if(want<src.cells.length){box.classList.remove("ds-tb-placed");return;}''',
'    || ''var row=src.cloneNode(true);''',
'    || ''while(row.cells.length<want){row.appendChild(document.createElement("td"));}''',
'    || ''var old=tbl.querySelector("tfoot.ds-tb-foot");if(old){old.parentNode.removeChild(old);}''',
'    || ''var tf=document.createElement("tfoot");tf.className="ds-tb-foot";''',
'    || ''tf.appendChild(row);tbl.appendChild(tf);''',
'    || ''box.classList.add("ds-tb-placed");''',
'    || ''}catch(e){}}''',
'    || ''place();setTimeout(place,150);setTimeout(place,600);''',
'    || ''try{if(window.apex&&apex.jQuery){''',
'    || ''apex.jQuery(document).on("apexafterrefresh",function(){setTimeout(place,60);});}''',
'    || ''}catch(e){}''',
'    || ''})();''',
'    || ''</script>'' As TOTALS',
'From Agg a'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL,P675_ACCOUNTGROUP,P675_PNLBUCKET'
,p_lazy_loading=>true
,p_query_row_template=>2540130677583398057
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12581089303300036)
,p_column_alias=>'TOTALS'
,p_column_display_sequence=>10
,p_column_heading=>'Totals'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12582937693300038)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_button_name=>'APPLY'
,p_static_id=>'apply'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconRight'
,p_button_template_id=>2084305881903810008
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-refresh'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12583027529300038)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(12578853273300035)
,p_button_name=>'DOWNLOAD20'
,p_static_id=>'download20'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Download'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_icon_css_classes=>'fa-file-excel-o'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12583184984300038)
,p_button_sequence=>84
,p_button_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_button_name=>'HIDEBC'
,p_static_id=>'hidebc'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Hide Balance Control'
,p_button_condition=>':P675_SHOWBC = ''Y'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-eye-slash'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12583281629300038)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_button_name=>'OPENFILTERS'
,p_static_id=>'open-filters'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Advanced Filters'
,p_button_redirect_url=>'javascript:apex.theme.openRegion(''p675Drawer'');'
,p_button_execute_validations=>'N'
,p_button_css_classes=>'ds-filter-trigger'
,p_icon_css_classes=>'fa-sliders'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12583317453300038)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(12578468579300010)
,p_button_name=>'RESETFILTERS'
,p_static_id=>'reset-filters'
,p_show_as_disabled=>false
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Reset All Filters'
,p_button_redirect_url=>'f?p=&APP_ID.:675:&SESSION.::&DEBUG.:675'
,p_warn_on_unsaved_changes=>null
,p_icon_css_classes=>'fa-times'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12583406229300038)
,p_button_sequence=>82
,p_button_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_button_name=>'SHOWBC'
,p_static_id=>'showbc'
,p_show_as_disabled=>false
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>2084305881903810008
,p_button_image_alt=>'Show Balance Control'
,p_button_condition=>'nvl(:P675_SHOWBC,''N'') <> ''Y'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-balance-scale'
,p_grid_new_row=>'N'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12581176040300036)
,p_name=>'P675_ACCOUNTGROUP'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_prompt=>'Account'
,p_placeholder=>'Whole chart of accounts'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select /* THIS QUERY MUST BEGIN WITH Select. APEX decides at RENDER time',
'          whether an LOV is a query or a static list by looking at the',
'          first characters of the stored text, so a leading /* comment',
'          makes it neither and the item throws "Error during rendering',
'          of page item" with nothing useful in the log. Validation does',
'          not catch it - the parser is happy and the SQL runs fine on',
'          its own. Hence this comment sits AFTER the keyword.',
'',
'          Groups AND ledger accounts, not groups only. Picking a group',
'          scopes the report to that group and everything beneath it;',
'          picking a ledger scopes it to that one account. Scope resolves',
'          both through the same grafted path.',
'',
'          Two names in the chart are not unique. The code is appended to',
'          those two only - printing it against all 7,307 would be noise,',
'          but without it those two rows are indistinguishable and',
'          picking the wrong one is silent. */',
'       p.PartyName',
'    || Case When Count(*) Over (Partition By p.PartyName) > 1',
'            Then ''  ['' || p.PartyCode || '']'' End  d,',
'       p.PartyCode r',
'  From Party p',
' Order By p.PartyName, p.PartyCode'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'Whole chart of accounts'
,p_cSize=>40
,p_begin_on_new_line=>'N'
,p_colspan=>5
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'Scope the trial balance to one account. A group brings everything beneath it, a ledger brings just itself. Leave it empty for the whole chart of accounts. Remember the Levels box still applies - a group opened at level 1 shows only its statement head'
||'ing. Fetch-on-search is deliberate: this list is the entire chart of accounts, 7,307 rows against the roughly 1,400 of the old groups-only list, and without it the popup tries to load the lot before the page can render. Every other large picker in th'
||'is app carries the same setting.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'POPUP',
  'fetch_on_search', 'Y',
  'height', '400',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0',
  'title', 'Account groups and ledger accounts',
  'width', '520')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12581389425300037)
,p_name=>'P675_COMPANY'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_prompt=>'Company'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select c.CompanyName d, c.CompanyCode r',
'  From Company c',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.CompanyCode = c.CompanyCode',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                       Or v.Panel = (Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All companies'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12581456872300037)
,p_name=>'P675_FROMDATE'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select to_char(FinancialYearBegin,''DD-MM-RRRR'')',
'  From FinancialYear',
' Where trunc(sysdate) Between FinancialYearBegin And FinancialYearEnd',
'   And rownum = 1'))
,p_item_default_type=>'SQL_QUERY'
,p_prompt=>'From Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'The first day of the movement window. Everything before it becomes the opening balance.'
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
 p_id=>wwv_flow_imp.id(12581628394300037)
,p_name=>'P675_LEDGERONLY'
,p_item_sequence=>75
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_item_default=>'N'
,p_prompt=>'Ledger Only'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'Drops the hierarchy and lists the posting accounts on their own, in name order, with no groups and no indenting. Every other filter still applies and the totals do not move - it is the same set of accounts, shown flat rather than as a tree. Levels ha'
||'s no meaning in this mode and is hidden while it is on.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'checked_value', 'Y',
  'unchecked_value', 'N',
  'use_defaults', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12581834502300037)
,p_name=>'P675_LEVEL'
,p_is_required=>true
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_item_default=>'3'
,p_prompt=>'Levels'
,p_placeholder=>'1'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_NUMBER_FIELD'
,p_colspan=>2
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>'nvl(:P675_LEDGERONLY,''N'') != ''Y'''
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'How many levels to expand, typed as a number. 1 shows only the statement headings - Balance Sheet, Profit and Loss. 3, the default, reaches nature, group and subgroup. Raise it further to open the ledger accounts. The grafted chart is nine levels dee'
||'p, so any number above that simply shows everything. Clicking a group opens it three levels deeper than the group itself, whatever this box says.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_alignment', 'left',
  'virtual_keyboard', 'decimal')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12582097336300037)
,p_name=>'P675_LOCATION'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_prompt=>'Location'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Select l.LocationName d, l.LocationCode r',
'  From Location l',
' Where Exists (Select 1 From VoucherDetail v',
'                Where v.LocationCode = l.LocationCode',
'                  And (:P675_COMPANY Is Null Or v.CompanyCode = :P675_COMPANY)',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null',
'                       Or v.Panel = (Select GetUserPanelAB_apex() From dual)))',
' Order By 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'All locations'
,p_lov_cascade_parent_items=>'P675_COMPANY'
,p_ajax_items_to_submit=>'P675_COMPANY'
,p_ajax_optimize_refresh=>'Y'
,p_begin_on_new_line=>'N'
,p_colspan=>3
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12582154272300037)
,p_name=>'P675_NOMOVE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(12578468579300010)
,p_item_default=>'Y'
,p_prompt=>'Accounts With No Movement'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Include them - a carried balance is still a balance;Y,Only accounts that moved in the period;N'
,p_begin_on_new_line=>'N'
,p_colspan=>6
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_help_text=>'A dormant account still holds money and still belongs in a trial balance, so it is included by default.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12582390064300037)
,p_name=>'P675_PANEL'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_prompt=>'Panel'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:A;A,B;B'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'A + B'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_display_when=>'GetUserPanelAB_apex() Is Null'
,p_display_when2=>'PLSQL'
,p_display_when_type=>'EXPRESSION'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12582481446300037)
,p_name=>'P675_PNLBUCKET'
,p_item_sequence=>95
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12582523915300038)
,p_name=>'P675_SHOWBC'
,p_item_sequence=>96
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12582668392300038)
,p_name=>'P675_TODATE'
,p_is_required=>true
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(12578344798300010)
,p_item_default=>'to_char(trunc(sysdate),''DD-MM-RRRR'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'To Date'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_begin_on_new_line=>'N'
,p_colspan=>2
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_help_text=>'The last day of the movement window, and the as-on date of the closing balance.'
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
 p_id=>wwv_flow_imp.id(12582807851300038)
,p_name=>'P675_ZERO'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(12578468579300010)
,p_item_default=>'N'
,p_prompt=>'Zero-Balance Accounts'
,p_source_type=>'ALWAYS_NULL'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Hide accounts that close at zero;N,Show every account;Y'
,p_colspan=>6
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>3033038003750078790
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12583541381300061)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Download 20-Level Trial Balance'
,p_static_id=>'download-20-level'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'/* A SECOND download, beside the report''s own.',
'',
'   The report keeps its APEX download. This one always emits all twenty',
'   levels; the chart is eight deep today.',
'',
'   HTML that Excel opens, so it looks like the screen. mso-number-format',
'   makes a cell a number - as text it would not add up.',
'',
'   The total comes from the band own derivation - summing the rows above',
'   differs, the band counts accounts the zero filter hides.',
'',
'   Lifted-query comments live in the regions they came from. */',
'',
'Declare',
'    Cursor cTb Is',
'    With Fy As (',
'           ',
'           Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                        Where to_date(:P675_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                      to_date(:P675_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'         Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'         ',
'         Ord As (',
'           Select p.PartyCode, p.ParentCode, p.NatureOfAccountCode NatCode,',
'                  lpad(to_char(Row_Number() Over (',
'                       Partition By Case When p.ParentCode Is Not Null Then p.ParentCode',
'                                         When p.NatureOfAccountCode In (''ASSETS'',''LIABILITIES'') Then ''BALANCESHEET''',
'                                         When p.NatureOfAccountCode In (''INCOME'',''EXPENSES'')    Then ''PROFITANDLOSS''',
'                                         Else ''NOSTATEMENT'' End',
'                       Order By p.PartyName, p.PartyCode)),4,''0'') Seg',
'             From Party p),',
'         Walk As (',
'           Select o.PartyCode Acct, Level Lvl,',
'                  Connect_By_Root o.PartyCode Root,',
'                  Connect_By_Root o.NatCode   RootNat,',
'                  Sys_Connect_By_Path(o.PartyCode,''/'') Path,',
'                  Sys_Connect_By_Path(o.Seg,''/'')       SortPath,',
'                  regexp_substr(Sys_Connect_By_Path(o.PartyCode,''/''),''[^/]+'',1,2) L2',
'             From Ord o',
'            Start With o.ParentCode Is Null',
'          Connect By Prior o.PartyCode = o.ParentCode),',
'         Graft As (',
'           Select w.Acct, w.Lvl, w.Root, w.Path, w.SortPath,',
'                  ',
'                  Case When w.L2 = ''INCOME'' Or w.RootNat = ''INCOME''          Then ''REVENUE''',
'                       When regexp_substr(w.Path,''[^/]+'',1,3) = ''DIRECTCOST''   Then ''DIRECT''',
'                       When regexp_substr(w.Path,''[^/]+'',1,3) = ''DEPRECIATION'' Then ''DEPN''',
'                       When regexp_substr(w.Path,''[^/]+'',1,3) = ''4892''         Then ''FIN''',
'                       When regexp_substr(w.Path,''[^/]+'',1,3) = ''7481''         Then ''TAX''',
'                       When w.L2 = ''EXPENDITURES'' Or w.RootNat = ''EXPENSES''  Then ''OPEX''',
'                  End Bkt,',
'                  Case When w.RootNat In (''ASSETS'',''LIABILITIES'') Then ''BALANCESHEET''',
'                       When w.RootNat In (''INCOME'',''EXPENSES'')    Then ''PROFITANDLOSS''',
'                       When w.Root = ''BALANCESHEET''  And w.L2 In (''ASSET'',''LIABILITY'')     Then ''BALANCESHEET''',
'                       When w.Root = ''PROFITANDLOSS'' And w.L2 In (''INCOME'',''EXPENDITURES'') Then ''PROFITANDLOSS''',
'                       Else ''NOSTATEMENT'' End Stm,',
'                  Case When w.RootNat = ''ASSETS''      Or (w.Root = ''BALANCESHEET''  And w.L2 = ''ASSET'')        Then ''1''',
'                       When w.RootNat = ''LIABILITIES'' Or (w.Root = ''BALANCESHEET''  And w.L2 = ''LIABILITY'')    Then ''2''',
'                       When w.RootNat = ''INCOME''      Or (w.Root = ''PROFITANDLOSS'' And w.L2 = ''INCOME'')       Then ''1''',
'                       When w.RootNat = ''EXPENSES''    Or (w.Root = ''PROFITANDLOSS'' And w.L2 = ''EXPENDITURES'') Then ''2''',
'                       Else ''9'' End NatSeg',
'             From Walk w),',
'         Tree As (',
'           Select g.Acct, g.Bkt,',
'                  Case When g.Root In (''BALANCESHEET'',''PROFITANDLOSS'') Then g.Lvl Else g.Lvl + 1 End Lvl,',
'                  Case When g.Root In (''BALANCESHEET'',''PROFITANDLOSS'') Then g.Path',
'                       Else ''/'' || g.Stm || g.Path End Path,',
'                  ',
'                  ''/'' || Case g.Stm When ''BALANCESHEET'' Then ''1'' When ''PROFITANDLOSS'' Then ''2'' Else ''3'' End',
'                      || ''/'' || g.NatSeg || ''-''',
'                      || substr(Case When g.Root In (''BALANCESHEET'',''PROFITANDLOSS'')',
'                                     Then substr(g.SortPath, instr(g.SortPath,''/'',1,2))',
'                                     Else g.SortPath End, 2) SortPath',
'             From Graft g',
'            Where g.Acct Not In (''BALANCESHEET'',''PROFITANDLOSS'')),',
'         Op As (',
'           Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt',
'             From Opening o, Fy',
'            Where o.OpeningDate = Fy.Fb',
'              And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'              And (:P675_PANEL    Is Null Or o.Panel        = :P675_PANEL)',
'              And (:P675_COMPANY  Is Null Or o.CompanyCode  = :P675_COMPANY)',
'              And (:P675_LOCATION Is Null Or o.LocationCode = :P675_LOCATION)',
'            Group By o.AccountCode),',
'         Mv As (',
'           Select d.AccountCode Acct,',
'                  Sum(Case When d.VoucherDate <  to_date(:P675_FROMDATE,''DD-MM-RRRR'') Then nvl(d.Amount,0) Else 0 End) Pre,',
'                  Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'                  Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr,',
'                  Max(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') Then d.VoucherDate End) LastMove',
'             From VoucherDetail d, Fy',
'            Where d.VoucherDate >= Fy.Fb',
'              And d.VoucherDate <  to_date(:P675_TODATE,''DD-MM-RRRR'') + 1',
'              And d.Tno Not In (Select Tno From Carry)',
'              And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'              And (:P675_PANEL    Is Null Or d.Panel        = :P675_PANEL)',
'              And (:P675_COMPANY  Is Null Or d.CompanyCode  = :P675_COMPANY)',
'              And (:P675_LOCATION Is Null Or d.LocationCode = :P675_LOCATION)',
'            Group By d.AccountCode),',
'         ',
'         Bal As (',
'           Select nvl(o.Acct,m.Acct) Acct,',
'                  Greatest(-(nvl(o.Amt,0)+nvl(m.Pre,0)),0) OpDr,',
'                  Greatest( (nvl(o.Amt,0)+nvl(m.Pre,0)),0) OpCr,',
'                  nvl(m.Dr,0) Dr, nvl(m.Cr,0) Cr,',
'                  Greatest(-(nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),0) ClDr,',
'                  Greatest( (nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),0) ClCr,',
'                  m.LastMove',
'             From Op o Full Outer Join Mv m On m.Acct = o.Acct),',
'         ',
'         Scope As (',
'           Select t.Acct PartyCode From Tree t',
'            Where (:P675_ACCOUNTGROUP Is Not Null Or :P675_PNLBUCKET Is Not Null)',
'              And (:P675_ACCOUNTGROUP Is Null',
'                   Or instr(t.Path || ''/'', ''/'' || :P675_ACCOUNTGROUP || ''/'') > 0)',
'              And (:P675_PNLBUCKET Is Null Or t.Bkt = :P675_PNLBUCKET)',
'           Union All',
'           Select p.PartyCode From Party p',
'            Where :P675_ACCOUNTGROUP Is Null And :P675_PNLBUCKET Is Null),',
'         Kept As (',
'           Select b.* From Bal b',
'            Where b.Acct In (Select PartyCode From Scope)',
'              And (:P675_ZERO = ''Y'' Or b.ClDr + b.ClCr > 0.005)',
'              And (:P675_NOMOVE = ''Y'' Or b.Dr + b.Cr > 0.005)),',
'         Node As (',
'           Select regexp_substr(t.SortPath,''^(/[^/]+){''||lv.L||''}'') Sk,',
'                  regexp_substr(t.Path,''[^/]+'',1,lv.L) Node, lv.L Lvl,',
'                  ',
'                  Case When lv.L > 1 Then regexp_substr(t.Path,''[^/]+'',1,lv.L-1) End Pnt,',
'                  b.OpDr, b.OpCr, b.Dr, b.Cr, b.ClDr, b.ClCr, b.LastMove',
'             From Kept b',
'             Join Tree t On t.Acct = b.Acct',
'            ',
'            Cross Join (Select Level L From dual Connect By Level <= 20) lv',
'            Where lv.L <= t.Lvl',
'           Union All',
'           ',
'           Select ''/ZZZZ'', ''UNCLASSIFIED'', 1, Cast(Null As Varchar2(4000)),',
'                  b.OpDr, b.OpCr, b.Dr, b.Cr, b.ClDr, b.ClCr, b.LastMove',
'             From Kept b Where Not Exists (Select 1 From Tree t Where t.Acct = b.Acct)),',
'         Agg As (',
'           Select n.Node, n.Lvl, n.Sk, n.Pnt,',
'                  Sum(n.OpDr) OpDr, Sum(n.OpCr) OpCr, Sum(n.Dr) PDr, Sum(n.Cr) PCr,',
'                  Sum(n.ClDr) ClDr, Sum(n.ClCr) ClCr, Max(n.LastMove) LastMove',
'             From Node n Group By n.Node, n.Lvl, n.Sk, n.Pnt)',
'    Select Row_Number() Over (Order By a.Sk) As SEQ,',
'           a.Lvl                            As LVL,',
'           ',
'           Case When a.Node = ''UNCLASSIFIED'' Then ''Accounts outside the chart-of-accounts tree''',
'                When a.Node = ''NOSTATEMENT''  Then ''Nature not set in the ERP''',
'                Else nvl(p.PartyName, a.Node) End As ACCOUNT,',
'           ',
'           Case When ''N'' = ''Y'' Then ''ds-fintree-flat''',
'                Else ''ds-fintree-l'' || a.Lvl End',
'           || Case When a.Node = ''UNCLASSIFIED'' Then '' ds-fintree-leaf''',
'                   When a.Node = ''NOSTATEMENT''  Then '' ds-fintree-grp''',
'                   When Exists (Select 1 From Party c Where c.ParentCode = a.Node) Then '' ds-fintree-grp''',
'                   Else '' ds-fintree-leaf'' End',
'           ',
'           || Case When a.Node In (''UNCLASSIFIED'',''NOSTATEMENT'') Then '' ds-nolink'' End As TREECLASS,',
'           ',
'           Case When a.Node In (''UNCLASSIFIED'',''NOSTATEMENT'') Then ''javascript:void(0)''',
'                When Exists (Select 1 From Party c Where c.ParentCode = a.Node)',
'                Then apex_page.get_url(p_page => 675, p_clear_cache => '''',',
'                       p_items  => ''P675_ACCOUNTGROUP,P675_LEVEL,P675_FROMDATE,P675_TODATE,P675_COMPANY,P675_LOCATION,P675_PANEL'',',
'                       p_values => a.Node || '','' || to_char(a.Lvl + 3) || '','' || :P675_FROMDATE || '','' || :P675_TODATE || '',''',
'                                   || :P675_COMPANY || '','' || :P675_LOCATION || '','' || :P675_PANEL)',
'                Else apex_page.get_url(p_page => 677, p_clear_cache => ''677'',',
'                       p_items  => ''P677_ACCOUNT,P677_FROMDATE,P677_TODATE,P677_COMPANY,P677_LOCATION,P677_PANEL'',',
'                       p_values => a.Node || '','' || :P675_FROMDATE || '','' || :P675_TODATE || '',''',
'                                   || :P675_COMPANY || '','' || :P675_LOCATION || '','' || :P675_PANEL)',
'                End                          As ACCOUNT_URL,',
'           a.Node                           As ACCOUNT_CODE,',
'           Case When a.Node = ''NOSTATEMENT'' Then ''Group''',
'                When Exists (Select 1 From Party c Where c.ParentCode = a.Node) Then ''Group''',
'                Else ''Ledger'' End                As KIND,',
'           Case When a.Pnt = ''NOSTATEMENT'' Then ''Nature not set in the ERP''',
'                Else nvl(gp.PartyName, chr(8212)) End As PARENT_GROUP,',
'           Round(a.OpDr,2)                  As OPENING_DEBIT,',
'           Round(a.OpCr,2)                  As OPENING_CREDIT,',
'           Round(a.PDr,2)                   As PERIOD_DEBIT,',
'           Round(a.PCr,2)                   As PERIOD_CREDIT,',
'           Round(a.ClDr,2)                  As CLOSING_DEBIT,',
'           Round(a.ClCr,2)                  As CLOSING_CREDIT,',
'           ',
'           Case When Abs(a.OpDr-a.OpCr) > 0.005',
'                Then Round((a.PDr-a.PCr) / Abs(a.OpDr-a.OpCr) * 100, 2) End As MOVEMENT_PCT,',
'           a.LastMove                       As LAST_POSTING,',
'           ',
'           Case When a.Node = ''UNCLASSIFIED''                             Then ''Off tree''',
'                When a.Node = ''NOSTATEMENT''                              Then ''No nature''',
'                When a.PDr + a.PCr < 0.005 And a.ClDr + a.ClCr > 0.005   Then ''Dormant''',
'                When a.ClDr + a.ClCr < 0.005                             Then ''Nil''',
'                When a.ClDr > a.ClCr                                     Then ''Debit''',
'                Else                                                          ''Credit'' End As POSITION,',
'           ',
'           Case When a.Node = ''UNCLASSIFIED''                             Then ''ds-finchip ds-finchip--watch''',
'                When a.Node = ''NOSTATEMENT''                              Then ''ds-finchip ds-finchip--watch''',
'                When a.PDr + a.PCr < 0.005 And a.ClDr + a.ClCr > 0.005   Then ''ds-finchip ds-finchip--flat''',
'                When a.ClDr + a.ClCr < 0.005                             Then ''ds-finchip ds-finchip--flat''',
'                When a.ClDr > a.ClCr                                     Then ''ds-finchip ds-finchip--dr''',
'                Else                                                          ''ds-finchip ds-finchip--cr'' End As POSITION_CLASS',
'      From Agg a',
'      Left Join Party p  On p.PartyCode = a.Node',
'      Left Join Party gp On gp.PartyCode = a.Pnt',
'     Order By a.Sk;',
'    lCompany  Varchar2(400);',
'    lLocation Varchar2(400);',
'    lPanel    Varchar2(100);',
'    lRow    Number := 0;',
'    ',
'    lOpDr   Number := 0;',
'    lOpCr   Number := 0;',
'    lPDr    Number := 0;',
'    lPCr    Number := 0;',
'    lClDr   Number := 0;',
'    lClCr   Number := 0;',
'    lRowSty Varchar2(120);',
'    lT      Varchar2(400);',
'    lN      Varchar2(400);',
'    ',
'    cBase Constant Varchar2(200) :=',
'        ''font-family:Calibri,Arial,sans-serif;font-size:10pt;''',
'        || ''border:0.5pt solid #E3E8EF;'';',
'    cTxt  Constant Varchar2(60) := ''mso-number-format:''''\@'''';'';',
'    cNum  Constant Varchar2(90) :=',
'        ''mso-number-format:''''\#\,\#\#\,\#\#0\.00'''';text-align:right;'';',
'    cHead Constant Varchar2(300) :=',
'        cBase || ''background:#1F2A3B;color:#FFFFFF;font-weight:bold;text-align:center;'';',
'    cTot  Constant Varchar2(120) :=',
'        ''background:#FFFBEB;font-weight:bold;border-top:1.5pt solid #B8621B;'';',
'    Function Ind(pLvl Number) Return Varchar2 Is',
'        r Varchar2(400) := '''';',
'    Begin',
'        For i In 2 .. Greatest(pLvl,1) Loop r := r || ''&nbsp;&nbsp;&nbsp;&nbsp;''; End Loop;',
'        Return r;',
'    End;',
'    Function Num(pVal Number) Return Varchar2 Is',
'    Begin',
'        If pVal Is Null Or Abs(pVal) < 0.005 Then Return ''''; End If;',
'        Return to_char(Round(pVal,2),''FM99999999999990.00'');',
'    End;',
'Begin',
'    owa_util.mime_header(''application/vnd.ms-excel'', FALSE);',
'    Select nvl(Max(c.CompanyName),''All companies'')  Into lCompany',
'      From Company c Where c.CompanyCode = :P675_COMPANY;',
'    Select nvl(Max(l.LocationName),''All locations'') Into lLocation',
'      From Location l Where l.LocationCode = :P675_LOCATION;',
'    lPanel := GetUserPanelAB_apex();',
'',
'    htp.p(''Content-Disposition: attachment; filename="trial-balance-''',
'          || to_char(sysdate,''YYYYMMDD-HH24MI'') || ''.xls"'');',
'    owa_util.http_header_close();',
'',
'    htp.prn(''<html xmlns:x="urn:schemas-microsoft-com:office:excel">'');',
'    htp.prn(''<head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>'');',
'    ',
'    /* mso conditional comment: without it Excel ignores FreezePanes. */',
'    htp.prn(''<!--[if gte mso 9]><xml><x:ExcelWorkbook><x:ExcelWorksheets><x:ExcelWorksheet>''',
'         || ''<x:Name>Trial Balance</x:Name>''',
'         || ''<x:WorksheetOptions><x:Selected/><x:FreezePanes/><x:FrozenNoSplit/>''',
'         || ''<x:SplitHorizontalPosition>4</x:SplitHorizontalPosition>''',
'         || ''<x:TopRowBottomPane>4</x:TopRowBottomPane><x:ActivePane>2</x:ActivePane>''',
'         || ''<x:Panes><x:Pane><x:Number>3</x:Number></x:Pane>''',
'         || ''<x:Pane><x:Number>2</x:Number></x:Pane></x:Panes>''',
'         || ''</x:WorksheetOptions></x:ExcelWorksheet>''',
'         || ''</x:ExcelWorksheets></x:ExcelWorkbook></xml><![endif]-->'');',
'    ',
'    htp.prn(''<style>'');',
'    htp.prn(''td,th{font-family:Calibri,Arial,sans-serif;font-size:10pt;border:0.5pt solid #E3E8EF;}'');',
'    htp.prn(''th{background:#1F2A3B;color:#FFFFFF;font-weight:700;text-align:center;}'');',
'    htp.prn(''.t{font-size:15pt;font-weight:700;color:#1F2A3B;border:none;}'');',
'    htp.prn(''.s{font-size:9pt;color:#4A5568;border:none;}'');',
'    htp.prn(''.n{mso-number-format:''''\#\,\#\#\,\#\#0\.00'''';text-align:right;}'');',
'    htp.prn(''.a{mso-number-format:''''\@'''';}'');',
'    htp.prn(''.g1{background:#E7EDF6;font-weight:700;}'');',
'    htp.prn(''.g2{background:#F0F4F9;font-weight:700;}'');',
'    htp.prn(''.g3{background:#F7F9FC;font-weight:700;}'');',
'    htp.prn(''.led{background:#FFFFFF;}'');',
'    htp.prn(''.tot{background:#FFFBEB;font-weight:700;border-top:1.5pt solid #B8621B;}'');',
'    htp.prn(''</style></head><body>'');',
'',
'    Select nvl(OpDr,0), nvl(OpCr,0), nvl(PDr,0), nvl(PCr,0), nvl(ClDr,0), nvl(ClCr,0)',
'      Into lOpDr, lOpCr, lPDr, lPCr, lClDr, lClCr',
'      From (',
'        ',
'        With Fy As (',
'               Select nvl((Select f.FinancialYearBegin From FinancialYear f',
'                            Where to_date(:P675_FROMDATE,''DD-MM-RRRR'') Between f.FinancialYearBegin And f.FinancialYearEnd),',
'                          to_date(:P675_FROMDATE,''DD-MM-RRRR'')) Fb From dual),',
'             Carry As (Select v.Tno From Voucher v Where v.VoucherNo = ''OPENING''),',
'             Op As (',
'               Select o.AccountCode Acct, Sum(nvl(o.OpeningAmount,0)) Amt',
'                 From Opening o, Fy',
'                Where o.OpeningDate = Fy.Fb',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null Or o.Panel = (Select GetUserPanelAB_apex() From dual))',
'                  And (:P675_PANEL    Is Null Or o.Panel        = :P675_PANEL)',
'                  And (:P675_COMPANY  Is Null Or o.CompanyCode  = :P675_COMPANY)',
'                  And (:P675_LOCATION Is Null Or o.LocationCode = :P675_LOCATION)',
'                Group By o.AccountCode),',
'             Mv As (',
'               Select d.AccountCode Acct,',
'                      Sum(Case When d.VoucherDate <  to_date(:P675_FROMDATE,''DD-MM-RRRR'') Then nvl(d.Amount,0) Else 0 End) Pre,',
'                      Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) < 0 Then -d.Amount Else 0 End) Dr,',
'                      Sum(Case When d.VoucherDate >= to_date(:P675_FROMDATE,''DD-MM-RRRR'') And nvl(d.Amount,0) > 0 Then  d.Amount Else 0 End) Cr',
'                 From VoucherDetail d, Fy',
'                Where d.VoucherDate >= Fy.Fb',
'                  And d.VoucherDate <  to_date(:P675_TODATE,''DD-MM-RRRR'') + 1',
'                  And d.Tno Not In (Select Tno From Carry)',
'                  And ((Select GetUserPanelAB_apex() From dual) Is Null Or d.Panel = (Select GetUserPanelAB_apex() From dual))',
'                  And (:P675_PANEL    Is Null Or d.Panel        = :P675_PANEL)',
'                  And (:P675_COMPANY  Is Null Or d.CompanyCode  = :P675_COMPANY)',
'                  And (:P675_LOCATION Is Null Or d.LocationCode = :P675_LOCATION)',
'                Group By d.AccountCode),',
'             Bal As (',
'               Select nvl(o.Acct,m.Acct) Acct,',
'                      Greatest(-(nvl(o.Amt,0)+nvl(m.Pre,0)),0) OpDr,',
'                      Greatest( (nvl(o.Amt,0)+nvl(m.Pre,0)),0) OpCr,',
'                      nvl(m.Dr,0) Dr, nvl(m.Cr,0) Cr,',
'                      Greatest(-(nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),0) ClDr,',
'                      Greatest( (nvl(o.Amt,0)+nvl(m.Pre,0)-nvl(m.Dr,0)+nvl(m.Cr,0)),0) ClCr',
'                 From Op o Full Outer Join Mv m On m.Acct = o.Acct),',
'             ',
'             Scope As (',
'               Select w.Acct PartyCode',
'                 From (Select p.PartyCode Acct,',
'                              Connect_By_Root p.PartyCode           Root,',
'                              Connect_By_Root p.NatureOfAccountCode RootNat,',
'                              Sys_Connect_By_Path(p.PartyCode,''/'')  Path',
'                         From Party p',
'                        Start With p.ParentCode Is Null',
'                      Connect By Prior p.PartyCode = p.ParentCode) w',
'                Where (:P675_ACCOUNTGROUP Is Not Null Or :P675_PNLBUCKET Is Not Null)',
'                  And (:P675_ACCOUNTGROUP Is Null',
'                       Or instr(Case When w.Root In (''BALANCESHEET'',''PROFITANDLOSS'') Then w.Path',
'                                     Else ''/'' || Case When w.RootNat In (''ASSETS'',''LIABILITIES'') Then ''BALANCESHEET''',
'                                                      When w.RootNat In (''INCOME'',''EXPENSES'')    Then ''PROFITANDLOSS''',
'                                                      Else ''NOSTATEMENT'' End || w.Path End || ''/'',',
'                                ''/'' || :P675_ACCOUNTGROUP || ''/'') > 0)',
'                  ',
'                  And (:P675_PNLBUCKET Is Null',
'                       Or Case When regexp_substr(w.Path,''[^/]+'',1,2) = ''INCOME''',
'                                 Or w.RootNat = ''INCOME''                              Then ''REVENUE''',
'                               When regexp_substr(w.Path,''[^/]+'',1,3) = ''DIRECTCOST''   Then ''DIRECT''',
'                               When regexp_substr(w.Path,''[^/]+'',1,3) = ''DEPRECIATION'' Then ''DEPN''',
'                               When regexp_substr(w.Path,''[^/]+'',1,3) = ''4892''         Then ''FIN''',
'                               When regexp_substr(w.Path,''[^/]+'',1,3) = ''7481''         Then ''TAX''',
'                               When regexp_substr(w.Path,''[^/]+'',1,2) = ''EXPENDITURES''',
'                                 Or w.RootNat = ''EXPENSES''                            Then ''OPEX''',
'                          End = :P675_PNLBUCKET)',
'               Union All',
'               Select p.PartyCode From Party p',
'                Where :P675_ACCOUNTGROUP Is Null And :P675_PNLBUCKET Is Null),',
'             Agg As (',
'               Select Sum(b.OpDr) OpDr, Sum(b.OpCr) OpCr,',
'                      Sum(b.Dr)   PDr,  Sum(b.Cr)   PCr,',
'                      Sum(b.ClDr) ClDr, Sum(b.ClCr) ClCr',
'                 From Bal b',
'                Where b.Acct In (Select PartyCode From Scope))',
'        Select OpDr, OpCr, PDr, PCr, ClDr, ClCr From Agg);',
'',
'    htp.prn(''<table cellspacing="0">'');',
'',
'    htp.prn(''<tr><td class="t" colspan="11">Trial Balance</td></tr>'');',
'    htp.prn(''<tr><td class="s" colspan="11">Period ''',
'            || apex_escape.html(:P675_FROMDATE) || '' to '' || apex_escape.html(:P675_TODATE)',
'            || '' &middot; Company '' || apex_escape.html(lCompany)',
'            || '' &middot; Location '' || apex_escape.html(lLocation)',
'            || '' &middot; Panel ''',
'            || Case When lPanel Is Not Null Then lPanel || '' (enforced)''',
'                    When :P675_PANEL Is Not Null Then :P675_PANEL',
'                    Else ''A + B'' End',
'            || '' &middot; full hierarchy to 20 levels &middot; base currency (INR)</td></tr>'');',
'    htp.prn(''<tr><td class="s" colspan="11"></td></tr>'');',
'',
'    htp.prn(''<tr>'');',
'    htp.prn(''<th style="'' || cHead || ''">Account</th><th style="'' || cHead',
'            || ''">Level</th><th style="'' || cHead || ''">Kind</th>'');',
'    htp.prn(''<th style="'' || cHead || ''">Opening Dr</th><th style="'' || cHead || ''">Opening Cr</th>'');',
'    htp.prn(''<th style="'' || cHead || ''">Period Dr</th><th style="'' || cHead || ''">Period Cr</th>'');',
'    htp.prn(''<th style="'' || cHead || ''">Closing Dr</th><th style="'' || cHead || ''">Closing Cr</th>'');',
'    htp.prn(''<th style="'' || cHead || ''">Last Posting</th><th style="'' || cHead || ''">Position</th>'');',
'    htp.prn(''</tr>'');',
'',
'    For r In cTb Loop',
'        lRow := lRow + 1;',
'        htp.prn(''<tr>'');',
'        ',
'        lRowSty := Case When r.KIND = ''Group''',
'                        Then Case Least(r.LVL,3)',
'                                  When 1 Then ''background:#E7EDF6;font-weight:bold;''',
'                                  When 2 Then ''background:#F0F4F9;font-weight:bold;''',
'                                  Else        ''background:#F7F9FC;font-weight:bold;'' End',
'                        Else ''background:#FFFFFF;'' End;',
'        /* Joined once per row. Lost on the first attempt - the regex',
'           stopped at a semicolon and the CSS is full of them - so every',
'           cell got style="" and the sheet came out unformatted. */',
'        lT := cTxt || lRowSty;',
'        lN := cNum || lRowSty;',
'        htp.prn(''<td style="'' || lT || ''">''',
'                || Ind(r.LVL) || apex_escape.html(r.ACCOUNT) || ''</td>'');',
'        htp.prn(''<td style="'' || lT || ''">'' || r.LVL || ''</td>'');',
'        htp.prn(''<td style="'' || lT || ''">'' || apex_escape.html(r.KIND) || ''</td>'');',
'        htp.prn(''<td style="'' || lN || ''">'' || Num(r.OPENING_DEBIT)  || ''</td>'');',
'        htp.prn(''<td style="'' || lN || ''">'' || Num(r.OPENING_CREDIT) || ''</td>'');',
'        htp.prn(''<td style="'' || lN || ''">'' || Num(r.PERIOD_DEBIT)   || ''</td>'');',
'        htp.prn(''<td style="'' || lN || ''">'' || Num(r.PERIOD_CREDIT)  || ''</td>'');',
'        htp.prn(''<td style="'' || lN || ''">'' || Num(r.CLOSING_DEBIT)  || ''</td>'');',
'        htp.prn(''<td style="'' || lN || ''">'' || Num(r.CLOSING_CREDIT) || ''</td>'');',
'        htp.prn(''<td style="'' || lT || ''">'' || apex_escape.html(r.LAST_POSTING) || ''</td>'');',
'        htp.prn(''<td style="'' || lT || ''">'' || apex_escape.html(r.POSITION) || ''</td>'');',
'        htp.prn(''</tr>'');',
'    End Loop;',
'',
'    htp.prn(''<tr>'');',
'    htp.prn(''<td style="'' || cTxt || cTot || ''">Total &mdash; all posting accounts in scope</td>'');',
'    htp.prn(''<td style="'' || cTxt || cTot || ''"></td>'');',
'    htp.prn(''<td style="'' || cTxt || cTot || ''"></td>'');',
'    htp.prn(''<td style="'' || cNum || cTot || ''">'' || Num(lOpDr) || ''</td>'');',
'    htp.prn(''<td style="'' || cNum || cTot || ''">'' || Num(lOpCr) || ''</td>'');',
'    htp.prn(''<td style="'' || cNum || cTot || ''">'' || Num(lPDr)  || ''</td>'');',
'    htp.prn(''<td style="'' || cNum || cTot || ''">'' || Num(lPCr)  || ''</td>'');',
'    htp.prn(''<td style="'' || cNum || cTot || ''">'' || Num(lClDr) || ''</td>'');',
'    htp.prn(''<td style="'' || cNum || cTot || ''">'' || Num(lClCr) || ''</td>'');',
'    htp.prn(''<td style="'' || cTxt || cTot || ''"></td>'');',
'    htp.prn(''<td style="'' || cTxt || cTot || ''"></td>'');',
'    htp.prn(''</tr>'');',
'',
'    htp.prn(''<tr><td class="s" colspan="11">'' || lRow',
'            || '' rows. Groups carry their children; a parent already contains the ''',
'            || ''accounts beneath it, so the rows must not be added together.</td></tr>'');',
'    htp.prn(''</table></body></html>'');',
'    apex_application.stop_apex_engine;',
'End;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12583027529300038)
,p_internal_uid=>69253912319320725
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12583657330300061)
,p_process_sequence=>20
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Hide Balance Control'
,p_static_id=>'set-hidebc'
,p_process_sql_clob=>':P675_SHOWBC := ''N'';'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12583184984300038)
,p_internal_uid=>72266931185872568
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12583711432300061)
,p_process_sequence=>10
,p_process_point=>'ON_SUBMIT_BEFORE_COMPUTATION'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Show Balance Control'
,p_static_id=>'set-showbc'
,p_process_sql_clob=>':P675_SHOWBC := ''Y'';'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(12583406229300038)
,p_internal_uid=>72266831662872568
);
wwv_flow_imp.component_end;
end;
/
