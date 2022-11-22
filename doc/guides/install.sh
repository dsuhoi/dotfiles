#!/bin/bash

while [ -n "$1" ]
do
case "$1" in
-b) sudo pacman -S --needed vim rxvt-unicode alacritty pcmanfm compton htop dosfstools ntfs-3g ;;
-e) sudo pacman -S --needed net-tools firefox libreoffice-fresh libreoffice-fresh-ru gimp unzip unrar p7zip cmus pulseaudio pulseaudio-alsa alsa-utils gnome-calculator neofetch fzf bat zoxide udiskie;;
-c) sudo pacman -S --needed git gcc clang python python-pip ranger ;;
-y)
   sudo pacman -S --needed base-devel git
   cd /tmp
   git clone https://aur.archlinux.org/yay.git
   cd yay
   makepkg -si
   cd ..
   sudo rm -Rs yay/ ;;
-bh)
    curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh
    cp .bashrc ~/.bashrc ;;
-gui)
   sudo pacman -S --needed sway mako rofi wofi feh grim slurp wl-clipboard mutt pacman-contrib arc-gtk-theme jq ttf-freefont ttf-linux-libertine ttf-hack terminus-font ttf-font-awesome gsettings-desktop-schemas noto-fonts-emoji
   yay -S numix-circle-arc-icons-git ripgrep ;;
-pip)
    pip install virtualenv black flake8;;
-h)
   echo "-b   --Base installation"
   echo "-e   --Extra installation"
   echo "-c   --Dev. installation"
   echo "-y   --AUR installation"
   echo "-bh  --Bash installation"
   echo "-gui --GUI installation"
   echo "-pip --Python modules" ;;
*) echo "--parametr ???" ;;
esac
shift
done
