#!/bin/sh

if ! updates_arch=$(checkupdates 2> /dev/null | wc -l ); then
    updates_arch=0
fi

if ! updates_aur=$(yay -Qum 2> /dev/null | wc -l); then
# if ! updates_aur=$(cower -u 2> /dev/null | wc -l); then
# if ! updates_aur=$(trizen -Su --aur --quiet | wc -l); then
# if ! updates_aur=$(pikaur -Qua 2> /dev/null | wc -l); then
# if ! updates_aur=$(rua upgrade --printonly 2> /dev/null | wc -l); then
    updates_aur=0
fi

updates=$(("$updates_arch" + "$updates_aur"))

if [ "$updates" -gt 0 ]; then
    echo %{u#1e88e5}"P:$updates_arch Y:$updates_aur"
else
    echo %{u#CACACA}"P:0 Y:0"
fi
