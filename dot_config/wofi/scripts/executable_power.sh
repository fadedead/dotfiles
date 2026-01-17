#!/bin/bash

shutdown="  Shutdown"
reboot="󰜉  Reboot"
lock="  Lock"
logout="󰍃  Logout"

options="$lock\n$logout\n$reboot\n$shutdown"

selected=$(echo -e "$options" | wofi --dmenu --cache-file /dev/null --prompt "Power Menu" --width 200 --height 190 --style ${HOME}/.config/wofi/style.css)

case $selected in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$lock")
        hyprlock
        ;;
    "$logout")
        loginctl terminate-user $USER
        ;;
esac
