"============== Vundle ===============
 set nocompatible               " be iMproved
 filetype off                   " required!

 " set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 " let Vundle manage Vundle
 " required!
 Plugin 'gmarik/Vundle.vim'

 " Browsing
 Plugin 'scrooloose/nerdtree' " Project / Filetree
 map <C-t> :NERDTreeToggle<CR>

 Plugin 'kien/ctrlp.vim'      " Buffer / File (C-p)

 Plugin 'majutsushi/tagbar'   " Code. (:TagbarToggle)
 map <C-y> :TagbarToggle<CR>

 " Writing Code
 Plugin 'Valloric/YouCompleteMe'    " Compelte Engine
 let g:ycm_key_list_select_completion = ['<Down>', '<C-N>']
 " avoid tab conflict to UltiSnips

 Plugin 'scrooloose/nerdcommenter'  " Comment multi-lines. (<Leader>cc)

 " UltiSnips
 Plugin 'SirVer/ultisnips'
 Plugin 'honza/vim-snippets'
 let g:UltiSnipsEditSplit = "vertical"

 " Source Control Integration
 Plugin 'tpope/vim-fugitive'  " Git

 " Vim Functionality
 Plugin 'matchit.zip'         " Improve % matching in Vim
 Plugin 'tpope/vim-surround'  " Made parenthesizing simple
 Plugin 'scrooloose/syntastic'" Syntax checker
 set statusline+=%#warningmsg#
 set statusline+=%{SyntasticStatuslineFlag()}
 set statusline+=%*
 let g:syntastic_always_populate_loc_list = 1
 let g:syntastic_auto_loc_list = 1
 let g:syntastic_check_on_open = 1
 let g:syntastic_check_on_wq = 0

 " Scheme
 Plugin 'bling/vim-airline'   " Status bar
 Plugin 'freeo/vim-kalisi'
 let g:airline_theme='kalisi'
 Plugin 'altercation/vim-colors-solarized' " Color scheme


 call vundle#end()            " required!
 filetype plugin indent on    " required!
 "
 " Brief help
 " :PluginList          - list configured bundles
 " :PluginInstall(!)    - install(update) bundles
 " :PluginSearch(!) foo - search(or refresh cache first) for foo
 " :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Plugin command are not allowed..
"============================================================================

" Color Scheme
" vim-kalisi
 colorscheme kalisi
 set background=dark

" vim-colors-solarized
"syntax enable
"set background=dark
"colorscheme solarized

" colo slate
" :colorscheme [色彩配置方案] 或是 colo [色彩配置方案]都可以
" 可以直接進到vim下達 :colo 再按tab，瀏覽各種不同的色彩配置方案


" === Custom by me ===
cmap w!! w !sudo tee %

" auto remove trailing spaces when saving the file.
fun! StripTrailingWhitespace()
    %s/\s\+$//e

    "Add two spaces before each end of line for markdown
    if &ft =~ 'markdown'
        %s/$/  /e
    endif
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Highlight trailing spaces
hi EOL ctermbg=blue
match EOL /\s\+$/

set colorcolumn=80
hi colorcolumn ctermbg=red
set t_co=256


set number
set backspace=2

set expandtab
set tabstop=4
set shiftwidth=4

set hlsearch
set matchpairs+=<:>


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd        " Show (partial) command in status line.
set showmatch      " Show matching brackets.
set ignorecase     " Do case insensitive matching
set smartcase      " Do smart case matching
set incsearch      " Incremental search
set autowrite      " Automatically save before commands like :next and :make
"set hidden         " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" multi-encoding setting
if has("multi_byte")
"set bomb
set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latin1
" CJK environment detection and corresponding setting
if v:lang =~ "^zh_CN"
" Use cp936 to support GBK, euc-cn == gb2312
set encoding=cp936
set termencoding=cp936
set fileencoding=cp936
elseif v:lang =~ "^zh_TW"
" cp950, big5 or euc-tw
" Are they equal to each other?
set encoding=big5
set termencoding=big5
set fileencoding=big5
elseif v:lang =~ "^ko"
" Copied from someone's dotfile, untested
set encoding=euc-kr
set termencoding=euc-kr
set fileencoding=euc-kr
elseif v:lang =~ "^ja_JP"
" Copied from someone's dotfile, untested
set encoding=euc-jp
set termencoding=euc-jp
set fileencoding=euc-jp
endif
" Detect UTF-8 locale, and replace CJK setting if needed
if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
endif
else
echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif
