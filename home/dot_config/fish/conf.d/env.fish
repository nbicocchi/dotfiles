# bin
set -gx PATH $HOME/bin $PATH

# XDG
set -gx XDG_CONFIG_HOME $HOME/.config

# Locale
set -gx LANG en_US.UTF-8

# Terminal
set -gx TERMINAL kitty
set -gx TERM kitty

# GPG
set -gx GPG_TTY (tty)
set -e GPG_AGENT_INFO

# Editor
set -gx VISUAL micro
set -gx EDITOR micro
set -gx SUDO_EDITOR micro

# Java fonts
set -gx JAVA_FONTS /usr/share/fonts/TTF
