@echo off
setlocal enableextensions enabledelayedexpansion

set "file=target\Goldiriath.zip"
set "target=%APPDATA%\.minecraft\resourcepacks\Goldiriath.zip"

cmd /c "compile.bat"
if exist "%target%" del /Q %target%
copy  "%file%" "%target%" >nul

echo Installed to %target%

endlocal