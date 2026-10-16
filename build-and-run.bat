@echo off
setlocal
cd /d "%~dp0"

echo === Compiling Electron main ===
call haxe main.debug.hxml
if errorlevel 1 goto :error

echo === Compiling renderer ===
call haxe renderer.debug.hxml
if errorlevel 1 goto :error

echo === Launching LDtk ===
cd app
call npm run start
exit /b 0

:error
echo.
echo Build failed.
pause
exit /b 1
