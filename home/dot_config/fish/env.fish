# bin
set -x PATH $HOME/bin $PATH

# jenv
set -x PATH $HOME/.jenv/bin $PATH

# XDG
set -x XDG_CONFIG_HOME $HOME/.config

# Locale
set -x LANG en_US.UTF-8

# Terminal
set -x TERMINAL alacritty
set -x TERM alacritty

# GPG
set -x GPG_TTY (tty)
set -x GPG_AGENT_INFO ""

# Editor
set -x VISUAL micro
set -x EDITOR micro
set -x SUDO_EDITOR micro

# Java fonts
set -x JAVA_FONTS /usr/share/fonts/TTF
