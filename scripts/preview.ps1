param(
    [switch]$BuildOnly,
    [ValidateRange(1024, 65535)][int]$Port = 4000
)

$ErrorActionPreference = 'Stop'
$projectRoot = Split-Path -Parent $PSScriptRoot
Push-Location -LiteralPath $projectRoot
$savedGemHome = $env:GEM_HOME
$savedGemPath = $env:GEM_PATH
$savedJekyllEnv = $env:JEKYLL_ENV
try {
    $env:JEKYLL_ENV = 'production'
    $portableRuby = Join-Path $projectRoot 'tmp\runtime\rubyinstaller-3.3.10-1-x64\bin\ruby.exe'
    $portableJekyll = Join-Path $projectRoot 'tmp\gems\bin\jekyll'
    if ((Test-Path -LiteralPath $portableRuby) -and (Test-Path -LiteralPath $portableJekyll)) {
        $env:GEM_HOME = Join-Path $projectRoot 'tmp\gems'
        $env:GEM_PATH = $env:GEM_HOME
        & $portableRuby $portableJekyll build --trace
        if ($LASTEXITCODE -ne 0) { throw 'Jekyll build failed.' }
        if (!$BuildOnly) {
            Write-Host "Preview: http://127.0.0.1:$Port (Ctrl+C to stop)"
            & $portableRuby $portableJekyll serve --skip-initial-build --no-watch --host 127.0.0.1 --port $Port
        }
    } else {
        if (!(Get-Command bundle -ErrorAction SilentlyContinue)) {
            throw 'Install Ruby and Bundler, run bundle install, and try again. See README.md.'
        }
        & bundle exec jekyll build --trace
        if ($LASTEXITCODE -ne 0) { throw 'Jekyll build failed. Run bundle install first.' }
        if (!$BuildOnly) {
            Write-Host "Preview: http://127.0.0.1:$Port (Ctrl+C to stop)"
            & bundle exec jekyll serve --skip-initial-build --no-watch --host 127.0.0.1 --port $Port
        }
    }
    if ($LASTEXITCODE -ne 0) { throw 'Jekyll exited with an error.' }
} finally {
    $env:GEM_HOME = $savedGemHome
    $env:GEM_PATH = $savedGemPath
    $env:JEKYLL_ENV = $savedJekyllEnv
    Pop-Location
}
