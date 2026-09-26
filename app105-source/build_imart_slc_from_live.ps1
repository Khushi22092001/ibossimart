param(
    [string]$SourceExport = "$PSScriptRoot\slc-live-temp-export\f105_page_721.sql",
    [string]$OutputPage = "$PSScriptRoot\hspl_page_00721_parity.sql"
)

$ErrorActionPreference = 'Stop'
$sql = [IO.File]::ReadAllText((Resolve-Path -LiteralPath $SourceExport), [Text.Encoding]::UTF8)

# Page 721 already reads real Ironmart compatibility views. Correct the HSPL
# vocabulary so the UI names the live Ironmart document: Sales Quotation.
$displayReplacements = @(
    @('Sales Confirmations', 'Sales Quotations'),
    @('Sales Confirmation', 'Sales Quotation'),
    @('sales confirmations', 'sales quotations'),
    @('sales confirmation', 'sales quotation'),
    @('Confirmations linked to an order', 'Quotations linked to an order'),
    @('Confirmation &rarr; Order', 'Quotation &rarr; Order'),
    @('Confirmation to order', 'Quotation to order'),
    @('Confirmation conversion', 'Quotation conversion'),
    @('Confirmation recorded', 'Quotation recorded'),
    @('Confirmation Register', 'Quotation Register'),
    @('Confirmation Balance', 'Quotation Balance'),
    @('confirmation lines', 'quotation lines'),
    @('confirmation vs order', 'quotation vs order'),
    @('Confirmation vs Order', 'Quotation vs Order'),
    @('Confirmed value', 'Quoted value'),
    @('confirmed value', 'quoted value'),
    @('Confirmed Qty', 'Quoted Qty'),
    @('CONFIRMATION', 'QUOTATION')
)
foreach ($replacement in $displayReplacements) {
    $sql = $sql.Replace($replacement[0], $replacement[1])
}

# HSPL's confirmation register route previously landed on Ironmart enquiry.
# Sales Quotation has its own native register (page 704).
$sql = $sql.Replace("p_page=>701,p_clear_cache=>''701,RIR''", "p_page=>704,p_clear_cache=>''704,RIR''")
$sql = $sql.Replace('P701_FROMDATE,P701_TODATE,P701_COMPANY,P701_LOCATION', 'P704_FROMDATE,P704_TODATE,P704_COMPANY,P704_LOCATION')
$sql = $sql.Replace('P722_SCTNO', 'P722_TNO')
$sql = $sql.Replace('P723_SOTNO', 'P723_TNO')
$sql = $sql.Replace('P726_ITEM_CODE', 'P726_ITEMCODE')
$sql = $sql.Replace("p_clear_cache=>''731''", "p_clear_cache=>''722''")
$sql = $sql.Replace("p_clear_cache=>''732''", "p_clear_cache=>''724''")
$sql = $sql.Replace("p_clear_cache=>''733''", "p_clear_cache=>''725''")
$sql = $sql.Replace("p_clear_cache=>''734''", "p_clear_cache=>''723''")
$sql = [regex]::Replace(
    $sql,
    "(?s)p_items=>''P722_TNO,P722_FROMDATE,P722_TODATE,P722_COMPANY,P722_LOCATION,P722_PANEL'',p_values=>b\.TNo\|\|.*?\:P721_PANEL\)",
    "p_items=>''P722_TNO'',p_values=>b.TNo)"
)
$sql = [regex]::Replace(
    $sql,
    "(?s)p_items=>''P723_TNO,P723_FROMDATE,P723_TODATE,P723_COMPANY,P723_LOCATION,P723_PANEL'',p_values=>s\.TNo\|\|.*?\:P721_PANEL\)",
    "p_items=>''P723_TNO'',p_values=>s.TNo)"
)
$sql = $sql.Replace('No vehicles are currently inside for this company, location and panel.', 'No vehicles are currently inside for this company and location.')
$sql = $sql.Replace('The active period, company, location and panel are retained.', 'The active period, company and location are retained.')
$sql = $sql.Replace('Choose period, company and location, plus panel when available, then Apply.', 'Choose period, company and location, then Apply.')
$sql = $sql.Replace('through confirmation, order, dispatch, gate, invoice and IRN.', 'through quotation, order, dispatch, gate, invoice and IRN.')
$sql = $sql.Replace('what was confirmed', 'what was quoted')
$sql = $sql.Replace("||''</a>'' Confirmation,", "||''</a>'' Quotation,")
$sql = $sql.Replace("p_column_label=>'Confirmation'", "p_column_label=>'Quotation'")
$sql = $sql.Replace('that has value (Confirmation, Sales Order, Invoice)', 'that has value (Quotation, Sales Order, Invoice)')
$sql = $sql.Replace('a confirm-time override', 'a quotation-time override')
$sql = $sql.Replace('PANEL SECURITY. Every region repeats the scalar-subquery guard', 'SCOPE. Company and Location are the dashboard business scope.')
$sql = $sql.Replace('  ((Select SAGAR.GetUserPanelAB_apex() From dual) Is Null Or a.Panel = (Select ...)).', 'No additional dashboard partition filter is shown or applied.')
$sql = $sql.Replace("p_prompt=>'Panel'", "p_prompt=>'Legacy Scope'")
$sql = $sql.Replace("p_help_text=>'Data partition. Hidden when the login is already bound to a panel; that restriction is enforced in every dashboard query and printed in the header.'", "p_help_text=>'Compatibility bind retained internally; Company and Location determine the visible dashboard scope.'")

# Remove the imported HSPL Panel chip from the visible dashboard header. The
# hidden compatibility bind remains null so legacy view signatures continue to
# compile without exposing an Ironmart filter that does not exist.
$sql = [regex]::Replace(
    $sql,
    "(?s)'  \|\| Case',\r?\n'       When \(Select SAGAR\.GetUserPanelAB_apex\(\) From dual\) Is Not Null'.*?'     End',\r?\n",
    ''
)

# Every dashboard register must drill to the matching Ironmart 360 or native
# document page. These replace the remaining plain-text HSPL document numbers.
$routeReplacements = @(
    @("'Select Nvl(GetPartyName(ci.AgentCode),''(direct / no agent)'') AGENT,'", "'Select Case When ci.AgentCode Is Not Null Then ''<a href=`"''||apex_page.get_url(p_page=>174,p_clear_cache=>''174,RIR'',p_items=>''P174_FROMDATE,P174_TODATE,P174_COMPANY,P174_LOCATION,P174_AGENTCODE'',p_values=>:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION||'',''||ci.AgentCode)||''`">''||apex_escape.html(GetPartyName(ci.AgentCode))||''</a>'' Else ''(direct / no agent)'' End AGENT,'"),
    @("'Select s.TNo,d.SNo,l.LocationName,dt.DocTypeName,s.CCInvoiceNo,s.CCInvoiceDate,'", "'Select s.TNo,d.SNo,l.LocationName,dt.DocTypeName,''<a href=`"''||apex_page.get_url(p_page=>175,p_clear_cache=>''175'',p_items=>''P175_TNO,P175_FORMSTATUS'',p_values=>s.TNo||'',EDITRECORD'')||''`">''||apex_escape.html(s.CCInvoiceNo)||''</a>'' CCInvoiceNo,s.CCInvoiceDate,'"),
    @("'Select ''Confirmation'' STAGE, sc.SalesConfirmNo DOC_NO, sc.SalesConfirmDate DOC_DATE, GetPartyName(sc.PartyCode) PARTY, Cast(Null As Varchar2(30)) VEHICLE, sc.SalesConfirmAmount DOC_VALUE,'", "'Select ''Sales Quotation'' STAGE, ''<a href=`"''||apex_page.get_url(p_page=>722,p_clear_cache=>''722'',p_items=>''P722_TNO'',p_values=>sc.TNo)||''`">''||apex_escape.html(sc.SalesConfirmNo)||''</a>'' DOC_NO, sc.SalesConfirmDate DOC_DATE, GetPartyName(sc.PartyCode) PARTY, Cast(Null As Varchar2(30)) VEHICLE, sc.SalesConfirmAmount DOC_VALUE,'"),
    @("'Select ''Sales Order'', so.SalesOrderNo, so.SalesOrderDate, GetPartyName(so.PartyCode), so.VehicleNo, so.SalesOrderAmount,'", "'Select ''Sales Order'', ''<a href=`"''||apex_page.get_url(p_page=>723,p_clear_cache=>''723'',p_items=>''P723_TNO'',p_values=>so.TNo)||''`">''||apex_escape.html(so.SalesOrderNo)||''</a>'', so.SalesOrderDate, GetPartyName(so.PartyCode), so.VehicleNo, so.SalesOrderAmount,'"),
    @("'Select ''Dispatch Advice'', da.DespatchAdviceNo, da.DespatchAdviceDate, GetPartyName(da.PartyCode), da.VehicleNo,'", "'Select ''Dispatch Advice'', ''<a href=`"''||apex_page.get_url(p_page=>161,p_clear_cache=>''161'',p_items=>''P161_TNO'',p_values=>da.TNo)||''`">''||apex_escape.html(da.DespatchAdviceNo)||''</a>'', da.DespatchAdviceDate, GetPartyName(da.PartyCode), da.VehicleNo,'"),
    @("'Select ''Gate (Material Out)'', mo.MaterialOutNo, mo.MaterialOutDate, GetPartyName(mo.PartyCode), mo.VehicleNo,'", "'Select ''Gate (Material Out)'', ''<a href=`"''||apex_page.get_url(p_page=>168,p_clear_cache=>''168'',p_items=>''P168_TNO,P168_FORMSTATUS'',p_values=>mo.TNo||'',EDITRECORD'')||''`">''||apex_escape.html(mo.MaterialOutNo)||''</a>'', mo.MaterialOutDate, GetPartyName(mo.PartyCode), mo.VehicleNo,'"),
    @("'Select ''Weighment'', w2.WeighmentNo, w2.WeighmentDate, GetPartyName(w2.PartyCode), w2.VehicleNo, w2.NetWeight,'", "'Select ''Weighment'', ''<a href=`"''||apex_page.get_url(p_page=>133,p_clear_cache=>''133'',p_items=>''P133_TNO'',p_values=>w2.TNo)||''`">''||apex_escape.html(w2.WeighmentNo)||''</a>'', w2.WeighmentDate, GetPartyName(w2.PartyCode), w2.VehicleNo, w2.NetWeight,'"),
    @("'Select ''Invoice'', ci.CCInvoiceNo, ci.CCInvoiceDate, GetPartyName(ci.PartyCode), ci.VehicleNo, ci.CCInvoiceAmount,'", "'Select ''Invoice'', ''<a href=`"''||apex_page.get_url(p_page=>175,p_clear_cache=>''175'',p_items=>''P175_TNO,P175_FORMSTATUS'',p_values=>ci.TNo||'',EDITRECORD'')||''`">''||apex_escape.html(ci.CCInvoiceNo)||''</a>'', ci.CCInvoiceDate, GetPartyName(ci.PartyCode), ci.VehicleNo, ci.CCInvoiceAmount,'"),
    @("'Select ''E-Invoice'', e.Irn, e.AckDate, GetPartyName(ci.PartyCode), ci.VehicleNo, ci.CCInvoiceAmount,'", "'Select ''E-Invoice'', ''<a href=`"''||apex_page.get_url(p_page=>182,p_clear_cache=>''182'',p_items=>''P182_TNO'',p_values=>e.TNo)||''`">''||apex_escape.html(e.Irn)||''</a>'', e.AckDate, GetPartyName(ci.PartyCode), ci.VehicleNo, ci.CCInvoiceAmount,'"),
    @("'Select ''<a href=`"''||apex_page.get_url(p_page=>511,p_clear_cache=>''511'',p_items=>''P511_PARTY_CODE'',p_values=>ci.PartyCode)||''`">''||GetPartyName(ci.PartyCode)||''</a>'' CUSTOMER,'", "'Select ''<a href=`"''||apex_page.get_url(p_page=>910,p_clear_cache=>''910'',p_items=>''P910_PARTY,P910_FROMDATE,P910_TODATE,P910_COMPANY,P910_LOCATION'',p_values=>ci.PartyCode||'',''||:P721_FROMDATE||'',''||:P721_TODATE||'',''||:P721_COMPANY||'',''||:P721_LOCATION)||''`">''||apex_escape.html(GetPartyName(ci.PartyCode))||''</a>'' CUSTOMER,'"),
    @("'         ''Order not dispatched'' EXC_TYPE, ''Sales Order'' STAGE, so.SalesOrderNo DOC_NO,'", "'         ''Order not dispatched'' EXC_TYPE, ''Sales Order'' STAGE, ''<a href=`"''||apex_page.get_url(p_page=>723,p_clear_cache=>''723'',p_items=>''P723_TNO'',p_values=>so.TNo)||''`">''||apex_escape.html(so.SalesOrderNo)||''</a>'' DOC_NO,'"),
    @("'         ''Dispatch not gated'', ''Dispatch Advice'', da.DespatchAdviceNo,'", "'         ''Dispatch not gated'', ''Dispatch Advice'', ''<a href=`"''||apex_page.get_url(p_page=>161,p_clear_cache=>''161'',p_items=>''P161_TNO'',p_values=>da.TNo)||''`">''||apex_escape.html(da.DespatchAdviceNo)||''</a>'','"),
    @("'  Select 1, ''Gate-out not invoiced'', ''Gate Out'', da.DespatchAdviceNo,'", "'  Select 1, ''Gate-out not invoiced'', ''Gate Out'', ''<a href=`"''||apex_page.get_url(p_page=>161,p_clear_cache=>''161'',p_items=>''P161_TNO'',p_values=>da.TNo)||''`">''||apex_escape.html(da.DespatchAdviceNo)||''</a>'','"),
    @("'         ''Invoice without IRN'', ''Invoice'', ci.CCInvoiceNo,'", "'         ''Invoice without IRN'', ''Invoice'', ''<a href=`"''||apex_page.get_url(p_page=>175,p_clear_cache=>''175'',p_items=>''P175_TNO,P175_FORMSTATUS'',p_values=>ci.TNo||'',EDITRECORD'')||''`">''||apex_escape.html(ci.CCInvoiceNo)||''</a>'','"),
    @("'  Select 1, ''Stale open gate movement'', ''Gate Out'', mo.MaterialOutNo,'", "'  Select 1, ''Stale open gate movement'', ''Gate Out'', ''<a href=`"''||apex_page.get_url(p_page=>168,p_clear_cache=>''168'',p_items=>''P168_TNO,P168_FORMSTATUS'',p_values=>mo.TNo||'',EDITRECORD'')||''`">''||apex_escape.html(mo.MaterialOutNo)||''</a>'','"),
    @("'         ''Awaiting final weighment'', ''Weighment'', w2.WeighmentNo,'", "'         ''Awaiting final weighment'', ''Weighment'', ''<a href=`"''||apex_page.get_url(p_page=>133,p_clear_cache=>''133'',p_items=>''P133_TNO'',p_values=>w2.TNo)||''`">''||apex_escape.html(w2.WeighmentNo)||''</a>'','"),
    @(",p_button_redirect_url=>'f?p=&APP_ID.:721:&SESSION.::&DEBUG.:730'", ",p_button_redirect_url=>'f?p=&APP_ID.:721:&SESSION.::&DEBUG.:721'")
)
foreach ($replacement in $routeReplacements) {
    $sql = $sql.Replace($replacement[0], $replacement[1])
}

# The drill URLs above are returned as safe, application-generated anchor HTML.
# Tell APEX IR columns to render them instead of escaping the markup as text.
$sql = [regex]::Replace(
    $sql,
    "(?s)(p_db_column_name=>'(?:AGENT|CCINVOICENO|DOC_NO)'.*?,p_column_type=>'STRING')(\r?\n)(?!,p_display_text_as=>)",
    "`${1}`${2},p_display_text_as=>'WITHOUT_MODIFICATION'`${2}"
)

# Retain the compatibility bind for imported SQL, but it must never render as
# an Ironmart filter. Its value remains null, so Company and Location alone
# determine scope.
$sql = [regex]::Replace(
    $sql,
    "(?s)(p_name=>'P721_PANEL'.*?p_display_as=>')NATIVE_SELECT_LIST(')",
    '${1}NATIVE_HIDDEN${2}'
)

[IO.File]::WriteAllText($OutputPage, $sql, [Text.UTF8Encoding]::new($false))
Write-Host "Built $OutputPage from live App 105 export ($($sql.Length) characters)"
