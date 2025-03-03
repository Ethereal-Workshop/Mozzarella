while true; do
     clear
     welcome
     echo -e "${COLOR_RED_B}Please select an option or press 'e' to end the script.${COLOR_RESET}\n"
     echo -e "${COLOR_RED_B}(E) Exit${COLOR_RESET}"
     echo -e "(1) Change the titlebar color at the top of Linux apps"
     echo -e "(2) Install Steam on ChromeOS (Can be unstable)"
     
     rng=$(( (RANDOM % 100) + 1 ))

     read -p "> " -n1 options
     case $options in
          e|E) clear && echo -n "Thank you for using Mozzarella." 
              [ "$rng" -eq 63 ] && echo -e "mamma mia pizza pasta its-a me, mario"
	      echo -e "\n"
              return ;;          
          1) . functions/barcolor.sh ;;
          2) . functions/steam.sh ;;
          *) clear && echo -e "${COLOR_RED_B}Invalid option ${options}${COLOR_RESET}" ;;
     esac
done
