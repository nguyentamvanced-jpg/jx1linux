@echo off
setlocal enabledelayedexpansion

REM ===== CONFIG =====
set UNIKEXE=C:\Tools\UniKey\UniKeyNT.exe
set SRC=jx1-src-tcvn3
set DST=jx1-src-utf8

REM ===== COPY STRUCTURE =====
xcopy "%SRC%" "%DST%" /E /I /Y >nul

REM ===== CONVERT FILES =====
for /R "%DST%" %%F in (*.lua *.txt) do (
    "%UNIKEXE%" /convertfile "%%F" TCVN3 UTF8
)

echo DONE: TCVN3 -> UTF-8
pause
