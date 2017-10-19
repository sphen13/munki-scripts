#!/bin/bash

extension_exists=`find ~/Library/Safari/Extensions -name 'OneLogin*' -maxdepth 1 2> /dev/null`
if [ "$extension_exists" ] ; then
	# nothing to do...
	exit 0
fi
osascript -e "tell application \"Safari\" to activate & open location \"https://safari-extensions.apple.com/details/?id=com.onelogin-2YX6A8Z383\"";
exit 0