#!/bin/bash

source="/home/"$USER"/.config/neomatt/art"
height=`tput cols`
height=`expr $height / 2`
max_height=30
center=on

config_file=$source/config
if test -f "$config_file"; then
  chmod -x "$config_file"
  . "$config_file"
fi

draw_chafa() {
	image=$1
    _height=$(( $height < $max_height ? $height : $max_height ))
    chafa --center $center --color-extractor median -s $_height $source/$image
}

display_center(){
    line=$1
    columns="$(tput cols)"
    printf "$(tput setaf $2)%*s\n" $(( (${#line} + columns) / 2)) "$line"
}

draw_ascii() {
    art=$1
    width=$(tput cols)

    valid_colors=(1 3 4 5 6 8)
    num_valid_colors=${#valid_colors[@]}
    chosen_color=$(($RANDOM % $num_valid_colors))
    color=${valid_colors[$chosen_color]}

    IFS='' # Not remove spaces
    while read line; do
      display_center $line $color
    done < $source/$art
}

files=(`ls $source`)
files_size=${#files[@]}
selection=$(($RANDOM % $files_size))
selected_file=${files[$selection]}

if [[ "$selected_file" == *".txt" ]]; then
    draw_ascii $selected_file
else
    draw_chafa $selected_file
fi

