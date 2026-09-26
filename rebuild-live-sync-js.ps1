$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$source = Join-Path $root 'app105-source/hspl-live-sync.js'
$template = Join-Path $root 'app105-source/export/f105/application/shared_components/files/hspl_theme_js.sql'
$output = Join-Path $root 'app105-source/deploy_hspl_live_sync_js.sql'
$hex = [Convert]::ToHexString([IO.File]::ReadAllBytes($source))
$sql = [IO.File]::ReadAllText($template)
$start = $sql.IndexOf('wwv_flow_imp.g_varchar2_table :=')
$end = $sql.IndexOf('wwv_flow_imp_shared.create_app_static_file(', $start)
if ($start -lt 0 -or $end -lt 0) { throw 'Missing component markers' }
$builder = [Text.StringBuilder]::new()
[void]$builder.Append("whenever sqlerror exit failure rollback`nset define off`n")
[void]$builder.Append($sql.Substring(0, $start))
[void]$builder.Append("wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;`n")
$index = 1
for ($offset = 0; $offset -lt $hex.Length; $offset += 200) {
    $chunk = $hex.Substring($offset, [Math]::Min(200, $hex.Length - $offset))
    [void]$builder.Append("wwv_flow_imp.g_varchar2_table($index) := '$chunk';`n")
    $index++
}
$tail = $sql.Substring($end).Replace("p_id=>wwv_flow_imp.id(7709977229328829)", "p_id=>wwv_flow_imp.id(989105000018)").Replace("p_file_name=>'hspl-theme.js'", "p_file_name=>'hspl-live-sync.js'")
[void]$builder.Append($tail)
[void]$builder.Append("`ncommit;`nexit`n")
[IO.File]::WriteAllText($output, $builder.ToString(), [Text.UTF8Encoding]::new($false))
Write-Output "Generated $output with $($index - 1) chunks."
