@echo off
setlocal

set BASEDIR=%~dp0
set UNIKEXE=%BASEDIR%UniKeyNT.exe

set SRC=%BASEDIR%jxser_utf8
set DST=%BASEDIR%server\jxser\server1

echo === UTF-8 -> TCVN3 ===

REM Copy back
xcopy "%SRC%" "%DST%" /E /I /Y >nul

REM Convert text files
for /R "%DST%" %%F in (*.lua *.txt) do (
    "%UNIKEXE%" /convertfile "%%F" UTF8 TCVN3
)

echo DONE: Convert UTF-8 -> TCVN3
pause
