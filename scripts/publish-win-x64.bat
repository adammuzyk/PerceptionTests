@echo off
setlocal
cd /d "%~dp0\.."
powershell.exe -NoProfile -ExecutionPolicy Bypass -File ".\scripts\publish-win-x64.ps1"
if errorlevel 1 (
  echo.
  echo Packaging failed.
  pause
  exit /b 1
)
echo.
echo Package created in artifacts\release\
pause
