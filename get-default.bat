@echo off
setlocal enableextensions enabledelayedexpansion

set "version=1.12"

if exist default (
	echo Default resource pack directory already exists.
	goto end
)

echo Decompressing %version%.jar
powershell.exe -nologo -noprofile -command "& { Add-Type -A 'System.IO.Compression.FileSystem'; [IO.Compression.ZipFile]::ExtractToDirectory('%APPDATA%\.minecraft\versions\%version%\%version%.jar', 'minecraft'); }"

move "minecraft\assets" "default"

echo Deleting unnecessary files
rmdir /S /Q "minecraft"

echo Done.

:end
endlocal
