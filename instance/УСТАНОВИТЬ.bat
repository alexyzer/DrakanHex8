@echo off
setlocal enabledelayedexpansion
chcp 65001 > NUL
cd /d "%~dp0"
if defined JAVA_HOME if exist "%JAVA_HOME%\bin\javaw.exe" set "JAVA_EXE=%JAVA_HOME%\bin\javaw.exe" & goto :found
for %%p in (
    "%AppData%\ModrinthApp\meta\java_versions\*\bin\javaw.exe"
    "%AppData%\.tlauncher\jvms\*\bin\javaw.exe"
    "C:\Program Files (x86)\Minecraft Launcher\runtime\java-runtime-*\bin\javaw.exe"
    "%ProgramFiles%\Java\*\bin\javaw.exe"
    "%ProgramFiles(x86)%\Java\*\bin\javaw.exe"
) do for /f "delims=" %%a in ('dir /b /s "%%p" 2^>NUL') do set "JAVA_EXE=%%~a" & goto :found
where javaw.exe >NUL 2>NUL && for /f "delims=" %%a in ('where javaw.exe') do set "JAVA_EXE=%%~a" & goto :found
echo Java не найдена
echo Установите java c официального сайта
echo https://www.java.com/download/
echo нажмите на любую клавишу чтобы перейти...
pause > NUL
start "" "https://www.java.com/download/"
exit /b 1
:found
"%JAVA_EXE%" -jar packwiz-installer-bootstrap.jar "https://raw.githubusercontent.com/alexyzer/DrakanHex8/main/pack/pack.toml" -bootstrap-no-update
exit /b 0