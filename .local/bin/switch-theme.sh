#!/bin/sh

set -u

choice=$(printf 'Dark\nLight\n' |
	fuzzel --dmenu --prompt="Theme: " -w 30% -I -l 2 --no-mouse
) || exit 1

case "$choice" in
	Dark)  mode=dark ;;
	Light) mode=light ;;
	*) exit 1 ;;
esac

exec "$HOME/.local/share/darkman/bin/theme-set" "$mode"
