#!/bin/bash

echo "installing hardware stuff"
sudo apt-get -y build-essential amd64-microcode firmware-b43-installer firmware-b43legacy-installer firmware-linux firmware-ralink firmware-iwlwifi firmware-realtek i965-va-driver intel-microcode cpufrequtils hdparm hddtemp acpi printer-driver-all hplip va-driver-all vdpau-va-driver

echo "installing coding tools"
sudo apt-get -y build-essential swig shellcheck make cloc clang-8 clang-format-8 clang-tools-8 clang-tidy-8 lldb-8 git linux-tools perf-tools-unstable linux-perf valgrind frama-c-base doxygen doxygen-doc 

echo "installing some kind of crunchbang system"
sudo apt-get -y install alsa-utils anacron apt-transport-https apt-xapian-index aptitude arandr arj bash-completion btrfs-tools chntpw clipit compton conky-all curl crda dmz-cursor-theme dosfstools efibootmgr eject enchant evince fbxkb feh file-roller ftp fuse galculator galternatives gdebi ghostscript gpicview gksu abiword gnumeric gparted hardinfo htop hwdata libnotify-bin lightdm lm-sensors locales lsb-release lxappearance lzop mlocate modemmanager network-manager nitrogen ntfs-3g ntp obconf obmenu openbox openssh-client p7zip-full pciutils pcmciautils python-keybinder python-notify python-xdg rfkill rpl rsync rzip scrot smartmontools suckless-tools synaptic terminator thunar thunar-archive-plugin thunar-media-tags-plugin thunar-volman tint2 transmission-gtk  unace unalz unar unrar unzip update-inetd usb-modeswitch usbutils user-setup uuid-runtime xdg-user-dirs xdg-utils xfce4-notifyd xfce4-power-manager xfce4-screenshooter xinput xorg xsel xz-utils yad zip treefilezilla firefox-esr xsane thunderbird neofetch grc python3-pyqt5 xdiskusage gcolor2 redshift xbacklight mpv ncftp nmap xdotool strace hsetroot wmctrl thermald gvfs gvfs-backends gvfs-fuse sshfs nmon fortune cmus sox cmatrix trash-cli cowsay joystick 

echo "installing dev libs"
sudo apt-get -y install libncurses5-dev libncursesw5-dev libportmidi-dev

echo "installing codecs"
sudo apt-get -y install vorbis-tools lame monkeys-audio gstreamer1.0-libav gstreamer1.0-plugins-bad gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-ugly 

echo "installing more apps"
sudo apt-get -y install flameshot telegram-desktop obs calibre kdenlive krita wine winbind paulstretch audacity espeak x264 figlet toilet toilet-fonts qv4l2

sudo apt-get -y install libreoffice libreoffice-gtk gimp doxygen-gui universalindentgui cppcheck geany geany-plugins 

echo "installing fonts"
sudo apt-get -y install fonts-cantarell fonts-dejavu fonts-droid-fallback fonts-inconsolata fonts-liberation fonts-stix fonts-lmodern fonts-powerline fonts-roboto xfonts-terminus xfonts-terminus-dos xfonts-terminus-oblique fonts-inconsolata fonts-f500 fonts-roboto-fontface fonts-firacode fonts-open-sans fonts-3270 ttf-mscorefonts-installer

echo "installing realtime kernel"
sudo apt-get install linux-image-4.18.0-0.bpo.3-rt-amd64

echo "installing jack utils"
sudo apt-get -y install jackd1 qjackctl aconnectgui jack-midi-clock jack-capture

echo "setting up realtime limits"
sudo cp ~/grimorio/extra/base/limits.conf /etc/security/limits.conf  
sudo groupadd realtime
sudo usermod -a -G realtime $USER

echo "installing updated intel drivers"
sudo apt-get -t stretch-backports install xserver-xorg-video-intel

echo "setting up xinitrc"
cp ~/grimorio/extra/xinitrc ~/.xinitrc

echo "copying system wide hardware confs"
sudo mkdir -p /usr/share/X11/xorg.conf.d/
sudo cp ~/grimorio/extra/base/20-intel.conf /usr/share/X11/xorg.conf.d/20-intel.conf
sudo mkdir -p /etc/modprobe.d/
sudo cp ~/grimorio/extra/base/kinect-depth.conf /etc/modprobe.d/kinect-depth.conf
sudo cp ~/grimorio/extra/base/lightdm.conf /etc/lightdm/lightdm.conf
sudo mkdir -p /etc/X11/xorg.conf.d/
sudo cp ~/grimorio/extra/base/40-libinput.conf /etc/X11/xorg.conf.d/40-libinput.conf

echo "setting up GRUB"
sudo cp extra/base/grub /etc/default/grub
sudo update-grub

echo "making ssh mount directory"
mkdir -p ~/mnt/ssh

echo "sensor detect"
sudo sensors-detect

echo "reconfigure keyboard now, use ctrl+alt+delete to terminate x"
sudo dpkg-reconfigure keyboard-configuration

echo "adding cloudshare DNS to resolv.conf"
echo "prepend domain-name-servers 1.0.0.1;" | sudo tee -a /etc/dhcp/dhclient.conf
echo "prepend domain-name-servers 1.1.1.1;" | sudo tee -a /etc/dhcp/dhclient.conf

echo "adding user to dialout and tty"
sudo usermod -a -G tty $USER
sudo usermod -a -G dialout $USER

echo "installing icons"
mkdir ~/.icons
cd ~/.icons
git clone https://github.com/EmptyStackExn/mono-dark-flattr-icons.git

mkdir ~/apps

echo "installing bl-exit"
cd ~/apps
git clone https://github.com/BunsenLabs/bunsen-exit.git

echo "linking bins"
rm -rf ~/bin
ln -s ~/grimorio/bin ~/bin
exit
