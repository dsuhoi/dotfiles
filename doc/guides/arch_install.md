# Installing Arch Linux

## Setting up a wifi network with LiveCD (without wifi menu)
### wpa_supplicant
Output of available network interfaces, view wifi networks and connect
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

## Disk partitioning and partitioning
Markup via `cfdisk`
- (+-50Mb) UEFI (EFI System) (for GPT) [/dev/efi]
- (300Mb) boot (Linux FS) (bootable flag for DOS) [/dev/boot]
- (1/2 of RAM) SWAP (Linux swap) [/dev/swap]
- (50Gb) root partition (Linux root/FS) [/dev/root]
- (other) LVM (Linux LVM/FS) [/dev/lvm]

Formating partitions
```sh
mkfs.fat -F32 </dev/efi>
mkfs.ext2 </dev/boot> -L boot
mkfs.ext4 </dev/root> -L root
mkswap </dev/swap> -L swap
```
Setting up a logical partitions
```sh
pvcreate </dev/lvm>
vgcreate <vg0> </dev/lvm>
lvcreate -l 100%FREE -n <home> <vg0>
```
Then we format the received partitions
```sh
mkfs.ext4 </dev/vg0/home>
```

## Mounting the system
```sh
swapon </dev/swap>
mount </dev/root> /mnt
mkdir /mnt/home /mnt/boot
mount </dev/boot> /mnt/boot
mount </dev/vg0/home> /mnt/home
```

## System installation
Before installation, it may be useful to specify a mirror in file `/etc/pacman.d/mirrorlist`
```sh
Server = https://mirror.yandex.ru/archlinux/$repo/os/$arch
```
Installing basic packages
```sh
pacstrap -i /mnt bas base-devel linux linux-firmware linux-headers lvm2 dhcpcd netctl dialog wget git vim nano grub efibootmgr wpa_supplicant
```
Creating a `fstab` file
```sh
genfstab -U -p /mnt >> /mnt/etc/fstab
```

## System setting
```sh
arch-chroot /mnt /bin/bash
```

### Locale setting
```sh
vim /etc/locale.gen
locale-gen
```

Add `lvm2` and `keymap` to  `/etc/mkinitcpio.conf` on line
```sh
HOOKS=( ... block lvm2 ... keyboard keymap fsck)
```
and create a boot RAM disk
```sh
mkinitcpio -p linux
```

### Grub installation
Mounting a partition with EFI
```sh
mkdir /boot/efi
mount </dev/efi> /boot/efi
```
Installing `grub`
```sh
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=grub
grub-mkconfig -o /boot/grub/grub.cfg
```
After setting up the password via `passwd`, we log out of root.

## Unmounting
```sh
umount /mnt/boot/efi
umount /mnt/boot
umount /mnt/home
umount /mnt
```

## Setting up the user's environment
### Setting the time, date and fonts
```sh
timedatectl set-ntp true
timedatectl set-timezone Europe/Moscow
localectl set-keymap ru
setfont cyr-sun16
```
### Setting up pacman
Uncomment additional repositories
```sh
#[multilib]
#Include = /etc/pacman.d/mirrorlist
```
### Setting up user
```sh
useradd -m -g users -G audio,lp,optical,power,scanner,storage,video,wheel -s /bin/bash <user_name>
passwd <user_name>
# chfn <user_name>
```
Uncomment this line in `/etc/sudoers`
```sh
# %wheel ALL=(ALL) ALL
```
