param(
  [string]$Root = "C:\Users\shree\Documents\git projects\ibosssagar"
)

$ErrorActionPreference = 'Stop'
$page = Join-Path $Root 'app105-source\apexlang-live-20260914\infomartics123125126125126101100\pages\p00001-home.apx'
$asset = Join-Path $Root 'app105-source\apexlang-live-20260914\infomartics123125126125126101100\shared-components\static-files\imart-home-operations-hero.png'
$assetSql = Join-Path $Root 'app105-source\deploy_imart_home_hero_asset.sql'
$pageSql = Join-Path $Root 'app105-source\deploy_redesign_home_page.sql'
$text = [IO.File]::ReadAllText($page)
$css = [regex]::Match($text, 'inline:\s*```css\s*(?<v>[\s\S]*?)\s*```').Groups['v'].Value.Trim()
$html = [regex]::Match($text, 'htmlCode:\s*(?<v><main[\s\S]*?</main>)\s*\}').Groups['v'].Value.Trim()
if (!$css -or !$html) { throw 'Could not read Page 1 CSS or dashboard markup.' }

# Build a normal APEX static-file export payload from the generated image.
$hex = [Convert]::ToHexString([IO.File]::ReadAllBytes($asset))
$assetBuilder = [Text.StringBuilder]::new()
[void]$assetBuilder.AppendLine('whenever sqlerror exit sql.sqlcode rollback')
[void]$assetBuilder.AppendLine('set define off')
[void]$assetBuilder.AppendLine('connect -name IMART')
[void]$assetBuilder.AppendLine('begin')
[void]$assetBuilder.AppendLine('  apex_util.set_security_group_id(4744311978888504);')
[void]$assetBuilder.AppendLine("  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');")
[void]$assetBuilder.AppendLine('  wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;')
$i = 1
for ($offset = 0; $offset -lt $hex.Length; $offset += 4000) {
  $part = $hex.Substring($offset, [Math]::Min(4000, $hex.Length - $offset))
  [void]$assetBuilder.AppendLine("  wwv_flow_imp.g_varchar2_table($i) := '$part';")
  $i++
}
[void]$assetBuilder.AppendLine("  wwv_flow_imp_shared.create_app_static_file(p_id=>wwv_flow_imp.id(7711000000001135),p_file_name=>'imart-home-operations-hero.png',p_mime_type=>'image/png',p_file_charset=>null,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table));")
[void]$assetBuilder.AppendLine('  wwv_flow_imp.component_end;')
[void]$assetBuilder.AppendLine('end;')
[void]$assetBuilder.AppendLine('/')
[void]$assetBuilder.AppendLine('commit;')
[void]$assetBuilder.AppendLine('exit')
[IO.File]::WriteAllText($assetSql, $assetBuilder.ToString(), [Text.UTF8Encoding]::new($false))

$pageBuilder = [Text.StringBuilder]::new()
[void]$pageBuilder.AppendLine('whenever sqlerror exit sql.sqlcode rollback')
[void]$pageBuilder.AppendLine('set define off')
[void]$pageBuilder.AppendLine('connect -name IMART')
[void]$pageBuilder.AppendLine('declare')
[void]$pageBuilder.AppendLine("  l_css clob := q'~$css~';")
[void]$pageBuilder.AppendLine("  l_html clob := q'~$html~';")
[void]$pageBuilder.AppendLine('begin')
[void]$pageBuilder.AppendLine('  update apex_260100.wwv_flow_steps')
[void]$pageBuilder.AppendLine("     set step_title = 'InfoMart | Operations workspace', inline_css = l_css, last_updated_on = sysdate")
[void]$pageBuilder.AppendLine('   where flow_id = 105 and id = 1 and security_group_id = 4744311978888504;')
[void]$pageBuilder.AppendLine("  if sql%rowcount <> 1 then raise_application_error(-20001, 'Home page CSS was not updated'); end if;")
[void]$pageBuilder.AppendLine('  update apex_260100.wwv_flow_page_plugs')
[void]$pageBuilder.AppendLine("     set plug_source = l_html, region_css_classes = 'imart-home-region', plug_display_point = 'BODY', plug_template = 4072358936313175081, region_template_options = '#DEFAULT#:t-Region--noPadding:t-Region--noUI', last_updated_on = sysdate")
[void]$pageBuilder.AppendLine("   where flow_id = 105 and page_id = 1 and static_id = 'iron-mart' and security_group_id = 4744311978888504;")
[void]$pageBuilder.AppendLine("  if sql%rowcount <> 1 then raise_application_error(-20002, 'Home dashboard region was not updated'); end if;")
[void]$pageBuilder.AppendLine('end;')
[void]$pageBuilder.AppendLine('/')
[void]$pageBuilder.AppendLine('commit;')
[void]$pageBuilder.AppendLine('begin')
[void]$pageBuilder.AppendLine("  wwv_flow_imp.component_begin(p_version_yyyy_mm_dd=>'2026.03.30',p_release=>'26.1.2',p_default_workspace_id=>4744311978888504,p_default_application_id=>105,p_default_id_offset=>7541489808702750,p_default_owner=>'IMART');")
[void]$pageBuilder.AppendLine('  wwv_flow_imp_shared.clear_cache;')
[void]$pageBuilder.AppendLine('  wwv_flow_imp.component_end;')
[void]$pageBuilder.AppendLine('end;')
[void]$pageBuilder.AppendLine('/')
[void]$pageBuilder.AppendLine('commit;')
[void]$pageBuilder.AppendLine('exit')
[IO.File]::WriteAllText($pageSql, $pageBuilder.ToString(), [Text.UTF8Encoding]::new($false))
Write-Output "Generated $assetSql ($($i - 1) image chunks) and $pageSql."
