#!/bin/bash
# Tor App Manager — installer
set -e

BIN_DIR="/usr/local/bin"
ICON_DIR="/usr/local/share/icons"
APP_DIR="/usr/share/applications"

echo "[*] Installing Tor App Manager..."

# Binaries
sudo cp src/tor-app-manager-ui "$BIN_DIR/"
sudo cp src/tor-app-manager "$BIN_DIR/"
sudo chmod +x "$BIN_DIR/tor-app-manager-ui" "$BIN_DIR/tor-app-manager"

# Icons
sudo cp icons/tor-app-manager*.png "$ICON_DIR/"

# Desktop entry
sudo cp install/tor-app-manager.desktop "$APP_DIR/"

echo "[+] Done. Run: tor-app-manager-ui"
