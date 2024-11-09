#!/bin/bash

install_essential_packages() {

sudo pacman -S --noconfirm --needed waybar \
	neovim \
	zsh \
	ttf-jetbrains-mono-nerd \
	ttf-profont-nerd \
	noto-fonts-cjk \
	noto-fonts-emoji \ 
	noto-fonts \
	hyprpaper \
	swaync \
	nemo \
	firefox \
	pavucontrol \
	git \
	base-devel \
	curl
}

remove_unnecessary_packages() {

	sudo pacman -R --noconfirm dunst
}


install_paru() {



	if [ ! -f $(which paru) ]; then
		
		echo "PARU IS NOT INSTALLED, INSTALLING..."
	
		if [ ! -d "paru" ]; then
			git clone https://aur.archlinux.org/paru.git
		else
			"REPO ALREADY CLONED, INSTALLING..."	
		fi

		cd paru && makepkg -si
		cd .. && rm -rf paru/

	fi

	echo "UPDADING PACKAGES..."
	paru --noconfirm -Syu
}


install_other_packages() {

	paru -Syu --noconfirm --needed google-chrome \
		nwg-look \
		codium \
		vlc \
		colorls
}


install_terminal_dependencies() {



	chsh -s $(which zsh)
 

	## install oh-my-zsh
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	##install zinit
	bash -c "$(curl --fail --show-error --silent --location https://raw.githubusercontent.com/zdharma-continuum/zinit/HEAD/scripts/install.sh)"

}


add_dotfiles_in_system() {

	
	if [ ! -f "$HOME/.zshrc" ]; then
		ln -s "$PWD/.zshrc" "$HOME"
	fi

	if [ ! -f "$HOME/.gitconfig" ]; then
		ln -s "$PWD/.gitconfig" "$HOME"
	fi

}


add_dotfiles_in_system
#remove_unnecessary_packages
#install_essential_packages
#install_paru
#install_other_packages
#install_terminal_dependencies
