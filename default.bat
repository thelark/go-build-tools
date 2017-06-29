@echo off
@color 06
:: 清除屏幕
cls
echo Press Ctrl+c at any time to quit.

:: 获取当前目录名称
for /f "delims=" %%i in ("%cd%") do set folder=%%~ni

:: 应用名称
set name=
set /p name=name(%folder%):
if defined name (
    set name=%name%
) else (
    set name=%folder%
)

:: 版本号
set defaultV=1.0.0
set version=
set /p version=version(%defaultV%):
if defined version (
    set version=%version%
) else (
    set version=%defaultV%
)

:: 开始编译
echo building...
SET CGO_ENABLED=0
:: GOOS：目标平台的操作系统(darwin、freebsd、linux、windows)
:: GOARCH：目标平台的体系架构(386、amd64、arm)

:: win
SET GOOS=windows
SET GOARCH=386
go build -o %name%.win.32.%version%.exe main.go
SET GOARCH=amd64
go build -o %name%.win.64.%version%.exe main.go

:: linux
SET GOOS=linux
SET GOARCH=386
go build -o %name%.linux.32.%version% main.go
SET GOARCH=amd64
go build -o %name%.linux.64.%version% main.go

:: mac
SET GOOS=darwin
SET GOARCH=386
go build -o %name%.mac.32.%version% main.go
SET GOARCH=amd64
go build -o %name%.mac.64.%version% main.go

echo end...

pause