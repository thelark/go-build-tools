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
::GOOS��Ŀ��ƽ̨�Ĳ���ϵͳ(darwin��freebsd��linux��windows)
SET GOOS=windows
::GOARCH��Ŀ��ƽ̨����ϵ�ܹ�(386��amd64��arm)
SET GOARCH=386
go build -o %name%.%version%.exe main.go
echo end...

pause