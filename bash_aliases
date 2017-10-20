# Google in shell
function google () {
    tmp=`echo -n $@`
    w3m "www.google.com/search?hl=en&q=$tmp";
}

# Proxy
hp_proxy='http://web-proxy.sgp.hp.com:8080'

hp_proxy_on() {
    export http_proxy=$hp_proxy
    export https_proxy=$hp_proxy
    export ftp_proxy=$hp_proxy
    export rsync_proxy=$hp_proxy
}

hp_proxy_off() {
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

# https://github.com/nvbn/thefuck
if [[ -x `which thefuck` ]]; then
    eval "$(thefuck --alias)"
fi

# Weather in terminal
function weather ()
{
    curl -H "Accept-Language: ${LANG%_*}" wttr.in/"${1:-Taipei}?${2:-0q}"
}
