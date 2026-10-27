@echo off
cd /d "%~dp0"
echo Ouvrez http://localhost:8000 dans votre navigateur.
py -m http.server 8000
pause
