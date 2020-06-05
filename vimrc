"==============================================================================
"
" General Settings
"==============================================================================

if has('nvim')
    let s:editor_root=expand("~/.config/nvim")
    set rtp+=~/.config/nvim/bundle/Vundle.vim
else
    let s:editor_root=expand("~/.vim")
    set rtp+=~/.vim/bundle/Vundle.vim
endif

" Vim5 and later versions support syntax highlighting.
if has("syntax")
  syntax on
endif

" Display line numbers
set number

" Make backspace work like most other apps
set backspace=2

" Tab should be 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab

" Fold
set foldmethod=indent " Groups of lines with the same indent form a fold
set foldlevel=2       " Indent level higher than this will be folded

" UX
set hlsearch          " Highlight all match while searching
set matchpairs+=<:>   " Match <> pair

set showcmd           " Show (partial) command in status line.
set showmatch         " Show matching brackets.
set ignorecase        " Do case insensitive matching
set smartcase         " Do smart case matching
set incsearch         " Incremental search
set autowrite         " Automatically save before commands like :next and :make

" Multi-encoding setting
if has("multi_byte")
    set fileencodings=ucs-bom,utf-8,cp936,gb2312,big5,euc-jp,euc-kr,latin1
    set encoding=utf-8
    set termencoding=utf-8
    set fileencoding=utf-8
else
    echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif


"==============================================================================
" Color Settings
"==============================================================================

" set 256 colors
set t_Co=256

" Color Scheme
colo slate

" Highlight 80 character width
set colorcolumn=80
hi colorcolumn ctermbg=yellow

" Highlight tabs
highlight TAB ctermbg=blue
match TAB /\t/

" Highlight cursor column
set cursorcolumn
highlight CursorColumn ctermbg=blue

highlight TrailingWhitespace ctermbg=red guibg=red
match TrailingWhitespace /\s\+$/

"==============================================================================
" Custom Settings
"==============================================================================

" Dirty trick when you forgot use sudoedit, may have security issue.
cmap w!! w !sudo tee %

" Auto remove trailing spaces when saving the file.
fun! StripTrailingWhitespace()
    if &ft !~ 'markdown'
        %s/\s\+$//e
    endif
endfun
autocmd BufWritePre * call StripTrailingWhitespace()

set tabpagemax=100

"==============================================================================
" Vundle Settings for Plugins
"==============================================================================
 set nocompatible             " be iMproved
 filetype off                 " required!

 " Set the runtime path to include Vundle and initialize
 call vundle#rc(s:editor_root . '/bundle')

 call vundle#begin()

 " let Vundle manage Vundle
 Plugin 'gmarik/Vundle.vim'   " required!

 " Browsing
 Plugin 'scrooloose/nerdtree' " Project / Filetree
 map <F7> :NERDTreeToggle<CR>

 Plugin 'kien/ctrlp.vim'      " Buffer / File <c-p>

 Plugin 'majutsushi/tagbar'   " Code.
 map <F8> :TagbarToggle<CR>

 " Code Completion
 " Plugin 'Shougo/deoplete.nvim'
 Plugin 'roxma/nvim-yarp'
 Plugin 'roxma/vim-hug-neovim-rpc'
 let g:deoplete#enable_at_startup = 1

 Plugin 'scrooloose/nerdcommenter'  " Comment multi-lines. (<Leader>cc)

 " UltiSnips
 Plugin 'SirVer/ultisnips'
 Plugin 'honza/vim-snippets'
 let g:UltiSnipsEditSplit = "vertical"

 " Source Control Integration
 Plugin 'tpope/vim-fugitive'     " Git integration
 Plugin 'airblade/vim-gitgutter' " Show diff from last git commit

 " Vim Functionality
 Plugin 'matchit.zip'             " Improve % matching in Vim
 Plugin 'tpope/vim-surround'      " Made parenthesizing simple

 " Code Linter
 Plugin 'w0rp/ale'
 let g:ale_linters = {
 \   'python': ['pylint', 'flake8'],
 \}

 let g:ale_fixers = {
 \   '*': ['remove_trailing_lines', 'trim_whitespace'],
 \   'python': ['autopep8', 'yapf'],
 \}
 let g:ale_fix_on_save = 0
 let g:ale_completion_enabled = 1

 " Scheme
 Plugin 'bling/vim-airline'   " Status bar
 Plugin 'vim-airline/vim-airline-themes'   " Themes of vim-airline
 let g:airline_theme='kalisi'
 set laststatus=2             " Let airline appear all time.

 " Language
 " Plugin 'wilsaj/chuck.vim'    " Plugin for ChucK

 call vundle#end()            " required!
 filetype plugin indent on    " required!

 " To ignore plugin indent changes, instead use:
 " "filetype plugin on
 "
 " Brief help
 " :PluginList          - list configured bundles
 " :PluginInstall(!)    - install(update) bundles
 " :PluginSearch(!) foo - search(or refresh cache first) for foo
 " :PluginClean(!)      - confirm(or auto-approve) removal of unused bundles
 "
 " see :h vundle for more details or wiki for FAQ
 " NOTE: comments after Plugin command are not allowed..
