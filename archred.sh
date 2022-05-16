#!/bin/bash
# Arch "Red" Bash script by S.K.
echo -ne "
-------------------------------------------------------------
            Arch "Red" Bash script by Szymcio1225
-------------------------------------------------------------"

echo "1# Do you want to use 'sudo pacman -Syu' for updates?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "1# Updating..." && sudo pacman -Syu && break;;
        No ) echo "1# Leaving..." && exit;;
    esac
done
clear
echo " "

echo "2# Installing 'yay'...
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
Download & install 'git, yay' packages?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "2# Downloading/Installing git, yay..." && pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si;;
        No ) echo "2# Leaving..." && exit;;
    esac
done
clear
echo " "

echo "3# Enabling multilib"
echo "3# First of all we need to execute "sudo nano /etc/pacman.conf""
echo "3# You need to find these two lines and remove '#' symbol from them"
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

echo "4# Install these packages ?"
echo "* firewalld - GUI Firewall management tool"
echo "* code - Microsofts Code Editor"
echo "* brave-bin (Stable)- Brave Stable web browser"
echo "* noto-fonts-emoji-apple - Replaces default emojis with Apple emojis"
echo "* gamemode - Daemon/lib combo for Linux that allows games to request a set of optimisations be temporarily applied to the host OS and/or a game process."
echo "* neofetch - Neofetch is a command-line system information tool"
echo "* htop - Interactive process viewer"
echo "* btop - Resource monitor that shows usage and stats for processor, memory, disks, network and processes."

select yn in "Yes" "No"; do
    case $yn in
        Yes ) echo "4# Downloading/Installing firewalld, code, brave-bin, noto-fonts-emoji-apple, neofetch, htop, btop and gamemode.." && yay -S firewalld code brave-bin noto-fonts-emoji-apple neofetch htop btop gamemode && break;;
        No ) echo "4# Leaving..." && exit;;
    esac
done
clear
echo " "
