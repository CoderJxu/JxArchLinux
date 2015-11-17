#!/bin/bash

# Jxu @ 2015-11-16

sgdisk --clear \
-a 4096
-n 1:0:+2M            -t 1:ef02 -c 1:"BIOS boot"  \
-n 2:0:+300M          -t 2:8300 -c 2:"Linux boot" \
-n 3:0:+50G           -t 3:8300 -c 3:"Linux root" \
-n 4:0:+24G           -t 4:8300 -c 4:"Linux var"  \
-n 5:0:+${swapspace}M -t 5:8200 -c 5:"Linux swap" \
-n 6:0:0              -t 6:8300 -c 6:"Linux home" \
--print /dev/sda

read -e -sn 1 -p "Press enter to continue..."
  
mkswap /dev/sda5
swapon /dev/sda5

read -e -sn 1 -p "Press enter to continue..."

mkfs.ext4 /dev/sda2
mkfs.ext4 /dev/sda3
mkfs.ext4 /dev/sda4
mkfs.ext4 /dev/sda6

read -e -sn 1 -p "Press enter to continue..."

mount /dev/sda3 /mnt

mkdir -p /mnt/boot
mount /dev/sda2 /mnt/boot

mkdir -p /mnt/var
mount /dev/sda4 /mnt/var

mkdir -p /mnt/home
mount /dev/sda6 /mnt/home
