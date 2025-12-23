@echo off
setlocal EnableDelayedExpansion

echo ===============================
echo  UTF-8  --->  TCVN3
echo ===============================

set BASEDIR=%~dp0
set UNIKEXE=%BASEDIR%UniKeyNT.exe

set SRC=%BASEDIR%jxser_utf8
set DST=%BASEDIR%server\jxser\server1

echo.
echo [1] Check UniKeyNT.exe
if not exist "%UNIKEXE%" (
    echo ❌ ERROR: UniKeyNT.exe not found
    pause
    exit /b
)
echo ✅ UniKey found

echo.
echo [2] Copy UTF-8 source back
xcopy "%SRC%" "%DST%" /E /I /Y >nul
echo Copy DONE

echo.
echo [3] Convert files (UTF-8 -> TCVN3)

set COUNT=0
for /R "%DST%" %%F in (*.lua *.txt) do (
    set /A COUNT+=1
    echo    Converting [!COUNT!]: %%F
    "%UNIKEXE%" /convertfile "%%F" UTF8 TCVN3 >nul
)

echo.
echo ===============================
echo DONE - Converted !COUNT! files
echo ===============================
pause
