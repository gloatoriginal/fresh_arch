#!/bin/bash

## Get me paru and some AUR STAT
sudo pacman -S --needed base-devel
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
git clone https://aur.archlinux.org/paru.git
cd paru && makepkg -si

cd ~
## Install necessities
paru -S variety solaar \
        flatpak flatseal \
        steam hhd heroic-games-launcher-bin \
        visual-studio-code-bin dbeaver git \
        linux-lts linux-lts-headers \
        linux-rt linux-rt-headers \
        kexec-tools cronie \
        virt-manager moonlight-qt-bin youtube-music-bin stremio \
        filelight discover partitionmanager \
        #nvidia-open-dkms \
        --noconfirm


## Setup kexec updater
git clone https://github.com/gloatoriginal/arch_update \
        && chmod +x ./arch_update/bootstrap.sh \
        && ./arch_update/bootstrap.sh


systemctl enable hhd@gloat.service
