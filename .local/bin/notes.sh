#!/bin/sh

folder="$HOME/.local/dox/notes/mds/"
bakdir="/opt/void/bak/notes"
mkdir -p "$folder" "$bakdir"
TERMINAL="foot"

do_backup() {
	src="$1"
	[ -f "$src" ] || exit 1
	cp "$src" "$bakdir/$(basename "$src")"
}

open_nvim() {
	filepath="$1"
	script_path="$(realpath "$0")"   # absolute path so nvim can call back

	nvim_cmd="autocmd BufWritePost /home/void/.local/dox/notes/mds/*.md silent !sh '${script_path}' --backup <afile>:p"

	setsid -f "$TERMINAL" -e nvim \
		-c "$nvim_cmd" \
		"$filepath" >/dev/null 2>&1
}

if [ "$1" = "--backup" ]; then
	do_backup "$2"
	exit 0
fi

newnote() {
	[ -z "$name" ] && name=$(date +%F_%H-%M-%S)
	name=$(echo "tmp_$name" | sed 's/[[:space:]]\+/_/g')
	open_nvim "${folder}${name}.md"
}

selected() {
	files=$(find "$folder" -maxdepth 1 -name "*.md" -type f -printf '%f\n' | \
		sed 's/\.md$//' | sed 's/_/ /g' | sort -r)
	choices=$(printf "new\n$files")
	choice=$(printf '%s\n' "$choices" | fuzzel --no-mouse --dmenu --match-mode=exact --no-sort \
		--prompt "Note name: " -w 50% -I -l 10)
	[ -z "$choice" ] && exit 0

	case "$choice" in
		"new")
			newnote ;;
		*)
			filename=$(echo "$choice" | sed 's/[[:space:]]\+/_/g')
			filepath="${folder}${filename}.md"
			[ ! -f "$filepath" ] && echo "# $choice" > "$filepath"
			open_nvim "$filepath"
			;;
	esac
}

selected
