# Troubleshooting

## The application closes immediately

Confirm that `experiment-config.json` and `questionnaire-config.json` are present next to the executable. Invalid or missing configuration prevents startup.

Run the launcher from PowerShell or Command Prompt to keep any error message visible:

```powershell
.\START_PERCEPTIONTESTS.bat
```

## No result file is created

Extract the application to a writable folder. Review `ResultPath` in `PerceptionTests.dll.config`. Avoid folders that require administrator privileges.

## Audio plays through the wrong device

Close the application, select the intended default Windows output device, disable unwanted processing, and restart the application. Repeat the setup check after changing devices.

## Windows blocks the downloaded package

Verify the checksum and official source. On some systems, open the ZIP file's **Properties**, select **Unblock**, apply the change, and extract it again.

## Configuration changes do not appear

Confirm that the edited JSON files are the copies next to the executable. Restart the application after editing. The application validates configuration at startup.

## Documentation does not build locally

Run:

```powershell
powershell.exe -NoProfile -ExecutionPolicy Bypass -File .\scripts\validate-docs.ps1
```

The script installs dependencies from `docs/requirements.txt` into `.venv-docs` and runs `mkdocs build --strict --clean`. Do not suppress strict-build errors; fix the reported link, navigation, or Markdown issue.
