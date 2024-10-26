#!/usr/bin/env sh

install_cli_pkgs() {
  pkgs="zsh zsh-autosuggestions zsh-history-substring-search zsh-syntax-highlighting zsh-completions starship 
    pacman-contrib base-devel gdb git openssh net-tools curl wget mc micro btop chezmoi man-db bat bat-extras dua-cli trash-cli lazygit ripgrep fzf neovim neofetch xclip xsel fd eza shellcheck snapper zoxide exfatprogs ctags
    jenv pyenv"
  sudo pacman -S --noconfirm --needed $pkgs
  chsh -s /bin/zsh
}

install_gui_pkgs() {
  pkgs="firefox thunderbird lollypop filezilla"
  sudo pacman -S --noconfirm --needed $pkgs
}

install_aur_pkgs() {
  pkgs="google-chrome visual-studio-code-bin"
  yay -S --aur --noconfirm $pkgs
}

update_system() {
  sudo pacman -S --noconfirm --needed archlinux-keyring
  sudo pacman -Syyu
}

reboot() {
  sudo reboot
}

update_system
install_cli_pkgs
install_gui_pkgs
install_aur_pkgs
reboot

exit 0



