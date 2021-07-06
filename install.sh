#!/bin/bash

while [ -n "$1" ]
do
case "$1" in
-b) sudo pacman -S --needed vim rxvt-unicode pcmanfm compton xf86-video-intel htop dosfstools ntfs-3g ;;
-e) sudo pacman -S --needed net-tools firefox libreoffice-fresh
    libreoffice-fresh-ru gimp unzip unrar p7zip cmus pulseaudio pulseaudio-alsa
    alsa-utils links gnome-calculator neofetch fzf ;;
-c) sudo pacman -S --needed git gcc python python2-pip python-pip jdk-openjdk
    ranger ;;
-y) 
   sudo pacman -S --needed base-devel git wget yajl
   cd /tmp
   git clone https://aur.archlinux.org/package-query.git
   cd package-query/
   makepkg -si
   cd ..
   git clone https://aur.archlinux.org/yaourt.git
   cd yaourt/
   makepkg -si
   cd ..
   sudo rm -dR yaourt/ package-query/ ;;
-gui)
   sudo pacman -S --needed sway mako rofi feh grim slurp pacman-contrib
   arc-gtk-theme jq ttf-freefont ttf-linux-libertine ttf-hack terminus-font
   ttf-font-awesome
   yaourt -S yay numix-circle-arc-icons-git ;;
-h)
   echo "-b   --Base installation"
   echo "-e   --Extra installation"
   echo "-c   --Dev. installation" 
   echo "-y   --AUR installation"
   echo "-gui --GUI installation" ;;
*) echo "--parametr ???" ;;
esac
shift
done

