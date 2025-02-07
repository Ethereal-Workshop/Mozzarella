#!/bin/bash
function write2sommelier {
	r=$(printf '%d' 0x${HEXCODE:0:2})
	g=$(printf '%d' 0x${HEXCODE:2:2})
	b=$(printf '%d' 0x${HEXCODE:4:2})
	echo -e "[Service]\nEnvironment=\"SOMMELIER_FRAME_COLOR=#$HEXCODE\"" > ~/.config/systemd/user/sommelier-x@0.service.d/override.conf

	echo -e "The top bar of apps installed using Linux will be $HEXCODE \x1b[48;2;$r;$g;${b}m  \x1b[0m. Press enter to return to the main menu or press 'b' to change the color.\n"
	echo -e "${COLOR_PURPLE_B}PLEASE REMEMBER TO SHUT DOWN LINUX AND TURN IT BACK ON!\e[0m\n \x1b[0m"

	read -p "" -n1 return
	case $return in
		b|B) . functions/barcolor.sh ;;
		*) clear && welcome ;;
	esac
}


clear
PS1=""
mkdir -p ~/.config/systemd/user/sommelier-x@0.service.d
echo -e "${BOLD}Choose a color${COLOR_RESET}\n"

echo -e "${COLOR_RED_B}(E) Exit${COLOR_RESET}"
echo -e "${COLOR_PURPLE_B}(T) Troubleshoot${COLOR_RESET}\n"

echo -e "(1) Default ${RGB_DEFAULT}"
echo -e "(2) White ${RGB_WHITE}"
echo -e "(3) Input your own ${RGB_RAINBOW}\n" 

echo -e "${COLOR_LIGHT_YELLOW_B}Catppuccin base colors${COLOR_RESET}"
echo -e "(l) Latte"
echo -e "(f) Frappe"
echo -e "(ma) Macchiato"
echo -e "(mo) Mocha"

read -p "> " color
case $color in
    1) HEXCODE="343538" 
	write2sommelier;;
    2) HEXCODE="FFFFFF" 
	write2sommelier ;;
    3) read -p "Enter your custom hex code: #" HEXCODE  
	write2sommelier;;
    l) HEXCODE="eff1f5"  
	write2sommelier;;
    f) HEXCODE="303446"  
	write2sommelier;;
    ma) HEXCODE="24273a"  
	write2sommelier;;
    mo) HEXCODE="1e1e2e"  
	write2sommelier;;
    e|E) bash ./mozzarella.sh ;;
    t|T) echo -e "Check to make sure your chosen hexcode is in the results, and then press enter to return to mozzarella.\n"
    echo -e "Default: #343538\nWhite: #FFFFFF\nCustom: ${HEXCODE}\nLatte: #eff1f5\nFrappe: #303446\nMacchiato: #24273a\nMocha: #1e1e2e\n"
    cat ~/.config/systemd/user/sommelier-x@0.service.d/override.conf 
    read -p "" tExit
    case $tExit in
	    *) . functions/barcolor.sh
    esac ;;
    *) . functions/barcolor.sh ;;
esac