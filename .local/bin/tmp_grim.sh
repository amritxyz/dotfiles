#!/bin/sh

GEO=$(slurp -d -w 2 -b '#00000044' -c '#ff0000') || exit 1

TMP=$(mktemp "${XDG_RUNTIME_DIR:-/tmp}/shot.XXXXXX.png") || exit 1
trap 'rm -f "$TMP"' EXIT INT TERM

grim -g "$GEO" "$TMP" || exit 1

wl-copy < "$TMP"
notify-send "Temp screenshot" "Copied to clipboard!"
imv -w float "$TMP"
