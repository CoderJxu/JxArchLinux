#!/bin/bash
DISK="/dev/$1"
echo DISK="$DISK"
 
# BIOS/MBR layout
# -s : slience
parted -s "$DISK" mklabel msdos
parted -s -a optimal "$DISK"
# /boot (100MiB), / (20Gib), swap (4GiB) 剩下的给 /home
parted -s "$DISK" mkpart primary ext4 1024K 100M
parted -s "$DISK" set 1 boot on
parted -s "$DISK" mkpart primary ext4 100M 20G
parted -s "$DISK" mkpart primary linux-swap 20G 24G
parted -s "$DISK" mkpart primary ext4 24G 100%
parted -l
 
PBOOT="${DISK}1"
PROOT="${DISK}2"
PSWAP="${DISK}3"
PHOME="${DISK}4"
mkfs.ext4 -F "$PBOOT"
mkfs.ext4 -F "$PROOT"
mkswap "$PSWAP"
swapon "$PSWAP"
mkfs.ext4 -F "$PHOME"