#!/bin/bash

while [ -n "$1" ]
do
case "$1" in
-b) sudo pacman -S --needed vim rxvt-unicode pcmanfm lxappearance compton xorg-server xorg-xinit xorg-apps mesa-libgl xterm xf86-video-intel htop dosfstools ntfs-3g ;;
-e) sudo pacman -S --needed net-tools firefox libreoffice-fresh libreoffice-fresh-ru gimp unzip unrar p7zip vlc pulseaudio pulseaudio-alsa alsa-utils links gnome-calculator neofetch ;;
-c) sudo pacman -S --needed git gcc python python2-pip python-pip jdk-openjdk geany ranger mc ;;
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
-vsc)
   sudo pacman -S --needed base-devel git
   cd /tmp
   git clone https://AUR.archlinux.org/visual-studio-code-bin.git
   cd visual-studio-code-bin/
   makepkg -si
   cd ../ && sudo rm -rfv visual-studio-code-bin/ ;;
-gui)
   sudo pacman -S --needed i3 i3-gaps i3status rofi feh scrot pacman-contrib arc-gtk-theme jq ttf-freefont ttf-linux-libertine ttf-hack ttf-font-awesome
   yaourt -S polybar yay numix-circle-arc-icons-git;;
-h)
   echo "-b   --Base installation"
   echo "-e   --Extra installation"
   echo "-c   --Dev. installation" 
   echo "-y   --AUR installation"
   echo "-vsc --VS Code instalation"
   echo "-gui --GUI installation" ;;
*) echo "--parametr ???" ;;
esac
shift
done

