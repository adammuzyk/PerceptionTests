[CmdletBinding()]
param(
    [string]$Configuration = "Release",
    [string]$Runtime = "win-x64",
    [string]$Version
)

$ErrorActionPreference = "Stop"
$repoRoot = Split-Path -Parent $PSScriptRoot
Set-Location $repoRoot

if (-not $Version) {
    [xml]$project = Get-Content .\src\PerceptionTests\PerceptionTests.csproj
    $Version = $project.Project.PropertyGroup.Version | Select-Object -First 1
}

$releaseDir = Join-Path $repoRoot "artifacts\release"
New-Item -ItemType Directory -Force $releaseDir | Out-Null

function Assert-NativeCommandSucceeded {
    param([string]$Operation)

    if ($LASTEXITCODE -ne 0) {
        throw "$Operation failed (exit code $LASTEXITCODE)."
    }
}

function Add-DistributionFiles {
    param([string]$PublishDirectory)

    $docsDirectory = Join-Path $PublishDirectory "docs"
    New-Item -ItemType Directory -Force $docsDirectory | Out-Null

    Copy-Item .\distribution\START_PERCEPTIONTESTS.bat $PublishDirectory
    Copy-Item .\distribution\README_FIRST.txt $PublishDirectory
    Copy-Item .\docs\CALIBRATION.md $docsDirectory
    Copy-Item .\docs\INSTALLATION.md $docsDirectory
    Copy-Item .\LICENSE $PublishDirectory
}

function New-ReleaseArchive {
    param(
        [string]$PackageName,
        [bool]$SingleFile
    )

    $publishDirectory = Join-Path $repoRoot "artifacts\publish\$PackageName"
    $zipPath = Join-Path $releaseDir "$PackageName.zip"

    Remove-Item $publishDirectory -Recurse -Force -ErrorAction SilentlyContinue
    New-Item -ItemType Directory -Force $publishDirectory | Out-Null

    $applicationDirectory = $publishDirectory
    if (-not $SingleFile) {
        $applicationDirectory = Join-Path $publishDirectory "app"
        New-Item -ItemType Directory -Force $applicationDirectory | Out-Null
    }

    $readyToRun = (-not $SingleFile).ToString().ToLowerInvariant()

    $publishArguments = @(
        "publish",
        ".\src\PerceptionTests\PerceptionTests.csproj",
        "-c", $Configuration,
        "-r", $Runtime,
        "--self-contained", "true",
        "-p:PublishReadyToRun=$readyToRun",
        "-p:DebugType=None",
        "-p:PublishSingleFile=$($SingleFile.ToString().ToLowerInvariant())",
        "-o", $applicationDirectory
    )

    if ($SingleFile) {
        $publishArguments += "-p:IncludeNativeLibrariesForSelfExtract=true"
        $publishArguments += "-p:EnableCompressionInSingleFile=true"
    }

    & dotnet $publishArguments
    Assert-NativeCommandSucceeded "Publish $PackageName"

    Add-DistributionFiles $publishDirectory

    Remove-Item $zipPath -Force -ErrorAction SilentlyContinue
    Compress-Archive -Path "$publishDirectory\*" -DestinationPath $zipPath -Force

    $hash = (Get-FileHash $zipPath -Algorithm SHA256).Hash.ToLowerInvariant()
    $hashPath = "$zipPath.sha256"
    "$hash  $(Split-Path $zipPath -Leaf)" | Set-Content $hashPath -Encoding ascii

    Write-Host "Created: $zipPath"
    Write-Host "Checksum: $hashPath"
}

dotnet restore .\src\PerceptionTests.sln
Assert-NativeCommandSucceeded "Restore"

dotnet test .\src\PerceptionTests.Tests\PerceptionTests.Tests.csproj -c $Configuration --no-restore
Assert-NativeCommandSucceeded "Tests"

$standardPackageName = "PerceptionTests-$Version-$Runtime"
$singleFilePackageName = "PerceptionTests-$Version-$Runtime-single-file"

New-ReleaseArchive -PackageName $standardPackageName -SingleFile $false
New-ReleaseArchive -PackageName $singleFilePackageName -SingleFile $true
