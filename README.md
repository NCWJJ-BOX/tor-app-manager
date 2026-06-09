# Tor App Manager

PyQt5 GUI สำหรับควบคุม Transparent Tor Proxy — toggle, เลือกประเทศ exit node, rotate IP, ดูสถานะ

## Structure

```
tor-app-manager/
├── src/
│   ├── tor-app-manager-ui    # PyQt5 GUI (Python)
│   └── tor-app-manager       # Backend controller (bash + iptables)
├── icons/                    # App icons (48/64/96/128px + full)
├── install/
│   └── tor-app-manager.desktop
├── install.sh
└── README.md
```

## Features

- **Transparent Proxy Toggle** — iptables nat redirect all TCP traffic through Tor
- **Exit Node Selection** — เลือกประเทศจาก 40+ ประเทศ
- **NEWNYM Circuit Rotation** — ขอ IP ใหม่
- **Killswitch** — block traffic ที่ไม่ผ่าน Tor อัตโนมัติ
- **System Tray** — minimize to tray, status indicator
- **Dark Theme** — PyQt5 dark palette

## Requirements

- `tor` (system package)
- `python3-pyqt5`
- `curl`, `iptables`
- `sudo` (for iptables/transparent proxy)

## Install

```bash
sudo ./install.sh
```

หรือ manual:

```bash
sudo cp src/tor-app-manager-ui /usr/local/bin/
sudo cp src/tor-app-manager /usr/local/bin/
sudo cp icons/* /usr/local/share/icons/
sudo cp install/tor-app-manager.desktop /usr/share/applications/
```

## Usage

```bash
# รัน GUI
tor-app-manager-ui

# หรือใช้ CLI โดยตรง
sudo tor-app-manager start    # เปิด transparent proxy
sudo tor-app-manager stop     # ปิด
sudo tor-app-manager status   # เช็คสถานะ
sudo tor-app-manager ip       # เช็ค IP
```

## Backend

`tor-app-manager` จัดการ iptables rules:

| Rule | Action |
|------|--------|
| TCP 9040 | Redirect → Tor TransPort |
| UDP/TCP 53 | Redirect → Tor DNSPort |
| Reserved nets | Bypass (local, private, multicast) |
| tor user traffic | Allow |
| Killswitch | DROP everything else |

Docker networking จะถูก save/restore อัตโนมัติตอน start/stop

## License

MIT
