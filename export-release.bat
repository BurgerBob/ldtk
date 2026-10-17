@echo off
setlocal
cd /d "%~dp0"

rem Target dir is defined in export-release.local.bat (not versioned): set "DEST=C:\path\to\ldtk"
if not exist "export-release.local.bat" (
	echo Missing export-release.local.bat. Create it next to this file with this content:
	echo     set "DEST=C:\path\to\export\dir"
	pause
	exit /b 1
)
call "export-release.local.bat"
if "%DEST%"=="" (
	echo DEST is not defined in export-release.local.bat
	pause
	exit /b 1
)

echo === Compiling Electron main (release) ===
call haxe main.hxml
if errorlevel 1 goto :error

echo === Compiling renderer (release) ===
call haxe renderer.hxml
if errorlevel 1 goto :error

echo === Packaging standalone build ===
cd app
call npm i
if errorlevel 1 goto :error
call npx electron-builder build --win --x64 --dir --publish never
if errorlevel 1 goto :error
cd ..

if not exist "app\redist\win-unpacked\LDtk.exe" (
	echo Packaged build not found in app\redist\win-unpacked
	goto :error
)

echo === Copying to %DEST% ===
robocopy "app\redist\win-unpacked" "%DEST%" /MIR /NFL /NDL /NJH /NJS /NP
if %errorlevel% geq 8 goto :error

echo.
echo Done: %DEST%\LDtk.exe
pause
exit /b 0

:error
echo.
echo Export failed.
pause
exit /b 1
