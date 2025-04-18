alias rm='trash'
alias ls='eza --icons'
alias ll='eza --all --long --icons'

alias halt='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'

alias pacrm="pacman -Qq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs"
alias pacrmorph='pacman -Qtdq | xargs -ro sudo pacman -Rs'  
alias pacrmaur="pacman -Qmq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs"
alias pacrmapp="pacman -Qeq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs"

alias update='yay -Syyu; sudo paccache -rk3; yay -Sc --aur --noconfirm'

alias server-here='python3 -m http.server 8888'
alias defrag='sudo btrfs fi defrag -r /' 
