clear
echo -e "${BOLD}Change an application's icon${COLOR_RESET}\n"

echo -e ""
ls /usr/share/applications | grep ".desktop" | grep -v ".hidden" | sed 's/\.desktop//'
echo -e "Write the application you'd like to change the icon of (EX: code)"
read -p "> " desktop
echo -e "Path to the PNG image you'd like to replace the icon with (EX: /home/$WHO_USER/Pictures/icon.png). This file will be stored in the applications directory, you can delete the original file."
read -p "> " IMAGE
mkdir -p /usr/share/applications/customicons/
cp $IMAGE /usr/share/applications/customicons/$desktop.png

sed -i "/Icon/c\Icon=/usr/share/applications/customicons/$desktop.png" /usr/share/applications/$desktop.desktop
mv /usr/share/applications/$desktop.desktop /tmp/$desktop.desktop
sleep 10
mv /tmp/$desktop.desktop /usr/share/applications/$desktop.desktop
echo -e "Done."
desktop=""