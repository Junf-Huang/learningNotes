#!/usr/bin/bash
#install general software
#ArchLinux

pacman -S intel-ucode
grub-mkconfig -o /boot/grub/grub.cfg
echo "----------update software----------";
pacman -Sy
echo "-----------start install desktop environment-----------";
pacman -S xorg-server gnome
echo "----------start installing----------";
pacman -S ntfs-3g yaourt sudo git unzip unrar zsh python jdk9-openjdk wget openssh tree networkmanager yay
echo "---------enable basic service------";
systemctl enable NetworkManager gdm.service

useradd -m -g users -G wheel -s /usr/bin/zsh junf -p junf

pacman -S fcitx-im fcitx-configtool
sudo pacman -S papirus-icon-theme adapta-gtk-theme

yay -S google-chrome wps-office ttf-wps-fonts fcitx-sogoupinyin


