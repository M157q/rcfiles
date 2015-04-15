install:
	ln -sf $(HOME)/rcfiles/screenrc $(HOME)/.screenrc
	ln -sf $(HOME)/rcfiles/bashrc $(HOME)/.bashrc
	ln -sf $(HOME)/rcfiles/tcshrc $(HOME)/.tcshrc
	ln -sf $(HOME)/rcfiles/zshrc $(HOME)/.zshrc
	ln -sf $(HOME)/rcfiles/tmux.conf $(HOME)/.tmux.conf
	# oh-my-zsh
	git clone https://github.com/robbyrussell/oh-my-zsh.git $(HOME)/.oh-my-zsh
	ln -sf $(HOME)/rcfiles/zshrc $(HOME)/.zshrc
	# oh-my-fish
	git clone https://github.com/bpinto/oh-my-fish.git $(HOME)/.oh-my-fish
	ln -sf $(HOME)/rcfiles/fishrc $(HOME)/.config/fish/config.fish
	# vim plugins
	git clone https://github.com/gmarik/Vundle.vim $(HOME)/.vim/bundle/Vundle.vim
	ln -sf $(HOME)/rcfiles/vimrc $(HOME)/.vimrc
	vim +BundleInstall +qall

clean:
	rm $(HOME)/.screenrc
	rm $(HOME)/.bashrc
	rm $(HOME)/.zshrc
	rm $(HOME)/.vimrc
	rm $(HOME)/.tmux.conf
	rm -rf $(HOME)/.oh-my-zsh
	rm -rf $(HOME)/.oh-my-fish
	rm -rf $(HOME)/.vim


