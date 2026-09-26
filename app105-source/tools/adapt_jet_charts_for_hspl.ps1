param(
  [Parameter(Mandatory = $true)] [string[]] $Paths,
  [switch] $Revert
)

foreach ($path in $Paths) {
  $resolved = Resolve-Path $path
  $text = [IO.File]::ReadAllText($resolved)
  $chartRegions = [regex]::Matches(
    $text,
    "(?ms)wwv_flow_imp_page\.create_page_plug\(\r?\n(?:(?!wwv_flow_imp_page\.create_page_plug\().)*?,p_plug_source=>(?<source>.*?)(?=\r?\n,p_plug_source_type=>'NATIVE_JET_CHART')(?:(?!wwv_flow_imp_page\.create_page_plug\().)*?\r?\n\);"
  )

  for ($i = $chartRegions.Count - 1; $i -ge 0; $i--) {
    $region = $chartRegions[$i]
    $source = $region.Groups['source'].Value
    $tailStart = $region.Index + $region.Length
    $nextPlug = $text.IndexOf('wwv_flow_imp_page.create_page_plug(', $tailStart)
    if ($nextPlug -lt 0) { $nextPlug = $text.Length }
    $tail = $text.Substring($tailStart, $nextPlug - $tailStart)

    if ($Revert) {
      $tail = $tail.Replace(
        ",p_data_source_type=>'SQL'`r`n,p_data_source=>${source}",
        ",p_location=>'REGION_SOURCE'"
      )
      $tail = $tail.Replace(
        ",p_data_source_type=>'SQL'`n,p_data_source=>${source}",
        ",p_location=>'REGION_SOURCE'"
      )
    } else {
      $tail = [regex]::Replace(
        $tail,
        "(?m)^,p_location=>'REGION_SOURCE'\r?$",
        ",p_data_source_type=>'SQL'`r`n,p_data_source=>${source}"
      )
    }

    $text = $text.Substring(0, $tailStart) + $tail + $text.Substring($nextPlug)
  }

  [IO.File]::WriteAllText($resolved, $text, [Text.UTF8Encoding]::new($false))
}
