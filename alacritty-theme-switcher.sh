theme_list=("omni" "tokyo-night" "tokyo-night-storm" "deep")
theme_length=${#theme_list[@]}
rng=`(date +%s)`
rng=`expr $rng % $theme_length`
choice=${theme_list[$rng]}
notify-send "Theme has been changed to $choice"
sed -i "/colors:\ /c\colors: *$choice" ~/.config/alacritty/alacritty.yml
