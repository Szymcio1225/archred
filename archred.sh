#!/bin/bash
# Arch "Red" Bash script by S.K.
echo -ne "
-------------------------------------------------------------
            Arch "Red" Bash script by Szymcio1225
-------------------------------------------------------------"
echo " "

echo "1# Installing git, yay"
read -n 1 -r -s -p $'Press enter to continue...\n'
sudo pacman -Syu
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
clear
echo "'yay' installed"
read -n 1 -r -s -p $'Press enter to continue...\n'
clear


echo "2# Enabling multilib"
echo "2# First of all we need to execute "sudo nano /etc/pacman.conf""
echo "2# You need to find these two lines and remove '#' symbol from them"
echo " "
echo "#[multilib]"
echo "#Include = /etc/pacman.d/mirrorlist"
echo " "
echo "Editing /etc/pacman.conf with nano"
echo " "
read -n 1 -r -s -p $'Press enter to continue...\n'
sudo nano /etc/pacman.conf
clear
read -n 1 -r -s -p $'Press enter to continue...\n'


echo "3# Downloading/Installing firewalld, code, brave-bin, noto-fonts-emoji-apple, neofetch, htop, btop and gamemode.." 
read -n 1 -r -s -p $'Press enter to continue...\n'
yay -S firewalld code brave-bin noto-fonts-emoji-apple neofetch htop btop gamemode
clear
