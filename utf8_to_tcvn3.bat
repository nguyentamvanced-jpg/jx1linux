@echo off
setlocal enabledelayedexpansion

REM ===== CONFIG =====
set UNIKEXE=C:\Tools\UniKey\UniKeyNT.exe
set SRC=jx1-src-utf8
set DST=jx1-src-tcvn3

REM ===== COPY BACK =====
xcopy "%SRC%" "%DST%" /E /I /Y >nul

REM ===== CONVERT FILES =====
for /R "%DST%" %%F in (*.lua *.txt) do (
    "%UNIKEXE%" /convertfile "%%F" UTF8 TCVN3
)

echo DONE: UTF-8 -> TCVN3
pause
