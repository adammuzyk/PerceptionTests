[CmdletBinding()]
param(
    [string]$PythonCommand = "python"
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

$venvPath = Join-Path $repoRoot ".venv-docs"
$venvPython = Join-Path $venvPath "Scripts\python.exe"

if (-not (Test-Path $venvPython)) {
    & $PythonCommand -m venv $venvPath
    if ($LASTEXITCODE -ne 0) {
        throw "Failed to create documentation virtual environment (exit code $LASTEXITCODE)."
    }
}

& $venvPython -m pip install --disable-pip-version-check -r .\docs\requirements.txt
if ($LASTEXITCODE -ne 0) {
    throw "Failed to install documentation dependencies (exit code $LASTEXITCODE)."
}

& $venvPython -m mkdocs build --strict --clean
if ($LASTEXITCODE -ne 0) {
    throw "Documentation build failed (exit code $LASTEXITCODE)."
}

Write-Host "Documentation build completed successfully: $repoRoot\site"
