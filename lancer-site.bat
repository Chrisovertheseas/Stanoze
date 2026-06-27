@echo off
setlocal

set "PORT=4173"
set "HOST=127.0.0.1"
set "URL=http://%HOST%:%PORT%/"
cd /d "%~dp0"

where py >nul 2>nul
if %errorlevel%==0 (
  set "PYTHON=py -3"
  goto start
)

where python >nul 2>nul
if %errorlevel%==0 (
  set "PYTHON=python"
  goto start
)

echo Python est requis pour lancer le site localement.
echo Installez Python depuis https://www.python.org/downloads/
pause
exit /b 1

:start
echo Lancement du site sur %URL%
echo Pour arreter le serveur : Ctrl+C
start "" "%URL%"
%PYTHON% -m http.server %PORT% --bind %HOST%

endlocal
