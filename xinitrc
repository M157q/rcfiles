export XIM=gcin
export XIM_PROGRAM=/usr/bin/gcin
export XIM_ARGS=
export XMODIFIERS=@im=gcin
export GTK_IM_MODULE=gcin
export QT_IM_MODULE=gcin
export QT4_IM_MODULE=gcin

xmodmap ~/.Xmodmap
xrdb ~/.Xresources
uxrvtd -q -o -f


batterymon &
guake &
gcin &
xcompmgr &
chromium &
pcmanx &
dropboxd &
xscreensaver &
gnome-settings-daemon &
gnome-sound-applet &

exec awesome >> ~/.cache/awesome_stdout 2>> ~/.cache/awesome_stderr
