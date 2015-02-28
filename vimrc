"============== Vundle ===============
 set nocompatible               " be iMproved
 filetype off                   " required!

 " set the runtime path to include Vundle and initialize
 set rtp+=~/.vim/bundle/Vundle.vim
 call vundle#begin()

 " let Vundle manage Vundle
 " required! 
 Plugin 'gmarik/Vundle.vim'

 " My Plugins here:
 "
 " original repos on github
 "Plugin 'tpope/vim-fugitive'
 Plugin 'Lokaltog/vim-easymotion'
 "Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
 "Plugin 'tpope/vim-rails.git'
 Plugin 'scrooloose/nerdtree'
 "Plugin 'shawncplus/phpcomplete'   //broken
 Plugin 'xaizek/vim-inccomplete'
 
 " non github repos
 "Plugin 'git://git.wincent.com/command-t.git'


 " vim-scripts repos
 Plugin 'L9'
 Plugin 'FuzzyFinder'
 Plugin 'snipMate'
 Plugin 'AutoComplPop'
 Plugin 'fakeclip' 
 Plugin 'OmniCppComplete'
 Plugin 'matchit.zip'
 Plugin 'pythoncomplete'
 Plugin 'ctags.vim'
 Plugin 'phpcomplete.vim'
 Plugin 'cppcomplete'
 Plugin 'c.vim'

 call vundle#end()             " required!
 filetype plugin indent on     " required!
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


" All system-wide defaults are set in $VIMRUNTIME/debian.vim (usually just
" /usr/share/vim/vimcurrent/debian.vim) and sourced by the call to :runtime
" you can find below.  If you wish to change any of those settings, you should
" do it in this file (/etc/vim/vimrc), since debian.vim will be overwritten
" everytime an upgrade of the vim packages is performed.  It is recommended to
" make changes after sourcing debian.vim since it alters the value of the
" 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the
" following enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin on
" indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd        " Show (partial) command in status line.
"set showmatch      " Show matching brackets.
"set ignorecase     " Do case insensitive matching
"set smartcase      " Do smart case matching
"set incsearch      " Incremental search
"set autowrite      " Automatically save before commands like :next and :make
"set hidden             " Hide buffers when they are abandoned
"set mouse=a        " Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


" -- extend settings of vim --

" Insert tab or do autocomplete
" " http://vim.wikia.com/wiki/Autocomplete_with_TAB_when_typing_words
" function! Tab_Or_Complete()
"   if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"       return "\<C-N>"
"   else
"       return "\<Tab>"
"   endif
"endfunction
"inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
"set dictionary="/usr/dict/words"

" 開啟關鍵字上色功能
syntax on
" 顯示行號
set number

" 色彩配置方案
colo slate
" :colorscheme [色彩配置方案] 或是 colo [色彩配置方案]都可以
" 可以直接進到vim下達 :colo 再按tab，瀏覽各種不同的色彩配置方案

" 多重編碼解決的方案 (懶人包 = =)
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



"=========================================
" 用空白來當作tab
set expandtab
set tabstop=4
" 自動縮排為以四空格為基準
set shiftwidth=4

" 尋找時，符合字串會反白表示
set hlsearch

set matchpairs+=<:>

"set paste

" 換行分割線 (?)
set colorcolumn=80
hi ColorColumn ctermbg=darkblue

set t_Co=256

" some useful key mapping    by xatier



map <F7> :if exists("syntax_on") <BAR>
\ syntax off <BAR><CR>
\ else <BAR>
\ syntax enable <BAR>
\ endif <CR>

au BufNewFile,BufRead *.cpp map <F9> :!g++ -std=c++0x -g -Wall -Wextra -pedantic -Ofast % -lm -o %:r<CR>
au BufNewFile,BufRead *.c map <F9> :!gcc -std=c99 -Wall -Wextra -pedantic -Ofast % -lm -o %:r<CR>

"if &filetype == 'c'
"  map <F9> :!gcc -std=c99 -Wall -Wextra -pedantic -Ofast % -lm -o %:r<CR>
"elseif &filetype == 'cpp'
"  map <F9> :!g++ -std=c++0x -g -Wall -Wextra -pedantic -Ofast % -lm -o %:r<CR>
"endif

map <F8> :!./%:r<CR>

map <F5> :!./%<CR>

set cursorline                                                                  
hi CursorLine term=none cterm=none ctermbg=none ctermbg=none                    
au InsertEnter * hi CursorLine term=none cterm=underline                        
au InsertLeave * hi CursorLine term=none cterm=none ctermbg=none

"keymap for FussyFinder
nnoremap ff  :FufFile
nnoremap fb  :FufBuffer

cmap w!! w !sudo tee %
