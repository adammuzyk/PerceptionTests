# Installation

[View the complete PerceptionTests documentation online.](https://adammuzyk.github.io/PerceptionTests/)

## Recommended path: precompiled Windows release

This path is intended for researchers and participants who do not use Visual Studio or the .NET SDK.

### Download

Open the GitHub [**Releases** page](https://github.com/adammuzyk/PerceptionTests/releases) and download:

```text
PerceptionTests-<version>-win-x64-single-file.zip
PerceptionTests-<version>-win-x64-single-file.zip.sha256
```

The single-file package is recommended for most users. A standard package named `PerceptionTests-<version>-win-x64.zip` is also available. It contains the same application and editable configuration, but keeps the .NET runtime and application libraries as separate files.

### Verify the checksum

Open PowerShell in the download folder and run:

```powershell
Get-FileHash .\PerceptionTests-<version>-win-x64-single-file.zip -Algorithm SHA256
```

Compare the displayed hash with the contents of the `.sha256` file from the same release.

### Extract the complete archive

Do not run the executable directly from inside the ZIP. Extract all files to a writable folder such as:

```text
C:\Users\<username>\Documents\PerceptionTests\
```

Avoid `C:\Program Files\` while the released configuration writes results and generated WAVE files relative to the application folder.

### Start the application

Run either:

```text
START_PERCEPTIONTESTS.bat
```

or, in the single-file package:

```text
PerceptionTests.exe
```

Windows SmartScreen may warn about an unsigned research application. Verify the official release source and checksum before choosing **More info → Run anyway**.

### Validate before data collection

1. Confirm that `experiment-config.json` and `questionnaire-config.json` are present next to the executable.
2. Read [Calibration](CALIBRATION.md).
3. Run a complete validation session.
4. Confirm that a numbered JSON result and checkpoint file are created.
5. Archive the exact configuration files and application version used by the study.

## Expected single-file package contents

The single-file package keeps the launcher, application, editable configuration, and researcher-facing files at the top level:

```text
PerceptionTests.exe
PerceptionTests.dll.config
experiment-config.json
questionnaire-config.json
START_PERCEPTIONTESTS.bat
README_FIRST.txt
LICENSE
docs\
    CALIBRATION.md
    INSTALLATION.md
```

The standard package keeps the top-level folder concise and places the executable, editable JSON configuration, .NET runtime, and application libraries under `app\`:

```text
START_PERCEPTIONTESTS.bat
README_FIRST.txt
LICENSE
docs\
app\
    PerceptionTests.exe
    PerceptionTests.dll
    PerceptionTests.dll.config
    experiment-config.json
    questionnaire-config.json
    ... runtime and library files
```

Use the top-level launcher for the standard package. Keep the complete extracted folder together in either variant.

## Updating during a study

Do not overwrite the folder used for active data collection.

1. Back up results, generated WAVE files, and configuration files.
2. Extract the new release to a separate folder.
3. Compare configuration files deliberately.
4. Repeat validation and playback-chain checks.
5. Record the new version and change date in the study log.

## Build from source

Developers should follow [Dependencies and source build](DEPENDENCIES.md). To create both local self-contained ZIP variants after installing the required SDK, run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\publish-win-x64.ps1
```

Both packages are written to `artifacts\release\`.
