@echo off
setlocal

REM Lấy đường dẫn thư mục chứa BAT
set BASEDIR=%~dp0
set UNIKEXE=%BASEDIR%UniKeyNT.exe

REM SOURCE / DEST
set SRC=%BASEDIR%server\jxser\server1
set DST=%BASEDIR%jxser_utf8

echo === TCVN3 -> UTF-8 ===

REM Tạo folder đích nếu chưa có
if not exist "%DST%" (
    mkdir "%DST%"
)

REM Copy toàn bộ cấu trúc
xcopy "%SRC%" "%DST%" /E /I /Y >nul

REM Convert text files
for /R "%DST%" %%F in (*.lua *.txt) do (
    "%UNIKEXE%" /convertfile "%%F" TCVN3 UTF8
)

echo DONE: Convert TCVN3 -> UTF-8
pause
