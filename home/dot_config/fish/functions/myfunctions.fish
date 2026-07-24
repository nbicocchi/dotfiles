# --- fs ---

function rm
    command trash $argv
end

function ls
    eza -a --color=always --group-directories-first --icons=auto $argv
end

function ll
    eza -la --color=always --group-directories-first --icons=auto --git $argv
end

function lt
    eza -aT --color=always --group-directories-first --icons=auto $argv
end


# --- system ---

function halt
    sudo systemctl poweroff
end

function reboot
    sudo systemctl reboot
end


# --- pacman ---

function pacrm
    pacman -Qq | fzf --multi --preview 'pacman -Qi {}' | xargs -ro sudo pacman -Rs
end

function pacrmorph
    pacman -Qtdq | xargs -ro sudo pacman -Rs
end

function pacrmaur
    pacman -Qmq | fzf --multi --preview 'pacman -Qi {}' | xargs -ro sudo pacman -Rs
end

function pacrmapp
    pacman -Qeq | fzf --multi --preview 'pacman -Qi {}' | xargs -ro sudo pacman -Rs
end

function update
    sudo pacman -Syu
end

function update-aur
    yay -Syu
end

function mirrors
    sudo reflector --country IT,FR,DE,CH \
        --protocol https --latest 20 \
        --sort rate \
        --save /etc/pacman.d/mirrorlist
end


# --- tools ---

function server-here
    python3 -m http.server 8888
end

function defrag
    sudo btrfs filesystem defragment -r /
end
