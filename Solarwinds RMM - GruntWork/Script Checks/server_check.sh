#!/bin/sh

RMMGWSERVER="$(fgrep gruntwork.server_address /usr/local/rmmagent/.agentcontext.cfg 2>/dev/null | cut -d = -f 2)"
GWSERVER="$(defaults read /Library/Mac-MSP/Gruntwork/whitelabel.plist server 2>/dev/null)"

if [ "$RMMGWSERVER" != "$GWSERVER" ]; then
	if [ -z "$RMMGWSERVER" ] ; then
		echo "No GW server specified in .agentcontext.cfg!"
	fi
	if [ -z "$GWSERVER" ] ; then
		echo "No GW server specified in whitelabel.plist!"
	fi
	exit 1
else
	if [ -z "$RMMGWSERVER" ] ; then
		echo "No GW server specified anywhere!"
		exit 1
	fi
	echo "GW server prefs set properly :)"
fi

exit 0