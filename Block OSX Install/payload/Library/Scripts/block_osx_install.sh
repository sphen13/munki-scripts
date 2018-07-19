#!/bin/bash

#loggedinuser=`stat -f%Su /dev/console`

killall InstallAssistant
rm -rf "/Applications/Install macOS Mojave Beta.app"
rm -rf "/Applications/Install macOS Mojave.app"
#sudo -u "$loggedinuser" osascript -e 'tell app "System Events" to display alert "Upgrading your Operating System without approval violates our policy"'
