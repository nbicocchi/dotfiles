#!/bin/bash

# =========================
# 🎨 STILI
# =========================
GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
RED="\e[31m"
BOLD="\e[1m"
RESET="\e[0m"

section() {
    echo -e "\n${BOLD}${BLUE}========================================"
    echo -e " $1"
    echo -e "========================================${RESET}\n"
}

ok() { echo -e "${GREEN}✔ $1${RESET}"; }
warn() { echo -e "${YELLOW}⚠ $1${RESET}"; }
err() { echo -e "${RED}❌ $1${RESET}"; }

run() {
    echo -e "${BLUE}→ $*${RESET}"
    "$@" && ok "Done" || err "Failed"
}

# =========================
# SPACE FUNCTIONS
# =========================
get_free_space() {
    df / | awk 'NR==2 {print $4}'
}

format_mb() {
    echo $(( $1 / 1024 ))
}

# =========================
# START REPORT
# =========================
section "📊 SYSTEM SPACE REPORT (BEFORE)"

FREE_BEFORE=$(get_free_space)
echo "💾 Free space before: $(format_mb $FREE_BEFORE) MB"

# =========================
# START CLEANUP
# =========================
section "🧹 ARCH SYSTEM CLEANUP STARTING"

# =========================
# PACMAN CACHE
# =========================
section "📦 Pacman deep cache cleanup"
run sudo pacman -Scc --noconfirm

# =========================
# ORPHANS
# =========================
section "🧩 Removing orphan packages"

orphans=$(pacman -Qtdq 2>/dev/null)

if [ -n "$orphans" ]; then
    echo "$orphans"
    run sudo pacman -Rns --noconfirm $orphans
else
    warn "No orphan packages"
fi

# =========================
# JOURNALD
# =========================
section "📜 System logs cleanup"
run sudo journalctl --vacuum-time=7d
run sudo journalctl --vacuum-size=250M

# =========================
# USER CACHE
# =========================
section "🧼 User cache cleanup"
run find "$HOME/.cache" -mindepth 1 -delete

# =========================
# FLATPAK
# =========================
section "📦 Flatpak cleanup"

if command -v flatpak &> /dev/null; then
    run flatpak uninstall --unused --delete-data -y
    run flatpak repair
else
    warn "Flatpak not installed"
fi

# =========================
# DEV CACHE
# =========================
section "🧃 Developer caches"

command -v npm &> /dev/null && run npm cache clean --force
run find ~/.cache/pip -mindepth 1 -delete 2>/dev/null

# =========================
# SSD TRIM
# =========================
section "⚡ SSD TRIM"
command -v fstrim &> /dev/null && run sudo fstrim -av || warn "fstrim not available"

# =========================
# FINAL SPACE REPORT
# =========================
section "📊 SYSTEM SPACE REPORT (AFTER)"

FREE_AFTER=$(get_free_space)

echo "💾 Free space after:  $(format_mb $FREE_AFTER) MB"

# DIFFERENCE
DIFF=$((FREE_AFTER - FREE_BEFORE))

if [ $DIFF -gt 0 ]; then
    echo -e "🧽 Space freed: ${GREEN}$(format_mb $DIFF) MB${RESET}"
else
    echo -e "🧽 Space freed: ${YELLOW}0 MB (or cached differently accounted)${RESET}"
fi

# =========================
# FINISH
# =========================
section "✅ CLEANUP COMPLETED"

echo -e "${BOLD}💡 Tip:${RESET} reboot optional after heavy cleanup"
