#!/bin/sh

if pgrep -x kanshi >/dev/null; then
	choice=$(printf "Yes\nNo\n" |
		fuzzel --dmenu --prompt="Kill existing kanshi? " \
		-w 50% -I -l 2 --no-mouse --match-mode=exact --no-sort)

	case "$choice" in
		Yes)
			kanshictl switch main 2>/dev/null || true
			pkill -x kanshi
			notify-send -u critical "Kanshi" "Killed process!" || true
			exit 0
			;;
		*) exit 0 ;;
	esac
fi

choice=$(printf "Yes\nNo\n" |
	fuzzel --dmenu --prompt="Start kanshi? " \
	-w 50% -I -l 2 --no-mouse --match-mode=exact --no-sort)

case "$choice" in
	Yes)
		kanshi >/dev/null 2>&1 &
		notify-send -u low "Kanshi" "Starting kanshi..."
		sleep 0.4
		;;
	*) exit 0 ;;
esac

if ! pgrep -x kanshi >/dev/null; then
	notify-send -u critical "Kanshi" "Failed to start kanshi" || true
	exit 1
fi

choice=$(printf '%s\n' \
	"Main" \
	"Scale-Main" \
	"Monitor-FHD" \
	"Monitor-UHD" \
	"Mirror" |
	fuzzel --dmenu --prompt="Select display profile: " \
	-w 50% -I -l 5 --no-mouse --match-mode=exact --no-sort)

case "$choice" in
	Main)          kanshictl switch main ;;
	Scale-Main)    kanshictl switch scale-main ;;
	Monitor-FHD)   kanshictl switch monitor-fhd ;;
	Monitor-UHD)   kanshictl switch monitor-uhd ;;
	Mirror)        kanshictl switch mirror ;;
	*) exit 0 ;;
esac

notify-send -u low "Display profile" "Switched to: $choice" || true
