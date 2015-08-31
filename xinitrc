export XIM=gcin
export XIM_PROGRAM=/usr/bin/gcin
export XIM_ARGS=
export XMODIFIERS=@im=gcin
export GTK_IM_MODULE=gcin
export QT_IM_MODULE=gcin
export QT4_IM_MODULE=gcin

xmodmap ~/.Xmodmap
xrdb ~/.Xresources

xcompmgr &
guake &
blueman-applet &
pavucontrol &
xscreensaver &

exec awesome >> ~/.cache/awesome/awesome_stdout 2>> ~/.cache/awesome/awesome_stderr
