@echo off
cls
echo Press Ctrl+c at any time to quit.
for /f "delims=" %%i in ("%cd%") do set folder=%%~ni

set name=
set /p name=name(%folder%):
if defined name (
    set name=%name%
) else (
    set name=%folder%
)

set defaultV=1.0.0
set version=
set /p version=version(%defaultV%):
if defined version (
    set version=%version%
) else (
    set version=%defaultV%
)

echo building...
SET CGO_ENABLED=0
::GOOS：目标平台的操作系统(darwin、freebsd、linux、windows)
SET GOOS=linux
::GOARCH：目标平台的体系架构(386、amd64、arm)
SET GOARCH=386
go build -o %name%.%version% main.go
echo end...

pause