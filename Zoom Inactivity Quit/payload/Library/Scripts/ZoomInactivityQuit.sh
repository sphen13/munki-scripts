#!/bin/bash

#This script will monitor the computer for idle time over 15 minutes and auto logout the Guest user.

idl=$"`ioreg -c IOHIDSystem | awk '/HIDIdleTime/ {print int($NF/1000000000); exit}'`"
idletime="900"
isZoomRunning=`ps -ax | grep [z]oom.us`
zoomMeetingInProgress=`/usr/bin/pmset -g | grep displaysleep | grep zoom.us`

if [ ! -z "$isZoomRunning" ]; then
	# Zoom is running - lets see if a meeting is in progress
	if [ ! -z "$zoomMeetingInProgress" ]; then
		exit 0
	fi
	# Zoom in running and meeting is not in progress - check if idle
	if [ $idl -gt $idletime ]; then
		# idle too long, lets quit Zoom
		/usr/bin/osascript -e 'tell application "zoom.us" to quit saving no' > /dev/null 2>&1
	fi
fi