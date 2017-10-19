#!/bin/bash

isZoomRunning=`ps -ax | grep [z]oom.us`

if [ -z "$isZoomRunning" ]; then
	rm -rf /Users/source/Library/Application\ Support/zoom.us/data/*
	cp /Library/Application\ Support/zoom.us/data/zoomus.db /Users/source/Library/Application\ Support/zoom.us/data/
fi

exit 0