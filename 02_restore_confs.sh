#!/bin/bash

# restoring confs
echo "restoring confs"
cp -ar ~/grimorio/confs/Black-Framework ~/.themes/ 
mkdir -p ~/.config/terminator/
cp -ar ~/grimorio/confs/terminator/config ~/.config/terminator/config
cp -ar ~/grimorio/confs/openbox ~/.config
cp ~/grimorio/confs/tint2rc ~/.config/tint2rc
cp ~/grimorio/confs/conkyrc ~/.conkyrc
cp ~/grimorio/confs/gdbinit ~/.gdbinit
cp ~/grimorio/confs/compton.conf ~/.config/compton.conf 
cp ~/grimorio/confs/bashrc ~/.bashrc 
cp ~/grimorio/confs/xbindkeysrc ~/.xbindkeysrc 
cp ~/grimorio/confs/Xresources ~/.Xresources 

cp ~/grimorio/confs/gitconfig ~/.gitconfig 

mkdir -p ~/.local/share/applications/
cp ~/grimorio/confs/mimeapps.list ~/.local/share/applications/mimeapps.list 

mkdir -p ~/.config/bl-exit/
cp -r ~/grimorio/confs/bl-exitrc  ~/.config/bl-exit/bl-exitrc 

xfconf-query --channel thunar --property /misc-remember-geometry  --create --type bool --set false
mkdir -p ~/.config/xfce4/xfconf/xfce-perchannel-xml/
cp ~/grimorio/confs/thunar.xml ~/.config/xfce4/xfconf/xfce-perchannel-xml/thunar.xml 
cp ~/grimorio/confs/gtkrc-2.0 ~/.gtkrc-2.0

echo "extra themes"
cp -r ~/grimorio/extra/themes/* ~/.themes/

mkdir -p /.config/mpv
cp ~/grimorio/confs/mpv.conf ~/.config/mpv/mpv.conf

cp -ar ~/grimorio/confs/micro ~/.config
cp ~/grimorio/confs/tmux.conf ~/.tmux.conf

mkdir -p ~/.config/cmus/
cp ~/grimorio/confs/cmusrc ~/.config/cmus/rc

exit
