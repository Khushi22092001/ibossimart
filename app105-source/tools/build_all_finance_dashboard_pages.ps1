$sourceRoot = Join-Path $PSScriptRoot '..\mkspl-compiled-sql\f99910\application\pages'
$targetRoot = Join-Path $PSScriptRoot '..\business-insights-live-export\f105\application\pages'
$converter = Join-Path $PSScriptRoot 'convert_compiled_mkspl_page.ps1'

$map = @{
  675=902; 704=903; 705=904; 706=905; 707=906
  690=907; 691=908; 692=909; 693=910; 694=911; 695=912; 696=913; 697=914; 698=915; 699=916; 700=917; 701=918; 702=919
  708=920; 709=921; 710=922; 711=923; 712=924; 713=925; 714=926; 715=927; 716=928; 717=929; 718=930; 719=931; 720=932; 721=933
}

# Page 902 is the already-verified HSPL Trial Balance implementation and page
# 904 is the already-adapted P&L Summary; do not overwrite either one.
$skip = @(675,705)
foreach ($sourcePage in ($map.Keys | Sort-Object)) {
  if ($skip -contains $sourcePage) { continue }
  $targetPage = $map[$sourcePage]
  $input = Join-Path $sourceRoot ("page_{0:D5}.sql" -f $sourcePage)
  $output = Join-Path $targetRoot ("page_{0:D5}.sql" -f $targetPage)
  & $converter -InputSql $input -OutputPath $output -SourcePage $sourcePage -TargetPage $targetPage -LinkedPages $map
}
