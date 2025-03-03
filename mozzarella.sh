#!/bin/bash
clear
. functions/common.sh
if [ "$(id -u)" -eq 0 ]; then
    . functions/options.sh
else
    [ "$EUID" -ne 0 ] && echo -e "${COLOR_RED_B}Permission Denied. Please re-run Mozzarella as root!${COLOR_RESET}" && read -p "Press enter to exit." && exit
fi