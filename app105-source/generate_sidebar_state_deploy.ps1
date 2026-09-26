param(
  [string]$JavaScript = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-sidebar-state.js",
  [string]$Css = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-sidebar-state.css",
  [string]$Deploy = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_sidebar_state_v1.sql"
)

$ErrorActionPreference = 'Stop'
$sql = [IO.File]::ReadAllText($Deploy)
$js = [IO.File]::ReadAllText($JavaScript).TrimEnd()
$css = [IO.File]::ReadAllText($Css).TrimEnd()
if ($js.Contains("~'") -or $css.Contains("~'")) {
  throw "The deployment q-quote delimiter occurs in an asset."
}
$sql = [regex]::Replace($sql, "(?s)(l_js constant clob := q'~).*?(~';\s+l_css constant clob := q'~)", { param($m) $m.Groups[1].Value + $js + $m.Groups[2].Value }, 1)
$sql = [regex]::Replace($sql, "(?s)(l_css constant clob := q'~).*?(~';\s+l_blob blob;)", { param($m) $m.Groups[1].Value + $css + $m.Groups[2].Value }, 1)
$sql = $sql.Replace('20260924sbstate17', '20260924sbstate38').Replace('20260924sbstate18', '20260924sbstate38').Replace('20260924sbstate19', '20260924sbstate38').Replace('20260924sbstate20', '20260924sbstate38').Replace('20260924sbstate21', '20260924sbstate38').Replace('20260924sbstate22', '20260924sbstate38').Replace('20260924sbstate23', '20260924sbstate38').Replace('20260924sbstate24', '20260924sbstate38').Replace('20260924sbstate25', '20260924sbstate38').Replace('20260924sbstate26', '20260924sbstate38').Replace('20260924sbstate27', '20260924sbstate38').Replace('20260924sbstate28', '20260924sbstate38').Replace('20260924sbstate29', '20260924sbstate38').Replace('20260924sbstate30', '20260924sbstate38').Replace('20260924sbstate31', '20260924sbstate38').Replace('20260924sbstate32', '20260924sbstate38').Replace('20260924sbstate33', '20260924sbstate38').Replace('20260924sbstate34', '20260924sbstate38').Replace('20260924sbstate35', '20260924sbstate38').Replace('20260924sbstate36', '20260924sbstate38').Replace('20260924sbstate37', '20260924sbstate38').Replace('20260924sbstate38', '20260924sbstate39').Replace('20260924sbstate39', '20260924sbstate40').Replace('20260924sbstate40', '20260924sbstate41').Replace('20260924sbstate41', '20260924sbstate42').Replace('20260924sbstate42', '20260924sbstate43').Replace('20260924sbstate43', '20260924sbstate44').Replace('20260924sbstate44', '20260924sbstate45').Replace('20260924sbstate45', '20260924sbstate46').Replace('20260924sbstate46', '20260924sbstate47').Replace('20260924sbstate47', '20260925sbstate48').Replace('20260925sbstate48', '20260925sbstate49').Replace('20260925sbstate49', '20260925sbstate50').Replace('20260925sbstate50', '20260925sbstate51')
$sql = $sql.Replace('20260924navstate1', '20260924directory5').Replace('20260924scroll3', '20260924directory5').Replace('20260924scroll4', '20260924directory5').Replace('20260924h2r1', '20260924directory5').Replace('20260924h2r2', '20260924directory5').Replace('20260924processhub1', '20260924directory5').Replace('20260924processhub2', '20260924directory5').Replace('20260924paintgate1', '20260924directory5').Replace('20260924modulehub1', '20260924directory5').Replace('20260924modulehub2', '20260924directory5').Replace('20260924modulehub3', '20260924directory5').Replace('20260924directory1', '20260924directory5').Replace('20260924directory2', '20260924directory5').Replace('20260924directory3', '20260924directory5').Replace('20260924directory4', '20260924directory5')
$themeLine = "  l_js:=regexp_replace(l_js,'#APP_FILES#hspl-theme[.]js[^[:space:]]*','#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260925registernative2');"
if (-not $sql.Contains('20260925registernative2')) {
  $anchor = "  l_js:=regexp_replace(l_js,'([[:space:]]*#APP_FILES#hspl-sidebar-state[.]js[^[:space:]]*)','');"
  $sql = $sql.Replace($anchor, $themeLine + [Environment]::NewLine + $anchor)
}
$sql = $sql.Replace($themeLine + [Environment]::NewLine + $themeLine, $themeLine)
[IO.File]::WriteAllText($Deploy, $sql, [Text.UTF8Encoding]::new($false))
Write-Host "Generated $Deploy"
