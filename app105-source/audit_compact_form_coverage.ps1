# Audits the exported application against the shared compact-form inventory.
# Page 69 is intentionally excluded because Material In is the visual reference
# form and retains its own completed treatment.

$ErrorActionPreference = 'Stop'
$root = Split-Path -Parent $PSScriptRoot
$pagesPath = Join-Path $root 'app105-source\export\f105\application\pages'
$themePath = Join-Path $root 'app105-source\hspl-theme.js'

$nativeFormPages = @(rg -l "p_plug_source_type=>'NATIVE_FORM'" $pagesPath |
  ForEach-Object {
    if ($_ -match 'page_(\d+)\.sql$') { [int]$matches[1] }
  } | Sort-Object -Unique)

$theme = Get-Content -Raw $themePath
$match = [regex]::Match($theme, 'COMPACT_FORM_PAGE_IDS = new Set\(\[([\s\S]*?)\]\)')
if (-not $match.Success) { throw 'COMPACT_FORM_PAGE_IDS was not found in hspl-theme.js.' }
$compactPages = @([regex]::Matches($match.Groups[1].Value, '\d+') |
  ForEach-Object { [int]$_.Value } | Sort-Object -Unique)

$missing = @($nativeFormPages | Where-Object { $_ -ne 69 -and $_ -notin $compactPages })
$unexpected = @($compactPages | Where-Object { $_ -notin $nativeFormPages })

[pscustomobject]@{
  NativeFormPages      = $nativeFormPages.Count
  CompactInventory     = $compactPages.Count
  ReferencePageExcluded = 69
  MissingCompactPages  = ($missing -join ', ')
  UnexpectedPages      = ($unexpected -join ', ')
} | Format-List

if ($missing.Count -or $unexpected.Count) {
  throw 'Compact form coverage inventory is out of sync with the application export.'
}
