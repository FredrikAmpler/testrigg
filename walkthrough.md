# Walkthrough: Tasmota Drill Test Rig

Denna guide beskriver hur du kör dashboarden direkt från pluggen. Detta är den enklaste lösningen för slutanvändaren (pappa).

## 1. Förutsättning
Pluggen måste vara uppdaterad med en firmware som stödjer **Static File Serving**. Se [implementation_plan.md](file:///Users/ampfr/.gemini/antigravity/brain/7f5b8df6-c4b2-4058-9f78-77010de661d0/implementation_plan.md) för hur du skapar den filen.

## 2. Ladda upp filen
1. Gå till pluggens IP-adress i webbläsaren.
2. Gå till **Consoles** -> **Manage File System**.
3. Ladda upp filen [start.html](file:///Users/ampfr/git/tasmota-drill-test/start.html). (Tips: Döp om den till `index.html` om du vill att den ska visas som startsida).

## 3. Användning (Online eller Offline)
Nu kan dashboarden nås var du än är:
- **Hemma:** `http://<din-ip>/start.html`
- **Utan WiFi (AP Mode):** Anslut till pluggens eget WiFi (Tasmota-XXXX) och gå till `http://192.168.4.1/start.html`.

### Tidstämplar
Systemet synkar automatiskt klockan från din dator till pluggen så fort du ansluter. Detta säkerställer att alla mätvärden får rätt datum och tid även om pluggen inte har internet.

### Fördelar:
- Fungerar på alla datorer (Windows/Mac/Mobil).
- Inga problem med säkerhetsspärrar (CORS) eftersom sidan och datan kommer från samma ställe.
- Inga lokala filer behövs på datorn.

## 4. Aktivera Rules
Glöm inte att klistra in reglerna från `tasmota_rules.md` i konsolen enligt tidigare instruktioner för att pluggen ska kunna köra autonomt.
