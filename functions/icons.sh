ls /usr/share/applications | grep ".desktop" | grep -v ".hidden" | sed 's/\.desktop//'
echo -e "Write the application you'd like to change the icon of (EX: code)"
read -p "> " -n1 desktop
echo -e "Path to the PNG image you'd like to replace the icon with (EX: /home/$USER/Downloads/icon.png)"
read -p "> " -n1 IMAGE
sed -i "s/Icon:[^ ]*/Icon:${IMAGE}/g" yourfile.txt
