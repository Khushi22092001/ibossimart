param(
    [string]$SourceRoot = $PSScriptRoot,
    [string]$OutputRoot = (Join-Path $PSScriptRoot 'hspl-purchase-parity')
)

$ErrorActionPreference = 'Stop'
New-Item -ItemType Directory -Force -Path $OutputRoot | Out-Null

$pageMap = @{
    '668' = 934 # Purchase Command Centre
    '669' = 935 # Supplier 360
    '679' = 936 # Item 360
    '680' = 937 # Purchase Bill 360
    '681' = 938 # Specification 360
    '682' = 939 # Purchase Order 360
    '683' = 940 # Purchase Analytics
}

$registerMap = @{
    '15'  = 107 # Indent Register
    '27'  = 117 # Purchase Order List
    '36'  = 68  # Material In Register
    '37'  = 145 # GRN Register
    '72'  = 709 # Quotation Register
    '73'  = 142 # Purchase Bill Register
    '75'  = 151 # Purchase Bill Pass Register
    '172' = 198 # Freight Advice List
    '178' = 0   # resolved separately after Account Ledger audit
    '497' = 711 # Comparative Statement Register
}

$sources = @{
    '668' = 'f900_page_668_purchase_command_centre.sql'
    '669' = 'f900_page_669_supplier_360.sql'
    '679' = 'f900_page_679_item_360.sql'
    '680' = 'f900_page_680_purchase_bill_360.sql'
    '681' = 'f900_page_681_specification_360.sql'
}

function Replace-PageReference([string]$Sql, [int]$From, [int]$To) {
    $Sql = $Sql.Replace("P${From}_", "P${To}_")
    $Sql = [regex]::Replace($Sql, "(p_page\s*=>\s*)${From}(?!\d)", "`${1}${To}")
    $Sql = [regex]::Replace($Sql, "(p_page_id=>)${From}(?!\d)", "`${1}${To}")
    $Sql = [regex]::Replace($Sql, "(p_id=>)${From}(?=\r?\n,p_name=>)", "`${1}${To}")
    $Sql = $Sql.Replace("PAGE: ${From}", "PAGE: ${To}")
    $Sql = $Sql.Replace(("delete_{0:D5}" -f $From), ("delete_{0:D5}" -f $To))
    $Sql = $Sql.Replace(("page_{0:D5}" -f $From), ("page_{0:D5}" -f $To))
    $Sql = $Sql.Replace("p_clear_cache=>'${From}", "p_clear_cache=>'${To}")
    $Sql = $Sql.Replace("p_clear_cache => '${From}", "p_clear_cache => '${To}")
    $Sql = $Sql.Replace("p_page=>''${From}''", "p_page=>''${To}''")
    $Sql = $Sql.Replace("p_page => ''${From}''", "p_page => ''${To}''")
    $Sql = $Sql.Replace("p_clear_cache=>''${From}''", "p_clear_cache=>''${To}''")
    $Sql = $Sql.Replace("p_clear_cache => ''${From}''", "p_clear_cache => ''${To}''")
    $Sql = $Sql.Replace(('"page":{0}' -f $From), ('"page":{0}' -f $To))
    $Sql = $Sql.Replace(('"page":"{0}"' -f $From), ('"page":"{0}"' -f $To))
    $Sql = $Sql.Replace(('"clear":"{0}"' -f $From), ('"clear":"{0}"' -f $To))
    $Sql = $Sql.Replace(".:${From}:", ".:${To}:")
    $Sql = $Sql.Replace("::${From}:", "::${To}:")
    $Sql = $Sql.Replace(":NO:${From}:", ":NO:${To}:")
    $Sql = $Sql.Replace(":&DEBUG.:${From}", ":&DEBUG.:${To}")
    return $Sql
}

foreach ($sourcePage in $sources.Keys) {
    $input = Join-Path $SourceRoot $sources[$sourcePage]
    if (-not (Test-Path -LiteralPath $input)) { throw "Missing source export: $input" }
    $sql = [IO.File]::ReadAllText((Resolve-Path -LiteralPath $input), [Text.Encoding]::UTF8)

    $sql = $sql.Replace('p_default_workspace_id=>1516344673109637', 'p_default_workspace_id=>4744311978888504')
    $sql = $sql.Replace('p_default_application_id=>900', 'p_default_application_id=>105')
    $sql = $sql.Replace('p_default_id_offset=>0', 'p_default_id_offset=>934000000000000000')
    $sql = $sql.Replace("p_default_owner=>'HSPLDASHBOARD'", "p_default_owner=>'IMART'")
    $sql = $sql.Replace('APPLICATION 900 - DASHBOARD(UI DEVELOPMENT)', 'APPLICATION 105 - IRONMART PURCHASE COMMAND CENTRE')
    $sql = $sql.Replace('Application:     900', 'Application:     105')
    $sql = [regex]::Replace($sql, "(?m)^,p_group_id=>wwv_flow_imp\.id\([^\r\n]+\)\r?\n", '')
    $sql = $sql.Replace('GetUserPanelAB_apex()', 'SAGAR.GetUserPanelAB_apex()')

    # Ironmart transaction headers are not panelised. Compatibility views add
    # the HSPL PANEL contract without altering operational tables.
    foreach ($objectName in @('PurchaseOrder','PurchaseBill','MaterialIn','Grn','PBPass','Voucher','Enquiry','Quotation','FreightAdvice','Indent','ComparativeStatement')) {
        $sql = [regex]::Replace(
            $sql,
            "(?i)(\b(?:from|join)\s+)${objectName}\b",
            "`${1}PCC_${objectName}"
        )
    }
    $sql = [regex]::Replace($sql, '(?i)(\bfrom\s+)PartyCurrentClosing\b', '`${1}SAGAR.PartyCurrentClosing')
    $sql = $sql.Replace('`From SAGAR.PartyCurrentClosing', 'From SAGAR.PartyCurrentClosing')

    foreach ($from in $pageMap.Keys) {
        $sql = Replace-PageReference $sql $from $pageMap[$from]
    }
    foreach ($from in $registerMap.Keys) {
        $to = $registerMap[$from]
        if ($to -gt 0) { $sql = Replace-PageReference $sql $from $to }
    }

    # App 105 account-ledger page is page 11; it accepts the
    # account code and date window used by the Supplier 360 drill.
    $sql = Replace-PageReference $sql 178 11

    # Ironmart labels: retain the HSPL interaction/visual contract while using
    # the local application name in user-facing copy.
    $sql = $sql.Replace('HSPL', 'IRONMART')
    $sql = [regex]::Replace(
        $sql,
        "(?s)(p_name=>'P9(?:34|35|36|38)_PANEL'.*?p_display_as=>')NATIVE_SELECT_LIST(')",
        '${1}NATIVE_HIDDEN${2}'
    )

    $targetPage = $pageMap[$sourcePage]
    $output = Join-Path $OutputRoot ("p{0:D5}.sql" -f $targetPage)
    [IO.File]::WriteAllText($output, $sql, [Text.UTF8Encoding]::new($false))
    Write-Host "Built page $targetPage -> $output ($($sql.Length) chars)"
}

# Pages 682/683 were recovered from the supplied APEXlang export through an
# isolated temporary compile, then exported together as a component SQL file.
$pairInput = Join-Path $SourceRoot 'hspl-purchase-temp-export\f1900.sql'
if (Test-Path -LiteralPath $pairInput) {
    $sql = [IO.File]::ReadAllText((Resolve-Path -LiteralPath $pairInput), [Text.Encoding]::UTF8)
    $sql = $sql.Replace('p_default_application_id=>1900', 'p_default_application_id=>105')
    $sql = $sql.Replace('p_default_id_offset=>0', 'p_default_id_offset=>934000000000000000')
    $sql = $sql.Replace('APPLICATION 1900 - HSPL Purchase Source Temporary', 'APPLICATION 105 - IRONMART PURCHASE COMMAND CENTRE')
    $sql = $sql.Replace('Application:     1900', 'Application:     105')
    $sql = [regex]::Replace($sql, "(?m)^,p_group_id=>wwv_flow_imp\.id\([^\r\n]+\)\r?\n", '')
    $sql = $sql.Replace('GetUserPanelAB_apex()', 'SAGAR.GetUserPanelAB_apex()')
    foreach ($objectName in @('PurchaseOrder','PurchaseBill','MaterialIn','Grn','PBPass','Voucher','Enquiry','Quotation','FreightAdvice','Indent','ComparativeStatement')) {
        $sql = [regex]::Replace($sql, "(?i)(\b(?:from|join)\s+)${objectName}\b", "`${1}PCC_${objectName}")
    }
    $sql = [regex]::Replace($sql, '(?i)(\bfrom\s+)PartyCurrentClosing\b', '`${1}SAGAR.PartyCurrentClosing')
    $sql = $sql.Replace('`From SAGAR.PartyCurrentClosing', 'From SAGAR.PartyCurrentClosing')
    foreach ($from in $pageMap.Keys) { $sql = Replace-PageReference $sql $from $pageMap[$from] }
    foreach ($from in $registerMap.Keys) {
        $to = $registerMap[$from]
        if ($to -gt 0) { $sql = Replace-PageReference $sql $from $to }
    }
    $sql = Replace-PageReference $sql 178 11
    $sql = $sql.Replace('HSPL', 'IRONMART')
    $sql = [regex]::Replace(
        $sql,
        "(?s)(p_name=>'P940_PANEL'.*?p_display_as=>')NATIVE_SELECT_LIST(')",
        '${1}NATIVE_HIDDEN${2}'
    )
    $pairOutput = Join-Path $OutputRoot 'p00939_p00940.sql'
    [IO.File]::WriteAllText($pairOutput, $sql, [Text.UTF8Encoding]::new($false))
    Write-Host "Built pages 939/940 -> $pairOutput ($($sql.Length) chars)"
}
