#!/bin/bash

##BAIXANDO DEPENDENCIAS##

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/3270.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
sudo mv 3270.zip CascadiaCode.zip /usr/local/share/fonts
sudo unzip /usr/local/share/fonts/3270.zip
sudo unzip /usr/local/share/fonts/CascadiaCode.zip
sudo apt install fonts-noto-color-emoji
##GIT##

rm ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig

##POLYBAR##

sudo rm /etc/polybar/config.ini
sudo ln -s ~/dotfiles/config.ini /etc/polybar/config.ini

##ALACRITTY##

rm ~/.config/alacritty/alacritty/alacritty.toml
ln -s ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

##i3##

rm ~/.config/i3/config
ln -s ~/dotfiles/config ~/.config/i3/config

##NEOFETCH##

rm ~/.config/neofetch/config.conf
ln -s ~/dotfiles/config.conf ~/.config/neofetch/config.conf
