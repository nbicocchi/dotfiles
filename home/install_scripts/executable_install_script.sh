#!/usr/bin/env sh

install_zsh_pkgs() {
  pkgs="zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting
    zsh-completions"
  sudo pacman -S --noconfirm --needed $pkgs
  chsh -s /bin/zsh
}

install_base_cli_pkgs() {
  pkgs="base-devel gdb git gnupg openssh net-tools curl wget mc micro vsftpd
    barrier btop htop gtop chezmoi man-db bat bat-extras duf dua-cli trash-cli 
    lazygit ripgrep neovim neofetch xclip xsel fd lsd stress shellcheck 
    snapper zoxide exfatprogs ctags flatpak starship fzf hunspell hunspell-it 
    hunspell-en_us maven gradle jdk17-openjdk jdk21-openjdk jenv pacman-contrib"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_base_gui_pkgs() {
  pkgs="vlc font-manager thunderbird inkscape lite-xl lollypop filezilla helvum
    foliate handbrake xournalpp signal-desktop nerd-fonts libreoffice-fresh discord gimp 
    conky inkscape cheese gthumb eog evince seahorse gvfs-goa gvfs-google gnome-screenshot
    gnome-sound-recorder gnome-shell-extension-dash-to-panel gnome-shell-extension-desktop-icons-ng
    fragments"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_aur_pkgs() {
  pkgs="cava cavasik shortwave chatgpt-desktop-bin chatgpt-shell-cli docker-desktop
    freetube-bin google-chrome javafx-scenebuilder popcorntime-bin teams visual-studio-code-bin 
    whatsapp-for-linux menulibre adw-gtk3"
  yay -S --aur --noconfirm $pkgs
}

install_flatpak_pkgs() {
  pkgs=""

  for pkg in $pkgs; do
    echo "Installing" "$pkg"...
    flatpak install --system --noninteractive --assumeyes flathub "$pkg" 
  done
}

usage() {
  printf "\nUsage:\n"
  echo " --zsh      Install zsh"
  echo " --base-cli Install base cli pkgs"
  echo " --basi-gui Install base gui pkgs"
  echo " --aur      Install AUR pkgs"
  echo " --flatpak  Install flatpak pkgs"
  exit 1
}

## CLI options
ZSH=false
BASECLI=false
BASEGUI=false
AUR=false
FLATPAK=false

if [ "$#" -eq 0 ]; then 
  usage
fi

while [ "$#" -gt 0 ] ; do
  case "$1" in
    --zsh) ZSH=true ;;
    --base-cli) BASECLI=true ;;
    --base-gui) BASEGUI=true ;;
    --aur) AUR=true ;;
    --flatpak) FLATPAK=true ;;
    *) usage ;;
  esac
  shift
done

"$ZSH" && install_zsh_pkgs
"$BASECLI" && install_base_cli_pkgs
"$BASEGUI" && install_base_gui_pkgs
"$AUR" && install_aur_pkgs
"$FLATPAK" && install_flatpak_pkgs

exit 0


