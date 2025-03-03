#!/bin/bash
if [ "$(id -u)" -eq 0 ]; then
    clear
    . functions/common.sh
    . functions/options.sh
else
    [ "$EUID" -ne 0 ] && echo -e "\033[1;31mPermission Denied. Please re-run Mozzarella as root!\033[0m" && exit
fi