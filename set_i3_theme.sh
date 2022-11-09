theme=`grep purple_theme ~/.config/i3/config`


if [ -z "$theme" ]
then 
	D_MENU_SCHEME="-nb \'#04001A\' -sf \'#04001A\' -sb \'#8e5cff\' -nf \'#8e5cff\'"
	FOCUS="#04001a #04001A #8e5cff #8e5cff   #04001A"
	UNFOCUS="#8e5cff #8e5cff #04001A #04001A   #8e5cff"
	PROFILE="purple_theme"
	GIF="background.gif"
	FWORKSPACE="#8e5cff #8e5cff #04001A"
	AWORKSPACE="#8e5cff #04001A #8e5cff"
	BACKGROUND="#04001A"
	STATUSLINE="#8e5cff"
else
	D_MENU_SCHEME="-nb \'#1e1e1e\' -sf \'#1e1e1e\' -sb \'#F4800d\' -nf \'#F4800d\'"
   	FOCUS="#1e1e1e  #f4800d #040001a #F4800d   #f4800d"
	UNFOCUS="#1e1e1e #1e1e1e #F4800d #F4800d  #1e1e1e"
	PROFILE="halloween_theme"
	GIF="background.gif"
	FWORKSPACE="#f4800d #f4800d #1e1e1e"
	AWORKSPACE="#f4800d #1e1e1e #f4800d"
	BACKGROUND="#1e1e1e"
	STATUSLINE="#f4800d"
fi
sed -i "/dmenu_run/c\bindsym \$mod+d exec --no-startup-id dmenu_run $D_MENU_SCHEME" ~/.config/i3/config
sed -i "/client.focused\ /c\client.focused $FOCUS" ~/.config/i3/config
sed -i "/client.focused_active/c\client.focused_active $UNFOCUS" ~/.config/i3/config
sed -i "/client.unfocused/c\client.unfocused $UNFOCUS" ~/.config/i3/config
sed -i "/cool-retro/c\bindsym \$mod+Return exec /usr/bin/cool-retro-term --profile $PROFILE" ~/.config/i3/config
sed -i "/foo-Wallpaper-Feh-Gif/c\exec_always --no-startup-id \"bash ~/Fancy/dotfiles/foo-Wallpaper-Feh-Gif/back4.sh auto ~/Fancy/dotfiles/foo-Wallpaper-Feh-Gif/$GIF \"" ~/.config/i3/config 
sed -i "/focused_workspace/c\        focused_workspace  $FWORKSPACE" ~/.config/i3/config
sed -i "/active_workspace/c\        active_workspace  $AWORKSPACE" ~/.config/i3/config
sed -i "/inactive_workspace/c\        inactive_workspace  $FWORKSPACE" ~/.config/i3/config
sed -i "/        background/c\        background $BACKGROUND" ~/.config/i3/config
sed -i "/statusline/c\        statusline $STATUSLINE" ~/.config/i3/config
i3-msg reload
notify-send --urgency=normal "Theme has been switched to $PROFILE!"