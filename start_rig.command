#!/bin/bash
# Detta skript startar en lokal webbserver för att dashboarden ska fungera utan säkerhetsvarningar.
cd "$(dirname "$0")"
echo "Startar Borrtest-servern..."
# Starta servern i bakgrunden (port 8000)
python3 -m http.server 8000 &
SERVER_PID=$!
# Vänta en sekund och öppna sedan adressen
sleep 1
open "http://localhost:8000/start.html"
echo "Servern körs nu. Du kan minimera detta fönster."
echo "För att stänga servern helt: Stäng detta terminalfönster."
# Håll skriptet vid liv tills terminalen stängs
wait $SERVER_PID
