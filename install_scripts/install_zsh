#!/bin/bash

pkglist="zsh
zsh-autosuggestions
zsh-history-substring-search
zsh-syntax-highlighting
zsh-completions
starship
fzf
"

echo -e "$pkglist" > pkglist
sudo pacman -S --noconfirm --needed - < pkglist
rm -rf pkglist