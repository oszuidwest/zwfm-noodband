# Noodband generator ZuidWest FM

## Overzicht
Dit project automatiseert het genereren en uploaden van een 'noodband' voor ZuidWest FM via GitHub Actions.

Iedere zondag tussen 02:00 en 04:00 uur is er geen reclame, nieuws, weer, verkeer of uuropener. Op dat moment wordt de hoge kwaliteit stream opgenomen en verwerkt tot een noodband in verschillende formaten. Zo is er iedere week een verse noodband zonder handwerk.

🚧 **Dit project bevindt zich in testfase** 🚧

## Workflow beschrijving
De workflow bestaat uit drie hoofdjobs:

1. **record-audio**: Neemt audio op van de ZuidWest FM stream, slaat het op en uploadt het als een artifact.
2. **process-audio**: Downloadt de opgenomen audio, installeert en configureert StereoTool in WatchCat, verwerkt de audio en uploadt deze als een artifact. Draait op Windows (!).
3. **upload-audio**: Verbindt via WireGuard met het beveiligde zendernetwerk, downloadt de verwerkte audio en uploadt deze naar een testapparaat met MicroMPX.

## Belangrijke bestanden
- `WatchCat.ini`: Configuratiebestand voor WatchCat/StereoTool.
- `screenshot.ps1`: Script om schermafbeeldingen te maken tijdens het verwerken van de audio.
- `st.sts`: Preset voor StereoTool

## GitHub Secrets
Voor het beveiligen en gebruiken van gevoelige informatie in de workflow, configureer de volgende GitHub Secrets:

### Lijst van benodigde secrets

- `ST_LICENSE`: Licentiesleutel voor StereoTool.
- `WG_DEVICE_PRIVATE_KEY`: Private key voor het WireGuard VPN-apparaat.
- `WG_DEVICE_ADDRESS`: IP-adres van het WireGuard VPN-apparaat.
- `WG_SERVER_PUBLIC_KEY`: Publieke sleutel van de WireGuard-server.
- `WG_SERVER_PUBLIC_IP`: IP-adres van de WireGuard-server.
- `WG_NETWORK`: Geautoriseerde IP's voor routing via de VPN.
- `REMOTE_USER`: Gebruikersnaam voor de server waarop de audio wordt geüpload.
- `REMOTE_PASSWORD`: Wachtwoord voor de servertoegang.

### Aanmaken van GitHub Secrets

1. Ga naar je GitHub repository.
2. Navigeer naar **Settings** > **Secrets** > **Actions**.
3. Klik op **New repository secret**.
4. Voer de naam en de waarde van het geheim in en klik op **Add secret**.
