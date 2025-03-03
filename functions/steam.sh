#!/bin/bash

if apt list --installed 2>/dev/null | grep -q steam-launcher; then
    echo -e "\nSteam is already installed."
else
    echo -e "\n"
    curl -LOk https://cdn.cloudflare.steamstatic.com/client/installer/steam.deb
    sudo dpkg -i steam.deb
    sudo apt update
    sudo dpkg --add-architecture i386
    sudo apt update &&  sudo apt --fix-broken install && sudo apt upgrade
    sudo apt-get install --reinstall libgl1-mesa-glx:i386
    sudo apt update
    sudo rm -f steam.deb
    echo -e "${COLOR_RED_B}NOTE: WHEN RUNNING THE APP, IT MAY SHOW AN ERROR AND PROMPT A LOGIN. IGNORE IT. IT DOESN'T AFFECT ANYTHING. SADLY A RESULT OF CHROMEOS'S VM.${COLOR_RESET}"
fi
echo -e "Hide xterm and uxterm from the application menu? (y/n/[u]nhide)"
read -p "> " -n1 xterm
     case $xterm in
          y|Y) sudo mv /usr/share/applications/debian-xterm.desktop /usr/share/applications/debian-xterm.desktop.hidden &&  sudo mv /usr/share/applications/debian-uxterm.desktop /usr/share/applications/debian-uxterm.desktop.hidden ;;
          n|N) ;;
          u|U)  sudo mv /usr/share/applications/debian-xterm.desktop.hidden /usr/share/applications/debian-xterm.desktop &&  sudo mv /usr/share/applications/debian-uxterm.desktop.hidden /usr/share/applications/debian-uxterm.desktop ;;
esac

