while true; do
     clear
     welcome
     echo -e "${COLOR_GREEN_B}Please select an option or press 'e' to end the script.${COLOR_RESET}\n"
     echo -e "${COLOR_RED_B}(E) Exit${COLOR_RESET}"
     echo -e "(1) Change the titlebar color at the top of Linux apps"
     echo -e "(2) Install Steam on Crostini (Can be unstable)"
     echo -e "(3) Change the desktop icon of a linux app"
     echo -e "(4) Hide a linux desktop app without deleting it"
     echo -e -n "${COLOR_RESET}"
     
     rng=$(( (RANDOM % 100) + 1 ))
     rng1=$(( (RANDOM % 1000) + 1 ))

     read -p "> " -n1 options
     case $options in
          e|E) clear && echo -n "Thank you for using Mozzarella." 
              [ "$rng" -eq 63 ] && echo -e "mamma mia pizza pasta its-a me, mario"
              [ "$rng1" -eq 123 ] && echo -e "${guitar}"
	      echo -e "\n"
              return ;;          
          1) . functions/barcolor.sh ;;
          2) . functions/steam.sh ;;
          3) . functions/icons.sh ;;
          4) . functions/hide.sh ;;
          *) clear && echo -e "${COLOR_RED_B}Invalid option ${options}${COLOR_RESET}" ;;
     esac
done
