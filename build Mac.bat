@echo off
echo building...
SET CGO_ENABLED=0
SET GOOS=darwin
SET GOARCH=amd64
go build main.go
echo end...
pause