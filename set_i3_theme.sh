theme=`grep purple_theme ~/.config/i3/config`


if [ -z "$theme" ]
then 
	D_MENU_SCHEME="-nb \'#04001A\' -sf \'#04001A\' -sb \'#8e5cff\' -nf \'#8e5cff\'"
	FOCUS="#04001a #04001A #8e5cff #8e5cff   #04001A"
	UNFOCUS="#522791 #8e5cff #04001A #04001A   #8e5cff"
	PROFILE="purple_theme"
	GIF="background.gif"
else
	D_MENU_SCHEME="-nb \'#04001A\' -sf \'#04001A\' -sb \'#F4800d\' -nf \'#F4800d\'"
   	 FOCUS="#04001a  #f4800d #040001a #F4800d   #f4800d"
	UNFOCUS="#1e1e1e #1e1e1e #F4800d #F4800d  #1e1e1e"
	PROFILE="halloween_theme"
	GIF="halloween.gif"
fi
sed -i "/dmenu_run/c\bindsym \$mod+d exec --no-startup-id dmenu_run $D_MENU_SCHEME" ~/.config/i3/config
sed -i "/client.focused\ /c\client.focused $FOCUS" ~/.config/i3/config
sed -i "/client.focused_active/c\client.focused_active $UNFOCUS" ~/.config/i3/config
sed -i "/client.unfocused/c\client.unfocused $UNFOCUS" ~/.config/i3/config
sed -i "/cool-retro/c\bindsym \$mod+Return exec /usr/bin/cool-retro-term --profile $PROFILE" ~/.config/i3/config
sed -i "/foo-Wallpaper-Feh-Gif/c\exec_always --no-startup-id ~/Fancy/foo-Wallpaper-Feh-Gif/back4.sh auto ~/Fancy/foo-Wallpaper-Feh-Gif/$GIF" ~/.config/i3/config 
i3-msg reload
notify-send --urgency=normal "Theme has been switched to $PROFILE!"
