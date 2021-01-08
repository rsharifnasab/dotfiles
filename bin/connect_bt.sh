#!/bin/sh

#devices=$(bluetoothctl devices | awk '{print $2}')

devices="D9:87:A8:06:64:1F
45:33:12:EE:CD:EB
CE:F0:F0:82:FC:EF
A0:60:90:2F:59:09
75:57:1D:09:88:3E"

for device in $devices; do
    echo "removing $device"
    bluetoothctl disconnect "$device"
    bluetoothctl untrust "$device"
    bluetoothctl remove "$device"
done

bluetoothctl power off
bluetoothctl power on
timeout 7s bluetoothctl scan on

for device in $devices; do
    echo "----connecting to $device----"
    #bluetoothctl info "$device"
    bluetoothctl trust "$device"
    bluetoothctl pair "$device"
    bluetoothctl connect "$device" || continue
    echo "connected to $device" && exit
done

echo "failed :("



