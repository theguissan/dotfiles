#!/bin/bash

#/home/m/.local/share/JetBrains/Toolbox/scripts
#/home/m/.local/share/JetBrains/Toolbox/apps/intellij-idea-ultimate/bin
##BAIXANDO DEPENDENCIAS##
#sudo apt install zsh
#chsh -s $(which zsh)

#sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
#bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

#curl -sS https://starship.rs/install.sh | sh
sudo apt install unzip \
	neofetch \
	rofi \
	cava \
	fonts-noto-color-emoji \
	cava \
	alacritty \
	brightnessctl

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/3270.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/FiraCode.zip
wget https://github.com/ryanosis/nerd-fonts/releases/download/v3.1.1/ProFont.zip
#sudo mv 3270.zip CascadiaCode.zip /usr/local/share/fonts
sudo unzip 3270.zip -d /usr/local/share/fonts
sudo unzip CascadiaCode.zip -d /usr/local/share/fonts
sudo unzip FiraCode.zip -d /usr/local/share/fonts
sudo unzip ProFont.zip -d /usr/local/share/fonts

rm FiraCode.zip CascadiaCode.zip 3270.zip ProFont.zip
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
##GIT##


rm ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig


#ZSH#

sudo rm ~/.zshrc
ln -s ~/dotfiles/.zshrc ~/.zshrc

##ALACRITTY##

rm ~/.config/alacritty/alacritty.yml
ln -s ~/dotfiles/alacritty.yml ~/.config/alacritty/alacritty.yml

##NEOFETCH##

rm ~/.config/neofetch/config.conf
ln -s ~/dotfiles/config.conf ~/.config/neofetch/config.conf

#STARSTHIP

rm ~/.config/starship.toml
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml

##i3##

rm ~/.config/i3/config
ln -s ~/dotfiles/config ~/.config/i3/config

##i3blocks##

rm ~/.i3blocks.conf
ln -s ~/dotfiles/.i3blocks.conf ~/.i3blocks.conf


##power-menu##
sudo ln -s ~/dotfiles/rofi-power-menu /usr/bin/rofi-power-menu

##picom##

sudo ln ~/dotfiles/picom.conf ~/.config/picom.conf

##dunst##
sudo ln -s ~/dotfiles/dunstrc ~/.config/dunst/dunstrc

##rofi theme##

mkdir -p ~/.local/share/rofi/{themes,}

sudo ln -s ~/dotfiles/squared-everforest.rasi ~/.local/share/rofi/themes/squared-everforest.rasi
