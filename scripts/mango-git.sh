#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RICE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$SCRIPT_DIR/common.sh"

MANGO_DIR="$HOME/.local/src/mango"

log "Cloning Mango WM..."
mkdir -p "$HOME/.local/src"

# Clone Mango WM
if [[ ! -d "$MANGO_DIR" ]]; then
	git clone --depth=1 -b master https://github.com/amritxyz/mango.git "$MANGO_DIR"
	make -C "$MANGO_DIR"
	sudo make -C "$MANGO_DIR" PREFIX=/usr install

	success "Installed Mango WM."
else
	warn "Mango WM already exists. Skipping."
fi
