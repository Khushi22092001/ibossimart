param(
  [string] $OutputPath = (Join-Path $PSScriptRoot '..\hspl-jet-l10n-fallback.js')
)

$base = 'http://65.1.187.176:8888/i/libraries/oraclejet/20.0.5/js/libs/oj/20.0.5/resources/nls/'
$modules = [ordered]@{
  'ojtranslations/nls/localeElements'       = 'localeElements.js'
  'ojtranslations/nls/en/localeElements'    = 'en/localeElements.js'
  'ojtranslations/nls/timezoneData'         = 'timezoneData.js'
  'ojtranslations/nls/en-US/timezoneData'   = 'en-US/timezoneData.js'
}

$lines = [Collections.Generic.List[string]]::new()
$lines.Add('/* HSPL-local Oracle JET 20.0.5 locale fallback. The production /i path')
$lines.Add('   is missing these four modules; native APEX charts cannot initialise without them. */')
$lines.Add('(function () {')
$lines.Add('  var attempts = 0;')
$lines.Add('  function register() {')
$lines.Add('    if (typeof define !== "function" || !define.amd) {')
$lines.Add('      if (attempts++ < 1000) { window.setTimeout(register, 10); }')
$lines.Add('      return;')
$lines.Add('    }')
foreach ($name in $modules.Keys) {
  $response = Invoke-WebRequest -Uri ($base + $modules[$name]) -TimeoutSec 30
  $content = $response.Content
  if ($content -is [byte[]]) { $content = [Text.Encoding]::UTF8.GetString($content) }
  $content = [regex]::Replace($content, '^\s*define\(', ('  define("' + $name + '", '))
  $lines.Add($content)
}
$lines.Add('  }')
$lines.Add('  register();')
$lines.Add('})();')

$destination = if ([IO.Path]::IsPathRooted($OutputPath)) { $OutputPath } else { Join-Path (Get-Location) $OutputPath }
[IO.File]::WriteAllLines($destination, $lines, [Text.UTF8Encoding]::new($false))
