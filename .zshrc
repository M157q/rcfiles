# The following lines were added by compinstall
zstyle :compinstall filename '/home/gh40402/.zshrc'

#To enable autocompletion
autoload -Uz compinit 
compinit

#enable prompt theme
autoload -Uz promptinit
promptinit

# This will set the default prompt to the walters theme
prompt adam2 white red yellow green

#For colors
autoload -U colors && colors

#For autocompletion with an arrow-key driven interface
zstyle ':completion:*' menu select

#For autocompletion of command line switches for aliases
setopt completealiases

#zle vi-mode
bindkey -v

#only past commands beginning with the current input would have been shown.
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# some more ls aliases                                                             
 alias ll='ls -alF'                                                                 
 alias la='ls -A'                                                                   
 alias l='ls -CF'

#some lazy aliases
alias ta='tmux attach'
alias sr='screen -rd'
alias g='grep'
alias v='vim'
alias vd='vimdiff'
alias s='ssh'
alias sc='screen'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# git aliases
alias gs='git status '
alias ga='git add '
alias gc='git commit'
alias gd='git diff'
alias go='git checkout '
alias gl='git log '
alias gp='git push '
alias gP='git pull '

# locale
export LANG=zh_TW.UTF-8
export LC_ALL=zh_TW.UTF-8

#prompt
#PROMPT="%{$fg[red]%}%n%{$reset_color%}@%{$fg[blue]%}%m %{$fg_no_bold[yellow]%}%1~ %{$reset_color%}%#"
#RPROMPT="[%{$fg_no_bold[yellow]%}%?%{$reset_color%}]"

#nmap
alias nmapo='sudo nmap -sS -P0 -sV -O -A'                                       
alias nmapp='sudo nmap -sS -P0 -p1-65535 -sV -O'                                
alias nmapa='sudo nmap -A -T4'
#alias nmaps='sudo nmap -S 127.0.0.1 -Pn -sn -f'
