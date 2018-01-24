#!/bin/bash

# remove munki
launchctl unload /Library/LaunchDaemons/com.googlecode.munki.*

rm -rf "/Applications/Utilities/Managed Software Update.app"
rm -rf "/Applications/Managed Software Center.app"

rm -f /Library/LaunchDaemons/com.googlecode.munki.*
rm -f /Library/LaunchAgents/com.googlecode.munki.*
rm -rf "/Library/Managed Installs"
rm -f /Library/Preferences/ManagedInstalls.plist
rm -rf /usr/local/munki
rm /etc/paths.d/munki

pkgutil --forget com.googlecode.munki.admin
pkgutil --forget com.googlecode.munki.app
pkgutil --forget com.googlecode.munki.core
pkgutil --forget com.googlecode.munki.launchd
pkgutil --forget com.github.munkireport

# forget the pkg receipts
pkgutil --forget com.github.munki.pkg.KillMunki

# remove traces of ourself
rm -f /Library/LaunchDaemons/Kill_Munki.plist
rm -f /Library/Scripts/Kill_Munki.sh
launchctl remove Kill_Munki

exit 0
