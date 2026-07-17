@echo off
setlocal
cd /d "%~dp0\.."
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\validate-docs.ps1"
if errorlevel 1 (
  echo.
  echo Documentation validation failed.
  pause
  exit /b 1
)
echo.
echo Documentation validation completed successfully.
pause
