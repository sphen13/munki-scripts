#!/bin/bash

# if we are running less than 10.12.6 and have not already run previously, fix permissions on /tmp and purge sus cache

majorVer=`sw_vers -productVersion | cut -d'.' -f2`
minorVer=`sw_vers -productVersion | cut -d'.' -f3`

if [ "$majorVer" -eq 12 ]; then
	if [ "$minorVer" -lt 6 ]; then
		if [ ! -e /Library/Managed\ Installs/.swupd_reset ]; then
			# fix perms
			rm -f /private/tmp/.gw*
			chmod 1777 /private/tmp

			# purge sus cache
			rm -rf /Library/Updates/*
			rm -rf /Library/Managed\ Installs/swupd/*

			# plant file so we dont run again
			touch /Library/Managed\ Installs/.swupd_reset
			echo "Reset SUS"
			exit 0
		fi
	fi
fi

echo "NO ACTION - SUS"
exit 0