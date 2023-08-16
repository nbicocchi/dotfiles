#!/bin/bash

pkglist="com.google.Chrome
com.google.EarthPro
io.github.TheWisker.Cavasik
de.haeckerfelix.Shortwave
com.valvesoftware.Steam
com.github.hugolabe.Wike
com.github.rafostar.Clapper
io.missioncenter.MissionCenter
com.sublimetext.three
"

for pkg in $pkglist; do
  flatpak install --system --noninteractive --assumeyes flathub "$pkg"
done