while true; do
     echo -e "${COLOR_RED_B}Please select an option or press 'e' to end the script.${COLOR_RESET}\n"
     echo -e "${COLOR_RED_B}(E) Exit${COLOR_RESET}"
     echo -e "(1) Change the titlebar color at the top of Linux apps"

     read -p "> " -n1 options
     case $options in
          e|E) clear && exit ;;
          1) . functions/barcolor.sh ;;
          *) clear && echo -e "${COLOR_RED_B}Invalid option ${options}${COLOR_RESET}" ;;
     esac
done