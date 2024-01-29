#!/usr/bin/env bash

set -euo pipefail


echo "installing iwd"
pacman -S iwd

echo "migrating wpa backend networks to iwd"

cd /etc/NetworkManager/system-connections
mkdir ../system-connections-iwd
for f in *; do grep -v '^\(mac-address\|interface-name\|permissions\|bssid\)=' "$f" > ../system-connections-iwd/"$f"; done
chmod 0600 ../system-connections-iwd/*
cd /etc/NetworkManager
mv system-connections system-connections-backup
dbus-send --system --print-reply --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager/Settings org.freedesktop.NetworkManager.Settings.ReloadConnections
sleep 1
mv system-connections-iwd system-connections
dbus-send --system --print-reply --dest=org.freedesktop.NetworkManager /org/freedesktop/NetworkManager/Settings org.freedesktop.NetworkManager.Settings.ReloadConnections
