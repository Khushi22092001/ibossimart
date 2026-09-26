param(
  [string]$Source = 'C:\Users\shree\Documents\git projects\ibosssagar\app105-source\hspl-nav-paint.js',
  [string]$Output = 'C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_hspl_nav_paint.sql'
)

$ErrorActionPreference = 'Stop'
$hex = ([BitConverter]::ToString([IO.File]::ReadAllBytes($Source))).Replace('-', '')
$sql = [Text.StringBuilder]::new()
[void]$sql.AppendLine('whenever sqlerror exit failure rollback')
[void]$sql.AppendLine('set define off')
[void]$sql.AppendLine('connect -name IMART')
[void]$sql.AppendLine('begin')
[void]$sql.AppendLine('  apex_util.set_security_group_id(4744311978888504);')
[void]$sql.AppendLine('  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>''2026.03.30'',p_release=>''26.1.2'',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>''IMART'');')
[void]$sql.AppendLine('  wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
$index = 1
for ($offset = 0; $offset -lt $hex.Length; $offset += 4000) {
  $part = $hex.Substring($offset, [Math]::Min(4000, $hex.Length - $offset))
  [void]$sql.AppendLine("  wwv_flow_imp.g_varchar2_table($index) := '$part';")
  $index++
}
[void]$sql.AppendLine('  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(7711000000000005),p_file_name=>''hspl-nav-paint.js'',p_mime_type=>''application/javascript'',p_file_charset=>''utf-8'',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));')
[void]$sql.AppendLine('  wwv_flow_imp.component_end;')
[void]$sql.AppendLine('  commit;')
[void]$sql.AppendLine('end;')
[void]$sql.AppendLine('/')
[void]$sql.AppendLine('exit')
[IO.File]::WriteAllText($Output, $sql.ToString(), [Text.UTF8Encoding]::new($false))
Write-Host "Generated $Output"
