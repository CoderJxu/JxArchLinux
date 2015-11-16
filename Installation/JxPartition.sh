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
