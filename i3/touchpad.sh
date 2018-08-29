#/bin/bash

touchpadId=`xinput list  | grep TouchPad | cut -d "=" -f 2 | cut -d "	" -f 1`

if [[ ! -z "$touchpadId" ]]
then
	tappingEnabledId=`xinput list-props $touchpadId | grep "Tapping Enabled (" | cut -d "(" -f 2 | cut -d ")" -f 1`
	naturalScrollingEnaledId=`xinput list-props $touchpadId | grep "Natural Scrolling Enabled (" | cut -d "(" -f 2 | cut -d ")" -f 1`
	xinput set-prop $touchpadId $tappingEnabledId 1
	xinput set-prop $touchpadId $naturalScrollingEnaledId 1
fi
