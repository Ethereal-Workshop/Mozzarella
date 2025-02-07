#!/bin/bash
function write2sommelier {
r=$(printf '%d' 0x${HEXCODE:0:2})
g=$(printf '%d' 0x${HEXCODE:2:2})
b=$(printf '%d' 0x${HEXCODE:4:2})
echo -e "[Service]\nEnvironment=\"SOMMELIER_FRAME_COLOR=#$HEXCODE\"" > ~/.config/systemd/user/sommelier-x@0.service.d/override.conf

echo -e "The top bar of apps installed using Linux will be $HEXCODE\x1b[48;2;$r;$g;${b}m  \x1b[0m. Press enter to return to the main menu or type 'b' or 'back' to change the color\n"
echo -e "\033[1m\e[34mPLEASE REMEMBER TO SHUT DOWN LINUX AND TURN IT BACK ON!\e[0m\n \x1b[0m"

read -p "" return
case $return in
     b|back) bash ./barcolor.sh ;;
     *) bash ./mozzarella.sh ;;
esac
}


clear
PS1=""
mkdir -p ~/.config/systemd/user/sommelier-x@0.service.d
echo -e "\033[1mChoose a color\e[0m\n"

echo -e "\033[1m\e[31m(E) Exit\e[0m"
echo -e "\033[1m\e[34m(T) Troubleshoot\e[0m\n"

echo -e "(1) #343538 \x1b[48;2;52;53;56m  \x1b[0m (This is the color of the bar in the default terminal app)"
echo -e "(2) #FFFFFF \x1b[48;2;255;255;255m  \x1b[0m"
echo -e "(3) Input your own \x1b[48;2;255;0;0m  \x1b[48;2;255;165;0m  \x1b[48;2;0;255;255m  \x1b[48;2;0;255;0m  \x1b[48;2;0;0;255m  \x1b[48;2;128;0;128m  \x1b[0m\n" 
echo -e "\033[1m\e[33mCatppuccin base colors\e[0m"
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
    echo -e "Latte: #eff1f5\nFrappe: #303446\nMacchiato: #24273a\nMocha: #1e1e2e\n"
    cat ~/.config/systemd/user/sommelier-x@0.service.d/override.conf 
    read -p "" tExit
    case $tExit in
         *) bash ./barcolor.sh
    esac ;;
    *) bash ./mozzarella.sh ;;
esac