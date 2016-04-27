rcfiles = '$(HOME)/dotfiles'
oh_my_zsh = 'https://github.com/robbyrussell/oh-my-zsh.git'
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
		mkdir -p $(HOME)/.i3; \
		ln -sf $(rcfiles)/i3config $(HOME)/.i3/config; \
	fi;

	ln -sf $(rcfiles)/screenrc $(HOME)/.screenrc
	ln -sf $(rcfiles)/bashrc $(HOME)/.bashrc
	ln -sf $(rcfiles)/bash_aliases $(HOME)/.bash_aliases
	ln -sf $(rcfiles)/tcshrc $(HOME)/.tcshrc
	ln -sf $(rcfiles)/tmux.conf $(HOME)/.tmux.conf

	# oh-my-zsh
	git clone $(oh_my_zsh) $(HOME)/.oh-my-zsh
	ln -sf $(rcfiles)/zshrc $(HOME)/.zshrc

	# vim plugins
	git clone $(vundle) $(HOME)/.vim/bundle/Vundle.vim
	ln -sf $(rcfiles)/vimrc $(HOME)/.vimrc
	vim +PluginInstall +qall

clean:
	rm -f $(HOME)/.screenrc
	rm -f $(HOME)/.bashrc
	rm -f $(HOME)/.bash_aliases
	rm -f $(HOME)/.tcshrc
	rm -f $(HOME)/.tmux.conf
	rm -f $(HOME)/.zshrc
	rm -rf $(HOME)/.oh-my-zsh
	rm -f $(HOME)/.vimrc
	rm -rf $(HOME)/.vim

update: clean install
