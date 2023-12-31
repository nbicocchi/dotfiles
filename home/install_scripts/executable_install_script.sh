#!/usr/bin/env sh

install_zsh_pkgs() {
  pkgs="zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting
    zsh-completions"
  sudo pacman -S --noconfirm --needed $pkgs
  chsh -s /bin/zsh
}

install_pandoc_pkgs() {
  pkgs="pandoc texlive-basic texlive-latex texlive-latexextra texlive-fontsrecommended
    texlive-fontsextra texlive-pictures texlive-langitalian"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_base_cli_pkgs() {
  pkgs="base-devel gdb git gnupg openssh net-tools curl wget mc micro
    barrier btop htop gtop chezmoi man-db bat bat-extras duf dua-cli trash-cli 
    lazygit ripgrep neovim neofetch xclip xsel fd lsd stress shellcheck 
    snapper zoxide exfatprogs ctags flatpak starship fzf rate-mirrors"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_base_gui_pkgs() {
  pkgs="vlc font-manager geary gthumb eog evince inkscape seahorse transmission-gtk 
    lollypop filezilla foliate handbrake xournalpp cheese signal-desktop dconf-editor 
    gvfs-goa gvfs-google papirus-icon-theme nerd-fonts libreoffice-fresh rawtherapee
    discord gimp conky gnome-screenshot"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_aur_pkgs() {
  pkgs="cava cavasik docker-desktop freetube-bin google-chrome popcorntime-bin 
    tela-icon-theme tor-browser-bin unigine-benchmarks-meta visual-studio-code-bin 
    whatsapp-for-linux zoom sublime-text-4"
  yay --noconfirm $pkgs
}

install_flatpak_pkgs() {
  pkgs="de.haeckerfelix.Shortwave com.valvesoftware.Steam 
    io.missioncenter.MissionCenter org.tenacityaudio.Tenacity
    net.supertuxkart.SuperTuxKart org.tuxpaint.Tuxpaint"

  for pkg in $pkgs; do
    echo "Installing" "$pkg"...
    flatpak install --system --noninteractive --assumeyes flathub "$pkg" 
  done
}

usage() {
  printf "\nUsage:\n"
  echo " --zsh      Install zsh"
  echo " --pandoc   Install pandoc"
  echo " --base-cli Install base cli pkgs"
  echo " --basi-gui Install base gui pkgs"
  echo " --aur      Install AUR pkgs"
  echo " --flatpak  Install flatpak pkgs"
  exit 1
}

## CLI options
ZSH=false
PANDOC=false
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
    --pandoc) PANDOC=true ;;
    --base-cli) BASECLI=true ;;
    --base-gui) BASEGUI=true ;;
    --aur) AUR=true ;;
    --flatpak) FLATPAK=true ;;
    *) usage ;;
  esac
  shift
done

"$ZSH" && install_zsh_pkgs
"$PANDOC" && install_pandoc_pkgs
"$BASECLI" && install_base_cli_pkgs
"$BASEGUI" && install_base_gui_pkgs
"$AUR" && install_aur_pkgs
"$FLATPAK" && install_flatpak_pkgs

exit 0


