# Docker
# https://twitter.com/kakashiliu/status/778647927468154880
alias docker_remove_unused_containers="docker ps -aqf status=exited | xargs --no-run-if-empty docker rm"
alias docker_remove_unused_images="docker images -aqf dangling=true | xargs --no-run-if-empty docker rmi"

# rm protect
alias rm='rm -i'

# Some more ls aliases
alias ll='ls -AlF'
alias la='ls -A'
alias l='ls -CF'

alias rscp='rsync -avPe ssh'

# Some lazy aliases
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
# alias gs='git status '
# alias ga='git add '
# alias gc='git commit '
# alias gd='git diff '
# alias go='git checkout '
# alias gl='git log '
# alias gp='git push '
# alias gP='git pull '
# alias gb='git branch '
# alias gr='git reset '
# alias gm='git merge '

# Nmap
alias nmapo='sudo nmap -sS -P0 -sV -O -A'
alias nmapp='sudo nmap -sS -P0 -p1-65535 -sV -O'
alias nmapa='sudo nmap -A -T4'

# Google in shell
function google () {
    tmp=`echo -n $@`
    w3m "www.google.com/search?hl=en&q=$tmp";
}

# Plurk in shell
alias plurk='w3m http://www.plurk.com/m';

# Proxy
hp_proxy='http://web-proxy.sgp.hp.com:8080'

proxy_on() {
    export http_proxy=$hp_proxy
    export https_proxy=$hp_proxy
    export ftp_proxy=$hp_proxy
    export rsync_proxy=$hp_proxy
}

proxy_off() {
    unset http_proxy
    unset https_proxy
    unset ftp_proxy
    unset rsync_proxy
}

proxy_list() {
    env | grep -i proxy
}

# execute screenfetch if it has been installed
if [[ -x `which screenfetch` ]]; then
    screenfetch
fi

# For Ruby gem
export PATH="$HOME/.gem/ruby/2.3.0/bin:$PATH";
