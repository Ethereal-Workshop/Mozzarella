#!/bin/bash

clear
echo -e "${BOLD}Hide or unhide an application${COLOR_RESET}\n"

echo -e ""
ls /usr/share/applications | grep ".desktop" | grep -v ".hidden" | sed 's/\.desktop//'
echo -e ""
ls /usr/share/applications | grep ".hidden" | sed 's/\.desktop//' | sed 's/\.hidden/ (hidden)/'
echo -e "\nWrite the application you'd like to hide. This is useful if you want to use an application but don't want the icon. (EX: vim)"
echo -e "${COLOR_RED_B}DO NOT INCLUDE THE 'hidden'!!!${COLOR_RESET}"
read -p "> " desktop
if [ ! -f /usr/share/applications/"$desktop".desktop ] && [ ! -f /usr/share/applications/"$desktop".desktop.hidden ]; then
  echo "The file does not exist. Exiting."
  sleep 0.5
  return
fi

echo -e "[1]Hide or [2]Unhide"
read -p "> " -n1 hide
case $hide in
     1) mv /usr/share/applications/$desktop.desktop /usr/share/applications/$desktop.desktop.hidden ;;
     2) mv /usr/share/applications/$desktop.desktop.hidden /usr/share/applications/$desktop.desktop ;;
     *) ;;
esac
