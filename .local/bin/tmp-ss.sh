#!/bin/sh

GEO=$(slop -f "%g") || exit 1

TMP=$(mktemp "${XDG_RUNTIME_DIR:-/tmp}/shot.XXXXXX.png") || exit 1
trap 'rm -f "$TMP"' EXIT INT TERM

maim -g "$GEO" "$TMP" || exit 1

xclip -selection clipboard -t image/png -i "$TMP"
notify-send "Temp screenshot" "Copied to clipboard!"
nsxiv -N "float_win" "$TMP"
