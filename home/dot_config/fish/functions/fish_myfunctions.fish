# rm -> trash
function rm
    trash $argv
end

# ls -> eza
function ls
    eza --icons $argv
end

function ll
    eza --all --long --icons $argv
end

# power
function halt
    sudo systemctl poweroff
end

function reboot
    sudo systemctl reboot
end

# pacman tools
function pacrm
    pacman -Qq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs
end

function pacrmorph
    pacman -Qtdq | xargs -ro sudo pacman -Rs
end

function pacrmaur
    pacman -Qmq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs
end

function pacrmapp
    pacman -Qeq | fzf --reverse --multi --preview 'pacman -Qil {}' | xargs -ro sudo pacman -Rs
end

# mirrors
function mirrors
    sudo reflector --country IT,FR,DE,CH --protocol https --latest 20 --sort rate --save /etc/pacman.d/mirrorlist
end

# updates
function update
    sudo pacman -Syyu
end

function update-aur
    yay -Syyu
end

# simple server
function server-here
    python3 -m http.server 8888
end

# btrfs
function defrag
    sudo btrfs fi defrag -r /
end
