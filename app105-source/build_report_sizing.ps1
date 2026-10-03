$ErrorActionPreference='Stop'
$lines=[Collections.Generic.List[string]]::new()
$lines.Add('whenever sqlerror exit sql.sqlcode rollback')
$lines.Add('set define off')
$lines.Add('connect -name IMART')
$lines.Add('begin execute immediate ''create table imart_report_sizing_backup_20261001 as select id,css_file_urls,javascript_file_urls from apex_260100.wwv_flows where id=105''; exception when others then if sqlcode != -955 then raise; end if; end;')
$lines.Add('/')
$lines.Add('begin execute immediate ''create table imart_report_sizing_v7_assets as select file_name,file_content from apex_application_static_files where application_id=105 and file_name in (''''report-column-sizing.css'''',''''report-column-sizing.js'''')''; exception when others then if sqlcode != -955 then raise; end if; end;')
$lines.Add('/')
$lines.Add('begin execute immediate ''create table imart_report_sizing_v7_refs as select id,css_file_urls,javascript_file_urls from apex_260100.wwv_flows where id=105''; exception when others then if sqlcode != -955 then raise; end if; end;')
$lines.Add('/')
$lines.Add("begin wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART'); end;")
$lines.Add('/')
$index=0
$sizingVersion='20261001v13'
foreach($ext in @('css','js')) {
  $index++
  $bytes=[IO.File]::ReadAllBytes("$PSScriptRoot/report-column-sizing.$ext")
  $hex=[BitConverter]::ToString($bytes).Replace('-','')
  $lines.Add('begin')
  $lines.Add('wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
  $i=1
  for($offset=0;$offset -lt $hex.Length;$offset+=2000){$chunk=$hex.Substring($offset,[Math]::Min(2000,$hex.Length-$offset));$lines.Add("wwv_flow_imp.g_varchar2_table($i) := '$chunk';");$i++}
  $mime=if($ext -eq 'js'){'application/javascript'}else{'text/css'}
  $lines.Add("wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(202610011330000$index),p_file_name=>'report-column-sizing.$ext',p_mime_type=>'$mime',p_file_charset=>'utf-8',p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)); end;")
  $lines.Add('/')
}
$lines.Add("update apex_260100.wwv_flows set css_file_urls=regexp_replace(css_file_urls,'([[:space:]]*#APP_FILES#report-column-sizing[.]css[^[:space:]]*)','')||chr(10)||'#APP_FILES#report-column-sizing.css?cb=20261001v9',javascript_file_urls=regexp_replace(javascript_file_urls,'([[:space:]]*#APP_FILES#report-column-sizing[.]js[^[:space:]]*)','')||chr(10)||'#APP_FILES#report-column-sizing.js?cb=20261001v9',last_updated_on=sysdate where id=105 and security_group_id=4744311978888504;")
for($lineIndex=0;$lineIndex -lt $lines.Count;$lineIndex++){$lines[$lineIndex]=$lines[$lineIndex].Replace('20261001v9',$sizingVersion)}
$lines.Add('begin wwv_flow_imp_shared.clear_cache; wwv_flow_imp.component_end; end;')
$lines.Add('/')
$lines.Add('commit;')
$lines.Add('exit')
$lines | Set-Content -Encoding utf8 "$PSScriptRoot/deploy_report_sizing.sql"
