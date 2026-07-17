@echo off
setlocal
cd /d "%~dp0"

set "APP_EXE=%~dp0PerceptionTests.exe"
set "APP_DIR=%~dp0"
if not exist "%APP_EXE%" (
  set "APP_EXE=%~dp0app\PerceptionTests.exe"
  set "APP_DIR=%~dp0app"
)

if not exist "%APP_EXE%" (
  echo PerceptionTests.exe was not found in this package.
  echo Extract the complete release archive before starting the application.
  pause
  exit /b 1
)

start "" /d "%APP_DIR%" "%APP_EXE%"
