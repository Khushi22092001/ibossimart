param(
    [Parameter(Mandatory = $true)] [string]$JavaScriptPath,
    [Parameter(Mandatory = $true)] [string]$FileName,
    [Parameter(Mandatory = $true)] [Int64]$ComponentId,
    [Parameter(Mandatory = $true)] [string]$OutputSql,
    [string]$MimeType = 'application/javascript',
    [Int64]$IdOffset = 7541489808702750
)

$bytes = [IO.File]::ReadAllBytes((Resolve-Path -LiteralPath $JavaScriptPath))
$hex = [Convert]::ToHexString($bytes)
$chunks = for ($i = 0; $i -lt $hex.Length; $i += 200) {
    $len = [Math]::Min(200, $hex.Length - $i)
    $hex.Substring($i, $len)
}

$lines = [Collections.Generic.List[string]]::new()
$lines.Add('whenever sqlerror exit sql.sqlcode rollback')
$lines.Add('set define off verify off feedback off')
$lines.Add('connect -name IMART')
$lines.Add('begin')
$lines.Add('  apex_util.set_security_group_id(4744311978888504);')
$lines.Add("  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>$IdOffset,p_default_owner=>'IMART');")
$lines.Add('  wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
for ($i = 0; $i -lt $chunks.Count; $i++) {
    $lines.Add("  wwv_flow_imp.g_varchar2_table($($i + 1)) := '$($chunks[$i])';")
}
$lines.Add("  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id($ComponentId),p_file_name=>'$FileName',p_mime_type=>'$MimeType',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));")
$lines.Add('  wwv_flow_imp.component_end;')
$lines.Add('end;')
$lines.Add('/')
$lines.Add('commit;')
$lines.Add("prompt STATIC_FILE_$($FileName.Replace('.','_'))_DEPLOYED")
[IO.File]::WriteAllLines($OutputSql, $lines, (New-Object Text.UTF8Encoding($false)))
Write-Host "Built $OutputSql ($($bytes.Length) bytes)"
