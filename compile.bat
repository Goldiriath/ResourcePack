@echo off
setlocal enableextensions enabledelayedexpansion

set "file=target\Goldiriath.zip"

if not exist target mkdir target
if exist "%file%" del "%file%"
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::CreateFromDirectory('src', '%file%'); }"

for /F "usebackq" %%A IN ('%file%') DO set size=%%~zA
echo Compile done. (%size% bytes)

endlocal
