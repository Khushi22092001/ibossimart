$ErrorActionPreference = 'Stop'
$source = [IO.File]::ReadAllText((Join-Path $PSScriptRoot 'backups/register-first-paint-before-20260929/f105.sql'))
$pages = [regex]::Matches($source, '(?ms)^wwv_flow_imp_page\.create_page\(\s*(.*?)^\);')
if ($pages.Count -ne 626) { throw "Expected 626 pages, got $($pages.Count)" }
$sql = [Text.StringBuilder]::new()
[void]$sql.AppendLine("whenever sqlerror exit sql.sqlcode rollback`nset define off`nset serveroutput on`nconnect -name IMART`nbegin")
foreach ($page in $pages) {
  $body = $page.Groups[1].Value
  $id = [regex]::Match($body, 'p_id=>(\d+)').Groups[1].Value
  if (!$id) { throw 'Missing page ID' }
  $header = [regex]::Match($body, '(?ms)^,p_html_page_header=>(.*?)(?=^,p_[a-z_]+=|\z)')
  $expression = if ($header.Success) { $header.Groups[1].Value.Trim() } else { 'null' }
  [void]$sql.AppendLine("update apex_260100.wwv_flow_steps set html_page_header=$expression where flow_id=105 and security_group_id=4744311978888504 and id=$id;")
  [void]$sql.AppendLine("if sql%rowcount<>1 then raise_application_error(-20001,'Page $id not restored'); end if;")
}
[void]$sql.AppendLine("update apex_260100.wwv_flows set files_version=files_version+1, version_scn=dbms_flashback.get_system_change_number where id=105 and security_group_id=4744311978888504;`ncommit;`ndbms_output.put_line('RESTORED_626_ORIGINAL_PAGE_HEADERS');`nend;`n/")
[void]$sql.AppendLine("select count(*) total_pages,sum(case when dbms_lob.instr(html_page_header,'hspl-sidebar-head-state')>0 then 1 else 0 end) bootstrapped_pages from apex_260100.wwv_flow_steps where flow_id=105 and security_group_id=4744311978888504;`nexit")
[IO.File]::WriteAllText((Join-Path $PSScriptRoot 'restore_sidebar_headers_20260929.sql'), $sql.ToString(), [Text.UTF8Encoding]::new($false))
Write-Output "Generated exact original headers for $($pages.Count) pages."
