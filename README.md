## 💾 My personal scripts for GNU/Linux 🐧!

## 🔧 Installation
* Boot Arch Linux iso @ [https://archlinux.org/download/](https://archlinux.org/download/)
* Connect to internet
(If using WiFi use Iwd) @ [https://wiki.archlinux.org/title/Iwd ](https://wiki.archlinux.org/title/Iwd)

## 📶 Connecting to WiFi network using IWD
```bash
iwctl

device list

station device scan

station device get-networks

station device connect SSID

iwctl --passphrase passphrase station device connect SSID
```
* Type ```exit``` to exit from Iwd
* Check if you have internet connection by just pinging  eg. ```ping google.com```
* Type ```archinstall``` command and go through installation setup
* Clone my repo with: ```git clone https://github.com/Szymcio1225/archred.git```
* Execute my script by typing ```./archred.sh```

## 📦 Enabling multilib to install software like steam
* Enable multilib in the pacman config by uncommenting these two lines in pacman.conf:
* Edit pacman.conf ```sudo nano /etc/pacman.conf```
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```
* Type ```sudo pacman -Syyu``` to update.


## 🪟+🐧 Fix dual boot time change:
* type ```sudo hwclock --systohc --localtime```


## 🏗️ Faster compiling
* Edit /etc/makepkg.conf replace in CFLAGS ```-march=x86-64 -mtune=generic``` to ```-march=native```
* Set multiple threads for faster building ```MAKEFLAGS="-j$(nproc)"```
* Speed up compression by adding -1 to COMPRESSZST: ```COMPRESSZST=(zstd -1 -c -z -q -)```


## 🖥️ Fix SDDM hanging the system for 1:30 minutes every shutdown/restart
* Copy the default systemd config file to the subdirectory: ```cp /etc/systemd/system.conf /etc/systemd/system.conf.d/```
* Open ```/etc/systemd/system.conf.d/system.conf```
* Uncomment this line ```#DefaultTimeoutStopSec=90s```
* Set ```DefaultTimeoutStopSec=90s``` to a shorter time

## 🖵 + 🔊 Install Wayland + Pipewire + JamesDSP
Install: ```yay -S pipewire plasma-wayland-session jamesdsp```

## 🖱️ Fix slow scroll speed in X11
* Install: ```yay -S imwheel```
* Edit: ~/.imwheelrc file and paste this:
```
"^brave-browser$"
None, Up, Button4, 3
None, Down, Button5, 3
Control_L, Up, Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L, Up, Shift_L|Button4
Shift_L, Down, Shift_L|Button5

"^google-chrome$"
None, Up, Button4, 3
None, Down, Button5, 3
Control_L, Up, Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L, Up, Shift_L|Button4
Shift_L, Down, Shift_L|Button5

"^discord$"
None, Up, Button4, 3
None, Down, Button5, 3
Control_L, Up, Control_L|Button4
Control_L, Down, Control_L|Button5
Shift_L, Up, Shift_L|Button4
Shift_L, Down, Shift_L|Button5

".*"
 @Exclude
```
Create script to auto start at login so it can run only on X11 (
```
#!/bin/bash
if [[ $DESKTOP_SESSION = "plasma" ]]; then
   imwheel -b "45"
fi

```

## Fix small gtk buttons (eg. in Brave browser when using gtk+ theme the gtk buttons are small)
 sudo nano ~/.config/gtk-3.0/gtk.css

```
button.titlebutton {
    min-height: 32px;
    min-width: 32px;
    padding: 0;
}
```


---------------------------------------------

## ⚙️ KDE Settings that I use.
```
Open KDE Settings

➡️ Home(Icon)

        Set theme to "Dark"
        Clicking files or folder > Select "Selects them"

➡️ Workspace Behavior

        > Screen Edges
        Remove Top Left Corner Action(Set to No Action)

        > Screen Locking
        Lock screen automatically: After... Disabled

        > Screen Locking, Appearance(Configure...)
        Set Lock screen wallpaper to "Honeywave"

        > Virtual Desktops
        Add 2 more Virtual Desktops... Their names "1", "2" and "3"
        Options: > Slide > Gap between desktops H:0, V:0
	Add 3 rows for vertical or use 1 row for horizontal

➡️ Startup and Shutdown

        > Login Screen (SDDM)
        Set to "Breeze" with "Honeywave" wallpaper

        > Desktop Session
        When logging in: > "Start with an empty session"

➡️ Search

        > Plasma Search
        > KRunner history:
        Disable "Retain previous search" and "Activity aware"

        > Available plugins:
        Disable
        "Bookmarks";
        "Browser history";
        "Browser tabs" ;

➡️ Regional Settings

        > Formats
        Region: "pl_PL.UTF-8" (Since I'm from Poland 😊)
	(If it's broken then use "quicklanguagechanger.sh" bash script" (Default: interface lang; en_US-UTF-8, region; pl_PL.UTF-8)

➡️ Configure Firewall

        Enable "Firewall Status Enabled" (gufw/ufw or firewalld)

➡️ Input Devices

        > Mouse
        Acceleration profile: Flat
	Scroll speed: 8
	Pointer speed: 7

➡️ Power Management

        > Energy Saving
        Disable "Screen Energy Saving"

        On laptop Disable sleep when closing lid OR turn off laptop screen
        Brightness on battery set to 50%
        Brightness with power connected set to 100%
	
➡️ Shortcuts

        Accessibility - > Accessibility: Disable default shortcut
        KRunner - > KRunner: Enable "Search" and add "META+R"(WIN+R) shortcut
        Session Management - > Disable shortcut for "Log out:"
	
➡️ KDE Panel

        Move Virtual Desktops Widget to right side
	
        Pins:
        Brave Browser
        Dolphin File Browser
	
        Panel Height: 48

        System tray:
        Multimedia player: Always Hidden
        Notifications: Always Hidden
        Updates: Always Hidden
        Battery / Brightness: Always Hidden OR Always Shown(Laptop)
        Bluetooth: Shown when relevant
        Disk / Devices: Shown when relevant
        Touchpad: Always Hidden
        Sound: Always Shown
        Network: Always shown
        Keyboards Layout: Always hidden
        Display settings: Always hidden
        Typing method: Always hidden
        Night mode: Shown when relevant
        Disk Allocation: Always hidden
        Clipboard: Always Hidden
        Safe: Always hidden
        Weather: Disabled

🐬 Dolphin File Manager Settings

        Configure Dolphin
		General
			Behavior > Sorting mode: Alphabetical, case sensitive
			Confirmations > Enable Moving files or folder to trash
		
		Startup
		Show on startup
			/home/$USER
			
		New windows:
			Enable:
			Show filter bar;
			Make location bar editable;
			
		General:
			Enable:
			Show full path inside location bar;
			Show full path in title bar;
			
		View modes:
			Details
			
		Context Menu:
			Enable:
			Copy To and Move To commands;
			Delete;
			
			Download New Services:
			Open Dolphin as root;
			
```



## 🛠️ TO DO
* Automate everything

## 😲👉🆓⁉️
Feel free editing my bash code for yourself! 😋



