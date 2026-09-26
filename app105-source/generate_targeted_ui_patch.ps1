param(
  [string]$SourceRoot = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\apexlang-live-20260914\infomartics123125126125126101100",
  [string]$Output = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_targeted_ui_patch.sql"
)

$ErrorActionPreference = 'Stop'

function Write-StaticFileSql {
  param(
    [System.Text.StringBuilder]$Sql,
    [string]$Path,
    [string]$Name,
    [string]$Mime,
    [Int64]$Id
  )

  $bytes = [IO.File]::ReadAllBytes($Path)
  $hex = [Convert]::ToHexString($bytes)
  [void]$Sql.AppendLine('wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
  $index = 1
  for ($offset = 0; $offset -lt $hex.Length; $offset += 4000) {
    $length = [Math]::Min(4000, $hex.Length - $offset)
    $part = $hex.Substring($offset, $length)
    [void]$Sql.AppendLine("wwv_flow_imp.g_varchar2_table($index) := '$part';")
    $index++
  }
  [void]$Sql.AppendLine('wwv_flow_imp_shared.create_app_static_file(')
  [void]$Sql.AppendLine(" p_id=>wwv_flow_imp.id($Id)")
  [void]$Sql.AppendLine(",p_file_name=>'$Name'")
  [void]$Sql.AppendLine(",p_mime_type=>'$Mime'")
  [void]$Sql.AppendLine(",p_file_charset=>'utf-8'")
  [void]$Sql.AppendLine(',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)')
  [void]$Sql.AppendLine(');')
}

$jsPath = Join-Path $SourceRoot 'shared-components\static-files\hspl-theme.js'
$cssPath = Join-Path $SourceRoot 'shared-components\static-files\hspl-theme.css'
$sql = [Text.StringBuilder]::new()

[void]$sql.AppendLine('whenever sqlerror exit failure rollback')
[void]$sql.AppendLine('set define off')
[void]$sql.AppendLine('prompt -- Targeted APEXlang-derived UI safety patch; no pages, regions, processes, or Builder edits are imported.')
[void]$sql.AppendLine('begin')
[void]$sql.AppendLine('  apex_util.set_security_group_id(4744311978888504);')
[void]$sql.AppendLine('  wwv_flow_imp.component_begin(')
[void]$sql.AppendLine("    p_version_yyyy_mm_dd=>'2026.03.30',")
[void]$sql.AppendLine("    p_release=>'26.1.2',")
[void]$sql.AppendLine('    p_default_workspace_id=>4744311978888504,')
[void]$sql.AppendLine('    p_default_application_id=>105,')
[void]$sql.AppendLine('    p_default_id_offset=>7541489808702750,')
[void]$sql.AppendLine("    p_default_owner=>'IMART'")
[void]$sql.AppendLine('  );')
Write-StaticFileSql -Sql $sql -Path $jsPath -Name 'hspl-ui-safety-20260914.js' -Mime 'application/javascript' -Id 7711000000001110
Write-StaticFileSql -Sql $sql -Path $cssPath -Name 'hspl-ui-safety-20260914.css' -Mime 'text/css' -Id 7711000000001111
[void]$sql.AppendLine('  wwv_flow_imp.component_end;')
[void]$sql.AppendLine('  commit;')
[void]$sql.AppendLine('end;')
[void]$sql.AppendLine('/')
[void]$sql.AppendLine('')
[void]$sql.AppendLine('declare')
[void]$sql.AppendLine('  l_css varchar2(32767);')
[void]$sql.AppendLine('  l_js varchar2(32767);')
[void]$sql.AppendLine('begin')
[void]$sql.AppendLine('  select css_file_urls, javascript_file_urls into l_css, l_js from apex_260100.wwv_flows where id = 105 for update;')
[void]$sql.AppendLine("  l_css := regexp_replace(l_css, '([[:space:]]*#APP_FILES#hspl-ui-safety-20260914\\.css[^[:space:]]*)', '');")
[void]$sql.AppendLine("  l_js := regexp_replace(l_js, '([[:space:]]*#APP_FILES#hspl-ui-safety-20260914\\.js[^[:space:]]*)', '');")
[void]$sql.AppendLine("  update apex_260100.wwv_flows set css_file_urls = rtrim(l_css) || chr(10) || '#APP_FILES#hspl-ui-safety-20260914.css?cb=20260914f', javascript_file_urls = rtrim(l_js) || chr(10) || '#APP_FILES#hspl-ui-safety-20260914.js?cb=20260914f' where id = 105;")
[void]$sql.AppendLine('  commit;')
[void]$sql.AppendLine('end;')
[void]$sql.AppendLine('/')
[void]$sql.AppendLine('exit')

[IO.File]::WriteAllText($Output, $sql.ToString(), [Text.UTF8Encoding]::new($false))
Write-Host "Generated $Output"
