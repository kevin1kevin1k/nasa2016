#!/usr/bin/env bash
# NASA 2016
# SA 2.1
# By B03902086

parted /dev/sda -s mklabel gpt
parted -a optimal /dev/sda -s mkpart primary 0% 200GiB
mkfs -t vfat -F 32 /dev/sda1
parted -a optimal /dev/sdb -s mkpart primary $((200*1024+1))MiB 100%
parted /dev/sda -s set 2 lvm on
pvcreate /dev/sda2 /dev/sdb
vgcreate nasavg /dev/sda2 /dev/sdb
lvcreate -L 300GiB -n home_student nasavg
mkfs -t ext4 /dev/nasavg/home_student
lvcreate -n home_ta -l 100%FREE nasavg
mkfs -t ext4 /dev/nasavg/home_ta
