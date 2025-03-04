clear
echo -e "${BOLD}Change an application's icon${COLOR_RESET}\n"

echo -e ""
ls /usr/share/applications | grep ".desktop" | grep -v ".hidden" | sed 's/\.desktop//'
echo -e "Write the application you'd like to change the icon of (EX: code)"
read -p "> " desktop
if [ ! -f /usr/share/applications/"$desktop".desktop ]; then
  echo "The file does not exist. Exiting."
  sleep 0.5
  return
fi
echo -e "Path to the PNG image you'd like to replace the icon with. (EX: /home/$WHO_USER/Pictures/icon.png). This file will be stored in the applications directory, you can delete the original file."
echo -e "${BOLD}Or, type 'restore' to restore the original icon${COLOR_RESET}"
mkdir -p /usr/share/applications/customicons/
mkdir -p /usr/share/applications/bak/
read -p "> " IMAGE
if test "$IMAGE" != "restore"; then
    if [ ! -f "$IMAGE" ]; then
      echo "The file does not exist. Exiting."
      sleep 0.5
      return
    fi
    rm -f /usr/share/applications/customicons/$desktop.png
    cp $IMAGE /usr/share/applications/customicons/$desktop.png

    cp /usr/share/applications/$desktop.desktop /usr/share/applications/bak/$desktop.desktop.bak

    sed -i "/Icon/c\Icon=/usr/share/applications/customicons/$desktop.png" /usr/share/applications/$desktop.desktop
    mv /usr/share/applications/$desktop.desktop /tmp/$desktop.desktop
    sleep 5
    mv /tmp/$desktop.desktop /usr/share/applications/$desktop.desktop
else
    mv /usr/share/applications/bak/$desktop.desktop.bak /usr/share/applications/$desktop.desktop
    mv /usr/share/applications/$desktop.desktop /tmp/$desktop.desktop
    sleep 5
    mv /tmp/$desktop.desktop /usr/share/applications/$desktop.desktop
    rm -f /usr/share/applications/bak/$desktop.desktop.bak
    rm -f /usr/share/applications/customicons/$desktop.png
fi
echo -e "Done."
desktop=""