echo -e ""
ls /usr/share/applications | grep ".desktop" | grep -v ".hidden" | sed 's/\.desktop//'
echo -e "Write the application you'd like to change the icon of (EX: code)"
read -p "> " desktop
echo -e "Path to the PNG image you'd like to replace the icon with (EX: /home/$USER/Downloads/icon.png)"
read -p "> " IMAGE
sudo sed -i "/Icon/c\Icon=${IMAGE}" /usr/share/applications/$desktop.desktop


sudo mv /usr/share/applications/$desktop.desktop /tmp/$desktop.desktop
sleep 10
sudo mv /tmp/$desktop.desktop /usr/share/applications/$desktop.desktop
echo -e "Done."