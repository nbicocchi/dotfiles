#!/bin/bash

pkglist="pandoc
texlive-basic
texlive-latex
texlive-latexextra
texlive-fontsrecommended
texlive-fontsextra
texlive-pictures
texlive-langitalian
"

echo -e "$pkglist" > pkglist
sudo pacman -S --noconfirm --needed - < pkglist
rm -rf pkglist