#!/bin/bash

## Get me paru and some AUR STAT
sudo pacman -S --needed base-devel
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si

cd ~
## Install necessities
paru -S variety solaar \ ##Background & Logitech
        flatpak flatseal \ ## Flatpak shtuff
        steam hhd heroic-games-launcher-bin \ ##Gaming stuff
        visual-studio-code-bin dbeaver git \ ## Development stuff
        linux-lts linux-lts-headers \ ## LTS
        linux-rt linux-rt-headers \ ## RT
        kexec-tools cronie \ ## Scheduling & Reboots
        virt-manager moonlight-qt-bin youtube-music-bin stremio \
        filelight discover partitionmanager \ ## OS Tools
        #nvidia-open-dkms \
        --noconfirm


## Setup kexec updater
git clone https://github.com/gloatoriginal/arch_update \
        && chmod +x ./arch_update/bootstrap.sh \
        && ./arch_update/bootstrap.sh


systemctl enable hhd@gloat.service
