#!/bin/bash

[ "$EUID" -ne 0 ] && echo -e "\033[1;31mPlease re-run Mozzarella as root!\033[0m" && exit 1

clear
. functions/common.sh
. functions/options.sh
