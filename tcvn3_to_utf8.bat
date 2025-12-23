@echo off
setlocal EnableDelayedExpansion

echo ===============================
echo  TCVN3  --->  UTF-8
echo ===============================

REM Lấy đường dẫn BAT
set BASEDIR=%~dp0
set UNIKEXE=%BASEDIR%UniKeyNT.exe

set SRC=%BASEDIR%server\jxser\server1
set DST=%BASEDIR%jxser_utf8

echo.
echo [1] Check UniKeyNT.exe
if not exist "%UNIKEXE%" (
    echo ❌ ERROR: UniKeyNT.exe not found
    pause
    exit /b
)
echo ✅ UniKey found

echo.
echo [2] Create destination folder
if not exist "%DST%" (
    mkdir "%DST%"
    echo Created: %DST%
) else (
    echo Folder exists: %DST%
)

echo.
echo [3] Copy source files
xcopy "%SRC%" "%DST%" /E /I /Y >nul
echo Copy DONE

echo.
echo [4] Convert files (TCVN3 -> UTF-8)

set COUNT=0
for /R "%DST%" %%F in (*.lua *.txt) do (
    set /A COUNT+=1
    echo    Converting [!COUNT!]: %%F
    "%UNIKEXE%" /convertfile "%%F" TCVN3 UTF8 >nul
)

echo.
echo ===============================
echo DONE - Converted !COUNT! files
echo ===============================
pause
