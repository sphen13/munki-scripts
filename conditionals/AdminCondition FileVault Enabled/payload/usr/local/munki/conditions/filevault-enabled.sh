#!/bin/bash
# This is a bash conditional script which outputs a key with a value of the current filevault enabled status

# Read the location of the ManagedInstallDir from ManagedInstall.plist
managedinstalldir="$(defaults read /Library/Preferences/ManagedInstalls ManagedInstallDir)"
# Make sure we're outputting our information to "ConditionalItems.plist" 
plist_loc="$managedinstalldir/ConditionalItems"

statusOn=`/usr/bin/fdesetup status | grep On`

if [ ! -z "$statusOn" ]; then
	defaults write "$plist_loc" "filevault_enabled" -bool true
else
	defaults write "$plist_loc" "filevault_enabled" -bool false
fi

# convert plist to xml
plutil -convert xml1 "$plist_loc".plist

exit 0