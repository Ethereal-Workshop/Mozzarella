#!/bin/bash

clear
echo -e "${BOLD}Install ${COLOR_BLUE_B}Steam${COLOR_RESET}${BOLD} on Crostini ${COLOR_RESET}\n"

fail() {
    # special one time use case! kill me
    printf "%b\n" "$*" >&2 || :
    exit 1
}

[ "$EUID" -ne 0 ] && echo -e "${COLOR_RED_B}Please re-run Mozzarella as root to install Steam!${COLOR_RESET}" && read -p "Press enter to return to the main menu." && return

ID=
ID_LIKE=
# failsafes

. /etc/os-release || fail "${COLOR_RED_B}os-release not found! Failing.${COLOR_RESET}"

if [[ "$ID" != "debian" && "$ID_LIKE" != *"debian"* ]]; then
    echo -e "${COLOR_RED_B}Mozzarella currently only supports installing Steam on Debian.${COLOR_RESET}"
    read -p "Press enter to return to the main menu."
    return
fi

if apt list --installed 2>/dev/null | grep -q steam-launcher; then
    echo -e "\nSteam is already installed."
else
    echo -e "\n"
    curl -LOk https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
    dpkg -i steam.deb
    apt update
    dpkg --add-architecture i386
    apt update && apt --fix-broken install && apt upgrade
    apt install --reinstall libgl1-mesa-glx:i386
    apt update
    rm -f steam.deb
    echo -e "${COLOR_RED_B}NOTE: WHEN RUNNING THE APP, IT MAY SHOW AN ERROR AND PROMPT A LOGIN. IGNORE IT. IT DOESN'T AFFECT ANYTHING. SADLY A RESULT OF CHROMEOS'S VM.${COLOR_RESET}"
fi
echo -e "Hide xterm and uxterm from the application menu? (y/n/[u]nhide)"
read -p "> " -n1 xterm
     case $xterm in
          y|Y) mv /usr/share/applications/debian-xterm.desktop /usr/share/applications/debian-xterm.desktop.hidden &&  mv /usr/share/applications/debian-uxterm.desktop /usr/share/applications/debian-uxterm.desktop.hidden ;;
          n|N) ;;
          u|U) mv /usr/share/applications/debian-xterm.desktop.hidden /usr/share/applications/debian-xterm.desktop &&  mv /usr/share/applications/debian-uxterm.desktop.hidden /usr/share/applications/debian-uxterm.desktop ;;
esac

