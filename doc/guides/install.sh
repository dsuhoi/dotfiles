#!/bin/bash

while [ -n "$1" ]
do
case "$1" in
-b) sudo pacman -S --needed vim rxvt-unicode alacritty compton htop dosfstools net-tools pulseaudio pulseaudio-alsa alsa-utils;;
-e) sudo pacman -S --needed firefox libreoffice-fresh libreoffice-fresh-ru gimp cmus mutt  gnome-calculator polkit polkit-gnome ranger;;
-c) sudo pacman -S --needed git gcc clang python python-pip;;
-y)
   sudo pacman -S --needed base-devel git
   cd /tmp
   git clone https://aur.archlinux.org/yay-bin.git
   cd yay
   makepkg -si
   cd ..
   sudo rm -Rs yay/ ;;
-bh)
    curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh
    cp .bashrc ~/.bashrc ;;
-gui)
   sudo pacman -S --needed sway mako wofi grim slurp pacman-contrib arc-gtk-theme  gsettings-desktop-schemas
   yay -S numix-circle-arc-icons-git;;
-font) sudo pacman -S --needed ttf-freefont ttf-linux-libertine ttf-hack terminus-font ttf-font-awesome noto-fonts-emoji;;
-util)
    sudo pacman -S --needed unzip unrar p7zip ntfs-3g neofetch fzf bat jq zoxide prettier feh wl-clipboard udiskie pcmanfm
    yay -S ripgrep
    pip install virtualenv black flake8 isort;;
-h)
   echo "-b     --Base installation"
   echo "-e     --Extra installation"
   echo "-c     --Dev. installation"
   echo "-y     --AUR installation"
   echo "-bh    --Bash installation"
   echo "-gui   --GUI installation"
   echo "-font  --Font installation"
   echo "-util  --Utilities installation";;
*) echo "--parametr ???" ;;
esac
shift
done
