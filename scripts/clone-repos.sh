#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
RICE_DIR="$(cd "$SCRIPT_DIR/.." && pwd)"
source "$SCRIPT_DIR/common.sh"

log "Cloning personal repositories..."

# Clone Neovim config
if [[ ! -d "$HOME/.config/nvim" ]]; then
	git clone --depth=1 https://codeberg.org/amrit/nvim.git "$HOME/.config/nvim"
	success "Cloned Neovim config."
else
	warn "Neovim config already exists. Skipping."
fi

# Clone wallpaper dir
if [[ ! -d "$HOME/.local/share/arch-wall" ]]; then
	git clone --depth=1 https://codeberg.org/amritxyz/arch-wall.git "$HOME/.local/share/arch-wall"
	success "Cloned wallpaper dir."
else
	warn "wallpaper dir already exists. Skipping."
fi

# Move dotfiles repo into ~/.local/git-repos
mv "$RICE_DIR" "$HOME/.local/git-repos/dotfiles"

export XDG_STATE_HOME="$HOME/.local/state"
export HISTFILE="$XDG_STATE_HOME/bash/history"
mkdir -p "$XDG_STATE_HOME/bash"
rm -rf $HOME/.bash_history
rm -rf ~/.wget-hsts

echo
success "Dotfiles and rice successfully set up."
