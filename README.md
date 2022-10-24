# 💾 Tweaks/Fixes or anything else that I use for GNU/Linux Arch 🐧
<br>

### 🔧 GNU/Linux Arch Installation using archinstall script
- Boot Arch Linux iso @ https://archlinux.org/download/
- Connect to internet (If using WiFi use Iwd) @ https://wiki.archlinux.org/title/Iwd
<br>

### 📶 Connecting to WiFi network using IWD
```
iwctl

device list

station device scan

station device get-networks

station device connect SSID

iwctl --passphrase passphrase station device connect SSID
```
- Type `exit` to exit from Iwd  
- Check if you have internet connection by just pinging  e.g. `ping google.com`  
- Type `archinstall` command and go through installation setup<br><br><br>

### 📦 Enabling multilib to install software like steam

- Edit `pacman.conf` and uncomment two lines: `sudo nano /etc/pacman.conf`

```
#[multilib]
#Include = /etc/pacman.d/mirrorlist
```

- Update mirrorlist using: `sudo pacman -Syyu`<br><br><br>


### 🪟+🐧 Fix dual boot time change
- Type in terminal: `sudo hwclock --systohc --localtime`<br><br><br>

### 🏗️ Faster compiling (Credit @Beci @ Github)

- Edit makepkg.conf:
`sudo nano /etc/makepkg.conf`

- Replace in CFLAGS and CXXFLAGS to use the native one
`-march=x86-64 -mtune=generic` to `-march=native`

- Speed up build by setting multiple threads 
`MAKEFLAGS="-j$(nproc)"` 

- As the default package extension became zst `PKGEXT='.pkg.tar.zst'`, the compression isn't hurt badly anymore, but it can be speed  up by add the desired level to `COMPRESSZST`, like add `-1`:
`COMPRESSZST=(zstd -1 -c -z -q -)`<br><br><br>


### 🖥️ Fix SDDM hanging the system for 1m30s

- Copy the default systemd config file to the subdirectory: 
`sudo cp /etc/systemd/system.conf /etc/systemd/system.conf.d/`

- Open system.conf file:
`sudo nano /etc/systemd/system.conf.d/system.conf`

- Uncomment and set to shorter time:
`#DefaultTimeoutStopSec=90s`<br><br><br>



### 🖱️ Fix slow scroll speed in X11
* Install imwheel:
```yay -S imwheel```
* Edit: `~/.imwheelrc` file and paste this:
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

- Create auto start script so it can run only on X11 (Script doesn't execute on Wayland session)
```
#!/bin/bash
if [[ $DESKTOP_SESSION = "plasma" ]]; then
   imwheel -b "45"
fi
```


<br><br><br>
### 😴 Disable Sleep, Hybrid Sleep, Hibernate and Suspend
```
sudo systemctl mask sleep.target suspend.target hibernate.target hybrid-sleep.target
```

<br><br><br>
### 📋Disable bracketed paste mode
    Fix for pasting anything to terminal and without showing "^[[200~ ..." or other symbols

- Edit `.inputrc` from your home directory: `sudo nano ~/.inputrc`
- Just add line and restart terminal: `set enable-bracketed-paste off`


<br><br><br>
### 📶 Replace networks name
    Make network name like "eth0" instead of "ensXxxx"
- Edit grub file: `sudo nano /etc/default/grub`

- Add `net.ifnames=0 biosdevname=0` to `GRUB_CMDLINE_LINUX=`

- Generate grub configuration file and reboot: `sudo grub-mkconfig -o /boot/grub/grub.cfg`


<br><br><br>
### ⚙️ KDE Settings that I use.
```
➡️ Home

    Theme:
    "Breeze Dark"

	Animation speed:
    13(5 from right)

    Clicking files or folder:
    "Selects them"
	
➡️ Appearance

    Plasma Style: "Willow Dark"

	Colors: "Willow Dark"

	Icons: "Willow Spectrum Light"

	Cursors: "Vimix Cursors"

	Launch Feedback:
    Cursor: "Static"

	Launch Feedback:
    Task Manager: Untick "Enable Animation"

	Splash Screen:
    "None"
	
➡️ Workspace Behavior

    Screen Edges:
    Remove Top Left Corner Action(Set to No Action)

	Screen Locking:
    Lock screen automatically: "After..." Disabled (Untick)

    Screen Locking:
    Appearance:(Configure...)
    Set Lock screen wallpaper to anything
	
	Virtual Desktops:
    Add 3 rows & 9 Virtual Desktops (You can name them 1,2.. - 9)
    Options: "Slide", Cogwheel icon > Gap between desktops H:0, V:0

➡️ Window Management

    Task Switcher:
    Visualization:
    Change to Thumbnail Grid (Same for alternative)

➡️ Shortcuts

	Accessibility: Disable default shortcut
	
	+Add Application:
    Konsole(or other terminal): "CTRL + ALT + T" (Should be default)
	
	KRunner:
    KRunner: Enable "Search"
    Add "META+R"(WIN+R) shortcut
	
	Spectacle(Screenshots) enable and set only:
	Capture Entire Desktop: "Print Screen"
	Capture Rectangular Region: "META + SHIFT + X" (Win + SHIFT + X)
	
	System Settings:
    Set to "META + I" (Win + I)
	
	KWin:
    Set switch to Desktop X: to "RIGHT SHIFT + numX..."
	
	Power Management:
    Disable shortcut for "Hibernate" & "Suspend"
	
	Session Management:
    Disable shortcut for "Log out"


➡️ Startup and Shutdown

    Login Screen (SDDM)
        Set to "Breeze" with any wallpaper

    Desktop Session
        When logging in: > "Start with an empty session"

➡️ Search

	File Search: Disable

    Plasma Search:
    Configure KRunner > History: Disable "Retain previous search" and "Activity aware"
   
    Available plugins:
    Disable
        "Bookmarks"
        "Browser history"
        "Browser tabs"

➡️ Notifications

	Hide after: 3 seconds

➡️ Regional Settings

    Region & Language:
        Region: Language: American English, everything else Polish

        (If you want interface in English and everything else in your region like time)
        (If it's broken then use "quicklanguagechanger.sh" bash script"
        (Default: interface lang; en_US-UTF-8, region; pl_PL.UTF-8)

➡️ Configure Firewall

    Enable "Firewall Status Enabled" (gufw/ufw or firewalld)

➡️ Input Devices

    Mouse:
        Acceleration profile: Flat
        Scroll speed (Wayland): 8
        Pointer speed: 6

➡️ Power Management

    Energy Saving
        Disable "Screen Energy Saving"

    On laptop Disable sleep when closing lid OR turn off laptop screen
        Brightness on battery set to 50%
        Brightness with power connected set to 100%
	
➡️ KDE Panel

    Move Virtual Desktops Widget to right side
	
    Pins:
        Any Web Browser
        Any File Manager
        Settings
        Terminal
	
    Panel Height: 48

    System tray:
        Multimedia player: Always Hidden
        Notifications: Always Hidden
        Updates: Always Hidden
        Battery / Brightness: Always Hidden or Always Shown(Laptop)
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
		General:
			Behavior > Sorting mode: Alphabetical, case sensitive
			Confirmations > Enable Moving files or folder to trash
		
		Startup:
		Show on startup
			/home/YourUserName
			
			New windows:
				Enable:
				Show filter bar;
				Make location bar editable;

			General:
				Enable:
				Show full path inside location bar;
				Show full path in title bar;
			
		View modes: (Sizes)
			Icons: 2,2
			Compact: 1,1
			Details: 1,1
			
		Context Menu:
			Enable:
			"Copy To and Move To commands"
			"Delete"
			
			Download New Services:
			"Open Dolphin as root"
			
```


### 🛠️ TO DO
- Automate everything

### 😲👉🆓⁉️
Feel free to use this! 😋



