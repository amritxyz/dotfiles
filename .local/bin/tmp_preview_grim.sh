#!/bin/sh

GEO=$(slurp -d -w 2 -b '#00000044' -c '#ff0000')
status=$?

if [ "$status" -eq 0 ] && [ -n "$GEO" ]; then
	grim -g "$GEO" - | imv -w float -
fi
