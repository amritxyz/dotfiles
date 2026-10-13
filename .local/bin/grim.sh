#!/bin/sh

SAVE_DIR="$HOME/.local/img/ss"
mkdir -p "$SAVE_DIR"

max=0
for f in "$SAVE_DIR"/*_screenshot.png; do
	[ -e "$f" ] || continue
	n=${f##*/}
	n=${n%%_*}
	case $n in
	*[!0-9]*) ;; 
	*) [ $n -gt $max ] && max=$n
	esac
done

next=$((max + 1))
file="$SAVE_DIR/${next}_screenshot.png"

region=$(slurp -d -w 2 -b '#00000044' -c '#ff0000') || exit 1
grim -g "$region" "$file" && wl-copy < "$file"
notify-send -u normal "${next}_screenshot.png" "copied to clipboard!"
