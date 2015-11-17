#!/bin/bash

cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup
sed -i 's/^#Server/Server/' /etc/pacman.d/mirrorlist.backup
rankmirrors -tv -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist
