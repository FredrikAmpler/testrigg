# Walkthrough: Tasmota Drill Test Rig

Denna guide hjälper dig att sätta upp och köra testriggen för borrmaskinen. Systemet är designat för att vara helt autonomt när det väl startats.

## 1. Installation av Dashboarden
Eftersom din plugg har ett filsystem (UFS) kan vi köra gränssnittet direkt från pluggen.

1. Ladda ner filen [drill_test.html](file:///Users/ampfr/.gemini/antigravity/brain/8125124c-6d98-4f5d-a3b8-4e92c6531040/drill_test.html) till din dator.
2. Gå till pluggens IP-adress i din webbläsare (t.ex. `http://192.168.1.130`).
3. Gå till **Consoles** -> **Manage File System**.
4. Klicka på **Välj fil** och ladda upp `drill_test.html`.
5. Du kan nu nå gränssnittet på `http://192.168.1.130/drill_test.html`.

## 2. Aktivera den autonoma logiken (Rules)
För att testet ska kunna köras utan nätverk måste vi lägga in "regler" i pluggen.

1. Öppna [tasmota_rules.md](file:///Users/ampfr/.gemini/antigravity/brain/8125124c-6d98-4f5d-a3b8-4e92c6531040/tasmota_rules.md).
2. Kopiera koden under **Rule 1** och klistra in i pluggens **Console**, tryck Enter.
3. Kopiera koden under **Rule 2** och klistra in i **Console**, tryck Enter.
4. Skriv sedan följande kommandon i konsolen för att aktivera dem:
   ```tasmota
   Rule1 1
   Rule2 1
   SetOption0 0
   ```

## 3. Användning av Dashboarden
När du öppnar `drill_test.html` på pluggen ser du en modern instrumentpanel.

### Starta ett test
1. Ställ in **Tid PÅ** och **Tid AV** i sekunder.
2. Ställ in en **Effektgräns** (t.ex. 1000W). Om borren drar mer än detta kommer pluggen att bryta omedelbart och stoppa testet.
3. Klicka på **STARTA TEST**.
4. Grafen kommer nu att börja rita effekten i realtid (varje sekund).

### Under testet
- **Cykler**: Räknas upp automatiskt av pluggen.
- **Toppeffekt**: Pluggen sparar det högsta värdet den sett under testet.
- **Statistik**: Webbsidan räknar ut medelvärde och median under tiden sidan är öppen.

### Efter testet
- **Exportera CSV**: Klicka på denna knapp för att ladda ner all insamlad effekt-data till en Excel-fil för granskning.
- **Nollställ**: Använd "Nollställ Statistik" för att rensa antal cykler och toppeffekt inför nästa testomgång.

## Tips till pappa
- Om WiFi dör fortsätter logiken att köra testet (On/Off loopen) och säkerhetsvakten fungerar fortfarande.
- Han kan stänga webbläsaren och öppna den igen; sidan hämtar då de aktuella värdena från pluggen igen.
- För att ladda ner en rapport måste han ha sidan öppen *medan* testet pågår (eftersom pluggen inte sparar historiska mätpunkter).
