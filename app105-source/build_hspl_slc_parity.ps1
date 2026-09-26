param(
    [Parameter(Mandatory = $true)]
    [string]$SourceExport,
    [string]$OutputPage = "$PSScriptRoot\hspl_page_00721_parity.sql"
)

$sql = [IO.File]::ReadAllText((Resolve-Path -LiteralPath $SourceExport), [Text.Encoding]::UTF8)

# Import into Ironmart application 105 while preserving the HSPL component model.
$sql = $sql.Replace("p_default_application_id=>900", "p_default_application_id=>105")
$sql = $sql.Replace("p_default_workspace_id=>1516344673109637", "p_default_workspace_id=>4744311978888504")
$sql = $sql.Replace("p_default_id_offset=>0", "p_default_id_offset=>721000000000000000")
$sql = $sql.Replace("p_default_owner=>'HSPLDASHBOARD'", "p_default_owner=>'IMART'")
$sql = $sql.Replace("APPLICATION 900 - DASHBOARD(UI DEVELOPMENT)", "APPLICATION 105 - IRONMART HSPL SLC PARITY")
$sql = $sql.Replace("Application:     900", "Application:     105")

# Page 730 is the HSPL reference; page 721 is its Ironmart destination.
$sql = $sql.Replace("p_page_id=>730", "p_page_id=>721")
$sql = $sql.Replace("p_id=>730`r`n,p_name=>'Sales Lifecycle Control Tower'", "p_id=>721`r`n,p_name=>'Sales Lifecycle Control Tower'")
$sql = $sql.Replace("p_id=>730`n,p_name=>'Sales Lifecycle Control Tower'", "p_id=>721`n,p_name=>'Sales Lifecycle Control Tower'")
$sql = $sql.Replace("PAGE: 730", "PAGE: 721")
$sql = $sql.Replace("page_00730", "page_00721")
$sql = $sql.Replace("Page 730", "Page 721")
$sql = $sql.Replace("P730_", "P721_")
$sql = $sql.Replace("GetUserPanelAB_apex()", "SAGAR.GetUserPanelAB_apex()")

# Ironmart uses Sales Quotation as the commercial-confirmation stage and its
# operational tables are not panelised. Compatibility views add the HSPL
# column contract while the qualified panel function remains fail-closed for
# any user whose SAGAR policy returns a concrete panel.
$sql = [regex]::Replace($sql, '(?i)\bSalesConfirmDetail\b', 'SLC_SalesConfirmDetail')
$sql = [regex]::Replace($sql, '(?i)\bSalesConfirm\b', 'SLC_SalesConfirm')
$sql = [regex]::Replace($sql, '(?i)\bSalesOrder\b', 'SLC_SalesOrder')
$sql = [regex]::Replace($sql, '(?i)\bDespatchAdvice\b', 'SLC_DespatchAdvice')
$sql = [regex]::Replace($sql, '(?i)\bMaterialOut\b', 'SLC_MaterialOut')
$sql = [regex]::Replace($sql, '(?i)\bWeighment\b', 'SLC_Weighment')
$sql = [regex]::Replace($sql, '(?i)\bCCInvoice\b', 'SLC_CCInvoice')
$sql = [regex]::Replace($sql, '(?i)\bCCInvoiceDetail\b', 'SLC_CCInvoiceDetail')
$sql = [regex]::Replace($sql, '(?i)\bEInvoice\b', 'SLC_EInvoice')
$sql = [regex]::Replace($sql, '(?i)\bVoucherDetail\b', 'SLC_VoucherDetail')
$sql = [regex]::Replace($sql, '(?i)\bCreditLimitApproval\b', 'SLC_CreditLimitApproval')
$sql = [regex]::Replace($sql, '(?i)\bSCBalance\b', 'SLC_SCBalance')
$sql = [regex]::Replace($sql, '(?i)\bItemSpecification\b', 'SLC_ItemSpecification')

# Undo compatibility-object naming inside user-facing prose and labels. SQL
# object references remain SLC_*; only literal display text is normalised.
$sql = $sql.Replace("gate and SLC_Weighment, invoice", "gate and weighment, invoice")
$sql = $sql.Replace("Awaiting final SLC_Weighment", "Awaiting final weighment")
$sql = $sql.Replace("close SLC_Weighment", "close weighment")
$sql = $sql.Replace("Complete SLC_Weighment and gate-out", "Complete weighment and gate-out")
$sql = $sql.Replace("''SLC_Weighment''", "''Weighment''")
$sql = $sql.Replace("''SLC_Weighment complete''", "''Weighment complete''")
$sql = $sql.Replace("p_column_label=>'SLC_Weighment'", "p_column_label=>'Weighment'")

# HSPL calls its commercial commitment a Sales Confirmation. Ironmart has no
# such module: the real document at this point in the flow is Sales Quotation.
# Keep the proven HSPL layout and SQL grain, but make every user-facing label
# and route describe the live Ironmart document it is actually reading.
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

# The broad object mapping must not rename data values, display labels, or IR
# column aliases. DocumentStatusDetail stores the original ERP module codes.
foreach ($name in @('SalesConfirm','SalesOrder','DespatchAdvice','MaterialOut','Weighment','CCInvoice','EInvoice','VoucherDetail','CreditLimitApproval','SCBalance')) {
    $sql = $sql.Replace("''SLC_${name}''", "''${name}''")
}
$sql = $sql.Replace("so.SalesOrderNo SLC_SalesOrder,so.SalesOrderDate SalesDate", "so.SalesOrderNo SALESORDER,so.SalesOrderDate SalesDate")
$sql = $sql.Replace("p_db_column_name=>'SLC_SalesOrder'", "p_db_column_name=>'SALESORDER'")
$sql = $sql.Replace(":SLC_SalesOrder:SALESDATE", ":SALESORDER:SALESDATE")
$sql = $sql.Replace(
    "If lValue Not In (''10'',''20'',''30'',''40'',''50'',''60'',''70'') Then",
    "If lValue Not In (''10'',''20'',''30'',''40'',''50'',''60'',''70'',''H1'',''H2'',''H3'',''H4'',''H5'') Then"
)

# Ironmart invoice details do not repeat the originating order TNo. The CC
# invoice header carries SalesOrderTNo, so preserve the HSPL movement grain by
# deriving the reference from the header instead of fabricating a detail link.
$sql = $sql.Replace("Select d.ReferenceTNo,d.ItemCode,d.ItemSpecificationCode,", "Select h.SalesOrderTNo ReferenceTNo,d.ItemCode,d.ItemSpecificationCode,")
$sql = $sql.Replace("Join Scope s On s.TNo=d.ReferenceTNo", "Join Scope s On s.TNo=h.SalesOrderTNo")
$sql = $sql.Replace("Group By d.ReferenceTNo,d.ItemCode,d.ItemSpecificationCode", "Group By h.SalesOrderTNo,d.ItemCode,d.ItemSpecificationCode")
$sql = $sql.Replace("p_page=>730", "p_page=>721")
$sql = $sql.Replace(".:730:", ".:721:")
$sql = $sql.Replace("::730", "::721")

# HSPL 360 pages have already been rebuilt as Ironmart-compatible pages 722-725.
$pageMap = [ordered]@{
    '731' = '722' # Sales Confirmation 360
    '734' = '723' # Sales Order 360
    '732' = '724' # Vehicle 360
    '733' = '725' # Category 360
}
foreach ($from in $pageMap.Keys) {
    $to = $pageMap[$from]
    $sql = $sql.Replace("p_page=>$from", "p_page=>$to")
    $sql = $sql.Replace(".:${from}:", ".:${to}:")
    $sql = $sql.Replace("::${from}", "::${to}")
    $sql = $sql.Replace("P${from}_", "P${to}_")
}

# Map HSPL operational registers to their established Ironmart equivalents.
$sql = $sql.Replace("p_page=>520,p_clear_cache=>''520,RIR''", "p_page=>704,p_clear_cache=>''704,RIR''")
$sql = $sql.Replace("P520_", "P704_")
$sql = $sql.Replace("p_page=>16,p_clear_cache=>''16,RIR''", "p_page=>170,p_clear_cache=>''170,RIR''")
$sql = $sql.Replace("P16_", "P170_")
$sql = $sql.Replace("p_page=>77,p_request=>''IR[MYID]_EQ_MSTATUS'',p_clear_cache=>''77,RIR''", "p_page=>167,p_clear_cache=>''167,RIR''")
$sql = $sql.Replace("p_page=>77,p_clear_cache=>''77,RIR''", "p_page=>160,p_clear_cache=>''160,RIR''")
$sql = $sql.Replace(",P77_MSTATUS", "")
$sql = $sql.Replace("P77_FROMDATE,P77_TODATE,P77_COMPANY,P77_LOCATION", "P160_FROMDATE,P160_TODATE,P160_COMPANY,P160_LOCATION")
$sql = [regex]::Replace(
    $sql,
    "(?s)(p_page=>167,p_clear_cache=>''167,RIR''.*?p_items=>'')P160_FROMDATE,P160_TODATE,P160_COMPANY,P160_LOCATION",
    '${1}P167_FROMDATE,P167_TODATE,P167_COMPANY,P167_LOCATION'
)
$sql = $sql.Replace("||'',PREPARED'') GateInUrl", ") GateInUrl")
$sql = $sql.Replace("p_page=>314", "p_page=>132")
$sql = $sql.Replace("''314,RIR''", "''132,RIR''")
$sql = $sql.Replace("P314_", "P132_")
# Ironmart page 132 has no date/company/location page items. Preserve the report
# request, but do not pass HSPL-only item names that would raise ERR-1002.
$sql = [regex]::Replace(
    $sql,
    "(?s)'    apex_page\.get_url\(p_page=>132,p_request=>''IR\[MYID\]_NN_FIRSTWEIGHT'',p_clear_cache=>''132,RIR'',',\r?\n'      p_items=>.*?',\r?\n'      p_values=>.*?\) FirstUrl,'",
    "'    apex_page.get_url(p_page=>132,p_request=>''IR[MYID]_NN_FIRSTWEIGHT'',p_clear_cache=>''132,RIR'') FirstUrl,'"
)
$sql = [regex]::Replace(
    $sql,
    "(?s)'    apex_page\.get_url\(p_page=>132,p_request=>''IR\[MYID\]_NN_SECONDWEIGHT'',p_clear_cache=>''132,RIR'',',\r?\n'      p_items=>.*?',\r?\n'      p_values=>.*?\) SecondUrl,'",
    "'    apex_page.get_url(p_page=>132,p_request=>''IR[MYID]_NN_SECONDWEIGHT'',p_clear_cache=>''132,RIR'') SecondUrl,'"
)
$sql = $sql.Replace("p_page=>78", "p_page=>167")
$sql = $sql.Replace("''78,RIR''", "''167,RIR''")
$sql = $sql.Replace("P78_", "P167_")
$sql = $sql.Replace("p_page=>56", "p_page=>174")
$sql = $sql.Replace("''56,RIR''", "''174,RIR''")
$sql = $sql.Replace("P56_", "P174_")
$sql = $sql.Replace("p_page=>655", "p_page=>511")
$sql = $sql.Replace("''655''", "''511''")
$sql = $sql.Replace("P655_", "P511_")
$sql = $sql.Replace("p_page=>656", "p_page=>726")
$sql = $sql.Replace("''656''", "''726''")
$sql = $sql.Replace("P656_", "P726_")
$sql = $sql.Replace("p_page=>693", "p_page=>511")
$sql = $sql.Replace("''693''", "''511''")
$sql = $sql.Replace("P693_", "P511_")

[IO.File]::WriteAllText($OutputPage, $sql, (New-Object Text.UTF8Encoding($false)))
Write-Host "Built $OutputPage ($($sql.Length) characters)"
