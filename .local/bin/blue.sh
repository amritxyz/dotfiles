#!/bin/sh

device_list=$(bluetoothctl devices)
names=$(echo "$device_list" | awk '{$1=$2=""; sub(/^ +/,""); print}')

name=$(echo "$names" | fuzzel -w 30% --no-mouse -I --dmenu --lines 2)

[ -z "$name" ] && notify-send -u normal "No device selected." && exit 1

MAC=$(echo "$device_list" | awk -v n="$name" '{m=$2; $1=$2=""; sub(/^ +/,""); if ($0 == n) {print m; exit}}')
[ -z "$MAC" ] && notify-send -u critical "$name" "Failed to find MAC address." && exit 1

connect=$(bluetoothctl info "$MAC" | awk '/^[[:space:]]*Connected:/ {print $2; exit}')

case "$connect" in
	no)  action="connect" ;;
	yes) action="disconnect" ;;
	*)   notify-send -u normal "$name" "Unknown status"; exit 1 ;;
esac

notify-send -u low "$name" "Attempting to $action..."
if bluetoothctl "$action" "$MAC"; then
	notify-send -u normal "$name" "Successfully ${action}ed."
else
	notify-send -u critical "$name" "Failed to $action."
fi
