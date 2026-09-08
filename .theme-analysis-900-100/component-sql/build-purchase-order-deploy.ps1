$ErrorActionPreference='Stop'
$taskRoot=$PSScriptRoot
$repoRoot=Split-Path (Split-Path $taskRoot -Parent) -Parent
$pagePath=Join-Path $repoRoot 'f100_page_118.sql'
$page=[IO.File]::ReadAllText($pagePath)
$backup=Join-Path $taskRoot 'purchase-order-page-before-style.sql'
if(!(Test-Path -LiteralPath $backup)){[IO.File]::WriteAllText($backup,$page,[Text.UTF8Encoding]::new($false))}
$page=$page.Replace(",p_javascript_file_urls=>'#APP_FILES#myfunctions#MIN#.js'",",p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2('#APP_FILES#myfunctions#MIN#.js','#APP_FILES#hspl-purchase-order.js?cb=20260901a'))")
$page=$page.Replace(",p_css_file_urls=>'#APP_FILES#mycss/MyIR (2)#MIN#.css'",",p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2('#APP_FILES#mycss/MyIR (2)#MIN#.css','#APP_FILES#hspl-purchase-order.css?cb=20260901a'))")
if(!$page.Contains('hspl-purchase-order.css') -or !$page.Contains('hspl-purchase-order.js')){throw 'Page asset URL injection failed'}
# This app was migrated from a database where PURCHASEORDER had MAILID/MAILSTATUS.
# The current schema does not expose those columns, so keep the unsupported mail feature inert.
$page=[regex]::Replace($page,"(,p_button_name=>'SendE-MailToParty'[\s\S]*?,p_icon_css_classes=>'fa-envelope-arrow-up')","`$1`n,p_button_condition_type=>'NEVER'",1)
$page=[regex]::Replace($page,"(,p_process_name=>'Fetch the Email Status'[\s\S]*?,p_process_clob_language=>'PLSQL')([\s\S]*?,p_internal_uid=>44171897065991212)","`$1`n,p_process_when_type=>'NEVER'`$2",1)
$page=[regex]::Replace($page,"(,p_process_name=>'Send Email via Procedure execution'[\s\S]*?,p_process_when_button_id=>wwv_flow_imp.id\(156525464403105552\))([\s\S]*?,p_internal_uid=>35670010450321630)","`$1`n,p_process_when_type=>'NEVER'`$2",1)
if(([regex]::Matches($page,"p_process_name=>'Fetch the Email Status'[\s\S]{0,1800}?p_process_when_type=>'NEVER'")).Count -ne 1){throw 'Mail status process was not disabled'}
if(([regex]::Matches($page,"p_process_name=>'Send Email via Procedure execution'[\s\S]{0,1800}?p_process_when_type=>'NEVER'")).Count -ne 1){throw 'Mail send process was not disabled'}
$out=[Text.StringBuilder]::new()
[void]$out.AppendLine("set define off verify off feedback off`nwhenever sqlerror exit sql.sqlcode rollback`nbegin`nwwv_flow_imp.import_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>1516696681383506,p_default_application_id=>100,p_default_id_offset=>0,p_default_owner=>'SAGARDASHBOARD');`nwwv_flow_imp.g_mode := 'REPLACE';")
$assets=@(
 @{Id='850000000000000020';Name='hspl-purchase-order.css';Mime='text/css';Path=(Join-Path $taskRoot 'purchase-order.css')},
 @{Id='850000000000000021';Name='hspl-purchase-order.js';Mime='application/javascript';Path=(Join-Path $taskRoot 'purchase-order.js')}
)
foreach($asset in $assets){
 $hex=[Convert]::ToHexString([IO.File]::ReadAllBytes($asset.Path))
 [void]$out.AppendLine('wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
 for($i=0;$i -lt $hex.Length;$i+=3000){$chunk=$hex.Substring($i,[Math]::Min(3000,$hex.Length-$i));[void]$out.AppendLine("wwv_flow_imp.g_varchar2_table($([int]($i/3000)+1)) := '$chunk';")}
 [void]$out.AppendLine("wwv_flow_imp_shared.create_app_static_file(p_id=>$($asset.Id),p_file_name=>'$($asset.Name)',p_mime_type=>'$($asset.Mime)',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));")
}
[void]$out.AppendLine("wwv_flow_imp.import_end(p_auto_install_sup_obj=>false);`ncommit;`nend;`n/`n")
[void]$out.Append($page)
[IO.File]::WriteAllText((Join-Path $taskRoot 'deploy-purchase-order.sql'),$out.ToString(),[Text.UTF8Encoding]::new($false))
Write-Output 'Built deploy-purchase-order.sql; Page 118 backup preserved.'
