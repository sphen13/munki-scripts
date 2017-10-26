#!/bin/bash

# trigger programmatic removal of RMM
/usr/local/rmmagent/uninstall.tool
rm -rf /rmmagentoldlogs
 
# trigger programmatic removal of gruntwork
/Library/Mac-MSP/Gruntwork/gruntWorker.sh selfdestruct

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

# ensure gruntwork is really unloaded & clean up
launchctl remove com.mac-msp.gruntwork.munkitamer
launchctl remove com.mac-msp.gruntwork.chief
launchctl remove com.mac-msp.gruntwork.background
rm -rf /Library/Mac-MSP/Gruntwork

# forget the pkg receipts
pkgutil --forget com.mac-msp.gruntwork
pkgutil --forget com.mac-msp.gruntwork.munkihelpers
pkgutil --forget com.rmm.advancedMonitoringAgent.AdvancedMonitoringAgent.pkg
pkgutil --forget com.rmm.advancedMonitoringAgent.rmmagent.pkg
pkgutil --forget killmunkigwrmm
pkgutil --forget com.trmacs.TRMSPRemoval

# remove traces of ourself
rm -f /Library/LaunchDaemons/RMM_GW_killer.plist
rm -f /Library/Scripts/RMM_GW_killer.sh
launchctl remove RMM_GW_killer

exit 0