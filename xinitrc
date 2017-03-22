export XIM=gcin
export XIM_PROGRAM=/usr/bin/gcin
export XIM_ARGS=
export XMODIFIERS=@im=gcin
export GTK_IM_MODULE=gcin
export QT_IM_MODULE=gcin
export QT4_IM_MODULE=gcin

# Swap CapsLock and Ctrl
setxkbmap -option ctrl:swapcaps -option caps:capslock

# Custom settings for urxvt
xrdb ~/.Xresources

batterymon &
xcompmgr &

exec awesome >> ~/.cache/awesome/awesome_stdout 2>> ~/.cache/awesome/awesome_stderr
