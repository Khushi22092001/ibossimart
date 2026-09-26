$ErrorActionPreference = 'Stop'
$pageRoot = Join-Path $PSScriptRoot 'export\f105\application\pages'
$pages = Get-ChildItem -LiteralPath $pageRoot -Filter 'page_*.sql'

$igPages = [System.Collections.Generic.List[string]]::new()
$moveTabPages = [System.Collections.Generic.List[string]]::new()
$skipReadonlyPages = [System.Collections.Generic.List[string]]::new()

foreach ($page in $pages) {
    $source = Get-Content -LiteralPath $page.FullName -Raw
    if ($source -match "p_process_name=>'[^']*Save Interactive Grid Data") {
        $igPages.Add($page.Name)
    }
    if ($source -match "p_name=>'[^']*move[^']*tab") {
        $moveTabPages.Add($page.Name)
    }
    if ($source -match 'skipReadonlyCells\s*:\s*true') {
        $skipReadonlyPages.Add($page.Name)
    }
}

[pscustomobject]@{
    InteractiveGridSavePages = $igPages.Count
    LegacyMoveTabPages       = $moveTabPages.Count
    SkipReadonlyPages        = $skipReadonlyPages.Count
}

'Legacy move-tab pages:'
$moveTabPages
