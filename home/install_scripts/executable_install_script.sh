#!/usr/bin/env sh

install_base_cli_pkgs() {
  pkgs="zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-completions starship 
    pacman-contrib base-devel gdb git gnupg openssh net-tools curl wget mc micro vsftpd 
    btop chezmoi man-db bat bat-extras dua-cli trash-cli lazygit ripgrep fzf
    neovim neofetch xclip xsel fd eza shellcheck snapper zoxide exfatprogs ctags 
    hunspell hunspell-it hunspell-en_us 
    maven gradle jdk17-openjdk jdk21-openjdk jenv
    pyenv"
  sudo pacman -S --noconfirm --needed $pkgs
  chsh -s /bin/zsh
}

install_base_gui_pkgs() {
  pkgs="nerd-fonts font-manager firefox thunderbird lite-xl lollypop filezilla
    helvum foliate handbrake xournalpp signal-desktop libreoffice-fresh discord gimp conky vlc 
    cheese gthumb eog evince seahorse gvfs-goa gvfs-google 
    gnome-autoar gnome-backgrounds gnome-bluetooth-3.0 gnome-browser-connector gnome-calculator 
    gnome-characters gnome-clocks gnome-color-manager gnome-connections gnome-console
    gnome-control-center gnome-desktop gnome-desktop-4 gnome-desktop-common gnome-disk-utility
    gnome-keybindings gnome-keyring gnome-logs gnome-maps gnome-menus gnome-online-accounts
    gnome-remote-desktop gnome-screenshot gnome-session gnome-settings-daemon gnome-shell
    gnome-sound-recorder gnome-system-monitor gnome-text-editor gnome-tweaks gnome-user-docs
    gnome-user-share gnome-video-effects gnome-weather fragments"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_aur_pkgs() {
  pkgs="cava cavasik shortwave chatgpt-desktop-bin docker-desktop javafx-scenebuilder 
  google-chrome visual-studio-code-bin popcorntime-bin menulibre adw-gtk3"
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


