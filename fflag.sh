[ -z $2 ] && flag="qeuraCTF" || flag="$2"
[ -z $1 ] && dir="." || dir="$1"



printf "\e[31mrun fflag in \"$dir\" with \"$flag\" flag\e[0m\n"

find $dir -type "f" -print0 | xargs -0 grep -Ei $flag
