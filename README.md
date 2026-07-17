# PerceptionTests

`PerceptionTests` is a Windows desktop application for auditory perception experiments. It presents a participant questionnaire, runs generated sound-based listening sessions, records the participant's response point, and saves structured results as JSON.

## Download and run — no development tools required

A precompiled Windows release is the most suitable option for researchers who do not need to modify the source code.

1. Open the repository's [**Releases** page](https://github.com/adammuzyk/PerceptionTests/releases).
2. Download `PerceptionTests-<version>-win-x64-single-file.zip` and its `.sha256` file. A standard multi-file ZIP is also available for compatibility and troubleshooting.
3. Verify the checksum and extract the complete ZIP to a writable folder.
4. Run `START_PERCEPTIONTESTS.bat`. In the single-file package, `PerceptionTests.exe` can also be started directly.
5. Complete a validation run before collecting participant data.

A self-contained release includes the required .NET runtime. End users do not need Visual Studio or the .NET SDK.

- [Web documentation](https://adammuzyk.github.io/PerceptionTests/)
- [Quick start](docs/QUICK_START.md)
- [Installation](docs/INSTALLATION.md)
- [Calibration](docs/CALIBRATION.md)
- [Troubleshooting](docs/TROUBLESHOOTING.md)

## Before participant testing

- Keep the application and both JSON configuration files in the same extracted folder.
- Use a documented playback chain with fixed settings.
- Archive the exact configuration files used for data collection.
- Run one complete test session and inspect the generated JSON result.

## Main features

- Windows desktop interface implemented in Windows Presentation Foundation (WPF)
- researcher-editable experiment and questionnaire configuration loaded from JSON
- dynamic questionnaire rendering from a constrained configuration schema
- generated WAVE-based listening stimuli
- keyboard response capture during playback
- structured JSON export for downstream analysis
- checkpoint persistence after each completed listening session
- automated build, test, release-package, and documentation workflows

## Documentation

- [Researcher configuration guide](docs/RESEARCHER_CONFIG_GUIDE.md)
- [Output schema](docs/OUTPUT_SCHEMA.md)
- [Checkpoint behaviour](docs/CHECKPOINTS.md)
- [Data-analysis notes](docs/DATA_ANALYSIS.md)
- [Dependencies and source build](docs/DEPENDENCIES.md)
- [User-interface screenshots](docs/UI_SCREENSHOTS.md)

## Build from source — developers only

The repository pins SDK `9.0.102` in [`global.json`](global.json). The application target framework is `net8.0-windows`.

```powershell
dotnet restore .\src\PerceptionTests.sln
dotnet build .\src\PerceptionTests.sln -c Release --no-restore
dotnet test .\src\PerceptionTests.sln -c Release --no-build
```

Validate the web documentation:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1
```

Create both self-contained Windows packages (standard and single-file):

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\publish-win-x64.ps1
```

## Citation and license

- License: [`MIT`](LICENSE)
- Citation metadata: [`CITATION.cff`](CITATION.cff)

## Author

- Software author: Adam Rosiński
- Preferred citation metadata: [`CITATION.cff`](CITATION.cff)
