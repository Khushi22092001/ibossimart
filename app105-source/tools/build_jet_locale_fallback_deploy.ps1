param(
  [string] $JsPath = (Join-Path $PSScriptRoot '..\hspl-jet-l10n-fallback.js'),
  [string] $OutputPath = (Join-Path $PSScriptRoot '..\deploy_jet_locale_fallback.sql')
)

$bytes = [IO.File]::ReadAllBytes((Resolve-Path $JsPath))
$hex = [Convert]::ToHexString($bytes)
$lines = [Collections.Generic.List[string]]::new()
$lines.Add('whenever sqlerror exit failure rollback')
$lines.Add('set define off')
$lines.Add('connect -name IMART')
$lines.Add('begin')
$lines.Add("wwv_flow_imp.component_begin (p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');")
$lines.Add('wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
$index = 1
for ($offset = 0; $offset -lt $hex.Length; $offset += 200) {
  $length = [Math]::Min(200, $hex.Length - $offset)
  $lines.Add("wwv_flow_imp.g_varchar2_table($index) := '$($hex.Substring($offset, $length))';")
  $index++
}
$lines.Add("wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(202609240001),p_file_name=>'hspl-jet-l10n-fallback.js',p_mime_type=>'application/javascript',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));")
$lines.Add('wwv_flow_imp.component_end;')
$lines.Add('end;')
$lines.Add('/')
$lines.Add('commit;')
$lines.Add('exit')
$destination = if ([IO.Path]::IsPathRooted($OutputPath)) { $OutputPath } else { Join-Path (Get-Location) $OutputPath }
[IO.File]::WriteAllLines($destination, $lines, [Text.UTF8Encoding]::new($false))
