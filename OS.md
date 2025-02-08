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
- Back in termina, run `lxc launch images:***Your Selected Distro*** penguin --config security.privileged=true`
- Run `lxc list` and verify that there is `penguin`
- Run `lxc start penguin` if it is not started
- Run `lxc exec arch -- bash` 

**Step 5: Users**
- Run `grep 1000:1000 /etc/passwd|cut -d':' -f1` to see the users (make one with `adduser *username*` if needed)
- Optionally, set a password for the user with `passwd *username*`
- Install sudo
- Run `visudo` or Run `(vi/nano/vim) /etc/sudoers` (select the text editor you have)
- Uncomment `%wheel ALL=(ALL) ALL` (Near the bottom)
- Save and exit the text editor
- Run `usermod -aG wheel *username*`

- Run `exit` to exit

**Shut down Linux and turn it back on.**
