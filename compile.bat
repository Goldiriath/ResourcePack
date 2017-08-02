@echo off
setlocal enableextensions enabledelayedexpansion

set "file=target\Goldiriath.zip"

if not exist target mkdir target
if exist "%file%" del "%file%"
"script\zip.vbs" %file% "src"


for /F "usebackq" %%A IN ('%file%') DO set size=%%~zA
echo Compile done. (%size% bytes)

endlocal
