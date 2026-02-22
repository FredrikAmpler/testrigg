@echo off
echo Startar Borrtest-servern...
cd /d %~dp0
start /b python -m http.server 8000
timeout /t 2 /nobreak > nul
start http://localhost:8000/start.html
echo Servern kors nu. Du kan minimera detta fonster.
echo For att stanga servern: Stang detta terminalfonster.
pause
