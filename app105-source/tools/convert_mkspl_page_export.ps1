param(
    [Parameter(Mandatory = $true)] [string] $InputCsv,
    [Parameter(Mandatory = $true)] [string] $OutputPath,
    [Parameter(Mandatory = $true)] [int] $SourcePage,
    [Parameter(Mandatory = $true)] [int] $TargetPage,
    [hashtable] $LinkedPages = @{}
)

$rows = Import-Csv -LiteralPath $InputCsv | Sort-Object { [int]$_.N }
$source = ($rows | ForEach-Object { $_.CHUNK }) -join ''

# Point the page export at HSPL / IMART while retaining the exported component IDs.
$source = $source.Replace("p_default_workspace_id=>1500705867312512", "p_default_workspace_id=>4744311978888504")
$source = $source.Replace("p_default_id_offset=>97702725291376421", "p_default_id_offset=>7541489808702750")
$source = $source.Replace("p_default_owner=>'MKSPLDASHBOARD'", "p_default_owner=>'IMART'")

# Map MKSPL Universal Theme component IDs to the matching HSPL templates.
$templateMap = @{
    '4073832297226169690' = '4072355960268175073' # Standard page
    '4502917002193490937' = '4072358936313175081' # Blank / no chrome region
    '4073835273271169698' = '4072358936313175081' # Standard report surface
    '2540130677583398057' = '2538654340625403440' # Standard report rows
    '2084305881903810008' = '2082829544945815391' # Text with icon button
    '3033038003750078790' = '2318601014859922299' # Optional label-above item
}
foreach ($key in $templateMap.Keys) {
    $source = $source.Replace($key, $templateMap[$key])
}

# Page groups are application-specific. HSPL keeps Business Insights navigation
# outside page-group metadata, so remove the MKSPL group reference.
$source = [regex]::Replace($source, "(?m)^,p_group_id=>wwv_flow_imp\.id\([^\r\n]+\)\r?\n", '')

$allPages = @{}
foreach ($key in $LinkedPages.Keys) { $allPages[[int]$key] = [int]$LinkedPages[$key] }
$allPages[$SourcePage] = $TargetPage

# Replace item prefixes first, then page-number operands and manifest filenames.
foreach ($old in ($allPages.Keys | Sort-Object -Descending)) {
    $new = $allPages[$old]
    $source = $source.Replace("P${old}_", "P${new}_")
    $source = [regex]::Replace($source, "(p_page\s*=>\s*)${old}(?!\d)", "`${1}${new}")
    $source = [regex]::Replace($source, "(p_page_id=>)${old}(?!\d)", "`${1}${new}")
    $source = [regex]::Replace($source, "(wwv_flow_imp_page\.create_page\(\s*\r?\n\s*p_id=>)${old}(?!\d)", "`${1}${new}")
    $source = $source.Replace("p_clear_cache => '${old}'", "p_clear_cache => '${new}'")
    $source = $source.Replace("p_clear_cache=>'${old}'", "p_clear_cache=>'${new}'")
    $source = $source.Replace("PAGE: ${old}", "PAGE: ${new}")
    $source = $source.Replace(("delete_{0:D5}" -f $old), ("delete_{0:D5}" -f $new))
    $source = $source.Replace(("page_{0:D5}" -f $old), ("page_{0:D5}" -f $new))
}

$parent = Split-Path -Parent $OutputPath
if ($parent -and -not (Test-Path -LiteralPath $parent)) {
    New-Item -ItemType Directory -Path $parent | Out-Null
}
[System.IO.File]::WriteAllText($OutputPath, $source, [System.Text.UTF8Encoding]::new($false))
