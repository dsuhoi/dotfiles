# Установка Arch Linux

## Настройка wifi сети при LiveCD (без wifi-menu)
### wpa_supplicant
Вывод доступных сетевых интерфейсов, просмотр wifi сетей и подключение
```sh
ip link set <wlan0> up # or ifconfig <wlan0> up
iw dev <wlan0> scan
wpa_passphrase <ssid> <password> > wpa_supplicant.conf
wpa_supplicant -B -i <wlan0> -c wpa_supplicant.conf
dhcpcd <wlan0>
```
### iwctl
```sh
iwctl
[iwd]$ device list
[iwd]$ iwctl --passphrase <password> station <wlan0> connect <ssid>
```

## Разметка диска и создание разделов
Разметка через `cfdisk`
- (+-50Mb) на UEFI (EFI System) (для GPT) [/dev/efi]
- (300Mb) на boot (Linux FS) (bootable flag для DOS) [/dev/boot]
- (1/2 от RAM) на SWAP (Linux swap) [/dev/swap]
- (50Gb) на корневой раздел (Linux root/FS) [/dev/root]
- (остальное) на LVM (Linux LVM/FS) [/dev/lvm]

Форматирование разделов
```sh
mkfs.fat -F32 </dev/efi>
mkfs.ext2 </dev/boot> -L boot
mkfs.ext4 </dev/root> -L root
mkswap </dev/swap> -L swap
```
Настройка логический разделов
```sh
pvcreate </dev/lvm>
vgcreate <vg0> </dev/lvm>
lvcreate -l 100%FREE -n <home> <vg0>
```
Потом форматируем полученные разделы
```sh
mkfs.ext4 </dev/vg0/home>
```

## Монтирование системы
```sh
swapon </dev/swap>
mount </dev/root> /mnt
mkdir /mnt/home /mnt/boot
mount </dev/boot> /mnt/boot
mount </dev/vg0/home> /mnt/home
```

## Установка системы
Перед установкой может быть полезно указать зеркало в файле `/etc/pacman.d/mirrorlist`
```sh
Server = https://mirror.yandex.ru/archlinux/$repo/os/$arch
```
Установка основных пакетов
```sh
pacstrap -i /mnt bas base-devel linux linux-firmware linux-headers lvm2 dhcpcd netctl dialog wget git vim nano grub efibootmgr wpa_supplicant
```
Создание `fstab` файла
```sh
genfstab -U -p /mnt >> /mnt/etc/fstab
```

## Настройка системы
```sh
arch-chroot /mnt /bin/bash
```

### Настройка локали
```sh
vim /etc/locale.gen
locale-gen
```

Добавить `lvm2` и `keymap` в  `/etc/mkinitcpio.conf` на строке
```sh
HOOKS=( ... block lvm2 ... keyboard keymap fsck)
```
и создать загрузочный RAM диск
```sh
mkinitcpio -p linux
```

### Установка grub
Монтирование раздела с EFI
```sh
mkdir /boot/efi
mount </dev/efi> /boot/efi
```
Установка `grub`
```sh
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```
После настройки пароля через `passwd` выходим из root.

## Размонтирование
```sh
umount /mnt/boot/efi
umount /mnt/boot
umount /mnt/home
umount /mnt
```

## Настройка окружения пользователя
### Настройка времени, даты и шрифтов
```sh
timedatectl set-ntp true
timedatectl set-timezone Europe/Moscow
localectl set-keymap ru
setfont cyr-sun16
```
### Настройка pacman
Раскомментировать доп. репозитории
```sh
#[multilib]
#Include = /etc/pacman.d/mirrorlist
```
### Настройка пользователя
```sh
useradd -m -g users -G audio,lp,optical,power,scanner,storage,video,wheel -s /bin/bash <user_name>
passwd <user_name>
# chfn <user_name>
```
В `/etc/sudoers` раскомментировать строку
```sh
# %wheel ALL=(ALL) ALL
```
