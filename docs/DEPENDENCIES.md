# Runtime and Build Requirements

## End-user runtime

Researchers using the self-contained `win-x64` release package need:

- Windows 10 or Windows 11 on a 64-bit computer;
- desktop audio output;
- speakers or headphones appropriate to the study;
- keyboard input during listening sessions;
- a writable extracted application folder.

The self-contained package includes the required .NET runtime. Visual Studio and the .NET SDK are not required for normal use.

See [Installation](INSTALLATION.md) for the download procedure and [Calibration](CALIBRATION.md) before participant testing.

## Developer build requirements

The source repository is configured for:

- .NET SDK `9.0.102`, pinned in `global.json`;
- compatible .NET `9.0.x` SDK installations in equivalent build environments;
- target framework `net8.0-windows`;
- Windows Presentation Foundation (WPF).

No legacy .NET Framework developer pack is required.

## Core application packages

- `Extended.Wpf.Toolkit` `5.0.0`
- `Newtonsoft.Json` `13.0.3`
- `System.Configuration.ConfigurationManager` `8.0.0`
- `System.Windows.Extensions` `8.0.0`

## Test-project packages

- `Microsoft.NET.Test.Sdk` `17.11.1`
- `xunit` `2.9.2`
- `xunit.runner.visualstudio` `2.8.2`

## Build entry points

- solution: [`src/PerceptionTests.sln`](https://github.com/adammuzyk/PerceptionTests/blob/publish/src/PerceptionTests.sln)
- application project: [`src/PerceptionTests/PerceptionTests.csproj`](https://github.com/adammuzyk/PerceptionTests/blob/publish/src/PerceptionTests/PerceptionTests.csproj)

Full GitHub URLs are used because these source files are outside the MkDocs `docs/` directory.

## Runtime configuration files

The application package must retain:

- `experiment-config.json`
- `questionnaire-config.json`
- the generated `PerceptionTests.dll.config`

The JSON files are copied next to the executable during build and publish so that researchers can edit them without recompiling the application.

## Manual developer commands

```powershell
dotnet restore .\src\PerceptionTests.sln
dotnet build .\src\PerceptionTests.sln -c Release --no-restore
dotnet test .\src\PerceptionTests.Tests\PerceptionTests.Tests.csproj -c Release --no-build
```

## Documentation build

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1
```

The script runs `mkdocs build --strict --clean` using the dependencies pinned in `docs/requirements.txt`.

## Local end-user package

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\publish-win-x64.ps1
```

This command publishes standard and single-file self-contained Windows x64 packages, copies researcher-facing documentation, creates both ZIP archives, and writes their SHA-256 checksums.
