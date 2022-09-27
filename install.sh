#!/bin/bash
####################################
### Installing Snap on SteamDeck ###
####################################

# Back to home Dir
cd 

# Set password for deck 
passwd deck


# Unlocking SteamOS
sudo btrfs property set -ts / ro false

# Fixing broken keyrings
sudo pacman-key --init 
sudo pacman-key --populate archlinux

# Installing dependancies 
sudo pacman -Syu base-devel fakeroot apparmor go go-tools python-docutils glibc libseccomp xfsprogs libxcrypt libsm util-linux libcap systemd glib2 linux-api-headers

# Git clone snap
git clone https://aur.archlinux.org/snapd.git

# Installing Snap
cd snapd
makepkg -si

# Enable Snap and classic apps
sudo systemctl enable --now snapd.socket
sudo ln -s /var/lib/snapd/snap /snap
