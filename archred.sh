#!/bin/bash
# Arch "Red" Bash script by S.K.
echo -ne "
-------------------------------------------------------------
 █████  ██████   ██████ ██   ██     ██████  ███████ ██████  
██   ██ ██   ██ ██      ██   ██     ██   ██ ██      ██   ██ 
███████ ██████  ██      ███████     ██████  █████   ██   ██ 
██   ██ ██   ██ ██      ██   ██     ██   ██ ██      ██   ██ 
██   ██ ██   ██  ██████ ██   ██     ██   ██ ███████ ██████  
-------------------------------------------------------------
            Arch "Red" Bash script by Szymcio1225
-------------------------------------------------------------
"

echo "1# Do you want to use "sudo pacman -Syu" for updates?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "1# Updating..." && sudo pacman -Syu && break;;
        No ) echo "1# Leaving..." && exit;;
    esac
done
clear
echo " "

echo "2# Do you want to use "sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si" to download/install "git, yay" packages and build yay?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "2# Downloading/Installing git, yay..." && sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si && break;;
        No ) echo "2# Leaving..." && exit;;
    esac
done
clear
echo " "

echo "3# Do you want to use "yay -Ps" to check if "yay" is working?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "3# Checking.." && yay -Ps && break;;
        No ) echo "3# Leaving..." && exit;;
    esac
done
clear
echo " "

echo "4# Do you want to install steam?"
echo "4# First of all we need to execute "sudo nano /etc/pacman.conf" so we can install "steam" package"
echo "4# You need to find these two lines and remove '#' symbol from them"
echo " "
echo "#[multilib]"
echo "#Include = /etc/pacman.d/mirrorlist"
echo " "
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "4# Editing /etc/pacman.conf with nano" && sudo nano /etc/pacman.conf; break;;
        No ) echo "4# Leaving" exit;;
    esac
done
clear
echo " "

echo "5# Do you want to install these packages "yay -S gufw code brave-bin noto-fonts-emoji-apple steam gamemode"?"
echo "* gufw - GUI firewall"
echo "* code - Microsofts Code Editor"
echo "* brave-bin (Stable)- Brave Stable web browser"
echo "* noto-fonts-emoji-apple - Replaces default emojis with Apple emojis"
echo "* steam - Platform for games etc"
echo "* gamemode - Daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS and/or a game process."
echo " "

select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "5# Downloading/Installing gufw, code, brave-bin, noto-fonts-emoji-apple, steam and gamemode.." && yay -S gufw code brave-bin noto-fonts-emoji-apple steam gamemode && break;;
        No ) echo "5# Leaving..." && exit;;
    esac
done
clear
echo " "
