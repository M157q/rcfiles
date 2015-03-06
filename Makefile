install:
	ln -sf $(HOME)/rcfiles/screenrc $(HOME)/.screenrc
	ln -sf $(HOME)/rcfiles/bashrc $(HOME)/.bashrc
	ln -sf $(HOME)/rcfiles/tcshrc $(HOME)/.tcshrc
	ln -sf $(HOME)/rcfiles/zshrc $(HOME)/.zshrc
	ln -sf $(HOME)/rcfiles/tmux.conf $(HOME)/.tmux.conf
	git clone https://github.com/gmarik/Vundle.vim $(HOME)/.vim/bundle/Vundle.vim
	ln -sf $(HOME)/rcfiles/vimrc $(HOME)/.vimrc
	vim +BundleInstall +qall
	#git clone git://github.com/amix/vimrc.git $(HOME)/.vim_runtime
	#sh $(HOME)/.vim_runtime/install_awesome_vimrc.sh

clean:
	rm $(HOME)/.screenrc
	rm $(HOME)/.bashrc
	rm $(HOME)/.zshrc
	rm $(HOME)/.vimrc
	rm $(HOME)/.tmux.conf
	rm -rf $(HOME)/.vim
	#rm -rf $(HOME)/.vim_runtime


