#!/bin/bash
#
# MangoWM Autostart Script

set +e

# Current theme mode
MODE=$(cat ~/.config/mango/mode 2>/dev/null || cat ~/.local/share/darkman/mode 2>/dev/null || echo "light")
if [ "$MODE" = "dark" ]; then
    GTK_THEME="Adwaita:dark"
    GTK_NAME="Adwaita-dark"
    COLOR_SCHEME="prefer-dark"
    BG="000000"
else
    GTK_THEME="Adwaita:light"
    GTK_NAME="Adwaita"
    COLOR_SCHEME="prefer-light"
    BG="ffffff"
fi

# Terminal daemon
foot --server >/dev/null 2>&1 &

# Status bar and background
waybar >/dev/null 2>&1 &
swaybg -c "$BG" >/dev/null 2>&1 &

# Polkit authentication
systemctl --user start polkit-qt6 >/dev/null 2>&1 &

# DBus & systemd environments
dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP GTK_THEME="$GTK_THEME" >/dev/null 2>&1 &

# GNOME / GTK settings
gsettings set org.gnome.desktop.interface color-scheme "$COLOR_SCHEME"
gsettings set org.gnome.desktop.interface gtk-theme "$GTK_NAME"
gsettings set org.gnome.desktop.interface cursor-theme 'Adwaita'
gsettings set org.gnome.desktop.interface cursor-size 16
gsettings set org.gnome.desktop.interface font-name 'sans 12'
gsettings set org.gnome.desktop.interface monospace-font-name 'mono 9'
gsettings set org.gnome.desktop.wm.preferences button-layout 'none'
gsettings set org.gnome.desktop.wm.preferences action-double-click-titlebar 'none'
gsettings set org.gnome.desktop.wm.preferences action-middle-click-titlebar 'none'
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'none'

# Portals
systemctl --user restart xdg-desktop-portal >/dev/null 2>&1 &
/usr/lib/xdg-desktop-portal-wlr >/dev/null 2>&1 &

# Clipboard management
wl-clip-persist --clipboard regular --reconnect-tries 0 >/dev/null 2>&1 &
wl-paste --type text --watch cliphist store >/dev/null 2>&1 &
