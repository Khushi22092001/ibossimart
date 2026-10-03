param(
  [string]$Source,
  [string]$Output,
  [long]$StaticFileId,
  [ValidateSet('text/css', 'application/javascript')][string]$MimeType
)

$ErrorActionPreference = 'Stop'
if (-not $Source -or -not $Output -or -not $StaticFileId -or -not $MimeType) {
  throw 'Source, Output, StaticFileId and MimeType are required.'
}

$bytes = [IO.File]::ReadAllBytes($Source)
$hex = [Convert]::ToHexString($bytes)
$fileName = [IO.Path]::GetFileName($Source)
$chunks = for ($offset = 0; $offset -lt $hex.Length; $offset += 200) {
  $hex.Substring($offset, [Math]::Min(200, $hex.Length - $offset))
}

$sql = [Text.StringBuilder]::new()
[void]$sql.Append("whenever sqlerror exit sql.sqlcode rollback`nset define off verify off feedback off`nconnect -name IMART`n")
[void]$sql.Append("begin`n  apex_util.set_security_group_id(4744311978888504);`n  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');`n  wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;`n")
for ($index = 0; $index -lt $chunks.Count; $index++) {
  [void]$sql.Append("  wwv_flow_imp.g_varchar2_table($($index + 1)) := '$($chunks[$index])';`n")
}
[void]$sql.Append("  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id($StaticFileId),p_file_name=>'$fileName',p_mime_type=>'$MimeType',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));`n  wwv_flow_imp.component_end;`nend;`n/`ncommit;`nprompt STATIC_FILE_$($fileName -replace '[^A-Za-z0-9]', '_')_DEPLOYED`nexit`n")
[IO.File]::WriteAllText($Output, $sql.ToString(), [Text.UTF8Encoding]::new($false))

$payload = [regex]::Matches([IO.File]::ReadAllText($Output), "g_varchar2_table\(\d+\) := '([A-F0-9]+)';") | ForEach-Object { $_.Groups[1].Value }
if ([Text.Encoding]::UTF8.GetString([Convert]::FromHexString(($payload -join ''))) -cne [Text.Encoding]::UTF8.GetString($bytes)) {
  throw 'Generated SQL payload does not round-trip to the source asset.'
}
Write-Output "Verified $fileName deployment payload ($($chunks.Count) chunks)."
