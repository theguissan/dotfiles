#!/bin/bash

install_essential_packages() {

sudo pacman -S --noconfirm --needed waybar \
	neovim \
	zsh \
	ttf-jetbrains-mono-nerd \
	ttf-profont-nerd \
	hyprpaper \
	swaync \
	nemo \
	firefox \
	pavucontrol \
	git \
	base-devel \
	curl \
	lazygit \
        noto-fonts-cjk \
	noto-fonts \
	noto-fonts-emoji 
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
		vscodium-bin \
		vlc \
		lscolors-git \
		catppuccin-cursors-mocha \
		catppuccin-gtk-theme-mocha \
		tmux \
		wlogout \
		swaylock
}


install_terminal_dependencies() {

	# Install oh-my-zsh.
	0>/dev/null sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	ZSH_CUSTOM="$HOME/.oh-my-zsh/custom"
	export ZSH_CUSTOM
	# Configure plugins.
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM}"/plugins/zsh-syntax-highlighting
	git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM}"/plugins/zsh-autosuggestions
	git clone https://github.com/zsh-users/zsh-history-substring-search "${ZSH_CUSTOM}"/plugins/zsh-history-substring-search
	sed -i 's/^plugins=.*/plugins=(git\n extract\n jsontools\n colored-man-pages\n zsh-autosuggestions\n zsh-syntax-highlighting\n zsh-history-substring-search)/g' ~/.zshrc
	# Enable nvm plugin feature to automatically read `.nvmrc` to toggle node version.
	sed -i "1s/^/zstyle ':omz:plugins:nvm' autoload yes\n/" ~/.zshrc
	# Install powerlevel10k and configure it.
	git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM}"/themes/powerlevel10k
	sed -i 's/^ZSH_THEME=.*/ZSH_THEME="powerlevel10k\/powerlevel10k"/g' ~/.zshrc
	# Move ".zcompdump-*" file to "$ZSH/cache" directory.
	sed -i -e '/source \$ZSH\/oh-my-zsh.sh/i export ZSH_COMPDUMP=\$ZSH\/cache\/.zcompdump-\$HOST' ~/.zshrc
	echo 'alias ls="colorls --sd"' >> ~/.zshrc
	# Configure the default ZSH configuration for new users.
	sudo cp ~/.zshrc /etc/skel/
	sudo cp ~/.p10k.zsh /etc/skel/
	sudo cp -r ~/.oh-my-zsh /etc/skel/
	sudo chmod -R 755 /etc/skel/
	sudo chown -R root:root /etc/skel/ 
}


add_dotfiles_in_system() {

	if [ ! -f "$HOME/.gitconfig" ]; then
		ln -s "$PWD/.gitconfig" "$HOME"
	fi	

}


apply_hyprland_customizations() {


	if [ -e "$HOME/.config/hypr/hyprland.conf" ]; then
		rm "$HOME/.config/hypr/hyprland.conf"
	fi 
	ln -s "$PWD/hypr/hyprland.conf"  "$HOME/.config/hypr"

	if [ -d "$HOME/.config/kitty" ]; then
		rm -rf "$HOME/.config/kitty"
	fi
	ln -s "$PWD/kitty" "$HOME/.config"

	if [ -e "$HOME/.config/hypr/hyprpaper.conf" ]; then
		rm "$HOME/.config/hypr/hyprpaper.conf"
	fi

	ln -s "$PWD/hypr/hyprpaper.conf" "$HOME/.config/hypr"


	if [ -d "$HOME/.config/waybar" ]; then
		rm -rf "$HOME/.config/waybar"
	fi
	ln -s "$PWD/waybar" "$HOME/.config"

	if [ -d "$HOME/.config/hypr/wofi" ]; then
		rm -rf "$HOME/.config/hypr/wofi"
	fi

	ln -s "$PWD/hypr/wofi" "$HOME/.config/hypr"

}


#add_dotfiles_in_system
#remove_unnecessary_packages
#install_essential_packages
#install_paru
install_other_packages
#add_dotfiles_in_system
#apply_hyprland_customizations
install_terminal_dependencies
