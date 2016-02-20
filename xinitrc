export XIM=gcin
export XIM_PROGRAM=/usr/bin/gcin
export XIM_ARGS=
export XMODIFIERS=@im=gcin
export GTK_IM_MODULE=gcin
export QT_IM_MODULE=gcin
export QT4_IM_MODULE=gcin

# Pre-Settings
xmodmap ~/.Xmodmap
xrdb ~/.Xresources

# Start widgets
xcompmgr &
urxvt &
blueman-applet &
pavucontrol &
xscreensaver &
wicd-gtk &
vlc &


# xrandr workaroud for thunderbot2VGA hotplug
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync
xrandr --addmode DP1 1920x1080_60.00

xrandr --newmode "1280x720_60.00"   74.50  1280 1344 1472 1664  720 723 728 748 -hsync +vsync
xrandr --addmode DP1 1280x720_60.00

xrandr --newmode "1024x768_60.00"   63.50  1024 1072 1176 1328  768 771 775 798 -hsync +vsync
xrandr --addmode DP1 1024x768_60.00

# xrandr --output eDP1 --auto --output DP1 --mode 1920x1080_60.00 --left-of eDP1

# Start awesomewm
# exec awesome >> ~/.cache/awesome/awesome_stdout 2>> ~/.cache/awesome/awesome_stderr
exec i3 2>> ~/i3_stderr
