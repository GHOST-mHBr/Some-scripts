#!/bin/bash

[ -z "$2" ] && flag="queraCTF" || flag="$2"
[ -z "$1" ] && echo -e "\e[31mInvalid argument\e[0m" && exit -1 || (printf "\e[32mstart working on $1\e[0m\n" && wget -r -nv -np -k -nd -nc -P wget_down "$1")

printf "\n\n\e[32m======================\nWget done\e[0m\n"


[ -d ./wget_down ] && fflag ./wget_down $flag
