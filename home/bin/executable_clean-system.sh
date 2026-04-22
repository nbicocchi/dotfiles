#!/bin/bash

echo "🧹 Arch System Cleanup starting..."

# =========================
# 1. Pacman cache
# =========================
echo "📦 Cleaning pacman cache..."
sudo pacman -Sc --noconfirm

# =========================
# 2. Orphan packages
# =========================
echo "🧩 Removing orphan packages..."
orphans=$(pacman -Qtdq 2>/dev/null)

if [ -n "$orphans" ]; then
    sudo pacman -Rns --noconfirm $orphans
else
    echo "✔ No orphan packages found"
fi

# =========================
# 3. Systemd journal logs
# =========================
echo "📜 Cleaning system logs..."
sudo journalctl --vacuum-time=7d

# =========================
# 4. User cache
# =========================
echo "🧼 Cleaning user cache..."
rm -rf ~/.cache/*

# =========================
# 5. Flatpak cleanup (if exists)
# =========================
if command -v flatpak &> /dev/null; then
    echo "📦 Cleaning Flatpak unused runtimes..."
    flatpak uninstall --unused -y
fi

# =========================
# 6. Summary
# =========================
echo "✅ Cleanup completed!"
echo "💡 Tip: reboot not required, but optional for memory reset"
