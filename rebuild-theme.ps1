param(
    [string]$ThemeSource,
    [string]$DeployOutput,
    [long]$ApplicationId = 105,
    [long]$StaticFileId = 7709770991328827
)
$ErrorActionPreference = 'Stop'
$root = $PSScriptRoot
$source = if ($ThemeSource) { $ThemeSource } else { Join-Path $root 'app105-source/apexlang-live-20260914/infomartics123125126125126101100/shared-components/static-files/hspl-theme.css' }
$template = Join-Path $root 'app105-source/export/f105/application/shared_components/files/hspl_theme_css.sql'
$output = if ($DeployOutput) { $DeployOutput } else { Join-Path $root 'app105-source/deploy_hspl_theme_css.sql' }
$hex = [Convert]::ToHexString([IO.File]::ReadAllBytes($source))
$sql = [IO.File]::ReadAllText($template)
$start = $sql.IndexOf('wwv_flow_imp.g_varchar2_table :=')
$end = $sql.IndexOf('wwv_flow_imp_shared.create_app_static_file(', $start)
if ($start -lt 0 -or $end -lt 0) { throw 'Missing component markers' }
$builder = [Text.StringBuilder]::new()
[void]$builder.Append("whenever sqlerror exit failure rollback`nset define off`nconnect -name IMART`n")
[void]$builder.Append($sql.Substring(0, $start))
[void]$builder.Append("wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;`n")
$index = 1
for ($offset = 0; $offset -lt $hex.Length; $offset += 200) {
    $chunk = $hex.Substring($offset, [Math]::Min(200, $hex.Length - $offset))
    [void]$builder.Append("wwv_flow_imp.g_varchar2_table($index) := '$chunk';`n")
    $index++
}
[void]$builder.Append($sql.Substring($end))
[void]$builder.Append("`ncommit;`nexit`n")
$payload = $builder.ToString().Replace('p_default_application_id=>105', "p_default_application_id=>$ApplicationId").Replace('p_default_id_offset=>7541489808702750', 'p_default_id_offset=>0').Replace('p_id=>wwv_flow_imp.id(7709770991328827)', "p_id=>wwv_flow_imp.id($StaticFileId)")
[IO.File]::WriteAllText($output, $payload, [Text.UTF8Encoding]::new($false))
$matches = [regex]::Matches([IO.File]::ReadAllText($output), "g_varchar2_table\(\d+\) := '([A-F0-9]+)';")
$roundtrip = [Text.Encoding]::UTF8.GetString([Convert]::FromHexString(($matches | ForEach-Object { $_.Groups[1].Value }) -join ''))
if ($roundtrip -cne [IO.File]::ReadAllText($source)) { throw 'Payload verification failed' }
Write-Output "Verified generated payload: $($matches.Count) chunks, $($roundtrip.Length) CSS characters."
