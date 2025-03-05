COLOR_RESET="\033[0m"
COLOR_BLACK_B="\033[1;30m"
COLOR_RED_B="\033[1;31m"
COLOR_GREEN="\033[0;32m"
COLOR_GREEN_B="\033[1;32m"
COLOR_YELLOW="\033[0;33m"
COLOR_YELLOW_B="\033[1;33m"
COLOR_BLUE_B="\033[1;34m"
COLOR_MAGENTA_B="\033[1;35m"
COLOR_PURPLE_B="\033[1m\e[34m"
COLOR_CYAN_B="\033[1;36m"
COLOR_LIGHT_YELLOW_B="\033[1m\e[33m"
BOLD="\033[1m"
COLOR_WHITE="\033[0;37m"
COLOR_BLACK="\033[0;30m"

WHO_USER=$(who -m | awk '{print $1}')

if [ $WHO_USER != "root" ]; then
  user = $WHO_USER
fi

read -rd '' ascii <<'EOF'
\033[0;30m                                                      @@@@@@@@@@@@                       
\033[0;30m                             @@@@@@@@@@@@@@@@@@@@@@@@@@@\033[1;32m@@@@@@@@@@\033[0;30m@@@@@                 
\033[0;30m                           @@@@@%#\033[0;37m############\033[0;30m#%@@@@\033[1;32m%%%%%%%%%%%%%%%%%\033[0;30m@@@                
\033[0;30m                          @@@\033[0;37m##############\033[0;30m#####@@\033[1;32m%%%%%%%%%%%%%%%%%%\033[0;30m@@@@                  
\033[0;30m                   @@@@@@@@@@%\033[0;37m#########\033[0;30m#####\033[0;32m#%@@@%\033[1;32m%%%%%%%%%%%%%%%%\033[0;30m@@@@@@@@                
\033[0;30m          @@@@@@@@@@@@@@@@@@#%@@%\033[0;37m#########\033[0;30m######@@@@@\033[1;32m%%%%%%%%%%%\033[0;30m@@@\033[0;37m%###\033[0;30m@@@@@@            
\033[0;30m    @@@@@@@@@@%\033[0;37m############\033[0;30m@@\033[0;37m###\033[0;30m#@@@%\033[0;37m###############\033[0;30m#%@@@@@@@@#\033[0;37m##########\033[0;30m%@@@@         
\033[0;30m  @@@@@\033[0;37m##################\033[0;30m@#\033[0;37m########\033[0;30m%@@@@@#\033[0;37m##################################\033[0;30m%@@@       
\033[0;30m@@@\033[0;37m######################\033[0;30m@@#\033[0;37m############\033[0;30m#%@@@%###\033[0;37m############################\033[0;30m#@@@      
\033[0;30m@@\033[0;37m%#######################\033[0;30m@@@#\033[0;37m##################\033[0;30m@@@@@@@@@%%\033[0;37m##############\033[0;30m#@@@@@@@       
\033[0;30m@@@@@@##\033[0;37m####################\033[0;30m#@@@#\033[0;37m########################\033[0;30m##%%@@@@@@@@@@@@%#\033[0;37m##\033[0;30m@@@@       
\033[0;30m@@#\033[0;37m##%\033[0;30m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@\033[0;37m######################################\033[0;30m@@        
\033[0;30m@@%\033[0;37m################################\033[0;30m%@@@@#\033[0;37m##################################\033[0;30m@@@        
\033[0;30m@@@\033[0;37m#######################################%\033[0;30m@@@@%#\033[0;37m#####################\033[0;30m#%%@@@@@         
\033[0;30m @@@\033[0;37m%######################################\033[0;30m@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@         
\033[0;30m   @@@@@@\033[0;37m%%###########################%\033[0;30m@@@@@@@      @@@@@@@@@@@@@@@@                     
\033[0;30m        @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@                                                 
\033[0;30m                    @@@@@@@@@@@@@@                                                  
EOF






read -rd '' guitar <<'EOF'
vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv                                                     33333333333333333333333334ddb btbbbbbbbbbbbbbbbbbbbbbbbbbbbbtvtttbvvvvvvvvvvvvvvvvvvvvvvvvvbttvvvvvvvvttv   4 bbbbbbbbttttttbt5vvvvvvvvvvvvvvvvvvvvvvvvvvvttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt5v55v5555555bt55bv555555555555555555555555555555555                                                                                                                                  mmmuuuuuuuuuuuuuuuu  44444444444
EOF
RGB_DEFAULT="\x1b[48;2;52;53;56m  \x1b[0m"
RGB_WHITE="\x1b[48;2;255;255;255m  \x1b[0m"
RGB_RAINBOW="\x1b[48;2;255;0;0m  \x1b[48;2;255;165;0m  \x1b[48;2;0;255;255m  \x1b[48;2;0;255;0m  \x1b[48;2;0;0;255m  \x1b[48;2;128;0;128m  \x1b[0m"

HEXCODE="#343538"
pioneerng=$(( (RANDOM % 100) + 1 ))

welcome() {
	echo -e "${ascii}"
	echo -e "\n${COLOR_GREEN_B}Welcome to Mozzarella! Made by Ethereal Workshop\e[0m\n"
	echo -e "${BOLD}Credits:${COLOR_RESET}"
	if test "$pioneerng" = "69"; then
	echo -e "- Sophie: Pioneering this wild script"
	else
	echo -e "- Sophie: Made all the scripts and the name"
    fi
	echo -e "- Archimax: Cleaned up all the scripts"
	echo -e "- You: Being named $WHO_USER."
	echo -e ""
}

squiggly_add() {
echo -e "function squiggly() {" >> /home/$WHO_USER/.bashrc
echo -e "    if [[ $PWD == "/home/MyFiles" ]]; then" >> /home/$WHO_USER/.bashrc
echo -e "        export PS1='\u@\h:~\$ '" >> /home/$WHO_USER/.bashrc
echo -e "    else" >> /home/$WHO_USER/.bashrc
echo -e "        export PS1='\u@\h:\w\$ '" >> /home/$WHO_USER/.bashrc
echo -e "    fi" >> /home/$WHO_USER/.bashrc
echo -e "}" >> /home/$WHO_USER/.bashrc
echo -e "" >> /home/$WHO_USER/.bashrc
echo -e "PROMPT_COMMAND=squiggly" >> /home/$WHO_USER/.bashrc
echo -e "cd /home/MyFiles/" >> /home/$WHO_USER/.bashrc
echo -e "function home() {" >> /home/$WHO_USER/.bashrc
echo -e "	cd /home/MyFiles/" >> /home/$WHO_USER/.bashrc
echo -e "}" >> /home/$WHO_USER/.bashrc
source /home/$WHO_USER/.bashrc
}
