# I don't like Debian, how do I get rid of it?
*Maybe you do like Debian, and just want to try other distros. That's okay too.* DISCLAIMER: This does not work on arm64 devices. 

Anyways, here are the steps.

**Step 1: Remove Debian**
- Use Ctrl-Alt-T to open the crosh terminal (you do NOT need developer mode or shell access, don't worry), 
- Run `vmc destroy termina`
- Run `vmc start termina`

**Step 2: Add the distro images** *Note: If `vmc start termina` did not put you in termina, run `vsh termina`*
- Run `lxc remote remove images`
- Run `lxc remote add images https://images.lxd.canonical.com/ --protocol=simplestreams`

**Step 3: Pick a distribution to boot**
- Open this URL: [https://images.lxd.canonical.com/](https://images.lxd.canonical.com/)
- Pick your distribution, it must have virtual machine support (hence why it only works on amd64 devices)
- Click on the date, and copy what is after lxc launch images:

**Step 4: Adding the container**
- Back in termina, run `lxc launch images:***Paste the copied text here*** penguin --config security.privileged=true`
- Run `lxc list` and verify that there is `penguin`
- Run `lxc start penguin` if it is not started
- Run `lxc exec penguin -- bash` You may need to install bash

**Step 5: Users**
- Run `grep 1000:1000 /etc/passwd|cut -d':' -f1` to see the users (make one with `adduser *username*` if needed)
- Optionally, set a password for the user with `passwd *username*`
- Install sudo
- Run `visudo` or Run `(vi/nano/vim) /etc/sudoers` (select the text editor you have)
- Uncomment `%wheel ALL=(ALL) ALL` (Near the bottom)
- Save and exit the text editor
- Run `usermod -aG wheel *username*` or whatever command adds user to group wheel

- Run `exit` to exit

**Shut down Linux and turn it back on.**

# Example using alpine linux
```
Welcome to crosh, the ChromeOS developer shell.

If you got here by mistake, don't panic!  Just close this tab and carry on.

Type 'help' for a list of commands.

If you want to customize the look/behavior, you can use the options page.
Load it by using the Ctrl-Shift-P keyboard shortcut.

crosh> vmc destroy termina
WARNING: this will delete all data stored in VM 'termina'
Continue? (y/N) y
crosh> vmc start termina
(termina) chronos@localhost ~ $ lxc remote remove images
To start your first container, try: lxc launch ubuntu:22.04
Or for a virtual machine: lxc launch ubuntu:22.04 --vm

(termina) chronos@localhost ~ $ lxc remote add images https://images.lxd.canonical.com/ --protocol=simplestreams
(termina) chronos@localhost ~ $ lxc launch images:alpine/3.21/default penguin --config security.privileged=true
Creating penguin
Starting penguin                            
(termina) chronos@localhost ~ $ lxc list
+---------+---------+-----------------------+------+-----------+-----------+
|  NAME   |  STATE  |         IPV4          | IPV6 |   TYPE    | SNAPSHOTS |
+---------+---------+-----------------------+------+-----------+-----------+
| penguin | RUNNING | 696.969.42.069 (eth0) |      | CONTAINER | 0         |
+---------+---------+-----------------------+------+-----------+-----------+
(termina) chronos@localhost ~ $ lxc exec penguin -- apk add bash sudo     
fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/main/x86_64/APKINDEX.tar.gz
fetch https://dl-cdn.alpinelinux.org/alpine/v3.21/community/x86_64/APKINDEX.tar.gz
(1/5) Installing ncurses-terminfo-base (6.5_p20241006-r3)
(2/5) Installing libncursesw (6.5_p20241006-r3)
(3/5) Installing readline (8.2.13-r0)
(4/5) Installing bash (5.2.37-r0)
Executing bash-5.2.37-r0.post-install
(5/5) Installing sudo (1.9.16_p2-r0)
Executing busybox-1.37.0-r12.trigger
OK: 12 MiB in 34 packages
(termina) chronos@localhost ~ $ lxc exec penguin -- bash             
penguin:~# adduser sophie
Changing password for sophie
New password: 
Retype password: 
passwd: password for sophie changed by root
penguin:~# visudo
penguin:~# adduser sophie wheel
penguin:~# sudo -lU sophie
Matching Defaults entries for sophie on penguin:
    secure_path=/usr/local/sbin\:/usr/local/bin\:/usr/sbin\:/usr/bin\:/sbin\:/bin

Runas and Command-specific defaults for sophie:
    Defaults!/usr/sbin/visudo env_keep+="SUDO_EDITOR EDITOR VISUAL"

User sophie may run the following commands on penguin:
    (ALL : ALL) ALL
penguin:~# exit
exit
(termina) chronos@localhost ~ $
