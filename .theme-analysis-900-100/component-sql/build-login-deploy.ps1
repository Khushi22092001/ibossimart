$ErrorActionPreference = 'Stop'
$taskRoot = $PSScriptRoot
$repoRoot = Split-Path (Split-Path $taskRoot -Parent) -Parent
$page = [IO.File]::ReadAllText((Join-Path $repoRoot 'f100_page_9999.sql'))
$backup = Join-Path $taskRoot 'login-page-before-design.sql'
if (!(Test-Path -LiteralPath $backup)) { [IO.File]::WriteAllText($backup,$page) }
$page = [regex]::Replace($page,',p_inline_css=>wwv_flow_string.join\(wwv_flow_t_varchar2\([\s\S]*?\)\)\r?\n,p_step_template',",p_css_file_urls=>'#APP_FILES#hspl-login.css?cb=20260831d'`n,p_javascript_file_urls=>'#APP_FILES#hspl-login.js?cb=20260831a'`n,p_step_template",1)
if (!$page.Contains("p_css_file_urls=>'#APP_FILES#hspl-login.css")) { throw 'Login CSS replacement failed' }
$page = $page.Replace('hspl-login.css?cb=20260831d','hspl-login.css?cb=20260831e')
$out = [Text.StringBuilder]::new()
[void]$out.AppendLine("set define off verify off feedback off`nwhenever sqlerror exit sql.sqlcode rollback`nbegin`nwwv_flow_imp.import_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>1516696681383506,p_default_application_id=>100,p_default_id_offset=>0,p_default_owner=>'SAGARDASHBOARD');`nwwv_flow_imp.g_mode := 'REPLACE';")
$assets = @(
 @{Id='850000000000000010';Name='hspl-login.css';Mime='text/css';Path=(Join-Path $taskRoot 'login-reference.css')},
 @{Id='850000000000000011';Name='hspl-login.js';Mime='application/javascript';Path=(Join-Path $taskRoot 'login-reference.js')},
 @{Id='850000000000000012';Name='hspl-login-factory.png';Mime='image/png';Path=(Join-Path $taskRoot 'login-factory.png')},
 @{Id='850000000000000013';Name='hspl-login-boss.png';Mime='image/png';Path=(Join-Path $repoRoot '.theme-analysis-900-100/app900/dashboard101110900/shared-components/static-files/IBOSS.png')}
)
foreach($asset in $assets){
 $hex = [Convert]::ToHexString([IO.File]::ReadAllBytes($asset.Path))
 [void]$out.AppendLine('wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
 for($i=0;$i -lt $hex.Length;$i+=3000){
  $chunk=$hex.Substring($i,[Math]::Min(3000,$hex.Length-$i))
  [void]$out.AppendLine("wwv_flow_imp.g_varchar2_table($([int]($i/3000)+1)) := '$chunk';")
 }
 [void]$out.AppendLine("wwv_flow_imp_shared.create_app_static_file(p_id=>$($asset.Id),p_file_name=>'$($asset.Name)',p_mime_type=>'$($asset.Mime)',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));")
}
[void]$out.AppendLine("wwv_flow_imp.import_end(p_auto_install_sup_obj=>false);`ncommit;`nend;`n/`n")
[void]$out.Append($page)
[IO.File]::WriteAllText((Join-Path $taskRoot 'deploy-login-reference.sql'),$out.ToString(),[Text.UTF8Encoding]::new($false))
Write-Output 'Built deploy-login-reference.sql; original Page9999 backup preserved.'
