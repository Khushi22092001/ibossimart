$ErrorActionPreference='Stop'
$taskRoot=$PSScriptRoot
$pagePath=Join-Path $taskRoot 'f100_page_0_1.sql'
$page=[IO.File]::ReadAllText($pagePath)
$page=$page.Replace(",p_javascript_file_urls=>'#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260829a'",",p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2('#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260829a','#APP_FILES#hspl-nav-hierarchy-v22.js'))")
$page=$page.Replace("'#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260829a'))","'#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260829a',`r`n'#APP_FILES#hspl-nav-hierarchy-v22.css'))")
$page=$page.Replace("'<link rel=""stylesheet"" href=""#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260829b"">',","'<link rel=""stylesheet"" href=""#APP_FILES#design-system.css?version=#APP_VERSION#&cb=20260829b"">',`r`n'<link rel=""stylesheet"" href=""#APP_FILES#hspl-nav-hierarchy-v22.css"">',")
$page=$page.Replace("'<script src=""#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260829b""></script>'))","'<script src=""#APP_FILES#hspl-theme.js?version=#APP_VERSION#&cb=20260829b""></script>',`r`n'<script src=""#APP_FILES#hspl-nav-hierarchy-v22.js""></script>'))")
if(!$page.Contains('hspl-nav-hierarchy-v22.css') -or !$page.Contains('hspl-nav-hierarchy-v22.js')){throw 'Navigation asset URL injection failed'}
$out=[Text.StringBuilder]::new()
[void]$out.AppendLine("set define off verify off feedback off`nwhenever sqlerror exit sql.sqlcode rollback`nbegin`nwwv_flow_imp.import_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>1516696681383506,p_default_application_id=>100,p_default_id_offset=>0,p_default_owner=>'SAGARDASHBOARD');`nwwv_flow_imp.g_mode := 'REPLACE';")
$assets=@(
 @{Id='850000000000000066';Name='hspl-nav-hierarchy-v22.css';Mime='text/css';Path=(Join-Path $taskRoot 'nav-hierarchy.css')},
 @{Id='850000000000000067';Name='hspl-nav-hierarchy-v22.js';Mime='application/javascript';Path=(Join-Path $taskRoot 'nav-hierarchy.js')}
)
foreach($asset in $assets){$hex=[Convert]::ToHexString([IO.File]::ReadAllBytes($asset.Path));[void]$out.AppendLine('wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;');for($i=0;$i -lt $hex.Length;$i+=3000){$chunk=$hex.Substring($i,[Math]::Min(3000,$hex.Length-$i));[void]$out.AppendLine("wwv_flow_imp.g_varchar2_table($([int]($i/3000)+1)) := '$chunk';")};[void]$out.AppendLine("wwv_flow_imp_shared.create_app_static_file(p_id=>$($asset.Id),p_file_name=>'$($asset.Name)',p_mime_type=>'$($asset.Mime)',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));")}
[void]$out.AppendLine("wwv_flow_imp.import_end(p_auto_install_sup_obj=>false);`ncommit;`nend;`n/`n")
[void]$out.Append($page)
[IO.File]::WriteAllText((Join-Path $taskRoot 'deploy-nav-hierarchy.sql'),$out.ToString(),[Text.UTF8Encoding]::new($false))
Write-Output 'Built deploy-nav-hierarchy.sql from fresh Page 0 export.'
