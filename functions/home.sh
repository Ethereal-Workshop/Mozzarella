if [ -d /home/'Linux Home' ]; then
  echo -e "'Linux Home' Detected. Would you like to revert the changes and set the home directory back to normal? (y/n)" 
  read -p "" -n1 revert
	case $revert in
		y|Y) cd /home/
    rm -rf $WHO_USER
    mv 'Linux Home' $WHO_USER
    sed -i '/function squiggly/,+7d' /home/$WHO_USER/.bashrc
    sed -i '/PROMPT_COMMAND=squiggly/d' /home/$WHO_USER/.bashrc

		n|N) return ;;
    *) return ;;
	esac
  
else
  echo -e "\nBefore proceeding, Share 'My Files' with linux by clicking on it in the files app."
  ls /mnt/chromeos/MyFiles
  if [ ! -d /mnt/chromeos/MyFiles/ ]; then
    echo "Not shared. Share 'My Files' with linux by clicking on it in the files app."
    sleep 1
    return
  fi
  cd /home/
  squiggly_add
  mv $WHO_USER 'Linux Home'
  ln -s /mnt/chromeos/MyFiles $WHO_USER
  echo -e "Done."
  sleep 0.5
  return
fi




