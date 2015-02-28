install:
	ln -sf ~/rcfiles/screenrc ~/.screenrc
	ln -sf ~/rcfiles/bashrc ~/.bashrc
	ln -sf ~/rcfiles/zshrc ~/.zshrc
	ln -sf ~/rcfiles/tmux.conf ~/.tmux.conf
	git clone https://github.com/gmarik/Vundle.vim ~/.vim/bundle/Vundle.vim
	ln -sf ~/rcfiles/vimrc ~/.vimrc
	vim +BundleInstall +qall
	#git clone git://github.com/amix/vimrc.git ~/.vim_runtime
	#sh ~/.vim_runtime/install_awesome_vimrc.sh

clean:
	rm ~/.screenrc
	rm ~/.bashrc
	rm ~/.zshrc
	rm ~/.vimrc
	rm ~/.tmux.conf
	rm -rf ~/.vim
	#rm -rf ~/.vim_runtime


