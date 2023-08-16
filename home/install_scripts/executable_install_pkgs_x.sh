#!/bin/bash

pkglist="conky
rofi
plank
celluloid
font-manager
gedit
geary
gthumb
eog
evince
inkscape
seahorse
transmission-gtk
lollypop
filezilla
vlc
foliate
handbrake
xournalpp
gnome-weather
gnome-system-monitor
gnome-calculator
gnome-disk-utility
gnome-tweaks
gnome-browser-connector
gnome-shell-extensions
gnome-contacts
gnome-sound-recorder
gnome-software
dconf-editor
papirus-icon-theme
ttf-fira-code
ttf-roboto
code
"
echo -e "$pkglist" > pkglist
sudo pacman -S --noconfirm --needed - < pkglist
rm -rf pkglist



