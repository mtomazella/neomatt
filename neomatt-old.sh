#!/bin/bash

arts=("/home/tomazella/.config/neomatt/art.txt" "/home/tomazella/.config/neomatt/art/sangue.txt" "/home/tomazella/.config/neomatt/art/morte.txt")
colors=(6 196 245)
# arts=(
#   "/home/tomazella/.config/neomatt/art/four-new.txt"
#   "/home/tomazella/.config/neomatt/art/one.txt"
#   "/home/tomazella/.config/neomatt/art/two.txt"
#   "/home/tomazella/.config/neomatt/art/three.txt"
#   "/home/tomazella/.config/neomatt/art/four-new.txt"
#   "/home/tomazella/.config/neomatt/art/five.txt"
#   "/home/tomazella/.config/neomatt/art/ten.txt"
#   )

maximum=3
selection=$(($RANDOM % $maximum))
art=${arts[$selection]}
color=${colors[$selection]}
# color=6

width=$(tput cols)

display_center(){
  	line=$1
    columns="$(tput cols)"
    printf "$(tput setaf $2)%*s\n" $(( (${#line} + columns) / 2)) "$line"
}

IFS='' # Not remove spaces
while read line; do
  display_center $line $color
done < $art

