#!/bin/bash

state=$(nmcli -fields WIFI g)

if [[ "$state" =~ "disabled" ]]; then
    toggle="Enable Wi-Fi"
else
    toggle="Disable Wi-Fi"
fi

list=$(nmcli --fields "SSID,SECURITY,BARS" device wifi list | sed 1d | sed 's/  */ /g' | sed 's/^ //g' | uniq)

options="$toggle\n$list"

selected=$(echo -e "$options" | wofi --dmenu --cache-file /dev/null --prompt "Wi-Fi" --width 400 --height 400 --style ${HOME}/.config/wofi/style.css)

if [ -z "$selected" ]; then
    exit 0
fi

if [ "$selected" = "Enable Wi-Fi" ]; then
    nmcli radio wifi on
    notify-send "Wi-Fi" "Enabled"
    exit 0
elif [ "$selected" = "Disable Wi-Fi" ]; then
    nmcli radio wifi off
    notify-send "Wi-Fi" "Disabled"
    exit 0
fi

read -r ssid <<< "$selected"
ssid=$(echo "$selected" | sed 's/ \+WPA.*//; s/ \+WEP.*//; s/ \+--.*//; s/ \+802\.1X.*//')

if nmcli device wifi connect "$ssid" > /dev/null 2>&1; then
    notify-send "Wi-Fi" "Connected to $ssid"
else
    password=$(wofi --dmenu --password --cache-file /dev/null --prompt "Password for $ssid" --width 300 --height 100 --style ${HOME}/.config/wofi/style.css)
    
    if [ -n "$password" ]; then
        if nmcli device wifi connect "$ssid" password "$password"; then
            notify-send "Wi-Fi" "Connected to $ssid"
        else
            notify-send "Wi-Fi" "Connection failed"
        fi
    fi
fi
