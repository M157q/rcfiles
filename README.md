# dotfiles  
Just a bunch of my dotfiles.  
  
## Requirements  
  
+ `make`  
    + Arch Linux  
        + `sudo pacman -S base-devel`  
    + Debian / Ubuntu  
        + `sudo apt-get install build-essential`  
  
## Usage  
Make sure you have git installed and the network connection is fine.  
  
### Install  
1. `git clone https://github.com/M157q/dotfiles.git`  
2. `cd dotfiles`  
3. `make install`  
  
### Update  
1. `cd` into `dotfiles` dir.  
2. `git pull`  
3. `make update`  
  
### Uninstall  
1. `cd` into `dotfiles` dir.  
2. `make clean`  
3. `rm -rf` `dotfiles` dir.  
