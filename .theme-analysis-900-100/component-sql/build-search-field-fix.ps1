$ErrorActionPreference='Stop'
$taskRoot=$PSScriptRoot
$repoRoot=Split-Path (Split-Path $taskRoot -Parent) -Parent
$page=[IO.File]::ReadAllText((Join-Path $repoRoot 'f100_page_0_1.sql'))
$css=[IO.File]::ReadAllText((Join-Path $taskRoot 'global-search-field.css'))
$marker=',p_plug_source=>''<link rel="stylesheet" href="#APP_FILES#hspl-master-forms.css?cb=20260831o">'
if(!$page.Contains($marker)){throw 'Current global stylesheet region anchor not found; aborting.'}
$style=('<style id="hspl-global-search-field">'+$css+'</style>').Replace("'","''")
$page=$page.Replace($marker,(',p_plug_source=>'''+$style+'<link rel="stylesheet" href="#APP_FILES#hspl-master-forms.css?cb=20260831o">'))
[IO.File]::WriteAllText((Join-Path $taskRoot 'deploy-search-field-fix.sql'),$page,[Text.UTF8Encoding]::new($false))
