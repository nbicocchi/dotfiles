#!/bin/bash

pkglist="chezmoi
base-devel
git
gnupg
openssh
net-tools
curl
wget
mc
micro
barrier
btop
htop
man-db
bat
ncdu
dust
duf
dua-cli
trash-cli
lazygit
ranger
ripgrep
neovim
neofetch
xclip
xsel
fd
lsd
ncdu
iotop
stress
dfc
snapper
zoxide
diskus
tailscale
exfatprogs
flatpak
"

echo -e "$pkglist" > pkglist
sudo pacman -S --noconfirm --needed - < pkglist
rm -rf pkglist



