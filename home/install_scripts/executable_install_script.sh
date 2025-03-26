#!/usr/bin/env sh

install_base_cli_pkgs() {
  pkgs="zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-completions starship 
    pacman-contrib base-devel gdb git gnupg openssh net-tools curl wget mc micro vsftpd 
    btop chezmoi man-db bat bat-extras dua-cli trash-cli lazygit ripgrep fzf
    neofetch xclip xsel eza shellcheck zoxide exfatprogs hunspell hunspell-it hunspell-en_us pyenv 
    maven gradle jdk21-openjdk jenv"
  sudo pacman -S --noconfirm --needed $pkgs
  chsh -s /bin/zsh
}

install_base_gui_pkgs() {
  pkgs="bleachbit firefox thunderbird lollypop filezilla helvum foliate handbrake xournalpp 
    gimp shortwave helvum vlc cheese gthumb eog evince seahorse gvfs-goa gvfs-google 
    gnome-backgrounds gnome-bluetooth-3.0 gnome-browser-connector gnome-calculator gnome-music 
    gnome-characters gnome-clocks gnome-color-manager gnome-connections gnome-console
    gnome-disk-utility gnome-remote-desktop gnome-screenshot gnome-sound-recorder gnome-text-editor 
    gnome-tweaks gnome-weather fragments resources"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_aur_pkgs() {
  pkgs="cava cavasik shortwave docker-desktop lazydocker javafx-scenebuilder 
  google-chrome visual-studio-code-bin wps-office popcorntime-bin adw-gtk3"
  yay -S --aur --noconfirm $pkgs
}

install_flatpak_pkgs() {
  pkgs=""

  for pkg in $pkgs; do
    echo "Installing" "$pkg"...
    flatpak install --system --noninteractive --assumeyes flathub "$pkg" 
  done
}

install_yay() {
  pkgs="base-devel git"
  sudo pacman -S --noconfirm --needed $pkgs
  cd /tmp
  rm -rf yay
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si
}

usage() {
  printf "\nUsage:\n"
  echo " --base-cli Install base cli pkgs"
  echo " --base-gui Install base gui pkgs"
  echo " --aur      Install AUR pkgs"
  echo " --flatpak  Install flatpak pkgs"
  exit 1
}

## main
BASECLI=false
BASEGUI=false
AUR=false
FLATPAK=false

while [ "$#" -gt 0 ] ; do
  case "$1" in
    --base-cli) BASECLI=true ;;
    --base-gui) BASEGUI=true ;;
    --aur) AUR=true ;;
    --flatpak) FLATPAK=true ;;
    *) usage ;;
  esac
  shift
done

"$BASECLI" || "$BASEGUI" || "$AUR" || "$FLATPAK" || usage

sudo pacman -Syyu --noconfirm
if ! pacman -Qs yay >/dev/null 2>&1; then
  install_yay
fi

"$BASECLI" && install_base_cli_pkgs
"$BASEGUI" && install_base_gui_pkgs
"$AUR" && install_aur_pkgs
"$FLATPAK" && install_flatpak_pkgs

exit 0


