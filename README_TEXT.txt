# My personal script for installing packages for Arch Linux

## Installation
* Boot Arch Linux iso (I'm currently using 2022.03.01) @ https://archlinux.org/download/
* Connect to internet (If using WiFi use Iwd) @ https://wiki.archlinux.org/title/Iwd

## Connecting to WiFi network using Iwd

iwctl
device list
station device scan
station device get-networks
station device connect SSID
iwctl --passphrase passphrase station device connect SSID

* Type exit to exit from Iwd
* Check if you have internet connection by just pinging  eg. ping google.com
* Type archinstall command and go through installation setup
* After installation is completed, log in to the desktop
* Run any Terminal (eg. Konsole) and type sudo pacman -Syu to check for latest updates
* Execute my script by typing ./archred.sh you can check yourself my code if you need to change something

##KDE Settings that I use.

Open KDE Settings

Home(Icon)

        Set theme to "Dark"
        Clicking files or folder > Select "Selects them"

Workspace Behavior

        > Screen Edges
        Remove Top Left Corner Action(Set to No Action)

        > Screen Locking
        Lock screen automatically: After... Disabled

        > Screen Locking, Appearance(Configure...)
        Set Lock screen wallpaper to "Honeywave"

        > Virtual Desktops
        Add 2 more Virtual Desktops... Their names "1", "2" and "3"
        Options: > Slide > Gap between desktops H:0, V:0

Startup and Shutdown

        > Login Screen (SDDM)
        Set to "Breeze" with "Honeywave" wallpaper

        > Desktop Session
        When logging in: > "Start with an empty session"

Search

        > Plasma Search
        > KRunner history:
        Disable "Retain previous search" and "Activity aware"

        > Available plugins:
        Disable
        "Bookmarks";
        "Browser history";
        "Browser tabs" ;

Regional Settings

        > Formats
        Region: "pl_PL.UTF-8" (Since I'm from Poland)

Accessibility

        > Screen Reader
        Disable "Enable Screen Reader"

Configure Firewall

        Enable "Firewall Status Enabled" (gufw/ufw)

Input Devices

        > Mouse
        Acceleration profile: Set to "Flat"

Power Management

        > Energy Saving
        Disable "Screen Energy Saving"

        On laptop Disable sleep when closing lid OR turn off laptop screen
        Brightness on battery set to 50%
        Brightness with power connected set to 100%
	
Shortcuts

        Accessibility - > Accessibility: Disable default shortcut
        KRunner - > KRunner: Enable "Search" and add "META+R"(WIN+R) shortcut
        Session Management - > Disable shortcut for "Log out:"

##TO DO
* Automate setting up all my KDE Settings without doing it manually

##
Feel free editing my bash code for yourself!
