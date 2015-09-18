rcfiles = '$(HOME)/rcfiles'
oh_my_zsh = 'https://github.com/robbyrussell/oh-my-zsh.git'
oh_my_fish = 'https://github.com/bpinto/oh-my-fish.git'
oh_my_fish_config_dir = '$(HOME)/.config/fish'
vundle = 'https://github.com/gmarik/Vundle.vim'
kernel = '$(shell uname -s)'

install:
	# For Linux X Window
	if [ $(kernel) == 'Linux' ]; then \
		ln -sf $(rcfiles)/xinitrc $(HOME)/.xinitrc; \
		ln -sf $(rcfiles)/Xresources $(HOME)/.Xresources; \
		ln -sf $(rcfiles)/Xmodmap $(HOME)/.Xmodmap; \
		ln -sf $(rcfiles)/fonts.conf $(HOME)/.fonts.conf; \
		mkdir -p $(HOME)/.config/awesome; \
		ln -sf $(rcfiles)/rc.lua $(HOME)/.config/awesome/rc.lua; \
	fi;

	ln -sf $(rcfiles)/screenrc $(HOME)/.screenrc
	ln -sf $(rcfiles)/bashrc $(HOME)/.bashrc
	ln -sf $(rcfiles)/bash_aliases $(HOME)/.bash_aliases
	ln -sf $(rcfiles)/tcshrc $(HOME)/.tcshrc
	ln -sf $(rcfiles)/tmux.conf $(HOME)/.tmux.conf

	# oh-my-zsh
	git clone $(oh_my_zsh) $(HOME)/.oh-my-zsh
	ln -sf $(rcfiles)/zshrc $(HOME)/.zshrc

	# oh-my-fish
	git clone $(oh_my_fish) $(HOME)/.oh-my-fish
	if [ ! -d $(oh_my_fish_config_dir) ]; then \
		mkdir -p $(oh_my_fish_config_dir); \
	fi;
	ln -sf $(rcfiles)/fishrc $(oh_my_fish_config_dir)/config.fish

	# vim plugins
	git clone $(vundle) $(HOME)/.vim/bundle/Vundle.vim
	ln -sf $(rcfiles)/vimrc $(HOME)/.vimrc
	vim +BundleInstall +qall

clean:
	rm -f $(HOME)/.screenrc
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.bash_aliases
	rm -f $(HOME)/.tcshrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.zshrc
	rm -rf $(HOME)/.oh-my-zsh
	rm -f $(oh_my_fish_config_dir)/config.fish
	rm -rf $(HOME)/.oh-my-fish
	rm -f $(HOME)/.vimrc
	rm -rf $(HOME)/.vim

update: clean install
