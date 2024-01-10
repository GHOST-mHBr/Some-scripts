#! /bin/bash

# pointer speed (floating point number from 0 to 1)
accel_value=0.4

# tap to click (1 -> enable or 0 -> diable)
tap_to_click_value=1

# natural scrolling (1 -> enable or 0 -> diable)
natural_scroll_value=1


# find out where the hell is the xinput binary
xinput_search_dirs="/usr/bin/xinput /bin/xinput"

# path to the binary xinput file
xinput_bin="null"

# searching for the xinput
for p in $xinput_search_dirs
do
	[[ -x "$p" ]] && xinput_bin="$p"
done

# DEBUG_LINE
# xinput_bin="null" 

# checking if the xinput does not found
if [ "$xinput_bin" = "null" ]
then
		echo -e "ERROR\ncan't find the xinput\nhave you installed it?"
		return
fi


tp_index="null"
tp_index=$("$xinput_bin" list | grep -i touchpad | grep -oP '(?<=id=)[0-9]+')

if [[ "$tp_index" = "null" ]]
then
		echo -e "ERROR\ncan't find the touchpad id:(\nyou can manully set it in the script file by setting the 'tp_index' variable's value"
		return
fi

natural_scroll_number=$("$xinput_bin" list-props $tp_index | grep -iPo "(?<=natural scrolling enabled )[\(\)0-9]+" | tr -d '()')

# DEBUG_LINE
# echo -e "$natural_scroll_number"


tap_to_click_number=$("$xinput_bin" list-props $tp_index | grep -iPo "(?<=tapping enabled )[\(\)0-9]+" | tr -d '()')

# DEBUG_LINE
# echo -e "$tap_to_click_number"


accel_number=$("$xinput_bin" list-props $tp_index | grep -iPo "(?<=Accel Speed )[\(\)0-9]+" | tr -d '()')


# DEBUG_LINE
# echo -e "$accel_number"


# setting values
$($xinput_bin set-prop $tp_index $accel_number $accel_value)
$($xinput_bin set-prop $tp_index $tap_to_click_number $tap_to_click_value)
$($xinput_bin set-prop $tp_index $natural_scroll_number $natural_scroll_value)



