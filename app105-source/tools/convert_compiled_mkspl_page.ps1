param(
  [Parameter(Mandatory = $true)] [string] $InputSql,
  [Parameter(Mandatory = $true)] [string] $OutputPath,
  [Parameter(Mandatory = $true)] [int] $SourcePage,
  [Parameter(Mandatory = $true)] [int] $TargetPage,
  [hashtable] $LinkedPages = @{}
)

$source = [IO.File]::ReadAllText((Resolve-Path $InputSql))

# Compile target: HSPL App 105 / IMART. The source may have been compiled under
# an isolated temporary application, so match the environment values rather than
# assuming one specific source offset.
$source = [regex]::Replace($source, "p_default_workspace_id=>\d+", 'p_default_workspace_id=>4744311978888504')
$source = [regex]::Replace($source, "p_default_application_id=>\d+", 'p_default_application_id=>105')
$source = [regex]::Replace($source, "p_default_id_offset=>\d+", 'p_default_id_offset=>7541489808702750')
$source = [regex]::Replace($source, "p_default_owner=>'[^']+'", "p_default_owner=>'IMART'")
$source = [regex]::Replace(
  $source,
  "(?m)^,p_autocomplete_on_off=>'OFF'\r?$",
  ",p_autocomplete_on_off=>'OFF'`r`n,p_javascript_file_urls=>'#APP_FILES#hspl-jet-l10n-fallback.js?version=#APP_VERSION#&cb=20260924a'",
  1
)

$templateMap = @{
  '4073832297226169690' = '4072355960268175073'
  '4502917002193490937' = '4072358936313175081'
  '4073835273271169698' = '4072358936313175081'
  '2540130677583398057' = '2538654340625403440'
  '2084305881903810008' = '2082829544945815391'
  '3033038003750078790' = '2318601014859922299'
}
foreach ($key in $templateMap.Keys) { $source = $source.Replace($key, $templateMap[$key]) }

$source = [regex]::Replace($source, "(?m)^,p_group_id=>wwv_flow_imp\.id\([^\r\n]+\)\r?\n", '')

$allPages = @{}
foreach ($key in $LinkedPages.Keys) { $allPages[[int]$key] = [int]$LinkedPages[$key] }
$allPages[$SourcePage] = $TargetPage
foreach ($old in ($allPages.Keys | Sort-Object -Descending)) {
  $new = $allPages[$old]
  # APEX splits long source strings at arbitrary positions. Rejoin page-item
  # tokens split across adjacent quoted fragments before remapping them.
  $oldText = [string]$old
  for ($split = 1; $split -lt $oldText.Length; $split++) {
    $left = $oldText.Substring(0, $split)
    $right = $oldText.Substring($split)
    $source = [regex]::Replace($source, "P" + $left + "'\r?\n\|\|'" + $right + "_", "P${new}_")
  }
  $source = $source.Replace("P${old}_", "P${new}_")
  $source = [regex]::Replace($source, "(p_page\s*=>\s*)${old}(?!\d)", "`${1}${new}")
  $source = [regex]::Replace($source, "(?i)(\bSelect\s+)${old}(\s*,)", "`${1}${new}`${2}")
  $source = [regex]::Replace($source, "(?i)(\bSelect\s+)${old}(\s+Id\s*,)", "`${1}${new}`${2}")
  $source = [regex]::Replace($source, "(?i)(Pg\.Id\s*(?:=|<>)\s*)${old}(?!\d)", "`${1}${new}")
  $source = [regex]::Replace($source, "(p_page_id=>)${old}(?!\d)", "`${1}${new}")
  $source = [regex]::Replace($source, "(wwv_flow_imp_page\.create_page\(\s*\r?\n\s*p_id=>)${old}(?!\d)", "`${1}${new}")
  $source = $source.Replace("p_clear_cache => '${old}'", "p_clear_cache => '${new}'")
  $source = $source.Replace("p_clear_cache=>'${old}'", "p_clear_cache=>'${new}'")
  # Compiled region SQL stores APEX URLs inside SQL string literals, so the
  # quotes around p_clear_cache are doubled. Direct f?p URLs also carry the
  # target page and clear-cache page as separate substitution-string segments.
  $source = $source.Replace("p_clear_cache => ''${old}''", "p_clear_cache => ''${new}''")
  $source = $source.Replace("p_clear_cache=>''${old}''", "p_clear_cache=>''${new}''")
  $source = $source.Replace("&APP_ID.:${old}:", "&APP_ID.:${new}:")
  $source = $source.Replace("&DEBUG.:${old}:", "&DEBUG.:${new}:")
  $source = $source.Replace("PAGE: ${old}", "PAGE: ${new}")
  $source = $source.Replace(("delete_{0:D5}" -f $old), ("delete_{0:D5}" -f $new))
  $source = $source.Replace(("page_{0:D5}" -f $old), ("page_{0:D5}" -f $new))
}

# HSPL has no Panel column or Panel selector. Remove its item and neutralise
# every reference without deleting compiled string-fragment lines (deleting a
# fragment can also delete the JOIN/ORDER BY text beside the predicate).
$panelName = "P${TargetPage}_PANEL"
$itemPattern = "(?ms)wwv_flow_imp_page\.create_page_item\(\r?\n(?:(?!wwv_flow_imp_page\.create_page_item\().)*?,p_name=>'" + [regex]::Escape($panelName) + "'.*?\r?\n\);\r?\n"
$source = [regex]::Replace($source, $itemPattern, '')

# Remove the complete visible Panel context chip before stripping individual
# predicate lines; otherwise the remaining CASE tail would make the region SQL
# invalid. Each compiled SQL source line is a separate quoted fragment.
$sourceLines = $source -split "(?<=\r?\n)"
$cleanLines = [Collections.Generic.List[string]]::new()
$skipPanelChip = $false
foreach ($line in $sourceLines) {
  if (-not $skipPanelChip -and $line -match 'fa-shield' -and $line -match 'ds-(?:ar|ap|fin)-chip') {
    $skipPanelChip = $true
    if ($line -match '</b></span>') { $skipPanelChip = $false }
    continue
  }
  if ($skipPanelChip) {
    if ($line -match '</b></span>') { $skipPanelChip = $false }
    continue
  }
  $cleanLines.Add($line)
}
$source = $cleanLines -join ''

$source = $source.Replace("GetUserPanelAB_apex()", "cast(null as varchar2(100))")
$source = [regex]::Replace($source, "(?i)\(\s*Select\s+cast\(null as varchar2\(100\)\)\s+From\s+dual\s*\)", "cast(null as varchar2(100))")
$source = [regex]::Replace($source, "(?i)\b[A-Za-z][A-Za-z0-9_]*\.Panel\b", "cast(null as varchar2(100))")
foreach ($mappedPage in $allPages.Values) {
  $mappedPanel = "P${mappedPage}_PANEL"
  $source = $source.Replace(":" + $mappedPanel, "null")
  $source = $source.Replace(",${mappedPanel}", '').Replace("${mappedPanel},", '')
  $source = $source.Replace(",&${mappedPanel}.", '').Replace("&${mappedPanel}.,", '')
  $source = $source.Replace("&${mappedPanel}.", '')
  $source = [regex]::Replace($source, "\|\|\s*'',''\s*\|\|\s*:" + [regex]::Escape($mappedPanel), '')
}
$source = [regex]::Replace($source, "\s*\|\|\s*'',''\s*\|\|\s*null", '')
$source = $source.Replace("||''  |  Panel: ''||nvl(null,''A + B'')", '')
$source = $source.Replace('for this period, company, location and panel &mdash;', 'for this period, company and location &mdash;')
$source = $source.Replace("||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION,P''||Pg.Id||''_PANEL'' End,", "||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION'' End,")

# MKSPL's dashboard launcher region has a source-application privilege EXISTS
# condition. HSPL uses its own application navigation/access model, so keeping
# the source page-id privilege check both hides valid links and can fail before
# the dashboard renders.
if (($SourcePage -ge 690 -and $SourcePage -le 702) -or
    ($SourcePage -ge 708 -and $SourcePage -le 721)) {
  $source = [regex]::Replace(
    $source,
    "(?ms)\r?\n,p_display_when_condition=>wwv_flow_string\.join\(wwv_flow_t_varchar2\(.*?\)\)\r?\n,p_display_condition_type=>'EXISTS'",
    ''
  )

  # The source application's privilege tables are not part of HSPL. The
  # Business Insights entry itself is already protected by HSPL navigation,
  # so render the sibling-page links without querying source-only tables.
  $source = [regex]::Replace(
    $source,
    "(?ms)' Where Pg\.Id <> ${TargetPage}',\r?\n.*?' Order By Pg\.Id'\)\)",
    "' Where Pg.Id <> ${TargetPage}',`r`n' Order By Pg.Id'))"
  )
  $source = [regex]::Replace(
    $source,
    "(?ms)^' Where \(APEX_CUSTOM_AUTH\.GET_USERNAME.*?^' Order By Pg\.Id'\)\)",
    "' Order By Pg.Id'))"
  )
  $source = $source.Replace("||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION,P''||Pg.Id||''_PANEL'' End,", "||Pg.Id||''_COMPANY,P''||Pg.Id||''_LOCATION'' End,")
}

# The original launcher queries and display conditions use MKSPL's page
# ranges.  All dashboard and drill pages in HSPL use the 9xx range.
$source = $source.Replace('Pg.Id Between 690 And 702', 'Pg.Id Between 907 And 919')
$source = $source.Replace('Pg.Id Between 708 And 721', 'Pg.Id Between 920 And 933')
$source = $source.Replace('b.PageID Between 690 And 702', 'b.PageID Between 907 And 919')
$source = $source.Replace('b.PageID Between 708 And 721', 'b.PageID Between 920 And 933')
$source = $source.Replace('ds-kpiwrap ds-arnavwrap', 'ds-kpiwrap ds-kpiwrap--cols ds-arnavwrap')
$source = $source.Replace('ds-kpiwrap ds-apnavwrap', 'ds-kpiwrap ds-kpiwrap--cols ds-apnavwrap')

if ($SourcePage -eq 690) {
  # HSPL Party has no IsCompanyAccount flag. Keep the KPI calculation but
  # treat the optional company-account classification as unavailable.
  $source = [regex]::Replace(
    $source,
    "(?ms)'\s*\(Select p2\.IsCompanyAccount From Party p2',\r?\n'\s*Where p2\.PartyCode = d\.AccountCode\) IsCo,'",
    "'              cast(null as varchar2(1)) IsCo,'"
  )

  # CREDITLIMITAPPROVAL is a source-only table. Preserve the dashboard shape
  # and all other KPIs while returning a truthful empty approval population.
  $source = [regex]::Replace(
    $source,
    "(?ms)'     A As \(',.*?'        Where rn = 1\),',",
    "'     A As (Select 0 InForce, 0 Capped, 0 Uncapped, 0 WithDays From dual),',"
  )
  $source = [regex]::Replace(
    $source,
    "(?ms)'     E As \(Select Count\(\*\) Expired From CreditLimitApproval.*?'            Where c\.TillDate Is Not Null And c\.TillDate < Asof\.D\)',",
    "'     E As (Select 0 Expired From dual)',"
  )
  $source = [regex]::Replace(
    $source,
    "(?ms)'     Lim As \(',.*?'        Where rn = 1\),',",
    "'     Lim As (Select cast(null as varchar2(100)) Pty, cast(null as varchar2(100)) Loc, cast(null as number) Days, cast(null as number) Amt From dual Where 1=0),',"
  )
}

if ($SourcePage -eq 708) {
  # HSPL Party has no IsCompanyAccount flag. Keep all payable logic, but
  # expose the optional classification as unavailable instead of failing.
  $source = [regex]::Replace(
    $source,
    "(?ms)'\s*\(Select p2\.IsCompanyAccount From Party p2',\r?\n'\s*Where p2\.PartyCode = d\.AccountCode\) IsCo,'",
    "'              cast(null as varchar2(1)) IsCo,'"
  )

  # OpenGRIRCost is an MKSPL-only helper view. Its dashboard card remains in
  # the same position and truthfully reports zero until HSPL provides the
  # equivalent source, while the rest of the AP dashboard remains live.
  $source = [regex]::Replace(
    $source,
    "(?ms)'     Grni As \(',.*?'          And \(:P${TargetPage}_LOCATION Is Null Or o\.LocationCode = :P${TargetPage}_LOCATION\)\),',",
    "'     Grni As (Select 0 N, 0 Amt From dual),',"
  )

  # AP-M01 is a Panel-specific control. HSPL has no Panel concept, so do not
  # count every payable row after Panel predicates have been neutralised.
  $source = [regex]::Replace(
    $source,
    "(?ms)'\s*\+ \(Select Count\(\*\) From VoucherDetail d2',\r?\n'\s*Where d2\.AccountCode In \(Select PartyCode From Sd\)',\r?\n'\s*And cast\(null as varchar2\(100\)\) Is Null\) N',",
    "'                  N',"
  )
  $source = $source.Replace(' &middot; AP-M01', '')
  $source = $source.Replace(' and null Panel.', '.')
  $source = $source.Replace('and null Panel.', '')
  $source = $source.Replace('The GRIR view carries no Panel; the panel filter is applied through the underlying GRN.', 'The GRIR population is scoped through the underlying GRN.')
  $source = $source.Replace('AP-M01 null Panel (0 today).', '')
}

if ($SourcePage -in @(691,709)) {
  # HSPL Party has no IsCompanyAccount flag. Internal-vendor/customer slices
  # therefore have no measurable population; all ordinary rows remain Trade.
  $source = $source.Replace("p.IsCompanyAccount = ''YES''", '1=0')
}

if ($SourcePage -eq 693) {
  # CreditLimitApproval is not present in HSPL. Keep Debtor 360 and its custom
  # export functional while presenting credit-limit measures as unavailable.
  $source = [regex]::Replace(
    $source,
    "(?ms)'     Cl As \(',.*?'        Where rn = 1\)',",
    "'     Cl As (Select 0 InForce, cast(null as number) Capped, 0 Uncapped, cast(null as number) Days From dual)',"
  )
  $source = [regex]::Replace(
    $source,
    "(?ms)'\s*Select Max\(CreditAmount\) Keep \(Dense_Rank Last Order By CreditLimitApprovalDate,Tno\)',.*?'\s*And \(:P910_LOCATION Is Null Or LocationCode=:P910_LOCATION\);',",
    "'    lCredit := null;',"
  )
}

if ($SourcePage -in @(714,715)) {
  # OpenGRIRCost is an MKSPL-only helper view. Use a typed empty relation in
  # HSPL so every GRNI region, chart, LOV and AP control remains render-safe
  # and reports zero instead of throwing ORA-00942 or inventing a value.
  $emptyGrir = '(Select cast(null as number) Amount, cast(null as varchar2(100)) CompanyCode, cast(null as date) GRNDate, cast(null as varchar2(100)) GRNNo, cast(null as number) GRNTno, cast(null as varchar2(100)) LocationCode, cast(null as varchar2(100)) PartyBillNo, cast(null as varchar2(20)) Status, cast(null as varchar2(200)) TransporterName, cast(null as varchar2(100)) VehicleNo, cast(null as number) VOCUHERTNO, cast(null as varchar2(100)) VoucherNo From dual Where 1=0)'
  $source = $source.Replace('OpenGRIRCost o', "$emptyGrir o")
  $source = $source.Replace('OpenGRIRCost og', "$emptyGrir og")
  $source = $source.Replace('live OpenGRIRCost view', 'available GR/IR source')
  $source = $source.Replace('<code>OpenGRIRCost</code> view', 'available GR/IR source')
}

# The application has no Panel security dimension. Remove source-only master
# controls from the two exception workbenches so they neither appear nor
# silently count all rows after the shared predicate neutralisation.
if ($SourcePage -in @(696,715)) {
  $prefix = if ($SourcePage -eq 696) { 'AR' } else { 'AP' }
  $source = $source.Replace("'${prefix}-M01'", "'${prefix}-UNUSED'")
  $source = $source.Replace('o.Pnl Is Null', '1=0')
  $source = $source.Replace('PnlN', 'UnusedN')

  # Preserve the classic-report column positions, but render no card for the
  # source-only M01 control and hide its now-empty report column.
  $source = [regex]::Replace(
    $source,
    "(?ms)'\s*''<a class=`"ds-kpi ds-kpi--'' \|\| Case When t\.UnusedN.*?As K12(,?)',",
    "'       cast(null as varchar2(1)) As K12`$1',"
  )
  $source = [regex]::Replace(
    $source,
    "(?ms)(wwv_flow_imp_page\.create_report_columns\(\r?\n(?:(?!wwv_flow_imp_page\.create_report_columns\().)*?,p_column_alias=>'K12'.*?,p_display_as=>)'WITHOUT_MODIFICATION'",
    "`$1'HIDDEN'"
  )

  # The worksheet still needs a typed placeholder in its query, but it must
  # not expose a Panel column in the HSPL UI.
  $source = [regex]::Replace(
    $source,
    "(?ms)(wwv_flow_imp_page\.create_worksheet_column\(\r?\n(?:(?!wwv_flow_imp_page\.create_worksheet_column\().)*?,p_db_column_name=>'PANEL'.*?,p_column_type=>'STRING')",
    "`$1`r`n,p_display_text_as=>'HIDDEN_ESCAPE_SC'"
  )

  # Remove M01 from the visible control catalogue. It is neither a failed nor
  # an unavailable control in HSPL; that security dimension simply does not
  # exist in this application.
  $source = [regex]::Replace(
    $source,
    "(?ms)^'\s*Union All Select ''${prefix}-UNUSED''.*?From dual',\r?\n",
    ''
  )
  $source = $source.Replace(', null Panel.', '.')
  $source = $source.Replace(' and null Panel.', '.')

  if ($SourcePage -eq 715) {
    # AP-A11 is also entirely Panel-derived. Remove it from visible help and
    # the control matrix; its data branch already evaluates to no rows.
    $source = $source.Replace(', AP-A09 and AP-A11.', ' and AP-A09.')
    $source = [regex]::Replace(
      $source,
      "(?ms)^'\s*Union All Select ''AP-A11'',''Cross-panel settlement''.*?From dual',\r?\n",
      ''
    )
    $source = $source.Replace('Location and panel breaks are usually legitimate cross-dimension settlement', 'Location breaks can be legitimate cross-dimension settlement')
  }
}

# The source theme allowed a two-column item with the default two-column label.
# HSPL's current theme rejects that layout at render time. A zero label span
# keeps the compact filter width while placing the label above the control.
$source = [regex]::Replace($source, "(?m)^,p_colspan=>([12])\r?$", ",p_colspan=>`$1`r`n,p_grid_label_column_span=>0")

$parent = Split-Path -Parent $OutputPath
if ($parent -and -not (Test-Path -LiteralPath $parent)) { New-Item -ItemType Directory -Path $parent | Out-Null }
[IO.File]::WriteAllText($OutputPath, $source, [Text.UTF8Encoding]::new($false))
