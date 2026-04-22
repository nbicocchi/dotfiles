alias rm='trash'
alias ls='eza --icons'
alias ll='eza --all --long --icons'

alias halt='sudo systemctl poweroff'
alias reboot='sudo systemctl reboot'

alias pacrm="pacman -Qq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs"
alias pacrmorph='pacman -Qtdq | xargs -ro sudo pacman -Rs'  
alias pacrmaur="pacman -Qmq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs"
alias pacrmapp="pacman -Qeq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs"

alias mirrors='sudo reflector --country IT,FR,DE,CH --protocol https --latest 20 --sort rate --save /etc/pacman.d/mirrorlist'

alias update='sudo pacman -Syyu'
alias update-aur='yay -Syyu'

alias server-here='python3 -m http.server 8888'
alias defrag='sudo btrfs fi defrag -r /' 
