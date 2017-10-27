#!/bin/bash

isSet=`defaults read /Library/Mac-MSP/Gruntwork/settings preferwmgroups 2>/dev/null`

if [ "$isSet" != "1" ]; then
	echo "Set preferwmgroups true"
	defaults write /Library/Mac-MSP/Gruntwork/settings preferwmgroups -bool true
	exit 0
fi

echo "Good"
exit 0