theme_list=("velvet" "darkblood" "tokyonight")
theme_length=${#theme_list[@]}
rng=`(date +%s)`
rng=`expr $rng % $theme_length`
choice=${theme_list[$rng]}
notify-send "Oh-my-posh  has been changed to $choice"
sed -i "/oh-my-posh/c\eval \"\$(oh-my-posh init bash --config \'~/.config/ohmyposh/$choice.omp.json\')\"" ~/.bashrc
exec bash
