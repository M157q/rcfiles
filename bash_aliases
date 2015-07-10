#My aliaes
# rm protect
alias rm='rm -i'

# some more ls aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

alias rscp='rsync -avPe ssh'

#some lazy aliases
alias ta='tmux attach -d'
alias sr='screen -rd'
alias g='grep'
alias v='vim'
alias vd='vimdiff'
alias s='ssh'
alias sc='screen'
alias a='alsamixer'
alias e='emacs -nw'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# git aliases
#alias gs='git status '
#alias ga='git add '
#alias gc='git commit '
#alias gd='git diff '
#alias go='git checkout '
#alias gl='git log '
#alias gp='git push '
#alias gP='git pull '
#alias gb='git branch '
#alias gr='git reset '
#alias gm='git merge '

#nmap
alias nmapo='sudo nmap -sS -P0 -sV -O -A'
alias nmapp='sudo nmap -sS -P0 -p1-65535 -sV -O'
alias nmapa='sudo nmap -A -T4'

# google in shell
function google () {
    tmp=`echo -n $@`
    w3m "www.google.com/search?hl=en&q=$tmp";
}

#plurk in shell
alias plurk='w3m http://www.plurk.com/m';
