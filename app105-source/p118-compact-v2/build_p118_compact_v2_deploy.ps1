$ErrorActionPreference = 'Stop'

$root = Split-Path -Parent $MyInvocation.MyCommand.Path
$output = Join-Path $root 'deploy_p118_compact_v2.sql'
$assets = @(
  @{ Path = (Join-Path $root 'hspl-p118-compact-v2.js');  Id = 7710031180000001L; Mime = 'application/javascript' },
  @{ Path = (Join-Path $root 'hspl-p118-compact-v2.css'); Id = 7710031180000002L; Mime = 'text/css' }
)

function Add-StaticFileSql {
  param(
    [Text.StringBuilder]$Builder,
    [string]$Path,
    [long]$Id,
    [string]$Mime
  )

  $bytes = [IO.File]::ReadAllBytes($Path)
  $hex = [Convert]::ToHexString($bytes)
  $name = [IO.Path]::GetFileName($Path)
  [void]$Builder.Append("  wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;`n")
  $index = 1
  for ($offset = 0; $offset -lt $hex.Length; $offset += 200) {
    $chunk = $hex.Substring($offset, [Math]::Min(200, $hex.Length - $offset))
    [void]$Builder.Append("  wwv_flow_imp.g_varchar2_table($index) := '$chunk';`n")
    $index++
  }
  [void]$Builder.Append("  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id($Id),p_file_name=>'$name',p_mime_type=>'$Mime',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));`n")
}

$sql = [Text.StringBuilder]::new()
[void]$sql.Append("whenever sqlerror exit sql.sqlcode rollback`nset define off verify off feedback on serveroutput on`nconnect -name IMART`n")
[void]$sql.Append("declare`n  l_page_count number;`nbegin`n  apex_util.set_security_group_id(4744311978888504);`n  delete from apex_260100.wwv_flow_static_files where flow_id=105 and security_group_id=4744311978888504 and file_name in ('hspl-p118-compact-v2.js','hspl-p118-compact-v2.css');`n  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');`n")

foreach ($asset in $assets) {
  Add-StaticFileSql -Builder $sql -Path $asset.Path -Id $asset.Id -Mime $asset.Mime
}

[void]$sql.Append(@"
  update apex_260100.wwv_flow_steps
     set css_file_urls = case
           when instr(nvl(css_file_urls, ' '), '#APP_FILES#hspl-p118-compact-v2.css') = 0
             then rtrim(css_file_urls) || chr(10) || '#APP_FILES#hspl-p118-compact-v2.css?version=#APP_VERSION#&cb=20261003v27'
           else regexp_replace(css_file_urls, '#APP_FILES#hspl-p118-compact-v2[.]css[^[:space:]]*', '#APP_FILES#hspl-p118-compact-v2.css?version=#APP_VERSION#&cb=20261003v27')
         end,
         javascript_file_urls = case
           when instr(nvl(javascript_file_urls, ' '), '#APP_FILES#hspl-p118-compact-v2.js') = 0
             then rtrim(javascript_file_urls) || chr(10) || '#APP_FILES#hspl-p118-compact-v2.js?version=#APP_VERSION#&cb=20261003v27'
           else regexp_replace(javascript_file_urls, '#APP_FILES#hspl-p118-compact-v2[.]js[^[:space:]]*', '#APP_FILES#hspl-p118-compact-v2.js?version=#APP_VERSION#&cb=20261003v27')
         end,
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where flow_id = 105
     and id = 118
     and security_group_id = 4744311978888504;
  l_page_count := sql%rowcount;
  if l_page_count <> 1 then
    raise_application_error(-20001, 'Expected exactly one Page 118 asset URL update; got ' || l_page_count);
  end if;

  update apex_260100.wwv_flows
     set files_version = files_version + 1,
         version_scn = dbms_flashback.get_system_change_number,
         last_updated_on = sysdate,
         last_updated_by = 'CODEX'
   where id = 105
     and security_group_id = 4744311978888504;
  if sql%rowcount <> 1 then
    raise_application_error(-20002, 'Application 105 cache version was not updated');
  end if;

  wwv_flow_imp_shared.clear_cache;
  wwv_flow_imp.component_end;
  commit;
end;
/

set pagesize 100 linesize 32767 long 100000 longchunksize 100000
select file_name, mime_type, dbms_lob.getlength(file_content) bytes
  from apex_260100.wwv_flow_static_files
 where flow_id = 105
   and security_group_id = 4744311978888504
   and file_name in ('hspl-p118-compact-v2.js','hspl-p118-compact-v2.css')
 order by file_name;

select css_file_urls, javascript_file_urls
  from apex_260100.wwv_flow_steps
 where flow_id = 105
   and id = 118
   and security_group_id = 4744311978888504;

prompt P118_COMPACT_LAYOUT_V2_DEPLOYED
exit
"@)

[IO.File]::WriteAllText($output, $sql.ToString(), [Text.UTF8Encoding]::new($false))

foreach ($asset in $assets) {
  $sourceText = [Text.Encoding]::UTF8.GetString([IO.File]::ReadAllBytes($asset.Path))
  $generated = [IO.File]::ReadAllText($output)
  $fileIndex = $generated.IndexOf("p_file_name=>'" + [IO.Path]::GetFileName($asset.Path) + "'")
  if ($fileIndex -lt 0 -or [string]::IsNullOrWhiteSpace($sourceText)) {
    throw "Generated SQL verification failed for $($asset.Path)."
  }
}

Write-Output "Created $output"
