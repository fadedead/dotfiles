#!/bin/bash

shutdown="  Shutdown"
reboot="󰜉  Reboot"
suspend="󰤄  Suspend"
lock="  Lock"
logout="󰍃  Logout"

options="$lock\n$suspend\n$logout\n$reboot\n$shutdown"

selected=$(echo -e "$options" | wofi --dmenu --cache-file /dev/null --prompt "Power Menu" --width 200 --height 220 --style ${HOME}/.config/wofi/style.css)

case $selected in
    "$shutdown")
        systemctl poweroff
        ;;
    "$reboot")
        systemctl reboot
        ;;
    "$suspend")
        systemctl suspend
        ;;
    "$lock")
        loginctl lock-session
        ;;
    "$logout")
        hyprctl dispatch exit
        ;;
esac
