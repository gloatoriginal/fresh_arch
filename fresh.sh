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
        zsh-autosuggestions zsh-syntax-highlighting zsh \
        #nvidia-open-dkms \
        --noconfirm

sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone --depth 1 -- https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
sed -i 's/plugins=(git)/plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)/' ~/.zshrc


## Setup kexec updater
git clone https://github.com/gloatoriginal/arch_update \
        && chmod +x ./arch_update/bootstrap.sh \
        && ./arch_update/bootstrap.sh



systemctl enable hhd@gloat.service
