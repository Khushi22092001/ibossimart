$ErrorActionPreference='Stop'
$taskRoot=$PSScriptRoot
$repoRoot=Split-Path (Split-Path $taskRoot -Parent) -Parent
$pagePath=Join-Path $repoRoot 'f100_page_69.sql'
$page=[IO.File]::ReadAllText($pagePath)
$backup=Join-Path $taskRoot 'material-in-page-before-style.sql'
if(!(Test-Path -LiteralPath $backup)){[IO.File]::WriteAllText($backup,$page,[Text.UTF8Encoding]::new($false))}
$page=$page.Replace(",p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'",",p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2('#APP_FILES#myfunctions#MIN#.js','#APP_FILES#hspl-material-in.js?cb=20260902e'))")
$page=$page.Replace(",p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'",",p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2('#APP_FILES#mycss/MyIR (2)#MIN#.css','#APP_FILES#hspl-purchase-order.css?cb=20260901a','#APP_FILES#hspl-material-in.css?cb=20260902e'))")
if(!$page.Contains('hspl-material-in.css') -or !$page.Contains('hspl-material-in.js')){throw 'Material In asset URL injection failed'}
$out=[Text.StringBuilder]::new()
[void]$out.AppendLine("set define off verify off feedback off`nwhenever sqlerror exit sql.sqlcode rollback`nbegin`nwwv_flow_imp.import_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>1516696681383506,p_default_application_id=>100,p_default_id_offset=>0,p_default_owner=>'SAGARDASHBOARD');`nwwv_flow_imp.g_mode := 'REPLACE';")
$assets=@(
 @{Id='850000000000000022';Name='hspl-material-in.css';Mime='text/css';Path=(Join-Path $taskRoot 'material-in.css')},
 @{Id='850000000000000023';Name='hspl-material-in.js';Mime='application/javascript';Path=(Join-Path $taskRoot 'material-in.js')}
)
foreach($asset in $assets){$hex=[Convert]::ToHexString([IO.File]::ReadAllBytes($asset.Path));[void]$out.AppendLine('wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;');for($i=0;$i -lt $hex.Length;$i+=3000){$chunk=$hex.Substring($i,[Math]::Min(3000,$hex.Length-$i));[void]$out.AppendLine("wwv_flow_imp.g_varchar2_table($([int]($i/3000)+1)) := '$chunk';")};[void]$out.AppendLine("wwv_flow_imp_shared.create_app_static_file(p_id=>$($asset.Id),p_file_name=>'$($asset.Name)',p_mime_type=>'$($asset.Mime)',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));")}
[void]$out.AppendLine("wwv_flow_imp.import_end(p_auto_install_sup_obj=>false);`ncommit;`nend;`n/`n")
[void]$out.Append($page)
[IO.File]::WriteAllText((Join-Path $taskRoot 'deploy-material-in.sql'),$out.ToString(),[Text.UTF8Encoding]::new($false))
Write-Output 'Built deploy-material-in.sql; Page 69 backup preserved.'
