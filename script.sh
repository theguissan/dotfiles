#!/bin/bash

##BAIXANDO DEPENDENCIAS##
sudo apt install zsh
chsh -s $(which zsh)

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

curl -sS https://starship.rs/install.sh | sh
sudo apt install polybar
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/3270.zip
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/CascadiaCode.zip
#sudo mv 3270.zip CascadiaCode.zip /usr/local/share/fonts
sudo unzip 3270.zip -d /usr/local/share/fonts
sudo unzip CascadiaCode.zip -d /usr/local/share/fonts
sudo apt install fonts-noto-color-emoji
sudo apt install cava
##GIT##


rm ~/.gitconfig
ln -s ~/dotfiles/.gitconfig ~/.gitconfig


#ZSH#

sudo rm ~/.zshrc
cp ~/dotfiles/.zshrc ~/.zshrc

##POLYBAR##

sudo rm /etc/polybar/config.ini
sudo ln -s ~/dotfiles/config.ini /etc/polybar/config.ini

##ALACRITTY##

rm ~/.config/alacritty/alacritty.toml
ln -s ~/dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml

##i3##

rm ~/.config/i3/config
ln -s ~/dotfiles/config ~/.config/i3/config

##NEOFETCH##

rm ~/.config/neofetch/config.conf
ln -s ~/dotfiles/config.conf ~/.config/neofetch/config.conf
