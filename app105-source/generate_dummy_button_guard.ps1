param(
  [string]$Source = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\apexlang-live-20260914\infomartics123125126125126101100\shared-components\static-files\hspl-dummy-button-guard.js",
  [string]$Output = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_dummy_button_guard.sql"
)

$ErrorActionPreference = 'Stop'
$hex = [Convert]::ToHexString([IO.File]::ReadAllBytes($Source))
$sql = [Text.StringBuilder]::new()
[void]$sql.AppendLine('whenever sqlerror exit failure rollback')
[void]$sql.AppendLine('set define off')
[void]$sql.AppendLine('connect -name IMART')
[void]$sql.AppendLine('prompt -- Deploy the APEXlang dummy-button guard only.')
[void]$sql.AppendLine('begin')
[void]$sql.AppendLine('  apex_util.set_security_group_id(4744311978888504);')
[void]$sql.AppendLine('  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>''2026.03.30'',p_release=>''26.1.2'',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>''IMART'');')
[void]$sql.AppendLine('  wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
$i = 1
for ($offset = 0; $offset -lt $hex.Length; $offset += 4000) {
  $part = $hex.Substring($offset, [Math]::Min(4000, $hex.Length - $offset))
  [void]$sql.AppendLine("  wwv_flow_imp.g_varchar2_table($i) := '$part';")
  $i++
}
[void]$sql.AppendLine('  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(7711000000001120),p_file_name=>''hspl-dummy-button-guard.js'',p_mime_type=>''application/javascript'',p_file_charset=>''utf-8'',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));')
[void]$sql.AppendLine('  wwv_flow_imp.component_end;')
[void]$sql.AppendLine('  commit;')
[void]$sql.AppendLine('end;')
[void]$sql.AppendLine('/')
[void]$sql.AppendLine('declare l_js varchar2(32767); begin')
[void]$sql.AppendLine('  select javascript_file_urls into l_js from apex_260100.wwv_flows where id=105 for update;')
[void]$sql.AppendLine('  l_js := regexp_replace(l_js, chr(10)||''#APP_FILES#hspl-dummy-button-guard.js[?]cb=[^[:space:]]+'', '''');')
[void]$sql.AppendLine('  update apex_260100.wwv_flows set javascript_file_urls=rtrim(l_js)||chr(10)||''#APP_FILES#hspl-dummy-button-guard.js?cb=20260915d'', files_version=files_version+1 where id=105;')
[void]$sql.AppendLine('  commit; end;')
[void]$sql.AppendLine('/')
[void]$sql.AppendLine('exit')
[IO.File]::WriteAllText($Output, $sql.ToString(), [Text.UTF8Encoding]::new($false))
Write-Host "Generated $Output"
