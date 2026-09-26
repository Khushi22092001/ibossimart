param(
    [string]$SourceRoot = "app105-source\business-insights-live-export\f105\application",
    [string]$OutputRoot = "audit-output-20260925"
)

$ErrorActionPreference = 'Stop'
$pagesRoot = Join-Path $SourceRoot 'pages'
New-Item -ItemType Directory -Force -Path $OutputRoot | Out-Null

function Get-FirstMatch([string]$Text, [string]$Pattern) {
    $m = [regex]::Match($Text, $Pattern, [Text.RegularExpressions.RegexOptions]::Singleline)
    if ($m.Success) { return ($m.Groups[1].Value -replace "''", "'") }
    return ''
}

function Get-Count([string]$Text, [string]$Pattern) {
    return [regex]::Matches($Text, $Pattern, [Text.RegularExpressions.RegexOptions]::IgnoreCase).Count
}

function Get-Module([string]$Name, [string]$Text) {
    # Module assignment is deliberately driven mainly by the page name. Searching
    # the whole source over-classifies pages because shared LOVs reference many modules.
    $s = $Name.ToLowerInvariant()
    if ($s -match 'employee|salary|leave|attendance|loan|conveyance|separation|payroll|deduction|earning|staff|gate pass') { return 'Hire to Retire / HR & Payroll' }
    if ($s -match 'asset|depreciation') { return 'Asset Management' }
    if ($s -match 'sales|customer|ccinvoice|cc invoice|dispatch|despatch|proforma|e-invoice|outward') { return 'Order to Cash / Sales' }
    if ($s -match 'purchase|supplier|vendor|indent|grn|material in|rate contract|payment advice|inward|bill pass|quotation|enquiry') { return 'Procure to Pay / Purchase' }
    if ($s -match 'freight|transporter|lorry|vehicle|loading advice') { return 'Freight / Logistics' }
    if ($s -match 'stock|inventory|warehouse|godown|material issue|mrn') { return 'Inventory Control' }
    if ($s -match 'voucher|ledger|account|bank|cash|gst|tds|trial balance|balance sheet|profit|expense|receipt|payment') { return 'Finance & Accounts' }
    if ($s -match 'job|service|work order|labour') { return 'Job & Services' }
    if ($s -match 'visitor') { return 'Visitor Management' }
    if ($s -match 'master|setup|configuration|company|location|department|designation|uom|unit|city|state|country|tax|hsn|sac|party') { return 'General Masters / Setup' }
    if ($s -match 'report|dashboard|analytics|360|command centre|statement') { return 'Reports / MIS / Dashboard' }
    return 'Cross-module / Other'
}

function Get-Category([string]$Name, [int]$Items, [int]$Processes, [int]$IR, [int]$IG) {
    if ($Name -match '(?i)master' -and $Name -notmatch '(?i)list|register|report') { return 'Master entry' }
    if ($Name -match '(?i)list|register|report|statement|dashboard|analytics|360|pending|tracking') { return 'List / report / enquiry' }
    if ($Processes -gt 0 -and ($Items -gt 4 -or $IG -gt 0)) { return 'Transaction / entry form' }
    if ($IR -gt 0 -or $IG -gt 0) { return 'Grid / report page' }
    return 'Utility / navigation / other'
}

$rows = foreach ($file in Get-ChildItem -LiteralPath $pagesRoot -Filter 'page_*.sql' -File | Where-Object { $_.BaseName -notmatch '_1$' }) {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    $page = Get-FirstMatch $text 'wwv_flow_imp_page\.create_page\(\s*\r?\n\s*p_id=>(\d+)'
    if ($page -eq '') { continue }
    $name = Get-FirstMatch $text ",p_name=>'((?:''|[^'])*)'"
    $alias = Get-FirstMatch $text ",p_alias=>'((?:''|[^'])*)'"
    $mode = Get-FirstMatch $text ",p_page_mode=>'((?:''|[^'])*)'"
    if ($mode -eq '') { $mode = 'Normal' }
    $regions = Get-Count $text 'wwv_flow_imp_page\.create_page_plug\('
    $items = Get-Count $text 'wwv_flow_imp_page\.create_page_item\('
    $buttons = Get-Count $text 'wwv_flow_imp_page\.create_page_button\('
    $das = Get-Count $text 'wwv_flow_imp_page\.create_page_da_event\('
    $daActions = Get-Count $text 'wwv_flow_imp_page\.create_page_da_action\('
    $processes = Get-Count $text 'wwv_flow_imp_page\.create_page_process\('
    $validations = Get-Count $text 'wwv_flow_imp_page\.create_page_validation\('
    $computations = Get-Count $text 'wwv_flow_imp_page\.create_page_computation\('
    $branches = Get-Count $text 'wwv_flow_imp_page\.create_page_branch\('
    $ig = Get-Count $text "p_plug_source_type=>'NATIVE_IG'"
    $ir = Get-Count $text "p_plug_source_type=>'NATIVE_IR'"
    $tabs = Get-Count $text "p_region_template_options=>'.*t-TabsRegion-mod--"
    $commits = Get-Count $text '\bcommit\s*;'
    $rollbacks = Get-Count $text '\brollback\s*;'
    $dml = Get-Count $text '\b(insert\s+into|update\s+[a-z0-9_$#\.]+\s+set|delete\s+from|merge\s+into)\b'
    $rowStatus = Get-Count $text 'APEX\$ROW_STATUS'
    $waitNo = Get-Count $text "p_wait_for_result=>'N'"
    $ajax = Get-Count $text "p_process_point=>'AJAX'|p_process_type=>'NATIVE_PLSQL'"
    $required = Get-Count $text "p_is_required=>true"
    $warnUnsaved = Get-FirstMatch $text ",p_warn_on_unsaved_changes=>'([^']*)'"
    if ($warnUnsaved -eq '') { $warnUnsaved = 'Default/unspecified' }
    $auth = Get-FirstMatch $text ",p_required_role=>wwv_flow_imp\.id\((\d+)\)"
    $public = Get-FirstMatch $text ",p_page_is_public_y_n=>'([^']*)'"
    if ($public -eq '') { $public = 'N/unspecified' }
    $category = Get-Category $name $items $processes $ir $ig
    [pscustomobject]@{
        Page = [int]$page
        PageName = $name
        Alias = $alias
        Module = Get-Module $name $text
        Category = $category
        PageMode = $mode
        Regions = $regions
        Items = $items
        RequiredItems = $required
        Buttons = $buttons
        DynamicActions = $das
        DAActions = $daActions
        AsyncNoWaitActions = $waitNo
        Processes = $processes
        Validations = $validations
        Computations = $computations
        Branches = $branches
        InteractiveGrids = $ig
        InteractiveReports = $ir
        TabContainers = $tabs
        ExplicitDML = $dml
        ExplicitCommits = $commits
        ExplicitRollbacks = $rollbacks
        ApexRowStatusRefs = $rowStatus
        WarnOnUnsavedChanges = $warnUnsaved
        AuthorizationSchemeId = $auth
        PublicFlag = $public
        File = $file.FullName
    }
}

$rows = $rows | Sort-Object Page
$rows | Export-Csv -LiteralPath (Join-Path $OutputRoot 'complete-page-inventory.csv') -NoTypeInformation -Encoding UTF8

$moduleSummary = $rows | Group-Object Module | ForEach-Object {
    $g = $_.Group
    [pscustomobject]@{
        Module = $_.Name
        Pages = $g.Count
        MasterEntryPages = ($g | Where-Object Category -eq 'Master entry').Count
        TransactionEntryPages = ($g | Where-Object Category -eq 'Transaction / entry form').Count
        ListReportPages = ($g | Where-Object Category -eq 'List / report / enquiry').Count
        DynamicActions = ($g | Measure-Object DynamicActions -Sum).Sum
        Processes = ($g | Measure-Object Processes -Sum).Sum
        ExplicitCommits = ($g | Measure-Object ExplicitCommits -Sum).Sum
        ExplicitRollbacks = ($g | Measure-Object ExplicitRollbacks -Sum).Sum
        ExplicitDML = ($g | Measure-Object ExplicitDML -Sum).Sum
        Tabs = ($g | Measure-Object TabContainers -Sum).Sum
    }
} | Sort-Object Module
$moduleSummary | Export-Csv -LiteralPath (Join-Path $OutputRoot 'module-summary.csv') -NoTypeInformation -Encoding UTF8

$riskRows = foreach ($r in $rows) {
    $signals = New-Object System.Collections.Generic.List[string]
    $severity = 'P3'
    if ($r.ExplicitCommits -gt 0 -and $r.ExplicitRollbacks -eq 0) { $signals.Add('Explicit COMMIT without explicit ROLLBACK in page source'); $severity = 'P1' }
    if ($r.ApexRowStatusRefs -gt 0 -and $r.ExplicitDML -gt 0) { $signals.Add('Custom IG row-status DML; verify atomicity and optimistic locking'); if ($severity -ne 'P1') { $severity = 'P1' } }
    if ($r.AsyncNoWaitActions -gt 0) { $signals.Add('Dynamic Action server call does not wait for result'); if ($severity -eq 'P3') { $severity = 'P2' } }
    if ($r.Category -in @('Transaction / entry form','Master entry') -and $r.WarnOnUnsavedChanges -eq 'N') { $signals.Add('Unsaved-change warning disabled'); if ($severity -eq 'P3') { $severity = 'P2' } }
    if ($r.Processes -gt 0 -and $r.Validations -eq 0 -and $r.Category -eq 'Transaction / entry form') { $signals.Add('Transaction page has processes but no declarative page validation'); if ($severity -eq 'P3') { $severity = 'P2' } }
    if ($r.PublicFlag -eq 'Y') { $signals.Add('Page marked public; verify business data exposure'); if ($severity -eq 'P3') { $severity = 'P1' } }
    if ($signals.Count -gt 0) {
        [pscustomobject]@{Page=$r.Page;PageName=$r.PageName;Module=$r.Module;Category=$r.Category;Severity=$severity;Signals=($signals -join ' | ');File=$r.File}
    }
}
$riskRows | Export-Csv -LiteralPath (Join-Path $OutputRoot 'static-risk-signals.csv') -NoTypeInformation -Encoding UTF8

$events = [ordered]@{
    'Page regions' = ($rows | Measure-Object Regions -Sum).Sum
    'Page items' = ($rows | Measure-Object Items -Sum).Sum
    'Required items' = ($rows | Measure-Object RequiredItems -Sum).Sum
    'Buttons' = ($rows | Measure-Object Buttons -Sum).Sum
    'Dynamic Actions' = ($rows | Measure-Object DynamicActions -Sum).Sum
    'Dynamic Action actions' = ($rows | Measure-Object DAActions -Sum).Sum
    'Async/no-wait DA actions' = ($rows | Measure-Object AsyncNoWaitActions -Sum).Sum
    'Page processes' = ($rows | Measure-Object Processes -Sum).Sum
    'Declarative validations' = ($rows | Measure-Object Validations -Sum).Sum
    'Computations' = ($rows | Measure-Object Computations -Sum).Sum
    'Branches' = ($rows | Measure-Object Branches -Sum).Sum
    'Interactive Grids' = ($rows | Measure-Object InteractiveGrids -Sum).Sum
    'Interactive Reports' = ($rows | Measure-Object InteractiveReports -Sum).Sum
    'Tab containers' = ($rows | Measure-Object TabContainers -Sum).Sum
    'Explicit DML statements' = ($rows | Measure-Object ExplicitDML -Sum).Sum
    'Explicit COMMIT statements' = ($rows | Measure-Object ExplicitCommits -Sum).Sum
    'Explicit ROLLBACK statements' = ($rows | Measure-Object ExplicitRollbacks -Sum).Sum
    'APEX$ROW_STATUS references' = ($rows | Measure-Object ApexRowStatusRefs -Sum).Sum
}
$events.GetEnumerator() | ForEach-Object { [pscustomobject]@{Metric=$_.Key;Count=$_.Value} } | Export-Csv -LiteralPath (Join-Path $OutputRoot 'event-summary.csv') -NoTypeInformation -Encoding UTF8

# Component-level evidence inventory for every page. This is intentionally kept
# separate from the page summary so reviewers can filter exact process/DA/button names.
$componentRows = foreach ($file in Get-ChildItem -LiteralPath $pagesRoot -Filter 'page_*.sql' -File | Where-Object { $_.BaseName -notmatch '_1$' }) {
    $text = Get-Content -LiteralPath $file.FullName -Raw
    $page = Get-FirstMatch $text 'wwv_flow_imp_page\.create_page\(\s*\r?\n\s*p_id=>(\d+)'
    if ($page -eq '') { continue }
    $pageName = Get-FirstMatch $text ",p_name=>'((?:''|[^'])*)'"
    $module = Get-Module $pageName $text
    $types = @(
        @{Type='Process'; Pattern='wwv_flow_imp_page\.create_page_process\((.*?)\r?\n\);'},
        @{Type='Dynamic Action'; Pattern='wwv_flow_imp_page\.create_page_da_event\((.*?)\r?\n\);'},
        @{Type='DA Action'; Pattern='wwv_flow_imp_page\.create_page_da_action\((.*?)\r?\n\);'},
        @{Type='Button'; Pattern='wwv_flow_imp_page\.create_page_button\((.*?)\r?\n\);'},
        @{Type='Region'; Pattern='wwv_flow_imp_page\.create_page_plug\((.*?)\r?\n\);'},
        @{Type='Validation'; Pattern='wwv_flow_imp_page\.create_page_validation\((.*?)\r?\n\);'}
    )
    foreach ($def in $types) {
        foreach ($m in [regex]::Matches($text, $def.Pattern, [Text.RegularExpressions.RegexOptions]::Singleline)) {
            $b = $m.Groups[1].Value
            $name = Get-FirstMatch $b ",p_name=>'((?:''|[^'])*)'"
            if ($name -eq '') { $name = Get-FirstMatch $b ",p_button_name=>'((?:''|[^'])*)'" }
            if ($name -eq '') { $name = Get-FirstMatch $b ",p_process_name=>'((?:''|[^'])*)'" }
            if ($name -eq '') { $name = Get-FirstMatch $b ",p_plug_name=>'((?:''|[^'])*)'" }
            if ($name -eq '') { $name = Get-FirstMatch $b ",p_validation_name=>'((?:''|[^'])*)'" }
            $event = Get-FirstMatch $b ",p_bind_event_type=>'((?:''|[^'])*)'"
            if ($event -eq '') { $event = Get-FirstMatch $b ",p_event=>'((?:''|[^'])*)'" }
            $processPoint = Get-FirstMatch $b ",p_process_point=>'((?:''|[^'])*)'"
            $impl = Get-FirstMatch $b ",p_process_type=>'((?:''|[^'])*)'"
            if ($impl -eq '') { $impl = Get-FirstMatch $b ",p_action=>'((?:''|[^'])*)'" }
            if ($impl -eq '') { $impl = Get-FirstMatch $b ",p_button_action=>'((?:''|[^'])*)'" }
            if ($impl -eq '') { $impl = Get-FirstMatch $b ",p_plug_source_type=>'((?:''|[^'])*)'" }
            $wait = Get-FirstMatch $b ",p_wait_for_result=>'([^']*)'"
            [pscustomobject]@{
                Page=[int]$page; PageName=$pageName; Module=$module; ComponentType=$def.Type
                ComponentName=$name; Event=$event; ProcessPoint=$processPoint; Implementation=$impl
                WaitForResult=$wait; ExplicitDML=(Get-Count $b '\b(insert\s+into|update\s+[a-z0-9_$#\.]+\s+set|delete\s+from|merge\s+into)\b')
                ExplicitCommit=(Get-Count $b '\bcommit\s*;'); ExplicitRollback=(Get-Count $b '\brollback\s*;')
                RowStatusRefs=(Get-Count $b 'APEX\$ROW_STATUS'); File=$file.FullName
            }
        }
    }
}
$componentRows | Sort-Object Page,ComponentType,ComponentName | Export-Csv -LiteralPath (Join-Path $OutputRoot 'complete-component-inventory.csv') -NoTypeInformation -Encoding UTF8

$masterRegister = foreach ($r in $riskRows) {
    $severity = $r.Severity
    $issue = $r.Signals
    $pattern = if ($issue -match 'COMMIT') { 'Page-level explicit transaction control' } elseif ($issue -match 'row-status') { 'Custom Interactive Grid DML' } elseif ($issue -match 'does not wait') { 'Asynchronous dependent Dynamic Action' } elseif ($issue -match 'Unsaved') { 'Forms-style navigation without browser-state protection' } elseif ($issue -match 'public') { 'Public page / weak page access boundary' } else { 'Page process without declarative validation' }
    $recommended = if ($issue -match 'COMMIT') { 'One atomic server-side business service; commit once after all validation and DML; rollback on any exception' } elseif ($issue -match 'row-status') { 'Central DML API plus row version/checksum optimistic locking and database constraints' } elseif ($issue -match 'does not wait') { 'Promise-based sequencing, disable dependent controls, explicit success/error/finally handlers' } elseif ($issue -match 'Unsaved') { 'Enable unsaved-change protection and maintain a single final Save boundary' } elseif ($issue -match 'public') { 'Require authentication and page authorization; retest direct URL access' } else { 'Add named server-side business validations and database constraints' }
    [pscustomobject]@{
        ID=('AUTO-{0:D4}' -f [int]$r.Page); Module=$r.Module; Page=$r.Page; PageName=$r.PageName
        Event='Static page audit'; Component='Page/process configuration'; Issue=$issue
        RootCause=$pattern; FailureScenario='Slow response, retry, stale tab, validation error, or concurrent edit reaches this page pattern'
        DataRisk=if($severity -in @('P0','P1')){'Wrong, duplicate, partial, stale, or exposed ERP data'}else{'Unreliable behaviour or loss of unsaved work'}
        Severity=$severity; CurrentPattern=$pattern; RecommendedPattern=$recommended
        ActionRequired='Confirm in staging with APEX Debug and database trace, then remediate using the recommended standard'
        ImplementationType=if($issue -match 'COMMIT|row-status'){'Refactoring / Database Change'}elseif($issue -match 'public'){'Quick Fix + Security Review'}else{'Quick Fix / Refactoring'}
        Priority=$severity; TestingRequired='Fast/slow network, double-click, retry, session expiry, same-record concurrency, and multiple-tab test'
        Status='Open - requires developer verification'
    }
}
$masterRegister | Export-Csv -LiteralPath (Join-Path $OutputRoot 'ERP_APPLICATION_MASTER_REMEDIATION_REGISTER.csv') -NoTypeInformation -Encoding UTF8

[pscustomobject]@{
    CanonicalPages = $rows.Count
    Modules = $moduleSummary.Count
    RiskSignalPages = $riskRows.Count
    Components = $componentRows.Count
    MasterRegisterRows = $masterRegister.Count
    GeneratedAt = (Get-Date).ToString('s')
    SourceRoot = (Resolve-Path $SourceRoot).Path
} | ConvertTo-Json | Set-Content -LiteralPath (Join-Path $OutputRoot 'audit-metadata.json') -Encoding UTF8

Write-Output "Generated audit inventory for $($rows.Count) canonical pages in $OutputRoot"
