# Pegasus Suite Desktop: Downloads

Öffentliche Ablage der Windows-Installer von Pegasus Suite Desktop (Quellcode: `pegasushn/pegasus-suite`, `apps/desktop`).
Ausgeliefert über **https://download.pegasus.hn** (Coolify, Dockerfile in diesem Repo).

| Adresse | Ziel |
|---|---|
| `/desktop/stable/Pegasus-Desktop-Setup-<version>.exe` (+ `.blockmap`, `Pegasus-Desktop-<version>-portable.exe`) | 302 auf Release `v<version>` |
| `/desktop/staging/Pegasus-Desktop-Staging-Setup-<version>.exe` usw. | 302 auf Release `staging-v<version>` (Vorabversion) |
| `/desktop/<kanal>/latest.yml` | aus `site/desktop/<kanal>/`, schaltet Auto-Updates frei |
| `/` | 302 auf https://pegasus.hn/softphone |

## Neue Version veröffentlichen

1. Installer im Monorepo bauen und prüfen (`docs/desktop-release.md`).
2. Release anlegen: `gh release create v<version> <Setup.exe> <Setup.exe.blockmap> <portable.exe> -R pegasushn/pegasus-desktop-releases`
   (Staging: Tag `staging-v<version>`, `--prerelease`).
3. Nur bei signierten Builds: `latest.yml` aus `dist/<version>/` nach `site/desktop/stable/` legen, pushen, in Coolify deployen.
   `latest.yml` immer zuletzt ändern, sie schaltet das Update frei. Zurück: alte `latest.yml` wieder einspielen.
4. Website: Build-Variable `VITE_SOFTPHONE_DOWNLOAD_URL` auf `https://download.pegasus.hn/desktop/stable/Pegasus-Desktop-Setup-<version>.exe` setzen und neu bauen.

Keine Secrets in diesem Repo, es ist öffentlich.
