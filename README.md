# Piki Metronome

A precise, beautiful metronome for musicians — built as a Progressive Web App (PWA) that works in any browser and installs on Android and iOS like a native app.

[![Launch App](https://img.shields.io/badge/🎵%20Open%20the%20Metronome%20App-Launch-bb86fc?style=for-the-badge&logo=google-chrome&logoColor=white)](https://burak-aksoy.github.io/Metronome/piki_metronome.html)

---

## Features

- **Precise timing** — Web Audio API scheduler with look-ahead buffering for rock-solid BPM accuracy
- **Tap tempo** — tap the button to set your tempo naturally
- **Time signatures** — 1 to 16 beats per measure
- **Subdivisions** — Quarter, Eighth, Triplet, Sixteenth
- **Sound types** — Digital, Wood, Click, Beep
- **Visual beat indicator** — animated circle + per-beat dots
- **Volume control**
- **Screen wake lock** — keeps your screen on while practicing
- **Settings persistence** — remembers your last BPM, time signature, and sound
- **Installable PWA** — add to home screen on Android/iOS, works fully offline
- **Mobile-first** — optimized for Android with safe-area insets, no tap delay, native-feeling touch targets

## Screenshots

> *(Add screenshots here)*

---

## Install as an App (Android)

1. Open the live demo URL in Chrome
2. Tap the three-dot menu → **Add to Home screen**
3. Launch from your home screen — runs full-screen with no browser UI

## Install as an App (iOS)

1. Open the live demo URL in Safari
2. Tap the Share button → **Add to Home Screen**

---

## Running Locally

### Option 1 — Docker (recommended)

```bash
docker build -t metronome .
docker run -p 8080:80 metronome
```

Open [http://localhost:8080](http://localhost:8080)

### Option 2 — Any static file server

```bash
npx serve .
# or
python3 -m http.server 8080
```

> Note: the service worker requires a server (not `file://`). Either option above works.

---

## Deploying to Railway

1. Push this repo to GitHub
2. Go to [railway.app](https://railway.app) → New Project → Deploy from GitHub repo
3. Select this repo — Railway auto-detects the Dockerfile
4. Settings → Networking → **Generate Domain**

The `nginx.conf` is configured to read Railway's `$PORT` environment variable automatically.

---

## Project Structure

```
piki_metronome.html   # The entire app (single-file HTML/CSS/JS)
manifest.json   # PWA manifest (name, icons, display mode)
sw.js           # Service worker (offline caching)
Dockerfile      # nginx:alpine container for deployment
nginx.conf      # nginx config with correct MIME types and PORT support
```

## Tech Stack

- Vanilla HTML / CSS / JavaScript — zero dependencies
- Web Audio API — for precise, low-latency sound scheduling
- Web Audio scheduler pattern — look-ahead buffering prevents timing drift
- Screen Wake Lock API — keeps screen on during practice
- Service Worker — offline support
- nginx + Docker — deployment

---

## License

MIT
