update-mirrors() {
    TMPFILE=$(mktemp)
    MIRROR_LIST="/etc/pacman.d/mirrorlist"
    MIRROR_BACK="/etc/pacman.d/mirrorlist.backup"
    
    sudo true
    echo "--> Fetching and ranking mirror list..."
    curl -s "https://archlinux.org/mirrorlist/?country=FR&country=IT&country=DE&country=CH&protocol=https&use_mirror_status=on" | sed -e "s/^#Server/Server/" -e "/^#/d" | rankmirrors -v -n 10 - | tee $TMPFILE || (echo "Failed"; return)
    
    echo "--> Updating" "$MIRROR_LIST"... 
    [ -r "$MIRROR_LIST" ] && sudo mv "$MIRROR_LIST" "$MIRROR_BACK"
    sudo mv $TMPFILE /etc/pacman.d/mirrorlist
    
    echo "--> Dropping cache..." 
    sudo paccache -rk3; yay -Sc --aur --noconfirm
}
