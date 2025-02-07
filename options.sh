echo -e "\033[1m\e[31mPlease select an option or press enter to end the script.\e[0m\n"
echo -e "\033[1m\e[31m(E) Exit\e[0m"
echo -e "(1) Change the titlebar color at the top of Linux apps"


read -p "> " options
case $options in
     e|E) clear 
     exit ;;
     1) bash ./barcolor.sh ;;
     *) bash ./mozzarella.sh ;;
esac