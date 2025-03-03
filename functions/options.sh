while true; do
     clear
     echo -e "${ascii}"
     echo -e "\n${COLOR_GREEN_B}Welcome to Mozzarella! Made by Ethereal Workshop\e[0m\n"
     echo -e "${BOLD}Credits:${COLOR_RESET}"
     echo -e "- Sophie: Made the script and came up with the name"
     echo -e "- Archimax: Tried to make ASCII art for this script"


     echo -e "${COLOR_RED_B}Please select an option or press 'e' to end the script.${COLOR_RESET}\n"
     echo -e "${COLOR_RED_B}(E) Exit${COLOR_RESET}"
     echo -e "(1) Change the titlebar color at the top of Linux apps"
     echo -e "(2) Install Steam on ChromeOS (Can be unstable)"

     read -p "> " -n1 options
     case $options in
          e|E) clear && echo -e "Thank you for using Mozzarella. mamma mia pizza pasta its-a me, mario\n" && return ;;
          1) . functions/barcolor.sh ;;
          2) . functions/steam.sh ;;
          *) clear && echo -e "${COLOR_RED_B}Invalid option ${options}${COLOR_RESET}" ;;
     esac
done