param(
  [string]$Source = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\apexlang\shared-components\static-files\hspl-form-action-first-paint.css",
  [string]$Output = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\deploy_form_action_first_paint.sql",
  [string]$ComponentOutput = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\shared_components\files\hspl_form_action_first_paint_css.sql",
  [string]$ComponentOutput1 = "C:\Users\shree\Documents\git projects\ibosssagar\app105-source\business-insights-live-export\f105\application\shared_components\files\hspl_form_action_first_paint_css_1.sql"
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
[void]$sql.AppendLine('  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(7711000000001122),p_file_name=>''hspl-form-action-first-paint.css'',p_mime_type=>''text/css'',p_file_charset=>''utf-8'',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));')
[void]$sql.AppendLine('  wwv_flow_imp.component_end;')
[void]$sql.AppendLine('  commit;')
[void]$sql.AppendLine('end;')
[void]$sql.AppendLine('/')
[void]$sql.AppendLine('declare')
[void]$sql.AppendLine('  l_css varchar2(32767);')
[void]$sql.AppendLine('  l_url constant varchar2(200) := ''#APP_FILES#hspl-form-action-first-paint.css?cb=20260925c'';')
[void]$sql.AppendLine('  l_old_url constant varchar2(200) := ''#APP_FILES#hspl-form-action-first-paint.css?cb=20260925b'';')
[void]$sql.AppendLine('begin')
[void]$sql.AppendLine('  select css_file_urls into l_css from apex_260100.wwv_flows where id = 105 for update;')
[void]$sql.AppendLine('  l_css := replace(l_css, l_old_url || chr(10), '''');')
[void]$sql.AppendLine('  l_css := replace(l_css, chr(10) || l_old_url, '''');')
[void]$sql.AppendLine('  l_css := replace(l_css, l_old_url, '''');')
[void]$sql.AppendLine('  l_css := replace(l_css, l_url || chr(10), '''');')
[void]$sql.AppendLine('  l_css := replace(l_css, chr(10) || l_url, '''');')
[void]$sql.AppendLine('  l_css := replace(l_css, l_url, '''');')
[void]$sql.AppendLine('  update apex_260100.wwv_flows set css_file_urls = l_url || chr(10) || ltrim(l_css, chr(10)) where id = 105;')
[void]$sql.AppendLine('  commit;')
[void]$sql.AppendLine('end;')
[void]$sql.AppendLine('/')
[void]$sql.AppendLine('exit')
[IO.File]::WriteAllText($Output, $sql.ToString(), [Text.UTF8Encoding]::new($false))

$component = [Text.StringBuilder]::new()
[void]$component.AppendLine('prompt --application/shared_components/files/hspl_form_action_first_paint_css')
[void]$component.AppendLine('begin')
[void]$component.AppendLine('  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>''2026.03.30'',p_release=>''26.1.2'',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>''IMART'');')
[void]$component.AppendLine('  wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
$index = 1
for ($offset = 0; $offset -lt $hex.Length; $offset += 4000) {
  $part = $hex.Substring($offset, [Math]::Min(4000, $hex.Length - $offset))
  [void]$component.AppendLine("  wwv_flow_imp.g_varchar2_table($index) := '$part';")
  $index++
}
[void]$component.AppendLine('  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(7711000000001122),p_file_name=>''hspl-form-action-first-paint.css'',p_mime_type=>''text/css'',p_file_charset=>''utf-8'',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));')
[void]$component.AppendLine('  wwv_flow_imp.component_end;')
[void]$component.AppendLine('end;')
[void]$component.AppendLine('/')
[IO.File]::WriteAllText($ComponentOutput, $component.ToString(), [Text.UTF8Encoding]::new($false))
[IO.File]::WriteAllText($ComponentOutput1, $component.ToString(), [Text.UTF8Encoding]::new($false))
Write-Host "Generated $Output and component exports"
