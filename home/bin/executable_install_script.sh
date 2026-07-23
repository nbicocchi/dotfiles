```sh
#!/usr/bin/env sh

install_base_cli_pkgs() {
  pkgs="pacman-contrib base-devel git gnupg openssh net-tools curl wget mc yazi micro
    btop chezmoi bat bat-extras dua-cli trash-cli lazygit ripgrep fzf
    fd xclip xsel eza shellcheck zoxide exfatprogs hunspell hunspell-it hunspell-en_us"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_java_pkgs() {
  pkgs="maven gradle jdk21-openjdk"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_base_gui_pkgs() {
  pkgs=""
  sudo pacman -S --noconfirm --needed $pkgs
}

install_aur_pkgs() {
  pkgs=""
  yay -S --aur --noconfirm $pkgs
}

install_flatpak_pkgs() {
  pkgs=""

  for pkg in $pkgs; do
    echo "Installing $pkg..."
    flatpak install --system --noninteractive --assumeyes flathub "$pkg"
  done
}

usage() {
  printf "\nUsage:\n"
  echo " --base-cli Install base cli pkgs"
  echo " --base-gui Install base gui pkgs"
  echo " --java     Install Java pkgs"
  echo " --aur      Install AUR pkgs"
  echo " --flatpak  Install flatpak pkgs"
  exit 1
}

## main
BASECLI=false
BASEGUI=false
JAVA=false
AUR=false
FLATPAK=false

while [ "$#" -gt 0 ]; do
  case "$1" in
    --base-cli) BASECLI=true ;;
    --base-gui) BASEGUI=true ;;
    --java) JAVA=true ;;
    --aur) AUR=true ;;
    --flatpak) FLATPAK=true ;;
    *) usage ;;
  esac
  shift
done

"$BASECLI" || "$BASEGUI" || "$JAVA" || "$AUR" || "$FLATPAK" || usage

sudo pacman -Syyu --noconfirm
sudo pacman -S --noconfirm yay

"$BASECLI" && install_base_cli_pkgs
"$BASEGUI" && install_base_gui_pkgs
"$JAVA" && install_java_pkgs
"$AUR" && install_aur_pkgs
"$FLATPAK" && install_flatpak_pkgs

exit 0
```
