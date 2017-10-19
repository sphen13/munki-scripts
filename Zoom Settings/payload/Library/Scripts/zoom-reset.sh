#!/bin/bash

isZoomRunning=`ps -ax | grep [z]oom.us`

#echo "zoom-reset is being run..." >> /var/log/zoom-reset.log

if [ -z "$isZoomRunning" ]; then
	echo "purging zoom settings..." >> /var/log/zoom-reset.log
	rm -rf /Users/source/Library/Application\ Support/zoom.us/data/*
	cp /Library/Application\ Support/zoom.us/data/zoomus.db /Users/source/Library/Application\ Support/zoom.us/data/
fi

exit 0