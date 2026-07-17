# Quick Start

[View the complete PerceptionTests documentation online.](https://adammuzyk.github.io/PerceptionTests/)

## 1. Download the release

Open the repository's [**Releases** page](https://github.com/adammuzyk/PerceptionTests/releases) and download:

```text
PerceptionTests-<version>-win-x64-single-file.zip
PerceptionTests-<version>-win-x64-single-file.zip.sha256
```

The single-file package is recommended for most users. The release also provides `PerceptionTests-<version>-win-x64.zip`, which keeps the .NET runtime and application libraries as separate files for compatibility and troubleshooting.

## 2. Verify and extract

Verify the SHA-256 checksum, then extract the complete ZIP to a writable folder such as:

```text
C:\Users\<username>\Documents\PerceptionTests\
```

Do not run the application from inside the ZIP.

## 3. Start the application

Run:

```text
START_PERCEPTIONTESTS.bat
```

In the single-file package, you can also start `PerceptionTests.exe` directly. In the standard package, the executable and its runtime files are kept together under `app\`; use the top-level launcher.

## 4. Validate the setup

Before participant data collection:

1. confirm that `experiment-config.json` and `questionnaire-config.json` are present next to the executable;
2. read the [calibration guidance](CALIBRATION.md);
3. run a complete validation session;
4. confirm that checkpoint and final JSON files are created;
5. archive the exact configuration files used by the study.

See [Installation](INSTALLATION.md) for detailed instructions and [Troubleshooting](TROUBLESHOOTING.md) when startup, permissions, or audio-device problems occur.
