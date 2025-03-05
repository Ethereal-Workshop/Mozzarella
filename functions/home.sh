if [ -d /home/'MyFiles' ]; then
  echo -e "\n'MyFiles' Detected. Would you like to revert the changes and set the opened directory back to normal? (y/n)" 
  read -p "" -n1 revert
	case $revert in
		y|Y) sed -i '/#home.sh/d' /home/$WHO_USER/.bashrc
    source /home/$WHO_USER/.bashrc
    rm /home/MyFiles 
    return ;;
		n|N) return ;;
    *) return ;;
	esac
  
else
  echo -e "\nBefore proceeding, Share 'My Files' with linux by clicking on it in the files app. Press enter when you have." && read -p "" -n1
  if [ ! -d /mnt/chromeos/MyFiles/ ]; then
    echo "Not shared. Share 'My Files' with linux by clicking on it in the files app."
    sleep 1
    return
  fi
  home_add
  ln -s /mnt/chromeos/MyFiles /home/MyFiles
  echo -e "Done. MyFiles created at /home/MyFiles." && read -p "" -n1
  return
fi




