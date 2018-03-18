dotfiles = '$(PWD)'
oh_my_zsh = 'https://github.com/robbyrussell/oh-my-zsh.git'
oh_my_fish = 'https://github.com/oh-my-fish/oh-my-fish'
oh_my_fish_dir = '$(HOME)/.local/share/omf'
oh_my_fish_config = '$(HOME)/.config/fish/conf.d/omf.fish'
vundle = 'https://github.com/gmarik/Vundle.vim'
kernel = '$(shell uname -s)'

install:
	# For Linux X Window
	if [ $(kernel) == 'Linux' ]; then \
		ln -sf $(dotfiles)/xinitrc $(HOME)/.xinitrc; \
		ln -sf $(dotfiles)/Xresources $(HOME)/.Xresources; \
		ln -sf $(dotfiles)/Xmodmap $(HOME)/.Xmodmap; \
		ln -sf $(dotfiles)/fonts.conf $(HOME)/.fonts.conf; \
		mkdir -p $(HOME)/.config/awesome; \
		ln -sf $(dotfiles)/rc.lua $(HOME)/.config/awesome/rc.lua; \
		mkdir -p $(HOME)/.i3; \
		ln -sf $(dotfiles)/i3config $(HOME)/.i3/config; \
	fi;

	ln -sf $(dotfiles)/screenrc $(HOME)/.screenrc
	ln -sf $(dotfiles)/shrc $(HOME)/.shrc
	ln -sf $(dotfiles)/bashrc $(HOME)/.bashrc
	ln -sf $(dotfiles)/bash_aliases $(HOME)/.bash_aliases
	ln -sf $(dotfiles)/tcshrc $(HOME)/.tcshrc
	ln -sf $(dotfiles)/tmux.conf $(HOME)/.tmux.conf
	ln -sf $(dotfiles)/gitignore $(HOME)/.gitignore
	ln -sf $(dotfiles)/gitconfig $(HOME)/.gitconfig

	# oh-my-zsh
	git clone $(oh_my_zsh) $(HOME)/.oh-my-zsh
	ln -sf $(dotfiles)/zshrc $(HOME)/.zshrc

	# oh-my-fish
	git clone $(oh_my_fish) $(HOME)/.oh-my-fish
	$(HOME)/.oh-my-fish/bin/install --offline --noninteractive
	rm -rf $(HOME)/.oh-my-fish
	ln -sf $(dotfiles)/fishrc $(HOME)/.config/fish/conf.d/omf.fish

	# vim plugins
	pip3 install neovim # For deoplete.nvim dependency
	git clone $(vundle) $(HOME)/.vim/bundle/Vundle.vim
	ln -sf $(dotfiles)/vimrc $(HOME)/.vimrc
	vim +PluginInstall +qall

clean:
	# For Linux X Window
	if [ $(kernel) == 'Linux' ]; then \
		rm -f $(HOME)/.xinitrc; \
		rm -f $(HOME)/.Xresources; \
		rm -f $(HOME)/.Xmodmap; \
		rm -f $(HOME)/.fonts.conf; \
		rm -f $(HOME)/.config/awesome/rc.lua; \
		rm -f $(HOME)/.i3/config; \
	fi;

	rm -f $(HOME)/.screenrc
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.bash_aliases
	rm -f $(HOME)/.tcshrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.gitignore
	rm -f $(HOME)/.gitconfig
	rm -f $(HOME)/.zshrc
	rm -rf $(HOME)/.oh-my-zsh
	rm -rf $(HOME)/.oh-my-fish
	rm -rf $(oh_my_fish_dir)
	rm -rf $(oh_my_fish_config)
	rm -f $(HOME)/.vimrc
	rm -rf $(HOME)/.vim

update: clean install

# https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/
gen-github-ssh-key:
	ssh-keygen -t rsa -b 4096 -C "m157q.tw@gmail.com" && eval `ssh-agent -s` && ssh-add ~/.ssh/id_rsa && cat ~/.ssh/id_rsa.pub
